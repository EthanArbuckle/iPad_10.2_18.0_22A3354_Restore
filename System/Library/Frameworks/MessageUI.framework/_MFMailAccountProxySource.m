@implementation _MFMailAccountProxySource

- (_MFMailAccountProxySource)init
{
  _MFMailAccountProxySource *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFMailAccountProxySource;
  v2 = -[_MFMailAccountProxySource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (void)dealloc
{
  NSArray *accountProxies;
  objc_super v4;

  -[NSLock lock](self->_lock, "lock");
  -[_MFMailAccountProxySource _deregisterForNotifications_nts](self, "_deregisterForNotifications_nts");
  accountProxies = self->_accountProxies;
  self->_accountProxies = 0;

  -[NSLock unlock](self->_lock, "unlock");
  v4.receiver = self;
  v4.super_class = (Class)_MFMailAccountProxySource;
  -[_MFMailAccountProxySource dealloc](&v4, sel_dealloc);
}

- (id)accountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSArray *v11;
  NSObject *v12;
  NSArray *accountProxies;
  NSArray *v14;
  NSArray *v15;
  _QWORD v17[4];
  NSArray *v18;
  dispatch_semaphore_t v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_accountProxies || self->_lastSourceAccountManagementQueried != (_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0D46A18], *MEMORY[0x1E0D46A48], *MEMORY[0x1E0D46A88], *MEMORY[0x1E0D46A28], *MEMORY[0x1E0D46A30], *MEMORY[0x1E0D46A38], *MEMORY[0x1E0D46A40], *MEMORY[0x1E0D46A20], *MEMORY[0x1E0D46A58], *MEMORY[0x1E0D46A50], *MEMORY[0x1E0D46A70], *MEMORY[0x1E0D46A68], *MEMORY[0x1E0D46A80], *MEMORY[0x1E0D46A78], *MEMORY[0x1E0D46A60], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = dispatch_semaphore_create(0);
    v10 = (void *)MEMORY[0x1E0D46AA8];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke;
    v17[3] = &unk_1E5A67848;
    v11 = (NSArray *)v8;
    v18 = v11;
    v19 = v9;
    v12 = v9;
    objc_msgSend(v10, "accountValuesForKeys:originatingBundleID:sourceAccountManagement:launchMobileMail:completionBlock:", v7, v6, v4, 1, v17);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    accountProxies = self->_accountProxies;
    self->_accountProxies = v11;
    v14 = v11;

    self->_lastSourceAccountManagementQueried = v4;
  }
  -[_MFMailAccountProxySource _registerForNotifications_nts](self, "_registerForNotifications_nts");
  -[NSLock unlock](self->_lock, "unlock");
  v15 = self->_accountProxies;

  return v15;
}

- (void)_resetAccountsChanged:(BOOL)a3
{
  NSArray *accountProxies;
  id v5;

  -[NSLock lock](self->_lock, "lock", a3);
  -[_MFMailAccountProxySource _deregisterForNotifications_nts](self, "_deregisterForNotifications_nts");
  accountProxies = self->_accountProxies;
  self->_accountProxies = 0;

  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MFMailComposeControllerShouldReloadAccounts"), 0, 0);

}

- (void)_registerForNotifications_nts
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D4D870];
  v3 = 136315394;
  v4 = v2;
  v5 = 1024;
  v6 = a1;
  _os_log_error_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", (uint8_t *)&v3, 0x12u);
}

- (void)_deregisterForNotifications_nts
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;

  if (self->_registeredForNotifications)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D4D4B0], 0);
    notify_cancel(self->_notifyToken);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

    self->_registeredForNotifications = 0;
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[_MFMailAccountProxySource _resetAccountsChanged:](self, "_resetAccountsChanged:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProxies, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
