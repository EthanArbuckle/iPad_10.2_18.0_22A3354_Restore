@implementation NPKStandaloneFirstUnlockCoordinator

- (NPKStandaloneFirstUnlockCoordinator)initWithQueue:(id)a3
{
  NSObject *v5;
  NPKStandaloneFirstUnlockCoordinator *v6;
  NPKStandaloneFirstUnlockCoordinator *v7;
  uint64_t v8;
  NSMutableArray *blocksToPerformAfterFirstDeviceUnlock;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NPKStandaloneFirstUnlockCoordinator;
  v6 = -[NPKStandaloneFirstUnlockCoordinator init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    blocksToPerformAfterFirstDeviceUnlock = v7->_blocksToPerformAfterFirstDeviceUnlock;
    v7->_blocksToPerformAfterFirstDeviceUnlock = (NSMutableArray *)v8;

    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__NPKStandaloneFirstUnlockCoordinator_initWithQueue___block_invoke;
    v11[3] = &unk_24CFE78F0;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v7->_firstDeviceUnlockRegistrationToken, v5, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__NPKStandaloneFirstUnlockCoordinator_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: First unlock detected", v5, 2u);
    }

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_performFirstUnlockWork");
    if (notify_is_valid_token(objc_msgSend(WeakRetained, "firstDeviceUnlockRegistrationToken")))
    {
      notify_cancel(objc_msgSend(WeakRetained, "firstDeviceUnlockRegistrationToken"));
      objc_msgSend(WeakRetained, "setFirstDeviceUnlockRegistrationToken:", 0xFFFFFFFFLL);
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(-[NPKStandaloneFirstUnlockCoordinator firstDeviceUnlockRegistrationToken](self, "firstDeviceUnlockRegistrationToken")))
  {
    notify_cancel(-[NPKStandaloneFirstUnlockCoordinator firstDeviceUnlockRegistrationToken](self, "firstDeviceUnlockRegistrationToken"));
    -[NPKStandaloneFirstUnlockCoordinator setFirstDeviceUnlockRegistrationToken:](self, "setFirstDeviceUnlockRegistrationToken:", 0xFFFFFFFFLL);
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKStandaloneFirstUnlockCoordinator;
  -[NPKStandaloneFirstUnlockCoordinator dealloc](&v3, sel_dealloc);
}

- (void)performSubjectToFirstUnlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  -[NPKStandaloneFirstUnlockCoordinator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NPKStandaloneFirstUnlockCoordinator blocksToPerformAfterFirstDeviceUnlock](self, "blocksToPerformAfterFirstDeviceUnlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x2199B6780](v4);

  objc_msgSend(v6, "addObject:", v7);
  if (NPKProtectedDataAvailable())
  {
    -[NPKStandaloneFirstUnlockCoordinator _performFirstUnlockWork](self, "_performFirstUnlockWork");
  }
  else
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Deferring work until first device unlock", v11, 2u);
      }

    }
  }
}

- (void)_performFirstUnlockWork
{
  NSObject *v3;
  void *v4;
  id v5;

  -[NPKStandaloneFirstUnlockCoordinator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NPKStandaloneFirstUnlockCoordinator blocksToPerformAfterFirstDeviceUnlock](self, "blocksToPerformAfterFirstDeviceUnlock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKStandaloneFirstUnlockCoordinator setBlocksToPerformAfterFirstDeviceUnlock:](self, "setBlocksToPerformAfterFirstDeviceUnlock:", v4);

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_20);
}

uint64_t __62__NPKStandaloneFirstUnlockCoordinator__performFirstUnlockWork__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)blocksToPerformAfterFirstDeviceUnlock
{
  return self->_blocksToPerformAfterFirstDeviceUnlock;
}

- (void)setBlocksToPerformAfterFirstDeviceUnlock:(id)a3
{
  objc_storeStrong((id *)&self->_blocksToPerformAfterFirstDeviceUnlock, a3);
}

- (int)firstDeviceUnlockRegistrationToken
{
  return self->_firstDeviceUnlockRegistrationToken;
}

- (void)setFirstDeviceUnlockRegistrationToken:(int)a3
{
  self->_firstDeviceUnlockRegistrationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksToPerformAfterFirstDeviceUnlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
