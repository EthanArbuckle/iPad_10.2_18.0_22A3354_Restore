@implementation MLStreamingInputDataSource

- (MLStreamingInputDataSource)initWithBatchSize:(unint64_t)a3
{
  MLStreamingInputDataSource *v4;
  MLStreamingInputDataSource *v5;
  uint64_t v6;
  NSMutableArray *dataSources;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLStreamingInputDataSource;
  v4 = -[MLStreamingInputDataSource init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_batchSize = a3;
    v6 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    dataSources = v5->_dataSources;
    v5->_dataSources = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)appendBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4
{
  MLBatchedTensorsHolder *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = -[MLBatchedTensorsHolder initWithBatchedTensors:numberOfTensors:]([MLBatchedTensorsHolder alloc], "initWithBatchedTensors:numberOfTensors:", v8, a4);
  -[MLStreamingInputDataSource dataSources](self, "dataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[MLStreamingInputDataSource dataSources](self, "dataSources", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "batchedTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfBatches
{
  void *v2;
  unint64_t v3;

  -[MLStreamingInputDataSource dataSources](self, "dataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[MLStreamingInputDataSource dataSources](self, "dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfTensors");

  return v6;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end
