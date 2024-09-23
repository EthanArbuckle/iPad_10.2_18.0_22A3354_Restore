@implementation MLBackgroundWatchdog

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)MLBackgroundWatchdog;
  -[MLBackgroundWatchdog dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v2;

  -[MLBackgroundWatchdog timer](self, "timer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (id)watchdogWithTimeout:(double)a3 queue:(id)a4
{
  return (id)objc_msgSend(a1, "watchdogWithTimeout:label:queue:", 0, a4, a3);
}

+ (id)watchdogWithTimeout:(double)a3 label:(id)a4 queue:(id)a5
{
  id v7;
  NSObject *v8;
  MLBackgroundWatchdog *v9;
  NSObject *v10;
  dispatch_source_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  MLBackgroundWatchdog *v15;
  id v16;
  NSObject *v17;
  MLBackgroundWatchdog *v18;
  MLBackgroundWatchdog *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  MLBackgroundWatchdog *v26;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MLBackgroundWatchdog);
  if (!v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("CoreML Background Watchdog Queue", v10);

  }
  v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
  -[MLBackgroundWatchdog setTimer:](v9, "setTimer:", v11);

  -[MLBackgroundWatchdog timer](v9, "timer");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

  -[MLBackgroundWatchdog timer](v9, "timer");
  v14 = objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __56__MLBackgroundWatchdog_watchdogWithTimeout_label_queue___block_invoke;
  v24 = &unk_1E3D66FB8;
  v25 = v7;
  v15 = v9;
  v26 = v15;
  v16 = v7;
  dispatch_source_set_event_handler(v14, &v21);

  -[MLBackgroundWatchdog timer](v15, "timer", v21, v22, v23, v24);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v17);

  v18 = v26;
  v19 = v15;

  return v19;
}

void __56__MLBackgroundWatchdog_watchdogWithTimeout_label_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_FAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v8;
    v5 = "%@ watchdog timer timeout";
    v6 = v3;
    v7 = 12;
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    LOWORD(v10) = 0;
    v5 = "Watchdog timer timeout";
    v6 = v3;
    v7 = 2;
  }
  _os_log_fault_impl(&dword_19C486000, v6, OS_LOG_TYPE_FAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "timer");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v9);

  exit(1);
}

@end
