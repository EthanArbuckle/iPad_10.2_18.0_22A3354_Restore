@implementation MAAutoAssetSetShortTermLock

- (id)initForAssetSetAtomicInstance:(id)a3 withLockedFilename:(id)a4 withLockedFileDescriptor:(int)a5 forFirstLockReason:(id)a6
{
  id v11;
  id v12;
  id v13;
  MAAutoAssetSetShortTermLock *v14;
  MAAutoAssetSetShortTermLock *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *lockCountByReason;
  NSMutableDictionary *v18;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MAAutoAssetSetShortTermLock;
  v14 = -[MAAutoAssetSetShortTermLock init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetSetAtomicInstance, a3);
    objc_storeStrong((id *)&v15->_lockedFilename, a4);
    v15->_lockedFileDescriptor = a5;
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lockCountByReason = v15->_lockCountByReason;
    v15->_lockCountByReason = v16;

    v18 = v15->_lockCountByReason;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1);
    -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v19, v13);

    v15->_totalLockCount = 1;
  }

  return v15;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetShortTermLock assetSetAtomicInstance](self, "assetSetAtomicInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetShortTermLock lockedFilename](self, "lockedFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAAutoAssetSetShortTermLock lockedFileDescriptor](self, "lockedFileDescriptor");
  -[MAAutoAssetSetShortTermLock lockCountByReason](self, "lockCountByReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("assetSetAtomicInstance:%@|lockedFilename:%@|lockedFileDescriptor:%d|lockCountByReason:%@|totalLockCount:%ld"), v4, v5, v6, v8, -[MAAutoAssetSetShortTermLock totalLockCount](self, "totalLockCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)assetSetAtomicInstance
{
  return self->_assetSetAtomicInstance;
}

- (NSString)lockedFilename
{
  return self->_lockedFilename;
}

- (int)lockedFileDescriptor
{
  return self->_lockedFileDescriptor;
}

- (void)setLockedFileDescriptor:(int)a3
{
  self->_lockedFileDescriptor = a3;
}

- (NSMutableDictionary)lockCountByReason
{
  return self->_lockCountByReason;
}

- (void)setLockCountByReason:(id)a3
{
  objc_storeStrong((id *)&self->_lockCountByReason, a3);
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockCountByReason, 0);
  objc_storeStrong((id *)&self->_lockedFilename, 0);
  objc_storeStrong((id *)&self->_assetSetAtomicInstance, 0);
}

@end
