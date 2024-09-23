@implementation ATXBackgroundSaver

uint64_t __38__ATXBackgroundSaver__cancelSaveTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSaveTimerWithLockWitness:", a2);
}

- (void)_cancelSaveTimerWithLockWitness:(id)a3
{
  NSObject *v3;
  id v5;
  id v6;

  v3 = *((_QWORD *)a3 + 1);
  if (v3)
  {
    v5 = a3;
    dispatch_source_cancel(v3);
    v6 = (id)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = 0;

  }
}

id __34__ATXBackgroundSaver_scheduleSave__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_cancelSaveTimer");
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

- (void)_cancelSaveTimer
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__ATXBackgroundSaver__cancelSaveTimer__block_invoke;
  v3[3] = &unk_1E82E6AD8;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (ATXBackgroundSaver)initWithQueue:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  ATXBackgroundSaver *v9;
  ATXBackgroundSaver *v10;
  uint64_t v11;
  id block;
  id v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXBackgroundSaver;
  v9 = -[ATXBackgroundSaver init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = (id)v11;

    v13 = objc_alloc(MEMORY[0x1E0D815F0]);
    v14 = (void *)objc_opt_new();
    v15 = objc_msgSend(v13, "initWithGuardedData:", v14);
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXBackgroundSaver _cancelSaveTimer](self, "_cancelSaveTimer");
  -[ATXSigtermListener unregisterObserver:](self->_sigtermListener, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ATXBackgroundSaver;
  -[ATXBackgroundSaver dealloc](&v3, sel_dealloc);
}

- (void)handleSigterm
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__ATXBackgroundSaver_handleSigterm__block_invoke;
  v3[3] = &unk_1E82E6AD8;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

uint64_t __35__ATXBackgroundSaver_handleSigterm__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 8))
    return objc_msgSend(*(id *)(result + 32), "scheduleSaveImmediately");
  return result;
}

- (void)_saveImmediatelyOnSigterm
{
  ATXSigtermListener *v3;
  ATXSigtermListener *sigtermListener;

  if (!self->_sigtermListener)
  {
    objc_msgSend(MEMORY[0x1E0CF94F8], "sharedInstance");
    v3 = (ATXSigtermListener *)objc_claimAutoreleasedReturnValue();
    sigtermListener = self->_sigtermListener;
    self->_sigtermListener = v3;

    -[ATXSigtermListener registerObserver:](self->_sigtermListener, "registerObserver:", self);
  }
}

- (void)scheduleSave
{
  void *v3;
  _PASLock *lock;
  id v5;
  _QWORD v6[5];
  id v7;

  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__ATXBackgroundSaver_scheduleSave__block_invoke;
  v6[3] = &unk_1E82E6B00;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);

}

void __34__ATXBackgroundSaver_scheduleSave__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_saveImmediatelyOnSigterm");
  objc_msgSend(*(id *)(a1 + 32), "_cancelSaveTimerWithLockWitness:", v4);
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = v4[1];
  v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  v9 = v4[1];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__ATXBackgroundSaver_scheduleSave__block_invoke_2;
  v12[3] = &unk_1E82DACB0;
  v10 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  dispatch_source_set_event_handler(v9, v12);
  v11 = v4[1];

  dispatch_resume(v11);
}

- (void)scheduleSaveImmediately
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  -[ATXBackgroundSaver _cancelSaveTimer](self, "_cancelSaveTimer");
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ATXBackgroundSaver_scheduleSaveImmediately__block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

}

id __45__ATXBackgroundSaver_scheduleSaveImmediately__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermListener, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
