@implementation _MLBatchDataSource

- (_MLBatchDataSource)initWithMLBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _MLBatchDataSource *v12;
  _MLBatchDataSource *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLBatchDataSource;
  v12 = -[_MLBatchDataSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_batchProvider, a3);
    objc_storeStrong((id *)&v13->_nnEngine, a5);
    v13->_useForPrediction = a4;
  }

  return v13;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  _MLDataSource *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _MLDataSource *v12;
  void *v13;

  v7 = [_MLDataSource alloc];
  -[_MLBatchDataSource batchProvider](self, "batchProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featuresAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_MLBatchDataSource useForPrediction](self, "useForPrediction");
  -[_MLBatchDataSource nnEngine](self, "nnEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_MLDataSource initWithMLFeatureProvider:forPrediction:neuralNetworkEngine:error:](v7, "initWithMLFeatureProvider:forPrediction:neuralNetworkEngine:error:", v9, v10, v11, a4);

  if (v12)
  {
    -[_MLDataSource dataPointAtIndex:error:](v12, "dataPointAtIndex:error:", a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)numberOfDataPoints
{
  void *v2;
  unint64_t v3;

  -[_MLBatchDataSource batchProvider](self, "batchProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (MLBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (MLNeuralNetworkEngine)nnEngine
{
  return self->_nnEngine;
}

- (BOOL)useForPrediction
{
  return self->_useForPrediction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nnEngine, 0);
  objc_storeStrong((id *)&self->_batchProvider, 0);
}

@end
