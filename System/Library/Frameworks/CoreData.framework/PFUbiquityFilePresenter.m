@implementation PFUbiquityFilePresenter

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    _privateQueue = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3828]);
    _usesCloudDocs = 1;
    v3 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 5);
    if (v3)
    {
      v10 = v3;
      _MergedGlobals_88 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v3, "BRStartDownloadForItems");
      if (!_MergedGlobals_88)
        _NSCoreDataLog(1, (uint64_t)CFSTR("CloudDocs.framework missing symbol BRStartDownloadForItems"), v11, v12, v13, v14, v15, v16, v30);
      Weak_BRRegisterInitialSyncHandlerForContainer = (uint64_t (*)(_QWORD, _QWORD))dlsym(v10, "BRRegisterInitialSyncHandlerForContainer");
      if (!Weak_BRRegisterInitialSyncHandlerForContainer)
        _NSCoreDataLog(1, (uint64_t)CFSTR("CloudDocs.framework missing symbol BRRegisterInitialSyncHandlerForContainer"), v17, v18, v19, v20, v21, v22, v30);
      v23 = dlsym(v10, "BRUbiquitousContainersRootFolderName");
      qword_1ECD8DB38 = (uint64_t)v23;
      if (v23)
      {
        v31[0] = CFSTR("Library");
        v31[1] = *v23;
        qword_1ECD8DB40 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2)), "copy");
      }
      else
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("CloudDocs.framework missing symbol BRUbiquitousContainersRootFolderName"), v24, v25, v26, v27, v28, v29, v32);
      }
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Unable to dynamically link CloudDocs.framework"), v4, v5, v6, v7, v8, v9, v30);
      dlclose(0);
    }
  }
}

+ (void)startDownloadForItems:(NSObject *)global_queue onQueue:(uint64_t)a4 withBlock:
{
  void *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  objc_opt_self();
  if (objc_msgSend(a2, "count"))
  {
    if (!global_queue)
      global_queue = dispatch_get_global_queue(0, 0);
    if (_MergedGlobals_88)
    {
      v11 = MEMORY[0x1E0C809B0];
      v7 = &unk_1E1EDDAE0;
      v8 = __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke;
      v9 = &v11;
    }
    else
    {
      a4 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = MEMORY[0x1E0C809B0];
      v7 = &unk_1E1EDD430;
      v8 = __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke_2;
      v9 = &v10;
    }
    v9[1] = 3221225472;
    v9[2] = (uint64_t)v8;
    v9[3] = (uint64_t)v7;
    v9[4] = (uint64_t)a2;
    v9[5] = a4;
    dispatch_async(global_queue, v9);
  }
}

uint64_t __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke(uint64_t a1)
{
  return _MergedGlobals_88(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__PFUbiquityFilePresenter_startDownloadForItems_onQueue_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "startDownloadingUbiquitousItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0);
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

+ (uint64_t)cloudDocsRootFolder
{
  uint64_t result;

  objc_opt_self();
  result = qword_1ECD8DB40;
  if (!qword_1ECD8DB40)
    return objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", &unk_1E1F52548);
  return result;
}

+ (void)registerInitialSyncHandlerForURL:(uint64_t)a3 andContainerID:(NSObject *)global_queue onQueue:(uint64_t)a5 withBlock:
{
  _QWORD v8[6];

  objc_opt_self();
  if (!global_queue)
    global_queue = dispatch_get_global_queue(0, 0);
  if (Weak_BRRegisterInitialSyncHandlerForContainer)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__PFUbiquityFilePresenter_registerInitialSyncHandlerForURL_andContainerID_onQueue_withBlock___block_invoke;
    v8[3] = &unk_1E1EDDAE0;
    v8[4] = a3;
    v8[5] = a5;
    dispatch_async(global_queue, v8);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
  }
}

uint64_t __93__PFUbiquityFilePresenter_registerInitialSyncHandlerForURL_andContainerID_onQueue_withBlock___block_invoke(uint64_t a1)
{
  return Weak_BRRegisterInitialSyncHandlerForContainer(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (PFUbiquityFilePresenter)init
{
  PFUbiquityFilePresenter *v2;
  PFUbiquityFilePresenter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityFilePresenter;
  v2 = -[PFUbiquityFilePresenter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scheduledProcessingBlock = 0;
    v2->_localPeerID = 0;
    v2->_storeName = 0;
    v2->_ubiquityRootLocation = 0;
    v2->_pendingURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_locationToSafeSaveFile = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_locationToStatus = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (PFUbiquityFilePresenter)initWithUbiquityRootLocation:(id)a3 localPeerID:(id)a4 storeName:(id)a5 processingQueue:(id)a6
{
  PFUbiquityFilePresenter *v10;
  PFUbiquityLocation *v11;
  void *v12;

  v10 = -[PFUbiquityFilePresenter init](self, "init");
  if (v10)
  {
    v11 = (PFUbiquityLocation *)a3;
    v10->_ubiquityRootLocation = v11;
    v10->_presentedItemURL = (NSURL *)-[PFUbiquityLocation createFullURL]((uint64_t)v11);
    v10->_localPeerID = (NSString *)a4;
    v10->_storeName = (NSString *)a5;
    if (a6)
    {
      v10->_processingQueue = (OS_dispatch_queue *)a6;
      dispatch_retain((dispatch_object_t)a6);
    }
    else
    {
      v10->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coredata.ubiquity.fpqueue", 0);
    }
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_logWasExported_, CFSTR("PFUbiquityLocationWasExportedNotification"), v10->_ubiquityRootLocation);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_logWasImported_, CFSTR("PFUbiquityLocationWasImportedNotification"), v10->_ubiquityRootLocation);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_logImportWasCancelled_, CFSTR("PFUbiquityLocationImportCancelledNotification"), v10->_ubiquityRootLocation);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_logsWereScheduled_, CFSTR("PFUbiquityLocationsWereScheduledNotification"), v10->_ubiquityRootLocation);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_setupAssistantDiscoveredPathsFromMetadataQuery_, CFSTR("PFUbiquityFilePresenterAddPathsNotification"), v10->_ubiquityRootLocation);
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_printStatus_, CFSTR("PFUbiquityFilePresenterPrintStatusNotification"), 0);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_presentedItemURL = 0;
  dispatch_release((dispatch_object_t)self->_processingQueue);
  self->_processingQueue = 0;

  self->_pendingURLs = 0;
  self->_locationToSafeSaveFile = 0;

  self->_locationToStatus = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFilePresenter;
  -[PFUbiquityFilePresenter dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFilePresenter;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tubiquityRootLocation: %@\n\tlocalPeerID: %@\n"), -[PFUbiquityFilePresenter description](&v3, sel_description), self->_ubiquityRootLocation, self->_localPeerID);
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  objc_opt_self();
  return (NSOperationQueue *)_privateQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  NSObject *processingQueue;
  _QWORD block[5];

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nGot change notification for url: %@"), "-[PFUbiquityFilePresenter presentedSubitemDidChangeAtURL:]", 289, self, a3);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_pendingURLsLock);
  -[NSMutableArray addObject:](self->_pendingURLs, "addObject:", a3);
  if (self->_scheduledProcessingBlock)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_pendingURLsLock);
  }
  else
  {
    self->_scheduledProcessingBlock = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_pendingURLsLock);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PFUbiquityFilePresenter_presentedSubitemDidChangeAtURL___block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = self;
    dispatch_async(processingQueue, block);
  }
}

_QWORD *__58__PFUbiquityFilePresenter_presentedSubitemDidChangeAtURL___block_invoke(_QWORD *result)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  _BYTE *v12;
  void *v13;
  PFUbiquityLocationStatus *v14;
  PFUbiquityLocationStatus *v15;
  char v16;
  int v17;
  void *v18;
  unsigned int v19;
  PFUbiquityLocation *location;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  PFUbiquityLocation *v27;
  PFUbiquityLocation *v28;
  int v29;
  uint64_t v30;
  void *v31;
  NSObject *global_queue;
  void *v33;
  void *v34;
  void *v35;
  os_unfair_lock_s *lock;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  char v43;
  id obj;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v1 = result[4];
  if (!v1)
    return result;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 64));
  obj = (id)objc_msgSend(*(id *)(v1 + 56), "copy");

  *(_QWORD *)(v1 + 56) = v2;
  *(_BYTE *)(v1 + 48) = 0;
  v40 = (void *)objc_msgSend(*(id *)(v1 + 72), "copy");
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", *(_QWORD *)(v1 + 80), 0);
  lock = (os_unfair_lock_s *)(v1 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nProcessing pending urls: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 327, v1, obj);
  v41 = (void *)v3;
  v37 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = (void *)v3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v38 = v6;
  v39 = v4;
  if (!v7)
  {
    v43 = 0;
    goto LABEL_105;
  }
  v43 = 0;
  v8 = *(_QWORD *)v51;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v51 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
      v11 = +[PFUbiquityLocation createUbiquityLocationForURL:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v10, *(_BYTE **)(v1 + 8));
      v12 = v11;
      if (v11)
      {
        if (*((_DWORD *)v11 + 6) != 1)
          v11 = (_BYTE *)*((_QWORD *)v11 + 1);
        if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(v1 + 8)) & 1) == 0)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping location (wrong root location): %@\n%@"), "-[PFUbiquityFilePresenter processPendingURLs]", 352, v12, *(_QWORD *)(v1 + 8));
          goto LABEL_26;
        }
        if (*(_QWORD *)(v1 + 24))
        {
          v13 = (void *)*((_QWORD *)v12 + 5);
          if (v13)
          {
            if ((objc_msgSend(v13, "isEqualToString:") & 1) == 0)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping location (wrong store name): %@\n%@"), "-[PFUbiquityFilePresenter processPendingURLs]", 357, *(_QWORD *)(v1 + 24), v12);
              }
LABEL_26:

              goto LABEL_31;
            }
          }
        }
        v14 = (PFUbiquityLocationStatus *)(id)objc_msgSend(v5, "objectForKey:", v12);
        if (v14)
        {
LABEL_19:
          if (v14->_isImported)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping location (imported):\n%@"), "-[PFUbiquityFilePresenter processPendingURLs]", 371, v12);
            }
LABEL_30:

            goto LABEL_31;
          }
          if (v14->_isExported)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Skipping location (exported):\n%@"), "-[PFUbiquityFilePresenter processPendingURLs]", 377, v12);
            }
            goto LABEL_30;
          }
          v16 = 0;
        }
        else
        {
          v15 = -[PFUbiquityLocationStatus initWithLocation:]([PFUbiquityLocationStatus alloc], "initWithLocation:", v12);
          objc_msgSend(v5, "setObject:forKey:", v15, v12);
          v43 = 1;
          if (v15)
          {
            v14 = v15;
            goto LABEL_19;
          }
          v14 = 0;
          v16 = 1;
        }
        if (_CFURLIsItemPromiseAtURL())
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  URL is a promise file, skipping file URL state check for:%@"), "-[PFUbiquityFilePresenter processPendingURLs]", 387, v10);
        }
        else
        {
          -[PFUbiquityLocationStatus checkFileURLState]((uint64_t)v14);
        }
        if ((v16 & 1) != 0 || !v14->_isLive)
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  File isn't live yet: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 437, v12);
          if (_usesCloudDocs == 1 && !_CFURLIsItemPromiseAtURL())
          {
            v19 = *((_DWORD *)v12 + 6);
            if ((v19 > 0x2A || ((1 << v19) & 0x4FEC7BC73F0) == 0)
              && (objc_msgSend((id)objc_msgSend(v10, "path"), "hasSuffix:", CFSTR(".nosync")) & 1) == 0
              && objc_msgSend((id)objc_msgSend(v10, "path"), "rangeOfString:", CFSTR("ubRoot")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting download for file that is not live: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 439, v12);
              }
              if ((v16 & 1) == 0)
                v14->_isDownloading = 1;
LABEL_98:
              objc_msgSend(v38, "addObject:", v10);
            }
          }
          goto LABEL_100;
        }
        if (!v14->_isDownloaded)
        {
          location = v14->_location;
          if (location)
          {
            if (location->_isRootUbiquitous)
            {
              if (v12[88])
              {
                v21 = *((_DWORD *)v12 + 6);
                if ((v21 > 0x2A || ((1 << v21) & 0x4FEC7BC73F0) == 0)
                  && !v14->_isExported
                  && !v14->_isDeleted
                  && !v14->_isDownloading)
                {
                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting download for: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 427, v12);
                  }
                  v14->_isDownloading = 1;
                  if (!_CFURLIsItemPromiseAtURL())
                    goto LABEL_98;
LABEL_97:
                  v10 = (void *)objc_msgSend(v10, "URLByDeletingLastPathComponent");
                  goto LABEL_98;
                }
              }
              goto LABEL_100;
            }
          }
        }
        v17 = *((_DWORD *)v12 + 6);
        v18 = v42;
        if (v17 != 10)
        {
          if (v17 != 22)
          {
            v22 = (void *)objc_msgSend((id)objc_msgSend(v40, "objectForKey:", v12), "copy");
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v47 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                  if (v26)
                  {
                    if (*(_BYTE *)(v26 + 40)
                      && (v14->_isDownloaded || (v27 = v14->_location) == 0 || !v27->_isRootUbiquitous))
                    {
                      -[PFUbiquitySafeSaveFile checkFileDownload](v26);
                    }
                    else if (*(_BYTE *)(v26 + 56))
                    {
                      if (v14->_isUploaded || (v28 = v14->_location) == 0 || !v28->_isRootUbiquitous)
                        -[PFUbiquitySafeSaveFile checkSafeSaveFileUpload](v26);
                    }
                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              }
              while (v23);
            }
            v5 = v41;

            goto LABEL_100;
          }
          if ((objc_msgSend(*((id *)v12 + 4), "isEqualToString:", *(_QWORD *)(v1 + 16)) & 1) != 0
            || v14->_isExported
            || v14->_isImported
            || v14->_isScheduled)
          {
LABEL_100:

            goto LABEL_31;
          }
          v29 = _CFURLIsItemPromiseAtURL();
          v18 = v39;
          if (v29)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting download for promise base dir: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 408, v12);
            }
            v14->_isDownloading = 1;
            goto LABEL_97;
          }
        }
        objc_msgSend(v18, "addObject:", v12);
        goto LABEL_100;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Didn't get a location back for url: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 349, v10);
LABEL_31:
      ++v9;
    }
    while (v9 != v7);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    v7 = v30;
  }
  while (v30);
LABEL_105:
  v31 = (void *)objc_msgSend(v38, "allObjects");
  global_queue = dispatch_get_global_queue(0, 0);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __45__PFUbiquityFilePresenter_processPendingURLs__block_invoke;
  v45[3] = &unk_1E1EDDB58;
  v45[4] = v38;
  +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v31, global_queue, (uint64_t)v45);

  if (objc_msgSend(v39, "count"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Found transaction log locations: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 457, v39);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v39, CFSTR("PFLogLocationsKey"), 0);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("PFUbiquityFilePresenterDiscoveredLogLocationsNotification"), v1, v33);

    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v34);
  }
  if ((v43 & 1) != 0)
  {
    os_unfair_lock_lock(lock);
    v35 = *(void **)(v1 + 80);
    if (v5 != v35)
    {

      *(_QWORD *)(v1 + 80) = v5;
    }
    os_unfair_lock_unlock(lock);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nStatus: %@"), "-[PFUbiquityFilePresenter processPendingURLs]", 485, v1, v5);

  objc_msgSend(v37, "drain");
  return 0;
}

void __45__PFUbiquityFilePresenter_processPendingURLs__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Librarian returned a serious error for starting downloads %@ with userInfo %@ for these urls: %@"), "-[PFUbiquityFilePresenter processPendingURLs]_block_invoke", 450, a2, objc_msgSend(a2, "userInfo"), *(_QWORD *)(a1 + 32));
  }
}

- (PFUbiquityLocationStatus)retainedStatusForLocation:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  PFUbiquityLocationStatus *v5;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  v5 = (PFUbiquityLocationStatus *)(id)objc_msgSend(*(id *)(a1 + 80), "objectForKey:", a2);
  if (!v5)
  {
    v5 = -[PFUbiquityLocationStatus initWithLocation:]([PFUbiquityLocationStatus alloc], "initWithLocation:", a2);
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v5, a2);
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

- (os_unfair_lock_s)copyStatusDictionary
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = result + 16;
    os_unfair_lock_lock(result + 16);
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", *(_QWORD *)&v1[20]._os_unfair_lock_opaque, 0);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (void)exporterDidMoveLog:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")), "lastObject");
  v5 = v4;
  if (v4 && *(_DWORD *)(v4 + 24) != 1)
    v4 = *(_QWORD *)(v4 + 8);
  if (objc_msgSend((id)v4, "isEqual:", self->_ubiquityRootLocation))
  {
    v6 = (id)-[PFUbiquityLocation createFullURL](v5);
    -[PFUbiquityFilePresenter presentedSubitemDidChangeAtURL:](self, "presentedSubitemDidChangeAtURL:", v6);

  }
}

- (void)logWasExported:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *processingQueue;
  void *v8;
  _QWORD block[6];

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")), "lastObject");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(*(id *)(v5 + 32), "isEqualToString:", self->_localPeerID))
    {
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PFUbiquityFilePresenter_logWasExported___block_invoke;
      block[3] = &unk_1E1EDD430;
      block[4] = self;
      block[5] = v6;
      dispatch_async(processingQueue, block);
    }
    v8 = (void *)-[PFUbiquityLocation createFullURL](v6);
    -[PFUbiquityFilePresenter presentedSubitemDidChangeAtURL:](self, "presentedSubitemDidChangeAtURL:", v8);

  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@"), "-[PFUbiquityFilePresenter logWasExported:]", 565, self, a3);
  }
}

uint64_t __42__PFUbiquityFilePresenter_logWasExported___block_invoke(uint64_t a1)
{
  id v2;
  PFUbiquityLocationStatus *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v3)
    v3->_isExported = 1;

  return objc_msgSend(v2, "drain");
}

- (void)logWasImported:(id)a3
{
  uint64_t v5;
  NSObject *processingQueue;
  _QWORD block[6];

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")), "lastObject");
  if (v5)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PFUbiquityFilePresenter_logWasImported___block_invoke;
    block[3] = &unk_1E1EDD430;
    block[4] = self;
    block[5] = v5;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@"), "-[PFUbiquityFilePresenter logWasImported:]", 580, self, a3);
  }
}

uint64_t __42__PFUbiquityFilePresenter_logWasImported___block_invoke(uint64_t a1)
{
  id v2;
  PFUbiquityLocationStatus *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v3)
    *(_WORD *)&v3->_isImported = 1;

  return objc_msgSend(v2, "drain");
}

- (void)logImportWasCancelled:(id)a3
{
  uint64_t v5;
  NSObject *processingQueue;
  _QWORD block[6];

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")), "lastObject");
  if (v5)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PFUbiquityFilePresenter_logImportWasCancelled___block_invoke;
    block[3] = &unk_1E1EDD430;
    block[4] = self;
    block[5] = v5;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@"), "-[PFUbiquityFilePresenter logImportWasCancelled:]", 595, self, a3);
  }
}

uint64_t __49__PFUbiquityFilePresenter_logImportWasCancelled___block_invoke(uint64_t a1)
{
  id v2;
  PFUbiquityLocationStatus *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v3)
    *(_WORD *)&v3->_isImported = 0;

  return objc_msgSend(v2, "drain");
}

- (void)logsWereScheduled:(id)a3
{
  void *v5;
  void *v6;
  NSObject *processingQueue;
  _QWORD block[6];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")), "copy");
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PFUbiquityFilePresenter_logsWereScheduled___block_invoke;
    block[3] = &unk_1E1EDD430;
    block[4] = self;
    block[5] = v6;
    dispatch_async(processingQueue, block);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@"), "-[PFUbiquityFilePresenter logsWereScheduled:]", 615, self, a3);
  }

}

uint64_t __45__PFUbiquityFilePresenter_logsWereScheduled___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  PFUbiquityLocationStatus *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@ logs were scheduled: %@"), "-[PFUbiquityFilePresenter logsWereScheduled:]_block_invoke", 605, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[PFUbiquityFilePresenter retainedStatusForLocation:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        if (v8)
          v8->_isScheduled = 1;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return objc_msgSend(v2, "drain");
}

- (void)setupAssistantDiscoveredPathsFromMetadataQuery:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey"));
  if (!v5 || (v6 = (void *)v5, v5 == objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nExport notification was missing transaction log location: %@"), "-[PFUbiquityFilePresenter setupAssistantDiscoveredPathsFromMetadataQuery:]", 629, self, a3);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          -[PFUbiquityFilePresenter presentedSubitemDidChangeAtURL:](self, "presentedSubitemDidChangeAtURL:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
}

- (void)printStatus:(id)a3
{
  os_unfair_lock_s *v4;
  NSObject *global_queue;
  _QWORD v6[6];

  v4 = -[PFUbiquityFilePresenter copyStatusDictionary]((os_unfair_lock_s *)self);
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PFUbiquityFilePresenter_printStatus___block_invoke;
  v6[3] = &unk_1E1EDD430;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(global_queue, v6);

}

uint64_t __39__PFUbiquityFilePresenter_printStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", objc_msgSend(*(id *)(a1 + 32), "description"));
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "allKeys"), "mutableCopy");
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_29);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
        if (!v9)
        {
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@:%ld: "), v8, 0);
          v14 = v2;
          v13 = CFSTR("unknown status");
          goto LABEL_27;
        }
        v10 = v9;
        objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@:%ld: "), v8, *(_QWORD *)(v9 + 56));
        if (*(_BYTE *)(v10 + 8))
          v11 = CFSTR("live:");
        else
          v11 = CFSTR("not-live:");
        objc_msgSend(v2, "appendString:", v11);
        if (*(_BYTE *)(v10 + 9))
          objc_msgSend(v2, "appendString:", CFSTR("deleted:"));
        if (*(_BYTE *)(v10 + 14))
          objc_msgSend(v2, "appendString:", CFSTR("imported:"));
        if (*(_BYTE *)(v10 + 16))
          objc_msgSend(v2, "appendString:", CFSTR("exported:"));
        if (*(_BYTE *)(v10 + 10))
          objc_msgSend(v2, "appendString:", CFSTR("downloaded:"));
        if (*(_BYTE *)(v10 + 11))
          objc_msgSend(v2, "appendString:", CFSTR("downloading:"));
        if (*(_BYTE *)(v10 + 12))
          objc_msgSend(v2, "appendString:", CFSTR("uploaded:"));
        if (*(_BYTE *)(v10 + 13))
          objc_msgSend(v2, "appendString:", CFSTR("uploading:"));
        if (*(_BYTE *)(v10 + 17))
        {
          objc_msgSend(v2, "appendString:", CFSTR("failed:"));
          v12 = *(void **)(v10 + 32);
          if (v12)
          {
            v13 = (const __CFString *)objc_msgSend(v12, "description");
            v14 = v2;
LABEL_27:
            objc_msgSend(v14, "appendString:", v13);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v5 = v15;
    }
    while (v15);
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityFilePresenter printStatus:]_block_invoke", 701, v2);

  return objc_msgSend(v17, "drain");
}

uint64_t __39__PFUbiquityFilePresenter_printStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = -[PFUbiquityLocation createRelativePath](a2);
  v5 = -[PFUbiquityLocation createRelativePath](a3);
  v6 = objc_msgSend(v4, "compare:options:", v5, 64);

  return v6;
}

- (void)registerSafeSaveFile:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if (a2)
      v5 = *(_QWORD *)(a2 + 8);
    else
      v5 = 0;
    v6 = (id)objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v5);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v7 = *(_QWORD *)(a2 + 8);
      else
        v7 = 0;
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v6, v7);
    }
    objc_msgSend(v6, "addObject:", a2);

    if (a2)
      v8 = *(_QWORD *)(a2 + 16);
    else
      v8 = 0;
    v9 = (id)objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v8);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a2)
        v10 = *(_QWORD *)(a2 + 16);
      else
        v10 = 0;
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v9, v10);
    }
    objc_msgSend(v9, "addObject:", a2);

    os_unfair_lock_unlock(v4);
  }
}

- (void)unregisterSafeSaveFile:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if (a2)
      v5 = *(_QWORD *)(a2 + 8);
    else
      v5 = 0;
    v6 = (id)objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v5);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "removeObject:", a2);
      if (!objc_msgSend(v7, "count"))
      {
        if (a2)
          v8 = *(_QWORD *)(a2 + 8);
        else
          v8 = 0;
        objc_msgSend(*(id *)(a1 + 72), "removeObjectForKey:", v8);
      }
    }

    if (a2)
      v9 = *(_QWORD *)(a2 + 16);
    else
      v9 = 0;
    v10 = (id)objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v9);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "removeObject:", a2);
      if (!objc_msgSend(v11, "count"))
      {
        if (a2)
          v12 = *(_QWORD *)(a2 + 16);
        else
          v12 = 0;
        objc_msgSend(*(id *)(a1 + 72), "removeObjectForKey:", v12);
      }
    }

    os_unfair_lock_unlock(v4);
  }
}

@end
