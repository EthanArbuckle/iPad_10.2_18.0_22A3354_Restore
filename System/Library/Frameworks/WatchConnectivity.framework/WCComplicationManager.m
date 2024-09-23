@implementation WCComplicationManager

- (WCComplicationManager)init
{
  WCComplicationManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *delegateQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCComplicationManager;
  v2 = -[WCComplicationManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.watchconnectivity.complication.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    +[WCPrivateXPCManager sharedManager](WCPrivateXPCManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v2);

  }
  return v2;
}

- (void)xpcManager:(id)a3 handlePingForExtensionBundleID:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  wc_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[WCComplicationManager xpcManager:handlePingForExtensionBundleID:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_216F21000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[WCComplicationManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handlePingForExtensionBundleID:", v5);

}

- (void)xpcManager:(id)a3 isExtensionPrivileged:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  wc_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[WCComplicationManager xpcManager:isExtensionPrivileged:completionHandler:]";
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[WCComplicationManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isExtensionPrivileged:completionHandler:", v7, v8);

}

- (void)xpcManager:(id)a3 handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  wc_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[WCComplicationManager xpcManager:handlePairedSyncComplicationsStartedWithCompletionHandler:]";
    _os_log_impl(&dword_216F21000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  -[WCComplicationManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__WCComplicationManager_xpcManager_handlePairedSyncComplicationsStartedWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D661F58;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "handleDeviceHasBecomeActiveWithCompletionHandler:", v9);

}

void __94__WCComplicationManager_xpcManager_handlePairedSyncComplicationsStartedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  wc_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v7 = "-[WCComplicationManager xpcManager:handlePairedSyncComplicationsStartedWithCompletionHandler:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_216F21000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %@", buf, 0x16u);

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (WCComplicationManagerDelegate)delegate
{
  return (WCComplicationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
