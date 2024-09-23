@implementation LKAttentionAwareIdleTimerClient

- (LKAttentionAwareIdleTimerClient)initWithClientDelegate:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v8;
  id v9;
  LKAttentionAwareIdleTimerClient *v10;
  LKAttentionAwareIdleTimerClient *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LKAttentionAwareIdleTimerClient;
  v10 = -[LKAttentionAwareIdleTimerClient init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_clientDelegate, v8);
    v11->_timeout = a4;
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2167FC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating attention aware timer...", buf, 2u);
  }
  IOPMUnregisterNotification();
  v4.receiver = self;
  v4.super_class = (Class)LKAttentionAwareIdleTimerClient;
  -[LKAttentionAwareIdleTimerClient dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2167FC000, log, OS_LOG_TYPE_ERROR, "Failed to register for user activity notification", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD handler[5];
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v20 = a2;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_2167FC000, v6, OS_LOG_TYPE_DEFAULT, "Event received: %llu, mostSignificantActivity: %llu", buf, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 40);
  if (a2)
  {
    if ((v8 & 0x8000000000000000) == 0)
    {
      *(_QWORD *)(v7 + 40) = v8 | 0x8000000000000000;
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    }
  }
  else
  {
    v9 = (uint64_t)*(double *)(v7 + 16) - *(_QWORD *)(a1 + 40);
    if (v9 >= 1)
    {
      objc_msgSend((id)v7, "_wakeupDeviceAfterInterval:", (double)v9);
      v7 = *(_QWORD *)(a1 + 32);
    }
    v10 = v8 & 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v7 + 40) = v10;
    v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
    if (v11)
    {
      v12 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG))
        __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_cold_1(v10, v9, v12);
      v13 = dispatch_time(0x8000000000000000, 1000000000 * v9);
      dispatch_source_set_timer(v11, v13, v9, 0);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3;
      handler[3] = &unk_24D59ACD8;
      v14 = *(_QWORD *)(a1 + 32);
      v18 = v10;
      handler[4] = v14;
      v15 = v11;
      v17 = v15;
      dispatch_source_set_event_handler(v15, handler);
      dispatch_resume(v15);

    }
  }
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;

  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG))
    __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_2(a1, v2, v3);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v4 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEBUG))
      __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_1(v4);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "idleTimerFiredForTimeout:", *(double *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)pause
{
  IOPMUnregisterNotification();
  -[LKAttentionAwareIdleTimerClient setHandle:](self, "setHandle:", 0);
}

- (void)_wakeupDeviceAfterInterval:(double)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[LKAttentionAwareIdleTimerClient _wakeupDeviceAfterInterval:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_2167FC000, v4, OS_LOG_TYPE_DEFAULT, "%s %f", buf, 0x16u);
  }
  v11[0] = CFSTR("logind");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3, CFSTR("scheduledby"), CFSTR("time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("leeway");
  v11[1] = v5;
  v11[2] = &unk_24D5A0CB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = IOPMRequestSysWake();
  if (v7)
  {
    v8 = v7;
    v9 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_ERROR))
      -[LKAttentionAwareIdleTimerClient _wakeupDeviceAfterInterval:].cold.1(v8, v9);
  }

}

- (LKAttentionAwareIdleTimerDelegate)clientDelegate
{
  return (LKAttentionAwareIdleTimerDelegate *)objc_loadWeakRetained((id *)&self->_clientDelegate);
}

- (void)setClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clientDelegate, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (unint64_t)idleTimerIndex
{
  return self->_idleTimerIndex;
}

- (void)setIdleTimerIndex:(unint64_t)a3
{
  self->_idleTimerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_clientDelegate);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_2167FC000, a3, (uint64_t)a3, "Scheduling dispatch timer #%lu for %lds", (uint8_t *)&v3);
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2167FC000, log, OS_LOG_TYPE_DEBUG, "Telling delagate about idleTimerFiredForTimeout...", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__LKAttentionAwareIdleTimerClient_resume__block_invoke_3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_0(&dword_2167FC000, a2, a3, "dispatch timer fired. Token: %lu, idle timer index: %lu", (uint8_t *)&v5);
}

- (void)_wakeupDeviceAfterInterval:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2167FC000, a2, OS_LOG_TYPE_ERROR, "Failed to request system wake: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end
