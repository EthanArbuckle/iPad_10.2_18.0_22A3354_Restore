@implementation PFUbiquityContainerMonitor

- (PFUbiquityContainerMonitor)init
{
  PFUbiquityContainerMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerMonitor;
  result = -[PFUbiquityContainerMonitor init](&v3, sel_init);
  if (result)
  {
    result->_hasScheduledCheckBlock = 0;
    *(_OWORD *)&result->_storeName = 0u;
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    result->_currentIdentityToken = 0;
    result->_containerIdentifier = 0;
    result->_processingQueue = 0;
  }
  return result;
}

- (PFUbiquityContainerMonitor)initWithProcessingQueue:(id)a3 localPeerID:(id)a4 storeName:(id)a5 andUbiquityRootLocation:(id)a6
{
  PFUbiquityContainerMonitor *v10;
  PFUbiquityContainerMonitor *v11;

  v10 = -[PFUbiquityContainerMonitor init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_processingQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v11->_localPeerID = (NSString *)a4;
    v11->_ubiquityRootLocation = (PFUbiquityLocation *)a6;
    v11->_storeName = (NSString *)a5;
    v11->_containerIdentifier = -[PFUbiquityContainerIdentifier initWithLocalPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerIdentifier alloc], "initWithLocalPeerID:storeName:andUbiquityRootLocation:", v11->_localPeerID, v11->_storeName, v11->_ubiquityRootLocation);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  self->_containerIdentifier = 0;
  self->_currentIdentityToken = 0;
  dispatch_release((dispatch_object_t)self->_processingQueue);

  self->_ubiquityRootLocation = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerMonitor;
  -[PFUbiquityContainerMonitor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityContainerMonitor;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[PFUbiquityContainerMonitor description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontainerIdentifier: %@"), self->_containerIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcurrentIdentityToken: %@"), self->_currentIdentityToken);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tlocalPeerID: %@"), self->_localPeerID);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tstoreName: %@"), self->_storeName);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tubiquityRootLocation: %@"), self->_ubiquityRootLocation);
  return v3;
}

- (void)setContainerState:(uint64_t)a1
{
  void *v4;
  id v5;

  if (*(_DWORD *)(a1 + 32) != a2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.container.state.willChange"), a1, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v4);

    *(_DWORD *)(a1 + 32) = a2;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.container.state.didChange"), a1, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);

  }
}

- (void)setMonitorState:(uint64_t)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 36) != a2)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.monitor.state.willChange"), a1, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v4);

      *(_DWORD *)(a1 + 36) = a2;
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("com.apple.coredata.ubiquity.container.state.didChange"), a1, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);

    }
  }
}

- (void)setContainerIdentifier:(uint64_t)a3 transitionType:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a1 && *(void **)(a1 + 64) != a2)
  {
    v5 = (id)a1;
    v6 = objc_alloc(MEMORY[0x1E0CB37C0]);
    v13 = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
    v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v7 = (void *)objc_msgSend(v6, "initWithName:object:userInfo:", CFSTR("PFUbiquityContainerMonitorWillChangeContainerIdentifierNotification"), a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v7);

    v8 = *(void **)(a1 + 64);
    if (v8)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("PFUbiquityContainerIdentifierDeleteNotificaton"), *(_QWORD *)(a1 + 64));
      objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", *(_QWORD *)(a1 + 64));
      v8 = *(void **)(a1 + 64);
    }

    v9 = a2;
    *(_QWORD *)(a1 + 64) = v9;
    if (v9)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerDeleteDetected_, CFSTR("PFUbiquityContainerIdentifierDeleteNotificaton"), *(_QWORD *)(a1 + 64));
      if (*(_DWORD *)(a1 + 36) == 1)
        objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(a1 + 64));
    }
    v10 = objc_alloc(MEMORY[0x1E0CB37C0]);
    v13 = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
    v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v11 = (void *)objc_msgSend(v10, "initWithName:object:userInfo:", CFSTR("PFUbiquityContainerMonitorDidChangeContainerIdentifierNotification"), a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v11);

  }
}

- (uint64_t)startMonitor:(uint64_t)a1
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;

  if (!a1)
    return 0;
  v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken");
  *(_QWORD *)(a1 + 56) = v4;
  if (v4)
    v5 = 1;
  else
    v5 = 2;
  *(_DWORD *)(a1 + 32) = v5;
  v6 = -[PFUbiquityContainerIdentifier identifyContainer:](*(_QWORD *)(a1 + 64), a2);
  if ((_DWORD)v6)
  {
    *(_DWORD *)(a1 + 36) = 1;
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(a1 + 64));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_containerDeleteDetected_, CFSTR("PFUbiquityContainerIdentifierDeleteNotificaton"), *(_QWORD *)(a1 + 64));
  }
  if (objc_getClass("UIApplication"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRegistering for application resumed notification."), "-[PFUbiquityContainerMonitor startMonitor:]", 245, a1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel__applicationResumed_, CFSTR("UIApplicationResumedNotification"), 0);
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel_ubiquityIdentityChanged_, *MEMORY[0x1E0CB3370], 0);
  return v6;
}

- (uint64_t)stopMonitor
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", result);
    if (*(_QWORD *)(v1 + 64))
      result = objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:");
    *(_QWORD *)(v1 + 32) = 0;
  }
  return result;
}

- (void)containerDeleteDetected:(id)a3
{
  _QWORD *v4;
  PFUbiquityContainerIdentifier *containerIdentifier;
  PFUbiquityLocation *uuidFileLocation;
  PFUbiquityContainerMonitor *v7;
  PFUbiquityContainerIdentifier *v8;
  uint64_t v9;

  v4 = (_QWORD *)objc_msgSend(a3, "object");
  if (v4)
    v4 = (_QWORD *)v4[5];
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier)
    uuidFileLocation = containerIdentifier->_uuidFileLocation;
  else
    uuidFileLocation = 0;
  if (objc_msgSend(v4, "isEqual:", uuidFileLocation))
  {
    v7 = self;
    -[PFUbiquityContainerMonitor setMonitorState:]((uint64_t)self, 2);
    v9 = 0;
    v8 = -[PFUbiquityContainerIdentifier initWithLocalPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerIdentifier alloc], "initWithLocalPeerID:storeName:andUbiquityRootLocation:", self->_localPeerID, self->_storeName, self->_ubiquityRootLocation);
    if (-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v8, &v9))
    {
      -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:]((uint64_t)self, v8, 3);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Trouble identifying container: %@"), "-[PFUbiquityContainerMonitor containerDeleteDetected:]", 287, v9);
    }

  }
}

- (void)_applicationResumed:(id)a3
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nApplication resumed, scheduling check."), "-[PFUbiquityContainerMonitor _applicationResumed:]", 297, self);
  -[PFUbiquityContainerMonitor scheduleCheckBlock:]((uint64_t)self, (uint64_t)a3);
}

- (void)scheduleCheckBlock:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  _QWORD v6[6];

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    if (!*(_BYTE *)(a1 + 40))
    {
      v5 = *(NSObject **)(a1 + 48);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__PFUbiquityContainerMonitor_scheduleCheckBlock___block_invoke;
      v6[3] = &unk_1E1EDD430;
      v6[4] = a1;
      v6[5] = a2;
      dispatch_async(v5, v6);
      *(_BYTE *)(a1 + 40) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)ubiquityIdentityChanged:(id)a3
{
  -[PFUbiquityContainerMonitor scheduleCheckBlock:]((uint64_t)self, (uint64_t)a3);
}

uint64_t __49__PFUbiquityContainerMonitor_scheduleCheckBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  PFUbiquityContainerIdentifier *v8;
  uint64_t v10;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    return objc_msgSend(v2, "drain");
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  *(_BYTE *)(v3 + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
  if (*(_DWORD *)(v3 + 36) != 1)
    return objc_msgSend(v2, "drain");
  v10 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken");
  v5 = *(void **)(v3 + 56);
  if (v5 != v4)
  {
    v6 = objc_msgSend(v5, "isEqual:", v4);
    if ((v6 & 1) == 0)
    {

      *(_QWORD *)(v3 + 56) = v4;
      -[PFUbiquityContainerMonitor setMonitorState:](v3, 0);
    }
    v7 = v6 ^ 1;
    if (*(_QWORD *)(v3 + 56))
      goto LABEL_7;
LABEL_14:
    -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:](v3, 0, 2);
    -[PFUbiquityContainerMonitor setContainerState:](v3, 2);
    return objc_msgSend(v2, "drain");
  }
  v7 = 0;
  if (!v4)
    goto LABEL_14;
LABEL_7:
  v8 = -[PFUbiquityContainerIdentifier initWithLocalPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerIdentifier alloc], "initWithLocalPeerID:storeName:andUbiquityRootLocation:", *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 8));
  if ((-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v8, &v10) & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Trouble identifying container: %@"), "-[PFUbiquityContainerMonitor checkStoresAndContainer:]", 383, v10);
  }
  -[PFUbiquityContainerMonitor setContainerState:](v3, 1);
  if (v7)
    -[PFUbiquityContainerMonitor setContainerIdentifier:transitionType:](v3, v8, 1);

  return objc_msgSend(v2, "drain");
}

@end
