@implementation MLBatchedTensorsHolder

- (MLBatchedTensorsHolder)initWithBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4
{
  id v7;
  MLBatchedTensorsHolder *v8;
  MLBatchedTensorsHolder *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLBatchedTensorsHolder;
  v8 = -[MLBatchedTensorsHolder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_batchedTensors, a3);
    v9->_numberOfTensors = a4;
  }

  return v9;
}

- (NSDictionary)batchedTensors
{
  return self->_batchedTensors;
}

- (unint64_t)numberOfTensors
{
  return self->_numberOfTensors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchedTensors, 0);
}

@end
