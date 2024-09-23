@implementation MTAgentDiagnosticListener

- (MTAgentDiagnosticListener)initWithDelegate:(id)a3
{
  id v4;
  MTAgentDiagnosticListener *v5;
  MTAgentDiagnosticListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAgentDiagnosticListener;
  v5 = -[MTAgentDiagnosticListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[MTAgentDiagnosticListener _addStateHandler](v6, "_addStateHandler");
  }

  return v6;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobiletimerd.diagnostics"), a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a5;
  -[MTAgentDiagnosticListener delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printDiagnostics");

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)_addStateHandler
{
  void *v2;

  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_state_add_handler();

}

_DWORD *__45__MTAgentDiagnosticListener__addStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  id v15;
  unsigned int v16;
  NSObject *v17;
  _DWORD *v18;
  unsigned int v19;
  size_t v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing os_state handler", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    return 0;
  objc_msgSend(*v5, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gatherDiagnostics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    MTLogForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_2((uint64_t)v10, v13);

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  v16 = objc_msgSend(v14, "length");
  if (v15)
  {
    MTLogForCategory(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_1((uint64_t *)v5, (uint64_t)v15, v17);

    v18 = 0;
  }
  else
  {
    v19 = v16;
    v20 = v16;
    v18 = malloc_type_calloc(1uLL, v16 + 200, 0x65D451B2uLL);
    *v18 = 1;
    v18[1] = v19;
    __strlcpy_chk();
    memcpy(v18 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v14), "bytes"), v20);
  }

  return v18;
}

- (MTAgentDiagnosticDelegate)delegate
{
  return (MTAgentDiagnosticDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error serializing state data: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __45__MTAgentDiagnosticListener__addStateHandler__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_DEBUG, "State: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
