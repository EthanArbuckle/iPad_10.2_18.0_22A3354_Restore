@implementation CKDUpdateMissingAssetStatusOperationInfo

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_repairRecordID, a3);
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (void)setRecovered:(BOOL)a3
{
  self->_recovered = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (NSArray)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (NSArray)assetPutReceipts
{
  return self->_assetPutReceipts;
}

- (void)setAssetPutReceipts:(id)a3
{
  objc_storeStrong((id *)&self->_assetPutReceipts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPutReceipts, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
}

@end
