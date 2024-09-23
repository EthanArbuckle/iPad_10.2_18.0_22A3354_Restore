@implementation ATDetailedProgressInfoForAssetType

- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5
{
  id v9;
  ATDetailedProgressInfoForAssetType *v10;
  ATDetailedProgressInfoForAssetType *v11;
  uint64_t v12;
  NSMutableSet *failedAssetIds;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATDetailedProgressInfoForAssetType;
  v10 = -[ATDetailedProgressInfoForAssetType init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_atAssetType, a3);
    v11->_totalBytesToSync = a5;
    v11->_totalBytesSynced = 0;
    v11->_totalAssetsToSync = a4;
    v11->_totalAssetsSynced = 0;
    v11->_failedAssetCount = 0;
    v11->_progress = 0.0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    failedAssetIds = v11->failedAssetIds;
    v11->failedAssetIds = (NSMutableSet *)v12;

  }
  return v11;
}

- (ATDetailedProgressInfoForAssetType)initWithAssetType:(id)a3 assetCountToSync:(unint64_t)a4 byteCountToSync:(unint64_t)a5 assetCountSynced:(unint64_t)a6 byteCountSyned:(unint64_t)a7
{
  id v13;
  ATDetailedProgressInfoForAssetType *v14;
  ATDetailedProgressInfoForAssetType *v15;
  uint64_t v16;
  NSMutableSet *failedAssetIds;
  objc_super v19;

  v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATDetailedProgressInfoForAssetType;
  v14 = -[ATDetailedProgressInfoForAssetType init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_atAssetType, a3);
    v15->_totalBytesToSync = a5;
    v15->_totalBytesSynced = a7;
    v15->_totalAssetsToSync = a4;
    v15->_totalAssetsSynced = a6;
    v15->_failedAssetCount = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    failedAssetIds = v15->failedAssetIds;
    v15->failedAssetIds = (NSMutableSet *)v16;

    -[ATDetailedProgressInfoForAssetType updateBytesDownloaded:](v15, "updateBytesDownloaded:", 0);
  }

  return v15;
}

- (void)updateAsset:(id)a3 syncedWithSuccess:(BOOL)a4 bytesDownloaded:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    ++self->_totalAssetsSynced;
    v10 = v8;
    -[ATDetailedProgressInfoForAssetType updateBytesDownloaded:](self, "updateBytesDownloaded:", a5);
LABEL_5:
    v9 = v10;
    goto LABEL_6;
  }
  ++self->_failedAssetCount;
  if (v8)
  {
    v10 = v8;
    -[NSMutableSet addObject:](self->failedAssetIds, "addObject:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateBytesToDownload:(unint64_t)a3
{
  self->_totalBytesToSync += a3;
  -[ATDetailedProgressInfoForAssetType _computeProgress](self, "_computeProgress");
}

- (void)updateBytesDownloaded:(unint64_t)a3
{
  unint64_t totalBytesToSync;

  totalBytesToSync = self->_totalBytesSynced + a3;
  if (totalBytesToSync >= self->_totalBytesToSync)
    totalBytesToSync = self->_totalBytesToSync;
  self->_totalBytesSynced = totalBytesToSync;
  -[ATDetailedProgressInfoForAssetType _computeProgress](self, "_computeProgress");
}

- (void)updateAssetsToDownload:(unint64_t)a3
{
  self->_totalAssetsToSync += a3;
}

- (void)_computeProgress
{
  unint64_t totalBytesToSync;

  totalBytesToSync = self->_totalBytesToSync;
  if (totalBytesToSync)
    self->_progress = (double)self->_totalBytesSynced / (double)totalBytesToSync;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalBytesToSync:%llu, totalAssetsToSync:%llu, totalBytesSynced:%llu, totalAssetsSynced:%llu, failedAssetCount:%llu, sync progress:%f"), self->_totalBytesToSync, self->_totalAssetsToSync, self->_totalBytesSynced, self->_totalAssetsSynced, self->_failedAssetCount, *(_QWORD *)&self->_progress);
}

- (unint64_t)getTotalBytesToSync
{
  return self->_totalBytesToSync;
}

- (void)setTotalBytesToSync:(unint64_t)a3
{
  self->_totalBytesToSync = a3;
}

- (unint64_t)getTotalBytesSynced
{
  return self->_totalBytesSynced;
}

- (void)setTotalBytesSynced:(unint64_t)a3
{
  self->_totalBytesSynced = a3;
}

- (unint64_t)getTotalAssetsToSync
{
  return self->_totalAssetsToSync;
}

- (void)setTotalAssetsToSync:(unint64_t)a3
{
  self->_totalAssetsToSync = a3;
}

- (unint64_t)getTotalAssetsSynced
{
  return self->_totalAssetsSynced;
}

- (void)setTotalAssetsSynced:(unint64_t)a3
{
  self->_totalAssetsSynced = a3;
}

- (unint64_t)getFailedAssetsCount
{
  return self->_failedAssetCount;
}

- (void)setFailedAssetCount:(unint64_t)a3
{
  self->_failedAssetCount = a3;
}

- (double)getSyncProgress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)getAssetType
{
  return self->_atAssetType;
}

- (void)setAtAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_atAssetType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atAssetType, 0);
  objc_storeStrong((id *)&self->failedAssetIds, 0);
}

+ (id)serializedProgressInfoFromATDetailedProgressInfoForAssetType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v4, "getAssetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalBytesToSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalAssetsToSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalBytesSynced"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "getTotalAssetsSynced"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "getSyncProgress");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "getFailedAssetsCount");

  objc_msgSend(v12, "numberWithUnsignedLongLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, CFSTR("AssetType"), v6, CFSTR("TotalBytesToSync"), v7, CFSTR("TotalAssetsToSync"), v8, CFSTR("TotalBytesSynced"), v9, CFSTR("TotalAssetsSynced"), v11, CFSTR("SyncProgressForType"), v14, CFSTR("FailedAssetCount"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
