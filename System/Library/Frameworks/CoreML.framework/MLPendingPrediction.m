@implementation MLPendingPrediction

- (MLPendingPrediction)initWithPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  MLPendingPrediction *v9;
  MLPendingPrediction *v10;
  void *v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLPendingPrediction;
  v9 = -[MLPendingPrediction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictionRequest, a3);
    v11 = _Block_copy(v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = v11;

  }
  return v10;
}

- (MLPredictionRequest)predictionRequest
{
  return self->_predictionRequest;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_predictionRequest, 0);
}

@end
