@implementation MLIndexedBatchProvider

- (MLIndexedBatchProvider)initWithBatch:(id)a3 indices:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLIndexedBatchProvider *v10;
  MLIndexedBatchProvider *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLIndexedBatchProvider;
  v10 = -[MLIndexedBatchProvider init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fullBatch, a3);
    objc_storeStrong((id *)&v11->_indices, a4);
  }

  return v11;
}

- (int64_t)count
{
  return -[NSArray count](self->_indices, "count");
}

- (id)featuresAtIndex:(int64_t)a3
{
  MLBatchProvider *fullBatch;
  void *v4;
  void *v5;

  fullBatch = self->_fullBatch;
  -[NSArray objectAtIndexedSubscript:](self->_indices, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLBatchProvider featuresAtIndex:](fullBatch, "featuresAtIndex:", objc_msgSend(v4, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MLBatchProvider)fullBatch
{
  return self->_fullBatch;
}

- (void)setFullBatch:(id)a3
{
  objc_storeStrong((id *)&self->_fullBatch, a3);
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
  objc_storeStrong((id *)&self->_indices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_fullBatch, 0);
}

@end
