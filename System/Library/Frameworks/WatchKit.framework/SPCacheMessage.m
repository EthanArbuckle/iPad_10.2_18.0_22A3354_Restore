@implementation SPCacheMessage

- (SPCacheMessage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPCacheMessage;
  return -[SPCacheMessage init](&v3, sel_init);
}

- (SPCacheMessage)initWithDictionary:(id)a3
{
  id v4;
  SPCacheMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *assetKey;
  void *v13;
  uint64_t v14;
  NSData *assetData;
  void *v16;
  uint64_t v17;
  NSString *gizmoCacheIdentifier;
  void *v19;
  uint64_t v20;
  SPAssetCacheSyncData *syncData;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SPCacheMessage;
  v5 = -[SPCacheMessage init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cmsg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cmsg"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_messageType = objc_msgSend(v7, "unsignedIntValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_cacheType = objc_msgSend(v9, "unsignedIntValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
      v11 = objc_claimAutoreleasedReturnValue();
      assetKey = v5->_assetKey;
      v5->_assetKey = (NSString *)v11;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("d"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("d"));
      v14 = objc_claimAutoreleasedReturnValue();
      assetData = v5->_assetData;
      v5->_assetData = (NSData *)v14;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("i"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("i"));
      v17 = objc_claimAutoreleasedReturnValue();
      gizmoCacheIdentifier = v5->_gizmoCacheIdentifier;
      v5->_gizmoCacheIdentifier = (NSString *)v17;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
      v20 = objc_claimAutoreleasedReturnValue();
      syncData = v5->_syncData;
      v5->_syncData = (SPAssetCacheSyncData *)v20;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("e"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("e"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_error = objc_msgSend(v23, "integerValue");

    }
  }

  return v5;
}

+ (id)toProto:(id)a3
{
  id v3;
  SPProtoCacheMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheMessage);
  -[SPProtoCacheMessage setMessageType:](v4, "setMessageType:", objc_msgSend(v3, "messageType"));
  -[SPProtoCacheMessage setCacheType:](v4, "setCacheType:", objc_msgSend(v3, "cacheType"));
  objc_msgSend(v3, "assetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "assetKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPProtoCacheMessage setAssetKey:](v4, "setAssetKey:", v6);

  }
  objc_msgSend(v3, "gizmoCacheIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "gizmoCacheIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPProtoCacheMessage setGizmoCacheIdentifier:](v4, "setGizmoCacheIdentifier:", v8);

  }
  objc_msgSend(v3, "assetData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "assetData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPProtoCacheMessage setAssetData:](v4, "setAssetData:", v10);

  }
  objc_msgSend(v3, "syncData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "syncData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPAssetCacheSyncData toProto:](SPAssetCacheSyncData, "toProto:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPProtoCacheMessage setSyncData:](v4, "setSyncData:", v13);

  }
  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3;
  SPCacheMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(SPCacheMessage);
  -[SPCacheMessage setMessageType:](v4, "setMessageType:", objc_msgSend(v3, "messageType"));
  -[SPCacheMessage setCacheType:](v4, "setCacheType:", (int)objc_msgSend(v3, "cacheType"));
  objc_msgSend(v3, "assetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "assetKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCacheMessage setAssetKey:](v4, "setAssetKey:", v6);

  }
  objc_msgSend(v3, "gizmoCacheIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "gizmoCacheIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCacheMessage setGizmoCacheIdentifier:](v4, "setGizmoCacheIdentifier:", v8);

  }
  objc_msgSend(v3, "assetData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "assetData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCacheMessage setAssetData:](v4, "setAssetData:", v10);

  }
  objc_msgSend(v3, "syncData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "syncData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPAssetCacheSyncData fromProto:](SPAssetCacheSyncData, "fromProto:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCacheMessage setSyncData:](v4, "setSyncData:", v13);

  }
  return v4;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetKey, a3);
}

- (NSString)gizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier;
}

- (void)setGizmoCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, a3);
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
  objc_storeStrong((id *)&self->_assetData, a3);
}

- (SPAssetCacheSyncData)syncData
{
  return self->_syncData;
}

- (void)setSyncData:(id)a3
{
  objc_storeStrong((id *)&self->_syncData, a3);
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
}

@end
