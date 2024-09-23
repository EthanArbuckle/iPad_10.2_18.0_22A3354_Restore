@implementation CKRecordFetchAggregatorOperationInfo

- (void)setPreserveOrdering:(BOOL)a3
{
  self->_preserveOrdering = a3;
}

- (void)setForceDecryptionAttempt:(BOOL)a3
{
  self->_forceDecryptionAttempt = a3;
}

- (void)setFetchMergeableValues:(BOOL)a3
{
  self->_fetchMergeableValues = a3;
}

- (void)setFetchAssetContents:(BOOL)a3
{
  self->_fetchAssetContents = a3;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (BOOL)preserveOrdering
{
  return self->_preserveOrdering;
}

- (CKRecordFetchAggregatorOperationInfo)init
{
  CKRecordFetchAggregatorOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRecordFetchAggregatorOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
  {
    result->_fetchAssetContents = 1;
    result->_fetchMergeableValues = 1;
  }
  return result;
}

- (BOOL)forceDecryptionAttempt
{
  return self->_forceDecryptionAttempt;
}

- (BOOL)fetchMergeableValues
{
  return self->_fetchMergeableValues;
}

- (BOOL)fetchAssetContents
{
  return self->_fetchAssetContents;
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

@end
