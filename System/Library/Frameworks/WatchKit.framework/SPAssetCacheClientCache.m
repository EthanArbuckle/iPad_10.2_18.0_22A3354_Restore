@implementation SPAssetCacheClientCache

- (SPAssetCacheClientCache)initWithIdentifier:(id)a3 cacheType:(unint64_t)a4
{
  id v7;
  SPAssetCacheClientCache *v8;
  uint64_t v9;
  NSMutableArray *keys;
  uint64_t v11;
  NSMutableDictionary *assets;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPAssetCacheClientCache;
  v8 = -[SPAssetCacheClientCache init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    keys = v8->_keys;
    v8->_keys = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    assets = v8->_assets;
    v8->_assets = (NSMutableDictionary *)v11;

    v8->_size = 0;
    v8->_cacheType = a4;
    objc_storeStrong((id *)&v8->_gizmoCacheIdentifier, a3);
  }

  return v8;
}

- (id)cacheDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SPAssetCacheClientCache_cacheDirectory__block_invoke;
  block[3] = &unk_24D3BB2A0;
  block[4] = self;
  if (cacheDirectory_onceDirectoryToken != -1)
    dispatch_once(&cacheDirectory_onceDirectoryToken, block);
  return (id)cacheDirectory___cacheDirectory;
}

void __41__SPAssetCacheClientCache_cacheDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = CFSTR("/Library/Caches/");
  v10[2] = CFSTR("com.apple.watchkit.imagecache");
  v10[3] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)cacheDirectory___cacheDirectory;
  cacheDirectory___cacheDirectory = v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", cacheDirectory___cacheDirectory, 1, 0, &v9);
  v7 = v9;

  if (v7)
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __41__SPAssetCacheClientCache_cacheDirectory__block_invoke_cold_1((uint64_t)v7, v8);

  }
}

- (id)pathForAssetDataWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPAssetCacheClientCache cacheDirectory](self, "cacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(v4, "_sp_stringByEncodingIllegalFilenameCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)syncAssets:(id)a3
{
  id v4;
  unint64_t cacheType;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSMutableDictionary *assets;
  void *v30;
  NSMutableArray *keys;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SPAssetCacheClientCache clearedCache](self, "clearedCache");
  cacheType = self->_cacheType;
  if (cacheType == 2)
  {
    objc_msgSend(v4, "transientCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "transientCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assets");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = v23;
      v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v9);
            v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            assets = self->_assets;
            objc_msgSend(v28, "key", (_QWORD)v33);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](assets, "setObject:forKey:", v28, v30);

            keys = self->_keys;
            objc_msgSend(v28, "key");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](keys, "addObject:", v32);

            self->_size += objc_msgSend(v28, "size");
          }
          v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v25);
      }

      goto LABEL_21;
    }
  }
  else if (cacheType == 1)
  {
    objc_msgSend(v4, "permanentCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v4, "permanentCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assets");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            v15 = self->_assets;
            objc_msgSend(v14, "key");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);

            v17 = self->_keys;
            objc_msgSend(v14, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v17, "addObject:", v18);

            self->_size += objc_msgSend(v14, "size");
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v11);
      }
LABEL_21:

    }
  }

}

BOOL __38__SPAssetCacheClientCache_syncAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "accessDate");
  v6 = v5;
  objc_msgSend(v4, "accessDate");
  v8 = v7;

  return v6 > v8;
}

- (BOOL)addAsset:(id)a3 withName:(id)a4 sendImage:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  SPCacheAsset *v10;
  uint64_t v11;
  void *v12;
  SPCacheAsset *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *gizmoCacheIdentifier;
  void *v18;
  SPCacheMessage *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  SPCacheAsset *v23;
  uint64_t v24;
  void *v25;
  SPCacheAsset *v26;
  _QWORD v28[5];
  _QWORD v29[6];

  v5 = a5;
  v29[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    wk_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SPAssetCacheClientCache addAsset:withName:sendImage:].cold.1();

    goto LABEL_14;
  }
  if (self->_cacheType != 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v20 = 1;
    }
    else
    {
      -[SPAssetCacheClientCache clearSpaceForAsset:](self, "clearSpaceForAsset:", objc_msgSend(v8, "length"));
      -[NSMutableArray addObject:](self->_keys, "addObject:", v9);
      v23 = [SPCacheAsset alloc];
      v24 = objc_msgSend(v8, "length");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 1;
      v26 = -[SPCacheAsset initWithName:size:state:accessDate:](v23, "initWithName:size:state:accessDate:", v9, v24, 1, v25);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assets, "setObject:forKeyedSubscript:", v26, v9);

    }
    goto LABEL_20;
  }
  if (!-[SPAssetCacheClientCache checkAvailableSpaceForAssetWithName:length:](self, "checkAvailableSpaceForAssetWithName:length:", v9, objc_msgSend(v8, "length")))
  {
LABEL_14:
    v20 = 0;
    goto LABEL_20;
  }
  v10 = [SPCacheAsset alloc];
  v11 = objc_msgSend(v8, "length");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SPCacheAsset initWithName:size:state:accessDate:](v10, "initWithName:size:state:accessDate:", v9, v11, 1, v12);

  if (v5 && !-[SPAssetCacheClientCache saveAssetData:forAsset:](self, "saveAssetData:forAsset:", v8, v13))
  {
    v20 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[NSMutableArray addObject:](self->_keys, "addObject:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assets, "setObject:forKeyedSubscript:", v13, v9);
    if (v5)
    {
      v29[0] = &unk_24D3CB408;
      v28[0] = CFSTR("cmsg");
      v28[1] = CFSTR("a");
      -[SPCacheAsset key](v13, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v15;
      v29[2] = v8;
      v28[2] = CFSTR("d");
      v28[3] = CFSTR("t");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_cacheType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[4] = CFSTR("i");
      gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
      v29[3] = v16;
      v29[4] = gizmoCacheIdentifier;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[SPCacheMessage initWithDictionary:]([SPCacheMessage alloc], "initWithDictionary:", v18);
      +[SPRemoteInterface sendCacheRequestMessage:](SPRemoteInterface, "sendCacheRequestMessage:", v19);

    }
    v20 = 1;
  }

LABEL_20:
  return v20;
}

- (void)addedAssetWithName:(id)a3
{
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setState:", 0);
    -[SPAssetCacheClientCache deleteDataForAsset:](self, "deleteDataForAsset:", v5);
    v4 = v5;
  }

}

- (void)clearSpaceForAsset:(unint64_t)a3
{
  unint64_t v4;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = self->_size + a3;
  if (v4 >= 0x500000)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_keys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPAssetCacheClientCache deleteAsset:](self, "deleteAsset:", v12);
        v9 += objc_msgSend(v12, "size");

        if (v9 >= a3)
          break;
        if (v8 == ++v11)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    v4 = self->_size + a3;
  }
  self->_size = v4;
}

- (BOOL)checkAvailableSpaceForAssetWithName:(id)a3 length:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    a4 -= objc_msgSend(v6, "size");
  v8 = self->_size + a4;
  if (v8 >> 20 <= 4)
    self->_size = v8;
  v9 = v8 < 0x500000;

  return v9;
}

- (void)deleteAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *gizmoCacheIdentifier;
  void *v9;
  SPCacheMessage *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "size");
  self->_size = (self->_size - v5) & ~((self->_size - v5) >> 63);
  -[SPAssetCacheClientCache deleteDataForAsset:](self, "deleteDataForAsset:", v4);
  objc_msgSend(v4, "setState:", 2);
  v12[0] = &unk_24D3CB420;
  v11[0] = CFSTR("cmsg");
  v11[1] = CFSTR("a");
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v6;
  v11[2] = CFSTR("t");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_cacheType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("i");
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  v12[2] = v7;
  v12[3] = gizmoCacheIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SPCacheMessage initWithDictionary:]([SPCacheMessage alloc], "initWithDictionary:", v9);
  +[SPRemoteInterface sendCacheRequestMessage:](SPRemoteInterface, "sendCacheRequestMessage:", v10);

}

- (void)deleteAssetWithName:(id)a3
{
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SPAssetCacheClientCache deleteAsset:](self, "deleteAsset:", v4);
    v4 = v5;
  }

}

- (void)deletedAssetWithName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_assets, "removeObjectForKey:", v5);
    -[NSMutableArray removeObject:](self->_keys, "removeObject:", v5);
  }

}

- (void)deleteAllAssets
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *gizmoCacheIdentifier;
  void *v11;
  SPCacheMessage *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->_size = 0;
  if (self->_cacheType == 1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_assets;
    v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7), (_QWORD)v13);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPAssetCacheClientCache deleteDataForAsset:](self, "deleteDataForAsset:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v5);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_assets, "removeAllObjects", (_QWORD)v13);
  -[NSMutableArray removeAllObjects](self->_keys, "removeAllObjects");
  v18[0] = &unk_24D3CB438;
  v17[0] = CFSTR("cmsg");
  v17[1] = CFSTR("t");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_cacheType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = CFSTR("i");
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  v18[1] = v9;
  v18[2] = gizmoCacheIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SPCacheMessage initWithDictionary:]([SPCacheMessage alloc], "initWithDictionary:", v11);
  +[SPRemoteInterface sendCacheRequestMessage:](SPRemoteInterface, "sendCacheRequestMessage:", v12);

}

- (id)cachedImages
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_assets;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "state") == 1 || !objc_msgSend(v10, "state"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "size"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v11, v9);

        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)saveAssetData:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  id v17;
  id v18;

  v6 = a3;
  objc_msgSend(a4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAssetCacheClientCache pathForAssetDataWithName:](self, "pathForAssetDataWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v8, &v18);
    v12 = v18;

    if ((v11 & 1) == 0)
    {
      wk_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SPAssetCacheClientCache saveAssetData:forAsset:].cold.2();
LABEL_9:

      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
  }
  v14 = v12;
  v17 = v12;
  v15 = 1;
  objc_msgSend(v6, "writeToFile:options:error:", v8, 1, &v17);
  v12 = v17;

  if (v12)
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SPAssetCacheClientCache saveAssetData:forAsset:].cold.1();
    goto LABEL_9;
  }
LABEL_10:

  return v15;
}

- (void)deleteDataForAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;

  if (a3)
  {
    objc_msgSend(a3, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPAssetCacheClientCache pathForAssetDataWithName:](self, "pathForAssetDataWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v9 = objc_msgSend(v8, "removeItemAtPath:error:", v5, &v12);
      v10 = v12;

      if ((v9 & 1) == 0)
      {
        wk_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[SPAssetCacheClientCache deleteDataForAsset:].cold.1();

      }
    }
    else
    {
      v10 = 0;
    }

  }
}

- (id)dataForImageWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v4, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPAssetCacheClientCache pathForAssetDataWithName:](self, "pathForAssetDataWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)gizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier;
}

- (void)setGizmoCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, a3);
}

- (NSMutableDictionary)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);
}

void __41__SPAssetCacheClientCache_cacheDirectory__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = 136446978;
  v3 = "-[SPAssetCacheClientCache cacheDirectory]_block_invoke";
  v4 = 1024;
  v5 = 60;
  v6 = 2114;
  v7 = cacheDirectory___cacheDirectory;
  v8 = 2114;
  v9 = a1;
  _os_log_error_impl(&dword_215918000, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to create directory at %{public}@, error: %{public}@", (uint8_t *)&v2, 0x26u);
  OUTLINED_FUNCTION_2_0();
}

- (void)addAsset:withName:sendImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_215918000, v0, v1, "%{public}s:%d: Failed to cache image with name: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)saveAssetData:forAsset:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: failed to save asset at: %{public}@, error: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)saveAssetData:forAsset:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)deleteDataForAsset:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

@end
