@implementation MGClientConnectionProvider

- (MGClientConnectionProvider)init
{
  MGClientConnectionProvider *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v17;
  id location;
  objc_super v19;
  uint8_t buf[4];
  MGClientConnectionProvider *v21;
  __int16 v22;
  uint32_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)MGClientConnectionProvider;
  v2 = -[MGClientConnectionProvider init](&v19, sel_init);
  if (v2)
  {
    MGLogForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v2;
      _os_log_impl(&dword_2172B2000, v3, OS_LOG_TYPE_DEFAULT, "%p connection provider initializing", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.MediaGroups.%p-queue"), v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v5);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v2->_notifyToken = -1;
    -[MGClientConnectionProvider serviceName](v2, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".ready"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = v2->_dispatchQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __34__MGClientConnectionProvider_init__block_invoke;
    handler[3] = &unk_24D726AC0;
    objc_copyWeak(&v17, &location);
    v13 = notify_register_dispatch(v11, &v2->_notifyToken, v12, handler);

    if (v13)
    {
      MGLogForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v21 = v2;
        v22 = 1024;
        v23 = v13;
        _os_log_error_impl(&dword_2172B2000, v14, OS_LOG_TYPE_ERROR, "%p connection provider failed to register notification handler (%u)", buf, 0x12u);
      }

    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __34__MGClientConnectionProvider_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MGLogForCategory(1);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_2172B2000, v2, OS_LOG_TYPE_DEFAULT, "%p connection provider received ready notification", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "connectionProviderServiceAvailable:", WeakRetained);

  }
}

- (void)dealloc
{
  int notifyToken;
  NSObject *v4;
  objc_super v5;
  _QWORD v6[5];
  uint8_t buf[4];
  MGClientConnectionProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__MGClientConnectionProvider_dealloc__block_invoke;
  v6[3] = &unk_24D726AE8;
  v6[4] = self;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
  MGLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_2172B2000, v4, OS_LOG_TYPE_DEFAULT, "%p connection provider deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)MGClientConnectionProvider;
  -[MGClientConnectionProvider dealloc](&v5, sel_dealloc);
}

void __37__MGClientConnectionProvider_dealloc__block_invoke(uint64_t a1)
{
  -[MGClientConnectionProvider _unsafe_setServiceConnection:](*(id **)(a1 + 32), 0);
}

- (void)_unsafe_setServiceConnection:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;
  uint8_t buf[4];
  id *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v6 = a1 + 3;
    if (a1[3] != v4 && (objc_msgSend(v4, "isEqual:") & 1) == 0)
    {
      if (*v6)
      {
        objc_msgSend(*v6, "setInvalidationHandler:", 0);
        objc_msgSend(*v6, "setInterruptionHandler:", 0);
        objc_msgSend(*v6, "invalidate");
        MGLogForCategory(1);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = a1[3];
          *(_DWORD *)buf = 134218240;
          v23 = a1;
          v24 = 2048;
          v25 = v8;
          _os_log_impl(&dword_2172B2000, v7, OS_LOG_TYPE_DEFAULT, "%p invalidating connection %p", buf, 0x16u);
        }

      }
      objc_storeStrong(a1 + 3, a2);
      if (*v6)
      {
        objc_initWeak(&location, a1);
        objc_initWeak(&from, a1[3]);
        v9 = a1[3];
        v10 = MEMORY[0x24BDAC760];
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke;
        v17[3] = &unk_24D726B60;
        objc_copyWeak(&v18, &location);
        objc_copyWeak(&v19, &from);
        objc_msgSend(v9, "setInterruptionHandler:", v17);
        v11 = *v6;
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke_14;
        v14[3] = &unk_24D726B60;
        objc_copyWeak(&v15, &location);
        objc_copyWeak(&v16, &from);
        objc_msgSend(v11, "setInvalidationHandler:", v14);
        MGLogForCategory(1);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = a1[3];
          *(_DWORD *)buf = 134218240;
          v23 = a1;
          v24 = 2048;
          v25 = v13;
          _os_log_impl(&dword_2172B2000, v12, OS_LOG_TYPE_DEFAULT, "%p established new connection %p", buf, 0x16u);
        }

        objc_destroyWeak(&v16);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&v19);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  void (**v3)(_QWORD);

  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (MGClientConnectionProviderDelegateProtocol)delegate
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__MGClientConnectionProvider_delegate__block_invoke;
  v4[3] = &unk_24D726B10;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MGClientConnectionProviderDelegateProtocol *)v2;
}

void __38__MGClientConnectionProvider_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MGClientConnectionProvider *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__MGClientConnectionProvider_setDelegate___block_invoke;
  v6[3] = &unk_24D726B38;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);

}

void __42__MGClientConnectionProvider_setDelegate___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  v2 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));

  if (v2 != WeakRetained)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
}

- (id)serviceName
{
  return CFSTR("com.apple.MediaGroups.daemon");
}

- (id)_createServiceConnection
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  -[MGClientConnectionProvider serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", v4, 4096);

  return v5;
}

- (NSXPCConnection)serviceConnection
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__MGClientConnectionProvider_serviceConnection__block_invoke;
  v4[3] = &unk_24D726B10;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __47__MGClientConnectionProvider_serviceConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createServiceConnection");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    -[MGClientConnectionProvider _unsafe_setServiceConnection:](*(id **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

- (void)setServiceConnection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__MGClientConnectionProvider_setServiceConnection___block_invoke;
  v6[3] = &unk_24D726B38;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);

}

void __51__MGClientConnectionProvider_setServiceConnection___block_invoke(uint64_t a1)
{
  -[MGClientConnectionProvider _unsafe_setServiceConnection:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

void __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MGLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = WeakRetained;
      _os_log_error_impl(&dword_2172B2000, v4, OS_LOG_TYPE_ERROR, "%p service interrupted!", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "setServiceConnection:", 0);
    if (v3)
    {
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "connectionProvider:serviceLost:", WeakRetained, v3);

    }
  }

}

void __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MGLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = WeakRetained;
      _os_log_error_impl(&dword_2172B2000, v4, OS_LOG_TYPE_ERROR, "%p invalidated connection!", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "setServiceConnection:", 0);
    if (v3)
    {
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "connectionProvider:serviceLost:", WeakRetained, v3);

    }
  }

}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
