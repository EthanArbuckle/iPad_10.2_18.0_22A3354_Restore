@implementation NSCloudKitMirroringDelegate

+ (NSString)cloudKitMachServiceName
{
  return (NSString *)CFSTR("com.apple.coredatad.cloudkit");
}

+ (id)createCloudKitServerWithMachServiceName:(id)a3 andStorageDirectoryPath:(id)a4
{
  CDDCloudKitServerConfiguration *v6;
  const char *v7;
  const char *v8;
  CDDCloudKitServer *v9;

  v6 = objc_alloc_init(CDDCloudKitServerConfiguration);
  if (objc_msgSend(a3, "length"))
  {
    if (!v6)
    {
      objc_msgSend(a4, "length");
      goto LABEL_7;
    }
    objc_setProperty_nonatomic(v6, v7, a3, 16);
  }
  if (objc_msgSend(a4, "length") && v6)
    objc_setProperty_nonatomic(v6, v8, a4, 8);
LABEL_7:
  v9 = -[CDDCloudKitServer initWithListener:configuration:]([CDDCloudKitServer alloc], "initWithListener:configuration:", 0, v6);

  return v9;
}

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    objc_opt_class();
}

- (NSCloudKitMirroringDelegate)initWithOptions:(id)a3
{
  NSCloudKitMirroringDelegate *v4;
  void *v5;
  NSCloudKitMirroringDelegateOptions *v6;
  PFCloudKitThrottledNotificationObserver *v7;
  uint64_t v8;
  NSCloudKitMirroringDelegateOptions *options;
  CKScheduler *scheduler;
  NSCloudKitMirroringDelegateOptions *v11;
  CKNotificationListener *notificationListener;
  CKNotificationListener *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v4 = -[NSCloudKitMirroringDelegate init](self, "init");
  if (v4)
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = (NSCloudKitMirroringDelegateOptions *)objc_msgSend(a3, "copy");
    v4->_options = v6;
    if (!-[NSCloudKitMirroringDelegateOptions progressProvider](v6, "progressProvider"))
      -[NSCloudKitMirroringDelegateOptions setProgressProvider:](v4->_options, "setProgressProvider:", v4);
    objc_autoreleasePoolPop(v5);
    if (_MergedGlobals_87 != -1)
      dispatch_once(&_MergedGlobals_87, &__block_literal_global_28);
    v4->_cloudKitQueueSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v4->_cloudKitQueue = (OS_dispatch_queue *)(id)qword_1ECD8DB28;
    v4->_databaseSubscription = 0;
    *(_WORD *)&v4->_hadObservedStore = 0;
    v4->_setupFinishedMetadataInitialization = 0;
    *(_WORD *)&v4->_registeredForAccountChangeNotifications = 0;
    v4->_requestManager = objc_alloc_init(NSCloudKitMirroringRequestManager);
    v4->_voucherManager = objc_alloc_init(NSCloudKitMirroringActivityVoucherManager);
    objc_initWeak(&location, v4);
    v7 = [PFCloudKitThrottledNotificationObserver alloc];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke_2;
    v18 = &unk_1E1EE1120;
    objc_copyWeak(&v19, &location);
    v8 = -[PFCloudKitThrottledNotificationObserver initWithLabel:handlerBlock:](v7, "initWithLabel:handlerBlock:", CFSTR("AccountChangeObserver"), &v15);
    v4->_accountChangeObserver = (PFCloudKitThrottledNotificationObserver *)v8;
    if (v8)
      *(_QWORD *)(v8 + 32) = 10;
    if (-[NSCloudKitMirroringDelegateOptions automaticallyScheduleImportAndExportOperations](v4->_options, "automaticallyScheduleImportAndExportOperations", v15, v16, v17, v18))
    {
      options = v4->_options;
      if (!options || (scheduler = options->_scheduler) == 0)
        scheduler = (CKScheduler *)objc_msgSend((Class)getCloudKitCKSchedulerClass[0](), "sharedScheduler");
      v4->_scheduler = scheduler;
      if (-[NSCloudKitMirroringDelegateOptions databaseScope](v4->_options, "databaseScope") == 2
        || -[NSCloudKitMirroringDelegateOptions databaseScope](v4->_options, "databaseScope") == 3)
      {
        v11 = v4->_options;
        if (v11 && (notificationListener = v11->_notificationListener) != 0)
        {
          v13 = notificationListener;
        }
        else if (-[NSString length](-[NSCloudKitMirroringDelegateOptions apsConnectionMachServiceName](v11, "apsConnectionMachServiceName"), "length"))
        {
          v13 = (CKNotificationListener *)objc_msgSend(objc_alloc((Class)getCloudKitCKNotificationListenerClass[0]()), "initWithMachServiceName:", -[NSCloudKitMirroringDelegateOptions apsConnectionMachServiceName](v4->_options, "apsConnectionMachServiceName"));
        }
        else
        {
          v13 = (CKNotificationListener *)objc_alloc_init((Class)getCloudKitCKNotificationListenerClass[0]());
        }
      }
      else
      {
        v13 = 0;
      }
      v4->_notificationListener = v13;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v4;
}

dispatch_queue_t __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.coredata.cloudkit.queue", v0);
  qword_1ECD8DB28 = (uint64_t)result;
  return result;
}

void __47__NSCloudKitMirroringDelegate_initWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSCloudKitMirroringDelegateResetRequest *v5;
  id WeakRetained;
  _QWORD v7[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = 134415;
    if ((objc_msgSend(a2, "isEqualToString:", getCloudKitCKIdentityUpdateNotification[0]()) & 1) != 0)
    {
      v3 = 134416;
    }
    else if (!objc_msgSend(a2, "isEqualToString:", getCloudKitCKAccountChangedNotification[0]()))
    {
      v4 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v3, 0);
LABEL_7:
    v5 = -[NSCloudKitMirroringDelegateResetRequest initWithError:completionBlock:]([NSCloudKitMirroringDelegateResetRequest alloc], "initWithError:completionBlock:", v4, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke;
    v7[3] = &unk_1E1EE0D88;
    v7[4] = WeakRetained;
    v7[5] = v5;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)WeakRetained, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule.enqueue"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v7);

  }
}

- (NSCloudKitMirroringDelegate)initWithCloudKitContainerOptions:(id)a3
{
  NSCloudKitMirroringDelegateOptions *v5;
  NSCloudKitMirroringDelegateOptions *v6;
  NSCloudKitMirroringDelegate *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (NSCloudKitMirroringDelegateOptions *)a3;
  else
    v5 = -[NSCloudKitMirroringDelegateOptions initWithCloudKitContainerOptions:]([NSCloudKitMirroringDelegateOptions alloc], "initWithCloudKitContainerOptions:", a3);
  v6 = v5;
  v7 = -[NSCloudKitMirroringDelegate initWithOptions:](self, "initWithOptions:", v5);

  return v7;
}

- (void)registerForAccountAndIdentityNotificationsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if (!*(_BYTE *)(a1 + 112))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_ckAccountOrIdentityChangedHandler_, getCloudKitCKAccountChangedNotification[0](), 0);
      *(_BYTE *)(a1 + 112) = 1;
    }
    if (!*(_BYTE *)(a1 + 113))
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel_ckAccountOrIdentityChangedHandler_, getCloudKitCKIdentityUpdateNotification[0](), *(_QWORD *)(a1 + 48));
        *(_BYTE *)(a1 + 113) = 1;
      }
    }
    objc_autoreleasePoolPop(v2);
  }
}

- (void)removeNotificationRegistrations
{
  void *v2;
  id Weak;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    Weak = objc_loadWeak((id *)(a1 + 128));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", a1, getCloudKitCKAccountChangedNotification[0](), 0);
    objc_msgSend(v4, "removeObserver:name:object:", a1, getCloudKitCKIdentityUpdateNotification[0](), *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), objc_loadWeak((id *)(a1 + 120)));
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), Weak);
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), Weak);
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("NSPersistentStoreRemoteChangeNotification"), Weak);
    *(_WORD *)(a1 + 112) = 0;
    objc_autoreleasePoolPop(v2);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSCloudKitMirroringDelegate removeNotificationRegistrations]((uint64_t)self);

  self->_coredatadClient = 0;
  self->_cloudKitQueue = 0;

  self->_options = 0;
  self->_currentUserRecordID = 0;

  self->_databaseSubscription = 0;
  self->_container = 0;

  self->_database = 0;
  self->_scheduler = 0;

  self->_notificationListener = 0;
  self->_lastInitializationError = 0;

  self->_exporterOptions = 0;
  objc_storeWeak((id *)&self->_observedStore, 0);
  objc_storeWeak((id *)&self->_observedCoordinator, 0);

  self->_sharingUIObserver = 0;
  self->_applicationMonitor = 0;

  self->_accountChangeObserver = 0;
  self->_setupActivityIdentifier = 0;

  self->_activityGroupName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegate;
  -[NSCloudKitMirroringDelegate dealloc](&v3, sel_dealloc);
}

- (BOOL)validateManagedObjectModel:(id)a3 forUseWithStoreWithDescription:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  PFCloudKitModelValidator *v12;
  PFCloudKitModelValidator *v13;
  NSCloudKitMirroringDelegateOptions *options;
  PFCloudKitOptionsValidator *v15;
  BOOL v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  if (self->_hadObservedStore)
  {
    v6 = *MEMORY[0x1E0CB28A8];
    v40 = *MEMORY[0x1E0CB2D68];
    v41 = CFSTR("Instances of NSCloudKitMirroringDelegate are not reusable and should have a lifecycle tied to a given instance of NSPersistentStore.");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v35 = v7;
    if (v7)
      goto LABEL_3;
LABEL_20:
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
    v33 = __pflogFaultLog;
    v8 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v8)
      return v8;
    *(_DWORD *)buf = 136315394;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
    v38 = 1024;
    v39 = 397;
    _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_22:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "options"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey")), "BOOLValue") & 1) != 0)
  {
LABEL_6:
    LOBYTE(v8) = 1;
    return v8;
  }
  v12 = -[PFCloudKitModelValidator initWithManagedObjectModel:configuration:mirroringDelegateOptions:]([PFCloudKitModelValidator alloc], "initWithManagedObjectModel:configuration:mirroringDelegateOptions:", a3, objc_msgSend(a4, "configuration"), self->_options);
  v13 = v12;
  options = self->_options;
  if (options)
    LOBYTE(options) = options->_skipCloudKitSetup;
  if (!v12)
    goto LABEL_18;
  v12->_skipValueTransformerValidation = (char)options;
  if (!-[PFCloudKitModelValidator _validateManagedObjectModel:error:]((uint64_t)v12, v12->_model, &v35))
    goto LABEL_18;
  if (!a4)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    v19 = objc_msgSend(v17, "stringWithFormat:", CFSTR("Cannot be used without an instance of %@."), NSStringFromClass(v18));
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB28A8];
    v42 = *MEMORY[0x1E0CB2D68];
    v43 = v19;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v43;
    v24 = &v42;
LABEL_17:
    v35 = (void *)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 134060, objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1));
LABEL_18:

    goto LABEL_19;
  }
  if ((objc_msgSend((id)objc_msgSend(a4, "type"), "isEqualToString:", CFSTR("SQLite")) & 1) == 0)
  {
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit integration is only supported for %@ stores."), CFSTR("SQLite"));
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB28A8];
    v44 = *MEMORY[0x1E0CB2D68];
    v45[0] = v25;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = v45;
    v24 = &v44;
    goto LABEL_17;
  }
  v15 = objc_alloc_init(PFCloudKitOptionsValidator);
  v16 = -[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:]((_BOOL8)v15, self->_options, (void *)objc_msgSend(a4, "options"), (uint64_t *)&v35);

  if (v16)
    goto LABEL_6;
LABEL_19:
  v7 = v35;
  if (!v35)
    goto LABEL_20;
LABEL_3:
  if (!a5)
    goto LABEL_22;
  LOBYTE(v8) = 0;
  *a5 = v7;
  return v8;
}

- (void)persistentStoreCoordinator:(id)a3 didSuccessfullyAddPersistentStore:(id)a4 withDescription:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__NSCloudKitMirroringDelegate_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription___block_invoke;
  v5[3] = &unk_1E1EE0CC0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.cloudkit.store.added"), (uint64_t)CFSTR("CoreData: CloudKit Add Persistent Store"), (uint64_t)v5);
}

void __108__NSCloudKitMirroringDelegate_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id Weak;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id location[10];
  _QWORD v26[5];
  id v27[5];
  _QWORD v28[4];
  id v29[2];

  v29[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (v1)
  {
    v2 = (void *)a1[5];
    v3 = (void *)a1[6];
    Weak = objc_loadWeak((id *)(v1 + 120));
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = (unint64_t)__ckLoggingOverride >= 9 ? 9 : __ckLoggingOverride;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Observing store: %@"));
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]");
    objc_autoreleasePoolPop(v5);
    if (!Weak)
    {
      v14 = (void *)MEMORY[0x18D76B4E4]();
      objc_storeWeak((id *)(v1 + 120), v2);
      objc_storeWeak((id *)(v1 + 128), v3);
      *(_BYTE *)(v1 + 88) = 1;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v1, sel_coordinatorWillRemoveStore_, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v1, sel_storesDidChange_, CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), v3);
      v15 = (id)objc_msgSend(v2, "identifier");
      *(_QWORD *)(v1 + 168) = v15;
      *(_QWORD *)(v1 + 176) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coredata.cloudkit.activity.import"), v15, v1, v2);
      *(_QWORD *)(v1 + 184) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coredata.cloudkit.activity.export"), *(_QWORD *)(v1 + 168));
      *(_QWORD *)(v1 + 192) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.coredata.cloudkit.activity.setup"), *(_QWORD *)(v1 + 168));
      *(_QWORD *)(v1 + 200) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coredata.cloudkit.%@.%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), *(_QWORD *)(v1 + 168));
      if (objc_msgSend(*(id *)(v1 + 8), "automaticallyScheduleImportAndExportOperations"))
      {
        objc_initWeak(location, (id)v1);
        v16 = *(void **)(v1 + 64);
        v17 = *(_QWORD *)(v1 + 184);
        v18 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke;
        v23[3] = &unk_1E1EE0CE8;
        objc_copyWeak(&v24, location);
        objc_msgSend(v16, "registerActivityIdentifier:handler:", v17, v23);
        *(_BYTE *)(v1 + 146) = 1;
        objc_destroyWeak(&v24);
        v19 = *(void **)(v1 + 64);
        v20 = *(_QWORD *)(v1 + 176);
        v28[0] = v18;
        v28[1] = 3221225472;
        v28[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_2;
        v28[3] = &unk_1E1EE0CE8;
        objc_copyWeak(v29, location);
        objc_msgSend(v19, "registerActivityIdentifier:handler:", v20, v28);
        *(_BYTE *)(v1 + 147) = 1;
        objc_destroyWeak(v29);
        v21 = *(void **)(v1 + 64);
        v22 = *(_QWORD *)(v1 + 192);
        v26[0] = v18;
        v26[1] = 3221225472;
        v26[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_3;
        v26[3] = &unk_1E1EDF4C0;
        objc_copyWeak(v27, location);
        v26[4] = v1;
        objc_msgSend(v21, "registerActivityIdentifier:handler:", v22, v26);
        *(_BYTE *)(v1 + 148) = 1;
        objc_destroyWeak(v27);
        objc_destroyWeak(location);
      }
      -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v1, 0);
      objc_autoreleasePoolPop(v14);
    }
  }
}

- (void)_openTransactionWithLabel:(uint64_t)a3 assertionLabel:(uint64_t)a4 andExecuteWorkBlock:
{
  NSCloudKitMirroringDelegateWorkBlockContext *v6;
  NSObject *v7;
  _QWORD v8[6];

  if (a1)
  {
    v6 = -[NSCloudKitMirroringDelegateWorkBlockContext initWithTransactionLabel:powerAssertionLabel:]([NSCloudKitMirroringDelegateWorkBlockContext alloc], "initWithTransactionLabel:powerAssertionLabel:", a2, a3);
    v7 = *(NSObject **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__NSCloudKitMirroringDelegate__openTransactionWithLabel_assertionLabel_andExecuteWorkBlock___block_invoke;
    v8[3] = &unk_1E1EDDAE0;
    v8[4] = v6;
    v8[5] = a4;
    dispatch_async(v7, v8);

  }
}

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]((uint64_t)WeakRetained, (uint64_t)CFSTR("ExportActivity"), a2, 0, a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v7 = 3;
    else
      v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Got called back for an export activity but the mirroring delegate is gone."));
    _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke");
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_scheduleAutomatedExportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSCloudKitMirroringRequestOptions *v19;
  NSCloudKitMirroringExportRequest *v20;
  NSCloudKitMirroringExportRequest *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[7];
  uint8_t buf[4];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v11 = 16;
    else
      v11 = __ckLoggingOverride;
    v12 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Beginning automated export - %@:\n%@"));
    _NSCoreDataLog(v11, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]");
    objc_autoreleasePoolPop(v10);
    v19 = objc_alloc_init(NSCloudKitMirroringRequestOptions);
    if (objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"))
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:](v19, "setOperationConfiguration:", objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"));
    if (a4 || (a4 = objc_msgSend(*(id *)(a1 + 224), "usableVoucherForEventType:", 2)) != 0)
    {
      v34[0] = a4;
      -[NSCloudKitMirroringRequestOptions setVouchers:](v19, "setVouchers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
    }
    v20 = [NSCloudKitMirroringExportRequest alloc];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __100__NSCloudKitMirroringDelegate__scheduleAutomatedExportWithLabel_activity_voucher_completionHandler___block_invoke;
    v31[3] = &unk_1E1EE1058;
    v31[4] = a1;
    v31[5] = a2;
    v31[6] = a5;
    v21 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:](v20, "initWithActivity:options:completionBlock:", a3, v19, v31);
    v30 = 0;
    if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](a1, v21, &v30))
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to execute mirroring request for automated export: %@");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, v30);
      v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Failed to execute mirroring request for automated export: %@", buf, 0xCu);
      }
    }

  }
}

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]((uint64_t)WeakRetained, (uint64_t)CFSTR("ImportActivity"), a2, 0, a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v7 = 3;
    else
      v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Got called back for activity: %@, but the mirroring delegate is gone."));
    _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke_2");
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_scheduleAutomatedImportWithLabel:(uint64_t)a3 activity:(uint64_t)a4 voucher:(uint64_t)a5 completionHandler:
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSCloudKitMirroringRequestOptions *v19;
  NSCloudKitMirroringImportRequest *v20;
  NSCloudKitMirroringImportRequest *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[7];
  uint8_t buf[4];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v11 = 16;
    else
      v11 = __ckLoggingOverride;
    v12 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Beginning automated import - %@ - in response to activity:\n%@"));
    _NSCoreDataLog(v11, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]");
    objc_autoreleasePoolPop(v10);
    v19 = objc_alloc_init(NSCloudKitMirroringRequestOptions);
    if (objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"))
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:](v19, "setOperationConfiguration:", objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"));
    if (a4 || (a4 = objc_msgSend(*(id *)(a1 + 224), "usableVoucherForEventType:", 1)) != 0)
    {
      v34[0] = a4;
      -[NSCloudKitMirroringRequestOptions setVouchers:](v19, "setVouchers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
    }
    v20 = [NSCloudKitMirroringImportRequest alloc];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __100__NSCloudKitMirroringDelegate__scheduleAutomatedImportWithLabel_activity_voucher_completionHandler___block_invoke;
    v31[3] = &unk_1E1EE1058;
    v31[4] = a1;
    v31[5] = a2;
    v31[6] = a5;
    v21 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:](v20, "initWithActivity:options:completionBlock:", a3, v19, v31);
    v30 = 0;
    if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](a1, v21, &v30))
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to execute mirroring request for automated import: %@");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, v30);
      v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Failed to execute mirroring request for automated import: %@", buf, 0xCu);
      }
    }

  }
}

void __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[7];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_4;
    block[3] = &unk_1E1EDF3D8;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v8, block);
  }
  else
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v10 = 3;
    else
      v10 = __ckLoggingOverride;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Got called back for activity: %@, but the mirroring delegate is gone."));
    _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate observeChangesForStore:inPersistentStoreCoordinator:]_block_invoke_3");
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __83__NSCloudKitMirroringDelegate_observeChangesForStore_inPersistentStoreCoordinator___block_invoke_4(uint64_t *a1)
{
  -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](a1[4], a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_setUpCloudKitIntegration:(uint64_t)a1
{
  NSCloudKitMirroringDelegateSetupRequestOptions *v4;
  NSCloudKitMirroringDelegateSetupRequest *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a1)
  {
    v4 = objc_alloc_init(NSCloudKitMirroringDelegateSetupRequestOptions);
    if (objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"))
      -[NSCloudKitMirroringRequestOptions setOperationConfiguration:](v4, "setOperationConfiguration:", objc_msgSend(*(id *)(a1 + 8), "defaultOperationConfiguration"));
    v5 = -[NSCloudKitMirroringRequest initWithActivity:options:completionBlock:]([NSCloudKitMirroringDelegateSetupRequest alloc], "initWithActivity:options:completionBlock:", a2, v4, 0);
    -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](a1, v5);
    v24 = 0;
    v6 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](*(_QWORD *)(a1 + 160), (uint64_t)v5, &v24);
    v7 = (void *)MEMORY[0x18D76B4E4]();
    if (v6)
    {
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v8 = 16;
      else
        v8 = __ckLoggingOverride;
      v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Successfully enqueued setup request: %@"));
      _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:]");
      objc_autoreleasePoolPop(v7);
      -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](a1);
    }
    else
    {
      v16 = __ckLoggingOverride != 0;
      v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to enqueue setup request, this likely means one is already scheduled and this has collided: %@"));
      _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:]");
      objc_autoreleasePoolPop(v7);
    }

  }
}

- (void)tearDown:(uint64_t)a1
{
  _QWORD v2[6];

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __40__NSCloudKitMirroringDelegate_tearDown___block_invoke;
    v2[3] = &unk_1E1EE0D88;
    v2[4] = a1;
    v2[5] = a2;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.teardown"), (uint64_t)CFSTR("CoreData: CloudKit Teardown"), (uint64_t)v2);
  }
}

- (void)beginActivitiesForRequest:(uint64_t)a1
{
  const char *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 8), "progressProvider");
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = -[NSPersistentCloudKitContainerEventActivity initWithRequestIdentifier:storeIdentifier:eventType:]([NSPersistentCloudKitContainerEventActivity alloc], objc_msgSend(a2, "requestIdentifier"), *(_QWORD *)(a1 + 168));
        if (a2)
          objc_setProperty_nonatomic(a2, v4, v5, 72);
        v6 = (void *)objc_msgSend(v5, "beginActivityForPhase:", 0);
        objc_msgSend(v7, "publishActivity:", v5);
        objc_msgSend(v7, "publishActivity:", v6);

      }
    }

  }
}

- (void)checkAndExecuteNextRequest
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (a1)
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v3 = 16;
    else
      v3 = __ckLoggingOverride;
    v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Checking for pending requests."));
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]");
    objc_autoreleasePoolPop(v2);
    objc_initWeak(&location, a1);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__NSCloudKitMirroringDelegate_checkAndExecuteNextRequest__block_invoke;
    v11[3] = &unk_1E1EE1030;
    objc_copyWeak(&v12, &location);
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)resetAfterError:(uint64_t)a1 andKeepContainer:(void *)a2
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[16];

  if (a1)
  {
    if (!a2)
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resetAfterError illegally passed nil instead of an error on a failure condition");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v21);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: resetAfterError illegally passed nil instead of an error on a failure condition", buf, 2u);
      }
    }
    v12 = (void *)MEMORY[0x18D76B4E4]();
    v13 = __ckLoggingOverride != 0;
    v14 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - resetting internal state after error: %@"));
    _NSCoreDataLog(v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:]");
    objc_autoreleasePoolPop(v12);
    -[NSCloudKitMirroringDelegate removeNotificationRegistrations](a1);

    *(_QWORD *)(a1 + 80) = a2;
    *(_BYTE *)(a1 + 89) = 0;

    *(_QWORD *)(a1 + 152) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](a1);
  }
}

- (BOOL)shouldAttemptSetupRecoveryFromError:(char)a3 viaPush:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[6];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  if (!a1)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = (void *)objc_msgSend(a2, "domain");
  if (!objc_msgSend(v6, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
  {
    v9 = (void *)objc_msgSend(a2, "domain");
    if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB32E8])
      || objc_msgSend(a2, "code") != -1
      && objc_msgSend(a2, "code") != -999
      && objc_msgSend(a2, "code") != -1001
      && objc_msgSend(a2, "code") != -1003
      && objc_msgSend(a2, "code") != -1004
      && objc_msgSend(a2, "code") != -1005
      && objc_msgSend(a2, "code") != -1006
      && objc_msgSend(a2, "code") != -1007
      && objc_msgSend(a2, "code") != -1008
      && objc_msgSend(a2, "code") != -1009
      && objc_msgSend(a2, "code") != -1010
      && objc_msgSend(a2, "code") != -1012
      && objc_msgSend(a2, "code") != -1013
      && objc_msgSend(a2, "code") != -1014
      && objc_msgSend(a2, "code") != -1100
      && objc_msgSend(a2, "code") != -1101
      && objc_msgSend(a2, "code") != -1102
      && objc_msgSend(a2, "code") != -1103
      && objc_msgSend(a2, "code") != -1104
      && objc_msgSend(a2, "code") != -1200
      && objc_msgSend(a2, "code") != -2000
      && objc_msgSend(a2, "code") != -3000
      && objc_msgSend(a2, "code") != -3001
      && objc_msgSend(a2, "code") != -3002
      && objc_msgSend(a2, "code") != -3003
      && objc_msgSend(a2, "code") != -3004
      && objc_msgSend(a2, "code") != -3005
      && objc_msgSend(a2, "code") != -3006
      && objc_msgSend(a2, "code") != -3007
      && objc_msgSend(a2, "code") != -1018
      && objc_msgSend(a2, "code") != -1019
      && objc_msgSend(a2, "code") != -1020
      && objc_msgSend(a2, "code") != -995
      && objc_msgSend(a2, "code") != -996
      && objc_msgSend(a2, "code") != -997)
    {
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  if (objc_msgSend(a2, "code") == 3
    || objc_msgSend(a2, "code") == 4
    || objc_msgSend(a2, "code") == 22
    || objc_msgSend(a2, "code") == 7
    || objc_msgSend(a2, "code") == 23
    || objc_msgSend(a2, "code") == 6)
  {
LABEL_47:
    a3 = 1;
LABEL_48:
    *((_BYTE *)v15 + 24) = a3;
    goto LABEL_49;
  }
  if (objc_msgSend(a2, "code") != 2)
  {
    if (objc_msgSend(a2, "code") != 25)
      goto LABEL_49;
    goto LABEL_48;
  }
  *((_BYTE *)v15 + 24) = 1;
  v7 = (void *)objc_msgSend(a2, "userInfo");
  v8 = (void *)objc_msgSend(v7, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey[0]());
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__NSCloudKitMirroringDelegate_shouldAttemptSetupRecoveryFromError_viaPush___block_invoke;
  v12[3] = &unk_1E1EE0D10;
  v13 = a3;
  v12[4] = a1;
  v12[5] = &v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
LABEL_49:
  v10 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __75__NSCloudKitMirroringDelegate_shouldAttemptSetupRecoveryFromError_viaPush___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  getCloudKitCKRecordIDClass[0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (getCloudKitCKRecordZoneIDClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), result = objc_opt_isKindOfClass(), (result & 1) != 0))
  {
    result = -[NSCloudKitMirroringDelegate shouldAttemptSetupRecoveryFromError:viaPush:](*(_QWORD *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 48));
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

void __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__NSCloudKitMirroringDelegate__respondToPushNotification_forSubscription___block_invoke;
    v16[3] = &unk_1E1EE0CC0;
    v16[4] = WeakRetained;
    v16[5] = a3;
    v16[6] = a2;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)WeakRetained, (uint64_t)CFSTR("com.apple.coredata.cloudkit.push"), (uint64_t)CFSTR("CoreData: CloudKit Responding to Push"), (uint64_t)v16);
  }
  else
  {
    v7 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v8 = 3;
    else
      v8 = __ckLoggingOverride;
    v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Got called back for subscription: %@, but the mirroring delegate is gone. Notification:\n%@"));
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }

}

- (void)scheduleExportAndStartAfterDate:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 && objc_msgSend(*(id *)(a1 + 8), "automaticallyScheduleImportAndExportOperations"))
  {
    if (*(_BYTE *)(a1 + 89))
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 224), "usableVoucherForEventType:", 2);
      v5 = v4;
      if (a2)
      {
        v6 = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](a1, *(_QWORD *)(a1 + 184), v4);
        objc_msgSend(v6, "setEarliestStartDate:", a2);
      }
      else
      {
        if (objc_msgSend((id)objc_msgSend(v4, "operationConfiguration"), "qualityOfService") > 24)
        {
          -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:](a1, (uint64_t)CFSTR("AutomatedExportBypassingDasdDueToVoucher"), 0, (uint64_t)v5, 0);
          return;
        }
        v6 = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](a1, *(_QWORD *)(a1 + 184), v5);
      }
      objc_msgSend(*(id *)(a1 + 64), "submitActivity:", v6);

    }
    else
    {
      v7 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v8 = 16;
      else
        v8 = __ckLoggingOverride;
      v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Deferring export because the mirroring delegate is not initialized:\n%@"));
      _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:]");
      objc_autoreleasePoolPop(v7);
    }
  }
}

void __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 && *(_QWORD *)(v3 + 152))
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]((uint64_t)WeakRetained, (uint64_t)CFSTR("SandboxExport"), 0, 0, 0);
      WeakRetained = v13;
    }
    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]((uint64_t)WeakRetained, (uint64_t)CFSTR("SandboxImport"), 0, 0, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v5 = 9;
    else
      v5 = __ckLoggingOverride;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Tried to schedule sandbox operations but the mirroring delegate was gone."));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]_block_invoke_2");
    objc_autoreleasePoolPop(v4);
  }

}

- (void)checkAndScheduleImportIfNecessaryFromPush:(char)a3 fromErrorRecovery:fromShareAccept:andStartAfterDate:
{
  _QWORD v3[6];
  char v4;
  char v5;
  char v6;

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
    v3[3] = &unk_1E1EE1008;
    v4 = a2;
    v5 = 0;
    v6 = a3;
    v3[4] = a1;
    v3[5] = 0;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v3);
  }
}

void __40__NSCloudKitMirroringDelegate_tearDown___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSCloudKitMirroringResult *v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = __ckLoggingOverride != 0;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Told to tear down with reason: %@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate tearDown:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 146))
  {
    objc_msgSend(*(id *)(v11 + 64), "unregisterActivityIdentifier:", *(_QWORD *)(v11 + 184));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 146) = 0;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 147))
  {
    objc_msgSend(*(id *)(v11 + 64), "unregisterActivityIdentifier:", *(_QWORD *)(v11 + 176));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 147) = 0;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 148))
  {
    objc_msgSend(*(id *)(v11 + 64), "unregisterActivityIdentifier:", *(_QWORD *)(v11 + 192));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 148) = 0;
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 145))
  {
    objc_msgSend(*(id *)(v11 + 72), "unregisterForSubscriptionWithID:inDatabase:", objc_msgSend(*(id *)(v11 + 40), "subscriptionID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 0;
    v11 = *(_QWORD *)(a1 + 32);
  }
  -[NSCloudKitMirroringDelegate removeNotificationRegistrations](v11);
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 89))
  {
    v13 = -[NSCloudKitMirroringRequestManager dequeueAllPendingRequests](*(id **)(v12 + 160));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      v17 = *MEMORY[0x1E0CB28A8];
      v18 = *MEMORY[0x1E0CB2D68];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x18D76B4E4]();
          if ((unint64_t)__ckLoggingOverride >= 0x10)
            v22 = 16;
          else
            v22 = __ckLoggingOverride;
          v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Cancelling pending request: %@"));
          v32 = *(_QWORD *)(a1 + 32);
          _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[NSCloudKitMirroringDelegate tearDown:]_block_invoke");
          objc_autoreleasePoolPop(v21);
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v38 = v18;
          v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v20, "requestIdentifier"), 845, v32, v20);
          v31 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", v20, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 0, 0, objc_msgSend(v30, "errorWithDomain:code:userInfo:", v17, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1)));
          -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:]((uint64_t)v20, (uint64_t)v31);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v15);
    }

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 120), 0);
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 128), 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  }
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "object");
  if (v4 == objc_loadWeak((id *)&self->_observedStore))
    -[NSCloudKitMirroringDelegate tearDown:]((uint64_t)self, (uint64_t)CFSTR("Store Removed"));
}

- (void)storesDidChange:(id)a3
{
  id Weak;

  Weak = objc_loadWeak((id *)&self->_observedCoordinator);
  if (Weak == (id)objc_msgSend(a3, "object"))
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("removed")), "containsObject:", objc_loadWeak((id *)&self->_observedStore)))-[NSCloudKitMirroringDelegate tearDown:]((uint64_t)self, (uint64_t)CFSTR("Stores Changed"));
  }
}

- (void)ckAccountOrIdentityChangedHandler:(id)a3
{
  -[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]((uint64_t)self->_accountChangeObserver, a3);
}

void __74__NSCloudKitMirroringDelegate__respondToPushNotification_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int16 v45;
  char v46;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Got notification for subscription: %@\n%@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate _respondToPushNotification:forSubscription:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 89))
  {
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
    v42 = &unk_1E1EE1008;
    v45 = 1;
    v46 = 0;
    v43 = v11;
    v44 = 0;
    v12 = CFSTR("com.apple.coredata.cloudkit.schedule");
    v13 = CFSTR("CoreData: CloudKit Scheduling");
    v14 = v11;
LABEL_32:
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v14, (uint64_t)v12, (uint64_t)v13, (uint64_t)&v39);
    return;
  }
  v15 = *(void **)(v11 + 80);
  v16 = (void *)objc_msgSend(v15, "domain");
  if (!objc_msgSend(v16, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
  {
    if (objc_msgSend((id)objc_msgSend(v15, "domain"), "isEqualToString:", CFSTR("kCFErrorDomainCFNetwork")))
    {
      if (objc_msgSend(v15, "code") != 2
        && objc_msgSend(v15, "code") != 303
        && objc_msgSend(v15, "code") != 310
        && objc_msgSend(v15, "code") != 311)
      {
        goto LABEL_34;
      }
    }
    else if (objc_msgSend((id)objc_msgSend(v15, "domain"), "isEqualToString:", CFSTR("NSSQLiteErrorDomain")))
    {
      if (objc_msgSend(v15, "code") != 266
        && objc_msgSend(v15, "code") != 3
        && objc_msgSend(v15, "code") != 1034
        && objc_msgSend(v15, "code") != 23
        && objc_msgSend(v15, "code") != 769)
      {
        goto LABEL_34;
      }
    }
    else
    {
      v20 = (void *)objc_msgSend(v15, "domain");
      if (!objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28A8])
        || objc_msgSend(v15, "code") != 4099 && objc_msgSend(v15, "code") != 4097)
      {
        goto LABEL_34;
      }
    }
LABEL_29:
    v18 = (void *)MEMORY[0x18D76B4E4]();
    v19 = __ckLoggingOverride != 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v15, "code") == 111 || objc_msgSend(v15, "code") == 20 || objc_msgSend(v15, "code") == 6)
    goto LABEL_29;
  if (objc_msgSend(v15, "code") == 2)
  {
    v17 = -[NSCloudKitMirroringDelegate shouldAttemptSetupRecoveryFromError:viaPush:](v11, v15, 1);
    v18 = (void *)MEMORY[0x18D76B4E4]();
    v19 = __ckLoggingOverride != 0;
    if (!v17)
      goto LABEL_35;
LABEL_30:
    v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Reviving the mirroring delegate after notification for subscription: %@\n%@"));
    _NSCoreDataLog(v19, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[NSCloudKitMirroringDelegate _respondToPushNotification:forSubscription:]_block_invoke");
    objc_autoreleasePoolPop(v18);
    v14 = *(_QWORD *)(a1 + 32);
    if (!v14)
      return;
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __73__NSCloudKitMirroringDelegate_setupMirroringDelegateFromPushNotification__block_invoke;
    v42 = &unk_1E1EE0F90;
    v43 = v14;
    v12 = CFSTR("com.apple.coredata.cloudkit.setup.push");
    v13 = CFSTR("CoreData: CloudKit Setup From Push");
    goto LABEL_32;
  }
LABEL_34:
  v18 = (void *)MEMORY[0x18D76B4E4]();
  v19 = __ckLoggingOverride != 0;
LABEL_35:
  v28 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Not reviving the mirroring delegate (%@:%ld) after notification for subscription: %@\n%@"));
  v29 = *(_QWORD *)(a1 + 32);
  if (v29)
    v30 = *(void **)(v29 + 80);
  else
    v30 = 0;
  objc_msgSend(v30, "domain");
  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    v32 = *(void **)(v31 + 80);
  else
    v32 = 0;
  objc_msgSend(v32, "code");
  _NSCoreDataLog(v19, v28, v33, v34, v35, v36, v37, v38, (uint64_t)"-[NSCloudKitMirroringDelegate _respondToPushNotification:forSubscription:]_block_invoke");
  objc_autoreleasePoolPop(v18);
}

id __92__NSCloudKitMirroringDelegate__openTransactionWithLabel_assertionLabel_andExecuteWorkBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(id *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v2, "drain");

  return 0;
}

- (NSPersistentStoreResult)executeMirroringRequest:(uint64_t *)a3 error:
{
  uint64_t v5;
  NSPersistentStoreResult *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE buf[24];
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = (uint64_t)result;
    v6 = objc_alloc_init(NSPersistentStoreResult);
    v32 = 0;
    v7 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v8 = 16;
    else
      v8 = __ckLoggingOverride;
    v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Asked to execute request: %@"));
    v31 = a2;
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate executeMirroringRequest:error:]");
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(a2, "validateForUseWithStore:error:", objc_loadWeak((id *)(v5 + 120)), &v32))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {

                        v17 = (void *)MEMORY[0x1E0CB35C8];
                        v18 = *MEMORY[0x1E0CB28A8];
                        v33 = *MEMORY[0x1E0CB2D68];
                        v19 = (void *)MEMORY[0x1E0CB3940];
                        v20 = (objc_class *)objc_opt_class();
                        v21 = NSStringFromClass(v20);
                        v22 = (objc_class *)objc_opt_class();
                        v34 = objc_msgSend(v19, "stringWithFormat:", CFSTR("Instances of '%@' are ambiguous and not understood by '%@', use one of the subclasses instead."), v21, NSStringFromClass(v22), v5, v31);
                        v16 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 134091, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
                        v32 = v16;
                        if (v16)
                        {
LABEL_19:
                          if (a3)
                          {
                            v6 = 0;
                            *a3 = v16;
                            return v6;
                          }
LABEL_24:
                          v6 = 0;
                          return v6;
                        }
LABEL_22:
                        v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                        _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
                        v30 = __pflogFaultLog;
                        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 136315394;
                          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = 1007;
                          _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                        }
                        goto LABEL_24;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke;
      v36 = &unk_1E1EE0D88;
      v37 = v5;
      v38 = a2;
      -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v5, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule.enqueue"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)buf);
      if (v6)
        return v6;
    }
    else
    {

    }
    v16 = v32;
    if (v32)
      goto LABEL_19;
    goto LABEL_22;
  }
  return result;
}

void __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id Weak;
  id v15;
  _QWORD v16[5];
  __int128 v17;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: enqueuing request: %@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11 && (v12 = *(_QWORD *)(v11 + 8)) != 0)
    v13 = *(void **)(v12 + 88);
  else
    v13 = 0;
  Weak = objc_loadWeak((id *)(v11 + 120));
  v15 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v13, (uint64_t)Weak);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke_2;
  v16[3] = &unk_1E1EDD790;
  v16[4] = v15;
  v17 = *(_OWORD *)(a1 + 32);
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v15, (uint64_t)v16);

}

void __47__NSCloudKitMirroringDelegate__enqueueRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSCloudKitMirroringResult *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSCloudKitMirroringResult *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (!v2)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v32 = *MEMORY[0x1E0CB2D68];
    v33[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1 + 48), "requestIdentifier"));
    v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
    v18 = [NSCloudKitMirroringResult alloc];
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
    v21 = v17;
LABEL_14:
    v30 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v18, "initWithRequest:storeIdentifier:success:madeChanges:error:", v19, v20, 0, 0, v21);
    -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](*(_QWORD *)(a1 + 48), (uint64_t)v30);

    goto LABEL_15;
  }
  v31 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 160);
  else
    v4 = 0;
  v5 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](v4, *(_QWORD *)(a1 + 48), &v31);
  v6 = (void *)MEMORY[0x18D76B4E4]();
  if (!v5)
  {
    if ((unint64_t)__ckLoggingOverride >= 3)
      v22 = 3;
    else
      v22 = __ckLoggingOverride;
    v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to enqueue request: %@\n%@"));
    _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v6);
    v18 = [NSCloudKitMirroringResult alloc];
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
    v21 = v31;
    goto LABEL_14;
  }
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v7 = 16;
  else
    v7 = __ckLoggingOverride;
  v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Enqueued request: %@"));
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _enqueueRequest:]_block_invoke_2");
  objc_autoreleasePoolPop(v6);
  -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](*(void **)(a1 + 40));
LABEL_15:

}

- (void)_performSetupRequest:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "requestCompletionBlock"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Setup request executed with a completion block that will never be called: %@");
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a2;
      _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Setup request executed with a completion block that will never be called: %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke;
  v12[3] = &unk_1E1EE0D88;
  v12[4] = a1;
  v12[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.setup"), (uint64_t)CFSTR("CoreData: CloudKit Setup"), (uint64_t)v12);
}

- (void)_performDelegateResetRequest:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a2 || !*(_QWORD *)(a2 + 80))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Reset request was scheduled without a root cause error: %@");
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a2);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a2;
      _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Reset request was scheduled without a root cause error: %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NSCloudKitMirroringDelegate__performDelegateResetRequest___block_invoke;
  v12[3] = &unk_1E1EE0D88;
  v12[4] = a1;
  v12[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.setup.reset"), (uint64_t)CFSTR("CoreData: CloudKit Setup Reset"), (uint64_t)v12);
}

- (void)_performSchemaInitializationRequest:(uint64_t)a1
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke;
  v2[3] = &unk_1E1EE0D88;
  v2[4] = a2;
  v2[5] = a1;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schema.initialize"), (uint64_t)CFSTR("CoreData: CloudKit Initialize Schema"), (uint64_t)v2);
}

- (void)_performSerializationRequest:(uint64_t)a1
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke;
  v2[3] = &unk_1E1EE0D88;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.serialization"), (uint64_t)CFSTR("CoreData: CloudKit Record Serialization"), (uint64_t)v2);
}

- (void)_performExportProgressRequest:(uint64_t)a1
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke;
  v2[3] = &unk_1E1EE0D88;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.progress.export"), (uint64_t)CFSTR("CoreData: CloudKit Export Progress"), (uint64_t)v2);
}

- (void)_performAcceptShareInvitationsRequest:(uint64_t)a1
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke;
  v2[3] = &unk_1E1EE0D88;
  v2[4] = a1;
  v2[5] = a2;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.share.accept"), (uint64_t)CFSTR("CoreData: CloudKit Share Accept Invitation"), (uint64_t)v2);
}

void __60__NSCloudKitMirroringDelegate__performDelegateResetRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSCloudKitMirroringResult *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      v4 = *(void **)(v3 + 80);
    else
      v4 = 0;
    -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v2, v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v2, 0);
  v5 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 1, 0, 0);
  -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), v5);

}

- (uint64_t)_finishedRequest:(void *)a3 withResult:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v7 = 16;
    else
      v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished request: %@ with result: %@"));
    _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _finishedRequest:withResult:]");
    objc_autoreleasePoolPop(v6);
    -[NSCloudKitMirroringRequestManager requestFinished:](*(_QWORD *)(v5 + 160), a2);
    v15 = objc_msgSend(a3, "error");
    if (a2)
      v16 = (void *)a2[9];
    else
      v16 = 0;
    v17 = v16;
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "finishWithError:", v15);
      objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "progressProvider"), "publishActivity:", v18);
    }

    if ((objc_msgSend(a3, "success") & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = (uint64_t)a2;
LABEL_13:
      -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](v19, (uint64_t)a3);
      return -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](v5);
    }
    v20 = (void *)objc_msgSend(a3, "error");
    if (a3)
    {
      if (objc_msgSend(a3, "success") && v20)
      {
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "handleErrorInResult passed a sucessful result (%@) with an illegal error object (%@)");
        _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)a3);
        v28 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          goto LABEL_27;
        *(_DWORD *)buf = 138412546;
        v52 = a3;
        v53 = 2112;
        v54 = v20;
        v29 = "CoreData: handleErrorInResult passed a sucessful result (%@) with an illegal error object (%@)";
        v30 = v28;
        v31 = 22;
      }
      else
      {
        if ((objc_msgSend(a3, "success") & 1) != 0
          || v20
          || (v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "handleErrorInResult illegally passed a failed result (%@) with nil instead of an error on a failure condition"), _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)a3), v47 = __pflogFaultLog, !os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
        {
LABEL_27:
          v48 = objc_msgSend(a3, "request");
          v49 = (void *)objc_msgSend(v20, "domain");
          if (objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
          {
            if (objc_msgSend(v20, "code") == 134407)
            {
              -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v5, v20);
LABEL_33:
              v19 = v48;
              goto LABEL_13;
            }
            if (objc_msgSend(v20, "code") == 134406
              || objc_msgSend(v20, "code") == 134418
              || objc_msgSend(v20, "code") == 134419)
            {
              goto LABEL_33;
            }
          }
          if (-[NSCloudKitMirroringDelegate recoverFromError:](v5, (uint64_t)v20))
            -[NSCloudKitMirroringDelegate _requestEncounteredRecoverableError:withResult:](v5, v48, a3);
          else
            -[NSCloudKitMirroringDelegate _requestEncounteredUnrecoverableError:withResult:](v5, v48, a3);
          return -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](v5);
        }
        *(_DWORD *)buf = 138412290;
        v52 = a3;
        v29 = "CoreData: handleErrorInResult illegally passed a failed result (%@) with nil instead of an error on a failure condition";
        v30 = v47;
        v31 = 12;
      }
    }
    else
    {
      v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "handleErrorInResult illegally passed nil instead of a result");
      _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, v50);
      v39 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v29 = "CoreData: handleErrorInResult illegally passed nil instead of a result";
      v30 = v39;
      v31 = 2;
    }
    _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_27;
  }
  return result;
}

void __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSPersistentCloudKitContainerEvent *v19;
  uint64_t v20;
  PFCloudKitSetupAssistant *v21;
  int v22;
  NSPersistentCloudKitContainerEvent *setupEvent;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CKDatabase *database;
  void *v35;
  CKDatabaseSubscription *databaseSubscription;
  void *v37;
  CKContainer *container;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  CKRecordID *currentUserRecordID;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id Weak;
  PFApplicationStateMonitor *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CKContainer *v82;
  CKContainer *v83;
  __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  CKContainer *v113;
  uint64_t v114;
  CKContainer *v115;
  uint64_t v116;
  _BYTE *v117;
  NSCloudKitMirroringResult *v118;
  uint64_t v119;
  uint64_t v120;
  NSCloudKitMirroringResult *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  _BOOL8 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char context;
  void *contexta;
  void *contextb;
  id v144;
  _QWORD v145[4];
  id v146;
  _QWORD v147[4];
  id v148;
  __CFString *v149;
  id from[2];
  uint64_t v151;
  const __CFString *v152;
  uint64_t v153;
  _QWORD v154[4];
  id v155;
  id location;
  uint64_t v157;
  void (*v158)(uint64_t);
  void *v159;
  uint64_t v160;
  id v161;
  char v162;
  __int16 v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  v144 = (id)objc_msgSend(v4, "progressProvider");
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 89))
  {
    v20 = objc_msgSend(*(id *)(v5 + 224), "usableVoucherForEventType:", 0);
    if (v20)
    {
      v153 = v20;
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "options"), "setVouchers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1));
    }
    v21 = -[PFCloudKitSetupAssistant initWithSetupRequest:mirroringOptions:observedStore:]([PFCloudKitSetupAssistant alloc], "initWithSetupRequest:mirroringOptions:observedStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), WeakRetained);
    v149 = 0;
    v22 = -[PFCloudKitSetupAssistant _initializeCloudKitForObservedStore:andNoteMetadataInitialization:]((uint64_t)v21, &v149, (_BYTE *)(*(_QWORD *)(a1 + 32) + 144));
    if (v21)
      setupEvent = v21->_setupEvent;
    else
      setupEvent = 0;
    v19 = setupEvent;
    if (v22)
    {
      v24 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 3)
        v25 = 3;
      else
        v25 = __ckLoggingOverride;
      v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Successfully set up CloudKit integration for store (%@): %@"));
      objc_msgSend(WeakRetained, "identifier");
      _NSCoreDataLog(v25, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
      objc_autoreleasePoolPop(v24);
      v33 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      if (v33)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
      }
      if (v21)
        database = v21->_database;
      else
        database = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = database;
      v35 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (v35)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
      }
      if (v21)
        databaseSubscription = v21->_databaseSubscription;
      else
        databaseSubscription = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = databaseSubscription;
      v37 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      if (v37)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      }
      if (v21)
        container = v21->_container;
      else
        container = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = container;
      v39 = *(_QWORD *)(a1 + 32);
      v40 = *(void **)(v39 + 216);
      if (v40)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
        v39 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v39 + 48)
        && (objc_msgSend(*(id *)(v39 + 8), "databaseScope") == 2
         || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "databaseScope") == 3))
      {
        objc_initWeak(&location, *(id *)(a1 + 32));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = objc_msgSend(objc_alloc(getCloudKitCKSystemSharingUIObserverClass()), "initWithContainer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v41 = MEMORY[0x1E0C809B0];
        v147[0] = MEMORY[0x1E0C809B0];
        v147[1] = 3221225472;
        v147[2] = __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke_2;
        v147[3] = &unk_1E1EE0DB0;
        objc_copyWeak(&v148, &location);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setSystemSharingUIDidSaveShareBlock:", v147);
        v145[0] = v41;
        v145[1] = 3221225472;
        v145[2] = __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke_3;
        v145[3] = &unk_1E1EE0DD8;
        objc_copyWeak(&v146, &location);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setSystemSharingUIDidStopSharingBlock:", v145);
        objc_destroyWeak(&v146);
        objc_destroyWeak(&v148);
        objc_destroyWeak(&location);
      }
      if (v21)
        currentUserRecordID = v21->_currentUserRecordID;
      else
        currentUserRecordID = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = currentUserRecordID;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = -[PFCloudKitExporterOptions initWithDatabase:options:]([PFCloudKitExporterOptions alloc], "initWithDatabase:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v43 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v43 + 152)
        || (v44 = objc_msgSend(*(id *)(v43 + 8), "databaseScope"), v43 = *(_QWORD *)(a1 + 32), v44 == 1))
      {
        *(_BYTE *)(v43 + 89) = 1;
        goto LABEL_43;
      }
      v116 = *(_QWORD *)(v43 + 8);
      if (v116)
      {
        v117 = (_BYTE *)(v43 + 89);
        if (*(_BYTE *)(v116 + 12))
        {
          *v117 = 1;
LABEL_43:
          v45 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v45 + 89))
          {
            v46 = *(void **)(v45 + 80);
            if (v46)
            {

              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
              v45 = *(_QWORD *)(a1 + 32);
            }
            context = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "options"), "fromNotification");
            if (v45)
            {
              v47 = (void *)MEMORY[0x18D76B4E4]();
              Weak = objc_loadWeak((id *)(v45 + 128));
              -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](v45);
              objc_initWeak(from, (id)v45);
              if (objc_msgSend(*(id *)(v45 + 8), "automaticallyScheduleImportAndExportOperations"))
              {
                if (*(_QWORD *)(v45 + 152))
                {
                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v45, sel_managedObjectContextSaved_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), Weak);
                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v45, sel_remoteStoreDidChange_, CFSTR("NSPersistentStoreRemoteChangeNotification"), Weak);
                }
                v49 = *(PFApplicationStateMonitor **)(v45 + 40);
                if (v49 && !*(_BYTE *)(v45 + 145))
                {
                  v50 = *(void **)(v45 + 72);
                  v140 = -[PFApplicationStateMonitor subscriptionID](v49, "subscriptionID");
                  v51 = *(_QWORD *)(v45 + 56);
                  v154[0] = MEMORY[0x1E0C809B0];
                  v154[1] = 3221225472;
                  v154[2] = __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke;
                  v154[3] = &unk_1E1EE0D38;
                  objc_copyWeak(&v155, from);
                  objc_msgSend(v50, "registerForSubscriptionWithID:inDatabase:handler:", v140, v51, v154);
                  *(_BYTE *)(v45 + 145) = 1;
                  objc_destroyWeak(&v155);
                }
                if (!*(_QWORD *)(v45 + 208))
                {
                  v49 = objc_alloc_init(PFApplicationStateMonitor);
                  *(_QWORD *)(v45 + 208) = v49;
                  if (v49)
                    v49 = (PFApplicationStateMonitor *)objc_storeWeak((id *)&v49->_delegate, (id)v45);
                }
                if (*(_QWORD *)(v45 + 152))
                {
                  v52 = (void *)MEMORY[0x18D76B4E4](v49);
                  v53 = __ckLoggingOverride;
                  v54 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Scheduling post-setup export"));
                  if (v53 >= 0x10)
                    v61 = 16;
                  else
                    v61 = v53;
                  _NSCoreDataLog(v61, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"-[NSCloudKitMirroringDelegate _beginWatchingForChanges:]");
                  objc_autoreleasePoolPop(v52);
                  -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](v45, 0);
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(v45 + 48), "containerID"), "environment") == 2)
                {
                  location = (id)MEMORY[0x1E0C809B0];
                  v157 = 3221225472;
                  v158 = __56__NSCloudKitMirroringDelegate__beginWatchingForChanges___block_invoke_2;
                  v159 = &unk_1E1EE0D60;
                  objc_copyWeak(&v161, from);
                  v160 = v45;
                  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v45, (uint64_t)CFSTR("com.apple.coredata.cloudkit.setup.operations"), (uint64_t)CFSTR("CoreData: CloudKit Sandbox Operations"), (uint64_t)&location);
                  objc_destroyWeak(&v161);
                }
                else
                {
                  location = (id)MEMORY[0x1E0C809B0];
                  v157 = 3221225472;
                  v158 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
                  v159 = &unk_1E1EE1008;
                  v162 = context;
                  v163 = 0;
                  v160 = v45;
                  v161 = 0;
                  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v45, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)&location);
                }
              }
              objc_destroyWeak(from);
              objc_autoreleasePoolPop(v47);
            }
          }
          goto LABEL_96;
        }
      }
      else
      {
        v117 = (_BYTE *)(v43 + 89);
      }
      *v117 = 0;
      v136 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      if (v136)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      }
      v137 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v151 = *MEMORY[0x1E0CB2D60];
      v152 = CFSTR("Failed to initialize because there is no user signed in to this device.");
      v138 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(v137, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v138);
      -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](*(_QWORD *)(a1 + 32));
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 145))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "unregisterForSubscriptionWithID:inDatabase:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "subscriptionID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 0;
      }
      goto LABEL_43;
    }
    v71 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    if (v71)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = v149;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 0;
    v72 = (void *)MEMORY[0x18D76B4E4]();
    v73 = __ckLoggingOverride != 0;
    v74 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to set up CloudKit integration for store: %@\n%@"));
    _NSCoreDataLog(v73, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
    objc_autoreleasePoolPop(v72);
    if (!v149)
    {
      v105 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_initializeCloudKitForObservedStore failed but did not return an error.");
      _NSCoreDataLog(17, v105, v106, v107, v108, v109, v110, v111, v139);
      v112 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location) = 0;
        _os_log_fault_impl(&dword_18A253000, v112, OS_LOG_TYPE_FAULT, "CoreData: _initializeCloudKitForObservedStore failed but did not return an error.", (uint8_t *)&location, 2u);
      }
      goto LABEL_96;
    }
    if ((-[NSCloudKitMirroringDelegate recoverFromError:](*(_QWORD *)(a1 + 32), (uint64_t)v149) & 1) == 0)
    {
      if (v21)
      {
        v113 = v21->_container;
        if (v113)
        {
          v114 = *(_QWORD *)(a1 + 32);
          v115 = *(CKContainer **)(v114 + 48);
          if (v115 != v113)
          {

            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v21->_container;
            v114 = *(_QWORD *)(a1 + 32);
          }
          -[NSCloudKitMirroringDelegate registerForAccountAndIdentityNotificationsIfNeeded](v114);
        }
      }
      goto LABEL_96;
    }
    if (-[NSCloudKitMirroringDelegate shouldAttemptSetupRecoveryFromError:viaPush:](*(_QWORD *)(a1 + 32), v149, 0))
    {
      v81 = *(_QWORD *)(a1 + 32);
      v82 = *(CKContainer **)(v81 + 48);
      if (v21)
      {
        if (v82 == v21->_container)
          goto LABEL_74;

        v83 = v21->_container;
      }
      else
      {
        if (!v82)
        {
LABEL_74:
          v84 = v149;
          if (!v149)
          {
            v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Expected a non-nil error to schedule a setup activity from.");
            _NSCoreDataLog(17, v85, v86, v87, v88, v89, v90, v91, v139);
            v92 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              LOWORD(from[0]) = 0;
              _os_log_fault_impl(&dword_18A253000, v92, OS_LOG_TYPE_FAULT, "CoreData: Expected a non-nil error to schedule a setup activity from.", (uint8_t *)from, 2u);
            }
          }
          objc_msgSend(*(id *)(v81 + 224), "expireVouchersForEventType:", 0);
          if (objc_msgSend(*(id *)(v81 + 8), "automaticallyScheduleImportAndExportOperations"))
          {
            contexta = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v93 = 16;
            else
              v93 = __ckLoggingOverride;
            v94 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Submitting setup activity as recovery for %@"));
            objc_loadWeak((id *)(v81 + 120));
            _NSCoreDataLog(v93, v94, v95, v96, v97, v98, v99, v100, (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleSetupActivityFromError:]");
            objc_autoreleasePoolPop(contexta);
            contextb = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](v81, *(_QWORD *)(v81 + 192), 0);
            v101 = (void *)-[__CFString userInfo](v84, "userInfo");
            v102 = (void *)objc_msgSend(v101, "objectForKey:", getCloudKitCKErrorRetryAfterKey[0]());
            objc_msgSend(v102, "doubleValue");
            if (v103 > 0.0)
            {
              v104 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v102, "doubleValue");
              objc_msgSend(contextb, "setEarliestStartDate:", objc_msgSend(v104, "dateWithTimeIntervalSinceNow:"));
            }
            objc_msgSend(*(id *)(v81 + 64), "submitActivity:", contextb);
            -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v81, v84);

          }
          goto LABEL_96;
        }

        v83 = 0;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v83;
      v81 = *(_QWORD *)(a1 + 32);
      if (v81)
        goto LABEL_74;
    }
LABEL_96:

    goto LABEL_97;
  }
  v6 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 3)
    v7 = 3;
  else
    v7 = __ckLoggingOverride;
  v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Asked to set up but already successfully initialized: %@"));
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  location = 0;
  v15 = *(_QWORD *)(a1 + 32);
  if (v15 && (v16 = *(_QWORD *)(v15 + 8)) != 0)
    v17 = *(void **)(v16 + 88);
  else
    v17 = 0;
  v18 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v17, (uint64_t)WeakRetained);
  v19 = (NSPersistentCloudKitContainerEvent *)+[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(_QWORD *)(a1 + 40), (uint64_t)v18, &location);
  if (v19)
  {
    objc_msgSend(v144, "eventUpdated:", v19);
  }
  else
  {
    v62 = (void *)MEMORY[0x18D76B4E4]();
    v63 = __ckLoggingOverride != 0;
    v64 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to create setup event: %@"));
    _NSCoreDataLog(v63, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
    objc_autoreleasePoolPop(v62);
  }

LABEL_97:
  v118 = [NSCloudKitMirroringResult alloc];
  v119 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v119 + 89))
    v120 = 0;
  else
    v120 = *(_QWORD *)(v119 + 80);
  v121 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v118, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(v119 + 168), *(unsigned __int8 *)(v119 + 89) != 0, 0, v120);
  -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), v121);
  if (v19)
  {
    location = 0;
    v122 = *(_QWORD *)(a1 + 32);
    if (v122 && (v123 = *(_QWORD *)(v122 + 8)) != 0)
      v124 = *(void **)(v123 + 88);
    else
      v124 = 0;
    v125 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v124, (uint64_t)WeakRetained);
    v126 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]((uint64_t)NSCKEvent, (uint64_t)v121, (uint64_t)v125, &location);
    if (v126)
    {
      objc_msgSend(v144, "eventUpdated:", v126);
    }
    else
    {
      v127 = (void *)MEMORY[0x18D76B4E4]();
      v128 = __ckLoggingOverride != 0;
      v129 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to finish setup event: %@"));
      _NSCoreDataLog(v128, v129, v130, v131, v132, v133, v134, v135, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke");
      objc_autoreleasePoolPop(v127);
    }

  }
}

void __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id Weak;
  id v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[7];

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = *((_QWORD *)WeakRetained + 1);
      if (v5)
        v6 = *(void **)(v5 + 88);
      else
        v6 = 0;
      v18 = WeakRetained;
      Weak = objc_loadWeak((id *)WeakRetained + 15);
      v8 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v6, (uint64_t)Weak);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52__NSCloudKitMirroringDelegate__persistUpdatedShare___block_invoke;
      v19[3] = &unk_1E1EDD790;
      v19[4] = v8;
      v19[5] = v18;
      v19[6] = a3;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v8, (uint64_t)v19);

      WeakRetained = v18;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    v10 = __ckLoggingOverride != 0;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Called about a failure to save a share: %@ - %@"));
    _NSCoreDataLog(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v9);
  }
}

void __52__NSCloudKitMirroringDelegate__performSetupRequest___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  id Weak;
  id v17;
  id v18;
  _QWORD v19[7];
  id v20;
  id location;

  if (a3)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    v5 = __ckLoggingOverride != 0;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Called about a failure to delete a share: %@ - %@"));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate _performSetupRequest:]_block_invoke_3");
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v18 = WeakRetained;
      objc_initWeak(&location, WeakRetained);
      v14 = *((_QWORD *)v18 + 1);
      if (v14)
        v15 = *(void **)(v14 + 88);
      else
        v15 = 0;
      Weak = objc_loadWeak((id *)v18 + 15);
      v17 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v15, (uint64_t)Weak);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke;
      v19[3] = &unk_1E1EE10F8;
      v19[4] = v17;
      v19[5] = v18;
      v19[6] = a2;
      objc_copyWeak(&v20, &location);
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v17, (uint64_t)v19);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      WeakRetained = v18;
    }

  }
}

- (uint64_t)recoverFromError:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id Weak;
  id v24;
  uint64_t v26;
  _QWORD v27[8];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  char v31;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "recoverFromError illegally passed nil instead of an error on a failure condition");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v26);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: recoverFromError illegally passed nil instead of an error on a failure condition", buf, 2u);
      }
    }
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = (void *)MEMORY[0x18D76B4E4]();
    v13 = __ckLoggingOverride;
    v14 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Attempting recovery from error: %@"));
    _NSCoreDataLog(v13 != 0, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[NSCloudKitMirroringDelegate recoverFromError:]");
    objc_autoreleasePoolPop(v12);
    v21 = *(_QWORD *)(v2 + 8);
    if (v21)
      v22 = *(void **)(v21 + 88);
    else
      v22 = 0;
    Weak = objc_loadWeak((id *)(v2 + 120));
    v24 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v22, (uint64_t)Weak);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48__NSCloudKitMirroringDelegate_recoverFromError___block_invoke;
    v27[3] = &unk_1E1EDE590;
    v27[4] = v24;
    v27[5] = a2;
    v27[6] = v2;
    v27[7] = buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v24, (uint64_t)v27);

    v2 = v29[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  return v2;
}

void __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PFCloudKitImporterOptions *v13;
  PFCloudKitImporter *v14;
  uint64_t v15;
  NSCloudKitMirroringResult *v16;
  NSCloudKitMirroringResult *v17;
  _QWORD v18[8];
  uint64_t v19;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 && (v7 = *(_QWORD *)(v6 + 8)) != 0)
      v8 = *(void **)(v7 + 88);
    else
      v8 = 0;
    v9 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v8, (uint64_t)WeakRetained);
    v19 = 0;
    v10 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(_QWORD *)(a1 + 40), (uint64_t)v9, &v19);
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        v12 = *(void **)(v11 + 8);
      else
        v12 = 0;
      objc_msgSend((id)objc_msgSend(v12, "progressProvider"), "eventUpdated:", v10);
      v13 = -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]([PFCloudKitImporterOptions alloc], "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v9, +[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, WeakRetained), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v14 = -[PFCloudKitImporter initWithOptions:request:]([PFCloudKitImporter alloc], "initWithOptions:request:", v13, *(_QWORD *)(a1 + 40));

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke_2;
      v18[3] = &unk_1E1EDF538;
      v18[4] = v14;
      v18[5] = a2;
      v15 = *(_QWORD *)(a1 + 32);
      v18[6] = v9;
      v18[7] = v15;
      -[PFCloudKitImporter importIfNecessaryWithCompletion:]((uint64_t)v14, (uint64_t)v18);
    }
    else
    {
      v16 = [NSCloudKitMirroringResult alloc];
      v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v16, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 0, 0, v19);
      -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(_QWORD *)(a1 + 32), v17);

      v14 = 0;
    }

  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(_QWORD **)(a1 + 40));
  }
}

void __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v18 = 0;
  v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]((uint64_t)NSCKEvent, (uint64_t)a2, *(_QWORD *)(a1 + 48), &v18);
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      v8 = *(void **)(v7 + 8);
    else
      v8 = 0;
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    v10 = __ckLoggingOverride;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to finish import event: %@"));
    _NSCoreDataLog(v10 != 0, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate _performImportWithRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(_QWORD *)(a1 + 56), a2);
}

- (uint64_t)_importFinishedWithResult:(uint64_t)result importer:(void *)a2
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)MEMORY[0x1E0C99E08];
    v17[0] = CFSTR("success");
    v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "success"));
    v17[1] = CFSTR("madeChanges");
    v17[2] = CFSTR("result");
    v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "madeChanges"));
    v18[2] = a2;
    v5 = (void *)objc_msgSend(v4, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    if ((objc_msgSend(a2, "success") & 1) != 0)
    {
      if (objc_msgSend(*(id *)(v3 + 8), "automaticallyScheduleImportAndExportOperations"))
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
        v15[3] = &unk_1E1EE1008;
        v15[4] = v3;
        v16[0] = 0;
        *(_DWORD *)((char *)v16 + 7) = 0;
        -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v3, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v15);
      }
    }
    else
    {
      v6 = (void *)MEMORY[0x18D76B4E4]();
      v7 = __ckLoggingOverride != 0;
      v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Import failed with error:\n%@"));
      objc_msgSend(a2, "error");
      _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:]");
      objc_autoreleasePoolPop(v6);
    }
    if (objc_msgSend(a2, "error"))
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a2, "error"), CFSTR("error"));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v3, (_QWORD *)objc_msgSend(a2, "request"), a2);
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("PFCloudKitDidImportNotificationName"), v3, v5);
  }
  return result;
}

- (void)_requestAbortedNotInitialized:(uint64_t)a1
{
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSCloudKitMirroringResult *v14;
  uint64_t v15;
  uint64_t v16;
  NSCloudKitMirroringResult *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    v5 = __ckLoggingOverride != 0;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Never successfully initialized and cannot execute request '%@' due to error: %@"));
    v18 = *(_QWORD *)(a1 + 80);
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:]");
    objc_autoreleasePoolPop(v4);
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was aborted because the mirroring delegate never successfully initialized due to error: %@"), objc_msgSend(a2, "requestIdentifier"), *(_QWORD *)(a1 + 80), a1, a2, v18);
    v14 = [NSCloudKitMirroringResult alloc];
    v15 = *(_QWORD *)(a1 + 168);
    v16 = *MEMORY[0x1E0CB28A8];
    v19 = *MEMORY[0x1E0CB2D68];
    v20[0] = v13;
    v17 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v14, "initWithRequest:storeIdentifier:success:madeChanges:error:", a2, v15, 0, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v16, 134406, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1, a2, v17);

  }
}

void __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke(uint64_t a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PFCloudKitExporter *v23;
  PFCloudKitExporter *v24;
  void (*v25)(_QWORD, _QWORD);
  NSCloudKitMirroringResult *v26;
  NSCloudKitMirroringResult *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30[8])(_QWORD, _QWORD);
  _BYTE buf[12];
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 89))
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(_QWORD **)(a1 + 40));
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6 || !*(_QWORD *)(v6 + 152))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Illegal attempt to export without an account: %@ - %@");
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "URL");
    _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, v8);
    v15 = __pflogFaultLog;
    v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    v6 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v28 = objc_msgSend(WeakRetained, "URL");
      v29 = *(_QWORD *)(a1 + 32);
      if (v29)
        v29 = *(_QWORD *)(v29 + 8);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: %@: Illegal attempt to export without an account: %@ - %@", buf, 0x20u);
      v6 = *(_QWORD *)(a1 + 32);
      if (!v6)
        goto LABEL_20;
    }
    else if (!v6)
    {
LABEL_20:
      v18 = 0;
      goto LABEL_8;
    }
  }
  v17 = *(_QWORD *)(v6 + 8);
  if (!v17)
    goto LABEL_20;
  v18 = *(void **)(v17 + 88);
LABEL_8:
  v19 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v18, (uint64_t)WeakRetained);

  *(_QWORD *)buf = 0;
  v20 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(_QWORD *)(a1 + 40), (uint64_t)v19, buf);
  if (v20)
  {
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      v22 = *(void **)(v21 + 8);
    else
      v22 = 0;
    objc_msgSend((id)objc_msgSend(v22, "progressProvider"), "eventUpdated:", v20);
    v23 = -[PFCloudKitExporter initWithOptions:request:monitor:workQueue:]([PFCloudKitExporter alloc], "initWithOptions:request:monitor:workQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(a1 + 40), v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v24 = v23;
    if (v23)
      objc_storeWeak((id *)&v23->_delegate, *(id *)(a1 + 32));
    v30[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v30[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v30[2] = (void (*)(_QWORD, _QWORD))__57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke_292;
    v30[3] = (void (*)(_QWORD, _QWORD))&unk_1E1EDF538;
    v30[4] = a2;
    v30[5] = (void (*)(_QWORD, _QWORD))v24;
    v25 = *(void (**)(_QWORD, _QWORD))(a1 + 32);
    v30[6] = (void (*)(_QWORD, _QWORD))v19;
    v30[7] = v25;
    -[PFCloudKitExporter exportIfNecessaryWithCompletion:](v24, v30);

    v19 = 0;
  }
  else
  {
    v26 = [NSCloudKitMirroringResult alloc];
    v27 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v26, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 0, 0, *(_QWORD *)buf);
    -[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:](*(_QWORD *)(a1 + 32), v27);

  }
}

void __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke_292(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v18 = 0;
  v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]((uint64_t)NSCKEvent, (uint64_t)a2, *(_QWORD *)(a1 + 48), &v18);
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      v8 = *(void **)(v7 + 8);
    else
      v8 = 0;
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    v10 = __ckLoggingOverride;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to finish export event: %@"));
    _NSCoreDataLog(v10 != 0, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate _performExportWithRequest:]_block_invoke");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:](*(_QWORD *)(a1 + 56), a2);
}

- (uint64_t)_exportFinishedWithResult:(uint64_t)result exporter:(void *)a2
{
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(a2, "success");
    v5 = (void *)MEMORY[0x18D76B4E4]();
    if (v4)
    {
      if ((unint64_t)__ckLoggingOverride >= 3)
        v6 = 3;
      else
        v6 = __ckLoggingOverride;
      v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished export: %@"));
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:]");
    }
    else
    {
      v14 = __ckLoggingOverride != 0;
      v15 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Export failed with error:\n%@"));
      objc_msgSend(a2, "error");
      _NSCoreDataLog(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[NSCloudKitMirroringDelegate _exportFinishedWithResult:exporter:]");
    }
    objc_autoreleasePoolPop(v5);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v3, (_QWORD *)objc_msgSend(a2, "request"), a2);
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23[0] = CFSTR("madeChanges");
    v23[1] = CFSTR("result");
    v24[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "madeChanges"));
    v24[1] = a2;
    return objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("PFCloudKitDidExportNotificationName"), v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  }
  return result;
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id Weak;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  __int128 v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    v3 = *(_QWORD *)(v2 + 8);
    if (v3)
      v4 = *(void **)(v3 + 88);
    else
      v4 = 0;
    Weak = objc_loadWeak((id *)(v2 + 120));
    v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      v8 = *(void **)(v7 + 80);
    else
      v8 = 0;
    if (objc_msgSend(v8, "count"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_2;
      v22[3] = &unk_1E1EDD790;
      v22[4] = v6;
      v23 = *(_OWORD *)(a1 + 32);
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v22);
    }
    else
    {
      v9 = (void *)MEMORY[0x18D76B4E4]();
      v10 = __ckLoggingOverride;
      v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Asked to schedule a zone reset operation without a zoneID: %@"));
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      _NSCoreDataLog(v10 != 0, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke");
      objc_autoreleasePoolPop(v9);
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D68];
      v25[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The mirroring delegate could not complete request '%@' because it does not have a zone."), objc_msgSend(*(id *)(a1 + 40), "requestIdentifier"), 1646, v20, v21);
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134406, v19));
      -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40));
    }

  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(_QWORD **)(a1 + 40));
  }
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_2(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD **v28;
  void *v29;
  uint64_t v30;
  NSCloudKitMirroringResult *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSCloudKitMirroringResult *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSCloudKitMirroringResult *v50;
  NSCloudKitMirroringResult *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t *v56;
  _QWORD v57[4];
  int8x16_t v58;
  id v59;
  id location;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v54 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  v56 = a1;
  if (v54)
  {
    v65 = 0;
    v2 = a1[5];
    v3 = *(_QWORD *)(v2 + 8);
    if (v3)
      v4 = *(_QWORD *)(v3 + 96);
    else
      v4 = 0;
    v5 = a1[6];
    if (v5)
      v6 = *(_QWORD *)(v5 + 80);
    else
      v6 = 0;
    v7 = a1[4];
    v8 = objc_msgSend(*(id *)(v2 + 56), "databaseScope");
    if (v4
      && (v8 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v4, (uint64_t)v54, v7, 9, v6, v8, 0, &v65), (v8 & 1) != 0))
    {
      v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v9 = a1[6];
      if (v9)
        v10 = *(void **)(v9 + 80);
      else
        v10 = 0;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v62 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            v15 = (void *)objc_msgSend(v14, "ownerName");
            if (objc_msgSend(v15, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]()))
            {
              objc_msgSend(v55, "addObject:", v14);
            }
            else
            {
              v16 = (void *)MEMORY[0x18D76B4E4]();
              v17 = __ckLoggingOverride;
              v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Skipping delete of zone because it's not owned by the current user: %@"));
              if (v17 >= 3)
                v25 = 3;
              else
                v25 = v17;
              _NSCoreDataLog(v25, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke_2");
              objc_autoreleasePoolPop(v16);
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
        }
        while (v11);
      }
      if (objc_msgSend(v55, "count"))
      {
        v26 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]()), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v55);
        if (objc_msgSend((id)v56[6], "options"))
          -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend((id)v56[6], "options"), v26);
        objc_msgSend(v26, "setMarkZonesAsUserPurged:", 1);
        objc_initWeak(&location, (id)v56[5]);
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_3;
        v57[3] = &unk_1E1EE0E00;
        objc_copyWeak(&v59, &location);
        v58 = vextq_s8(*(int8x16_t *)(v56 + 5), *(int8x16_t *)(v56 + 5), 8uLL);
        objc_msgSend(v26, "setModifyRecordZonesCompletionBlock:", v57);
        objc_msgSend(*(id *)(v56[5] + 56), "addOperation:", v26);

        objc_destroyWeak(&v59);
        objc_destroyWeak(&location);
      }
      else
      {
        v51 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", v56[6], *(_QWORD *)(v56[5] + 168), 1, 1, 0);
        -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v56[5], (_QWORD *)v56[6], v51);

      }
    }
    else
    {
      v32 = (void *)MEMORY[0x18D76B4E4](v8);
      v33 = __ckLoggingOverride;
      v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Zone reset request failed: %@\nFailed to clear metadata from store: %@\n%@"));
      v53 = v65;
      v52 = a1[6];
      _NSCoreDataLog(v33 != 0, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[NSCloudKitMirroringDelegate _performResetZoneRequest:]_block_invoke_2");
      objc_autoreleasePoolPop(v32);
      v41 = (void *)MEMORY[0x1E0CB3940];
      v42 = objc_msgSend((id)a1[6], "requestIdentifier");
      v43 = objc_msgSend(v41, "stringWithFormat:", CFSTR("Request '%@' was aborted because the mirroring delegate failed to reset the local store's metadata: %@"), v42, v65, v52, v54, v53);
      v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v44, "setObject:forKey:", v43, *MEMORY[0x1E0CB2D68]);
      if (v65)
        objc_msgSend(v44, "setObject:forKey:", v65, *MEMORY[0x1E0CB3388]);
      v45 = [NSCloudKitMirroringResult alloc];
      v46 = a1[6];
      v47 = *(_QWORD *)(a1[5] + 168);
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v49 = (id)objc_msgSend(v44, "copy");
      v50 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v45, "initWithRequest:storeIdentifier:success:madeChanges:error:", v46, v47, 0, 0, objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134406, v49));
      -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[5], (_QWORD *)a1[6], v50);

    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v66 = *MEMORY[0x1E0CB2D68];
    v29 = (void *)a1[6];
    v28 = (_QWORD **)(a1 + 6);
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v29, "requestIdentifier"));
    v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v31 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", *v28, *(_QWORD *)(v56[5] + 168), 0, 0, objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v30));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](v56[5], *v28, v31);

  }
}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[4];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_4;
    v10[3] = &unk_1E1EDE7A8;
    v10[4] = a4;
    v11 = *(_OWORD *)(a1 + 32);
    v12 = a3;
    dispatch_async(v9, v10);
  }

}

void __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke_4(_QWORD *a1)
{
  NSCloudKitMirroringResult *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a1[5], *(_QWORD *)(a1[6] + 168), 0, 0, a1[4]);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[6], (_QWORD *)a1[5], v2);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)a1[7];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v7 = a1[5];
          if (v7)
            v8 = *(void **)(v7 + 80);
          else
            v8 = 0;
          if ((objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6)) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_17;
          }
          ++v6;
        }
        while (v4 != v6);
        v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v4 = v9;
      }
      while (v9);
    }
    v10 = 0;
LABEL_17:
    v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a1[5], *(_QWORD *)(a1[6] + 168), 1, v10, 0);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[6], (_QWORD *)a1[5], v2);
  }

}

void __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PFCloudKitImporterOptions *v14;
  PFCloudKitImporter *v15;
  uint64_t v16;
  NSCloudKitMirroringResult *v17;
  NSCloudKitMirroringResult *v18;
  _QWORD v19[8];
  uint64_t v20;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 && (v7 = *(_QWORD *)(v6 + 8)) != 0)
      v8 = *(void **)(v7 + 88);
    else
      v8 = 0;
    v9 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v8, (uint64_t)WeakRetained);
    v20 = 0;
    v10 = +[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(_QWORD *)(a1 + 40), (uint64_t)v9, &v20);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        v13 = *(void **)(v12 + 8);
      else
        v13 = 0;
      objc_msgSend((id)objc_msgSend(v13, "progressProvider"), "eventUpdated:", v11);
      v14 = -[PFCloudKitImporterOptions initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:]([PFCloudKitImporterOptions alloc], "initWithOptions:monitor:assetStorageURL:workQueue:andDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v9, +[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, WeakRetained), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v15 = -[PFCloudKitImporter initWithOptions:request:]([PFCloudKitImporter alloc], "initWithOptions:request:", v14, *(_QWORD *)(a1 + 40));

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke_2;
      v19[3] = &unk_1E1EDF538;
      v19[4] = v15;
      v19[5] = a2;
      v16 = *(_QWORD *)(a1 + 32);
      v19[6] = v9;
      v19[7] = v16;
      -[PFCloudKitImporter importIfNecessaryWithCompletion:]((uint64_t)v15, (uint64_t)v19);
    }
    else
    {
      v17 = [NSCloudKitMirroringResult alloc];
      v18 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v17, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 0, 0, v20);
      -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(_QWORD *)(a1 + 32), v18);

      v15 = 0;
      v11 = 0;
    }

  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(_QWORD **)(a1 + 40));
  }
}

void __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v18 = 0;
  v6 = (void *)+[NSCKEvent finishEventForResult:withMonitor:error:]((uint64_t)NSCKEvent, (uint64_t)a2, *(_QWORD *)(a1 + 48), &v18);
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      v8 = *(void **)(v7 + 8);
    else
      v8 = 0;
    objc_msgSend((id)objc_msgSend(v8, "progressProvider"), "eventUpdated:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x18D76B4E4]();
    v10 = __ckLoggingOverride;
    v11 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to finish import event: %@"));
    _NSCoreDataLog(v10 != 0, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[NSCloudKitMirroringDelegate _performFetchRecordsRequest:]_block_invoke_2");
    objc_autoreleasePoolPop(v9);
  }

  -[NSCloudKitMirroringDelegate _importFinishedWithResult:importer:](*(_QWORD *)(a1 + 56), a2);
}

void __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id Weak;
  id v8;
  _QWORD v9[5];
  int8x16_t v10;
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _QWORD v20[3];
  char v21;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    v3 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", objc_msgSend(*(id *)(v2 + 8), "databaseScope"));
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 && (v5 = *(_QWORD *)(v4 + 8)) != 0)
      v6 = *(void **)(v5 + 88);
    else
      v6 = 0;
    Weak = objc_loadWeak((id *)(v4 + 120));
    v8 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v6, (uint64_t)Weak);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy__42;
    v18 = __Block_byref_object_dispose__42;
    v19 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke_323;
    v9[3] = &unk_1E1EDE488;
    v9[4] = v8;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    v11 = v3;
    v12 = v20;
    v13 = &v14;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v8, (uint64_t)v9);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), (void *)v15[5]);

    v15[5] = 0;
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(v20, 8);

  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(_QWORD **)(a1 + 40));
  }
}

void __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke_323(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSCloudKitMirroringResult *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSCloudKitMirroringResult *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (!v2)
  {
    v7 = [NSCloudKitMirroringResult alloc];
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB28A8];
    v41 = *MEMORY[0x1E0CB2D68];
    v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v8, "requestIdentifier"));
    v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v13 = v7;
    v14 = v8;
    v15 = v9;
    v16 = 0;
    v17 = 0;
    goto LABEL_12;
  }
  v40 = 0;
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectIDsToReset"), "count");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!v4)
  {
    v5 = 0;
    if (v3)
      goto LABEL_4;
LABEL_7:
    v18 = *(_QWORD *)(a1 + 32);
    v43[0] = *(_QWORD *)(a1 + 56);
    v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v20 = *(_QWORD *)(a1 + 48);
    if (v20)
      v21 = *(void **)(v20 + 56);
    else
      v21 = 0;
    v22 = objc_msgSend(v21, "databaseScope");
    if (v5)
      v6 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v5, (uint64_t)v2, v18, 238, v19, v22, 0, &v40);
    else
      v6 = 0;
    goto LABEL_11;
  }
  v5 = *(_QWORD *)(v4 + 96);
  if (!v3)
    goto LABEL_7;
LABEL_4:
  v6 = -[PFCloudKitMetadataPurger purgeMetadataMatchingObjectIDs:inRequest:inStore:withMonitor:error:](v5, objc_msgSend(*(id *)(a1 + 40), "objectIDsToReset"), *(_QWORD *)(a1 + 40), (uint64_t)v2, *(_QWORD *)(a1 + 32), &v40);
LABEL_11:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
  v13 = [NSCloudKitMirroringResult alloc];
  v14 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
  v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v12 = v40;
  v17 = v16;
LABEL_12:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v13, "initWithRequest:storeIdentifier:success:madeChanges:error:", v14, v15, v16, v17, v12);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v23 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v24 = 16;
    else
      v24 = __ckLoggingOverride;
    v25 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Purged cloudkit metadata from store: %@\nResult: %@"));
    _NSCoreDataLog(v24, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[NSCloudKitMirroringDelegate _performMetadataResetRequest:]_block_invoke");
    goto LABEL_19;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "error"), "code") != 134407)
  {
    v23 = (void *)MEMORY[0x18D76B4E4]();
    v32 = __ckLoggingOverride != 0;
    v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to purge cloudkit metadata from store: %@\n%@"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "error");
    _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[NSCloudKitMirroringDelegate _performMetadataResetRequest:]_block_invoke");
LABEL_19:
    objc_autoreleasePoolPop(v23);
  }

}

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id Weak;
  id v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    v3 = *(_QWORD *)(v2 + 8);
    if (v3)
      v4 = *(void **)(v3 + 88);
    else
      v4 = 0;
    Weak = objc_loadWeak((id *)(v2 + 120));
    v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__42;
    v14 = __Block_byref_object_dispose__42;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_2;
    v7[3] = &unk_1E1EDE730;
    v7[4] = v6;
    v8 = *(_OWORD *)(a1 + 32);
    v9 = &v10;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v7);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), (void *)v11[5]);

    v11[5] = 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(_QWORD **)(a1 + 40));
  }
}

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSManagedObjectContext *v4;
  NSCloudKitMirroringDelegateSerializationRequestResult *v5;
  id v6;
  NSCloudKitMirroringResult *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;
  NSManagedObjectContext *v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = __Block_byref_object_copy__42;
    v23 = __Block_byref_object_dispose__42;
    v24 = 0;
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_3;
    v12[3] = &unk_1E1EDF360;
    v13 = *(_OWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v4;
    v16 = v3;
    v17 = &v19;
    v18 = &v25;
    -[NSManagedObjectContext performBlockAndWait:](v4, "performBlockAndWait:", v12);

    v5 = [NSCloudKitMirroringDelegateSerializationRequestResult alloc];
    if (*((_BYTE *)v26 + 24))
      v6 = v3;
    else
      v6 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[NSCloudKitMirroringDelegateSerializationRequestResult initWithRequest:storeIdentifier:serializedObjects:error:](v5, "initWithRequest:storeIdentifier:serializedObjects:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), v6, v20[5]);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v7 = [NSCloudKitMirroringResult alloc];
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D68];
    v30[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v8, "requestIdentifier"));
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v7, "initWithRequest:storeIdentifier:success:madeChanges:error:", v8, v9, 0, 0, objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v11));
  }

}

void __60__NSCloudKitMirroringDelegate__performSerializationRequest___block_invoke_3(uint64_t a1)
{
  PFCloudKitMetadataCache *v2;
  PFCloudKitSerializer *v3;
  uint64_t v4;
  uint64_t v5;
  PFCloudKitSerializer *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint32_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  PFCloudKitMetadataCache *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE buf[12];
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PFCloudKitMetadataCache);
  v3 = [PFCloudKitSerializer alloc];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 8);
  else
    v5 = 0;
  v72 = v2;
  v6 = -[PFCloudKitSerializer initWithMirroringOptions:metadataCache:recordNamePrefix:](v3, "initWithMirroringOptions:metadataCache:recordNamePrefix:", v5, v2, 0);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectIDsToSerialize");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v75;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v11);
        v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "persistentStore"), "identifier");
        v14 = *(_QWORD *)(a1 + 48);
        if (v14)
          v15 = *(_QWORD *)(v14 + 48);
        else
          v15 = 0;
        if (objc_msgSend(v13, "isEqualToString:", v15))
        {
          v73 = 0;
          v16 = (void *)objc_msgSend(*(id *)(a1 + 56), "existingObjectWithID:error:", v12, &v73);
          if (!v16)
          {
            v31 = (void *)MEMORY[0x18D76B4E4]();
            v32 = __ckLoggingOverride != 0;
            v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Unable to serialize object '%@' because it appears to be missing from the store."));
            _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[NSCloudKitMirroringDelegate _performSerializationRequest:]_block_invoke");
            objc_autoreleasePoolPop(v31);
            goto LABEL_27;
          }
          v17 = (uint64_t)v16;
          v18 = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]((uint64_t)v6, v16, 0, 0, &v73);
          if (!v18)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v73;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
            goto LABEL_35;
          }
          v19 = v18;
          if (objc_msgSend(v18, "count"))
          {
            if ((unint64_t)objc_msgSend(v19, "count") >= 2)
            {
              v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Multiple records returned for object even though we didn't ask for relationships: %@\n%@");
              _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, v17);
              v27 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v17;
                v79 = 2112;
                v80 = v19;
                _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Multiple records returned for object even though we didn't ask for relationships: %@\n%@", buf, 0x16u);
              }
            }
            v28 = objc_msgSend(*(id *)(a1 + 40), "resultType");
            if (!v28)
            {
              v29 = *(void **)(a1 + 64);
              v30 = objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "recordID");
LABEL_24:
              objc_msgSend(v29, "setObject:forKey:", v30, v12);
              goto LABEL_26;
            }
            if (v28 == 1)
            {
              v29 = *(void **)(a1 + 64);
              v30 = objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              goto LABEL_24;
            }
            v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unsupported resultType: %lu, %@");
            v52 = objc_msgSend(*(id *)(a1 + 40), "resultType");
            _NSCoreDataLog(17, v51, v53, v54, v55, v56, v57, v58, v52);
            v59 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
LABEL_26:

              goto LABEL_27;
            }
            v60 = objc_msgSend(*(id *)(a1 + 40), "resultType");
            v61 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v60;
            v79 = 2112;
            v80 = v61;
            v48 = v59;
            v49 = "CoreData: Unsupported resultType: %lu, %@";
            v50 = 22;
          }
          else
          {
            v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No records returned from the serializer for object: %@");
            _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, v17);
            v47 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              goto LABEL_26;
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v17;
            v48 = v47;
            v49 = "CoreData: No records returned from the serializer for object: %@";
            v50 = 12;
          }
          _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, v49, buf, v50);
          goto LABEL_26;
        }
LABEL_27:
        ++v11;
      }
      while (v9 != v11);
      v62 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
      v9 = v62;
    }
    while (v62);
  }
LABEL_35:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "hasChanges"))
    {
      *(_QWORD *)buf = 0;
      if ((objc_msgSend(*(id *)(a1 + 56), "save:", buf) & 1) == 0)
      {
        v63 = (void *)MEMORY[0x18D76B4E4]();
        v64 = __ckLoggingOverride != 0;
        v65 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save metadata changes from serialization of records: %@\n%@"));
        _NSCoreDataLog(v64, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"-[NSCloudKitMirroringDelegate _performSerializationRequest:]_block_invoke");
        objc_autoreleasePoolPop(v63);
      }
    }
  }

}

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id Weak;
  id v6;
  _QWORD v7[5];
  int8x16_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89))
  {
    v3 = *(_QWORD *)(v2 + 8);
    if (v3)
      v4 = *(void **)(v3 + 88);
    else
      v4 = 0;
    Weak = objc_loadWeak((id *)(v2 + 120));
    v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__42;
    v14 = __Block_byref_object_dispose__42;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_2;
    v7[3] = &unk_1E1EDE590;
    v7[4] = v6;
    v9 = &v10;
    v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v7);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), (void *)v11[5]);

    v11[5] = 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v2, *(_QWORD **)(a1 + 40));
  }
}

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  NSCloudKitMirroringResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_3;
    v10[3] = &unk_1E1EE0E50;
    v10[4] = v2;
    v10[5] = v3;
    v4 = *(_QWORD *)(a1 + 56);
    v11 = *(_OWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v10);

  }
  else
  {
    v5 = [NSCloudKitMirroringResult alloc];
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB28A8];
    v14 = *MEMORY[0x1E0CB2D68];
    v15[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v6, "requestIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v5, "initWithRequest:storeIdentifier:success:madeChanges:error:", v6, v7, 0, 0, objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1)));
  }

}

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSCloudKitMirroringExportProgressResult *v8;
  uint64_t v9;
  id v10;
  NSCloudKitMirroringResult *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSCloudKitMirroringExportProgressResult *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v38);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)objc_msgSend(v2, "transformedValue");
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "storeTokens"), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "identifier")), "integerValue") < 1)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectIDsToFetch", 0);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v24;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
            v18 = (void *)objc_msgSend((id)objc_msgSend(v17, "persistentStore"), "identifier");
            v19 = *(_QWORD *)(a1 + 64);
            if (v19)
              v20 = *(_QWORD *)(v19 + 48);
            else
              v20 = 0;
            if (objc_msgSend(v18, "isEqualToString:", v20))
              objc_msgSend(v3, "setObject:forKey:", v4, v17);
            ++v16;
          }
          while (v14 != v16);
          v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
          v14 = v21;
        }
        while (v21);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:]([NSCloudKitMirroringExportProgressResult alloc], "initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168), v3, 0);
    }
    else
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3052000000;
      v35 = __Block_byref_object_copy__42;
      v36 = __Block_byref_object_dispose__42;
      v37 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 1;
      v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectIDsToFetch");
      v6 = *(void **)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_4;
      v27[3] = &unk_1E1EE0E28;
      v27[4] = v6;
      v27[5] = v3;
      v27[6] = &v28;
      v27[7] = &v32;
      +[NSCKRecordMetadata enumerateRecordMetadataDictionariesMatchingObjectIDs:withProperties:inStore:withManagedObjectContext:block:]((uint64_t)NSCKRecordMetadata, v5, &unk_1E1F52530, v6, v7, (uint64_t)v27);
      if (*((_BYTE *)v29 + 24))
      {
        v8 = [NSCloudKitMirroringExportProgressResult alloc];
        v9 = 0;
        v10 = v3;
      }
      else
      {
        v8 = [NSCloudKitMirroringExportProgressResult alloc];
        v10 = 0;
        v9 = v33[5];
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:](v8, "initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168), v10, v9);

      v33[5] = 0;
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(&v32, 8);
    }

  }
  else
  {
    if (v38)
    {
      v11 = [NSCloudKitMirroringResult alloc];
      v12 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v11, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168), 0, 0, v38);
    }
    else
    {
      v22 = [NSCloudKitMirroringExportProgressResult alloc];
      v12 = -[NSCloudKitMirroringExportProgressResult initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:](v22, "initWithRequest:storeIdentifier:objectIDToLastExportedToken:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168), MEMORY[0x1E0C9AA70], 0);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v12;
  }
}

void __61__NSCloudKitMirroringDelegate__performExportProgressRequest___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  NSPersistentHistoryToken *v8;
  NSPersistentHistoryToken *v9;

  if (a2)
  {
    v6 = (void *)+[NSCKRecordMetadata createObjectIDFromMetadataDictionary:inSQLCore:]((uint64_t)NSCKRecordMetadata, a2, *(void **)(a1 + 32));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("lastExportedTransactionNumber"));
    v8 = [NSPersistentHistoryToken alloc];
    if (!v7)
      v7 = &unk_1E1F4B750;
    v9 = -[NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v8, "initWithTransactionNumber:andStoreID:", v7, objc_msgSend(*(id *)(a1 + 32), "identifier"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v6);

  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
  }
}

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id Weak;
  id v16;
  NSCloudKitMirroringResult *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  NSCloudKitMirroringResult *v25;
  _QWORD v26[8];
  id v27;
  id location;
  _QWORD v29[6];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 89))
  {
    if (objc_msgSend(*(id *)(v3 + 8), "databaseScope") == 3)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        v6 = *(void **)(v5 + 80);
      else
        v6 = 0;
      if (objc_msgSend(v6, "count"))
      {
        v7 = objc_alloc((Class)getCloudKitCKFetchShareMetadataOperationClass[0]());
        v8 = *(_QWORD *)(a1 + 40);
        if (v8)
          v9 = *(_QWORD *)(v8 + 80);
        else
          v9 = 0;
        v10 = (void *)objc_msgSend(v7, "initWithShareURLs:", v9);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v12 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_2;
        v29[3] = &unk_1E1EE0E78;
        v29[4] = v11;
        v29[5] = 0;
        objc_msgSend(v10, "setPerShareMetadataBlock:", v29);
        objc_initWeak(&location, *(id *)(a1 + 32));
        v26[0] = v12;
        v26[1] = 3221225472;
        v26[2] = __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_363;
        v26[3] = &unk_1E1EE0EA0;
        objc_copyWeak(&v27, &location);
        v13 = *(_QWORD *)(a1 + 40);
        v26[4] = 0;
        v26[5] = v13;
        v26[6] = v11;
        v26[7] = a2;
        objc_msgSend(v10, "setFetchShareMetadataCompletionBlock:", v26);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addOperation:", v10);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      else
      {
        -[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
      }
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
        Weak = objc_loadWeak((id *)(v14 + 120));
      else
        Weak = 0;
      v16 = Weak;
      v17 = [NSCloudKitMirroringResult alloc];
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D68];
      v31[0] = CFSTR("Provided persistent store is not set to the shared database scope and cannot accept share invitation.");
      v22 = *MEMORY[0x1E0CB3308];
      v30[0] = v21;
      v30[1] = v22;
      if (objc_msgSend(v16, "URL"))
        v23 = (const __CFString *)objc_msgSend(v16, "URL");
      else
        v23 = CFSTR("nil");
      v31[1] = v23;
      v30[2] = CFSTR("databaseScope");
      v31[2] = softLinkCKDatabaseScopeString(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "databaseScope"));
      v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v25 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v17, "initWithRequest:storeIdentifier:success:madeChanges:error:", v18, v19, 0, 0, objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134091, v24));
      -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 32), *(_QWORD **)(a1 + 40), v25);

    }
  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v3, *(_QWORD **)(a1 + 40));
  }
}

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  else if (a4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a4, a2);
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No metadata or error for share URL: %@");
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a2);
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a2;
      _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: No metadata or error for share URL: %@", buf, 0xCu);
    }
  }
}

void __69__NSCloudKitMirroringDelegate__performAcceptShareInvitationsRequest___block_invoke_363(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && (v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Some shareURLs failed to return metadata..."),
        _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v20[0]),
        v12 = __pflogFaultLog,
        os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
  {
    LOWORD(v20[0]) = 0;
    _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Some shareURLs failed to return metadata...", (uint8_t *)v20, 2u);
    if (a2)
    {
LABEL_4:
      if (WeakRetained)
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = WeakRetained[4];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = (uint64_t)__62__NSCloudKitMirroringDelegate__handleError_duringShareAccept___block_invoke;
        v20[3] = (uint64_t)&unk_1E1EDD790;
        v20[4] = v13;
        v20[5] = (uint64_t)WeakRetained;
        v20[6] = a2;
        dispatch_async(v14, v20);
      }
      goto LABEL_12;
    }
  }
  else if (a2)
  {
    goto LABEL_4;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    v16 = *(_QWORD *)(v15 + 88);
  else
    v16 = 0;
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v16);
  v18 = *(void **)(a1 + 40);
  if (v18)
  {
    objc_setProperty_nonatomic_copy(v18, v17, *(id *)(a1 + 48), 88);
    v19 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v19 = 0;
  }
  -[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]((uint64_t)WeakRetained, v19, *(_QWORD *)(a1 + 56));
LABEL_12:

}

- (void)_acceptShareMetadatasInRequest:(uint64_t)a3 workBlockContext:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[9];
  _QWORD v22[6];

  if (a1)
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 3)
      v7 = 3;
    else
      v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Accepting shares defined by request: %@"));
    _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]");
    objc_autoreleasePoolPop(v6);
    v15 = objc_alloc((Class)getCloudKitCKAcceptSharesOperationClass[0]());
    if (a2)
      v16 = *(_QWORD *)(a2 + 88);
    else
      v16 = 0;
    v17 = (void *)objc_msgSend(v15, "initWithShareMetadatas:", v16);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke;
    v22[3] = &unk_1E1EE0EC8;
    v22[4] = v18;
    v22[5] = v19;
    objc_msgSend(v17, "setPerShareCompletionBlock:", v22);
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_378;
    v21[3] = &unk_1E1EE0F18;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = a3;
    v21[7] = v18;
    v21[8] = v19;
    objc_msgSend(v17, "setAcceptSharesCompletionBlock:", v21);
    objc_msgSend(*(id *)(a1 + 48), "addOperation:", v17);

  }
}

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = __ckLoggingOverride != 0;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to accept share: %@\n%@"));
    _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate _acceptShareMetadatasInRequest:workBlockContext:]_block_invoke");
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No error or share for accepted share metadata: %@");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, a2);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = a2;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: No error or share for accepted share metadata: %@", buf, 0xCu);
    }
  }
}

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_378(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v4[5];
  int8x16_t v5;
  __int128 v6;
  uint64_t v7;

  v4[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 48);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_2;
  v4[3] = &unk_1E1EE0558;
  v4[4] = a2;
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 64);
  dispatch_async(v3, v4);
}

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id Weak;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSCloudKitMirroringResult *v9;
  _QWORD v10[6];
  int8x16_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168), 0, 0, *(_QWORD *)(a1 + 32));
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 48), *(_QWORD **)(a1 + 40), v9);

  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
      v4 = *(void **)(v3 + 88);
    else
      v4 = 0;
    Weak = objc_loadWeak((id *)(v2 + 120));
    v6 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy__42;
    v18 = __Block_byref_object_dispose__42;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_3;
    v10[3] = &unk_1E1EE0E50;
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 72);
    v10[4] = v6;
    v10[5] = v7;
    v14 = 0;
    v15 = &v14;
    v19 = 0;
    v10[1] = 3221225472;
    v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v12 = v8;
    v13 = &v14;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v6, (uint64_t)v10);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 48), *(_QWORD **)(a1 + 40), (void *)v15[5]);

    v15[5] = 0;
    _Block_object_dispose(&v14, 8);
  }
}

void __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  NSCloudKitMirroringAcceptShareInvitationsResult *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  void *v11;
  NSManagedObjectContext *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_4;
    v9[3] = &unk_1E1EE0EF0;
    v10 = *(_OWORD *)(a1 + 40);
    v11 = v2;
    v12 = v3;
    v14 = *(_QWORD *)(a1 + 72);
    v13 = *(_OWORD *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v9);

  }
  else
  {
    v4 = [NSCloudKitMirroringAcceptShareInvitationsResult alloc];
    v5 = *(void **)(a1 + 56);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(v5, "requestIdentifier"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = -[NSCloudKitMirroringAcceptShareInvitationsResult initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:](v4, "initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:", v5, v6, 0, 0, objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1)));
  }

}

uint64_t __79__NSCloudKitMirroringDelegate__acceptShareMetadatasInRequest_workBlockContext___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSManagedObject *v7;
  uint64_t v8;
  NSManagedObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSCloudKitMirroringAcceptShareInvitationsResult *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  char v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v34;
    v31 = 1;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v5);
      v7 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), (uint64_t)&v37);
      if (!v7)
        goto LABEL_22;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v8 && (v9 = v7, (v10 = *(_QWORD *)(v8 + 136)) != 0))
      {
        v11 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v10, (uint64_t)v6, &v37);
        if (v11)
        {
          -[NSManagedObject setNeedsImport:](v9, "setNeedsImport:", 1);
          -[NSManagedObject setNeedsShareUpdate:](v9, "setNeedsShareUpdate:", 0);
          -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v11);
          if (objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus") != 1
            || objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus") != 2)
          {
            v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Accepted share %@ but the invitation status %lu or acceptance status %lu is incorrect.");
            v13 = objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID");
            objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus");
            objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus");
            _NSCoreDataLog(17, v12, v14, v15, v16, v17, v18, v19, v13);
            v20 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v21 = objc_msgSend((id)objc_msgSend(v6, "recordID"), "zoneID");
              v22 = objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "invitationTokenStatus");
              v23 = objc_msgSend((id)objc_msgSend(v6, "currentUserParticipant"), "acceptanceStatus");
              *(_DWORD *)buf = 138412802;
              v39 = v21;
              v40 = 2048;
              v41 = v22;
              v42 = 2048;
              v43 = v23;
              _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Accepted share %@ but the invitation status %lu or acceptance status %lu is incorrect.", buf, 0x20u);
            }
          }
          goto LABEL_16;
        }
      }
      else
      {
        v11 = 0;
      }
      v31 = 0;
LABEL_16:

      if (v3 == ++v5)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v3)
          goto LABEL_3;
        if ((v31 & 1) == 0)
          goto LABEL_22;
        break;
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 56), "hasChanges")
    && !objc_msgSend(*(id *)(a1 + 56), "save:", &v37))
  {
LABEL_22:
    v24 = [NSCloudKitMirroringAcceptShareInvitationsResult alloc];
    v27 = *(_QWORD *)(a1 + 64);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
    v29 = v37;
    v25 = 0;
    v28 = 0;
  }
  else
  {
    -[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:](*(_QWORD *)(a1 + 40), 0, 1);
    v24 = [NSCloudKitMirroringAcceptShareInvitationsResult alloc];
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
    v27 = *(_QWORD *)(a1 + 64);
    v28 = *(_QWORD *)(a1 + 72);
    v29 = 0;
  }
  result = -[NSCloudKitMirroringAcceptShareInvitationsResult initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:](v24, "initWithRequest:storeIdentifier:acceptedShares:acceptedShareMetadatas:error:", v27, v26, v25, v28, v29);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = result;
  return result;
}

- (void)_requestEncounteredUnrecoverableError:(void *)a3 withResult:
{
  PFCloudKitFatalErrorMetric *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSCloudKitMirroringResult *v10;
  id v11;

  -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](a1, (void *)objc_msgSend(a3, "error"));
  v6 = -[PFCloudKitFatalErrorMetric initWithContainerIdentifier:result:]([PFCloudKitFatalErrorMetric alloc], "initWithContainerIdentifier:result:", objc_msgSend(*(id *)(a1 + 8), "containerIdentifier"), a3);
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
    v8 = *(_QWORD *)(v7 + 72);
  else
    v8 = 0;
  -[PFCloudKitMetricsClient logMetric:](v8, v6);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(a3, "error"))
  {
    v9 = objc_msgSend(a3, "error");
    objc_msgSend(v11, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
  }
  v10 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a2, *(_QWORD *)(a1 + 168), objc_msgSend(a3, "success"), objc_msgSend(a3, "madeChanges"), objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134410, v11));
  -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](a2, (uint64_t)v10);

}

- (void)_requestEncounteredRecoverableError:(void *)a3 withResult:
{
  uint64_t v6;
  NSCloudKitMirroringResult *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(a3, "error"))
  {
    v6 = objc_msgSend(a3, "error");
    objc_msgSend(v8, "setObject:forKey:", v6, *MEMORY[0x1E0CB3388]);
  }
  v7 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a2, *(_QWORD *)(a1 + 168), objc_msgSend(a3, "success"), objc_msgSend(a3, "madeChanges"), objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134409, v8));
  -[NSCloudKitMirroringRequest invokeCompletionBlockWithResult:](a2, (uint64_t)v7);

}

void __48__NSCloudKitMirroringDelegate_recoverFromError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSManagedObjectContext *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  NSManagedObjectContext *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  NSManagedObjectContext *v56;
  NSManagedObjectContext *v57;
  BOOL v58;
  _BOOL4 v59;
  int v60;
  id v61;
  id WeakRetained;
  _QWORD v63[13];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  NSManagedObjectContext *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
    WeakRetained = 0;
  }
  v4 = (NSManagedObjectContext *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v3);
  if (v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "domain");
    if (objc_msgSend(v5, "isEqualToString:", getCloudKitCKErrorDomain[0]())
      && objc_msgSend(*(id *)(a1 + 40), "code") == 2)
    {
      v6 = *(_QWORD *)(a1 + 48);
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(a1 + 40);
        v9 = (void *)objc_msgSend(v8, "domain");
        if (objc_msgSend(v9, "isEqualToString:", getCloudKitCKErrorDomain[0]())
          && objc_msgSend(v8, "code") == 2)
        {
          v10 = (void *)objc_msgSend(v8, "userInfo");
          v11 = (void *)objc_msgSend(v10, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey[0]());
          v70 = 0;
          v71 = &v70;
          v72 = 0x2020000000;
          v73 = 0;
          v64 = 0;
          v65 = &v64;
          v66 = 0x3052000000;
          v67 = __Block_byref_object_copy__42;
          v68 = __Block_byref_object_dispose__42;
          v69 = 0;
          v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __75__NSCloudKitMirroringDelegate__recoverFromPartialError_forStore_inMonitor___block_invoke;
          v63[3] = &unk_1E1EE0F40;
          v63[12] = &v64;
          v63[4] = v8;
          v63[5] = v61;
          v63[6] = v13;
          v63[7] = v12;
          v63[8] = v14;
          v63[9] = v15;
          v63[10] = v6;
          v63[11] = &v70;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v63);
          if (objc_msgSend(v14, "count"))
          {
            v16 = (void *)MEMORY[0x18D76B4E4]();
            v17 = __ckLoggingOverride;
            v18 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Error recovery failed because the following fatal errors were found: %@"));
            _NSCoreDataLog(v17 != 0, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromPartialError:forStore:inMonitor:]");
            objc_autoreleasePoolPop(v16);
          }
          else
          {
            if (*((_BYTE *)v71 + 24))
              v60 = -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](v6, (void *)v65[5], v61, (uint64_t)v4, v7);
            else
              v60 = 1;
            if (objc_msgSend(v12, "count"))
            {
              v83 = 0;
              v84 = &v83;
              v85 = 0x2020000000;
              v86 = 0;
              v44 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              v74 = MEMORY[0x1E0C809B0];
              v75 = 3221225472;
              v76 = __79__NSCloudKitMirroringDelegate__recoverUnknownItemRecordIDs_forStore_inMonitor___block_invoke;
              v77 = &unk_1E1EDF388;
              v78 = v12;
              v79 = (uint64_t)v4;
              v80 = v44;
              v81 = v6;
              v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v44, "performBlockAndWait:", &v74);

              if (*((_BYTE *)v84 + 24))
              {
                v45 = (void *)MEMORY[0x18D76B4E4]();
                v46 = __ckLoggingOverride;
                v47 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Recovered from unknown item error for recordIDs: %@"));
                if (v46 >= 0x10)
                  v54 = 16;
                else
                  v54 = v46;
                _NSCoreDataLog(v54, v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]");
                objc_autoreleasePoolPop(v45);
                v59 = *((_BYTE *)v84 + 24) != 0;
              }
              else
              {
                v59 = 0;
              }
              _Block_object_dispose(&v83, 8);
            }
            else
            {
              v59 = 1;
            }
            v55 = 1;
            if (objc_msgSend(v15, "count"))
            {
              v83 = 0;
              v84 = &v83;
              v85 = 0x2020000000;
              v86 = 1;
              v56 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              v74 = MEMORY[0x1E0C809B0];
              v75 = 3221225472;
              v76 = __79__NSCloudKitMirroringDelegate__recoverConflictedZoneShares_forStore_inMonitor___block_invoke;
              v77 = &unk_1E1EDF388;
              v78 = v15;
              v79 = v6;
              v80 = v4;
              v81 = (uint64_t)v56;
              v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v56, "performBlockAndWait:", &v74);

              LODWORD(v56) = *((unsigned __int8 *)v84 + 24);
              _Block_object_dispose(&v83, 8);
              v55 = (_DWORD)v56 != 0;
            }
            if (objc_msgSend(v13, "count"))
            {
              v83 = 0;
              v84 = &v83;
              v85 = 0x2020000000;
              v86 = 0;
              v57 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v7);
              v74 = MEMORY[0x1E0C809B0];
              v75 = 3221225472;
              v76 = __84__NSCloudKitMirroringDelegate__recoverFromUnknownShareRecordIDs_forStore_inMonitor___block_invoke;
              v77 = &unk_1E1EDF388;
              v78 = v13;
              v79 = v6;
              v80 = v4;
              v81 = (uint64_t)v57;
              v82 = &v83;
              -[NSManagedObjectContext performBlockAndWait:](v57, "performBlockAndWait:", &v74);

              LODWORD(v57) = *((unsigned __int8 *)v84 + 24);
              _Block_object_dispose(&v83, 8);
              v58 = (_DWORD)v57 != 0;
            }
            else
            {
              v58 = 1;
            }
            if ((v60 & v59) == 1)
            {
              v43 = v55 && v58;
LABEL_35:

              v65[5] = 0;
              _Block_object_dispose(&v64, 8);
              _Block_object_dispose(&v70, 8);
              goto LABEL_36;
            }
          }
          v43 = 0;
          goto LABEL_35;
        }
        v34 = (void *)MEMORY[0x18D76B4E4]();
        v35 = __ckLoggingOverride != 0;
        v36 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unknown error passed to partial error handler: %@"));
        _NSCoreDataLog(v35, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromPartialError:forStore:inMonitor:]");
        objc_autoreleasePoolPop(v34);
      }
      v43 = 0;
LABEL_36:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v43;
      goto LABEL_37;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), 0, (uint64_t)v4, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v25 = (void *)MEMORY[0x18D76B4E4]();
    v26 = __ckLoggingOverride != 0;
    v27 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("The store was removed before the mirroring delegate could recover from an error:\n%@"));
    _NSCoreDataLog(v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[NSCloudKitMirroringDelegate recoverFromError:]_block_invoke");
    objc_autoreleasePoolPop(v25);
  }
LABEL_37:

}

- (uint64_t)_recoverFromError:(void *)a3 withZoneIDs:(uint64_t)a4 forStore:(uint64_t)a5 inMonitor:
{
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  uint32_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  _BOOL8 v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  id v202;
  uint64_t v203;
  const __CFString *v204;
  uint8_t buf[4];
  void *v206;
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = a1;
    v202 = 0;
    v10 = (void *)objc_msgSend(a2, "domain");
    if (!objc_msgSend(v10, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
    {
      v26 = (void *)objc_msgSend(a2, "domain");
      if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        if (objc_msgSend(a2, "code") == 134301)
        {
          -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateWillResetSyncNotificationName"), a2);
          v27 = *(_QWORD **)(v9 + 8);
          if (v27)
          {
            v28 = v27[12];
            v29 = objc_msgSend(v27, "databaseScope");
            if (v28)
            {
              v29 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v28, a4, a5, 37, MEMORY[0x1E0C9AA60], v29, 0, &v202);
              if ((_DWORD)v29)
                goto LABEL_88;
            }
            goto LABEL_149;
          }
          goto LABEL_155;
        }
        if (objc_msgSend(a2, "code") == 134405)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey")), "unsignedIntegerValue") == 2&& *(_BYTE *)(v9 + 145))
          {
            objc_msgSend(*(id *)(v9 + 72), "unregisterForSubscriptionWithID:inDatabase:", objc_msgSend(*(id *)(v9 + 40), "subscriptionID"), *(_QWORD *)(v9 + 56));
            *(_BYTE *)(v9 + 145) = 0;
          }
          -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateWillResetSyncNotificationName"), a2);
          v45 = *(_QWORD **)(v9 + 8);
          if (v45)
            v46 = v45[12];
          else
            v46 = 0;
          v29 = -[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:](v46, a4, a5, objc_msgSend(v45, "databaseScope"), &v202);
          if ((_DWORD)v29)
            goto LABEL_87;
          goto LABEL_149;
        }
        if (objc_msgSend(a2, "code") == 134407)
        {
          -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v9, a2);
          goto LABEL_149;
        }
        v29 = objc_msgSend(a2, "code");
        if (v29 != 133000)
          goto LABEL_149;
      }
      else
      {
        v30 = (void *)objc_msgSend(a2, "domain");
        v29 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CB32E8]);
        if (!(_DWORD)v29)
          goto LABEL_149;
        v31 = objc_msgSend(a2, "code");
        if (v31 > -1105)
        {
          switch(v31)
          {
            case -1022:
              v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorAppTransportSecurityRequiresSecureConnection and probably shouldn't have.");
              _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorAppTransportSecurityRequir"
                    "esSecureConnection and probably shouldn't have.";
              break;
            case -1021:
              v143 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorRequestBodyStreamExhausted and probably shouldn't have.");
              _NSCoreDataLog(17, v143, v144, v145, v146, v147, v148, v149, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorRequestBodyStreamExhausted"
                    " and probably shouldn't have.";
              break;
            case -1020:
            case -1019:
            case -1018:
            case -1014:
            case -1013:
            case -1012:
            case -1010:
            case -1009:
            case -1008:
            case -1007:
            case -1006:
            case -1005:
            case -1004:
            case -1003:
            case -1001:
            case -999:
            case -997:
            case -996:
            case -995:
              goto LABEL_89;
            case -1017:
              v136 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotParseResponse and probably shouldn't have.");
              _NSCoreDataLog(17, v136, v137, v138, v139, v140, v141, v142, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotParseResponse and pr"
                    "obably shouldn't have.";
              break;
            case -1016:
              v171 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeContentData and probably shouldn't have.");
              _NSCoreDataLog(17, v171, v172, v173, v174, v175, v176, v177, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeContentData an"
                    "d probably shouldn't have.";
              break;
            case -1015:
              v157 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeRawData and probably shouldn't have.");
              _NSCoreDataLog(17, v157, v158, v159, v160, v161, v162, v163, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorCannotDecodeRawData and pr"
                    "obably shouldn't have.";
              break;
            case -1011:
              v150 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadServerResponse and probably shouldn't have.");
              _NSCoreDataLog(17, v150, v151, v152, v153, v154, v155, v156, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadServerResponse and prob"
                    "ably shouldn't have.";
              break;
            case -1002:
              v178 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorUnsupportedURL and probably shouldn't have.");
              _NSCoreDataLog(17, v178, v179, v180, v181, v182, v183, v184, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorUnsupportedURL and probabl"
                    "y shouldn't have.";
              break;
            case -1000:
              v164 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadURL and probably shouldn't have.");
              _NSCoreDataLog(17, v164, v165, v166, v167, v168, v169, v170, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorBadURL and probably shouldn't have.";
              break;
            case -998:
              goto LABEL_100;
            default:
              if ((unint64_t)(v31 + 1104) >= 5 && v31 != -1)
                goto LABEL_100;
              goto LABEL_89;
          }
LABEL_139:
          v97 = v39;
          v98 = 2;
          goto LABEL_140;
        }
        if ((unint64_t)(v31 + 3007) >= 8)
        {
          switch(v31)
          {
            case -1206:
              v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorClientCertificateRequired and probably shouldn't have.");
              _NSCoreDataLog(17, v49, v50, v51, v52, v53, v54, v55, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorClientCertificateRequired "
                    "and probably shouldn't have.";
              goto LABEL_139;
            case -1205:
              v108 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorClientCertificateRejected and probably shouldn't have.");
              _NSCoreDataLog(17, v108, v109, v110, v111, v112, v113, v114, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorClientCertificateRejected "
                    "and probably shouldn't have.";
              goto LABEL_139;
            case -1204:
              v115 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateNotYetValid and probably shouldn't have.");
              _NSCoreDataLog(17, v115, v116, v117, v118, v119, v120, v121, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateNotYetVal"
                    "id and probably shouldn't have.";
              goto LABEL_139;
            case -1203:
              v101 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateHasUnknownRoot and probably shouldn't have.");
              _NSCoreDataLog(17, v101, v102, v103, v104, v105, v106, v107, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateHasUnknow"
                    "nRoot and probably shouldn't have.";
              goto LABEL_139;
            case -1202:
              v122 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateUntrusted and probably shouldn't have.");
              _NSCoreDataLog(17, v122, v123, v124, v125, v126, v127, v128, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateUntrusted"
                    " and probably shouldn't have.";
              goto LABEL_139;
            case -1201:
              v129 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateHasBadDate and probably shouldn't have.");
              _NSCoreDataLog(17, v129, v130, v131, v132, v133, v134, v135, v195);
              v39 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_WORD *)buf = 0;
              v40 = "CoreData: NSCloudKitMirroringDelegate recieved NSURLErrorDomain:NSURLErrorServerCertificateHasBadDat"
                    "e and probably shouldn't have.";
              goto LABEL_139;
            case -1200:
              goto LABEL_89;
            default:
              if (v31 == -2000)
                goto LABEL_89;
LABEL_100:
              v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegate was handed a scary NRULErrorDomain error (of some code that's not already in the switch) that it probably shouldn't have been: %@");
              _NSCoreDataLog(17, v90, v91, v92, v93, v94, v95, v96, (uint64_t)a2);
              v71 = __pflogFaultLog;
              v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
              if (!(_DWORD)v29)
                goto LABEL_149;
              *(_DWORD *)buf = 138412290;
              v206 = a2;
              v40 = "CoreData: NSCloudKitMirroringDelegate was handed a scary NRULErrorDomain error (of some code that's "
                    "not already in the switch) that it probably shouldn't have been: %@";
              break;
          }
LABEL_102:
          v97 = v71;
          v98 = 12;
LABEL_140:
          _os_log_fault_impl(&dword_18A253000, v97, OS_LOG_TYPE_FAULT, v40, buf, v98);
          goto LABEL_149;
        }
      }
LABEL_89:
      v76 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 3)
        v77 = 3;
      else
        v77 = __ckLoggingOverride;
      v78 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Recovered from error: %@:%ld"));
      objc_msgSend(a2, "domain");
      objc_msgSend(a2, "code");
      _NSCoreDataLog(v77, v78, v79, v80, v81, v82, v83, v84, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:]");
      v85 = 1;
      goto LABEL_150;
    }
    if (objc_msgSend(a2, "code") == 112 || objc_msgSend(a2, "code") == 21 || objc_msgSend(a2, "code") == 26)
    {
      -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateWillResetSyncNotificationName"), a2);
      if (!objc_msgSend(a3, "count"))
      {
        v41 = *(_QWORD *)(v9 + 8);
        if (v41)
        {
          v42 = *(_QWORD *)(v41 + 96);
          v43 = objc_msgSend(*(id *)(v9 + 56), "databaseScope");
          if (v42
            && -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v42, a4, a5, 294, (uint64_t)a3, v43, 0, &v202))
          {
            if (objc_msgSend(a2, "code") != 112)
            {
              v44 = (void *)objc_msgSend(a2, "userInfo");
              if (!objc_msgSend((id)objc_msgSend(v44, "objectForKey:", getCloudKitCKErrorUserDidResetEncryptedDataKey[0]()), "BOOLValue"))goto LABEL_86;
            }
            if ((-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:](v9, (uint64_t)a3, objc_msgSend(*(id *)(v9 + 56), "databaseScope"), a4, &v202) & 1) != 0)goto LABEL_86;
          }
        }
        else
        {
          objc_msgSend(*(id *)(v9 + 56), "databaseScope");
        }
        goto LABEL_148;
      }
      v196 = a5;
      v197 = v9;
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v198 = 0u;
      v199 = 0u;
      v200 = 0u;
      v201 = 0u;
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v198, v207, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v199;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v199 != v15)
              objc_enumerationMutation(a3);
            v17 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * i);
            v18 = (void *)objc_msgSend(v17, "ownerName");
            if (objc_msgSend(v18, "isEqualToString:", getCloudKitCKCurrentUserDefaultName[0]()))
              v19 = v11;
            else
              v19 = v12;
            objc_msgSend(v19, "addObject:", v17);
          }
          v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v198, v207, 16);
        }
        while (v14);
      }
      v9 = v197;
      if (objc_msgSend(v11, "count"))
      {
        v20 = *(_QWORD *)(v197 + 8);
        if (!v20)
        {
LABEL_146:
          objc_msgSend(*(id *)(v197 + 56), "databaseScope");
LABEL_147:

LABEL_148:
          -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateDidResetSyncNotificationName"), a2);
          goto LABEL_149;
        }
        v21 = *(_QWORD *)(v20 + 96);
        v22 = objc_msgSend(*(id *)(v197 + 56), "databaseScope");
        if (!v21
          || !-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v21, a4, v196, 298, (uint64_t)v11, v22, 0, &v202))
        {
          goto LABEL_147;
        }
        if (objc_msgSend(a2, "code") == 112
          || (v23 = (void *)objc_msgSend(a2, "userInfo"),
              objc_msgSend((id)objc_msgSend(v23, "objectForKey:", getCloudKitCKErrorUserDidResetEncryptedDataKey[0]()), "BOOLValue")))
        {
          if (!-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:](v197, (uint64_t)v11, objc_msgSend(*(id *)(v197 + 56), "databaseScope"), a4, &v202))goto LABEL_147;
        }
      }
      if (!objc_msgSend(v12, "count"))
      {

LABEL_86:
        -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v9, a2);
LABEL_87:
        -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v9, 0);
LABEL_88:
        -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateDidResetSyncNotificationName"), a2);
        goto LABEL_89;
      }
      if (objc_msgSend(a2, "code") == 26
        || objc_msgSend(a2, "code") == 112
        || (v24 = (void *)objc_msgSend(a2, "userInfo"),
            objc_msgSend((id)objc_msgSend(v24, "objectForKey:", getCloudKitCKErrorUserDidResetEncryptedDataKey[0]()), "BOOLValue")))
      {
        if (objc_msgSend(a2, "code") == 112)
        {
          v25 = -[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:](v197, (uint64_t)v12, objc_msgSend(*(id *)(v197 + 56), "databaseScope"), a4, &v202);
          goto LABEL_85;
        }
        v56 = *(_QWORD *)(v197 + 8);
        if (v56)
        {
          v57 = *(_QWORD *)(v56 + 96);
          v58 = objc_msgSend(*(id *)(v197 + 56), "databaseScope");
          if (v57)
          {
            v59 = v58;
            v60 = v57;
            v61 = a4;
            v62 = v196;
            v63 = 9;
LABEL_84:
            v25 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v60, v61, v62, v63, (uint64_t)v12, v59, 0, &v202);
LABEL_85:
            v75 = v25;

            if ((v75 & 1) != 0)
              goto LABEL_86;
            goto LABEL_148;
          }
          goto LABEL_147;
        }
      }
      else
      {
        v72 = *(_QWORD *)(v197 + 8);
        if (v72)
        {
          v73 = *(_QWORD *)(v72 + 96);
          v74 = objc_msgSend(*(id *)(v197 + 56), "databaseScope");
          if (v73)
          {
            v59 = v74;
            v60 = v73;
            v61 = a4;
            v62 = v196;
            v63 = 298;
            goto LABEL_84;
          }
          goto LABEL_147;
        }
      }
      goto LABEL_146;
    }
    if (objc_msgSend(a2, "code") == 28)
    {
      -[NSCloudKitMirroringDelegate _postResetSyncNotificationWithName:forError:]((void *)v9, (uint64_t)CFSTR("NSCloudKitMirroringDelegateWillResetSyncNotificationName"), a2);
      v47 = *(_QWORD *)(v9 + 8);
      if (v47)
      {
        v48 = *(_QWORD *)(v47 + 96);
        v29 = objc_msgSend(*(id *)(v9 + 56), "databaseScope");
        if (v48)
        {
          v29 = -[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:](v48, a4, a5, 9, (uint64_t)a3, v29, 0, &v202);
          if ((_DWORD)v29)
            goto LABEL_86;
        }
LABEL_149:
        v76 = (void *)MEMORY[0x18D76B4E4](v29);
        v186 = __ckLoggingOverride != 0;
        v187 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Failed to recover from error: %@:%ld\nRecovery encountered the following error: %@:%ld"));
        objc_msgSend(a2, "domain");
        objc_msgSend(a2, "code");
        objc_msgSend(v202, "domain");
        objc_msgSend(v202, "code");
        _NSCoreDataLog(v186, v187, v188, v189, v190, v191, v192, v193, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromError:withZoneIDs:forStore:inMonitor:]");
        v85 = 0;
LABEL_150:
        objc_autoreleasePoolPop(v76);
        return v85;
      }
      v27 = *(_QWORD **)(v9 + 56);
LABEL_155:
      v29 = objc_msgSend(v27, "databaseScope");
      goto LABEL_149;
    }
    if (objc_msgSend(a2, "code") == 9)
    {
      -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v9, a2);
      -[NSCloudKitMirroringDelegate _setUpCloudKitIntegration:](v9, 0);
      goto LABEL_89;
    }
    if (objc_msgSend(a2, "code") == 2)
    {
      v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid recursion detected, this method should never have been passed a partial error: %@");
      _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, (uint64_t)a2);
      v71 = __pflogFaultLog;
      v29 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)v29)
        goto LABEL_149;
      *(_DWORD *)buf = 138412290;
      v206 = a2;
      v40 = "CoreData: Invalid recursion detected, this method should never have been passed a partial error: %@";
      goto LABEL_102;
    }
    if (objc_msgSend(a2, "code") != 27)
    {
      if (objc_msgSend(a2, "code") == 6
        || objc_msgSend(a2, "code") == 4
        || objc_msgSend(a2, "code") == 3
        || objc_msgSend(a2, "code") == 22
        || objc_msgSend(a2, "code") == 7
        || objc_msgSend(a2, "code") == 23)
      {
        goto LABEL_89;
      }
      v29 = objc_msgSend(a2, "code");
      if (v29 == 15)
      {
        v29 = objc_msgSend(*(id *)(v9 + 8), "databaseScope");
        if (v29 == 1)
        {
          v99 = *(_QWORD *)(v9 + 8);
          v100 = v99 ? *(_QWORD *)(v99 + 96) : 0;
          v29 = -[PFCloudKitMetadataPurger deleteZoneMetadataFromStore:inMonitor:forRecordZones:inDatabaseWithScope:error:](v100, a4, a5, (uint64_t)a3, objc_msgSend(*(id *)(v9 + 56), "databaseScope"), &v202);
          if ((v29 & 1) != 0)
            goto LABEL_89;
        }
      }
      goto LABEL_149;
    }
    v86 = *(_QWORD *)(v9 + 96);
    if (v86)
    {
      v87 = *(_QWORD *)(v86 + 24);
      if (v87 == 512000)
      {
        *(_QWORD *)(v86 + 24) = 256000;
        v88 = *(_QWORD *)(v9 + 96);
        if (!v88)
          goto LABEL_89;
        v89 = 100;
        goto LABEL_144;
      }
      if (v87 == 1572864)
      {
        *(_QWORD *)(v86 + 24) = 512000;
        v88 = *(_QWORD *)(v9 + 96);
        if (!v88)
          goto LABEL_89;
        v89 = 200;
LABEL_144:
        *(_QWORD *)(v88 + 32) = v89;
        goto LABEL_89;
      }
    }
    v185 = *MEMORY[0x1E0CB28A8];
    v203 = *MEMORY[0x1E0CB2D68];
    v204 = CFSTR("The mirroring delegate can no longer export because it cannot stay under the CloudKit operation limits.");
    v29 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v185, 134411, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1));
    v202 = (id)v29;
    goto LABEL_149;
  }
  return 0;
}

- (uint64_t)_markZonesNeedingRecoveryFromManateeIdentityLoss:(uint64_t)a3 databaseScope:(uint64_t)a4 inStore:(_QWORD *)a5 error:
{
  id *v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v25[11];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__42;
  v30 = __Block_byref_object_dispose__42;
  v31 = 0;
  v10 = -[PFCloudKitStoreMonitor initForStore:]([PFCloudKitStoreMonitor alloc], "initForStore:", a4);
  v11 = v10;
  if (v10)
    WeakRetained = objc_loadWeakRetained(v10 + 4);
  else
    WeakRetained = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke;
  v25[3] = &unk_1E1EDED50;
  v25[4] = a1;
  v25[5] = a2;
  v25[6] = v11;
  v25[7] = a4;
  v25[8] = &v26;
  v25[9] = &v32;
  v25[10] = a3;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v11, (uint64_t)v25);

  v13 = (void *)v27[5];
  if (v13)
  {
    v14 = v13;
    if (v14)
    {
      if (a5)
        *a5 = v14;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
        v38 = 1024;
        v39 = 3815;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    v27[5] = 0;
  }
  v23 = *((unsigned __int8 *)v33 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v23;
}

void __75__NSCloudKitMirroringDelegate__recoverFromPartialError_forStore_inMonitor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  char isKindOfClass;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  PFCloudKitUnhandledPartialErrorMetric *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  getCloudKitCKRecordIDClass[0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (getCloudKitCKRecordZoneIDClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.coredata.cloudkit.private.subscription")) & 1) == 0
      && (objc_msgSend(a2, "isEqualToString:", CFSTR("com.apple.coredata.cloudkit.shared.subscription")) & 1) == 0)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unexpected string item for partial failure: %@ - %@");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v35 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v61 = a2;
        v62 = 2112;
        v63 = v35;
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unexpected string item for partial failure: %@ - %@", buf, 0x16u);
      }
    }
    v14 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v14, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
    {
      if (objc_msgSend(a3, "code") == 26
        || objc_msgSend(a3, "code") == 28
        || objc_msgSend(a3, "code") == 21
        || objc_msgSend(a3, "code") == 112
        || objc_msgSend(a3, "code") == 15
        || objc_msgSend(a3, "code") == 9
        || objc_msgSend(a3, "code") == 6)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = a3;
        getCloudKitCKRecordIDClass[0]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(a3, "code") == 15)
          {
            v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Got server rejected request as part of a partial error for a CKRecord: %@ - %@");
            _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
            v22 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v61 = a2;
              v62 = 2112;
              v63 = a3;
              _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Got server rejected request as part of a partial error for a CKRecord: %@ - %@", buf, 0x16u);
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
            goto LABEL_89;
          }
          v34 = *(void **)(a1 + 40);
          goto LABEL_73;
        }
        v24 = *(void **)(a1 + 40);
        goto LABEL_75;
      }
      if (objc_msgSend(a3, "code") == 3
        || objc_msgSend(a3, "code") == 4
        || objc_msgSend(a3, "code") == 22
        || objc_msgSend(a3, "code") == 7
        || objc_msgSend(a3, "code") == 23)
      {
LABEL_70:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = a3;
        getCloudKitCKRecordIDClass[0]();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v34 = *(void **)(a1 + 40);
        if ((isKindOfClass & 1) != 0)
        {
LABEL_73:
          v37 = objc_msgSend(a2, "zoneID");
          v24 = v34;
LABEL_76:
          objc_msgSend(v24, "addObject:", v37);
          return;
        }
        v24 = v34;
LABEL_75:
        v37 = (uint64_t)a2;
        goto LABEL_76;
      }
      if (objc_msgSend(a3, "code") == 11)
      {
        getCloudKitCKRecordIDClass[0]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Got an unknown item error back for a zone: %@ - %@");
          _NSCoreDataLog(17, v40, v41, v42, v43, v44, v45, v46, (uint64_t)a2);
          v47 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = a2;
            v62 = 2112;
            v63 = a3;
            _os_log_fault_impl(&dword_18A253000, v47, OS_LOG_TYPE_FAULT, "CoreData: Got an unknown item error back for a zone: %@ - %@", buf, 0x16u);
          }
          goto LABEL_89;
        }
        v38 = (void *)objc_msgSend(a2, "recordName");
        if (objc_msgSend(v38, "isEqualToString:", getCloudKitCKRecordNameZoneWideShare()))
          v24 = *(void **)(a1 + 48);
        else
          v24 = *(void **)(a1 + 56);
        goto LABEL_75;
      }
      if (objc_msgSend(a3, "code") == 12 || objc_msgSend(a3, "code") == 25)
      {
LABEL_92:
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", a3, a2);
        return;
      }
      if (objc_msgSend(a3, "code") == 14)
      {
        getCloudKitCKRecordIDClass[0]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = (void *)objc_msgSend(a2, "recordName");
          if (objc_msgSend(v39, "isEqualToString:", getCloudKitCKRecordNameZoneWideShare()))
          {
            v24 = *(void **)(a1 + 72);
            v37 = (uint64_t)a3;
            goto LABEL_76;
          }
        }
      }
    }
    else
    {
      v23 = (void *)objc_msgSend(a3, "domain");
      if (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB32E8])
        && (objc_msgSend(a3, "code") == -1
         || objc_msgSend(a3, "code") == -999
         || objc_msgSend(a3, "code") == -1001
         || objc_msgSend(a3, "code") == -1003
         || objc_msgSend(a3, "code") == -1004
         || objc_msgSend(a3, "code") == -1005
         || objc_msgSend(a3, "code") == -1006
         || objc_msgSend(a3, "code") == -1007
         || objc_msgSend(a3, "code") == -1008
         || objc_msgSend(a3, "code") == -1009
         || objc_msgSend(a3, "code") == -1010
         || objc_msgSend(a3, "code") == -1012
         || objc_msgSend(a3, "code") == -1013
         || objc_msgSend(a3, "code") == -1014
         || objc_msgSend(a3, "code") == -1100
         || objc_msgSend(a3, "code") == -1101
         || objc_msgSend(a3, "code") == -1102
         || objc_msgSend(a3, "code") == -1103
         || objc_msgSend(a3, "code") == -1104
         || objc_msgSend(a3, "code") == -1200
         || objc_msgSend(a3, "code") == -2000
         || objc_msgSend(a3, "code") == -3000
         || objc_msgSend(a3, "code") == -3001
         || objc_msgSend(a3, "code") == -3002
         || objc_msgSend(a3, "code") == -3003
         || objc_msgSend(a3, "code") == -3004
         || objc_msgSend(a3, "code") == -3005
         || objc_msgSend(a3, "code") == -3006
         || objc_msgSend(a3, "code") == -3007
         || objc_msgSend(a3, "code") == -1018
         || objc_msgSend(a3, "code") == -1019
         || objc_msgSend(a3, "code") == -1020
         || objc_msgSend(a3, "code") == -995
         || objc_msgSend(a3, "code") == -996
         || objc_msgSend(a3, "code") == -997))
      {
        goto LABEL_70;
      }
    }
LABEL_89:
    v48 = (void *)MEMORY[0x18D76B4E4]();
    v49 = __ckLoggingOverride != 0;
    v50 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Found unknown error as part of a partial failure: %@"));
    _NSCoreDataLog(v49, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromPartialError:forStore:inMonitor:]_block_invoke");
    objc_autoreleasePoolPop(v48);
    v57 = -[PFCloudKitUnhandledPartialErrorMetric initWithContainerIdentifier:error:]([PFCloudKitUnhandledPartialErrorMetric alloc], "initWithContainerIdentifier:error:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 8), "containerIdentifier"), a3);
    v58 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (v58)
      v59 = *(_QWORD *)(v58 + 72);
    else
      v59 = 0;
    -[PFCloudKitMetricsClient logMetric:](v59, v57);

    goto LABEL_92;
  }
  v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Found unknown itemID (%@) as part of a partial failure: %@");
  _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, *(_QWORD *)(a1 + 80));
  v32 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    v33 = *(void **)(a1 + 80);
    *(_DWORD *)buf = 138412802;
    v61 = v33;
    v62 = 2112;
    v63 = a2;
    v64 = 2112;
    v65 = a3;
    _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: %@: Found unknown itemID (%@) as part of a partial failure: %@", buf, 0x20u);
  }
}

void __79__NSCloudKitMirroringDelegate__recoverConflictedZoneShares_forStore_inMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSManagedObject *v11;
  uint64_t v12;
  NSManagedObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x18D76B4E4]();
        v44 = 0;
        v9 = (void *)objc_msgSend(v7, "userInfo");
        v10 = (void *)objc_msgSend(v9, "objectForKey:", getCloudKitCKRecordChangedErrorServerRecordKey());
        v11 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend((id)objc_msgSend(v10, "recordID"), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), (uint64_t)&v44);
        if (!v11)
        {
          v26 = (void *)MEMORY[0x18D76B4E4]();
          v27 = __ckLoggingOverride != 0;
          v28 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover conflict for record: %@ due to error: %@"));
          _NSCoreDataLog(v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
          objc_autoreleasePoolPop(v26);
          goto LABEL_16;
        }
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (!v12
          || (v13 = v11, (v14 = *(_QWORD *)(v12 + 136)) == 0)
          || (v15 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v14, (uint64_t)v10, &v44)) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v17 = (void *)MEMORY[0x18D76B4E4]();
          v35 = __ckLoggingOverride != 0;
          v36 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover conflict for record: %@ due to error: %@"));
          _NSCoreDataLog(v35, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
          v16 = 0;
          goto LABEL_14;
        }
        v16 = v15;
        -[NSManagedObject setEncodedShareData:](v13, "setEncodedShareData:", v15);
        -[NSManagedObject setNeedsShareUpdate:](v13, "setNeedsShareUpdate:", 0);
        if ((objc_msgSend(*(id *)(a1 + 56), "save:", &v44) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v17 = (void *)MEMORY[0x18D76B4E4]();
          v18 = __ckLoggingOverride != 0;
          v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover conflict for record: %@ due to save failure: %@"));
          _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverConflictedZoneShares:forStore:inMonitor:]_block_invoke");
LABEL_14:
          objc_autoreleasePoolPop(v17);
        }

LABEL_16:
        v43 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        objc_autoreleasePoolPop(v8);
        if (!v43)
          return;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v4);
  }
}

void __79__NSCloudKitMirroringDelegate__recoverUnknownItemRecordIDs_forStore_inMonitor___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  uint64_t v114;
  __int16 v115;
  void *v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v110 = 0;
  v2 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), &v110);
  v3 = v2;
  if (!v2)
  {
    v47 = (void *)MEMORY[0x18D76B4E4]();
    v48 = __ckLoggingOverride;
    v49 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to recover from unknown item error due to record metadata fetch error: %@"));
    _NSCoreDataLog(v48 != 0, v49, v50, v51, v52, v53, v54, v55, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
LABEL_43:
    objc_autoreleasePoolPop(v47);
    return;
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v107 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        if (objc_msgSend(v7, "needsCloudDelete"))
        {
          objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v7);
        }
        else
        {
          v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Unexpected state for record metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@");
          _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 56));
          v15 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v16 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            v114 = v16;
            v115 = 2112;
            v116 = v7;
            _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: %@: Unexpected state for record metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@", buf, 0x16u);
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
    }
    while (v4);
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "save:", &v110))
  {
    v47 = (void *)MEMORY[0x18D76B4E4]();
    v56 = __ckLoggingOverride;
    v57 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save record metadata changes from recovering unknown item errors: %@"));
    _NSCoreDataLog(v56 != 0, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
    goto LABEL_43;
  }
  v17 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E0C9AA60], *(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), &v110);
  v18 = v17;
  if (!v17)
  {
    v64 = (void *)MEMORY[0x18D76B4E4]();
    v65 = __ckLoggingOverride;
    v66 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to recover from unknown item error due to mirrored relationship fetch error: %@"));
    _NSCoreDataLog(v65 != 0, v66, v67, v68, v69, v70, v71, v72, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
LABEL_46:
    objc_autoreleasePoolPop(v64);
    return;
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v103 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        if (objc_msgSend(v22, "needsDelete"))
        {
          objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v22);
        }
        else
        {
          v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Unexpected state for mirrored relationship metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@");
          _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, *(_QWORD *)(a1 + 56));
          v30 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v31 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            v114 = v31;
            v115 = 2112;
            v116 = v22;
            _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: %@: Unexpected state for mirrored relationship metadata. It was not found on the server but the local row was not expected to be deleted, how did we get here? %@", buf, 0x16u);
          }
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    }
    while (v19);
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "save:", &v110))
  {
    v64 = (void *)MEMORY[0x18D76B4E4]();
    v73 = __ckLoggingOverride;
    v74 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save mirrored relationship changes from recovering unknown item errors: %@"));
    _NSCoreDataLog(v73 != 0, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
    goto LABEL_46;
  }
  v32 = +[NSCKRecordZoneMoveReceipt moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:](NSCKRecordZoneMoveReceipt, "moveReceiptsMatchingRecordIDs:inManagedObjectContext:persistentStore:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), &v110);
  v33 = v32;
  if (v32)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v99 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          if (objc_msgSend(v37, "needsCloudDelete"))
          {
            objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v37);
          }
          else
          {
            v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Unexpected move receipt state. It was not found on the server but the local row was not marked for cloud deletion. Why were we trying to access it? %@");
            _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, *(_QWORD *)(a1 + 56));
            v45 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              v46 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412546;
              v114 = v46;
              v115 = 2112;
              v116 = v37;
              _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: %@: Unexpected move receipt state. It was not found on the server but the local row was not marked for cloud deletion. Why were we trying to access it? %@", buf, 0x16u);
            }
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      }
      while (v34);
    }
    if (objc_msgSend(*(id *)(a1 + 48), "save:", &v110))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      return;
    }
    v81 = (void *)MEMORY[0x18D76B4E4]();
    v90 = __ckLoggingOverride;
    v91 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to recover from unknown item error due to a save failure after deleting move receipts: %@"));
    _NSCoreDataLog(v90 != 0, v91, v92, v93, v94, v95, v96, v97, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
  }
  else
  {
    v81 = (void *)MEMORY[0x18D76B4E4]();
    v82 = __ckLoggingOverride;
    v83 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to recover from unknown item error due to move receipt fetch error: %@"));
    _NSCoreDataLog(v82 != 0, v83, v84, v85, v86, v87, v88, v89, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverUnknownItemRecordIDs:forStore:inMonitor:]_block_invoke");
  }
  objc_autoreleasePoolPop(v81);
}

uint64_t __84__NSCloudKitMirroringDelegate__recoverFromUnknownShareRecordIDs_forStore_inMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void **p_cache;
  uint64_t v6;
  void *v7;
  NSManagedObject *v8;
  NSManagedObject *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  _BOOL8 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  char *v74;
  uint64_t v75;
  void *context;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  NSManagedObject *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (result)
  {
    v4 = result;
    p_cache = &OBJC_METACLASS___PFCloudKitHistoryAnalyzerOptions.cache;
    v75 = *(_QWORD *)v83;
    v71 = v2;
    do
    {
      v6 = 0;
      v72 = v4;
      do
      {
        if (*(_QWORD *)v83 != v75)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v6);
        context = (void *)MEMORY[0x18D76B4E4]();
        v81 = 0;
        v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)(p_cache + 453), (void *)objc_msgSend(v7, "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), (uint64_t)&v81);
        if (v8)
        {
          v9 = v8;
          if (-[NSManagedObject encodedShareData](v8, "encodedShareData"))
          {
            v10 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v9);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            if (v11)
              v12 = *(_QWORD *)(v11 + 136);
            else
              v12 = 0;
            v74 = v10;
            v13 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v12, (void *)-[NSManagedObject encodedShareData](v9, "encodedShareData"), v10, &v81);
            v73 = v13;
            if (v13)
            {
              v14 = v13;
              v15 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKShareClass[0]()), "initWithRecordZoneID:", objc_msgSend(v7, "zoneID"));
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v16 = (void *)objc_msgSend(v14, "participants");
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v78;
                do
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v78 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                    if (objc_msgSend(v21, "role") != 1)
                      objc_msgSend(v15, "addParticipant:", v21);
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
                }
                while (v18);
              }
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              if (v22
                && (v23 = *(_QWORD *)(v22 + 136)) != 0
                && (v24 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v23, (uint64_t)v15, &v81)) != 0)
              {
                v25 = v24;
                -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v24);
                p_cache = (void **)(&OBJC_METACLASS___PFCloudKitHistoryAnalyzerOptions + 16);
                if (objc_msgSend(*(id *)(a1 + 56), "save:", &v81))
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
                }
                else
                {
                  v62 = (void *)MEMORY[0x18D76B4E4]();
                  v63 = __ckLoggingOverride != 0;
                  v64 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover from an unknown item error because the share recovery save failed: %@\n%@"));
                  _NSCoreDataLog(v63, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
                  objc_autoreleasePoolPop(v62);
                }
              }
              else
              {
                v53 = (void *)MEMORY[0x18D76B4E4]();
                v54 = __ckLoggingOverride != 0;
                v55 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover from an unknown item error because the replacement share record couldn't be encoded: %@\n%@"));
                _NSCoreDataLog(v54, v55, v56, v57, v58, v59, v60, v61, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
                objc_autoreleasePoolPop(v53);
                v25 = 0;
                p_cache = (void **)(&OBJC_METACLASS___PFCloudKitHistoryAnalyzerOptions + 16);
              }
              v35 = context;

              v2 = v71;
              v4 = v72;
            }
            else
            {
              v44 = (void *)MEMORY[0x18D76B4E4]();
              v45 = __ckLoggingOverride != 0;
              v46 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover from unknown item error because the current share couldn't be decoded: %@ - %@"));
              _NSCoreDataLog(v45, v46, v47, v48, v49, v50, v51, v52, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
              objc_autoreleasePoolPop(v44);
              v35 = context;
            }

          }
          else
          {
            v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Got an unknown item error for a zone metadata without a share: %@ - %@");
            _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)v7);
            v43 = __pflogFaultLog;
            v35 = context;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v87 = v7;
              v88 = 2112;
              v89 = v9;
              _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Got an unknown item error for a zone metadata without a share: %@ - %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v26 = (void *)MEMORY[0x18D76B4E4]();
          v27 = __ckLoggingOverride != 0;
          v28 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to recover from an unknown item error for '%@' because the zone metadata couldn't be fetched: %@"));
          _NSCoreDataLog(v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
          objc_autoreleasePoolPop(v26);
          v35 = context;
        }
        objc_autoreleasePoolPop(v35);
        ++v6;
      }
      while (v6 != v4);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void __62__NSCloudKitMirroringDelegate__handleError_duringShareAccept___block_invoke(_QWORD *a1)
{
  NSCloudKitMirroringResult *v2;

  v2 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:]([NSCloudKitMirroringResult alloc], "initWithRequest:storeIdentifier:success:madeChanges:error:", a1[4], *(_QWORD *)(a1[5] + 168), 0, 0, a1[6]);
  -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](a1[5], (_QWORD *)a1[4], v2);

}

- (void)_postResetSyncNotificationWithName:(void *)a3 forError:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x18D76B4E4]();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKey:", a3, *MEMORY[0x1E0CB3388]);
  v8 = (void *)objc_msgSend(a3, "domain");
  v9 = objc_msgSend(a3, "code");
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    if (!objc_msgSend(v8, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
      goto LABEL_15;
    v10 = &unk_1E1F4B780;
    if (v9 > 27)
    {
      if (v9 != 112)
      {
        if (v9 != 28)
          goto LABEL_15;
        v10 = &unk_1E1F4B798;
      }
    }
    else if (v9 == 21)
    {
      v10 = &unk_1E1F4B7B0;
    }
    else if (v9 != 26)
    {
      goto LABEL_15;
    }
LABEL_18:
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey"));
    goto LABEL_19;
  }
  if (v9 == 134301)
  {
    v10 = &unk_1E1F4B768;
    goto LABEL_18;
  }
  if (v9 == 134405)
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey"));
    if (v10)
      goto LABEL_18;
  }
LABEL_15:
  v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to get a reset sync reason for error even though we're posting a notification for it: %@");
  _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)a3);
  v18 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = a3;
    _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Failed to get a reset sync reason for error even though we're posting a notification for it: %@", buf, 0xCu);
  }
LABEL_19:
  v19 = (id)objc_msgSend(v7, "copy");

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", a2, a1, v19);
  objc_msgSend(a1, "logResetSyncNotification:", v20);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v20);

  objc_autoreleasePoolPop(v6);
}

- (void)logResetSyncNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@: Sending '%@'"), self, objc_msgSend(a3, "name"));
  v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey"));
  if (v4)
    v4 = objc_msgSend(v14, "appendFormat:", CFSTR(" with reason: '%@'"), +[NSCloudKitMirroringDelegate stringForResetReason:](NSCloudKitMirroringDelegate, "stringForResetReason:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey")), "unsignedIntegerValue")));
  v5 = (void *)MEMORY[0x18D76B4E4](v4);
  v6 = __ckLoggingOverride != 0;
  v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@"));
  _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSCloudKitMirroringDelegate logResetSyncNotification:]");
  objc_autoreleasePoolPop(v5);

}

- (void)exporter:(id)a3 willScheduleOperations:(id)a4
{
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (objc_msgSend(a4, "count", a3))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = CFSTR("operations");
      v8[0] = a4;
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PFCloudKitWillExportNotificationName"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
    }
  }
}

- (void)managedObjectContextSaved:(id)a3
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];

  v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("managedObjectContext"));
  if (v5)
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  else
    WeakRetained = 0;
  v7 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v8 = 9;
  else
    v8 = __ckLoggingOverride;
  v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Observed context save: %@ - %@"));
  objc_msgSend(a3, "object");
  _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate managedObjectContextSaved:]");
  objc_autoreleasePoolPop(v7);
  if (!+[PFCloudKitHistoryAnalyzer isPrivateTransactionAuthor:](PFCloudKitHistoryAnalyzer, "isPrivateTransactionAuthor:", objc_msgSend(WeakRetained, "transactionAuthor"))&& !+[PFCloudKitHistoryAnalyzer isPrivateContextName:](PFCloudKitHistoryAnalyzer, "isPrivateContextName:", objc_msgSend(WeakRetained, "name")))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke;
    v16[3] = &unk_1E1EE0D88;
    v16[4] = self;
    v16[5] = a3;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v16);
  }

}

void __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke(int8x16_t *a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id Weak;
  id v7;
  _QWORD v8[5];
  int8x16_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[0] + 128));
  v3 = a1[2].i64[0];
  if (v3 && (v4 = *(_QWORD *)(v3 + 8)) != 0)
    v5 = *(void **)(v4 + 88);
  else
    v5 = 0;
  Weak = objc_loadWeak((id *)(v3 + 120));
  v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke_2;
  v8[3] = &unk_1E1EDD790;
  v8[4] = v7;
  v9 = vextq_s8(a1[2], a1[2], 8uLL);
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v8);

}

void __57__NSCloudKitMirroringDelegate_managedObjectContextSaved___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v28[0] = CFSTR("inserted_objectIDs");
    v28[1] = CFSTR("updated_objectIDs");
    v28[2] = CFSTR("deleted_objectIDs");
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v4)
    {
      v5 = v4;
      v18 = v2;
      v6 = 0;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v3);
          v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "userInfo"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v20;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v20 != v12)
                  objc_enumerationMutation(v9);
                v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "_storeIdentifier");
                v15 = *(_QWORD *)(a1 + 32);
                if (v15)
                  v16 = *(_QWORD *)(v15 + 48);
                else
                  v16 = 0;
                if ((objc_msgSend(v14, "isEqualToString:", v16) & 1) != 0)
                {
                  v6 = 1;
                  goto LABEL_21;
                }
                ++v13;
              }
              while (v11 != v13);
              v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              v11 = v17;
            }
            while (v17);
          }
LABEL_21:
          ;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
      v2 = v18;
      if ((v6 & 1) != 0)
        -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](*(_QWORD *)(a1 + 48), 0);
    }
  }

}

- (void)remoteStoreDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[8];

  v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("storeURL"));
  v6 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("historyToken"));
  v7 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSStoreUUID"));
  v8 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v9 = 9;
  else
    v9 = __ckLoggingOverride;
  v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Observed remote store notification: %@ - %@ - %@ - %@"));
  objc_msgSend(a3, "object");
  _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]");
  objc_autoreleasePoolPop(v8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke;
  v17[3] = &unk_1E1EE0F68;
  v17[4] = self;
  v17[5] = v7;
  v17[6] = v6;
  v17[7] = v5;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v17);
}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id Weak;
  id *v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
    v4 = *(void **)(v3 + 88);
  else
    v4 = 0;
  Weak = objc_loadWeak((id *)(v2 + 120));
  v6 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v4, (uint64_t)Weak);
  v7 = v6;
  if (v6)
    WeakRetained = objc_loadWeakRetained(v6 + 4);
  else
    WeakRetained = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_2;
  v10[3] = &unk_1E1EE04E0;
  v10[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v10);

}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_2(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSManagedObjectContext *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[9];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;

  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    v24 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v25 = 9;
    else
      v25 = __ckLoggingOverride;
    v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Ignoring remote change notification because the store has been removed from the coordinator: %@"));
    goto LABEL_32;
  }
  v3 = a1[4];
  if (v3)
    v4 = *(void **)(v3 + 48);
  else
    v4 = 0;
  if (!objc_msgSend(v4, "isEqualToString:", a1[5]))
  {
    v24 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v25 = 9;
    else
      v25 = __ckLoggingOverride;
    v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Ignoring remote change notification because it's for a different store: %@ / %@"));
    goto LABEL_32;
  }
  v5 = (void *)a1[6];
  if (!v5)
  {
    v24 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v25 = 9;
    else
      v25 = __ckLoggingOverride;
    v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Ignoring remote change notification because it didn't change any entities tracked by persistent history: %@"));
    goto LABEL_32;
  }
  v6 = (void *)objc_msgSend(v5, "storeTokens");
  v7 = a1[4];
  if (v7)
    v8 = *(_QWORD *)(v7 + 48);
  else
    v8 = 0;
  v9 = objc_msgSend(v6, "objectForKey:", v8);
  if (!v9)
  {
    v24 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v25 = 9;
    else
      v25 = __ckLoggingOverride;
    v26 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Ignoring remote change notification because it didn't change any entities in the monitored store: %@"));
LABEL_32:
    _NSCoreDataLog(v25, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
    objc_autoreleasePoolPop(v24);
    goto LABEL_33;
  }
  v10 = v9;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3052000000;
  v52 = __Block_byref_object_copy__42;
  v53 = __Block_byref_object_dispose__42;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3052000000;
  v46 = __Block_byref_object_copy__42;
  v47 = __Block_byref_object_dispose__42;
  v48 = 0;
  v11 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_3;
  v42[3] = &unk_1E1EDFAD8;
  v42[4] = v2;
  v42[5] = v11;
  v42[6] = &v43;
  v42[7] = &v55;
  v42[8] = &v49;
  v12 = -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", v42);
  if (*((_BYTE *)v56 + 24))
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend((id)v50[5], "storeTokens"), "objectForKey:", objc_msgSend(v2, "identifier"));
    if (!v13 || objc_msgSend(v13, "compare:", v10) == -1)
    {
      -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](a1[7], 0);
    }
    else
    {
      v14 = (void *)MEMORY[0x18D76B4E4]();
      v15 = __ckLoggingOverride;
      v16 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Ignoring remote change notification because the exporter has already caught up to this transaction: %@ / %@ - %@"));
      if (v15 >= 9)
        v23 = 9;
      else
        v23 = v15;
      _NSCoreDataLog(v23, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
      objc_autoreleasePoolPop(v14);
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x18D76B4E4](v12);
    v34 = __ckLoggingOverride;
    v35 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Ignoring remote change notification because the current history token couldn't be read: %@ - %@"));
    _NSCoreDataLog(v34 != 0, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_2");
    objc_autoreleasePoolPop(v33);
  }

  v50[5] = 0;
  v44[5] = 0;
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
LABEL_33:

}

void __52__NSCloudKitMirroringDelegate_remoteStoreDidChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v3 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v4 = __ckLoggingOverride != 0;
    v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to read the last history token: %@"));
    _NSCoreDataLog(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[NSCloudKitMirroringDelegate remoteStoreDidChange:]_block_invoke_3");
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(v2, "transformedValue");
  }
}

- (void)newActivityWithIdentifier:(void *)a3 andVoucher:
{
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  xpc_object_t v10;
  _QWORD *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;

  if (!a1)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(getCloudKitCKSchedulerActivityClass()), "initWithIdentifier:container:priority:", a2, *(_QWORD *)(a1 + 48), 2);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
    v8 = *(unsigned __int8 *)(v7 + 17) != 0;
  else
    v8 = 0;
  objc_msgSend(v5, "setOverrideRateLimiting:", v8);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend((id)objc_msgSend(a3, "operationConfiguration"), "qualityOfService") == 9)
  {
    v10 = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
    v11 = (_QWORD *)MEMORY[0x1E0C80878];
  }
  else
  {
    v12 = xpc_string_create((const char *)*MEMORY[0x1E0C80888]);
    objc_msgSend(v9, "setObject:forKey:", v12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80878]));
    xpc_release(v12);
    v10 = xpc_int64_create(10);
    v11 = (_QWORD *)MEMORY[0x1E0C80790];
  }
  objc_msgSend(v9, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v11));
  xpc_release(v10);
  v13 = xpc_int64_create(0);
  objc_msgSend(v9, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80760]));
  xpc_release(v13);
  v14 = xpc_string_create((const char *)objc_msgSend(*(id *)(a1 + 200), "cStringUsingEncoding:", 4));
  objc_msgSend(v9, "setObject:forKey:", v14, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C807A0]));
  xpc_release(v14);
  objc_msgSend(v6, "setAdditionalXPCActivityCriteria:", v9);

  return v6;
}

void __73__NSCloudKitMirroringDelegate_setupMirroringDelegateFromPushNotification__block_invoke(uint64_t a1)
{
  NSCloudKitMirroringDelegateSetupRequestOptions *v2;
  NSCloudKitMirroringDelegateSetupRequest *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = objc_alloc_init(NSCloudKitMirroringDelegateSetupRequestOptions);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "defaultOperationConfiguration"))
    -[NSCloudKitMirroringRequestOptions setOperationConfiguration:](v2, "setOperationConfiguration:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "defaultOperationConfiguration"));
  -[NSCloudKitMirroringDelegateSetupRequestOptions setFromNotification:](v2, "setFromNotification:", 1);
  v3 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:]([NSCloudKitMirroringDelegateSetupRequest alloc], "initWithOptions:completionBlock:", v2, 0);
  -[NSCloudKitMirroringDelegate beginActivitiesForRequest:](*(_QWORD *)(a1 + 32), v3);
  v24 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 160);
  else
    v5 = 0;
  v6 = -[NSCloudKitMirroringRequestManager enqueueRequest:error:](v5, (uint64_t)v3, &v24);
  v7 = (void *)MEMORY[0x18D76B4E4]();
  if (v6)
  {
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v8 = 16;
    else
      v8 = __ckLoggingOverride;
    v9 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Successfully enqueued setup request from push notification: %@"));
    _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[NSCloudKitMirroringDelegate setupMirroringDelegateFromPushNotification]_block_invoke");
    objc_autoreleasePoolPop(v7);
    -[NSCloudKitMirroringDelegate checkAndExecuteNextRequest](*(_QWORD *)(a1 + 32));
  }
  else
  {
    v16 = __ckLoggingOverride != 0;
    v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to enqueue setup request, this likely means one is already scheduled and this has collided: %@"));
    _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[NSCloudKitMirroringDelegate setupMirroringDelegateFromPushNotification]_block_invoke");
    objc_autoreleasePoolPop(v7);
  }

}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[7];
  char v7;
  __int16 v8;

  v2 = -[PFCloudKitStoreMonitor initForStore:]([PFCloudKitStoreMonitor alloc], "initForStore:", objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 120)));
  v3 = v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained(v2 + 4);
  else
    WeakRetained = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_2;
  v6[3] = &unk_1E1EE0FE0;
  v7 = *(_BYTE *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v3;
  v8 = *(_WORD *)(a1 + 49);
  v6[6] = v5;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v3, (uint64_t)v6);

}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSManagedObjectContext *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[10];
  char v24;
  __int16 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v3 = 9;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Checking to see if an automated import should be scheduled."));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke_2");
  objc_autoreleasePoolPop(v2);
  v11 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 40));
  if (v11)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3052000000;
    v29 = __Block_byref_object_copy__42;
    v30 = __Block_byref_object_dispose__42;
    v31 = 0;
    v12 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 40));
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_3;
    v23[3] = &unk_1E1EE0FB8;
    v24 = *(_BYTE *)(a1 + 56);
    v25 = *(_WORD *)(a1 + 57);
    v23[4] = *(_QWORD *)(a1 + 32);
    v23[5] = v11;
    v13 = *(_QWORD *)(a1 + 48);
    v23[6] = v12;
    v23[7] = v13;
    v23[8] = &v32;
    v23[9] = &v26;
    -[NSManagedObjectContext performBlockAndWait:](v12, "performBlockAndWait:", v23);
    if (!*((_BYTE *)v33 + 24))
      -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](*(_QWORD *)(a1 + 32), (void *)v27[5]);

    v27[5] = 0;
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v14 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v15 = 9;
    else
      v15 = __ckLoggingOverride;
    v16 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Cancelling import check because the store is dead."));
    _NSCoreDataLog(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke_2");
    objc_autoreleasePoolPop(v14);
  }

}

void __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  char v3;
  const __CFString *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  NSObject *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSManagedObject *v53;
  NSManagedObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  const __CFString *v93;
  char v94;
  void *v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109[9];
  uint8_t buf[4];
  uint64_t v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v1 = a1;
  v114 = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "usableVoucherForEventType:", 1);
  v109[0] = 0;
  v95 = v2;
  if (v2)
  {
    v3 = objc_msgSend((id)objc_msgSend(v2, "operationConfiguration"), "qualityOfService") > 24;
    if (*(_BYTE *)(v1 + 80))
    {
      v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Push-Voucher-%@"), objc_msgSend(v95, "label"));
LABEL_10:
      v5 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if (*(_BYTE *)(v1 + 80))
    {
      v4 = CFSTR("Push");
      goto LABEL_10;
    }
  }
  if (*(_BYTE *)(v1 + 81))
  {
    v4 = CFSTR("RecoverableImportError");
    goto LABEL_10;
  }
  if (*(_BYTE *)(v1 + 82))
  {
    v4 = CFSTR("AcceptShare");
    goto LABEL_10;
  }
  v51 = *(_QWORD *)(v1 + 32);
  if (v51)
    v52 = *(void **)(v51 + 8);
  else
    v52 = 0;
  v53 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, objc_msgSend(v52, "databaseScope"), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), (uint64_t)v109);
  v54 = v53;
  if (v53)
  {
    if (-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:](*(_QWORD *)(v1 + 32), (void *)-[NSManagedObject lastFetchDate](v53, "lastFetchDate")))
    {
      v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Database-LastFetchDate-%@"), -[NSManagedObject lastFetchDate](v54, "lastFetchDate"));
      v55 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
      if (v55)
        LOBYTE(v55) = *(_BYTE *)(v55 + 16) != 0;
      v3 |= v55;
      goto LABEL_10;
    }
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v64 = (void *)-[NSManagedObject recordZones](v54, "recordZones");
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    v94 = v3;
    v100 = v1;
    if (v65)
    {
      v66 = 0;
      v4 = 0;
      obj = v64;
      v97 = *(_QWORD *)v106;
      while (1)
      {
        v98 = v65;
        v67 = 0;
        do
        {
          if (*(_QWORD *)v106 != v97)
            objc_enumerationMutation(obj);
          v68 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v67);
          v99 = v67;
          if (objc_msgSend(v68, "needsImport"))
          {
            v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone-%@"), objc_msgSend(v68, "ckRecordZoneName"));
LABEL_52:
            v4 = (const __CFString *)v69;
            v66 = 1;
            goto LABEL_53;
          }
          if (-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:](*(_QWORD *)(v100 + 32), (void *)objc_msgSend(v68, "lastFetchDate")))
          {
            objc_msgSend(v68, "setNeedsImport:", 1);
            v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone-LastFetchDate-%@-%@"), objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v68, "lastFetchDate"));
            goto LABEL_52;
          }
          if (objc_msgSend(*(id *)(*(_QWORD *)(v100 + 32) + 8), "databaseScope") == 1)
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v70 = (void *)objc_msgSend(v68, "queries");
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v102;
              do
              {
                for (i = 0; i != v71; ++i)
                {
                  if (*(_QWORD *)v102 != v72)
                    objc_enumerationMutation(v70);
                  v74 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
                  if (objc_msgSend(v74, "queryCursor"))
                  {
                    objc_msgSend(v68, "setNeedsImport:", 1);
                    v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone-QueryCursor-%@-%@"), objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v74, "recordType"));
                  }
                  else
                  {
                    if (!-[NSCloudKitMirroringDelegate _dateExceedsSchedulingThreshold:](*(_QWORD *)(v100 + 32), (void *)objc_msgSend(v74, "lastFetchDate")))continue;
                    objc_msgSend(v68, "setNeedsImport:", 1);
                    v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone-QueryLastFetchDate-%@-%@-%@"), objc_msgSend(v68, "ckRecordZoneName"), objc_msgSend(v74, "recordType"), objc_msgSend(v74, "lastFetchDate"));
                  }
                  v4 = (const __CFString *)v75;
                  v66 = 1;
                }
                v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
              }
              while (v71);
            }
          }
LABEL_53:
          v67 = v99 + 1;
        }
        while (v99 + 1 != v98);
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
        if (!v65)
          goto LABEL_82;
      }
    }
    v66 = 0;
    v4 = 0;
LABEL_82:
    v5 = v66 & 1;
    v1 = v100;
    v3 = v94;
  }
  else
  {
    v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch database metadata during automatic import check: %@");
    _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, v109[0]);
    v63 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v109[0];
      _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch database metadata during automatic import check: %@", buf, 0xCu);
    }
    v5 = 0;
    v4 = 0;
  }
LABEL_11:
  if (objc_msgSend(*(id *)(v1 + 48), "hasChanges")
    && (objc_msgSend(*(id *)(v1 + 48), "save:", v109) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v7 = __ckLoggingOverride;
    v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save metadata changes during import check: %@"));
    _NSCoreDataLog(v7 != 0, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke");
    objc_autoreleasePoolPop(v6);
  }
  if (v5)
  {
    if (!*(_BYTE *)(*(_QWORD *)(v1 + 32) + 89))
    {
      v33 = (void *)MEMORY[0x18D76B4E4]();
      v34 = __ckLoggingOverride;
      v35 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Deferring scheduling an import because not initialized yet: %@"));
      if (v34 >= 3)
        v42 = 3;
      else
        v42 = v34;
      _NSCoreDataLog(v42, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke");
      objc_autoreleasePoolPop(v33);
      goto LABEL_80;
    }
    if (!v4
      && (v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Mirroring delegate is scheduling an import but didn't log why: %@"), _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, *(_QWORD *)(v1 + 32)), v22 = __pflogFaultLog, os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)))
    {
      v76 = *(_QWORD *)(v1 + 32);
      *(_DWORD *)buf = 138412290;
      v111 = v76;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Mirroring delegate is scheduling an import but didn't log why: %@", buf, 0xCu);
      if ((v3 & 1) != 0)
        goto LABEL_19;
    }
    else if ((v3 & 1) != 0)
    {
LABEL_19:
      v23 = (void *)MEMORY[0x18D76B4E4]();
      v24 = __ckLoggingOverride;
      if (v95)
      {
        v25 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Bypassing dasd for scheduling for voucher: %@\n%@"));
        if (v24 >= 3)
          v32 = 3;
        else
          v32 = v24;
        v93 = v4;
        v91 = 3429;
        v92 = *(_QWORD *)(v1 + 32);
        _NSCoreDataLog(v32, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke");
      }
      else
      {
        v43 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Bypassing dasd for scheduling for HomeKit: %@"));
        if (v24 >= 3)
          v50 = 3;
        else
          v50 = v24;
        v92 = *(_QWORD *)(v1 + 32);
        v93 = v4;
        v91 = 3431;
        _NSCoreDataLog(v50, v43, v44, v45, v46, v47, v48, v49, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke");
      }
      objc_autoreleasePoolPop(v23);
      -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(v1 + 32), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InitialImport-BypassingDasd-%@"), v4, v91, v92, v93), 0, (uint64_t)v95, 0);
      goto LABEL_80;
    }
    v77 = -[NSCloudKitMirroringDelegate newActivityWithIdentifier:andVoucher:](*(_QWORD *)(v1 + 32), *(_QWORD *)(*(_QWORD *)(v1 + 32) + 176), v95);
    v78 = v77;
    if (*(_QWORD *)(v1 + 56))
      objc_msgSend(v77, "setEarliestStartDate:");
    v79 = (void *)MEMORY[0x18D76B4E4]();
    v80 = __ckLoggingOverride;
    v81 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Scheduling automated import with activity (%@): %@"));
    if (v80 >= 3)
      v88 = 3;
    else
      v88 = v80;
    _NSCoreDataLog(v88, v81, v82, v83, v84, v85, v86, v87, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndScheduleImportIfNecessaryFromPush:fromErrorRecovery:fromShareAccept:andStartAfterDate:]_block_invoke");
    objc_autoreleasePoolPop(v79);
    v89 = *(_QWORD *)(v1 + 32);
    if (v89)
      v90 = *(void **)(v89 + 64);
    else
      v90 = 0;
    objc_msgSend(v90, "submitActivity:", v78);

  }
LABEL_80:

}

- (uint64_t)_dateExceedsSchedulingThreshold:(uint64_t)result
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (!a2)
      return 1;
    v3 = result;
    v4 = +[NSCloudKitMirroringDelegate isFirstPartyContainerIdentifier:](NSCloudKitMirroringDelegate, "isFirstPartyContainerIdentifier:", objc_msgSend(*(id *)(result + 8), "containerIdentifier"));
    v5 = objc_msgSend(*(id *)(v3 + 8), "databaseScope");
    if ((unint64_t)(v5 - 2) >= 2)
    {
      if (v5 != 1)
      {
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unsupported database scope in date threshold calculation: %ld");
        v11 = objc_msgSend(*(id *)(v3 + 8), "databaseScope");
        _NSCoreDataLog(17, v10, v12, v13, v14, v15, v16, v17, v11);
        v18 = __pflogFaultLog;
        v9 = -86400.0;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v20 = objc_msgSend(*(id *)(v3 + 8), "databaseScope");
          *(_DWORD *)buf = 134217984;
          v22 = v20;
          _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Unsupported database scope in date threshold calculation: %ld", buf, 0xCu);
        }
        goto LABEL_15;
      }
      v6 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "containerID"), "environment");
      v7 = !v4;
      v8 = -1800.0;
    }
    else
    {
      v6 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "containerID"), "environment");
      v7 = !v4;
      v8 = -300.0;
    }
    if (!v7)
      v8 = -86400.0;
    if (v6 == 2)
      v9 = -60.0;
    else
      v9 = v8;
LABEL_15:
    objc_msgSend(a2, "timeIntervalSinceNow");
    return v9 > v19;
  }
  return result;
}

void __57__NSCloudKitMirroringDelegate_checkAndExecuteNextRequest__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  const __CFString *v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id *v60;
  _BYTE buf[24];
  void *v62;
  id *v63;
  id *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v60 = WeakRetained;
  if (WeakRetained)
  {
    v2 = WeakRetained[20];
    v3 = v2;
    if (v2 && *((_QWORD *)v2 + 12))
    {
      v4 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v5 = 16;
      else
        v5 = __ckLoggingOverride;
      v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Deferring additional work. There is still an active request: %@"));
      _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v4);
      goto LABEL_34;
    }
    v22 = (id *)-[NSCloudKitMirroringRequestManager dequeueNextRequest]((id *)v2);
    v23 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v24 = 16;
    else
      v24 = __ckLoggingOverride;
    if (v22)
    {
      v25 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Executing: %@"));
      _NSCoreDataLog(v24, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v23);
      v32 = v22[9];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "endActivityForPhase:withError:", 0, 0);
        objc_msgSend((id)objc_msgSend(v60[1], "progressProvider"), "publishActivity:", v33);

      }
      else if (v32)
      {
        v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle this type of activity yet: %@");
        _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v32);
        v48 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v32;
          _os_log_fault_impl(&dword_18A253000, v48, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this type of activity yet: %@", buf, 0xCu);
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __59__NSCloudKitMirroringDelegate__performFetchRecordsRequest___block_invoke;
        v62 = &unk_1E1EE0D88;
        v49 = (uint64_t)v60;
        v63 = v60;
        v64 = v22;
        v50 = CFSTR("com.apple.coredata.cloudkit.fetch.records");
        v51 = CFSTR("CoreData: CloudKit Fetch Records");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __57__NSCloudKitMirroringDelegate__performImportWithRequest___block_invoke;
          v62 = &unk_1E1EE0D88;
          v49 = (uint64_t)v60;
          v63 = v60;
          v64 = v22;
          v50 = CFSTR("com.apple.coredata.cloudkit.import");
          v51 = CFSTR("CoreData: CloudKit Import");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __57__NSCloudKitMirroringDelegate__performExportWithRequest___block_invoke;
            v62 = &unk_1E1EE0D88;
            v49 = (uint64_t)v60;
            v63 = v60;
            v64 = v22;
            v50 = CFSTR("com.apple.coredata.cloudkit.export");
            v51 = CFSTR("CoreData: CloudKit Export");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __56__NSCloudKitMirroringDelegate__performResetZoneRequest___block_invoke;
              v62 = &unk_1E1EE0D88;
              v49 = (uint64_t)v60;
              v63 = v60;
              v64 = v22;
              v50 = CFSTR("com.apple.coredata.cloudkit.zone.reset");
              v51 = CFSTR("CoreData: CloudKit Zone Reset");
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSCloudKitMirroringDelegate _performSetupRequest:]((uint64_t)v60, v22);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[NSCloudKitMirroringDelegate _performDelegateResetRequest:]((uint64_t)v60, (uint64_t)v22);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      -[NSCloudKitMirroringDelegate _performSchemaInitializationRequest:]((uint64_t)v60, (uint64_t)v22);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        -[NSCloudKitMirroringDelegate _performSerializationRequest:]((uint64_t)v60, (uint64_t)v22);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          -[NSCloudKitMirroringDelegate _performExportProgressRequest:]((uint64_t)v60, (uint64_t)v22);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            -[NSCloudKitMirroringDelegate _performAcceptShareInvitationsRequest:]((uint64_t)v60, (uint64_t)v22);
                          }
                          else
                          {
                            v52 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "%@: Asked to execute a request that isn't understood yet: %@");
                            _NSCoreDataLog(17, v52, v53, v54, v55, v56, v57, v58, (uint64_t)v60);
                            v59 = __pflogFaultLog;
                            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138412546;
                              *(_QWORD *)&buf[4] = v60;
                              *(_WORD *)&buf[12] = 2112;
                              *(_QWORD *)&buf[14] = v22;
                              _os_log_fault_impl(&dword_18A253000, v59, OS_LOG_TYPE_FAULT, "CoreData: %@: Asked to execute a request that isn't understood yet: %@", buf, 0x16u);
                            }
                          }
                        }
                      }
                    }
                  }
                }
                goto LABEL_33;
              }
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __60__NSCloudKitMirroringDelegate__performMetadataResetRequest___block_invoke;
              v62 = &unk_1E1EE0D88;
              v49 = (uint64_t)v60;
              v63 = v60;
              v64 = v22;
              v50 = CFSTR("com.apple.coredata.cloudkit.metadata.reset");
              v51 = CFSTR("CoreData: CloudKit Metadata Reset");
            }
          }
        }
      }
      -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)buf);
    }
    else
    {
      v34 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: No more requests to execute."));
      _NSCoreDataLog(v24, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
      objc_autoreleasePoolPop(v23);
    }
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  v13 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v14 = 9;
  else
    v14 = __ckLoggingOverride;
  v15 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Unable to schedule work because the mirroring delegate was deallocated."));
  _NSCoreDataLog(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[NSCloudKitMirroringDelegate checkAndExecuteNextRequest]_block_invoke");
  objc_autoreleasePoolPop(v13);
LABEL_35:

}

- (void)finishedAutomatedRequestWithResult:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id Weak;
  id *v24;
  id *v25;
  id WeakRetained;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v36[7];
  __int128 buf;
  uint64_t (*v38)();
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = (void *)MEMORY[0x18D76B4E4]();
  v5 = (unint64_t)__ckLoggingOverride >= 3 ? 3 : __ckLoggingOverride;
  v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Finished request '%@' with result: %@"));
  objc_msgSend(a2, "request");
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:]");
  objc_autoreleasePoolPop(v4);
  if ((objc_msgSend(a2, "success") & 1) != 0)
    return;
  v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8])
    || objc_msgSend((id)objc_msgSend(a2, "error"), "code") != 134409)
  {
    return;
  }
  v14 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "userInfo");
  v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB3388]), "userInfo");
  v16 = (void *)objc_msgSend(v15, "objectForKey:", getCloudKitCKErrorRetryAfterKey[0]());
  objc_msgSend(v16, "doubleValue");
  if (v17 <= 0.0)
  {
    v19 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "doubleValue");
    v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
  }
  objc_msgSend(a2, "request");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 2;
  }
  else
  {
    objc_msgSend(a2, "request");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v20 = 1;
  }
  objc_msgSend(*(id *)(a1 + 224), "expireVouchersForEventType:", v20);
LABEL_16:
  objc_msgSend(a2, "request");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(_QWORD *)(a1 + 8);
    if (v21)
      v22 = *(void **)(v21 + 88);
    else
      v22 = 0;
    Weak = objc_loadWeak((id *)(a1 + 120));
    v24 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v22, (uint64_t)Weak);
    v25 = v24;
    if (v24)
      WeakRetained = objc_loadWeakRetained(v24 + 4);
    else
      WeakRetained = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __66__NSCloudKitMirroringDelegate_finishedAutomatedRequestWithResult___block_invoke;
    v36[3] = &unk_1E1EDD790;
    v36[4] = v25;
    v36[5] = a1;
    v36[6] = v19;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v25, (uint64_t)v36);

  }
  else
  {
    objc_msgSend(a2, "request");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v38 = __125__NSCloudKitMirroringDelegate_checkAndScheduleImportIfNecessaryFromPush_fromErrorRecovery_fromShareAccept_andStartAfterDate___block_invoke;
      v39 = &unk_1E1EE1008;
      v42 = 256;
      v43 = 0;
      v40 = a1;
      v41 = v19;
      -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:](a1, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)&buf);
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Can't handle automated requests of type '%@' yet.");
      objc_msgSend(a2, "request");
      v28 = objc_opt_class();
      _NSCoreDataLog(17, v27, v29, v30, v31, v32, v33, v34, v28);
      v35 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(a2, "request");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
        _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Can't handle automated requests of type '%@' yet.", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

void __66__NSCloudKitMirroringDelegate_finishedAutomatedRequestWithResult___block_invoke(uint64_t *a1)
{
  void *v2;
  id v3;

  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    v3 = v2;
    -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:](a1[5], a1[6]);
    v2 = v3;
  }

}

void __100__NSCloudKitMirroringDelegate__scheduleAutomatedImportWithLabel_activity_voucher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);

  v4 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v5 = 16;
  else
    v5 = __ckLoggingOverride;
  v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Finished automatic import - %@ - with result: %@"));
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v4);
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(a2, "success")
      && (v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain"),
          objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v14();
  }
  -[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __100__NSCloudKitMirroringDelegate__scheduleAutomatedExportWithLabel_activity_voucher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);

  v4 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v5 = 16;
  else
    v5 = __ckLoggingOverride;
  v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Finished automatic export - %@ - with result: %@"));
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v4);
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(a2, "success")
      && (v13 = (void *)objc_msgSend((id)objc_msgSend(a2, "error"), "domain"),
          objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v14();
  }
  return -[NSCloudKitMirroringDelegate finishedAutomatedRequestWithResult:](*(_QWORD *)(a1 + 32), a2);
}

void __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSManagedObjectContext *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[8];
  __int128 v25;
  uint64_t v26;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Marking zones %@ needing recovery from Manatee identity loss"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v23 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 48));
  if (v23)
  {
    v11 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 48));
    v24[0] = MEMORY[0x1E0C809B0];
    v24[2] = __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke_2;
    v24[3] = &unk_1E1EDED50;
    v26 = *(_QWORD *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v24[4] = *(_QWORD *)(a1 + 40);
    v24[5] = v12;
    v24[1] = 3221225472;
    v24[6] = v11;
    v24[7] = v13;
    v25 = *(_OWORD *)(a1 + 64);
    -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", v24);

  }
  else
  {
    v14 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v15 = 9;
    else
      v15 = __ckLoggingOverride;
    v16 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Cancelling marking zones needing recovery from Manatee identity loss because the store is dead."));
    _NSCoreDataLog(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:]_block_invoke_2");
    objc_autoreleasePoolPop(v14);
  }

}

uint64_t __108__NSCloudKitMirroringDelegate__markZonesNeedingRecoveryFromManateeIdentityLoss_databaseScope_inStore_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSManagedObject *v6;
  NSManagedObject *v7;
  void *v8;
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
  NSObject *v19;
  uint64_t result;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34[5];
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v34[0] = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v31;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(v2);
        v6 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v34);
        v7 = v6;
        if (!v6)
        {
          if (v34[0])
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v34[0];
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch zone metadata during marking zones needing recovery from Manatee identity loss: %@");
          _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)v34[0]);
          v19 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v34[0];
            _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch zone metadata during marking zones needing recovery from Manatee identity loss: %@", buf, 0xCu);
          }
          goto LABEL_20;
        }
        -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v6, "setNeedsRecoveryFromIdentityLoss:", 1);
        v8 = (void *)-[NSManagedObject ckOwnerName](v7, "ckOwnerName");
        v9 = *(_QWORD *)(a1 + 56);
        if (v9)
          v10 = *(void **)(v9 + 152);
        else
          v10 = 0;
        if ((objc_msgSend(v8, "isEqualToString:", objc_msgSend(v10, "recordName")) & 1) == 0)
          -[NSManagedObject setNeedsNewShareInvitation:](v7, "setNeedsNewShareInvitation:", 1);
        ++v5;
      }
      while (v3 != v5);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      v3 = v11;
      if (v11)
        continue;
      break;
    }
  }
LABEL_20:
  result = objc_msgSend(*(id *)(a1 + 48), "hasChanges");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 48), "save:", v34);
    if ((result & 1) == 0)
    {
      v21 = (void *)MEMORY[0x18D76B4E4]();
      v22 = __ckLoggingOverride;
      v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save metadata while marking zones needing recovery from Manatee identity loss: %@"));
      _NSCoreDataLog(v22 != 0, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[NSCloudKitMirroringDelegate _markZonesNeedingRecoveryFromManateeIdentityLoss:databaseScope:inStore:error:]_block_invoke");
      objc_autoreleasePoolPop(v21);
      result = (uint64_t)v34[0];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    }
  }
  return result;
}

void __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id Weak;
  id *v16;
  id *v17;
  id WeakRetained;
  NSCloudKitMirroringResult *v19;
  NSCloudKitMirroringResult *v20;
  _QWORD v21[6];
  __int128 v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v3 = 16;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Executing schema initialization request: %@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate _performSchemaInitializationRequest:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  v11 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v11 + 89))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__42;
    v29 = __Block_byref_object_dispose__42;
    v30 = 0;
    v12 = *(id *)(v11 + 8);
    v13 = v12;
    if (v12)
      v14 = (void *)*((_QWORD *)v12 + 11);
    else
      v14 = 0;
    Weak = objc_loadWeak((id *)(*(_QWORD *)(a1 + 40) + 120));
    v16 = (id *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v14, (uint64_t)Weak);
    v17 = v16;
    if (v16)
      WeakRetained = objc_loadWeakRetained(v16 + 4);
    else
      WeakRetained = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke_2;
    v21[3] = &unk_1E1EE1080;
    v21[4] = v17;
    v21[5] = v13;
    v23 = &v31;
    v24 = &v25;
    v22 = *(_OWORD *)(a1 + 32);
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v17, (uint64_t)v21);
    v19 = [NSCloudKitMirroringResult alloc];
    v20 = -[NSCloudKitMirroringResult initWithRequest:storeIdentifier:success:madeChanges:error:](v19, "initWithRequest:storeIdentifier:success:madeChanges:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), *((unsigned __int8 *)v32 + 24), *((unsigned __int8 *)v32 + 24), v26[5]);
    -[NSCloudKitMirroringDelegate _finishedRequest:withResult:](*(_QWORD *)(a1 + 40), *(_QWORD **)(a1 + 32), v20);

    v26[5] = 0;
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    -[NSCloudKitMirroringDelegate _requestAbortedNotInitialized:](v11, *(_QWORD **)(a1 + 32));
  }
}

void __67__NSCloudKitMirroringDelegate__performSchemaInitializationRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  PFCloudKitSchemaGenerator *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  id v42;
  uint64_t v43;
  _QWORD v44[8];
  _QWORD v45[8];
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "databaseScope") != 3)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = objc_msgSend(*(id *)(a1 + 48), "schemaInitializationOptions");
      v11 = *(_QWORD *)(a1 + 72);
      if (v9)
      {
        v12 = v10;
        v43 = *(_QWORD *)(v11 + 8);
        v53 = 0;
        v54 = &v53;
        v55 = 0x2020000000;
        v56 = 0;
        v47 = 0;
        v48 = &v47;
        v49 = 0x3052000000;
        v50 = __Block_byref_object_copy__42;
        v51 = __Block_byref_object_dispose__42;
        v52 = 0;
        v13 = -[PFCloudKitSchemaGenerator initWithMirroringOptions:forStoreInMonitor:]([PFCloudKitSchemaGenerator alloc], "initWithMirroringOptions:forStoreInMonitor:", *(_QWORD *)(v9 + 8), v8);
        v14 = (void *)-[PFCloudKitSchemaGenerator newRepresentativeRecords:]((uint64_t)v13, v48 + 5);
        if (v14)
        {
          if ((v12 & 4) != 0)
          {
            v15 = (void *)MEMORY[0x18D76B4E4]();
            v16 = __ckLoggingOverride != 0;
            v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ generated the following records for the model associated with the store: %@\n%@"));
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            _NSCoreDataLog(v16, v17, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSCloudKitMirroringDelegate _createSchemaForStore:withMonitor:options:error:]");
            objc_autoreleasePoolPop(v15);
          }
          if ((v12 & 2) != 0)
          {
            *((_BYTE *)v54 + 24) = 1;
          }
          else
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v14, "count"));
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke;
            v46[3] = &unk_1E1EE10A8;
            v46[4] = v25;
            objc_msgSend(v14, "enumerateObjectsUsingBlock:", v46);
            v26 = dispatch_semaphore_create(0);
            v27 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()), "initWithRecordsToSave:recordIDsToDelete:", v14, 0);
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_2;
            v45[3] = &unk_1E1EDFC40;
            v45[6] = &v53;
            v45[7] = &v47;
            v45[4] = v25;
            v45[5] = v26;
            objc_msgSend(v27, "setModifyRecordsCompletionBlock:", v45);
            objc_msgSend(*(id *)(v9 + 56), "addOperation:", v27);
            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

            if (*((_BYTE *)v54 + 24))
            {
              v28 = (id)objc_msgSend(v25, "allObjects");
              *((_BYTE *)v54 + 24) = 0;
              v29 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()), "initWithRecordsToSave:recordIDsToDelete:", 0, v28);
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_4;
              v44[3] = &unk_1E1EDFC40;
              v44[6] = &v53;
              v44[7] = &v47;
              v44[4] = v25;
              v44[5] = v26;
              objc_msgSend(v29, "setModifyRecordsCompletionBlock:", v44);

              objc_msgSend(*(id *)(v9 + 56), "addOperation:", v29);
              dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

            }
            if (v26)
              dispatch_release(v26);

          }
        }
        else
        {
          v30 = (id)v48[5];
        }
        v31 = (id)v48[5];
        if (!*((_BYTE *)v54 + 24))
        {
          v32 = v48[5];
          if (v32)
          {
            *(_QWORD *)(v43 + 40) = v32;
          }
          else
          {
            v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m");
            v40 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate.m";
              v63 = 1024;
              v64 = 3962;
              _os_log_fault_impl(&dword_18A253000, v40, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }
        }

        v41 = *((unsigned __int8 *)v54 + 24);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v53, 8);
        if (v41)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          goto LABEL_27;
        }
        v11 = *(_QWORD *)(a1 + 72);
      }
      v42 = *(id *)(*(_QWORD *)(v11 + 8) + 40);
      goto LABEL_27;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v59[0] = *MEMORY[0x1E0CB2D68];
    v60[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was skipped because it was configured with databaseScope == CKDatabaseShared."), objc_msgSend(*(id *)(a1 + 48), "requestIdentifier"));
    v59[1] = *MEMORY[0x1E0CB2AA0];
    v60[1] = objc_msgSend((id)objc_msgSend(v2, "URL"), "path");
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v5 = objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134419, v4);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v57 = *MEMORY[0x1E0CB2D68];
    v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request '%@' was cancelled because the store was removed from the coordinator."), objc_msgSend(*(id *)(a1 + 48), "requestIdentifier"));
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v5 = objc_msgSend(v6, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134407, v7);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v5;
LABEL_27:

}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "recordID"));
}

intptr_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v7;
  _QWORD v9[5];

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_3;
  v9[3] = &unk_1E1EE10A8;
  v9[4] = v7;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", v7))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "recordID"));
}

intptr_t __79__NSCloudKitMirroringDelegate__createSchemaForStore_withMonitor_options_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  int v7;
  uint64_t v8;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  v7 = objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v7)
  {
    *(_BYTE *)(v8 + 24) = 1;
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a4;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)eventUpdated:(id)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = CFSTR("event");
  v8[0] = a3;
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("NSPersistentCloudKitContainerEventChangedNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  objc_autoreleasePoolPop(v5);
}

- (void)publishActivity:(id)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(a3, "createDictionaryRepresentation");
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("activityDictionary"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentCloudKitContainerActivityChangedNotificationName"), self, v6);

  objc_autoreleasePoolPop(v5);
}

void __52__NSCloudKitMirroringDelegate__persistUpdatedShare___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSManagedObjectContext *v11;
  id v12;
  _QWORD v13[4];
  int8x16_t v14;
  id v15;
  NSManagedObjectContext *v16;

  v12 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  v2 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 3)
    v3 = 3;
  else
    v3 = __ckLoggingOverride;
  v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Persisting share by the system UI: %@ / %@"));
  _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate _persistUpdatedShare:]_block_invoke");
  objc_autoreleasePoolPop(v2);
  if (v12)
  {
    v11 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__NSCloudKitMirroringDelegate__persistUpdatedShare___block_invoke_2;
    v13[3] = &unk_1E1EDE7A8;
    v14 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v15 = v12;
    v16 = v11;
    -[NSManagedObjectContext performBlockAndWait:](v11, "performBlockAndWait:", v13);

  }
}

void __52__NSCloudKitMirroringDelegate__persistUpdatedShare___block_invoke_2(uint64_t a1)
{
  NSManagedObject *v2;
  uint64_t v3;
  NSManagedObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordID"), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), 0, (uint64_t)&v34);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v3
      && (v4 = v2, (v5 = *(_QWORD *)(v3 + 136)) != 0)
      && (v6 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v5, *(_QWORD *)(a1 + 32), &v34)) != 0)
    {
      v7 = v6;
      -[NSManagedObject setEncodedShareData:](v4, "setEncodedShareData:", v6);
      if ((objc_msgSend(*(id *)(a1 + 56), "save:", &v34) & 1) != 0)
      {
LABEL_11:

        return;
      }
      v8 = (void *)MEMORY[0x18D76B4E4]();
      v9 = __ckLoggingOverride != 0;
      v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save changes after share update: %@"));
      _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[NSCloudKitMirroringDelegate _persistUpdatedShare:]_block_invoke_2");
    }
    else
    {
      v8 = (void *)MEMORY[0x18D76B4E4]();
      v26 = __ckLoggingOverride != 0;
      v27 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to encode share data: %@"));
      _NSCoreDataLog(v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[NSCloudKitMirroringDelegate _persistUpdatedShare:]_block_invoke_2");
      v7 = 0;
    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_11;
  }
  if (v34)
  {
    v17 = (void *)MEMORY[0x18D76B4E4]();
    v18 = __ckLoggingOverride != 0;
    v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to fetch zone metadata for %@: %@"));
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[NSCloudKitMirroringDelegate _persistUpdatedShare:]_block_invoke_2");
    objc_autoreleasePoolPop(v17);
  }
}

void __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke(uint64_t a1)
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
  uint64_t v11;
  NSCloudKitMirroringResetZoneRequest *v12;
  NSCloudKitMirroringResetZoneRequest *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSManagedObjectContext *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  _QWORD v33[4];
  int8x16_t v34;
  void *v35;
  NSManagedObjectContext *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[16];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  v3 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 3)
    v4 = 3;
  else
    v4 = __ckLoggingOverride;
  v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Deleting metadata for share deleted by the system UI: %@ / %@"));
  _NSCoreDataLog(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[NSCloudKitMirroringDelegate _deleteShareWithRecordID:]_block_invoke");
  objc_autoreleasePoolPop(v3);
  if (v2)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope") == 3)
    {
      v12 = [NSCloudKitMirroringResetZoneRequest alloc];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke_2;
      v37[3] = &unk_1E1EE10D0;
      objc_copyWeak(&v38, (id *)(a1 + 56));
      v13 = -[NSCloudKitMirroringResetZoneRequest initWithOptions:completionBlock:](v12, "initWithOptions:completionBlock:", 0, v37);
      v40[0] = objc_msgSend(*(id *)(a1 + 48), "zoneID");
      -[NSCloudKitMirroringResetZoneRequest setRecordZoneIDsToReset:]((uint64_t)v13, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1));
      *(_QWORD *)buf = 0;
      if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](*(_QWORD *)(a1 + 40), v13, buf))
      {
        v14 = (void *)MEMORY[0x18D76B4E4]();
        v15 = __ckLoggingOverride;
        v16 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to execute mirroring request for deleted share: %@\n%@"));
        _NSCoreDataLog(v15 != 0, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[NSCloudKitMirroringDelegate _deleteShareWithRecordID:]_block_invoke");
        objc_autoreleasePoolPop(v14);
      }

      objc_destroyWeak(&v38);
    }
    else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope") == 2)
    {
      v23 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke_3;
      v33[3] = &unk_1E1EDE7A8;
      v34 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      v35 = v2;
      v36 = v23;
      -[NSManagedObjectContext performBlockAndWait:](v23, "performBlockAndWait:", v33);

    }
    else
    {
      v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Called about a share delete for the public database? %@");
      _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, *(_QWORD *)(a1 + 40));
      v31 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        v32 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v32;
        _os_log_fault_impl(&dword_18A253000, v31, OS_LOG_TYPE_FAULT, "CoreData: Called about a share delete for the public database? %@", buf, 0xCu);
      }
    }
  }

}

void __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke_2(uint64_t a1)
{

}

void __56__NSCloudKitMirroringDelegate__deleteShareWithRecordID___block_invoke_3(uint64_t a1)
{
  NSManagedObject *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend(*(id *)(a1 + 32), "zoneID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope"), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), 0, (uint64_t)&v12);
  if (v2)
  {
    -[NSManagedObject setEncodedShareData:](v2, "setEncodedShareData:", 0);
    if ((objc_msgSend(*(id *)(a1 + 56), "save:", &v12) & 1) != 0)
      return;
    v3 = (void *)MEMORY[0x18D76B4E4]();
    v4 = __ckLoggingOverride != 0;
    v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save changes after share delete: %@"));
  }
  else
  {
    if (!v12)
      return;
    v3 = (void *)MEMORY[0x18D76B4E4]();
    v4 = __ckLoggingOverride != 0;
    v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to respond to share record delete due to error: %@"));
  }
  _NSCoreDataLog(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[NSCloudKitMirroringDelegate _deleteShareWithRecordID:]_block_invoke_3");
  objc_autoreleasePoolPop(v3);
}

- (void)addActivityVoucher:(id)a3
{
  void *v5;
  objc_class *v6;
  uint64_t v7;
  _QWORD v8[6];

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = objc_msgSend(v5, "stringWithFormat:", CFSTR("CoreData: %@ Apply"), NSStringFromClass(v6));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NSCloudKitMirroringDelegate_addActivityVoucher___block_invoke;
  v8[3] = &unk_1E1EE0D88;
  v8[4] = self;
  v8[5] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.voucher.apply"), v7, (uint64_t)v8);
}

void __50__NSCloudKitMirroringDelegate_addActivityVoucher___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "addVoucher:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "operationConfiguration"), "qualityOfService") >= 25)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "eventType");
    if (v2 == 2)
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(a1 + 32), (uint64_t)CFSTR("VoucherImmediateExport"), 0, *(_QWORD *)(a1 + 40), 0);
    }
    else if (v2 == 1)
    {
      -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(a1 + 32), (uint64_t)CFSTR("VoucherImmediateImport"), 0, *(_QWORD *)(a1 + 40), 0);
    }
  }
}

- (void)expireActivityVoucher:(id)a3
{
  void *v5;
  objc_class *v6;
  uint64_t v7;
  _QWORD v8[6];

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = objc_msgSend(v5, "stringWithFormat:", CFSTR("CoreData: %@ Expire"), NSStringFromClass(v6));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NSCloudKitMirroringDelegate_expireActivityVoucher___block_invoke;
  v8[3] = &unk_1E1EE0D88;
  v8[4] = self;
  v8[5] = a3;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.voucher.expire"), v7, (uint64_t)v8);
}

uint64_t __53__NSCloudKitMirroringDelegate_expireActivityVoucher___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "expireVoucher:", *(_QWORD *)(a1 + 40));
}

+ (id)stringForResetReason:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 7)
    return off_1E1EE11C0[a3 - 1];
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Can't generate string for unknown reset sync reason: %lu");
  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
  v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_fault_impl(&dword_18A253000, v12, OS_LOG_TYPE_FAULT, "CoreData: Can't generate string for unknown reset sync reason: %lu", buf, 0xCu);
  }
  return 0;
}

+ (BOOL)isFirstPartyContainerIdentifier:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("com.apple."));
}

- (void)_disableAutomaticExports
{
  if (self)
  {
    if (self->_currentUserRecordID)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("com.apple.coredata.NSPersistentStoreRemoteChangeNotification.remotenotification"), 0);
    }
  }
}

- (void)_enableAutomaticExports
{
  id WeakRetained;

  if (self)
  {
    if (self->_currentUserRecordID)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_observedCoordinator);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_managedObjectContextSaved_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), WeakRetained);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_remoteStoreDidChange_, CFSTR("NSPersistentStoreRemoteChangeNotification"), WeakRetained);
      -[NSCloudKitMirroringDelegate scheduleExportAndStartAfterDate:]((uint64_t)self, 0);

    }
  }
}

- (void)applicationStateMonitorEnteredBackground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke;
  v3[3] = &unk_1E1EE0F90;
  v3[4] = self;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v3);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id Weak;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 && (v4 = *(_QWORD *)(v3 + 8)) != 0)
    v5 = *(void **)(v4 + 88);
  else
    v5 = 0;
  Weak = objc_loadWeak((id *)(v3 + 120));
  v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke_2;
  v9[3] = &unk_1E1EDD430;
  v8 = *(_QWORD *)(a1 + 32);
  v9[4] = v7;
  v9[5] = v8;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v9);

}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredBackground___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v11)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(a1 + 40), (uint64_t)CFSTR("AppDeactivationExport"), 0, 0, 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v3 = 16;
    else
      v3 = __ckLoggingOverride;
    v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Ignoring application deactivation notification because the store is dead."));
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorEnteredBackground:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
  }

}

- (void)applicationStateMonitorEnteredForeground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke;
  v3[3] = &unk_1E1EE0F90;
  v3[4] = self;
  -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]((uint64_t)self, (uint64_t)CFSTR("com.apple.coredata.cloudkit.schedule"), (uint64_t)CFSTR("CoreData: CloudKit Scheduling"), (uint64_t)v3);
}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id Weak;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 && (v4 = *(_QWORD *)(v3 + 8)) != 0)
    v5 = *(void **)(v4 + 88);
  else
    v5 = 0;
  Weak = objc_loadWeak((id *)(v3 + 120));
  v7 = -[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v5, (uint64_t)Weak);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke_2;
  v9[3] = &unk_1E1EDD430;
  v8 = *(_QWORD *)(a1 + 32);
  v9[4] = v7;
  v9[5] = v8;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v7, (uint64_t)v9);

}

void __72__NSCloudKitMirroringDelegate_applicationStateMonitorEnteredForeground___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v11)
  {
    -[NSCloudKitMirroringDelegate _scheduleAutomatedExportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(a1 + 40), (uint64_t)CFSTR("AppActivationExport"), 0, 0, 0);
    -[NSCloudKitMirroringDelegate _scheduleAutomatedImportWithLabel:activity:voucher:completionHandler:](*(_QWORD *)(a1 + 40), (uint64_t)CFSTR("AppActivationImport"), 0, 0, 0);
  }
  else
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v3 = 16;
    else
      v3 = __ckLoggingOverride;
    v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Ignoring application activation notification because the store is dead."));
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorEnteredForeground:]_block_invoke_2");
    objc_autoreleasePoolPop(v2);
  }

}

- (void)applicationStateMonitorExpiredBackgroundActivityTimeout:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSCloudKitMirroringRequestManager *requestManager;
  NSCloudKitMirroringRequest *activeRequest;

  v4 = (void *)MEMORY[0x18D76B4E4](self, a2, a3);
  if ((unint64_t)__ckLoggingOverride >= 3)
    v5 = 3;
  else
    v5 = __ckLoggingOverride;
  v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Deferring active request due to background timeout: %@"));
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSCloudKitMirroringDelegate applicationStateMonitorExpiredBackgroundActivityTimeout:]");
  objc_autoreleasePoolPop(v4);
  requestManager = self->_requestManager;
  if (requestManager)
  {
    activeRequest = requestManager->_activeRequest;
    if (activeRequest)
      activeRequest->_deferredByBackgroundTimeout = 1;
  }
}

- (PFApplicationStateMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (BOOL)registeredForSubscription
{
  return self->_registeredForSubscription;
}

- (BOOL)registeredExportActivityHandler
{
  return self->_registeredExportActivityHandler;
}

- (BOOL)registeredImportActivityHandler
{
  return self->_registeredImportActivityHandler;
}

- (BOOL)registeredSetupActivityHandler
{
  return self->_registeredSetupActivityHandler;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observedCoordinator);
  objc_destroyWeak((id *)&self->_observedStore);
}

+ (void)printMetadataForStoreAtURL:(id)a3 withConfiguration:(id)a4 operateOnACopy:(BOOL)a5
{
  _BOOL4 v5;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  NSSQLBlockRequestContext *v11;
  FILE **v12;
  void *exception;
  FILE *v14;
  const char *v15;
  int v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;
  FILE *v20;
  void *v21;
  FILE *v22;
  const char *v23;
  NSCloudKitMirroringDelegateOptions *v24;
  NSCloudKitMirroringDelegateOptions *v25;
  NSCloudKitMirroringDelegate *v26;
  NSPersistentStoreDescription *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  dispatch_time_t v31;
  _BOOL4 v32;
  NSManagedObjectContext *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSPersistentStoreCoordinator *v42;
  _QWORD v43[5];
  _QWORD v44[7];
  _QWORD v45[5];
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  const __CFString *v51;
  uint64_t v52;
  _BYTE buf[24];
  void *v54;
  uint64_t *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  _QWORD v59[4];

  v5 = a5;
  v59[1] = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v51 = CFSTR("NSReadOnlyPersistentStoreOption");
  v8 = (const __CFString *)MEMORY[0x1E0C9AAB0];
  v52 = MEMORY[0x1E0C9AAB0];
  v9 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1), &v46);
  if (!v9)
  {
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load model from store: %@\n%@"), a3, v46), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
    return;
  }
  v42 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v9);
  objc_opt_self();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v58 = v8;
  v59[0] = 0;
  v57 = CFSTR("NSReadOnlyPersistentStoreOption");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v10 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v42, "addPersistentStoreWithType:configuration:URL:options:error:");
  if (!v10)
  {
    v14 = (FILE *)*MEMORY[0x1E0C80C10];
    v15 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open store: %@\n%@"), a3, v59[0]), "UTF8String");
LABEL_12:
    fputs(v15, v14);
    goto LABEL_13;
  }
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __122__NSCloudKitMirroringDelegate___CLI__checkForCloudKitTablesInStoreAtURL_withPersistentStoreCoordinator_withConfiguration___block_invoke;
  v54 = &unk_1E1EDF6D0;
  v55 = &v47;
  v11 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]([NSSQLBlockRequestContext alloc], "initWithBlock:context:sqlCore:", buf, 0, v10);
  -[NSSQLCore dispatchRequest:withRetries:](v10, v11, 0);
  v12 = (FILE **)MEMORY[0x1E0C80C10];
  if (v11)
  {
    exception = v11->super._exception;
    if (exception || (exception = v11->super._error) != 0)
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attepmting to check for CloudKit tables failed: %@\n%@"), a3, exception), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
  }

  if (!-[NSPersistentStoreCoordinator removePersistentStore:error:](v42, "removePersistentStore:error:", v10, v59))
  {
    v14 = *v12;
    v15 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to tear down read-only store: %@\n%@"), a3, v59[0]), "UTF8String");
    goto LABEL_12;
  }
LABEL_13:
  v16 = *((unsigned __int8 *)v48 + 24);
  _Block_object_dispose(&v47, 8);
  if (v16)
  {
    v17 = a3;
    if (!v5)
      goto LABEL_22;
    objc_opt_self();
    v18 = (const __CFString *)MEMORY[0x1E0C9AAB0];
    v17 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("cdutil")), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")), "stringByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent")));
    v47 = 0;
    if (+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:wipeIfExists:error:](NSCloudKitMirroringDelegate, "checkAndCreateDirectoryAtURL:wipeIfExists:error:", objc_msgSend(v17, "URLByDeletingLastPathComponent"), 1, &v47))
    {
      v58 = CFSTR("NSReadOnlyPersistentStoreOption");
      v59[0] = v18;
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
      v56 = CFSTR("NSReadOnlyPersistentStoreOption");
      v57 = v18;
      if (-[NSPersistentStoreCoordinator replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:](v42, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v17, v19, a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1), CFSTR("SQLite"), &v47))
      {
        goto LABEL_22;
      }
      v20 = (FILE *)*MEMORY[0x1E0C80C10];
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to move store to a temporary location: %@\n%@"), v17, v47);
    }
    else
    {
      v20 = (FILE *)*MEMORY[0x1E0C80C10];
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create a temporary directory for working on the store.\n%@"), v47);
    }
    fputs((const char *)objc_msgSend(v21, "UTF8String"), v20);
    if (!v47)
    {
      v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      v41 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 303;
        _os_log_fault_impl(&dword_18A253000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
LABEL_33:
      v22 = (FILE *)*MEMORY[0x1E0C80C10];
      v23 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create a copy of the store at url: %@\n%@"), a3, v46), "UTF8String");
      goto LABEL_34;
    }
    v17 = 0;
    v46 = v47;
LABEL_22:
    if (v17)
    {
      v24 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]([NSCloudKitMirroringDelegateOptions alloc], "initWithContainerIdentifier:", CFSTR("cdutil-stub-container"));
      v25 = v24;
      if (v24)
        v24->_skipCloudKitSetup = 1;
      v26 = -[NSCloudKitMirroringDelegate initWithOptions:]([NSCloudKitMirroringDelegate alloc], "initWithOptions:", v24);

      v27 = -[NSPersistentStoreDescription initWithURL:]([NSPersistentStoreDescription alloc], "initWithURL:", v17);
      -[NSPersistentStoreDescription setType:](v27, "setType:", CFSTR("SQLite"));
      -[NSPersistentStoreDescription setConfiguration:](v27, "setConfiguration:", a4);
      -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v27, "setShouldMigrateStoreAutomatically:", 1);
      -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v27, "setShouldInferMappingModelAutomatically:", 1);
      -[NSPersistentStoreDescription setMirroringDelegate:](v27, "setMirroringDelegate:", v26);
      -[NSPersistentStoreDescription setOption:forKey:](v27, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"));
      -[NSPersistentStoreDescription setOption:forKey:](v27, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey"));
      v28 = dispatch_semaphore_create(0);
      v29 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke;
      v45[3] = &unk_1E1EDF4E8;
      v45[4] = v28;
      v30 = objc_msgSend(v29, "addObserverForName:object:queue:usingBlock:", CFSTR("NSPersistentCloudKitContainerEventChangedNotification"), v26, 0, v45);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v54) = 0;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_12;
      v44[3] = &unk_1E1EE1340;
      v44[5] = v28;
      v44[6] = buf;
      v44[4] = v17;
      -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v42, "addPersistentStoreWithDescription:completionHandler:", v27, v44);
      v31 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v28, v31))
      {
        fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out waiting for the mirroring delegate to finish setting up. This is a bug. Please re-run and attach a sample of cdutil if you can.")), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
        v32 = 0;
      }
      else
      {
        v32 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v30);
      dispatch_release(v28);
      if (v32)
      {
        v33 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](v33, "setPersistentStoreCoordinator:", v42);
        -[NSManagedObjectContext _setAllowAncillaryEntities:](v33, "_setAllowAncillaryEntities:", 1);
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_2;
        v43[3] = &unk_1E1EDD520;
        v43[4] = v33;
        -[NSManagedObjectContext performBlockAndWait:](v33, "performBlockAndWait:", v43);

      }
      _Block_object_dispose(buf, 8);
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  v22 = (FILE *)*MEMORY[0x1E0C80C20];
  v23 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This store has never been used with CloudKit (use cdutil dumpmetadata [storePath] to show store metadata): %@"), a3), "UTF8String");
LABEL_34:
  fputs(v23, v22);
LABEL_35:

}

void __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("event"));
  if (v4)
  {
    v5 = v4;
    if (!objc_msgSend(v4, "type") && objc_msgSend(v5, "endDate"))
    {
      if ((objc_msgSend(v5, "succeeded") & 1) != 0)
      {
        if (!objc_msgSend(v5, "error"))
          goto LABEL_11;
        v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Error was non-nil, but expected nil");
        _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v30);
        v13 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          goto LABEL_11;
        *(_WORD *)buf = 0;
        v14 = "CoreData: Error was non-nil, but expected nil";
      }
      else
      {
        v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Success was NO but expected YES");
        _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, v30);
        v13 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
LABEL_11:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
          return;
        }
        *(_WORD *)buf = 0;
        v14 = "CoreData: Success was NO but expected YES";
      }
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
      goto LABEL_11;
    }
  }
  else
  {
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Missing event %@");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = a2;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Missing event %@", buf, 0xCu);
    }
  }
}

intptr_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_12(intptr_t result, uint64_t a2, uint64_t a3)
{
  intptr_t v3;

  v3 = result;
  if (a3)
  {
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load persistent store at url: %@\n%@"), *(_QWORD *)(result + 32), a3), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = 0;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 40));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  FILE *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  FILE *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMetadataEntry entityPath](NSCKMetadataEntry, "entityPath")), &v48);
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v1, "count"))
    {
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit Metadata:\n")), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = (id)objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_31);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v45 != v5)
              objc_enumerationMutation(obj);
            v7 = *(__CFString **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v8 = -[NSCKMetadataEntry describeValue](v7);
            if (-[__CFString containsString:](v8, "containsString:", CFSTR("\n")))
              v8 = (__CFString *)objc_msgSend(CFSTR("\n\t\t"), "stringByAppendingString:", -[__CFString stringByReplacingOccurrencesOfString:withString:](v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t")));
            fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@: %@\n"), -[__CFString key](v7, "key"), v8), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
          }
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v4);
      }
    }
  }
  else
  {
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to fetch metadata entries:\n%@"), v48), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
  }
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKDatabaseMetadata entityPath](NSCKDatabaseMetadata, "entityPath")), &v48);
  if (!v9)
    return fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to fetch database metadata entries:\n%@"), v48), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
  v28 = v9;
  result = objc_msgSend(v9, "count");
  if (result)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    v30 = result;
    if (result)
    {
      v29 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v28);
          v31 = v11;
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
          v13 = (FILE *)*MEMORY[0x1E0C80C20];
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = objc_msgSend(v12, "databaseName");
          v16 = objc_msgSend(v12, "databaseScope");
          if (objc_msgSend(v12, "hasSubscription"))
            v17 = CFSTR("YES");
          else
            v17 = CFSTR("NO");
          fputs((const char *)objc_msgSend((id)objc_msgSend(v14, "stringWithFormat:", CFSTR("Database: %@ (%ld): hasSubscription: %@, currentChangeToken: %@\n"), v15, v16, v17, objc_msgSend(v12, "currentChangeToken")), "UTF8String"), v13);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v33 = (id)objc_msgSend(v12, "recordZones");
          v18 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
          if (v18)
          {
            v19 = v18;
            obja = *(id *)v37;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(id *)v37 != obja)
                  objc_enumerationMutation(v33);
                v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                v22 = (FILE *)*MEMORY[0x1E0C80C20];
                v23 = (void *)MEMORY[0x1E0CB3940];
                v24 = objc_msgSend(v21, "ckRecordZoneName");
                v25 = objc_msgSend(v21, "ckOwnerName");
                v26 = CFSTR("NO");
                if (objc_msgSend(v21, "hasRecordZone"))
                  v27 = CFSTR("YES");
                else
                  v27 = CFSTR("NO");
                if (objc_msgSend(v21, "hasSubscription"))
                  v26 = CFSTR("YES");
                fputs((const char *)objc_msgSend((id)objc_msgSend(v23, "stringWithFormat:", CFSTR("\tZone: %@:%@: hasRecordZone: %@, hasSubscription: %@, currentChangeToken: %@\n"), v24, v25, v27, v26, objc_msgSend(v21, "currentChangeToken")), "UTF8String"), v22);
              }
              v19 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
            }
            while (v19);
          }
          v11 = v31 + 1;
        }
        while (v31 + 1 != v30);
        result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        v30 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __98__NSCloudKitMirroringDelegate___CLI__printMetadataForStoreAtURL_withConfiguration_operateOnACopy___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "key"), "localizedCaseInsensitiveCompare:", objc_msgSend(a3, "key"));
}

+ (void)printRepresentativeSchemaForModelAtURL:(id)a3 orStoreAtURL:(id)a4 withConfiguration:(id)a5
{
  id v6;
  NSManagedObjectModel *v8;
  NSManagedObjectModel *v9;
  NSPersistentStoreCoordinator *v10;
  NSCloudKitMirroringDelegateOptions *v11;
  NSCloudKitMirroringDelegateOptions *v12;
  NSCloudKitMirroringDelegate *v13;
  NSPersistentStoreDescription *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  dispatch_time_t v19;
  uint64_t v20;
  id v21;
  PFCloudKitSchemaGenerator *v22;
  void *v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[5];
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[3];

  v6 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v30 = 0;
  if (a3)
  {
    v8 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", a3);
  }
  else
  {
    if (!a4)
    {
      v20 = 0;
      goto LABEL_20;
    }
    v31 = CFSTR("NSReadOnlyPersistentStoreOption");
    v32[0] = MEMORY[0x1E0C9AAB0];
    v8 = (NSManagedObjectModel *)+[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1), &v30);
  }
  v9 = v8;
  if (!v8)
  {
    v20 = v30;
LABEL_20:
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load a managed object model. Arguments:\nstoreURL: %@\nmodelURL: %@\nEncountered error: %@"), v6, a3, v20), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
    v9 = 0;
    goto LABEL_25;
  }
  if (!v6)
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("cdutil")), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")));
    if (!+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:wipeIfExists:error:](NSCloudKitMirroringDelegate, "checkAndCreateDirectoryAtURL:wipeIfExists:error:", objc_msgSend(v6, "URLByDeletingLastPathComponent"), 0, &v30))
    {
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create temporary directory: %@"), v30), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
      goto LABEL_25;
    }
    if (!v6)
      goto LABEL_25;
  }
  v10 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v9);
  v11 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]([NSCloudKitMirroringDelegateOptions alloc], "initWithContainerIdentifier:", CFSTR("cdutil-stub-container"));
  v12 = v11;
  if (v11)
    v11->_skipCloudKitSetup = 1;
  v13 = -[NSCloudKitMirroringDelegate initWithOptions:]([NSCloudKitMirroringDelegate alloc], "initWithOptions:", v11);
  v14 = -[NSPersistentStoreDescription initWithURL:]([NSPersistentStoreDescription alloc], "initWithURL:", v6);
  -[NSPersistentStoreDescription setType:](v14, "setType:", CFSTR("SQLite"));
  -[NSPersistentStoreDescription setConfiguration:](v14, "setConfiguration:", a5);
  -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v14, "setShouldMigrateStoreAutomatically:", 1);
  -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v14, "setShouldInferMappingModelAutomatically:", 1);
  -[NSPersistentStoreDescription setMirroringDelegate:](v14, "setMirroringDelegate:", v13);
  -[NSPersistentStoreDescription setOption:forKey:](v14, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"));
  v15 = dispatch_semaphore_create(0);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke;
  v29[3] = &unk_1E1EDF4E8;
  v29[4] = v15;
  v18 = objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", CFSTR("PFCloudKitDidSetupNotificationName"), v13, 0, v29);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_62;
  v24[3] = &unk_1E1EE1388;
  v24[4] = v6;
  v24[5] = &v25;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v10, "addPersistentStoreWithDescription:completionHandler:", v14, v24);
  v19 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v15, v19))
  {
    *((_BYTE *)v26 + 24) = 0;
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timed out waiting for the mirroring delegate to finish setting up. This is a bug. Please re-run and attach a sample of cdutil if you can.")), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
  }
  else
  {
    *((_BYTE *)v26 + 24) = 1;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v18);
  if (*((_BYTE *)v26 + 24))
  {
    v21 = -[PFCloudKitStoreMonitor initForStore:]([PFCloudKitStoreMonitor alloc], "initForStore:", -[NSArray lastObject](-[NSPersistentStoreCoordinator persistentStores](v10, "persistentStores"), "lastObject"));
    v22 = -[PFCloudKitSchemaGenerator initWithMirroringOptions:forStoreInMonitor:]([PFCloudKitSchemaGenerator alloc], "initWithMirroringOptions:forStoreInMonitor:", v12, v21);
    v23 = (void *)-[PFCloudKitSchemaGenerator newRepresentativeRecords:]((uint64_t)v22, &v30);
    if (v23)
    {
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generated records:\n")), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", &__block_literal_global_68);
    }
    else
    {
      *((_BYTE *)v26 + 24) = 0;
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate records: %@"), v30), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
    }

  }
  _Block_object_dispose(&v25, 8);
LABEL_25:

}

intptr_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint8_t buf[2];

  v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKeyedSubscript:", CFSTR("result"));
  if ((objc_msgSend(v3, "success") & 1) != 0)
  {
    if (objc_msgSend(v3, "error"))
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Error was non-nil, but expected nil");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v22);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        v12 = "CoreData: Error was non-nil, but expected nil";
        v13 = (uint8_t *)&v22;
LABEL_8:
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
      }
    }
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Success was NO but expected YES");
    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v22);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "CoreData: Success was NO but expected YES";
      v13 = buf;
      goto LABEL_8;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_62(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  v3 = result;
  if (a3)
  {
    result = fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load persistent store at url: %@\n%@"), *(_QWORD *)(result + 32), a3), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = v4;
  return result;
}

uint64_t __108__NSCloudKitMirroringDelegate___CLI__printRepresentativeSchemaForModelAtURL_orStoreAtURL_withConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), objc_msgSend(a2, "description")), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
}

+ (BOOL)checkAndCreateDirectoryAtURL:(id)a3 wipeIfExists:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v8;
  BOOL v9;
  char v11;
  void *v12;

  v6 = a4;
  v12 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = 0;
  if (!objc_msgSend(v8, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v11))
    goto LABEL_6;
  if (v11 && !v6)
    return 1;
  if (objc_msgSend(v8, "removeItemAtURL:error:", a3, &v12))
  {
LABEL_6:
    v9 = 1;
    if ((objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a3, 1, 0, &v12) & 1) != 0)
      return v9;
  }
  v9 = 0;
  if (a5 && v12)
  {
    v9 = 0;
    *a5 = v12;
  }
  return v9;
}

uint64_t __122__NSCloudKitMirroringDelegate___CLI__checkForCloudKitTablesInStoreAtURL_withPersistentStoreCoordinator_withConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    result = *(_QWORD *)(a2 + 24);
    if (result)
      result = -[NSSQLiteConnection _hasTableWithName:isTemp:](result, (uint64_t)CFSTR("ANSCKMIRROREDRELATIONSHIP"), 0);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5
{
  return +[NSCloudKitMirroringDelegate checkIfContentsOfStore:matchContentsOfStore:onlyCompareSharedZones:error:](NSCloudKitMirroringDelegate, "checkIfContentsOfStore:matchContentsOfStore:onlyCompareSharedZones:error:", a3, a4, 0, a5);
}

+ (BOOL)checkIfContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 onlyCompareSharedZones:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  PFCloudKitStoreComparer *v8;

  v7 = a5;
  v8 = -[PFCloudKitStoreComparer initWithStore:otherStore:]([PFCloudKitStoreComparer alloc], "initWithStore:otherStore:", a3, a4);
  -[PFCloudKitStoreComparer setOnlyCompareSharedZones:](v8, "setOnlyCompareSharedZones:", v7);
  LOBYTE(a6) = -[PFCloudKitStoreComparer ensureContentsMatch:](v8, "ensureContentsMatch:", a6);

  return (char)a6;
}

+ (BOOL)traceObjectMatchingValue:(id)a3 atKeyPath:(id)a4 inStores:(id)a5 startingAt:(id)a6 endingAt:(id)a7 error:(id *)a8
{
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSPersistentStoreCoordinator *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSManagedObjectContext *v21;
  int v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  char v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v42;
  uint64_t v43;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[15];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD v74[3];
  const __CFString *v75;
  uint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v58 = &v57;
  v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__46;
  v61 = __Block_byref_object_dispose__46;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 1;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v47 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v50;
    v42 = *MEMORY[0x1E0CB28A8];
    v43 = *MEMORY[0x1E0CB2D68];
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(a5);
        v9 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x18D76B4E4]();
        v75 = CFSTR("NSReadOnlyPersistentStoreOption");
        v76 = MEMORY[0x1E0C9AAB0];
        v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v12 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v9, v11, v58 + 5);
        if (!v12)
        {
          *((_BYTE *)v54 + 24) = 0;
          v22 = 2;
          goto LABEL_19;
        }
        v13 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v12);
        v73[0] = CFSTR("NSReadOnlyPersistentStoreOption");
        v73[1] = CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey");
        v74[0] = MEMORY[0x1E0C9AAB0];
        v74[1] = MEMORY[0x1E0C9AAB0];
        v73[2] = CFSTR("NSPersistentHistoryTrackingKey");
        v74[2] = MEMORY[0x1E0C9AAB0];
        v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
        v15 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v13, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v9, v14, v58 + 5);
        if (!v15)
          goto LABEL_17;
        v16 = (void *)objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("."));
        if (objc_msgSend(v16, "count") != 2)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = v43;
          v68 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse provided keypath. Expected two components when split by '.': %@"), a4);
          v24 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v42, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
LABEL_16:
          v58[5] = v24;
LABEL_17:
          *((_BYTE *)v54 + 24) = 0;
          goto LABEL_18;
        }
        v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v18 = objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v19 = -[NSDictionary objectForKeyedSubscript:](-[NSManagedObjectModel entitiesByName](-[NSPersistentStoreCoordinator managedObjectModel](v13, "managedObjectModel"), "entitiesByName"), "objectForKeyedSubscript:", v17);
        if (!v19)
        {
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = v43;
          v70 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse provided keypath. An entity named '%@' could not be found in the model for the store: %@"), v17, v9);
          v24 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v42, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
          goto LABEL_16;
        }
        v20 = objc_msgSend((id)objc_msgSend(v19, "attributesByName"), "objectForKeyedSubscript:", v18);
        if (!v20)
        {
          v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v71 = v43;
          v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to parse provided keypath. An attribute named '%@' could not be found on the entity '%@' in the store: %@"), v18, v17, v9);
          v24 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v42, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
          goto LABEL_16;
        }
        v21 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](v21, "setPersistentStoreCoordinator:", v13);
        -[NSManagedObjectContext _setAllowAncillaryEntities:](v21, "_setAllowAncillaryEntities:", 1);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __108__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingValue_atKeyPath_inStores_startingAt_endingAt_error___block_invoke;
        v48[3] = &unk_1E1EE13F0;
        v48[4] = v17;
        v48[5] = v20;
        v48[6] = a3;
        v48[7] = v18;
        v48[8] = v9;
        v48[9] = v21;
        v48[14] = &v53;
        v48[10] = a6;
        v48[11] = a7;
        v48[12] = v15;
        v48[13] = &v57;
        -[NSManagedObjectContext performBlockAndWait:](v21, "performBlockAndWait:", v48);

LABEL_18:
        v22 = 2 * (*((_BYTE *)v54 + 24) == 0);
LABEL_19:
        objc_autoreleasePoolPop(v10);
        if (v22)
          goto LABEL_22;
      }
      v47 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
    }
    while (v47);
  }
LABEL_22:
  if (!*((_BYTE *)v54 + 24))
  {
    v29 = (id)v58[5];
    if (v29)
    {
      if (a8)
        *a8 = v29;
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      v37 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        v65 = 1024;
        v66 = 588;
        _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v58[5] = 0;
  v27 = *((_BYTE *)v54 + 24);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v27;
}

void __108__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingValue_atKeyPath_inStores_startingAt_endingAt_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  FILE **v15;
  uint64_t v16;
  void *v17;
  NSFetchRequest *v18;
  NSPersistentHistoryChangeRequest *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSPersistentHistoryChangeRequest *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  FILE *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  void *context;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE buf[12];
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(*(id *)(a1 + 40), "attributeType");
  if (v3 == 700)
  {
    v4 = *(id *)(a1 + 48);
    goto LABEL_5;
  }
  if (v3 == 1100)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 48));
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Sorry, I don't know how to translate this value in to a predicate yet: %@ / %@");
  _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, *(_QWORD *)(a1 + 48));
  v13 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    v65 = *(_QWORD *)(a1 + 40);
    v64 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v64;
    v107 = 2112;
    v108 = v65;
    _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Sorry, I don't know how to translate this value in to a predicate yet: %@ / %@", buf, 0x16u);
  }
  v5 = 0;
LABEL_9:
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v78 = v5;
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), *(_QWORD *)(a1 + 56), v5));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0);
  v15 = (FILE **)MEMORY[0x1E0C80C20];
  fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracing %@.%@ == %@ in store: %@\nWith fetch: %@\n"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v2), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
  *(_QWORD *)buf = 0;
  v16 = objc_msgSend(*(id *)(a1 + 72), "executeFetchRequest:error:", v2, buf);
  v77 = v14;
  if (v16)
  {
    v17 = (void *)v16;
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found rows: %@\n"), v16), "UTF8String"), *v15);
    objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v17, "valueForKey:", CFSTR("objectID")));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = *(id *)buf;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
  }
  v79 = a1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    v18 = +[NSPersistentHistoryChange fetchRequest](NSPersistentHistoryChange, "fetchRequest");
    -[NSFetchRequest setPredicate:](v18, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("changeType == %ld"), 2));
    v19 = +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:](NSPersistentHistoryChangeRequest, "fetchHistoryWithFetchRequest:", v18);
    -[NSPersistentHistoryChangeRequest setResultType:](v19, "setResultType:", 5);
    v20 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "executeRequest:error:", v19, buf), "result");
    if (v20)
    {
      v21 = v20;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v98 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
            v27 = (void *)MEMORY[0x18D76B4E4]();
            v93 = 0u;
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v28 = (void *)objc_msgSend(v26, "changes");
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v94;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v94 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
                  v34 = objc_msgSend((id)objc_msgSend(v33, "tombstone"), "objectForKeyedSubscript:", *(_QWORD *)(v79 + 56));
                  if (v34 && objc_msgSend(v78, "isEqual:", v34))
                    objc_msgSend(v77, "addObject:", objc_msgSend(v33, "changedObjectID"));
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
              }
              while (v30);
            }
            objc_autoreleasePoolPop(v27);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
        }
        while (v23);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = *(id *)buf;
    }
  }
  v35 = v79;
  v36 = 0x1E0CB3000uLL;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v79 + 112) + 8) + 24))
  {
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found objectIDs: %@\n"), v77), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
    if (objc_msgSend(v77, "count"))
    {
      v37 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", 0);
      -[NSPersistentHistoryChangeRequest setResultType:](v37, "setResultType:", 5);
      v38 = objc_msgSend((id)objc_msgSend(*(id *)(v79 + 72), "executeRequest:error:", v37, buf), "result");
      if (v38)
      {
        v39 = (void *)v38;
        v71 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v71, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        obj = v39;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
        v41 = v77;
        v68 = v40;
        if (v40)
        {
          v67 = *(_QWORD *)v90;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v90 != v67)
                objc_enumerationMutation(obj);
              v70 = v42;
              v73 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v42);
              context = (void *)MEMORY[0x18D76B4E4]();
              v43 = *(void **)(v35 + 80);
              if (!v43 || objc_msgSend(v43, "compare:", objc_msgSend(v73, "timestamp")) != 1)
              {
                v44 = *(void **)(v79 + 88);
                if (!v44 || objc_msgSend(v44, "compare:", objc_msgSend(v73, "timestamp")) != -1)
                {
                  v87 = 0u;
                  v88 = 0u;
                  v85 = 0u;
                  v86 = 0u;
                  v75 = (id)objc_msgSend(v73, "changes");
                  v45 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
                  if (v45)
                  {
                    v46 = v45;
                    v47 = *(_QWORD *)v86;
                    v72 = *(_QWORD *)v86;
                    do
                    {
                      v48 = 0;
                      v74 = v46;
                      do
                      {
                        if (*(_QWORD *)v86 != v47)
                          objc_enumerationMutation(v75);
                        v49 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v48);
                        v50 = (void *)MEMORY[0x18D76B4E4]();
                        if (objc_msgSend(v41, "containsObject:", objc_msgSend(v49, "changedObjectID")))
                        {
                          fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transaction (%lld): %@:%@:%@ at %@\n"), objc_msgSend(v73, "transactionNumber"), objc_msgSend(v73, "processID"), objc_msgSend(v73, "bundleID"), objc_msgSend(v73, "author"), objc_msgSend(v71, "stringFromDate:", objc_msgSend(v73, "timestamp"))), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
                          v46 = v74;
                          v47 = v72;
                          v41 = v77;
                          fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tChange (%llu): %@: %@ - %@\n"), objc_msgSend(v49, "changeID"), objc_msgSend(v49, "changedObjectID"), +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", objc_msgSend(v49, "changeType")), objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "updatedProperties"), "valueForKey:", CFSTR("name")), "allObjects"), "componentsJoinedByString:",
                                                    CFSTR(","))),
                                            "UTF8String"),
                            (FILE *)*MEMORY[0x1E0C80C20]);
                        }
                        objc_autoreleasePoolPop(v50);
                        ++v48;
                      }
                      while (v46 != v48);
                      v46 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
                    }
                    while (v46);
                  }
                }
              }
              objc_autoreleasePoolPop(context);
              v42 = v70 + 1;
              v35 = v79;
            }
            while (v70 + 1 != v68);
            v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
          }
          while (v68);
        }

        v36 = 0x1E0CB3000;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v79 + 112) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v79 + 104) + 8) + 40) = *(id *)buf;
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v35 + 112) + 8) + 24))
      {
        v51 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(v77, "allObjects"), *(_QWORD *)(v35 + 96), *(void **)(v35 + 72), buf);
        if (v51)
        {
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v76 = v51;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
          if (v52)
          {
            v53 = v52;
            v80 = *(_QWORD *)v82;
            do
            {
              for (k = 0; k != v53; ++k)
              {
                if (*(_QWORD *)v82 != v80)
                  objc_enumerationMutation(v76);
                v55 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
                v56 = (void *)MEMORY[0x18D76B4E4]();
                v57 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v55);
                fputs((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v36 + 2368), "stringWithFormat:", CFSTR("Found record metadata for objectID: %@\n%@\n"), v57, v55), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
                v58 = (id)objc_msgSend(v55, "encodedRecord");
                if (v58)
                {
                  v59 = +[NSCKRecordMetadata recordFromEncodedData:error:](NSCKRecordMetadata, "recordFromEncodedData:error:", v58, buf);
                  v60 = v59;
                  v61 = *(void **)(v36 + 2368);
                  if (v59)
                  {
                    v62 = (FILE *)*MEMORY[0x1E0C80C20];
                    v63 = (void *)objc_msgSend(v61, "stringWithFormat:", CFSTR("Encoded record:\n%@\n"), objc_msgSend(v59, "debugDescription"));
                  }
                  else
                  {
                    v62 = (FILE *)*MEMORY[0x1E0C80C10];
                    v63 = (void *)objc_msgSend(v61, "stringWithFormat:", CFSTR("Failed to decode record for metadata: %@"), *(_QWORD *)buf);
                  }
                  fputs((const char *)objc_msgSend(v63, "UTF8String"), v62);

                  v36 = 0x1E0CB3000;
                }

                objc_autoreleasePoolPop(v56);
              }
              v53 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
            }
            while (v53);
          }
        }
        else
        {
          fputs((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v36 + 2368), "stringWithFormat:", CFSTR("Failed to fetch record metadata for objectIDs: %@\n%@\n"), v77, *(_QWORD *)buf), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v35 + 112) + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v35 + 104) + 8) + 40) = *(id *)buf;
        }
      }
    }
  }

}

+ (BOOL)traceObjectMatchingRecordName:(id)a3 inStores:(id)a4 startingAt:(id)a5 endingAt:(id)a6 error:(id *)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSPersistentStoreCoordinator *v15;
  uint64_t v16;
  NSManagedObjectContext *v17;
  int v18;
  char v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v35[11];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  _QWORD v54[3];
  _QWORD v55[3];
  const __CFString *v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__46;
  v48 = __Block_byref_object_dispose__46;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    v9 = MEMORY[0x1E0C9AAB0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(a4);
      v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x18D76B4E4]();
      v56 = CFSTR("NSReadOnlyPersistentStoreOption");
      v57 = v9;
      v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v14 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v11, v13, v45 + 5);
      if (v14)
      {
        v15 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v14);
        v54[0] = CFSTR("NSReadOnlyPersistentStoreOption");
        v54[1] = CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey");
        v55[0] = v9;
        v55[1] = v9;
        v54[2] = CFSTR("NSPersistentHistoryTrackingKey");
        v55[2] = v9;
        v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
        if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v15, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v11, v16, v45 + 5))
        {
          v17 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v17, "setPersistentStoreCoordinator:", v15);
          -[NSManagedObjectContext _setAllowAncillaryEntities:](v17, "_setAllowAncillaryEntities:", 1);
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __103__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingRecordName_inStores_startingAt_endingAt_error___block_invoke;
          v35[3] = &unk_1E1EE1418;
          v35[4] = a3;
          v35[5] = v11;
          v35[10] = &v40;
          v35[6] = v17;
          v35[7] = a5;
          v35[9] = &v44;
          v35[8] = a6;
          -[NSManagedObjectContext performBlockAndWait:](v17, "performBlockAndWait:", v35);

        }
        else
        {
          *((_BYTE *)v41 + 24) = 0;
        }

        v18 = 2 * (*((_BYTE *)v41 + 24) == 0);
      }
      else
      {
        *((_BYTE *)v41 + 24) = 0;
        v18 = 2;
      }
      objc_autoreleasePoolPop(v12);
      if (v18)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*((_BYTE *)v41 + 24))
  {
    v21 = (id)v45[5];
    if (v21)
    {
      if (a7)
        *a7 = v21;
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        v52 = 1024;
        v53 = 705;
        _os_log_fault_impl(&dword_18A253000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v45[5] = 0;
  v19 = *((_BYTE *)v41 + 24);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v19;
}

void __103__NSCloudKitMirroringDelegate___CLI__traceObjectMatchingRecordName_inStores_startingAt_endingAt_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  FILE **v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  FILE *v18;
  void *v19;
  void *v20;
  NSPersistentHistoryChangeRequest *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  FILE *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *context;
  id obj;
  char *obja;
  PFCloudKitArchivingUtilities *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath](NSCKRecordMetadata, "entityPath"));
  v61 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordName == %@"), *(_QWORD *)(a1 + 32)));
  v3 = (FILE **)MEMORY[0x1E0C80C20];
  v4 = 0x1E0CB3000uLL;
  fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracing record %@ in store: %@\nWith fetch: %@\n"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
  v78 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v2, &v78);
  if (v5)
  {
    v6 = (void *)v5;
    v46 = a1;
    fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found record metadata: %@\n"), v5), "UTF8String"), *v3);
    obj = v6;
    v51 = objc_alloc_init(PFCloudKitArchivingUtilities);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v55)
    {
      v53 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v75 != v53)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x18D76B4E4]();
          v10 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v8);
          fputs((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 2368), "stringWithFormat:", CFSTR("Found metadata for row '%@': %@\n"), v10, v8), "UTF8String"), *v3);
          if (objc_msgSend(v8, "encodedRecord"))
          {
            v59 = v9;
            v11 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]((uint64_t)v51, (void *)objc_msgSend(v8, "encodedRecord"), &v78);
            v57 = v10;
            fputs((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 2368), "stringWithFormat:", CFSTR("Record for row '%@': %@\n"), v10, v11), "UTF8String"), *v3);
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "encryptedValues"), "allKeys");
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v71 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
                  v18 = *v3;
                  v19 = (void *)MEMORY[0x1E0CB3940];
                  v41 = objc_msgSend((id)objc_msgSend(v11, "encryptedValues"), "objectForKeyedSubscript:", v17);
                  v20 = v19;
                  v3 = (FILE **)MEMORY[0x1E0C80C20];
                  fputs((const char *)objc_msgSend((id)objc_msgSend(v20, "stringWithFormat:", CFSTR("\t%@: %@\n"), v17, v41), "UTF8String"), v18);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
              }
              while (v14);
            }

            v4 = 0x1E0CB3000;
            v10 = v57;
            v9 = v59;
          }
          objc_msgSend(v61, "addObject:", v10);

          objc_autoreleasePoolPop(v9);
        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      }
      while (v55);
    }

    a1 = v46;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v78;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    fputs((const char *)objc_msgSend((id)objc_msgSend(*(id *)(v4 + 2368), "stringWithFormat:", CFSTR("Found objectIDs: %@\n"), v61), "UTF8String"), *v3);
    if (objc_msgSend(v61, "count"))
    {
      v21 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", 0);
      -[NSPersistentHistoryChangeRequest setResultType:](v21, "setResultType:", 5);
      v22 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v21, &v78), "result");
      if (v22)
      {
        v23 = (void *)v22;
        v52 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v52, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v43 = v23;
        v45 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v45)
        {
          v44 = *(_QWORD *)v67;
          v47 = a1;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v67 != v44)
                objc_enumerationMutation(v43);
              obja = v24;
              v56 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v24);
              context = (void *)MEMORY[0x18D76B4E4]();
              v25 = *(void **)(a1 + 56);
              if (!v25 || objc_msgSend(v25, "compare:", objc_msgSend(v56, "timestamp")) != 1)
              {
                v26 = *(void **)(v47 + 64);
                if (!v26 || objc_msgSend(v26, "compare:", objc_msgSend(v56, "timestamp")) != -1)
                {
                  v64 = 0u;
                  v65 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v60 = (id)objc_msgSend(v56, "changes");
                  v27 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v63;
                    v54 = *(_QWORD *)v63;
                    do
                    {
                      v30 = 0;
                      v58 = v28;
                      do
                      {
                        if (*(_QWORD *)v63 != v29)
                          objc_enumerationMutation(v60);
                        v31 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v30);
                        v32 = (void *)MEMORY[0x18D76B4E4]();
                        if (objc_msgSend(v61, "containsObject:", objc_msgSend(v31, "changedObjectID")))
                        {
                          v33 = *(void **)(v4 + 2368);
                          v4 = 0x1E0CB3000uLL;
                          fputs((const char *)objc_msgSend((id)objc_msgSend(v33, "stringWithFormat:", CFSTR("Transaction (%lld): %@:%@:%@ at %@\n"), objc_msgSend(v56, "transactionNumber"), objc_msgSend(v56, "processID"), objc_msgSend(v56, "bundleID"), objc_msgSend(v56, "author"), objc_msgSend(v52, "stringFromDate:", objc_msgSend(v56, "timestamp"))), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
                          v34 = (FILE *)*MEMORY[0x1E0C80C20];
                          v35 = (void *)MEMORY[0x1E0CB3940];
                          v36 = objc_msgSend(v31, "changeID");
                          v37 = objc_msgSend(v31, "changedObjectID");
                          v38 = +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", objc_msgSend(v31, "changeType"));
                          v42 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "updatedProperties"), "valueForKey:", CFSTR("name")), "allObjects"), "componentsJoinedByString:", CFSTR(","));
                          v40 = v36;
                          v28 = v58;
                          v39 = v35;
                          v29 = v54;
                          fputs((const char *)objc_msgSend((id)objc_msgSend(v39, "stringWithFormat:", CFSTR("\tChange (%llu): %@: %@ - %@\n"), v40, v37, v38, v42), "UTF8String"), v34);
                        }
                        objc_autoreleasePoolPop(v32);
                        ++v30;
                      }
                      while (v28 != v30);
                      v28 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
                    }
                    while (v28);
                  }
                }
              }
              objc_autoreleasePoolPop(context);
              v24 = obja + 1;
              a1 = v47;
            }
            while (obja + 1 != (char *)v45);
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
          }
          while (v45);
        }

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v78;
      }
    }
  }

}

+ (BOOL)printEventsInStores:(id)a3 startingAt:(id)a4 endingAt:(id)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSPersistentStoreCoordinator *v14;
  uint64_t v15;
  NSManagedObjectContext *v16;
  int v17;
  char v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v33[10];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  _QWORD v52[3];
  _QWORD v53[3];
  const __CFString *v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__46;
  v42 = __Block_byref_object_dispose__46;
  v43 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v56, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v35;
    v8 = MEMORY[0x1E0C9AAB0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(a3);
      v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x18D76B4E4]();
      v54 = CFSTR("NSReadOnlyPersistentStoreOption");
      v55 = v8;
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v13 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v10, v12, v39 + 5);
      if (v13)
      {
        v14 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v13);
        v52[0] = CFSTR("NSReadOnlyPersistentStoreOption");
        v52[1] = CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey");
        v53[0] = v8;
        v53[1] = v8;
        v52[2] = CFSTR("NSPersistentHistoryTrackingKey");
        v53[2] = v8;
        v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
        if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v14, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v10, v15, v39 + 5))
        {
          v16 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v16, "setPersistentStoreCoordinator:", v14);
          -[NSManagedObjectContext _setAllowAncillaryEntities:](v16, "_setAllowAncillaryEntities:", 1);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __84__NSCloudKitMirroringDelegate___CLI__printEventsInStores_startingAt_endingAt_error___block_invoke;
          v33[3] = &unk_1E1EDF0B8;
          v33[4] = a4;
          v33[5] = a5;
          v33[6] = v10;
          v33[7] = v16;
          v33[8] = &v44;
          v33[9] = &v38;
          -[NSManagedObjectContext performBlockAndWait:](v16, "performBlockAndWait:", v33);

        }
        else
        {
          *((_BYTE *)v45 + 24) = 0;
        }

        v17 = 2 * (*((_BYTE *)v45 + 24) == 0);
      }
      else
      {
        *((_BYTE *)v45 + 24) = 0;
        v17 = 2;
      }
      objc_autoreleasePoolPop(v11);
      if (v17)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v56, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  if (!*((_BYTE *)v45 + 24))
  {
    v20 = (id)v39[5];
    if (v20)
    {
      if (a6)
        *a6 = v20;
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        v50 = 1024;
        v51 = 798;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v39[5] = 0;
  v18 = *((_BYTE *)v45 + 24);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v18;
}

void __84__NSCloudKitMirroringDelegate___CLI__printEventsInStores_startingAt_endingAt_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  -[NSFetchRequest setFetchBatchSize:](v2, "setFetchBatchSize:", 1000);
  v20[0] = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startedAt"), 1);
  -[NSFetchRequest setSortDescriptors:](v2, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1));
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startedAt >= %@"), *(_QWORD *)(a1 + 32)));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startedAt <= %@"), *(_QWORD *)(a1 + 40)));
  if (objc_msgSend(v3, "count"))
    -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3));
  fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetching events from store: %@\nWith fetch: %@\n"), *(_QWORD *)(a1 + 48), v2), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
  v18 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 56), "executeFetchRequest:error:", v2, &v18);
  if (v4)
  {
    v5 = (void *)v4;
    v13 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ - %@: %@ - "), objc_msgSend(v6, "stringFromDate:", objc_msgSend(v11, "startedAt")), objc_msgSend(v6, "stringFromDate:", objc_msgSend(v11, "endedAt")), +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", objc_msgSend(v11, "cloudKitEventType")));
          if (objc_msgSend(v11, "succeeded"))
            objc_msgSend(v12, "appendString:", CFSTR("succeeded"));
          else
            objc_msgSend(v12, "appendFormat:", CFSTR("failed - %@:%lld"), objc_msgSend(v11, "errorDomain"), objc_msgSend(v11, "errorCode"));
          fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v12), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

    v3 = v13;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v18;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

+ (BOOL)printSharedZoneWithName:(id)a3 inStoreAtURL:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSPersistentStoreCoordinator *v11;
  uint64_t v12;
  NSManagedObjectContext *v13;
  id v14;
  char v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[9];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  _QWORD v41[3];
  _QWORD v42[3];
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__46;
  v31 = __Block_byref_object_dispose__46;
  v32 = 0;
  v43 = CFSTR("NSReadOnlyPersistentStoreOption");
  v8 = MEMORY[0x1E0C9AAB0];
  v44[0] = MEMORY[0x1E0C9AAB0];
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v10 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", a4, v9, v28 + 5);
  if (v10)
  {
    v11 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v10);
    v41[0] = CFSTR("NSReadOnlyPersistentStoreOption");
    v41[1] = CFSTR("NSCloudKitMirroringDelegateReadOnlyOptionKey");
    v42[0] = v8;
    v42[1] = v8;
    v41[2] = CFSTR("NSPersistentHistoryTrackingKey");
    v42[2] = v8;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v11, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, a4, v12, v28 + 5))
    {
      v13 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v13, "setPersistentStoreCoordinator:", v11);
      -[NSManagedObjectContext _setAllowAncillaryEntities:](v13, "_setAllowAncillaryEntities:", 1);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __81__NSCloudKitMirroringDelegate___CLI__printSharedZoneWithName_inStoreAtURL_error___block_invoke;
      v26[3] = &unk_1E1EDF498;
      v26[4] = a3;
      v26[5] = v13;
      v26[6] = a4;
      v26[7] = &v33;
      v26[8] = &v27;
      -[NSManagedObjectContext performBlockAndWait:](v13, "performBlockAndWait:", v26);

    }
    else
    {
      *((_BYTE *)v34 + 24) = 0;
    }

  }
  else
  {
    *((_BYTE *)v34 + 24) = 0;
    v14 = (id)v28[5];
  }
  if (!*((_BYTE *)v34 + 24))
  {
    v17 = (id)v28[5];
    if (v17)
    {
      if (a5)
        *a5 = v17;
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m");
      v25 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegate+CLI.m";
        v39 = 1024;
        v40 = 878;
        _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v28[5] = 0;
  v15 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v15;
}

void __81__NSCloudKitMirroringDelegate___CLI__printSharedZoneWithName_inStoreAtURL_error___block_invoke(uint64_t a1)
{
  NSFetchRequest *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FILE **v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  PFCloudKitArchivingUtilities *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ckRecordZoneName == %@"), *(_QWORD *)(a1 + 32)));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v2, "setReturnsObjectsAsFaults:", 0);
  v21 = 0;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v2, &v21);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v3)
  {
    v5 = v3;
    *(_BYTE *)(v4 + 24) = 1;
    if (objc_msgSend(v3, "count"))
    {
      v15 = a1;
      v16 = objc_alloc_init(PFCloudKitArchivingUtilities);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v6)
      {
        v7 = v6;
        v8 = (FILE **)MEMORY[0x1E0C80C20];
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v5);
            v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            v12 = (void *)MEMORY[0x18D76B4E4]();
            fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata:\n%@\n"), v11), "UTF8String"), *v8);
            if (objc_msgSend(v11, "encodedShareData"))
            {
              v13 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v11);
              v14 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]((uint64_t)v16, (void *)objc_msgSend(v11, "encodedShareData"), v13, &v21);
              if (v14)
              {
                fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Share:\n%@\n"), v14), "UTF8String"), *v8);
              }
              else
              {
                fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode share data for %@: %@\n"), v13, v21), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C10]);
                v21 = 0;
              }

            }
            else
            {
              fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No encoded share was found on the metadata for %@\n"), *(_QWORD *)(v15 + 32)), "UTF8String"), *v8);
            }
            objc_autoreleasePoolPop(v12);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v7);
      }

    }
    else
    {
      fputs((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not container a zone named %@"), objc_msgSend(*(id *)(a1 + 48), "lastPathComponent"), *(_QWORD *)(a1 + 32)), "UTF8String"), (FILE *)*MEMORY[0x1E0C80C20]);
    }
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v21;
  }
}

+ (NSString)cloudKitMetadataTransformerName
{
  return (NSString *)CFSTR("com.apple.CoreData.cloudkit.metadata.transformer");
}

@end
