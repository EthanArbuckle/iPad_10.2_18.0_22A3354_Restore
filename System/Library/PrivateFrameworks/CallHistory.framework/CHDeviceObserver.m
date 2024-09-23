@implementation CHDeviceObserver

uint64_t __37__CHDeviceObserver_isBootLockEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (CHDeviceObserver)init
{
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  CHDeviceObserver *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.CallHistory.queue.%@.%p"), objc_opt_class(), self);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v4, v5);

  v7 = -[CHDeviceObserver initWithQueue:](self, "initWithQueue:", v6);
  return v7;
}

- (CHDeviceObserver)initWithQueue:(id)a3
{
  id v4;
  CHDeviceDataSource *v5;
  CHDeviceObserver *v6;

  v4 = a3;
  v5 = objc_alloc_init(CHDeviceDataSource);
  v6 = -[CHDeviceObserver initWithQueue:dataSource:](self, "initWithQueue:dataSource:", v4, v5);

  return v6;
}

- (CHDeviceObserver)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  CHDeviceObserver *v9;
  CHDeviceObserver *v10;
  NSObject *queue;
  _QWORD v13[4];
  id v14;
  CHDeviceObserver *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHDeviceObserver;
  v9 = -[CHDelegateManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    queue = v10->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke;
    v13[3] = &unk_1E6746520;
    v14 = v8;
    v15 = v10;
    dispatch_async(queue, v13);

  }
  return v10;
}

- (BOOL)isBootLockEnabled
{
  CHDeviceObserver *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CHDeviceObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CHDeviceObserver_isBootLockEnabled__block_invoke;
  v5[3] = &unk_1E67469C0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstUnlockNotifyObserver, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke(uint64_t a1)
{
  CHNotifyObserver *v2;
  uint64_t v3;
  CHNotifyObserver *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  if (objc_msgSend(*(id *)(a1 + 32), "isBootLockEnabled"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
    objc_initWeak(&location, *(id *)(a1 + 40));
    v2 = [CHNotifyObserver alloc];
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke_2;
    v5[3] = &unk_1E67463E8;
    objc_copyWeak(&v7, &location);
    v6 = *(id *)(a1 + 32);
    v4 = -[CHNotifyObserver initWithName:queue:callback:](v2, "initWithName:queue:callback:", CFSTR("com.apple.mobile.keybagd.first_unlock"), v3, v5);
    objc_msgSend(*(id *)(a1 + 40), "setFirstUnlockNotifyObserver:", v4);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setBootLockEnabled:", objc_msgSend(*(id *)(a1 + 32), "isBootLockEnabled"));

}

- (void)setBootLockEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[CHDeviceObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_bootLockEnabled != v3)
  {
    self->_bootLockEnabled = v3;
    -[CHDelegateManager performDelegateSelector:](self, "performDelegateSelector:", sel_didChangeBootLockEnabledForDeviceObserver_);
  }
}

- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4
{
  BOOL v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF08A490))
    v6 = sel_didChangeBootLockEnabledForDeviceObserver_ == a3;
  else
    v6 = 0;
  if (v6)
    objc_msgSend(v7, "didChangeBootLockEnabledForDeviceObserver:", self);

}

- (CHDeviceDataSource)dataSource
{
  return self->_dataSource;
}

- (CHNotifyObserver)firstUnlockNotifyObserver
{
  return self->_firstUnlockNotifyObserver;
}

- (void)setFirstUnlockNotifyObserver:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockNotifyObserver, a3);
}

@end
