@implementation PFUbiquityImportOperation

- (PFUbiquityImportOperation)init
{
  PFUbiquityImportOperation *v2;
  PFUbiquityImportOperation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityImportOperation;
  v2 = -[PFUbiquityImportOperation init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_localPeerID = 0;
    v2->_storeName = 0;
    v2->_store = 0;
    v2->_ubiquityRootLocation = 0;
    v2->_lockedDelegateLock = 0;
    v2->_delegateLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  }
  return v3;
}

- (PFUbiquityImportOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  PFUbiquityImportOperation *v8;

  v8 = -[PFUbiquityImportOperation init](self, "init");
  if (v8)
  {
    v8->_localPeerID = (NSString *)a4;
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
    v8->_store = (NSPersistentStore *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_storeWillBeRemoved_, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), a3);
  }
  return v8;
}

- (PFUbiquityImportOperation)initWithStoreName:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  PFUbiquityImportOperation *v8;

  v8 = -[PFUbiquityImportOperation init](self, "init");
  if (v8)
  {
    v8->_storeName = (NSString *)a3;
    v8->_localPeerID = (NSString *)a4;
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_localPeerID = 0;
  self->_store = 0;

  self->_storeName = 0;
  self->_ubiquityRootLocation = 0;
  -[PFUbiquityImportOperation setDelegate:](self, "setDelegate:", 0);

  self->_delegateLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityImportOperation;
  -[PFUbiquityImportOperation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *localPeerID;
  NSString *storeName;
  PFUbiquityLocation *ubiquityRootLocation;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityImportOperation;
  v4 = -[PFUbiquityImportOperation description](&v9, sel_description);
  if (self)
  {
    localPeerID = self->_localPeerID;
    storeName = self->_storeName;
    ubiquityRootLocation = self->_ubiquityRootLocation;
  }
  else
  {
    storeName = 0;
    localPeerID = 0;
    ubiquityRootLocation = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tlocalPeerID: %@\n\tstoreName: %@\n\tubiquityRootLocation: %@"), v4, localPeerID, storeName, ubiquityRootLocation);
}

- (void)storeWillBeRemoved:(id)a3
{
  if ((NSPersistentStore *)objc_msgSend(a3, "object") == self->_store)
    -[PFUbiquityImportOperation cancel](self, "cancel");
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityImportOperation;
  -[PFUbiquityImportOperation cancel](&v3, sel_cancel);
  if (-[NSLock tryLock](self->_delegateLock, "tryLock"))
  {
    self->_delegate = 0;
    -[NSLock unlock](self->_delegateLock, "unlock");
  }
}

- (id)retainedDelegate
{
  NSObject *v3;

  if (self)
  {
    -[NSLock lock](self->_delegateLock, "lock");
    self->_lockedDelegateLock = 1;
  }
  v3 = self->_delegate;
  if (self->_lockedDelegateLock)
  {
    -[NSLock unlock](self->_delegateLock, "unlock");
    self->_lockedDelegateLock = 0;
  }
  return v3;
}

- (NSObject)delegate
{
  NSObject *delegate;

  if (self)
  {
    -[NSLock lock](self->_delegateLock, "lock");
    self->_lockedDelegateLock = 1;
  }
  delegate = self->_delegate;
  if (self->_lockedDelegateLock)
  {
    -[NSLock unlock](self->_delegateLock, "unlock");
    self->_lockedDelegateLock = 0;
  }
  return delegate;
}

- (void)setDelegate:(id)a3
{
  if (self)
  {
    -[NSLock lock](self->_delegateLock, "lock");
    self->_lockedDelegateLock = 1;
  }
  self->_delegate = a3;
  if (self->_lockedDelegateLock)
  {
    -[NSLock unlock](self->_delegateLock, "unlock");
    self->_lockedDelegateLock = 0;
  }
}

@end
