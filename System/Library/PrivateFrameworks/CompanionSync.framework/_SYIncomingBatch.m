@implementation _SYIncomingBatch

- (SYBatchSyncChunk)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
  objc_storeStrong((id *)&self->_batch, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_batch, 0);
}

@end
