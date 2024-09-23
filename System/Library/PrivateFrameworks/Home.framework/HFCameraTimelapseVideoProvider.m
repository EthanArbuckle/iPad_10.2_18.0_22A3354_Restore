@implementation HFCameraTimelapseVideoProvider

+ (id)sharedProvider
{
  if (qword_1ED379190 != -1)
    dispatch_once(&qword_1ED379190, &__block_literal_global_111);
  return (id)_MergedGlobals_262;
}

void __48__HFCameraTimelapseVideoProvider_sharedProvider__block_invoke()
{
  HFCameraTimelapseVideoProvider *v0;
  void *v1;

  v0 = objc_alloc_init(HFCameraTimelapseVideoProvider);
  v1 = (void *)_MergedGlobals_262;
  _MergedGlobals_262 = (uint64_t)v0;

}

- (HFCameraTimelapseVideoProvider)init
{
  HFCameraTimelapseVideoProvider *v2;
  NSOperationQueue *v3;
  NSOperationQueue *downloadQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *bookkeepingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFCameraTimelapseVideoProvider;
  v2 = -[HFCameraTimelapseVideoProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_downloadQueue, "setMaxConcurrentOperationCount:", 5);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.Home.HFCameraTimelapseVideoProvider.bookkeepingQueue", v5);
    bookkeepingQueue = v2->_bookkeepingQueue;
    v2->_bookkeepingQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)setTimelapseVideoDownloader:(id)a3
{
  HFCameraVideoDownloader *v4;
  void *v5;
  HFCameraVideoDownloader *timelapseVideoDownloader;

  v4 = (HFCameraVideoDownloader *)a3;
  -[HFCameraTimelapseVideoProvider downloadQueue](self, "downloadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

  timelapseVideoDownloader = self->_timelapseVideoDownloader;
  self->_timelapseVideoDownloader = v4;

}

- (void)waitUntilAllDownloadsAreFinished
{
  id v2;

  -[HFCameraTimelapseVideoProvider downloadQueue](self, "downloadQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (void)getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  HFLogForCategory(0x1DuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Provider asked for clip: %@ with task type %lu", buf, 0x16u);

  }
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraTimelapseVideoProvider _getVideoForTimelapseClip:taskType:delegate:](self, "_getVideoForTimelapseClip:taskType:delegate:", v8, a4, v9);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HFCameraTimelapseVideoProvider bookkeepingQueue](self, "bookkeepingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__HFCameraTimelapseVideoProvider_getVideoForTimelapseClip_taskType_delegate___block_invoke;
    v13[3] = &unk_1EA7273B8;
    objc_copyWeak(v16, (id *)buf);
    v14 = v8;
    v16[1] = (id)a4;
    v15 = v9;
    dispatch_async(v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }

}

void __77__HFCameraTimelapseVideoProvider_getVideoForTimelapseClip_taskType_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_getVideoForTimelapseClip:taskType:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v20 = a3;
  v8 = a5;
  -[HFCameraTimelapseVideoProvider timelapseVideoDownloader](self, "timelapseVideoDownloader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HFCameraTimelapseVideoProvider timelapseVideoDownloader](self, "timelapseVideoDownloader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "priorityDownloadOperationForClip:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDelegate:", v8);
    -[HFCameraTimelapseVideoProvider downloadQueue](self, "downloadQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke;
    v23[3] = &unk_1EA72B218;
    v15 = v11;
    v24 = v15;
    objc_msgSend(v13, "na_firstObjectPassingTest:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (!a4)
        objc_msgSend(v16, "setQueuePriority:", objc_msgSend(v15, "queuePriority"));
      objc_msgSend(v15, "addDependency:", v16);
    }
    else if (!a4)
    {
      -[HFCameraTimelapseVideoProvider downloadQueue](self, "downloadQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "operations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke_2;
      v21[3] = &unk_1EA735280;
      v22 = v15;
      objc_msgSend(v18, "na_each:", v21);

    }
    -[HFCameraTimelapseVideoProvider downloadQueue](self, "downloadQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v15);

  }
}

uint64_t __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  return v8;
}

void __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hmf_isEqualToUUID:", v6);

  if ((v7 & 1) == 0)
    objc_msgSend(v8, "setQueuePriority:", -4);

}

- (HFCameraVideoDownloader)timelapseVideoDownloader
{
  return self->_timelapseVideoDownloader;
}

- (NSOperationQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQueue, a3);
}

- (OS_dispatch_queue)bookkeepingQueue
{
  return self->_bookkeepingQueue;
}

- (void)setBookkeepingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bookkeepingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookkeepingQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_timelapseVideoDownloader, 0);
}

@end
