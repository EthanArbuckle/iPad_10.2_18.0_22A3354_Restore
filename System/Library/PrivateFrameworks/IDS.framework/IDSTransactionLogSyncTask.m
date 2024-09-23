@implementation IDSTransactionLogSyncTask

- (id)batchProcessingBlock
{
  return self->_batchProcessingBlock;
}

- (void)setBatchProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)knownRecordIDsFromList
{
  return self->_knownRecordIDsFromList;
}

- (void)setKnownRecordIDsFromList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldContinueFromLastSyncPoint
{
  return self->_shouldContinueFromLastSyncPoint;
}

- (void)setShouldContinueFromLastSyncPoint:(BOOL)a3
{
  self->_shouldContinueFromLastSyncPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_knownRecordIDsFromList, 0);
  objc_storeStrong(&self->_batchProcessingBlock, 0);
}

@end
