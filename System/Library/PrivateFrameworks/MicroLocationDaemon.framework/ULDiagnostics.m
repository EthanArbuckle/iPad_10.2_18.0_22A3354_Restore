@implementation ULDiagnostics

- (ULDiagnostics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithLabel_);
}

- (ULDiagnostics)initWithLabel:(id)a3
{
  id v4;
  ULDiagnostics *v5;
  ULDiagnostics *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ULDiagnostics;
  v5 = -[ULDiagnostics init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ULDiagnostics setLabel:](v5, "setLabel:", v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.milod.ULDiagnostics", v7);
    -[ULDiagnostics setQueue:](v6, "setQueue:", v8);

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDiagnostics setProviders:](v6, "setProviders:", v9);

    -[ULDiagnostics setProvidersLock:](v6, "setProvidersLock:", 0);
    -[ULDiagnostics _registerStateHandler](v6, "_registerStateHandler");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ULDiagnostics stateHandle](self, "stateHandle");
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)ULDiagnostics;
  -[ULDiagnostics dealloc](&v3, sel_dealloc);
}

- (void)addProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ULDiagnostics *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__ULDiagnostics_addProvider___block_invoke;
  v6[3] = &unk_2511D2CA8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ULDiagnostics _withLock:](self, "_withLock:", v6);

}

void __29__ULDiagnostics_addProvider___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_67);
  v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Adding provider: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)removeProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ULDiagnostics *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__ULDiagnostics_removeProvider___block_invoke;
  v6[3] = &unk_2511D2CA8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ULDiagnostics _withLock:](self, "_withLock:", v6);

}

void __32__ULDiagnostics_removeProvider___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_67);
  v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Removing provider: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)_registerStateHandler
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ULDiagnostics queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v5, &location);
  -[ULDiagnostics setStateHandle:](self, "setStateHandle:", os_state_add_handler(), v4, 3221225472, __38__ULDiagnostics__registerStateHandler__block_invoke, &unk_2511D8F60);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __38__ULDiagnostics__registerStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_67);
    v5 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(WeakRetained, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "Processing os_state handler for label: %@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(WeakRetained, "_diagnosticsInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_67);
    v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(WeakRetained, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "label: %@, os_state: %@", (uint8_t *)&v13, 0x16u);

    }
  }

  return 0;
}

- (id)_diagnosticsInfo
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__ULDiagnostics__diagnosticsInfo__block_invoke;
  v19[3] = &unk_2511D2E30;
  v19[4] = self;
  v19[5] = &v20;
  -[ULDiagnostics _withLock:](self, "_withLock:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)v21[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x24BDBD1B8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "diagnosticInfo", (_QWORD)v15);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = v9;
        else
          v11 = v7;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v20, 8);
  return v3;
}

void __33__ULDiagnostics__diagnosticsInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "providers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (os_state_data_s)_stateDataForInfo:(id)a3
{
  void *v4;
  id v5;
  unsigned int v6;
  NSObject *v7;
  os_state_data_s *v8;
  unsigned int v9;
  size_t v10;
  id v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = objc_msgSend(v4, "length");
  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_67);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "Error in NSPropertyListSerialization: %@", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v9 = v6;
    v10 = v6;
    v8 = (os_state_data_s *)malloc_type_calloc(1uLL, v6 + 200, 0xA516B772uLL);
    v8->var0 = 1;
    v8->var1.var1 = v9;
    -[ULDiagnostics label](self, "label");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    __strlcpy_chk();

    memcpy(v8->var4, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v10);
  }

  return v8;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_providersLock;
  void (**v4)(_QWORD);

  p_providersLock = &self->_providersLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_providersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_providersLock);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)providersLock
{
  return self->_providersLock;
}

- (void)setProvidersLock:(os_unfair_lock_s)a3
{
  self->_providersLock = a3;
}

- (NSHashTable)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
