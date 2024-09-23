@implementation HFCameraClipVideoAssetOperationCache

- (HFCameraClipVideoAssetOperationCache)init
{
  HFCameraClipVideoAssetOperationCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  unint64_t v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *markerInfo;
  uint64_t v9;
  HFCameraClipVideoAssetOperationMarker *head;
  uint64_t v11;
  HFCameraClipVideoAssetOperationMarker *tail;
  NSObject *v13;
  unint64_t maxSize;
  objc_super v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HFCameraClipVideoAssetOperationCache;
  v2 = -[HFCameraClipVideoAssetOperationCache init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Home.cameraClipVideoAssetOperationCacheQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = -[HFCameraClipVideoAssetOperationCache cacheSizeForDevice](v2, "cacheSizeForDevice");
    v6 = 3;
    if (v5 > 3)
      v6 = v5;
    v2->_maxSize = v6;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    markerInfo = v2->_markerInfo;
    v2->_markerInfo = v7;

    +[HFCameraClipVideoAssetOperationMarker sentinelWithKey:](HFCameraClipVideoAssetOperationMarker, "sentinelWithKey:", CFSTR("HEAD"));
    v9 = objc_claimAutoreleasedReturnValue();
    head = v2->_head;
    v2->_head = (HFCameraClipVideoAssetOperationMarker *)v9;

    +[HFCameraClipVideoAssetOperationMarker sentinelWithKey:](HFCameraClipVideoAssetOperationMarker, "sentinelWithKey:", CFSTR("TAIL"));
    v11 = objc_claimAutoreleasedReturnValue();
    tail = v2->_tail;
    v2->_tail = (HFCameraClipVideoAssetOperationMarker *)v11;

    -[HFCameraClipVideoAssetOperationCache resetSentinels](v2, "resetSentinels");
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      maxSize = v2->_maxSize;
      *(_DWORD *)buf = 134217984;
      v18 = maxSize;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Init video asset cache with size:%lu", buf, 0xCu);
    }

  }
  return v2;
}

- (unint64_t)cacheSizeForDevice
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v4;
  else
    v8 = v7;
  return (unint64_t)(v8 / 88.0);
}

+ (double)defaultFrameSize
{
  return 88.0;
}

- (void)pointHeadAtMarker:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "previous");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipVideoAssetOperationCache head](self, "head");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v17, "next");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previous");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipVideoAssetOperationCache head](self, "head");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "next");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraClipVideoAssetOperationCache head](self, "head");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "next");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNext:", v12);

    -[HFCameraClipVideoAssetOperationCache head](self, "head");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrevious:", v13);

    -[HFCameraClipVideoAssetOperationCache head](self, "head");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNext:", v17);

    objc_msgSend(v10, "setPrevious:", v17);
    objc_msgSend(v17, "next");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNext:", v15);

    objc_msgSend(v17, "previous");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrevious:", v16);

  }
}

- (id)operationForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  v19 = 0;
  -[HFCameraClipVideoAssetOperationCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HFCameraClipVideoAssetOperationCache_operationForKey___block_invoke;
  block[3] = &unk_1EA72B020;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (v7)
  {
    objc_msgSend(v7, "operation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0x15uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "No videoAssetContext fetch operation in progress for key:%@", buf, 0xCu);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __56__HFCameraClipVideoAssetOperationCache_operationForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "markerInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pointHeadAtMarker:");
    HFLogForCategory(0x15uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "VideoAssetContext fetch operation in progress for key:%@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraClipVideoAssetOperationCache _addOperation:forClip:usingKey:](self, "_addOperation:forClip:usingKey:", v8, v9, v10);
  }
  else
  {
    -[HFCameraClipVideoAssetOperationCache workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__HFCameraClipVideoAssetOperationCache_addOperation_forClip_usingKey___block_invoke;
    v12[3] = &unk_1EA7271B0;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(v11, v12);

  }
}

uint64_t __70__HFCameraClipVideoAssetOperationCache_addOperation_forClip_usingKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOperation:forClip:usingKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HFCameraClipVideoAssetOperationMarker *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (HFCameraClipVideoAssetOperationMarker *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[HFCameraClipVideoAssetOperationMarker key](v12, "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v14;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Logic error. Attempting to add VideoAssetContext fetch operation that is already in progress for key:%@. The imageManager should have blocked this.", buf, 0xCu);

    }
LABEL_19:

    goto LABEL_20;
  }
  v12 = -[HFCameraClipVideoAssetOperationMarker initWithCameraClip:operation:key:]([HFCameraClipVideoAssetOperationMarker alloc], "initWithCameraClip:operation:key:", v9, v8, v10);
  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v10);

  -[HFCameraClipVideoAssetOperationCache pointHeadAtMarker:](self, "pointHeadAtMarker:", v12);
  -[HFCameraClipVideoAssetOperationCache setCount:](self, "setCount:", -[HFCameraClipVideoAssetOperationCache count](self, "count") + 1);
  HFLogForCategory(0x15uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v10;
    v38 = 2048;
    v39 = -[HFCameraClipVideoAssetOperationCache count](self, "count");
    _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Add VideoAssetContext fetch operation for key:%@ with operation count:%lu.", buf, 0x16u);
  }

  v17 = -[HFCameraClipVideoAssetOperationCache count](self, "count");
  if (v17 >= -[HFCameraClipVideoAssetOperationCache maxSize](self, "maxSize"))
  {
    -[HFCameraClipVideoAssetOperationCache tail](self, "tail");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previous");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraClipVideoAssetOperationCache _removeOperationForKey:](self, "_removeOperationForKey:", v20);

  }
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v33 = v10;
    v34 = v9;
    v35 = v8;
    -[HFCameraClipVideoAssetOperationCache head](self, "head");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x15uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "--List of markers:", buf, 2u);
    }

    if (v21)
    {
      v23 = 0;
      do
      {
        HFLogForCategory(0x15uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v21, "key");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "previous");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "key");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "next");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "key");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v37 = v25;
          v38 = 2112;
          v39 = (unint64_t)v27;
          v40 = 2112;
          v41 = v29;
          v42 = 2048;
          v43 = v23;
          _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "-----UUID:%@ prev:%@ next:%@ index:%lu", buf, 0x2Au);

        }
        objc_msgSend(v21, "next");
        v30 = objc_claimAutoreleasedReturnValue();

        ++v23;
        v21 = (void *)v30;
      }
      while (v30);
    }
    HFLogForCategory(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v32;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Keys= %@", buf, 0xCu);

    }
    v9 = v34;
    v8 = v35;
    v10 = v33;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_removeOperationForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x15uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "operation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v8;
    v19 = 1024;
    v20 = objc_msgSend(v9, "isExecuting");
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Evict marker:%@ Executing:%{BOOL}d.", (uint8_t *)&v17, 0x12u);

  }
  objc_msgSend(v6, "operation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExecuting");

  if (v11)
  {
    objc_msgSend(v6, "operation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancel");

  }
  -[HFCameraClipVideoAssetOperationCache removeMarker:](self, "removeMarker:", v6);
  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v4);

  -[HFCameraClipVideoAssetOperationCache setCount:](self, "setCount:", -[HFCameraClipVideoAssetOperationCache count](self, "count") - 1);
  HFLogForCategory(0x15uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Remaining marker keys= %@", (uint8_t *)&v17, 0xCu);

  }
}

- (void)removeOperationForKey:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraClipVideoAssetOperationCache _removeOperationForKey:](self, "_removeOperationForKey:", v4);
  }
  else
  {
    -[HFCameraClipVideoAssetOperationCache workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__HFCameraClipVideoAssetOperationCache_removeOperationForKey___block_invoke;
    v6[3] = &unk_1EA727188;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __62__HFCameraClipVideoAssetOperationCache_removeOperationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeOperationForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeMarker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "previous");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "next");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrevious:", v4);

  objc_msgSend(v3, "next");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previous");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNext:", v7);
}

- (void)resetSentinels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HFCameraClipVideoAssetOperationCache tail](self, "tail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipVideoAssetOperationCache head](self, "head");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNext:", v3);

  -[HFCameraClipVideoAssetOperationCache head](self, "head");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipVideoAssetOperationCache tail](self, "tail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrevious:", v6);

}

- (void)purge
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  HFLogForCategory(0x15uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Purging VideoAssetOperationCache.", buf, 2u);
  }

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraClipVideoAssetOperationCache _purge](self, "_purge");
  }
  else
  {
    -[HFCameraClipVideoAssetOperationCache workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HFCameraClipVideoAssetOperationCache_purge__block_invoke;
    block[3] = &unk_1EA727DD8;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __45__HFCameraClipVideoAssetOperationCache_purge__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purge");
}

- (void)_purge
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_150);

  -[HFCameraClipVideoAssetOperationCache markerInfo](self, "markerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HFCameraClipVideoAssetOperationCache resetSentinels](self, "resetSentinels");
  -[HFCameraClipVideoAssetOperationCache setCount:](self, "setCount:", 0);
}

void __46__HFCameraClipVideoAssetOperationCache__purge__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "operation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (HFCameraClipVideoAssetOperationMarker)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->_head, a3);
}

- (HFCameraClipVideoAssetOperationMarker)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->_tail, a3);
}

- (NSMutableDictionary)markerInfo
{
  return self->_markerInfo;
}

- (void)setMarkerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_markerInfo, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_markerInfo, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end
