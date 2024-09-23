@implementation AVMutableAssetDownloadStorageManagementPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  AVAssetDownloadStorageManagementPolicy *v4;

  v4 = -[AVAssetDownloadStorageManagementPolicy init](+[AVAssetDownloadStorageManagementPolicy allocWithZone:](AVAssetDownloadStorageManagementPolicy, "allocWithZone:", a3), "init");
  if (v4)
    -[AVAssetDownloadStorageManagementPolicy _setPolicyDictionary:](v4, "_setPolicyDictionary:", -[AVAssetDownloadStorageManagementPolicy _policyDictionary](self, "_policyDictionary"));
  return v4;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  -[AVAssetDownloadStorageManagementPolicy setExpirationDate:](&v3, sel_setExpirationDate_, expirationDate);
}

- (void)setPriority:(AVAssetDownloadedAssetEvictionPriority)priority
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  -[AVAssetDownloadStorageManagementPolicy setPriority:](&v3, sel_setPriority_, priority);
}

- (NSDate)expirationDate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  return -[AVAssetDownloadStorageManagementPolicy expirationDate](&v3, sel_expirationDate);
}

- (AVAssetDownloadedAssetEvictionPriority)priority
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAssetDownloadStorageManagementPolicy;
  return -[AVAssetDownloadStorageManagementPolicy priority](&v3, sel_priority);
}

@end
