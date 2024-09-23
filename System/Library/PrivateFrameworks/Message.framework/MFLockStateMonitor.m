@implementation MFLockStateMonitor

void __36__MFLockStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;

}

- (MFLockStateMonitor)init
{
  MFLockStateMonitor *v2;
  uint64_t v3;
  EFObserver *observable;
  NSObject *v5;
  NSObject *v6;
  void (**v7)(void *, _QWORD);
  int *p_token;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFLockStateMonitor;
  v2 = -[MFLockStateMonitor init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v3 = objc_claimAutoreleasedReturnValue();
    observable = v2->_observable;
    v2->_observable = (EFObserver *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.message.lockStateMonitor.notifyq", v5);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __26__MFLockStateMonitor_init__block_invoke;
    v10[3] = &unk_1E4E8CCD0;
    objc_copyWeak(&v11, &location);
    v7 = (void (**)(void *, _QWORD))_Block_copy(v10);
    p_token = &v2->_token;
    if (notify_register_dispatch("com.apple.springboard.lockstate", &v2->_token, v6, v7))
      *p_token = -1;
    else
      v7[2](v7, *p_token);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __26__MFLockStateMonitor_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state64 = 0;
  notify_get_state(a2, &state64);
  objc_msgSend(WeakRetained, "_receiveLockState:", state64 != 0);

}

- (void)_receiveLockState:(BOOL)a3
{
  EFObserver *observable;
  id v4;

  atomic_store(a3, (unsigned __int8 *)&self->_isLocked);
  observable = self->_observable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFObserver observerDidReceiveResult:](observable, "observerDidReceiveResult:");

}

- (EFObservable)lockStateObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[EFObserver distinctUntilChanged](self->_observable, "distinctUntilChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFLockStateMonitor isLocked](self, "isLocked"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWith:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v6;
}

- (BOOL)isLocked
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isLocked);
  return v2 & 1;
}

+ (MFLockStateMonitor)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MFLockStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (MFLockStateMonitor *)(id)sharedInstance_instance_0;
}

- (void)dealloc
{
  int token;
  objc_super v4;

  token = self->_token;
  if (token != -1)
    notify_cancel(token);
  v4.receiver = self;
  v4.super_class = (Class)MFLockStateMonitor;
  -[MFLockStateMonitor dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
