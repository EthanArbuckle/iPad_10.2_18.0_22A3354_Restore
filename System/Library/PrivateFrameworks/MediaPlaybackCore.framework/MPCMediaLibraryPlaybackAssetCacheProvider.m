@implementation MPCMediaLibraryPlaybackAssetCacheProvider

+ (id)deviceLibraryProviderWithUserIdentity:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibraryWithUserIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPCMediaLibraryPlaybackAssetCacheProvider _initWithMediaLibrary:]([MPCMediaLibraryPlaybackAssetCacheProvider alloc], "_initWithMediaLibrary:", v3);

  return v4;
}

- (id)_initWithMediaLibrary:(id)a3
{
  id v5;
  MPCMediaLibraryPlaybackAssetCacheProvider *v6;
  MPCMediaLibraryPlaybackAssetCacheProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaLibraryPlaybackAssetCacheProvider;
  v6 = -[MPCMediaLibraryPlaybackAssetCacheProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (void)clearPlaybackAssetCacheFileAssetForGenericObject:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);
  uint8_t buf[4];
  MPCMediaLibraryPlaybackAssetCacheProvider *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  v7 = -[MPCMediaLibraryPlaybackAssetCacheProvider _persistentIDForModelObject:](self, "_persistentIDForModelObject:", a3);
  if (v7)
  {
    v8 = v7;
    -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self->_mediaLibrary, "itemWithPersistentID:verifyExistence:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDDBC10];
    v11 = *MEMORY[0x24BDDBB68];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDDBC10], *MEMORY[0x24BDDBB68], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valuesForProperties:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v13, "objectForKey:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if ((v16 & 1) == 0)
      {
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = self;
          v23 = 2048;
          v24 = v8;
          _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Item asset file path is not clear because the item has a downloaded asset persistentID=%lld", buf, 0x16u);
        }

        if (!v6)
          goto LABEL_13;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1007, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v18);
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {

    }
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __116__MPCMediaLibraryPlaybackAssetCacheProvider_clearPlaybackAssetCacheFileAssetForGenericObject_withCompletionHandler___block_invoke;
    v19[3] = &unk_24CAB30E8;
    v20 = v6;
    objc_msgSend(v9, "populateLocationPropertiesWithPath:assetProtectionType:completionBlock:", 0, 0, v19);
    v18 = v20;
    goto LABEL_12;
  }
  if (v6)
    v6[2](v6, 0);
LABEL_14:

}

- (void)getPlaybackAssetDestinationURL:(id *)a3 sharedCacheURL:(id *)a4 purgeable:(BOOL)a5 purchaseBundleDestinationURL:(id *)a6 assetQualityType:(int64_t)a7 fileName:(id)a8 pathExtension:(id)a9
{
  _BOOL4 v11;
  id v15;
  void *v16;
  MPMediaLibrary *mediaLibrary;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v11 = a5;
  v30 = a8;
  v15 = a9;
  if (v11)
  {
    v16 = (void *)objc_opt_class();
    mediaLibrary = self->_mediaLibrary;
    if (a7 == 2)
      objc_msgSend(v16, "_highQualityCachedAssetDestinationDirectoryForMediaLibrary:", mediaLibrary);
    else
      objc_msgSend(v16, "_lowQualityCachedAssetDestinationDirectoryForMediaLibrary:", mediaLibrary);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_downloadedAssetDestinationDirectoryForMediaLibrary:", self->_mediaLibrary);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  objc_msgSend(v18, "stringByAppendingPathComponent:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a3)
  {
    v22 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v20, "stringByAppendingPathExtension:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURLWithPath:isDirectory:", v23, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a6)
  {
    v24 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v21, "stringByAppendingPathExtension:", CFSTR("plist"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileURLWithPath:isDirectory:", v25, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BE6B1D0], "cloudAssetsSharedCacheFolderPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v26, "stringByAppendingPathComponent:", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathExtension:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fileURLWithPath:isDirectory:", v29, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void)setPlaybackAssetCacheFileAsset:(id)a3 forGenericObject:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *v26;
  _QWORD aBlock[4];
  id v28;
  MPCMediaLibraryPlaybackAssetCacheProvider *v29;
  id v30;
  id v31;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "filePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x2020000000;
    v35 = 0;
    v35 = -[MPCMediaLibraryPlaybackAssetCacheProvider _persistentIDForModelObject:](self, "_persistentIDForModelObject:", v9);
    objc_msgSend(v9, "flattenedGenericObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");
    switch(v13)
    {
      case 1:
        objc_msgSend(v12, "song");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        objc_msgSend(v12, "tvEpisode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 9:
        objc_msgSend(v12, "movie");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v22 = 0;
        break;
    }
    v16 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_24CAB3110;
    v28 = v8;
    v29 = self;
    p_buf = &buf;
    v17 = v10;
    v31 = v17;
    v30 = v11;
    v18 = _Block_copy(aBlock);
    v19 = v18;
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
    {
      (*((void (**)(void *))v18 + 2))(v18);
    }
    else
    {
      v20 = objc_alloc_init(MEMORY[0x24BDDC8E0]);
      objc_msgSend(v20, "setShouldLibraryAdd:", 0);
      v21 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      objc_msgSend(v21, "appendSection:", &stru_24CABB5D0);
      objc_msgSend(v21, "appendItem:", v22);
      objc_msgSend(v20, "setModelObjects:", v21);
      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_2;
      v23[3] = &unk_24CAB3138;
      v26 = &buf;
      v24 = v19;
      v25 = v17;
      objc_msgSend(v20, "performWithResponseHandler:", v23);

    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "%{public}@: File asset missing file path, finishing.", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1005, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);

  }
}

- (BOOL)isUnderDailyCacheAssetDownloadLimit
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("_MPCDailyAssetDownloadLimitKB"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "integerValue") < 1)
  {
    v6 = 1;
  }
  else
  {
    v4 = +[MPCMediaLibraryPlaybackAssetCacheProvider _increaseDailyAssetDownloadKB:]((uint64_t)MPCMediaLibraryPlaybackAssetCacheProvider, 0);
    v5 = objc_msgSend(v3, "integerValue");
    v6 = v4 < v5;
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v4 < v5;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218754;
      v12 = v4;
      v13 = 2114;
      v14 = v3;
      v15 = 1024;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "MPCMediaLibraryPlaybackAssetCacheProvider: Current daily asset download size: %ld KB, daily limit: %{public}@ KB, is under daily limit: %{BOOL}u %@", (uint8_t *)&v11, 0x26u);

    }
  }

  return v6;
}

- (void)didCacheNewAssetToDestinationURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v29 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v4, "attributesOfItemAtPath:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0D38]))
    {
      objc_msgSend(v23, "enumeratorAtPath:", v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (!v9)
      {

LABEL_15:
        goto LABEL_16;
      }
      v10 = v9;
      v19 = v7;
      v20 = v5;
      v21 = v3;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      v13 = *MEMORY[0x24BDD0D08];
      do
      {
        v14 = 0;
        v15 = v6;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(v22, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14), v19, v20, v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v15;
          objc_msgSend(v23, "attributesOfItemAtPath:error:", v16, &v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v24;

          objc_msgSend(v17, "objectForKey:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v11 += objc_msgSend(v18, "longLongValue");

          ++v14;
          v15 = v6;
        }
        while (v10 != v14);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
      v5 = v20;
      v3 = v21;
      v7 = v19;
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D08]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "longLongValue");
    }

    if (v11)
      +[MPCMediaLibraryPlaybackAssetCacheProvider _increaseDailyAssetDownloadKB:]((uint64_t)MPCMediaLibraryPlaybackAssetCacheProvider, (int)(v11 / 0x3E8));
    goto LABEL_15;
  }
LABEL_16:

}

- (int64_t)_persistentIDForModelObject:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "flattenedGenericObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");
  switch(v4)
  {
    case 9:
      objc_msgSend(v3, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(v3, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v3, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "persistentID");

LABEL_9:
  return v9;
}

+ (uint64_t)_increaseDailyAssetDownloadKB:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  signed int v8;
  signed int v9;
  uint64_t v10;
  signed int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = (uint64_t)v5 / 86400;

  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __75__MPCMediaLibraryPlaybackAssetCacheProvider__increaseDailyAssetDownloadKB___block_invoke;
  v21 = &__block_descriptor_48_e5_v8__0l;
  v22 = v6;
  v23 = v3;
  if (_increaseDailyAssetDownloadKB__onceToken != -1)
    dispatch_once(&_increaseDailyAssetDownloadKB__onceToken, &v18);
  v7 = v6 - __MPCDailyAssetDownloadCountDay;
  if (v6 <= __MPCDailyAssetDownloadCountDay)
  {
    do
      v11 = __ldxr(__MPCDailyAssetDownloadSizeInKB);
    while (__stxr(v11 + a2, __MPCDailyAssetDownloadSizeInKB));
    v10 = a2 + v11;
    if (!a2)
      return v10;
  }
  else
  {
    do
      v8 = __ldxr(__MPCDailyAssetDownloadSizeInKB);
    while (__stxr(0, __MPCDailyAssetDownloadSizeInKB));
    +[MPCMediaLibraryPlaybackAssetCacheProvider _sendDailyTotalDownloadSizeEventWithDays:sizeInKB:](v3, v7, v8);
    __MPCDailyAssetDownloadCountDay = v6;
    do
      v9 = __ldxr(__MPCDailyAssetDownloadSizeInKB);
    while (__stxr(v9 + a2, __MPCDailyAssetDownloadSizeInKB));
    v10 = a2 + v9;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v18, v19, v20, v21, v22, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("day");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v26[1] = CFSTR("sizeInKB");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("_MPCDailyAssetDownloadCurrentSize"));

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v25 = v10;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "MPCMediaLibraryPlaybackAssetCacheProvider: Updated daily asset download size: %{public}ld KB", buf, 0xCu);
  }

  return v10;
}

void __75__MPCMediaLibraryPlaybackAssetCacheProvider__increaseDailyAssetDownloadKB___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  __MPCDailyAssetDownloadCountDay = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_MPCDailyAssetDownloadCurrentSize"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longLongValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sizeInKB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    v8 = *(_QWORD *)(a1 + 32);
    if (v8 == v5)
    {
      atomic_store(v7, __MPCDailyAssetDownloadSizeInKB);
LABEL_6:
      v3 = v9;
      goto LABEL_7;
    }
    v3 = v9;
    if (v8 > v5)
    {
      +[MPCMediaLibraryPlaybackAssetCacheProvider _sendDailyTotalDownloadSizeEventWithDays:sizeInKB:](*(_QWORD *)(a1 + 40), v8 - v5, v7);
      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (void)_sendDailyTotalDownloadSizeEventWithDays:(uint64_t)a3 sizeInKB:
{
  void *v5;
  _QWORD v6[6];

  objc_opt_self();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __95__MPCMediaLibraryPlaybackAssetCacheProvider__sendDailyTotalDownloadSizeEventWithDays_sizeInKB___block_invoke;
  v6[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  v6[4] = a2;
  v6[5] = a3;
  v5 = _Block_copy(v6);
  AnalyticsSendEventLazy();

}

id __95__MPCMediaLibraryPlaybackAssetCacheProvider__sendDailyTotalDownloadSizeEventWithDays_sizeInKB___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("appID");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("days");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("totalKB");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("avgKBPerDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40) / *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  os_log_t v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  __CFString *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  uint64_t v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  __CFString *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  char v89;
  uint64_t v90;
  __CFString *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  _QWORD v102[4];
  id v103;
  uint8_t buf[4];
  uint64_t v105;
  __int16 v106;
  __CFString *v107;
  __int16 v108;
  __CFString *v109;
  __int16 v110;
  __CFString *v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "qualityType");
  v3 = objc_msgSend(*(id *)(a1 + 32), "traits");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "itemWithPersistentID:verifyExistence:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *MEMORY[0x24BDDBC10];
    v6 = *MEMORY[0x24BDDBB68];
    v7 = *MEMORY[0x24BDDBB90];
    v96 = *MEMORY[0x24BDDBB70];
    v97 = *MEMORY[0x24BDDBC08];
    v98 = *MEMORY[0x24BDDBBA0];
    v100 = *MEMORY[0x24BDDBB88];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDDBC10], *MEMORY[0x24BDDBC08], *MEMORY[0x24BDDBB68], *MEMORY[0x24BDDBB88], *MEMORY[0x24BDDBB90], *MEMORY[0x24BDDBBA0], *MEMORY[0x24BDDBB70], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString valuesForProperties:](v4, "valuesForProperties:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = v6;
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v9, "objectForKey:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) == 0)
      {
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 40);
          v15 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          *(_DWORD *)buf = 138543618;
          v105 = v14;
          v106 = 2048;
          v107 = v15;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Item asset file path is not set because the item has a downloaded asset persistentID=%lld", buf, 0x16u);
        }

        v16 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1007, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
LABEL_80:

        goto LABEL_81;
      }
    }
    else
    {

    }
    v20 = (4 * v3) & 0x20 | (v3 >> 4) & 3 | (16 * ((v3 >> 2) & 1)) | (4 * ((v3 >> 1) & 1));
    objc_msgSend(v9, "objectForKey:", v100);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    v95 = v22;
    if (v20 == v22)
    {
LABEL_57:
      objc_msgSend(*(id *)(a1 + 32), "hlsKeyCertificateURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v9, "objectForKey:", v7);
        v50 = objc_claimAutoreleasedReturnValue();
        if (!v50
          || (v51 = (void *)v50,
              objc_msgSend(v9, "objectForKey:", v7),
              v52 = (void *)objc_claimAutoreleasedReturnValue(),
              v53 = objc_msgSend(v17, "isEqualToString:", v52),
              v52,
              v51,
              (v53 & 1) == 0))
        {
          -[__CFString setValue:forProperty:](v4, "setValue:forProperty:", v17, v7);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "hlsKeyServerURL");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "length"))
      {
        objc_msgSend(v9, "objectForKey:", v98);
        v55 = objc_claimAutoreleasedReturnValue();
        if (!v55
          || (v56 = (void *)v55,
              objc_msgSend(v9, "objectForKey:", v98),
              v57 = (void *)objc_claimAutoreleasedReturnValue(),
              v58 = objc_msgSend(v54, "isEqualToString:", v57),
              v57,
              v56,
              (v58 & 1) == 0))
        {
          -[__CFString setValue:forProperty:](v4, "setValue:forProperty:", v54, v98);
        }
      }
      v101 = v54;
      objc_msgSend(*(id *)(a1 + 32), "hlsKeyServerProtocol");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v99;
      if (objc_msgSend(v59, "length"))
      {
        v61 = *MEMORY[0x24BDDBB98];
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDDBB98]);
        v62 = objc_claimAutoreleasedReturnValue();
        if (!v62)
          goto LABEL_68;
        v63 = (void *)v62;
        objc_msgSend(v9, "objectForKey:", v61);
        v64 = v9;
        v65 = v4;
        v66 = v2;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v59, "isEqualToString:", v67);

        v2 = v66;
        v4 = v65;
        v9 = v64;
        v60 = v99;

        if ((v68 & 1) == 0)
LABEL_68:
          -[__CFString setValue:forProperty:](v4, "setValue:forProperty:", v59, v61);
      }
      objc_msgSend(v9, "objectForKey:", v60);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "length");

      if (!v70)
        goto LABEL_73;
      objc_msgSend(v9, "objectForKey:", v60);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if (!v72)
        goto LABEL_73;
      objc_msgSend(v9, "objectForKey:", v97);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "BOOLValue");

      if (v74)
      {
        if (v2 == 2)
          goto LABEL_73;
      }
      objc_msgSend(*(id *)(a1 + 48), "pathExtension");
      v82 = objc_claimAutoreleasedReturnValue();
      if (!v82)
        goto LABEL_85;
      v83 = (void *)v82;
      MSVOfflineHLSFileExtensions();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "pathExtension");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "containsObject:", v85);

      if (!v86)
        goto LABEL_85;
      objc_msgSend(v9, "objectForKey:", v96);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", MSVGetDiskUsageForPath());
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v87, "isEqualToNumber:", v88);

      if ((v89 & 1) == 0)
      {
LABEL_73:
        v75 = objc_msgSend(*(id *)(a1 + 32), "protectionType");
        if (v75 == 1)
          v76 = 1;
        else
          v76 = 2 * (v75 == 2);
        v77 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v78 = *(_QWORD *)(a1 + 40);
          v79 = *(__CFString **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v105 = v78;
          v106 = 2114;
          v107 = v79;
          v108 = 2114;
          v109 = v4;
          _os_log_impl(&dword_210BD8000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing path %{public}@ for media item: %{public}@", buf, 0x20u);
        }

        v102[0] = MEMORY[0x24BDAC760];
        v102[1] = 3221225472;
        v102[2] = __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_12;
        v102[3] = &unk_24CAB30E8;
        v80 = *(_QWORD *)(a1 + 48);
        v103 = *(id *)(a1 + 56);
        -[__CFString populateLocationPropertiesWithPath:assetProtectionType:completionBlock:](v4, "populateLocationPropertiesWithPath:assetProtectionType:completionBlock:", v80, v76, v102);
        v81 = v103;
      }
      else
      {
LABEL_85:
        v90 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1004, 0);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v90 + 16))(v90, v81);
      }

      goto LABEL_80;
    }
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_56:

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setValue:forProperty:](v4, "setValue:forProperty:", v49, v100);

      goto LABEL_57;
    }
    v93 = v2;
    v94 = v7;
    v92 = *(_QWORD *)(a1 + 40);
    v24 = objc_msgSend(*(id *)(a1 + 32), "traits");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
    if ((v24 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adm"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v26);

    }
    if ((v24 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossless"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v27);

    }
    if ((v24 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("high-res lossless"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v28);

    }
    if ((v24 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spatial"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v29);

    }
    if ((v24 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("atmos"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v30);

    }
    if ((v24 & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("surround"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v31);

    }
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = CFSTR("None");
    }

    v91 = v32;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
    if (((2 * (_BYTE)v3) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossless"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

    }
    if (((4 * (_BYTE)v3) & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("high-res lossless"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v35);

    }
    v2 = v93;
    if (((4 * v3) & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spatial"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v36);

    }
    if ((v3 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("atmos"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v37);

    }
    if ((v3 & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("surround"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v38);

    }
    v7 = v94;
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = CFSTR("None");
    }

    v40 = v39;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
    if ((v95 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossy stereo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v44);

      v7 = v94;
      if ((v95 & 4) == 0)
      {
LABEL_41:
        if ((v95 & 0x10) == 0)
          goto LABEL_42;
        goto LABEL_50;
      }
    }
    else if ((v95 & 4) == 0)
    {
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossless"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v45);

    v7 = v94;
    if ((v95 & 0x10) == 0)
    {
LABEL_42:
      if ((v95 & 0x20) == 0)
        goto LABEL_43;
      goto LABEL_51;
    }
LABEL_50:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("high-res lossless"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v46);

    v7 = v94;
    if ((v95 & 0x20) == 0)
    {
LABEL_43:
      if ((v95 & 1) == 0)
        goto LABEL_44;
      goto LABEL_52;
    }
LABEL_51:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spatial"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v47);

    v7 = v94;
    if ((v95 & 1) == 0)
    {
LABEL_44:
      if ((v95 & 2) == 0)
      {
LABEL_46:
        if (objc_msgSend(v41, "count"))
        {
          objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = CFSTR("None");
        }

        *(_DWORD *)buf = 138544130;
        v105 = v92;
        v106 = 2114;
        v107 = v91;
        v108 = 2114;
        v109 = v40;
        v110 = 2114;
        v111 = v43;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: File traits translation from MPFileAsset to MPMediaItem: %{public}@ -> %{public}@ - Existing file traits: %{public}@", buf, 0x2Au);

        goto LABEL_56;
      }
LABEL_45:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("surround"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v42);

      goto LABEL_46;
    }
LABEL_52:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("atmos"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v48);

    v7 = v94;
    if ((v95 & 2) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
  v18 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1006, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_81:
}

void __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "persistentID");

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    v9 = a1[5];
    v10 = (void *)MEMORY[0x24BDD1540];
    if (v5)
    {
      v13 = *MEMORY[0x24BDD1398];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("MPCMediaLibraryPlaybackAssetCacheProviderErrorDomain"), -1003, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

    if (v5)
  }

}

uint64_t __115__MPCMediaLibraryPlaybackAssetCacheProvider_setPlaybackAssetCacheFileAsset_forGenericObject_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __116__MPCMediaLibraryPlaybackAssetCacheProvider_clearPlaybackAssetCacheFileAssetForGenericObject_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)_highQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ml3Library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "pathForResourceFileOrFolder:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) == 0)
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  return v7;
}

+ (id)_lowQualityCachedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ml3Library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "pathForResourceFileOrFolder:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) == 0)
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  return v7;
}

+ (id)_downloadedAssetDestinationDirectoryForMediaLibrary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ml3Library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "pathForResourceFileOrFolder:", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) == 0)
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  return v7;
}

@end
