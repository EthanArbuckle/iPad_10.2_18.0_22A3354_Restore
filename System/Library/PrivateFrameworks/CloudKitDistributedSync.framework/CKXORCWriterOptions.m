@implementation CKXORCWriterOptions

- (CKXORCWriterOptions)init
{
  return (CKXORCWriterOptions *)MEMORY[0x1E0DE7D20](self, sel_initWithBatchSize_, 200);
}

- (CKXORCWriterOptions)initWithBatchSize:(unint64_t)a3
{
  CKXORCWriterOptions *result;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKXORCWriterOptions;
  result = -[CKXORCWriterOptions init](&v6, sel_init);
  if (result)
  {
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    result->_batchSize = v5;
    result->_batchCommitMarginPercentage = 1.0;
    *(_OWORD *)&result->_batchResizeIncrement = xmmword_1D4BDD750;
    *(_OWORD *)&result->_compressionKind = xmmword_1D4BDD760;
  }
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

- (double)batchCommitMarginPercentage
{
  return self->_batchCommitMarginPercentage;
}

- (void)setBatchCommitMarginPercentage:(double)a3
{
  self->_batchCommitMarginPercentage = a3;
}

- (unint64_t)batchResizeIncrement
{
  return self->_batchResizeIncrement;
}

- (void)setBatchResizeIncrement:(unint64_t)a3
{
  self->_batchResizeIncrement = a3;
}

- (unint64_t)compressionBlockSize
{
  return self->_compressionBlockSize;
}

- (void)setCompressionBlockSize:(unint64_t)a3
{
  self->_compressionBlockSize = a3;
}

- (int64_t)compressionKind
{
  return self->_compressionKind;
}

- (void)setCompressionKind:(int64_t)a3
{
  self->_compressionKind = a3;
}

- (unint64_t)stripeSize
{
  return self->_stripeSize;
}

- (void)setStripeSize:(unint64_t)a3
{
  self->_stripeSize = a3;
}

- (BOOL)testRowsInterspersedWithNulls
{
  return self->_testRowsInterspersedWithNulls;
}

- (void)setTestRowsInterspersedWithNulls:(BOOL)a3
{
  self->_testRowsInterspersedWithNulls = a3;
}

- (NSString)testExceptionDuringCommitBatch
{
  return self->_testExceptionDuringCommitBatch;
}

- (void)setTestExceptionDuringCommitBatch:(id)a3
{
  objc_storeStrong((id *)&self->_testExceptionDuringCommitBatch, a3);
}

- (unint64_t)testExceptionDuringCommitBatchCommitsToSkip
{
  return self->_testExceptionDuringCommitBatchCommitsToSkip;
}

- (void)setTestExceptionDuringCommitBatchCommitsToSkip:(unint64_t)a3
{
  self->_testExceptionDuringCommitBatchCommitsToSkip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testExceptionDuringCommitBatch, 0);
}

@end
