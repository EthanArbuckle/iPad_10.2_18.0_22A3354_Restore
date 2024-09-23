@implementation HFCameraVideoCache

- (HFCameraVideoCache)initWithVideoDownloader:(id)a3
{
  id v5;
  HFCameraVideoCache *v6;
  HFCameraVideoCache *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  void *v13;
  void *v14;
  double v15;
  HFDiskCache *v16;
  void *v17;
  uint64_t v18;
  HFDiskCache *diskCache;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HFCameraVideoCache;
  v6 = -[HFCameraVideoCache init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoDownloader, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.Home.HFCameraVideoCache.workQueue", v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 5);
    +[HFCameraUtilities overrideVideoCacheDurationLimit](HFCameraUtilities, "overrideVideoCacheDurationLimit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "doubleValue");
    else
      v15 = 120.0;
    v7->_cacheDurationLimit = v15;
    v7->_expensiveNetworkCacheDurationLimit = (double)((int)(v15 * 0.5) & ~((int)(v15 * 0.5) >> 31));
    v16 = [HFDiskCache alloc];
    +[HFCameraUtilities videoCachesDirectoryURL](HFCameraUtilities, "videoCachesDirectoryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HFDiskCache initWithCacheDirectoryURL:diskCacheDelegate:](v16, "initWithCacheDirectoryURL:diskCacheDelegate:", v17, v7);
    diskCache = v7->_diskCache;
    v7->_diskCache = (HFDiskCache *)v18;

    +[HFCameraUtilities overrideVideoDiskCacheLimit](HFCameraUtilities, "overrideVideoDiskCacheLimit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      -[HFCache setTotalCostLimit:](v7->_diskCache, "setTotalCostLimit:", objc_msgSend(v20, "unsignedLongValue"));
    }
    else
    {
      -[HFCache setTotalCostLimit:](v7->_diskCache, "setTotalCostLimit:", 150000000);
      -[HFCameraVideoCache limitDiskCacheToPercentageofAvailableDiskSpace:](v7, "limitDiskCacheToPercentageofAvailableDiskSpace:", 25);
    }
    +[HFNetworkMonitor sharedInstance](HFNetworkMonitor, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[HFNetworkMonitor sharedInstance](HFNetworkMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HFCameraVideoCache waitForOperations](self, "waitForOperations");
  v4.receiver = self;
  v4.super_class = (Class)HFCameraVideoCache;
  -[HFCameraVideoCache dealloc](&v4, sel_dealloc);
}

- (void)waitForOperations
{
  id v3;

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache operationQueue](self, "operationQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "waitUntilAllOperationsAreFinished");

  }
}

- (void)cacheClip:(id)a3 inClips:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache _cacheClip:inClips:](self, "_cacheClip:inClips:", v6, v7);
  }
  else
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HFCameraVideoCache_cacheClip_inClips___block_invoke;
    block[3] = &unk_1EA7270A0;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __40__HFCameraVideoCache_cacheClip_inClips___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheClip:inClips:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_cacheClip:(id)a3 inClips:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[4];

  v7 = a3;
  v8 = a4;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoCache.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryClip != nil"));

  }
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoCache.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clips.count > 0"));

  }
  v10 = objc_msgSend(v8, "indexOfObject:", v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_prettyDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_prettyDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoCache.m"), 120, CFSTR("clip: %@ is not in clips: %@"), v16, v17);

  }
  -[HFCameraVideoCache operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_each:", &__block_literal_global_39);

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__HFCameraVideoCache__cacheClip_inClips___block_invoke_2;
  v18[3] = &unk_1EA72B1F0;
  v18[4] = self;
  v18[5] = v19;
  v18[6] = v10;
  objc_msgSend(v8, "hf_fanOutAtIndex:usingBlock:", v10, v18);
  _Block_object_dispose(v19, 8);

}

uint64_t __41__HFCameraVideoCache__cacheClip_inClips___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setQualityOfService:", -8);
}

void __41__HFCameraVideoCache__cacheClip_inClips___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  BOOL v33;
  double v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if ((objc_msgSend(v7, "isComplete") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "diskCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "duration");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
      HFLogForCategory(0xDuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v10, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = v13;
        v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "[SKIPPED] video exists; clip: %@; path: %@",
          (uint8_t *)&v37,
          0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_notifyVideoExistsForClip:atURL:", v7, v10);
      goto LABEL_36;
    }
    v16 = *(_QWORD *)(a1 + 48);
    v17 = -4;
    if (v16 + 1 == a3)
      v17 = 0;
    if (v16 - 1 == a3)
      v18 = 4;
    else
      v18 = v17;
    if (v16 == a3)
      v19 = 8;
    else
      v19 = v18;
    objc_msgSend(*(id *)(a1 + 32), "_existingDownloadOperationForClip:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      HFLogForCategory(0xDuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412290;
        v38 = v22;
        _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "[SKIPPED] download operation exists; clip: %@",
          (uint8_t *)&v37,
          0xCu);

      }
      objc_msgSend(v20, "setQueuePriority:", v19);
      goto LABEL_29;
    }
    +[HFNetworkMonitor sharedInstance](HFNetworkMonitor, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isNetworkExpensive");
    v25 = *(void **)(a1 + 32);
    if (v24)
      objc_msgSend(v25, "_expensiveNetworkCacheDurationLimit");
    else
      objc_msgSend(v25, "_cacheDurationLimit");
    v27 = v26;

    v28 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v7, "duration");
    v30 = v28 + v29;
    v31 = v30 <= v27;
    v32 = vabdd_f64(v30, v27);
    v33 = v31 || v32 < 2.22044605e-16;
    if (v33 || (v32 = fabs(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)), v32 < 2.22044605e-16))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_queueVideoDownloadForClip:priority:", v7, v19, v32) & 1) != 0)
      {
LABEL_29:
        objc_msgSend(v7, "duration");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v34
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 24);
LABEL_35:

        v10 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      HFLogForCategory(0xDuLL);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "hf_prettyDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412290;
        v38 = v36;
        _os_log_impl(&dword_1DD34E000, v35, OS_LOG_TYPE_DEFAULT, "[SKIPPED] clip duration takes us over the limit; clip: %@",
          (uint8_t *)&v37,
          0xCu);

      }
    }
    *a4 = 1;
    goto LABEL_35;
  }
  HFLogForCategory(0xDuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "hf_prettyDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412290;
    v38 = v15;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "[SKIPPED] incomplete clip: %@", (uint8_t *)&v37, 0xCu);

  }
LABEL_36:

}

- (void)cacheClip:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache _cacheClip:](self, "_cacheClip:", v4);
  }
  else
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__HFCameraVideoCache_cacheClip___block_invoke;
    v7[3] = &unk_1EA727188;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __32__HFCameraVideoCache_cacheClip___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheClip:", *(_QWORD *)(a1 + 40));
}

- (void)_cacheClip:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoCache.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clip != nil"));

  }
  if ((objc_msgSend(v5, "isComplete") & 1) != 0)
  {
    -[HFCameraVideoCache diskCache](self, "diskCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      HFLogForCategory(0xDuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "hf_prettyDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v9, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "[SKIPPED] video exists; clip: %@; path: %@",
          buf,
          0x16u);

      }
      -[HFCameraVideoCache _notifyVideoExistsForClip:atURL:](self, "_notifyVideoExistsForClip:atURL:", v5, v9);
    }
    else
    {
      -[HFCameraVideoCache _existingDownloadOperationForClip:](self, "_existingDownloadOperationForClip:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        HFLogForCategory(0xDuLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "hf_prettyDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v19 = v16;
          _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "[SKIPPED] download operation exists; clip: %@",
            buf,
            0xCu);

        }
        objc_msgSend(v14, "setQueuePriority:", 8);
      }
      else
      {
        -[HFCameraVideoCache _queueVideoDownloadForClip:priority:](self, "_queueVideoDownloadForClip:priority:", v5, 4);
      }

      v9 = 0;
    }
  }
  else
  {
    HFLogForCategory(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "hf_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "[SKIPPED] incomplete clip: %@", buf, 0xCu);

    }
  }

}

- (id)_existingDownloadOperationForClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFCameraVideoCache operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HFCameraVideoCache__existingDownloadOperationForClip___block_invoke;
  v10[3] = &unk_1EA72B218;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__HFCameraVideoCache__existingDownloadOperationForClip___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)_queueVideoDownloadForClip:(id)a3 priority:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "hf_size");
  -[HFCameraVideoCache diskCache](self, "diskCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canAccommodateCost:", v7);

  if ((v9 & 1) != 0)
  {
    -[HFCameraVideoCache diskCache](self, "diskCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsToAccommodateCost:", v7);

    -[HFCameraVideoCache videoDownloader](self, "videoDownloader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downloadOperationForClip:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject setQueuePriority:](v12, "setQueuePriority:", a4);
    -[NSObject setDelegate:](v12, "setDelegate:", self);
    HFLogForCategory(0xDuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "hf_prettyDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject destinationURL](v12, "destinationURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "[QUEUED] download operation for clip: %@; destination: %@",
        (uint8_t *)&v19,
        0x16u);

    }
    -[HFCameraVideoCache operationQueue](self, "operationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOperation:", v12);
    goto LABEL_7;
  }
  HFLogForCategory(0xDuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v17;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "[SKIPPED] disk cache cannot accommodate clip size: %@", (uint8_t *)&v19, 0xCu);
LABEL_7:

  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache _setDelegate:](self, "_setDelegate:", v4);
  }
  else
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__HFCameraVideoCache_setDelegate___block_invoke;
    v7[3] = &unk_1EA727188;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __34__HFCameraVideoCache_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)_setDelegate:(id)a3
{
  NSObject *v5;
  HFCameraVideoCacheDelegate **p_delegate;
  HFCameraVideoCacheDelegate *delegate;
  id v8;

  v8 = a3;
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if ((-[HFCameraVideoCacheDelegate isEqual:](delegate, "isEqual:", v8) & 1) == 0)
    objc_storeStrong((id *)p_delegate, a3);

}

- (HFCameraVideoCacheDelegate)delegate
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__HFCameraVideoCache_delegate__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HFCameraVideoCacheDelegate *)v5;
}

void __30__HFCameraVideoCache_delegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_delegate
{
  NSObject *v3;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  return self->_delegate;
}

- (void)setDiskCacheLimit:(unint64_t)a3
{
  id v4;

  -[HFCameraVideoCache diskCache](self, "diskCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalCostLimit:", a3);

}

- (unint64_t)diskCacheLimit
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HFCameraVideoCache_diskCacheLimit__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __36__HFCameraVideoCache_diskCacheLimit__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "diskCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "totalCostLimit");

}

- (void)setCacheDurationLimit:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache _setCacheDurationLimit:](self, "_setCacheDurationLimit:", a3);
  }
  else
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__HFCameraVideoCache_setCacheDurationLimit___block_invoke;
    v7[3] = &unk_1EA72B268;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(v6, v7);

  }
}

uint64_t __44__HFCameraVideoCache_setCacheDurationLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCacheDurationLimit:", *(double *)(a1 + 40));
}

- (void)_setCacheDurationLimit:(double)a3
{
  NSObject *v5;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  if (vabdd_f64(self->_cacheDurationLimit, a3) >= 2.22044605e-16)
  {
    self->_cacheDurationLimit = a3;
    self->_expensiveNetworkCacheDurationLimit = (double)((int)(a3 * 0.5) & ~((int)(a3 * 0.5) >> 31));
  }
}

- (double)cacheDurationLimit
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HFCameraVideoCache_cacheDurationLimit__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __40__HFCameraVideoCache_cacheDurationLimit__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_cacheDurationLimit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_cacheDurationLimit
{
  NSObject *v3;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  return self->_cacheDurationLimit;
}

- (double)expensiveNetworkCacheDurationLimit
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCameraVideoCache workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HFCameraVideoCache_expensiveNetworkCacheDurationLimit__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __56__HFCameraVideoCache_expensiveNetworkCacheDurationLimit__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_expensiveNetworkCacheDurationLimit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_expensiveNetworkCacheDurationLimit
{
  NSObject *v3;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

  }
  return self->_expensiveNetworkCacheDurationLimit;
}

- (void)limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  -[HFCameraVideoCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache _limitDiskCacheToPercentageofAvailableDiskSpace:](self, "_limitDiskCacheToPercentageofAvailableDiskSpace:", a3);
  }
  else
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__HFCameraVideoCache_limitDiskCacheToPercentageofAvailableDiskSpace___block_invoke;
    v7[3] = &unk_1EA72B268;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(v6, v7);

  }
}

uint64_t __69__HFCameraVideoCache_limitDiskCacheToPercentageofAvailableDiskSpace___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_limitDiskCacheToPercentageofAvailableDiskSpace:", *(_QWORD *)(a1 + 40));
}

- (void)_limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  double v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraVideoCache workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

  }
  if (a3 >= 0x65)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoCache.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("percentageOfAvailableDiskSpace <= 100"));

  }
  +[HFCameraUtilities videoCachesDirectoryURL](HFCameraUtilities, "videoCachesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v8 = *MEMORY[0x1E0C99BB0];
  v21 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v22, v8, &v21);
  v10 = v22;
  v11 = v21;

  if (!v9)
  {
    HFLogForCategory(0xDuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[HFCameraVideoCache _limitDiskCacheToPercentageofAvailableDiskSpace:]";
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v10, "doubleValue");
  v13 = vcvtmd_u64_f64((double)a3 / 100.0 * v12);
  -[HFCameraVideoCache diskCache](self, "diskCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "totalCostLimit");

  if (v15 > v13)
  {
    -[HFCameraVideoCache diskCache](self, "diskCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTotalCostLimit:", v13);

    HFLogForCategory(0xDuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v24 = "-[HFCameraVideoCache _limitDiskCacheToPercentageofAvailableDiskSpace:]";
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%s diskCacheLimit: %@ (%@%% of %@ available)", buf, 0x2Au);

    }
LABEL_11:

  }
}

- (void)_notifyVideoExistsForClip:(id)a3 atURL:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[HFCameraVideoCache _delegate](self, "_delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HFCameraVideoCache _delegate](self, "_delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoCache:didLocateVideoFileAtURL:forClip:", self, v6, v10);

  }
  -[HFCameraVideoCache _gloablNotifyDidAddVideoForClip:](self, "_gloablNotifyDidAddVideoForClip:", v10);

}

- (void)_gloablNotifyDidAddVideoForClip:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[HFCameraUtilities markCachedVideoAsGreenInTimeline](HFCameraUtilities, "markCachedVideoAsGreenInTimeline"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HFCameraVideoCacheDidAddVideoDebugNotification;
    v9 = CFSTR("uniqueIdentifier");
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, self, v8);

  }
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0xDuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "[FILE DOWNLOADED] clip: %@; path: %@",
      (uint8_t *)&v14,
      0x16u);

  }
  -[HFCameraVideoCache diskCache](self, "diskCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:cost:", v7, v11, objc_msgSend(v6, "hf_size"));

  -[HFCameraVideoCache delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HFCameraVideoCache delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoCache:didDownloadVideoFileAtURL:forClip:", self, v7, v6);

  }
  -[HFCameraVideoCache _gloablNotifyDidAddVideoForClip:](self, "_gloablNotifyDidAddVideoForClip:", v6);

}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0xDuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "[FILE EXISTS] clip: %@; path: %@", (uint8_t *)&v14, 0x16u);

  }
  -[HFCameraVideoCache diskCache](self, "diskCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:cost:", v7, v11, objc_msgSend(v6, "hf_size"));

  -[HFCameraVideoCache delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HFCameraVideoCache delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoCache:didLocateVideoFileAtURL:forClip:", self, v7, v6);

  }
  -[HFCameraVideoCache _gloablNotifyDidAddVideoForClip:](self, "_gloablNotifyDidAddVideoForClip:", v6);

}

- (void)networkDidBecomeExpensive:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0xDuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[HFCameraVideoCache networkDidBecomeExpensive:]";
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%s: cancelling all in-flight operations", (uint8_t *)&v6, 0xCu);
  }

  -[HFCameraVideoCache operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

}

- (void)diskCache:(id)a3 didEvictFileFromDisk:(id)a4 forUniqueIdentifier:(id)a5
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (+[HFCameraUtilities markCachedVideoAsGreenInTimeline](HFCameraUtilities, "markCachedVideoAsGreenInTimeline"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HFCameraVideoCacheDidRemoveVideoDebugNotification;
    v10 = CFSTR("uniqueIdentifier");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, self, v9);

  }
}

- (BOOL)diskCache:(id)a3 shouldAddExistingFileToCache:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  v5 = +[HFCameraUtilities isMP4FileAtURL:](HFCameraUtilities, "isMP4FileAtURL:", v4)
    && !+[HFCameraUtilities isTimelapseVideoFileAtURL:](HFCameraUtilities, "isTimelapseVideoFileAtURL:", v4)&& !+[HFCameraUtilities isVideoFileWithStrippedAudioAtURL:](HFCameraUtilities, "isVideoFileWithStrippedAudioAtURL:", v4)&& +[HFCameraUtilities compareCreationDateOfFileAtURL:toDaysFromNow:](HFCameraUtilities, "compareCreationDateOfFileAtURL:toDaysFromNow:", v4, -10) != -1;

  return v5;
}

- (HFCameraVideoDownloader)videoDownloader
{
  return self->_videoDownloader;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HFDiskCache)diskCache
{
  return self->_diskCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoDownloader, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
