@implementation PKDrawingOverlayCache

+ (id)sharedCache
{
  if (_MergedGlobals_136 != -1)
    dispatch_once(&_MergedGlobals_136, &__block_literal_global_52);
  return (id)qword_1ECEE6298;
}

void __36__PKDrawingOverlayCache_sharedCache__block_invoke()
{
  PKDrawingOverlayCache *v0;
  void *v1;

  v0 = objc_alloc_init(PKDrawingOverlayCache);
  v1 = (void *)qword_1ECEE6298;
  qword_1ECEE6298 = (uint64_t)v0;

}

- (PKDrawingOverlayCache)init
{
  PKDrawingOverlayCache *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  NSCache *v7;
  NSCache *memoryCache;
  void *v9;
  void *v10;
  char v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKDrawingOverlayCache;
  v2 = -[PKDrawingOverlayCache init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.pencilkit.overlaydrawingqueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = v7;

    -[NSCache setCountLimit:](v2->_memoryCache, "setCountLimit:", 4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingOverlayCache cacheDirectory]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v18);
    v12 = v18;

    v13 = os_log_create("com.apple.pencilkit", "Math");
    v14 = v13;
    if ((v11 & 1) != 0)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PKDrawingOverlayCache cacheDirectory]();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Create drawing overlay cache directory at: %@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Error creating cache directory", buf, 2u);
    }

  }
  return v2;
}

- (id)cacheDirectory
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E98];
  v6[0] = v1;
  v6[1] = CFSTR("com.apple.pencilkit.overlaydrawings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cachePathForDrawingUUID:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a2, "uniqueCacheFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR(".drawing"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99E98];
      v10[0] = v4;
      v10[1] = CFSTR("com.apple.pencilkit.overlaydrawings");
      v10[2] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURLWithPathComponents:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (void)overlayDrawingForDrawingUUID:(id)a3 tintColor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *accessQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "uniqueCacheFilePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingOverlayCache cachePathForDrawingUUID:]((uint64_t)self, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AES128Key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKDrawingOverlayCache_overlayDrawingForDrawingUUID_tintColor_completion___block_invoke;
  block[3] = &unk_1E777B240;
  block[4] = self;
  v23 = v11;
  v24 = v13;
  v25 = v12;
  v26 = v14;
  v27 = v8;
  v28 = v9;
  v16 = v9;
  v17 = v8;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  v21 = v11;
  dispatch_async(accessQueue, block);

}

void __75__PKDrawingOverlayCache_overlayDrawingForDrawingUUID_tintColor_completion___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  PKDrawingConcrete *v4;
  void *v5;
  void *v6;
  void *v7;
  PKDrawingConcrete *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v1 = a1;
  v47 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 8);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", v1[5]);
  v4 = (PKDrawingConcrete *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!v1[6]
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "fileExistsAtPath:", v1[6]),
          v21,
          !v22))
    {
      v4 = 0;
      goto LABEL_24;
    }
    v23 = (void *)v1[7];
    v24 = (void *)v1[8];
    v39 = 0;
    +[PKDataEncryption decryptFile:key:error:]((uint64_t)PKDataEncryption, v23, v24, (uint64_t)&v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v39;
    if (v25)
    {
      v4 = -[PKDrawingConcrete initWithData:error:]([PKDrawingConcrete alloc], "initWithData:error:", v25, 0);
      v27 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v1[5];
        v29 = objc_msgSend(v25, "length");
        -[PKDrawing strokes](v4, "strokes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 138412802;
        v42 = v28;
        v43 = 2048;
        v44 = v29;
        v45 = 2048;
        v46 = v31;
        _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "Loaded overlay cache for: %@ (%lu) => %lu", buf, 0x20u);

      }
    }
    else
    {
      v27 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v1[5];
        *(_DWORD *)buf = 138412546;
        v42 = v32;
        v43 = 2112;
        v44 = (uint64_t)v26;
        _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "Failed to load overlay cache for: %@ %@", buf, 0x16u);
      }
      v4 = 0;
    }

  }
  if (v1[9] && v4)
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    -[PKDrawing strokes](v4, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v4;
    -[PKDrawing strokes](v4, "strokes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v13, "ink");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v1;
          +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v14, v1[9]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_alloc(-[PKDrawingConcrete strokeClass](v8, "strokeClass"));
          objc_msgSend(v13, "_strokeData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v13, "transform");
          else
            memset(v34, 0, sizeof(v34));
          objc_msgSend(v13, "mask");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithInk:strokePath:transform:mask:", v16, v18, v34, v19);

          objc_msgSend(v7, "addObject:", v20);
          v1 = v15;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    v4 = (PKDrawingConcrete *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v7, v8);
  }
LABEL_24:
  (*(void (**)(void))(v1[10] + 16))();

}

- (void)setOverlayDrawing:(void *)a3 forDrawingUUID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "uniqueCacheFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingOverlayCache cachePathForDrawingUUID:](a1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "copy");

    v11 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKDrawingOverlayCache_setOverlayDrawing_forDrawingUUID___block_invoke;
    block[3] = &unk_1E777B268;
    v5 = v10;
    v15 = v5;
    v16 = a1;
    v17 = v8;
    v18 = v7;
    v19 = v9;
    v12 = v9;
    v13 = v8;
    dispatch_async(v11, block);

  }
}

void __58__PKDrawingOverlayCache_setOverlayDrawing_forDrawingUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v2)
      v3 = *(void **)(v2 + 8);
    else
      v3 = 0;
    objc_msgSend(v3, "setObject:forKey:");
  }
  else
  {
    if (v2)
      v4 = *(void **)(v2 + 8);
    else
      v4 = 0;
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "serializeTransiently");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 56), "AES128Key");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = +[PKDataEncryption encryptData:to:key:error:]((uint64_t)PKDataEncryption, v6, *(void **)(a1 + 64), v7, 0);
    v9 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "strokes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "count");
      v25 = 1024;
      v26 = v8;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Updated overlay cache for: %@, %lu => %{BOOL}d", buf, 0x1Cu);

    }
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if (!v14)
    goto LABEL_17;
  v15 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v22 = v16;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Deleting overlay cache for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 64);
  v20 = 0;
  objc_msgSend(v17, "removeItemAtURL:error:", v18, &v20);
  v7 = v20;

  if (v7)
  {
    v9 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "Unable to delete overlay cache for: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
}

- (void)clearMemoryCache
{
  if (self)
    self = (PKDrawingOverlayCache *)self->_memoryCache;
  -[PKDrawingOverlayCache removeAllObjects](self, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end
