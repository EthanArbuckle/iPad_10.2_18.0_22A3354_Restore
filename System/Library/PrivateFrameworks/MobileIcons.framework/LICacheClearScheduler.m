@implementation LICacheClearScheduler

- (LICacheClearScheduler)initWithObject:(id)a3 delay:(double)a4 holdTransaction:(BOOL)a5 clearHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD handler[4];
  NSObject *v29;
  id v30;
  id location;
  objc_super v32;

  v10 = a3;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)LICacheClearScheduler;
  v12 = -[LICacheClearScheduler init](&v32, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    v14 = (void *)*((_QWORD *)v12 + 9);
    *((_QWORD *)v12 + 9) = v13;

    *((double *)v12 + 3) = a4;
    objc_initWeak(&location, v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("delayed evitor queue", v15);
    v17 = (void *)*((_QWORD *)v12 + 8);
    *((_QWORD *)v12 + 8) = v16;

    *((_BYTE *)v12 + 9) = a5;
    *((_BYTE *)v12 + 8) = 0;
    v18 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v12 + 8));
    v19 = dispatch_time(0, (uint64_t)(*((double *)v12 + 3) * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v20 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke;
    handler[3] = &unk_24BFDA668;
    v21 = v18;
    v29 = v21;
    objc_copyWeak(&v30, &location);
    dispatch_source_set_event_handler(v21, handler);
    objc_msgSend(v12, "setTimer:", v21);
    dispatch_resume(v21);
    *((_QWORD *)v12 + 6) = 1;
    v22 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 7uLL, *((dispatch_queue_t *)v12 + 8));
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke_2;
    v25[3] = &unk_24BFDA690;
    objc_copyWeak(&v27, &location);
    v23 = v12;
    v26 = v23;
    dispatch_source_set_event_handler(v22, v25);
    objc_msgSend(v23, "setMemoryPreasure:", v22);
    dispatch_resume(v22);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }

  return (LICacheClearScheduler *)v12;
}

void __31__LICacheClearScheduler_object__block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v1 = (id *)(a1 + 32);
  v2 = a1 + 40;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  if (*((_BYTE *)*v1 + 9))
  {
    if (*((_QWORD *)*v1 + 7))
    {
      if (_LIDefaultLog_onceToken_0 != -1)
        dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
      v3 = (void *)_LIDefaultLog_log_0;
      if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG))
        __31__LICacheClearScheduler_object__block_invoke_cold_3((uint64_t)v1, v3);
      os_transaction_needs_more_time();
    }
    else
    {
      v4 = os_transaction_create();
      v5 = (void *)*((_QWORD *)*v1 + 7);
      *((_QWORD *)*v1 + 7) = v4;

      if (_LIDefaultLog_onceToken_0 != -1)
        dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
      v6 = (void *)_LIDefaultLog_log_0;
      if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG))
        __31__LICacheClearScheduler_object__block_invoke_cold_2((uint64_t)v1, v6);
    }
  }
  *((_BYTE *)*v1 + 8) = 0;
  v7 = dispatch_time(0, (uint64_t)(*((double *)*v1 + 3) * 1000000000.0));
  objc_msgSend(*v1, "timer");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  if (_LIDefaultLog_onceToken_0 != -1)
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
  v9 = _LIDefaultLog_log_0;
  if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG))
    __31__LICacheClearScheduler_object__block_invoke_cold_1(v2, v9, v10);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setMemoryPreasure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)object
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__LICacheClearScheduler_object__block_invoke;
  v5[3] = &unk_24BFDA6B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)a1;
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "setTimerFired:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_queue_clearCache");

}

void __75__LICacheClearScheduler_initWithObject_delay_holdTransaction_clearHandler___block_invoke_2(id *a1)
{
  id *v1;
  NSObject *v2;
  uintptr_t mask;
  id WeakRetained;
  id v5;

  v1 = a1;
  objc_msgSend(a1[4], "memoryPreasure");
  v2 = objc_claimAutoreleasedReturnValue();
  mask = dispatch_source_get_mask(v2);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "setMemoryPreasureState:", mask);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_queue_clearCache");

}

+ (id)transactionDescription:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3 && (v4 = os_transaction_copy_description()) != 0)
  {
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_queue_clearCache
{
  uint64_t v2;
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = "YES";
  if (!*(_BYTE *)(a1 + 8))
    v3 = "NO";
  v4 = 134218242;
  v5 = v2;
  v6 = 2080;
  v7 = v3;
  _os_log_debug_impl(&dword_2067A1000, a2, OS_LOG_TYPE_DEBUG, "Evaluating eviction state: memmory preasure state: %lx, timer fired: %s", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)timerFired
{
  return self->_timerFired;
}

- (void)setTimerFired:(BOOL)a3
{
  self->_timerFired = a3;
}

- (OS_dispatch_source)memoryPreasure
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)memoryPreasureState
{
  return self->_memoryPreasureState;
}

- (void)setMemoryPreasureState:(unint64_t)a3
{
  self->_memoryPreasureState = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)holdTransaction
{
  return self->_holdTransaction;
}

- (void)setHoldTransaction:(BOOL)a3
{
  self->_holdTransaction = a3;
}

- (id)clearHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clearHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_memoryPreasure, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_object, 0);
}

void __31__LICacheClearScheduler_object__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_2067A1000, a2, a3, "Object get: Delaying eviction for %lx", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __31__LICacheClearScheduler_object__block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "transactionDescription:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_2067A1000, v2, v4, "Created transaction %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

void __31__LICacheClearScheduler_object__block_invoke_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "transactionDescription:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_2067A1000, v2, v4, "Extending transaction %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

@end
