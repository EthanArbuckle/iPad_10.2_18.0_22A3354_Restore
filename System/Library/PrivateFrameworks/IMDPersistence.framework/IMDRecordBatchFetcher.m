@implementation IMDRecordBatchFetcher

- (IMDRecordBatchFetcher)init
{
  IMDRecordBatchFetcher *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDRecordBatchFetcher;
  result = -[IMDRecordBatchFetcher init](&v3, sel_init);
  if (result)
  {
    result->_batchSize = 16;
    result->_lastRowID = -1;
  }
  return result;
}

- (void)dealloc
{
  id *fastEnumerationBuffer;
  objc_super v4;

  fastEnumerationBuffer = self->_fastEnumerationBuffer;
  if (fastEnumerationBuffer)
  {
    free(fastEnumerationBuffer);
    self->_fastEnumerationBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMDRecordBatchFetcher;
  -[IMDRecordBatchFetcher dealloc](&v4, sel_dealloc);
}

- (id)nextBatch
{
  return -[IMDRecordBatchFetcher nextBatchWithSize:](self, "nextBatchWithSize:", -[IMDRecordBatchFetcher batchSize](self, "batchSize"));
}

- (id)nextBatchWithSize:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not implemented"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)fastEnumerationBuffer count:(unint64_t)fastEnumerationBufferSize
{
  size_t v9;
  unint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *fastEnumerationLastBatch;
  NSArray *v14;
  id *v15;
  id **p_fastEnumerationBuffer;
  id *v17;

  if (a3->var0 == 2)
    return 0;
  if (!a3->var0)
  {
    a3->var2 = a3->var3;
    a3->var0 = 1;
  }
  v9 = -[IMDRecordBatchFetcher batchSize](self, "batchSize");
  if (v9 > fastEnumerationBufferSize)
  {
    fastEnumerationBuffer = self->_fastEnumerationBuffer;
    if (fastEnumerationBuffer)
    {
      fastEnumerationBufferSize = self->_fastEnumerationBufferSize;
    }
    else
    {
      v10 = v9;
      fastEnumerationBuffer = (id *)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      self->_fastEnumerationBuffer = fastEnumerationBuffer;
      self->_fastEnumerationBufferSize = v10;
      fastEnumerationBufferSize = v10;
    }
  }
  a3->var1 = fastEnumerationBuffer;
  v11 = (void *)MEMORY[0x1AF435474]();
  -[IMDRecordBatchFetcher nextBatchWithSize:](self, "nextBatchWithSize:", fastEnumerationBufferSize);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  fastEnumerationLastBatch = self->_fastEnumerationLastBatch;
  self->_fastEnumerationLastBatch = v12;

  if (-[NSArray count](self->_fastEnumerationLastBatch, "count") < fastEnumerationBufferSize)
    fastEnumerationBufferSize = -[NSArray count](self->_fastEnumerationLastBatch, "count");
  -[NSArray count](self->_fastEnumerationLastBatch, "count");
  if (fastEnumerationBufferSize)
  {
    -[NSArray getObjects:range:](self->_fastEnumerationLastBatch, "getObjects:range:", a3->var1, 0, fastEnumerationBufferSize);
  }
  else
  {
    a3->var0 = 2;
    v14 = self->_fastEnumerationLastBatch;
    self->_fastEnumerationLastBatch = 0;

    v17 = self->_fastEnumerationBuffer;
    p_fastEnumerationBuffer = &self->_fastEnumerationBuffer;
    v15 = v17;
    if (v17)
    {
      free(v15);
      *p_fastEnumerationBuffer = 0;
      p_fastEnumerationBuffer[1] = 0;
    }
  }
  objc_autoreleasePoolPop(v11);
  return fastEnumerationBufferSize;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (int64_t)lastRowID
{
  return self->_lastRowID;
}

- (void)setLastRowID:(int64_t)a3
{
  self->_lastRowID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_fastEnumerationLastBatch, 0);
}

@end
