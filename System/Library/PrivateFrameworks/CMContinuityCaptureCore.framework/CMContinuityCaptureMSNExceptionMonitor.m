@implementation CMContinuityCaptureMSNExceptionMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)sharedMonitor
{
  if (sharedMonitor_sOnceToken != -1)
    dispatch_once(&sharedMonitor_sOnceToken, &__block_literal_global_19);
  return (id)sharedMonitor_sMonitor;
}

void __55__CMContinuityCaptureMSNExceptionMonitor_sharedMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CMContinuityCaptureMSNExceptionMonitor _init]([CMContinuityCaptureMSNExceptionMonitor alloc], "_init");
  v1 = (void *)sharedMonitor_sMonitor;
  sharedMonitor_sMonitor = (uint64_t)v0;

}

- (id)_init
{
  CMContinuityCaptureMSNExceptionMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableArray *v5;
  NSMutableArray *entityExceptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureMSNExceptionMonitor;
  v2 = -[CMContinuityCaptureMSNExceptionMonitor init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("msn-exception-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    entityExceptions = v2->_entityExceptions;
    v2->_entityExceptions = v5;

  }
  return v2;
}

- (void)incrementExceptionCountForEntity:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureMSNExceptionMonitor_incrementExceptionCountForEntity___block_invoke;
  block[3] = &unk_24F06C780;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureMSNExceptionMonitor_incrementExceptionCountForEntity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  NSObject *v6;
  __int128 v7;
  id v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  NSObject *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((v4 & 1) != 0)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v6 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v7;
      v23 = v7;
      v20 = v7;
      v21 = v7;
      v18 = v7;
      v19 = v7;
      v16 = v7;
      v17 = v7;
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    else
    {
      v8 = v3[2];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      if (dword_255924750)
      {
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v10 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v22 = v11;
        v23 = v11;
        v20 = v11;
        v21 = v11;
        v18 = v11;
        v19 = v11;
        v16 = v11;
        v17 = v11;
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

      }
      if (objc_msgSend(v3[2], "count", v14, v15) == 1)
      {
        if (dword_255924750)
        {
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v12 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v22 = v13;
          v23 = v13;
          v20 = v13;
          v21 = v13;
          v18 = v13;
          v19 = v13;
          v16 = v13;
          v17 = v13;
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

        }
        MSNMonitorBeginException();
      }
    }
  }

}

- (void)decrementExceptionCountForEntity:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureMSNExceptionMonitor_decrementExceptionCountForEntity___block_invoke;
  block[3] = &unk_24F06C780;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureMSNExceptionMonitor_decrementExceptionCountForEntity___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  __int128 v9;
  NSObject *v10;
  __int128 v11;
  NSObject *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((_DWORD)v4)
    {
      v6 = v3[2];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);

      if (dword_255924750)
      {
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v22 = v9;
        v23 = v9;
        v20 = v9;
        v21 = v9;
        v18 = v9;
        v19 = v9;
        v16 = v9;
        v17 = v9;
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

      }
      if (!objc_msgSend(v3[2], "count", v14, v15))
      {
        if (dword_255924750)
        {
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v12 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v22 = v13;
          v23 = v13;
          v20 = v13;
          v21 = v13;
          v18 = v13;
          v19 = v13;
          v16 = v13;
          v17 = v13;
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

        }
        MSNMonitorEndException();
      }
    }
    else if (dword_255924750)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v10 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v11;
      v23 = v11;
      v20 = v11;
      v21 = v11;
      v18 = v11;
      v19 = v11;
      v16 = v11;
      v17 = v11;
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
  }

}

- (void)reset
{
  NSObject *v3;
  __int128 v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  os_log_type_t type;
  int v9;
  id location[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (dword_255924750)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v4;
    v17 = v4;
    v14 = v4;
    v15 = v4;
    v12 = v4;
    v13 = v4;
    *(_OWORD *)location = v4;
    v11 = v4;
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CMContinuityCaptureMSNExceptionMonitor_reset__block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v7, location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
}

void __47__CMContinuityCaptureMSNExceptionMonitor_reset__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "removeAllObjects");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityExceptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
