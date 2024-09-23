@implementation LACTimer

- (LACTimer)init
{
  LACTimer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACTimer;
  result = -[LACTimer init](&v3, sel_init);
  if (result)
    result->_timerLock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)isRunning
{
  os_unfair_lock_s *p_timerLock;
  NSObject *timer;
  BOOL v5;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer)
    v5 = dispatch_source_testcancel(timer) == 0;
  else
    v5 = 0;
  os_unfair_lock_unlock(p_timerLock);
  return v5;
}

- (void)cancel
{
  os_unfair_lock_s *p_timerLock;
  NSObject *timer;
  OS_dispatch_source *v5;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;

  }
  os_unfair_lock_unlock(p_timerLock);
}

- (void)dispatchAfter:(double)a3 inQueue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__LACTimer_dispatchAfter_inQueue_block___block_invoke;
  v11[3] = &unk_2510C1B50;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v12 = v10;
  -[LACTimer dispatchAfter:inQueue:repeat:block:](self, "dispatchAfter:inQueue:repeat:block:", v8, 0, v11, a3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __40__LACTimer_dispatchAfter_inQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancel");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_dispatchAfter:(double)a3 inQueue:(id)a4 repeat:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *p_timerLock;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  OS_dispatch_source *v29;
  OS_dispatch_source *timer;
  double v31;
  dispatch_time_t v32;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  if (a3 == 0.0)
  {
    if (v7)
    {
      LACLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[LACTimer _dispatchAfter:inQueue:repeat:block:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
    dispatch_async(v10, v11);
  }
  else
  {
    p_timerLock = &self->_timerLock;
    os_unfair_lock_lock(&self->_timerLock);
    if (self->_timer)
    {
      LACLogDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[LACTimer _dispatchAfter:inQueue:repeat:block:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

    }
    else
    {
      v29 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v10);
      timer = self->_timer;
      self->_timer = v29;

      v31 = a3 * 1000000000.0;
      v32 = dispatch_time(0, (uint64_t)v31);
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v32, (unint64_t)v31, 0);
      dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v11);
      dispatch_activate((dispatch_object_t)self->_timer);
    }
    os_unfair_lock_unlock(p_timerLock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)_dispatchAfter:(uint64_t)a3 inQueue:(uint64_t)a4 repeat:(uint64_t)a5 block:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_2409DC000, a1, a3, "Repeating timers with zero length are not supported", a5, a6, a7, a8, 0);
}

- (void)_dispatchAfter:(uint64_t)a3 inQueue:(uint64_t)a4 repeat:(uint64_t)a5 block:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_2409DC000, a1, a3, "Reusing running timers is not supported", a5, a6, a7, a8, 0);
}

@end
