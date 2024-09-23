@implementation FCOperationThrottler

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_3;
  v6[3] = &unk_1E464B8C8;
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v9, a1 + 6);
  v8 = a1[4];
  FCPerformIfNonNil(WeakRetained, v6);

  objc_destroyWeak(&v9);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationThrottlerPerformOperation:", v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    dispatch_suspend(WeakRetained);
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_4;
    v7[3] = &unk_1E463AD10;
    v8 = WeakRetained;
    v5 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v6 = WeakRetained;
    objc_msgSend(v5, "operationThrottler:performAsyncOperationWithCompletion:", v3, v7);

  }
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  FCOperationThrottler *v4;
  NSObject *dispatchSource;
  FCOperationThrottler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    dispatchSource = obj->_dispatchSource;
    if (v3)
      dispatch_suspend(dispatchSource);
    else
      dispatch_resume(dispatchSource);
    v4 = obj;
  }
  objc_sync_exit(v4);

}

- (void)tickle
{
  -[FCOperationThrottler tickleWithCompletion:](self, "tickleWithCompletion:", 0);
}

- (void)tickleWithCompletion:(id)a3
{
  if (a3)
    dispatch_group_notify((dispatch_group_t)self->_handlerSynchronizationGroup, (dispatch_queue_t)self->_serialQueue, a3);
  dispatch_source_merge_data((dispatch_source_t)self->_dispatchSource, 1uLL);
}

- (FCOperationThrottler)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  FCOperationThrottler *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCOperationThrottler initWithDelegate:]";
    v12 = 2080;
    v13 = "FCOperationThrottler.m";
    v14 = 1024;
    v15 = 31;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(0, v5);
  v7 = -[FCOperationThrottler initWithDelegate:updateQueue:](self, "initWithDelegate:updateQueue:", v4, v6);

  return v7;
}

- (FCOperationThrottler)initWithDelegate:(id)a3 updateQueue:(id)a4
{
  id v6;
  NSObject *v7;
  FCOperationThrottler *v8;
  FCOperationThrottler *v9;
  dispatch_group_t v10;
  dispatch_source_t v11;
  OS_dispatch_source *dispatchSource;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v19;
  _QWORD v20[4];
  NSObject *v21;
  NSObject *v22;
  _QWORD handler[4];
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id from;
  objc_super v31;
  _BYTE location[12];
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate != nil");
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCOperationThrottler initWithDelegate:updateQueue:]";
    v33 = 2080;
    v34 = "FCOperationThrottler.m";
    v35 = 1024;
    v36 = 38;
    v37 = 2114;
    v38 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

  }
  v31.receiver = self;
  v31.super_class = (Class)FCOperationThrottler;
  v8 = -[FCOperationThrottler init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_initWeak((id *)location, v8);
      objc_initWeak(&from, v6);
      v10 = dispatch_group_create();
      objc_storeStrong((id *)&v9->_handlerSynchronizationGroup, v10);
      objc_storeStrong((id *)&v9->_serialQueue, a4);
      v11 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v7);
      dispatchSource = v9->_dispatchSource;
      v9->_dispatchSource = (OS_dispatch_source *)v11;
      v13 = v11;

      objc_initWeak(&v29, v13);
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke;
      handler[3] = &unk_1E464B918;
      v15 = v10;
      v24 = v15;
      objc_copyWeak(&v26, &from);
      objc_copyWeak(&v27, (id *)location);
      objc_copyWeak(&v28, &v29);
      v16 = v7;
      v25 = v16;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_group_enter(v15);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_5;
      v20[3] = &unk_1E463AD10;
      v21 = v16;
      v22 = v15;
      v17 = v15;
      dispatch_source_set_cancel_handler(v13, v20);
      dispatch_resume(v13);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_2;
  v3[3] = &unk_1E464B8F0;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v4 = *(id *)(a1 + 40);
  FCPerformIfNonNil(WeakRetained, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

- (BOOL)suspended
{
  FCOperationThrottler *v2;
  BOOL suspended;

  v2 = self;
  objc_sync_enter(v2);
  suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_4(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  dispatch_resume(*(dispatch_object_t *)(a1 + 40));
}

- (FCOperationThrottler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCOperationThrottler init]";
    v9 = 2080;
    v10 = "FCOperationThrottler.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCOperationThrottler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_5(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_6;
  block[3] = &unk_1E463AB18;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __53__FCOperationThrottler_initWithDelegate_updateQueue___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
  v3.receiver = self;
  v3.super_class = (Class)FCOperationThrottler;
  -[FCOperationThrottler dealloc](&v3, sel_dealloc);
}

- (void)addCompletionForCurrentOperation:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCOperationThrottler addCompletionForCurrentOperation:]";
    v8 = 2080;
    v9 = "FCOperationThrottler.m";
    v10 = 1024;
    v11 = 135;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  dispatch_async((dispatch_queue_t)self->_serialQueue, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerSynchronizationGroup, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

@end
