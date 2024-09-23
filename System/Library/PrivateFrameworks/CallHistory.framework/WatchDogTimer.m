@implementation WatchDogTimer

- (WatchDogTimer)initWithQueue:(id)a3 withName:(id)a4 withTimeout:(double)a5 withCallback:(id)a6
{
  NSObject *v10;
  id v11;
  id v12;
  WatchDogTimer *v13;
  WatchDogTimer *v14;
  NSObject *v15;
  NSString *name;
  dispatch_source_t v17;
  OS_dispatch_source *timer;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD handler[4];
  WatchDogTimer *v24;
  id v25;
  double v26;
  objc_super v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WatchDogTimer;
  v13 = -[CHLogger initWithDomain:](&v27, sel_initWithDomain_, "WatchDogTimer");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a4);
    -[CHLogger logHandle](v14, "logHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      name = v14->_name;
      *(_DWORD *)buf = 138543618;
      v29 = name;
      v30 = 2048;
      v31 = a5;
      _os_log_impl(&dword_1B3FA4000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ waiting %f seconds", buf, 0x16u);
    }

    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v17;

    v19 = v14->_timer;
    v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
    v21 = v14->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__WatchDogTimer_initWithQueue_withName_withTimeout_withCallback___block_invoke;
    handler[3] = &unk_1E67475A0;
    v24 = v14;
    v26 = a5;
    v25 = v12;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume((dispatch_object_t)v14->_timer);

  }
  return v14;
}

void __65__WatchDogTimer_initWithQueue_withName_withTimeout_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: task took longer than %f seconds", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)dealloc
{
  NSObject *v3;
  NSString *name;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CHLogger logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543362;
    v7 = name;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "Goodbye from %{public}@ timer", buf, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v5.receiver = self;
  v5.super_class = (Class)WatchDogTimer;
  -[WatchDogTimer dealloc](&v5, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  NSString *name;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CHLogger logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    v5 = 138543362;
    v6 = name;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@ timer", (uint8_t *)&v5, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
