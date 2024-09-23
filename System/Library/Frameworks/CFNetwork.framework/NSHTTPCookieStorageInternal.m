@implementation NSHTTPCookieStorageInternal

uint64_t __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSHTTPCookieManagerCookiesChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (void)registerForPostingNotificationsWithContext:(id)a3
{
  OpaqueCFHTTPCookieStorage *storage;
  OpaqueCFHTTPCookieStorage *privateStorage;
  _QWORD v7[5];
  _QWORD v8[5];

  storage = self->storage;
  if (storage)
  {
    if (a3)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke;
      v8[3] = &unk_1E14FE118;
      v8[4] = a3;
      HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)storage + 16, v8);
      storage = self->storage;
    }
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    *((_BYTE *)storage + 80) = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__syncCookies, CFSTR("UIApplicationSuspendedNotification"), 0);
  }
  if (a3)
  {
    privateStorage = self->privateStorage;
    if (privateStorage)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke_2;
      v7[3] = &unk_1E14FE118;
      v7[4] = a3;
      HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)privateStorage + 16, v7);
    }
  }
}

- (void)dealloc
{
  OpaqueCFHTTPCookieStorage *storage;
  OpaqueCFHTTPCookieStorage *privateStorage;
  NSRecursiveLock *dataLock;
  objc_super v6;

  storage = self->storage;
  if (storage)
  {
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)storage + 16, 0);
    CFRelease(self->storage);
    self->storage = 0;
  }
  privateStorage = self->privateStorage;
  if (privateStorage)
  {
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
    HTTPCookieStorage::setDefaultNotificationHandler((uint64_t)privateStorage + 16, 0);
    CFRelease(self->privateStorage);
    self->privateStorage = 0;
  }
  dataLock = self->dataLock;
  if (dataLock)
  {

    self->dataLock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookieStorageInternal;
  -[NSHTTPCookieStorageInternal dealloc](&v6, sel_dealloc);
}

- (void)_syncCookies
{
  OpaqueCFHTTPCookieStorage *storage;

  storage = self->storage;
  if (storage)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1)
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1105);
    if (!newCookieStorageEnabled(void)::enabled)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
      HTTPCookieStorage::syncStorageWithCompletion((uint64_t)storage + 16, 1, 0);
    }
  }
}

uint64_t __74__NSHTTPCookieStorageInternal_registerForPostingNotificationsWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSHTTPCookieManagerCookiesChangedNotification"), *(_QWORD *)(a1 + 32));
}

@end
