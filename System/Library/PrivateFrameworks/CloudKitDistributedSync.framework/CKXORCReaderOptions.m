@implementation CKXORCReaderOptions

- (CKXORCReaderOptions)init
{
  return (CKXORCReaderOptions *)MEMORY[0x1E0DE7D20](self, sel_initWithBatchSize_, 200);
}

- (CKXORCReaderOptions)initWithBatchSize:(unint64_t)a3
{
  CKXORCReaderOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKXORCReaderOptions;
  result = -[CKXORCReaderOptions init](&v5, sel_init);
  if (result)
    result->_batchSize = a3;
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSString)testExceptionDuringLoadBatch
{
  return self->_testExceptionDuringLoadBatch;
}

- (void)setTestExceptionDuringLoadBatch:(id)a3
{
  objc_storeStrong((id *)&self->_testExceptionDuringLoadBatch, a3);
}

- (unint64_t)testExceptionDuringLoadBatchLoadsToSkip
{
  return self->_testExceptionDuringLoadBatchLoadsToSkip;
}

- (void)setTestExceptionDuringLoadBatchLoadsToSkip:(unint64_t)a3
{
  self->_testExceptionDuringLoadBatchLoadsToSkip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testExceptionDuringLoadBatch, 0);
}

@end
