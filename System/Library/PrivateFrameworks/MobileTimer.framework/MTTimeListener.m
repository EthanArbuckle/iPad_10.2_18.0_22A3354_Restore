@implementation MTTimeListener

- (MTTimeListener)init
{
  void *v3;
  MTTimeListener *v4;

  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTTimeListener initWithCallbackScheduler:](self, "initWithCallbackScheduler:", v3);

  return v4;
}

- (MTTimeListener)initWithCallbackScheduler:(id)a3
{
  id v4;
  MTTimeListener *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  MTObserverStore *v9;
  MTObserverStore *observers;
  objc_super v12;
  uint8_t buf[4];
  MTTimeListener *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTTimeListener;
  v5 = -[MTTimeListener init](&v12, sel_init);
  if (v5)
  {
    MTLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v7 = dispatch_queue_create("com.apple.MTTimeListener.access-queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = -[MTObserverStore initWithCallbackScheduler:]([MTObserverStore alloc], "initWithCallbackScheduler:", v4);
    observers = v5->_observers;
    v5->_observers = v9;

  }
  return v5;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SignificantTimeChange"), a4);
}

- (double)assertionTimeOutForNotification:(id)a3 ofType:(int64_t)a4
{
  int v4;
  double result;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("SignificantTimeChange"), a4);
  result = 60.0;
  if (!v4)
    return 0.0;
  return result;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_group_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *queue;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  dispatch_group_t v19;
  MTTimeListener *v20;
  uint8_t buf[4];
  MTTimeListener *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  MTLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received significant time change notification. Notifying observers", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E80], "resetSystemTimeZone");
  MTLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ timeZone: %{public}@", buf, 0x16u);

  }
  v10 = dispatch_group_create();
  -[MTTimeListener observers](self, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke;
  v18[3] = &unk_1E39CDBA0;
  v19 = v10;
  v20 = self;
  v13 = v10;
  objc_msgSend(v11, "enumerateObserversWithBlock:", v18);

  queue = self->_queue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_3;
  block[3] = &unk_1E39CC398;
  v17 = v6;
  v15 = v6;
  dispatch_group_notify(v13, queue, block);

}

void __55__MTTimeListener_handleNotification_ofType_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_2;
  v6[3] = &unk_1E39CB858;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "timeListener:didDetectSignificantTimeChangeWithCompletionBlock:", v5, v6);

}

void __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTTimeListener observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

@end
