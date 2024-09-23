@implementation ACTimedExpirer

void __37__ACTimedExpirer_scheduleExpiration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "cancelTimer");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ACTimedExpirer cancelTimer](self, "cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)ACTimedExpirer;
  -[ACTimedExpirer dealloc](&v3, sel_dealloc);
}

- (void)cancelTimer
{
  os_unfair_lock_s *p_invalidationTimerLock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  ACTimedExpirer *v7;

  p_invalidationTimerLock = &self->_invalidationTimerLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __29__ACTimedExpirer_cancelTimer__block_invoke;
  v6 = &unk_1E4892AD8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_invalidationTimerLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_invalidationTimerLock);

}

uint64_t __29__ACTimedExpirer_cancelTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafeCancelTimer");
}

+ (ACTimedExpirer)expirerWithTimeout:(unint64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[1] = a3;
  return (ACTimedExpirer *)v4;
}

- (ACTimedExpirer)init
{
  ACTimedExpirer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACTimedExpirer;
  result = -[ACTimedExpirer init](&v3, sel_init);
  if (result)
    result->_invalidationTimerLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)scheduleExpiration:(id)a3
{
  id v4;
  os_unfair_lock_s *p_invalidationTimerLock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  ACTimedExpirer *v11;
  id v12;

  v4 = a3;
  p_invalidationTimerLock = &self->_invalidationTimerLock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __37__ACTimedExpirer_scheduleExpiration___block_invoke;
  v10 = &unk_1E4894438;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_invalidationTimerLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_invalidationTimerLock);

}

void __37__ACTimedExpirer_scheduleExpiration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[4];
  id v10;
  id v11;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_unsafeCancelTimer");
  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = dispatch_time(0, 1000000000 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 8) * 0.5 * 1000000000.0));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37__ACTimedExpirer_scheduleExpiration___block_invoke_2;
  handler[3] = &unk_1E4894410;
  objc_copyWeak(&v11, &location);
  v10 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_unsafeCancelTimer
{
  NSObject *invalidationTimer;
  OS_dispatch_source *v4;

  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
  {
    dispatch_source_cancel(invalidationTimer);
    v4 = self->_invalidationTimer;
    self->_invalidationTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
}

@end
