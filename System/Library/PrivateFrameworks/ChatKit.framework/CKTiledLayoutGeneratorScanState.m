@implementation CKTiledLayoutGeneratorScanState

- (int64_t)scanLocation
{
  return self->_scanLocation;
}

- (void)setScanLocation:(int64_t)a3
{
  self->_scanLocation = a3;
}

- (id)scannedBatchID
{
  return self->_scannedBatchID;
}

- (void)setScannedBatchID:(id)a3
{
  objc_storeStrong(&self->_scannedBatchID, a3);
}

- (BOOL)scannedBatchHasCaption
{
  return self->_scannedBatchHasCaption;
}

- (void)setScannedBatchHasCaption:(BOOL)a3
{
  self->_scannedBatchHasCaption = a3;
}

- (int64_t)scanSpecialSequenceCount
{
  return self->_scanSpecialSequenceCount;
}

- (void)setScanSpecialSequenceCount:(int64_t)a3
{
  self->_scanSpecialSequenceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scannedBatchID, 0);
}

@end
