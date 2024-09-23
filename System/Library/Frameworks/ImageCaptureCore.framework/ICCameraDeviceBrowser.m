@implementation ICCameraDeviceBrowser

+ (id)defaultBrowser
{
  void *v2;
  ICCameraDeviceBrowser *v3;
  void *v4;

  v2 = (void *)_sCameraDeviceBrowser;
  if (!_sCameraDeviceBrowser)
  {
    v3 = objc_alloc_init(ICCameraDeviceBrowser);
    v4 = (void *)_sCameraDeviceBrowser;
    _sCameraDeviceBrowser = (uint64_t)v3;

    v2 = (void *)_sCameraDeviceBrowser;
  }
  return v2;
}

+ (BOOL)exists
{
  return _sCameraDeviceBrowser != 0;
}

- (ICCameraDeviceBrowser)init
{
  ICCameraDeviceBrowser *v2;
  uint64_t v3;
  NSMutableArray *devices;
  uint64_t v5;
  NSMutableArray *browsers;
  uint64_t v7;
  NSMutableArray *suspendedBrowsers;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  ICCameraDeviceBrowser *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  _QWORD v27[4];
  ICCameraDeviceBrowser *v28;
  _QWORD v29[4];
  ICCameraDeviceBrowser *v30;
  _QWORD v31[4];
  ICCameraDeviceBrowser *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)ICCameraDeviceBrowser;
  v2 = -[ICCameraDeviceBrowser init](&v33, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    devices = v2->_devices;
    v2->_devices = (NSMutableArray *)v3;

    v2->_numberOfBrowsingBrowsers = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    browsers = v2->_browsers;
    v2->_browsers = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    suspendedBrowsers = v2->_suspendedBrowsers;
    v2->_suspendedBrowsers = (NSMutableArray *)v7;

    v9 = dispatch_queue_create("ic.suspensionQueue", 0);
    -[ICCameraDeviceBrowser setSuspensionTimerQueue:](v2, "setSuspensionTimerQueue:", v9);

    -[ICCameraDeviceBrowser setSuspensionTimer:](v2, "setSuspensionTimer:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_handleCommandCompletionNotification_, CFSTR("ICCommandCompletionNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_handleImageCaptureEventNotification_, CFSTR("ICEventNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
    v15 = MEMORY[0x1E0C809B0];
    if ((v14 & 1) == 0 && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.camera")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __29__ICCameraDeviceBrowser_init__block_invoke;
      v31[3] = &unk_1E70C7A78;
      v17 = v2;
      v32 = v17;
      v18 = (id)objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, v31);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __29__ICCameraDeviceBrowser_init__block_invoke_2;
      v29[3] = &unk_1E70C7A78;
      v30 = v17;
      v20 = (id)objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidBecomeActiveNotification"), 0, 0, v29);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __29__ICCameraDeviceBrowser_init__block_invoke_3;
    v27[3] = &unk_1E70C7A78;
    v28 = v2;
    v22 = (id)objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillTerminateNotification"), 0, 0, v27);

    __ICReadPrefs();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    v25 = v24;

    srand48((uint64_t)v25);
  }
  return v2;
}

uint64_t __29__ICCameraDeviceBrowser_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runSuspensionTimer:", 1);
}

uint64_t __29__ICCameraDeviceBrowser_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runSuspensionTimer:", 0);
}

void __29__ICCameraDeviceBrowser_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "msDevManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRunning");

  objc_msgSend(*(id *)(a1 + 32), "ptpDevManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRunning");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "browsers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "stop:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)runSuspensionTimer:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke;
  v3[3] = &unk_1E70C7AA0;
  v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_source_t v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "suspensionTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "notifySuspension:", 2);
      __ICOSLogCreate();
      v5 = CFSTR("[**-> Notify]");
      if ((unint64_t)objc_msgSend(CFSTR("[**-> Notify]"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("[**-> Notify]"), "substringWithRange:", 0, 18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cleanup timer start, notify suspension pending."));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_retainAutorelease(v5);
        v10 = v8;
        *(_DWORD *)buf = 136446466;
        v21 = -[__CFString UTF8String](v9, "UTF8String");
        v22 = 2114;
        v23 = v7;
        _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "suspensionTimerQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);
      objc_msgSend(*(id *)(a1 + 32), "setSuspensionTimer:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_30;
    handler[3] = &unk_1E70C7198;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v13, handler);

    objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v16);

  }
  else
  {
    objc_msgSend(v3, "suspensionTimerQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_36;
    v18[3] = &unk_1E70C7198;
    v18[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v17, v18);

  }
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "setSuspensionTimer:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_2;
  block[3] = &unk_1E70C7198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_2(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v2 = CFSTR("[**-> Suspend]");
  if ((unint64_t)objc_msgSend(CFSTR("[**-> Suspend]"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("[**-> Suspend]"), "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cleanup time limit reached, hard suspending queues."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v10 = 136446466;
    v11 = -[__CFString UTF8String](v6, "UTF8String");
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1B98FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "notifySuspension:", 3);
  objc_msgSend(*(id *)(a1 + 32), "msDevManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspendOperations");

  objc_msgSend(*(id *)(a1 + 32), "ptpDevManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suspendOperations");

}

uint64_t __44__ICCameraDeviceBrowser_runSuspensionTimer___block_invoke_36(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "suspensionTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setSuspensionTimer:", 0);
    __ICOSLogCreate();
    v4 = CFSTR("[**-> Cancel]");
    if ((unint64_t)objc_msgSend(CFSTR("[**-> Cancel]"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("[**-> Cancel]"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Foregrounded before time limit reached, cancel suspension."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v4);
      v9 = v7;
      v19 = 136446466;
      v20 = -[__CFString UTF8String](v8, "UTF8String");
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v10 = 1;
  }
  else
  {
    __ICOSLogCreate();
    v11 = CFSTR("[**-> Resume]");
    if ((unint64_t)objc_msgSend(CFSTR("[**-> Resume]"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("[**-> Resume]"), "substringWithRange:", 0, 18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Foregrounded application, resuming queues."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v11);
      v16 = v14;
      v19 = 136446466;
      v20 = -[__CFString UTF8String](v15, "UTF8String");
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "ptpDevManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resumeOperations");

    objc_msgSend(*(id *)(a1 + 32), "msDevManager");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString resumeOperations](v4, "resumeOperations");
    v10 = 4;
  }

  return objc_msgSend(*(id *)(a1 + 32), "notifySuspension:", v10);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICCameraDeviceBrowser;
  -[ICCameraDeviceBrowser dealloc](&v4, sel_dealloc);
}

- (void)addBrowser:(id)a3
{
  -[NSMutableArray addObject:](self->_browsers, "addObject:", a3);
}

- (void)removeBrowser:(id)a3
{
  -[NSMutableArray removeObject:](self->_browsers, "removeObject:", a3);
}

- (BOOL)startPTPCameraBrowser
{
  PTPCameraDeviceManager *ptpDevManager;
  PTPCameraDeviceManager *v4;
  PTPCameraDeviceManager *v5;

  ptpDevManager = self->_ptpDevManager;
  if (!ptpDevManager)
  {
    v4 = objc_alloc_init(PTPCameraDeviceManager);
    v5 = self->_ptpDevManager;
    self->_ptpDevManager = v4;

    -[ICDeviceManager startRunning](self->_ptpDevManager, "startRunning");
    ptpDevManager = self->_ptpDevManager;
  }
  return ptpDevManager != 0;
}

- (BOOL)startMSCameraBrowser
{
  MSCameraDeviceManager *msDevManager;
  MSCameraDeviceManager *v4;
  MSCameraDeviceManager *v5;

  msDevManager = self->_msDevManager;
  if (!msDevManager)
  {
    v4 = objc_alloc_init(MSCameraDeviceManager);
    v5 = self->_msDevManager;
    self->_msDevManager = v4;

    -[ICDeviceManager startRunning](self->_msDevManager, "startRunning");
    msDevManager = self->_msDevManager;
  }
  return msDevManager != 0;
}

- (BOOL)startPXCameraBrowser
{
  return 0;
}

- (void)start:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCameraDeviceBrowser addBrowser:](self, "addBrowser:", v4);
  if (self->_numberOfBrowsingBrowsers)
  {
    -[ICCameraDeviceBrowser devices](self, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[ICCameraDeviceBrowser devices](self, "devices", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v4, "addDevice:moreComing:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v6 - 1 != i);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          v6 -= i;
        }
        while (v9);
      }

    }
  }
  else
  {
    __ICOSLogCreate();
    v12 = CFSTR("CameraBrowser");
    if ((unint64_t)objc_msgSend(CFSTR("CameraBrowser"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("CameraBrowser"), "substringWithRange:", 0, 18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", CFSTR(".."));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start Browsing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v12);
      v17 = v15;
      *(_DWORD *)buf = 136446466;
      v24 = -[__CFString UTF8String](v16, "UTF8String");
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1B98FC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[ICCameraDeviceBrowser startPXCameraBrowser](self, "startPXCameraBrowser");
    -[ICCameraDeviceBrowser startMSCameraBrowser](self, "startMSCameraBrowser");
    -[ICCameraDeviceBrowser startPTPCameraBrowser](self, "startPTPCameraBrowser");
  }
  ++self->_numberOfBrowsingBrowsers;

}

- (void)notifySuspension:(unint64_t)a3
{
  uint64_t v4;
  char **v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = &selRef_deviceBrowserDidResumeOperations_;
  switch(a3)
  {
    case 1uLL:
      v4 = 0;
      v5 = &selRef_deviceBrowserDidCancelSuspendOperations_;
      goto LABEL_5;
    case 2uLL:
      v4 = 0;
      v5 = &selRef_deviceBrowserWillSuspendOperations_;
      goto LABEL_5;
    case 3uLL:
      v5 = &selRef_deviceBrowserDidSuspendOperations_;
      v4 = 1;
      goto LABEL_5;
    case 4uLL:
LABEL_5:
      v6 = *v5;
      if (*v5)
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        -[ICCameraDeviceBrowser browsers](self, "browsers", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
              objc_msgSend(v12, "setSuspended:", v4);
              objc_msgSend(v12, "delegate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v13, "performSelector:withObject:", v6, self);
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v9);
        }

      }
      break;
    default:
      return;
  }
}

- (void)stop:(id)a3
{
  id v4;
  int64_t numberOfBrowsingBrowsers;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  ICCameraDeviceBrowser *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_browsers, "containsObject:", v4))
  {
    numberOfBrowsingBrowsers = self->_numberOfBrowsingBrowsers;
    if (numberOfBrowsingBrowsers)
    {
      self->_numberOfBrowsingBrowsers = numberOfBrowsingBrowsers - 1;
      v6 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v4, "devices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "count");
      if (v9)
      {
        v10 = v9;
        v26 = v8;
        v27 = self;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v11 = v8;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v16, "willChangeValueForKey:", CFSTR("hasOpenSession"), v26, v27);
              objc_msgSend(v16, "didChangeValueForKey:", CFSTR("hasOpenSession"));
              objc_msgSend(v16, "delegate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v16, "delegate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "didRemoveDevice:", v16);

              }
              objc_msgSend(v4, "removeDevice:moreGoing:", v16, v10 - 1 != i);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            v10 -= i;
          }
          while (v13);
        }

        v8 = v26;
        self = v27;
      }
      if (!self->_numberOfBrowsingBrowsers)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v19 = self->_devices;
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v24, "deviceManager", v26, v27, (_QWORD)v28);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "closeDevice:contextInfo:", v24, 0);

            }
            v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v21);
        }

        -[NSMutableArray removeAllObjects](self->_devices, "removeAllObjects");
      }
      -[ICCameraDeviceBrowser removeBrowser:](self, "removeBrowser:", v4, v26, v27);

    }
  }

}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)handleCommandCompletionNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "performSelector:withObject:", sel_handleCommandCompletionNotification_, v6);

}

- (void)handleImageCaptureEventNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ICDeviceAdded")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableArray addObject:](self->_devices, "addObject:", v7);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v8 = self->_browsers;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (objc_msgSend(v13, "isBrowsing"))
              objc_msgSend(v13, "addDevice:moreComing:", v7, 0);
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v10);
      }
LABEL_31:

    }
  }
  else
  {
    v14 = objc_msgSend(v6, "isEqualToString:", CFSTR("ICDeviceRemoved"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("device"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v14)
    {
      if (v15)
      {
        objc_msgSend(v15, "willChangeValueForKey:", CFSTR("hasOpenSession"));
        objc_msgSend(v7, "didChangeValueForKey:", CFSTR("hasOpenSession"));
        -[NSMutableArray removeObject:](self->_devices, "removeObject:", v7);
        __ICOSLogCreate();
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR(" ------ [1]didRemoveDevice: %@\n"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = __ICLogTypeEnabled(2);
        v21 = _gICOSLog;
        if (v20)
        {
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v19;
            _os_log_impl(&dword_1B98FC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
        {
          -[ICCameraDeviceBrowser handleImageCaptureEventNotification:].cold.1((uint64_t)v19, v21);
        }

        objc_msgSend(v7, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v7, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "didRemoveDevice:", v7);

        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v8 = self->_browsers;
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v29 != v26)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "removeDevice:moreGoing:", v7, 0);
            }
            v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v25);
        }
        goto LABEL_31;
      }
    }
    else if (v15)
    {
      objc_msgSend(v15, "performSelector:withObject:", sel_handleImageCaptureEventNotification_, v4);
    }
  }

}

- (id)deviceWithDelegate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_devices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    v11 = v8;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      v8 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v10);

      objc_msgSend(v8, "delegate", (_QWORD)v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v4)
        break;
      ++v10;
      v11 = v8;
      if (v7 == v10)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
  }

  return v8;
}

- (NSMutableArray)browsers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (PTPCameraDeviceManager)ptpDevManager
{
  return self->_ptpDevManager;
}

- (void)setPtpDevManager:(id)a3
{
  objc_storeStrong((id *)&self->_ptpDevManager, a3);
}

- (MSCameraDeviceManager)msDevManager
{
  return self->_msDevManager;
}

- (void)setMsDevManager:(id)a3
{
  objc_storeStrong((id *)&self->_msDevManager, a3);
}

- (OS_dispatch_source)suspensionTimer
{
  return self->_suspensionTimer;
}

- (void)setSuspensionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_suspensionTimer, a3);
}

- (OS_dispatch_queue)suspensionTimerQueue
{
  return self->_suspensionTimerQueue;
}

- (void)setSuspensionTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_suspensionTimerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspensionTimerQueue, 0);
  objc_storeStrong((id *)&self->_suspensionTimer, 0);
  objc_storeStrong((id *)&self->_msDevManager, 0);
  objc_storeStrong((id *)&self->_ptpDevManager, 0);
  objc_storeStrong((id *)&self->_suspendedBrowsers, 0);
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)handleImageCaptureEventNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1B98FC000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
