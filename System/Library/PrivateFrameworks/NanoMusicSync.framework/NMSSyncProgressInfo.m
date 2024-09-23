@implementation NMSSyncProgressInfo

+ (id)_stringFromSyncState:(unint64_t)a3
{
  __CFString *v3;

  v3 = CFSTR("Unknown");
  switch(a3)
  {
    case 0uLL:
      return v3;
    case 1uLL:
      v3 = CFSTR("Idle");
      return v3;
    case 2uLL:
      return CFSTR("Pending");
    case 3uLL:
      return CFSTR("Waiting");
    case 4uLL:
      return CFSTR("Asset Updating");
    default:
      if (a3 == 98)
        return CFSTR("Metadata Syncing");
      if (a3 == 99)
        return CFSTR("Asset Syncing");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown [%tu]"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

+ (id)_stringFromWaitingSubstate:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("Power"));
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  NSString *assetType;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  assetType = self->_assetType;
  objc_msgSend((id)objc_opt_class(), "_stringFromSyncState:", self->_syncState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_stringFromWaitingSubstate:", self->_syncWaitingSubstate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NMSSyncProgressInfo [%@]: state %@, waitingSubstate:%@, progress %0.4f, assets %ld/%ld (need %ld)"), assetType, v5, v6, self->_estimatedSyncProgress, self->_numberOfAssetItemsSynced, self->_numberOfAssetItems, self->_numberOfAssetItemsNeedingDownload);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_assetType, a3);
}

- (unint64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unint64_t)a3
{
  self->_syncState = a3;
}

- (unint64_t)syncWaitingSubstate
{
  return self->_syncWaitingSubstate;
}

- (void)setSyncWaitingSubstate:(unint64_t)a3
{
  self->_syncWaitingSubstate = a3;
}

- (float)estimatedSyncProgress
{
  return self->_estimatedSyncProgress;
}

- (void)setEstimatedSyncProgress:(float)a3
{
  self->_estimatedSyncProgress = a3;
}

- (int64_t)numberOfAssetItems
{
  return self->_numberOfAssetItems;
}

- (void)setNumberOfAssetItems:(int64_t)a3
{
  self->_numberOfAssetItems = a3;
}

- (int64_t)numberOfAssetItemsSynced
{
  return self->_numberOfAssetItemsSynced;
}

- (void)setNumberOfAssetItemsSynced:(int64_t)a3
{
  self->_numberOfAssetItemsSynced = a3;
}

- (int64_t)numberOfAssetItemsNeedingDownload
{
  return self->_numberOfAssetItemsNeedingDownload;
}

- (void)setNumberOfAssetItemsNeedingDownload:(int64_t)a3
{
  self->_numberOfAssetItemsNeedingDownload = a3;
}

- (unint64_t)aggregateAssetItemBytesAdded
{
  return self->_aggregateAssetItemBytesAdded;
}

- (void)setAggregateAssetItemBytesAdded:(unint64_t)a3
{
  self->_aggregateAssetItemBytesAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
