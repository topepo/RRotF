% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RRotF.R
\name{RRotF}
\alias{RRotF}
\title{Fit a Random Rotation Forest.}
\usage{
RRotF(x, y, K = round(ncol(x)/3, 0), L = 10, mtry = floor(sqrt(ncol(x))),
  model = "log", ...)
}
\arguments{
\item{x}{Training data input matrix.}

\item{y}{Training data response.}

\item{K}{The number of variable subsets. The default is the value K that results in three features per subset.}

\item{L}{The number of base classfiers.}

\item{mtry}{Number of variables randomly sampled as candidates at each split.}

\item{model}{Specifies the base learner model: 'rpart' for ordinary classification trees; 'rf' for
randomised trees; 'ridge', 'pls', 'log', 'svm' or 'rnd' for randomised trees using oblique splits with the corresponding model.}

\item{...}{Additional arguments specified to \code{randomForest}, \code{rpart} or \code{obliqueRF}.}
}
\value{
A fitted model object of type 'RRotF', which is a list containing base learner fits and PCA loadings.
}
\description{
Fit a Random Rotation Forest using randomised trees with orthogonal or oblique splits as base learners.
}
\examples{
library(ElemStatLearn)
library(caret)
data("SAheart")
trainIndex <- createDataPartition(SAheart$chd, p=0.6, list=FALSE)
train <- SAheart[trainIndex,]
test <- SAheart[-trainIndex,]
Xtrain <- train[,-10]
ytrain <- train[,10]
Xtest <- test[,-10]
ytest <- test[,10]
mod <- RRotF(Xtrain, ytrain, model="log")
preds <- predict(mod, Xtest)
error <- mean(preds != ytest)
error
}
\author{
Arnu Pretorius: \email{arnupretorius@gmail.com}
}
\references{
Rodriguez, J.J., Kuncheva, L.I., 2006. Rotation forest: A new classifier ensemble method. IEEE Trans. Pattern Anal. Mach. Intell. 28, 1619-1630. doi:10.1109/TPAMI.2006.211
}
\seealso{
\code{\link{predict.RRotF}}
}

