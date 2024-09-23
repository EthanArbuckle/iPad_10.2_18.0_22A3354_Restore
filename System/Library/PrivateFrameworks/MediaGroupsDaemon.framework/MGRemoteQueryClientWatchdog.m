@implementation MGRemoteQueryClientWatchdog

+ (id)watchdogForTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTarget:dispatchQueue:delegate:usingSession:", v13, v12, v11, v10);

  return v14;
}

- (id)_initWithTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MGRemoteQueryClientWatchdog *v15;
  id *p_isa;
  NSObject *v17;
  _QWORD block[4];
  id *v20;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MGRemoteQueryClientWatchdog;
  v15 = -[MGRemoteQueryClientWatchdog init](&v21, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    v15->_pingLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_target, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeWeak(p_isa + 5, v13);
    objc_storeStrong(p_isa + 6, a6);
    objc_msgSend(p_isa, "dispatchQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__MGRemoteQueryClientWatchdog__initWithTarget_dispatchQueue_delegate_usingSession___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v20 = p_isa;
    dispatch_async(v17, block);

  }
  return p_isa;
}

uint64_t __83__MGRemoteQueryClientWatchdog__initWithTarget_dispatchQueue_delegate_usingSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerInit");
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryClientWatchdog _timerCancel](self, "_timerCancel");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClientWatchdog;
  -[MGRemoteQueryClientWatchdog dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientWatchdog target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientWatchdog timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientWatchdog pingClient](self, "pingClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _target = %@, _timer = %p, _ping = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__MGRemoteQueryClientWatchdog_reset__block_invoke;
  block[3] = &unk_24E0AA4F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __36__MGRemoteQueryClientWatchdog_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerReschedule");
}

- (id)pingClient
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__MGRemoteQueryClientWatchdog_pingClient__block_invoke;
  v4[3] = &unk_24E0AA728;
  v4[4] = self;
  v4[5] = &v5;
  -[MGRemoteQueryClientWatchdog _withPingLock:](self, "_withPingLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__MGRemoteQueryClientWatchdog_pingClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "ping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_timerInit
{
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);

  objc_storeStrong((id *)&self->_timer, v5);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __41__MGRemoteQueryClientWatchdog__timerInit__block_invoke;
  v9 = &unk_24E0AA750;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, &v6);
  -[MGRemoteQueryClientWatchdog _timerReschedule](self, "_timerReschedule", v6, v7, v8, v9);
  dispatch_resume(v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __41__MGRemoteQueryClientWatchdog__timerInit__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_timerFired");
    WeakRetained = v2;
  }

}

- (void)_timerReschedule
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *source;

  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientWatchdog timer](self, "timer");
  source = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_timerCancel
{
  NSObject *v2;
  NSObject *v3;

  -[MGRemoteQueryClientWatchdog timer](self, "timer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v2);
    v2 = v3;
  }

}

- (void)_timerFired
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  MGRemoteQueryClientWatchdog *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  MGLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MGRemoteQueryClientWatchdog target](self, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_DEFAULT, "%p watchdog fired, pinging target %@", (uint8_t *)&v6, 0x16u);

  }
  -[MGRemoteQueryClientWatchdog _pingStart](self, "_pingStart");
}

- (void)_pingStart
{
  NSObject *v3;
  _QWORD v4[5];

  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__MGRemoteQueryClientWatchdog__pingStart__block_invoke;
  v4[3] = &unk_24E0AA4F8;
  v4[4] = self;
  -[MGRemoteQueryClientWatchdog _withPingLock:](self, "_withPingLock:", v4);
}

void __41__MGRemoteQueryClientWatchdog__pingStart__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "ping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[MGRemoteQueryClientHandlerPing handler](MGRemoteQueryClientHandlerPing, "handler");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MGRemoteQueryClient clientWithHandler:target:dispatchQueue:delegate:usingSession:](MGRemoteQueryClient, "clientWithHandler:target:dispatchQueue:delegate:usingSession:", v3, v6, v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setPing:", v5);
    MGLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v12 = 134218242;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p watchdog pinging with %@", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_7;
  }
  MGLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "ping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_ERROR, "%p watchdog ping already in process with %@", (uint8_t *)&v12, 0x16u);
LABEL_7:

  }
}

- (void)_pingFinished:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  MGRemoteQueryClientWatchdog *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__MGRemoteQueryClientWatchdog__pingFinished___block_invoke;
  v11[3] = &unk_24E0AA4F8;
  v11[4] = self;
  -[MGRemoteQueryClientWatchdog _withPingLock:](self, "_withPingLock:", v11);
  MGLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_debug_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEBUG, "%p watchdog ping successful", buf, 0xCu);
    }

    -[MGRemoteQueryClientWatchdog _timerReschedule](self, "_timerReschedule");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClientWatchdog target](self, "target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, "%p watchdog ping failed for %@", buf, 0x16u);

    }
    -[MGRemoteQueryClientWatchdog delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "watchdogFired:", self);

  }
}

uint64_t __45__MGRemoteQueryClientWatchdog__pingFinished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPing:", 0);
}

- (void)_withPingLock:(id)a3
{
  os_unfair_lock_s *p_pingLock;
  void (**v4)(_QWORD);

  p_pingLock = &self->_pingLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_pingLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_pingLock);
}

- (void)clientInvalidated:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MGRemoteQueryClientWatchdog dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke_2;
  v9[3] = &unk_24E0AA660;
  v12 = &v13;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  objc_msgSend(v2, "_withPingLock:", v9);
  if (*((_BYTE *)v14 + 24))
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      MGLogForCategory(6);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218242;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p watchdog ping failed with error %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_pingFinished:", v5 == 0);
  }

  _Block_object_dispose(&v13, 8);
}

void __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isEqual:", v3);

}

- (MGRemoteQueryClient)ping
{
  os_unfair_lock_assert_owner(&self->_pingLock);
  return self->_ping;
}

- (void)setPing:(id)a3
{
  MGRemoteQueryClient *v5;
  MGRemoteQueryClient **p_ping;
  MGRemoteQueryClient *ping;
  char v8;
  MGRemoteQueryClient *v9;

  v9 = (MGRemoteQueryClient *)a3;
  os_unfair_lock_assert_owner(&self->_pingLock);
  v5 = v9;
  ping = self->_ping;
  p_ping = &self->_ping;
  if (ping != v9)
  {
    v8 = -[MGRemoteQueryClient isEqual:](v9, "isEqual:");
    v5 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_ping, a3);
      v5 = v9;
    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (MGRemoteQueryClientTarget)target
{
  return self->_target;
}

- (MGRemoteQueryClientWatchdogDelegate)delegate
{
  return (MGRemoteQueryClientWatchdogDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURLSession)session
{
  return self->_session;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ping, 0);
}

@end
