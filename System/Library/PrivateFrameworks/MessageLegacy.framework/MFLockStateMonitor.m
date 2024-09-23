@implementation MFLockStateMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MFLockStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_instance_0;
}

void __36__MFLockStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;

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

- (MFLockStateMonitor)init
{
  MFLockStateMonitor *v2;
  uint64_t v3;
  EFObserver *observable;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  void (**v8)(void *, _QWORD);
  int *p_token;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFLockStateMonitor;
  v2 = -[MFLockStateMonitor init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v3 = objc_claimAutoreleasedReturnValue();
    observable = v2->_observable;
    v2->_observable = (EFObserver *)v3;

    v5 = dispatch_queue_create("com.apple.message.lockStateMonitor", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.message.lockStateMonitor.notifyq", 0);
    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__MFLockStateMonitor_init__block_invoke;
    v11[3] = &unk_1E81CB240;
    objc_copyWeak(&v12, &location);
    v8 = (void (**)(void *, _QWORD))_Block_copy(v11);
    p_token = &v2->_token;
    if (notify_register_dispatch("com.apple.springboard.lockstate", &v2->_token, v7, v8))
      *p_token = -1;
    else
      v8[2](v8, *p_token);

    objc_destroyWeak(&v12);
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
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MFLockStateMonitor_isLocked__block_invoke;
  v5[3] = &unk_1E81CAAE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__MFLockStateMonitor_isLocked__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)_receiveLockState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *queue;
  EFObserver *observable;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__MFLockStateMonitor__receiveLockState___block_invoke;
  v8[3] = &unk_1E81CB268;
  v8[4] = self;
  v9 = a3;
  dispatch_barrier_sync(queue, v8);
  observable = self->_observable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObserver observerDidReceiveResult:](observable, "observerDidReceiveResult:", v7);

}

uint64_t __40__MFLockStateMonitor__receiveLockState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
