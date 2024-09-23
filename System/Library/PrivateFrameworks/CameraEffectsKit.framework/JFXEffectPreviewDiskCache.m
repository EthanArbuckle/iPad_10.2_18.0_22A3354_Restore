@implementation JFXEffectPreviewDiskCache

- (JFXEffectPreviewDiskCache)initWithDirectory:(id)a3
{
  id v5;
  JFXEffectPreviewDiskCache *v6;
  JFXEffectPreviewDiskCache *v7;
  uint64_t v8;
  NSOperationQueue *diskAccessQueue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectPreviewDiskCache;
  v6 = -[JFXEffectPreviewDiskCache init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryName, a3);
    v8 = objc_opt_new();
    diskAccessQueue = v7->_diskAccessQueue;
    v7->_diskAccessQueue = (NSOperationQueue *)v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JFXEffectPreviewDiskCache.%@.diskAccessQ"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v7->_diskAccessQueue, "setName:", v10);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_diskAccessQueue, "setMaxConcurrentOperationCount:", 3);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[JFXEffectPreviewDiskCache diskAccessQueue](self, "diskAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)JFXEffectPreviewDiskCache;
  -[JFXEffectPreviewDiskCache dealloc](&v4, sel_dealloc);
}

- (NSString)cacheDirectoryPath
{
  NSString *cacheDirectoryPath;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  cacheDirectoryPath = self->_cacheDirectoryPath;
  if (!cacheDirectoryPath)
  {
    v4 = (void *)objc_opt_class();
    -[JFXEffectPreviewDiskCache directoryName](self, "directoryName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createCacheAtDirectory:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cacheDirectoryPath;
    self->_cacheDirectoryPath = v6;

    cacheDirectoryPath = self->_cacheDirectoryPath;
  }
  return cacheDirectoryPath;
}

- (void)previewForEffectID:(id)a3 version:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  JFXEffectPreviewDiskCache *v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_initWeak(&location, v11);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __67__JFXEffectPreviewDiskCache_previewForEffectID_version_completion___block_invoke;
  v19 = &unk_24EE5C330;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = self;
  v14 = v10;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v11, "addExecutionBlock:", &v16);
  objc_msgSend(v11, "setQualityOfService:", 25, v16, v17, v18, v19);
  -[JFXEffectPreviewDiskCache diskAccessQueue](self, "diskAccessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v11);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __67__JFXEffectPreviewDiskCache_previewForEffectID_version_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  void *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "cacheDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectPreviewDiskCache cachedPathForEffect:version:directoryPath:](JFXEffectPreviewDiskCache, "cachedPathForEffect:version:directoryPath:", v2, v3, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14
    && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "fileExistsAtPath:", v14),
        v5,
        (v6 & 1) != 0)
    && (v7 = objc_loadWeakRetained((id *)(a1 + 64)), v8 = objc_msgSend(v7, "isCancelled"), v7, !v8))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", v14);
    if (v9
      && (WeakRetained = objc_loadWeakRetained((id *)(a1 + 64)),
          v11 = objc_msgSend(WeakRetained, "isCancelled"),
          WeakRetained,
          !v11))
    {
      v12 = *(_QWORD *)(a1 + 56);
      +[JTImage jtImageWithUIImage:](JTImage, "jtImageWithUIImage:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)savePreviewForEffectID:(id)a3 image:(id)a4 version:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_initWeak(&location, v14);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__JFXEffectPreviewDiskCache_savePreviewForEffectID_image_version_completion___block_invoke;
  v20[3] = &unk_24EE5C358;
  v20[4] = self;
  v15 = v13;
  v24 = v15;
  v16 = v10;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v18 = v11;
  v23 = v18;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v14, "addExecutionBlock:", v20);
  objc_msgSend(v14, "setQualityOfService:", 17);
  -[JFXEffectPreviewDiskCache diskAccessQueue](self, "diskAccessQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v14);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __77__JFXEffectPreviewDiskCache_savePreviewForEffectID_image_version_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  UIImage *v8;
  void *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((v4 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXEffectPreviewDiskCache cachedPathForEffect:version:directoryPath:](JFXEffectPreviewDiskCache, "cachedPathForEffect:version:directoryPath:", v6, v5, v7);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 56), "image");
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v11 = objc_msgSend(WeakRetained, "isCancelled");

      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 64);
        if (v12)
          (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
      }
      else
      {
        v15 = objc_msgSend(v9, "writeToFile:atomically:", v17, 1);
        v16 = *(_QWORD *)(a1 + 64);
        if (v16)
          (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v15);
        if ((_DWORD)v15)
          objc_msgSend(*(id *)(a1 + 32), "removePreviewForEffectID:excludingVersion:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
      }

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 64);
      if (v14)
        (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
}

- (void)removePreviewForEffectID:(id)a3 excludingVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  JFXEffectPreviewDiskCache *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_initWeak(&location, v11);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __82__JFXEffectPreviewDiskCache_removePreviewForEffectID_excludingVersion_completion___block_invoke;
  v19 = &unk_24EE5C380;
  v20 = self;
  v12 = v10;
  v23 = v12;
  v13 = v8;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v11, "addExecutionBlock:", &v16);
  objc_msgSend(v11, "setQualityOfService:", 17, v16, v17, v18, v19, v20);
  -[JFXEffectPreviewDiskCache diskAccessQueue](self, "diskAccessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v11);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __82__JFXEffectPreviewDiskCache_removePreviewForEffectID_excludingVersion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF beginswith %@) AND (SELF contains %@)"), *(_QWORD *)(a1 + 40), v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    objc_msgSend(v8, "filteredArrayUsingPredicate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@.png"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isEqualToString:", v10) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByAppendingPathComponent:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeItemAtPath:error:", v18, 0);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v21 = objc_msgSend(WeakRetained, "isCancelled");

    v22 = *(_QWORD *)(a1 + 56);
    if (v22)
      (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, v21 ^ 1u);

  }
  else
  {
    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
      (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, 0);
  }
}

- (id)cachedURLForEffect:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  JFXEffectPreviewDiskCache *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__27;
  v27 = __Block_byref_object_dispose__27;
  v28 = 0;
  v8 = (void *)MEMORY[0x24BDD1478];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __56__JFXEffectPreviewDiskCache_cachedURLForEffect_version___block_invoke;
  v18 = &unk_24EE5C3A8;
  v19 = self;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  v22 = &v23;
  objc_msgSend(v8, "blockOperationWithBlock:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQualityOfService:", 25, v15, v16, v17, v18, v19);
  objc_msgSend(v11, "setQueuePriority:", 8);
  -[JFXEffectPreviewDiskCache diskAccessQueue](self, "diskAccessQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

  objc_msgSend(v11, "waitUntilFinished");
  v13 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __56__JFXEffectPreviewDiskCache_cachedURLForEffect_version___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "cacheDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPathForEffect:version:directoryPath:", v4, v3, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
  }

}

+ (id)cachedPathForEffect:(id)a3 version:(id)a4 directoryPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@.png"), v7, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF beginswith %@) AND (SELF contains %@)"), v7, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v9, "stringByAppendingPathComponent:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (id)createCacheAtDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("purgePickerCacheOnLoad"));
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v3, "stringByAppendingString:", CFSTR("buildNumberKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 <= objc_msgSend(v9, "integerForKey:", v14) && !v10)
    {

LABEL_7:
      v22 = v6;
      goto LABEL_8;
    }
    objc_msgSend(v9, "setInteger:forKey:", v13, v14);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v6, 0);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v3, "stringByAppendingString:", CFSTR("buildNumberKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInteger:forKey:", v18, v19);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  v22 = 0;
  if ((_DWORD)v18)
    goto LABEL_7;
LABEL_8:

  return v22;
}

- (NSString)directoryName
{
  return self->_directoryName;
}

- (NSOperationQueue)diskAccessQueue
{
  return self->_diskAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
  objc_storeStrong((id *)&self->_directoryName, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
}

@end
