@implementation MTSessionManagerExportedObject

- (MTSessionManagerExportedObject)initWithSessionManager:(id)a3
{
  id v4;
  MTSessionManagerExportedObject *v5;
  MTSessionManagerExportedObject *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSessionManagerExportedObject;
  v5 = -[MTSessionManagerExportedObject init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sessionManager, v4);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__didReceiveSessionServerReadyNotification_, CFSTR("com.apple.MTSessionServer.ready"), 0);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MTSessionManagerExportedObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.MTSessionServer.ready"), 0);

  v5.receiver = self;
  v5.super_class = (Class)MTSessionManagerExportedObject;
  -[MTSessionManagerExportedObject dealloc](&v5, sel_dealloc);
}

- (void)_didReceiveSessionServerReadyNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTSessionManagerExportedObject sessionManager](self, "sessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTSessionServerReadyNotification", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MTSessionManagerExportedObject__didReceiveSessionServerReadyNotification___block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__MTSessionManagerExportedObject__didReceiveSessionServerReadyNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MTSessionManagerStateReset"), v3);

}

- (MTSessionManager)sessionManager
{
  return (MTSessionManager *)objc_loadWeakRetained((id *)&self->_sessionManager);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
}

@end
