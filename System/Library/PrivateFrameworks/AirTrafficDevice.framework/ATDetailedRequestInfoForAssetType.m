@implementation ATDetailedRequestInfoForAssetType

- (ATDetailedRequestInfoForAssetType)init
{
  ATDetailedRequestInfoForAssetType *v2;
  ATDetailedRequestInfoForAssetType *v3;
  uint64_t v4;
  NSMutableDictionary *mutableContributors;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATDetailedRequestInfoForAssetType;
  v2 = -[ATDetailedRequestInfoForAssetType init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_totalBytesSynced = 0;
    v2->_totalBytesToSync = 0;
    v2->_totalAssetsToSync = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    mutableContributors = v3->_mutableContributors;
    v3->_mutableContributors = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)updateBytesSynced:(unint64_t)a3
{
  self->_totalBytesSynced += a3;
}

- (void)updateBytesToSync:(unint64_t)a3 forItemIdentifier:(id)a4
{
  NSMutableDictionary *mutableContributors;
  void *v6;
  id v7;
  id v8;

  self->_totalBytesToSync += a3;
  if (a4)
  {
    mutableContributors = self->_mutableContributors;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](mutableContributors, "setObject:forKey:", v8, v7);

  }
}

- (void)incrementAssetCountToSync
{
  ++self->_totalAssetsToSync;
}

- (NSDictionary)getContributors
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_mutableContributors);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalBytesToSync:%llu totalAssetsToSync:%llu totalBytesSynced:%llu"), self->_totalBytesToSync, self->_totalAssetsToSync, self->_totalBytesSynced);
}

- (unint64_t)getTotalBytesSynced
{
  return self->_totalBytesSynced;
}

- (unint64_t)getTotalBytesToSync
{
  return self->_totalBytesToSync;
}

- (unint64_t)getTotalAssetsToSync
{
  return self->_totalAssetsToSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableContributors, 0);
}

+ (id)serializedRequestInfoFromATDetailedRequestInfoForAssetType:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "getTotalAssetsToSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "getTotalBytesToSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v5, "getTotalBytesSynced");

  objc_msgSend(v8, "numberWithUnsignedLongLong:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v6, CFSTR("TotalAssetsToSync"), v7, CFSTR("TotalBytesToSync"), v10, CFSTR("TotalBytesSynced"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
