@implementation CAFCarManager

- (CAFCarManager)init
{
  void *v3;
  CAFCarManager *v4;

  CAFAppIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAFCarManager initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (CAFCarManager)initWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  CAFCarManagerMutableConfiguration *v6;
  CAFCarManager *v7;

  v4 = a3;
  CAFCarManagerLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager initWithIdentifier:].cold.1();

  v6 = -[CAFCarManagerMutableConfiguration initWithIdentifier:]([CAFCarManagerMutableConfiguration alloc], "initWithIdentifier:", v4);
  v7 = -[CAFCarManager initWithConfig:](self, "initWithConfig:", v6);

  return v7;
}

- (CAFCarManager)initWithRegistrationFilePath:(id)a3
{
  NSObject *v4;
  void *v5;
  CAFCarManager *v6;

  CAFCarManagerLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager initWithRegistrationFilePath:].cold.1();

  CAFAppIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAFCarManager initWithIdentifier:](self, "initWithIdentifier:", v5);

  return v6;
}

- (CAFCarManager)initWithConfig:(id)a3
{
  id v4;
  CAFCarManager *v5;
  CAFCarManager *v6;
  uint64_t v7;
  CAFCarManagerConfiguration *config;
  uint64_t v9;
  CARObserverHashTable *observers;
  id v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD handler[4];
  id v37;
  id location;
  objc_super v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CAFCarManager;
  v5 = -[CAFCarManager init](&v39, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_connectionLock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    config = v6->_config;
    v6->_config = (CAFCarManagerConfiguration *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_25682E9A8);
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v9;

    objc_initWeak(&location, v6);
    v11 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __32__CAFCarManager_initWithConfig___block_invoke;
    handler[3] = &unk_2508FE5A0;
    objc_copyWeak(&v37, &location);
    v12 = notify_register_dispatch("com.apple.private.caraccessoryframework.cardata.available", &v6->_carDataToken, MEMORY[0x24BDAC9B8], handler);

    if (v12)
    {
      CAFGeneralLogging();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CAFCarManager initWithConfig:].cold.2(v12, v13);

    }
    -[CAFCarManager _setupCafdConnectionIfAvailable](v6, "_setupCafdConnectionIfAvailable");
    CAFCarManagerLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CAFCarManager initWithConfig:].cold.1();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[CAFCarManager config](v6, "config");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registrations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "treeLogLines");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v33;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v20);
          CAFRegistrationLogging();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v21;
            _os_log_debug_impl(&dword_237717000, v22, OS_LOG_TYPE_DEBUG, "registrations %{public}@", buf, 0xCu);
          }

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = objc_msgSend(&unk_250958620, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(&unk_250958620);
          objc_msgSend(v23, "addObserver:selector:name:object:", v6, sel__didReceiveLifecycleNotification_, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0);
        }
        v24 = objc_msgSend(&unk_250958620, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v24);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __32__CAFCarManager_initWithConfig___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CAFCarManagerLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __32__CAFCarManager_initWithConfig___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "_setupCafdConnectionIfAvailable");
  }

}

- (void)_didReceiveLifecycleNotification:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  CAFCarManagerLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager _didReceiveLifecycleNotification:].cold.1((uint64_t)self, v4, v5);

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCarManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCarManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFCarManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarManager currentCar](self, "currentCar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p config=[%@] car=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)dealloc
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[CAFCarManager dealloc]";
  OUTLINED_FUNCTION_9_1(&dword_237717000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)_setupCafdConnectionIfAvailable
{
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("YES");
  if ((a2 & 1) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(a1, "connectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(a1, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = &stru_2508FF798;
  if (v9)
  {
    objc_msgSend(a1, "connectionProxy");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString invalidated](v5, "invalidated"))
      v10 = CFSTR(" (INVALIDATED)");
  }
  v11 = 136316162;
  v12 = "-[CAFCarManager _setupCafdConnectionIfAvailable]";
  v13 = 2114;
  v14 = a1;
  v15 = 2112;
  v16 = v6;
  v17 = 2112;
  v18 = v8;
  v19 = 2112;
  v20 = v10;
  _os_log_debug_impl(&dword_237717000, a3, OS_LOG_TYPE_DEBUG, "%s %{public}@: carDataAvailable %@ connectionProxy %@%@", (uint8_t *)&v11, 0x34u);
  if (v9)

}

- (void)_closeConnectionWithReason:(id)a3
{
  os_unfair_lock_s *p_connectionLock;
  id v5;

  p_connectionLock = &self->_connectionLock;
  v5 = a3;
  os_unfair_lock_lock(p_connectionLock);
  -[CAFCarManager _locked_closeConnectionWithReason:](self, "_locked_closeConnectionWithReason:", v5);

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)_locked_closeConnectionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  -[CAFCarManager currentCar](self, "currentCar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFCarManager observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "carManagerWillUpdateCar:", self);

    -[CAFCarManager currentCar](self, "currentCar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[CAFCarManager setCurrentCar:](self, "setCurrentCar:", 0);
    -[CAFCarManager observers](self, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "carManager:didUpdateCurrentCar:", self, 0);

  }
  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  CAFCarManagerLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager _locked_closeConnectionWithReason:].cold.1();

}

- (BOOL)shouldAllocAccessoryType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;

  v4 = a3;
  -[CAFCarManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "sparseTree") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CAFCarManager config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasAccessory:", v4);

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  CAFRegistrationLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager shouldAllocAccessoryType:].cold.1((uint64_t)v4, v9);

  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[CAFCarManager config](self, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "sparseTree"))
  {
    -[CAFCarManager config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registrations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasAccessory:service:", v6, v8);

  }
  else
  {
    v12 = 1;
  }

  v29 = v12;
  if (!*((_BYTE *)v27 + 24))
    goto LABEL_7;
  -[CAFCarManager config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registrations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nodeForAccessory:serviceType:", v6, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "children");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke;
  v21[3] = &unk_2508FE5F0;
  v22 = v7;
  v23 = v6;
  v24 = v8;
  v25 = &v26;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);

  if (*((_BYTE *)v27 + 24))
  {
    v17 = 1;
  }
  else
  {
LABEL_7:
    CAFRegistrationLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v6);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v8);
      objc_claimAutoreleasedReturnValue();
      -[CAFCarManager shouldAllocAccessoryType:serviceConfig:].cold.1();
    }

    v17 = *((_BYTE *)v27 + 24) != 0;
  }
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "registeredValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("characteristics"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (v11)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_97;
      v17[3] = &unk_2508FE5C8;
      v18 = v7;
      v19 = &v20;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

    }
    if (v21[5])
    {
      if ((objc_msgSend(v9, "containsObject:") & 1) != 0)
      {
LABEL_15:

        _Block_object_dispose(&v20, 8);
        goto LABEL_16;
      }
      CAFRegistrationLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", *(_QWORD *)(a1 + 40));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", *(_QWORD *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v21[5];
        *(_DWORD *)buf = 138544130;
        v27 = v13;
        v28 = 2114;
        v29 = v14;
        v30 = 2114;
        v31 = v15;
        v32 = 2114;
        v33 = v9;
        _os_log_debug_impl(&dword_237717000, v12, OS_LOG_TYPE_DEBUG, "characteristic %{public}@.%{public}@ value %{public}@ is not in registered values %{public}@", buf, 0x2Au);

      }
    }
    else
    {
      CAFRegistrationLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", *(_QWORD *)(a1 + 40));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", *(_QWORD *)(a1 + 48));
        objc_claimAutoreleasedReturnValue();
        __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_cold_1();
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_15;
  }
LABEL_16:

}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_97(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a2;
  objc_opt_class();
  v12 = v6;
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("initialValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *a4 = 1;
    }

  }
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 characteristicType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAFCarManager config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "sparseTree") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CAFCarManager config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registrations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasAccessory:service:characteristic:", v8, v9, v10);

  if ((v14 & 1) != 0)
  {
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  CAFRegistrationLogging();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFCharacteristicTypes characteristicNameForType:](CAFCharacteristicTypes, "characteristicNameForType:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v18;
    v23 = 2114;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    _os_log_debug_impl(&dword_237717000, v15, OS_LOG_TYPE_DEBUG, "should not allocate characteristic %{public}@.%{public}@.%{public}@", (uint8_t *)&v21, 0x20u);

  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)shouldAllocAccessoryType:(id)a3 serviceType:(id)a4 controlType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAFCarManager config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "sparseTree") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CAFCarManager config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registrations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasAccessory:service:control:", v8, v9, v10);

  if ((v14 & 1) != 0)
  {
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  CAFRegistrationLogging();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFControlTypes controlNameForType:](CAFControlTypes, "controlNameForType:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v18;
    v23 = 2114;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    _os_log_debug_impl(&dword_237717000, v15, OS_LOG_TYPE_DEBUG, "should not allocate control %{public}@.%{public}@.%{public}@", (uint8_t *)&v21, 0x20u);

  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)shouldInitializeCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CAFCarManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v10, v11);
  return (char)v4;
}

- (BOOL)shouldInitializeControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CAFCarManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "hasAccessory:service:control:", v8, v10, v11);
  return (char)v4;
}

- (void)_updateCar
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint8_t v12[24];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "currentCar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  v13 = v8;
  v14 = v10;
  v15 = v11;
  _os_log_debug_impl(&dword_237717000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ updating car! currentCar.uniqueIdentifier=%@ rawCar.uniqueIdentifier=%@ connectionProxy=%@", v12, 0x2Au);

  OUTLINED_FUNCTION_6_1();
}

- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  CAFRequestResponseLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager requestControl:value:response:].cold.1();

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestPluginID:instanceID:value:priority:withResponse:", v14, v15, v10, v16, v9);

}

- (void)notifyControl:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  CAFRequestResponseLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager notifyControl:value:].cold.1();

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "priority");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyPluginID:instanceID:value:priority:", v11, v12, v7, v13);

}

- (void)handleResponse:(id)a3 instanceID:(id)a4 response:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  CAFCharacteristicValue *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CAFCharacteristicValue *v14;
  CAFCharacteristicValue *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v17, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = [CAFCharacteristicValue alloc];
        objc_msgSend(v17, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[CAFCharacteristicValue initWithValue:error:](v10, "initWithValue:error:", 0, v11);
      }
      else
      {
        objc_msgSend(v17, "values");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_8;
        objc_msgSend(v17, "values");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (CAFCharacteristicValue *)v12;

      if (v14)
      {
LABEL_9:
        v8[2](v8, v14);

        goto LABEL_10;
      }
    }
LABEL_8:
    v15 = [CAFCharacteristicValue alloc];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 7, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CAFCharacteristicValue initWithValue:error:](v15, "initWithValue:error:", 0, v16);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)readCharacteristic:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  CAFRequestResponseLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager readCharacteristic:response:].cold.1();

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readInstanceIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "priority");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __45__CAFCarManager_readCharacteristic_response___block_invoke;
  v16[3] = &unk_2508FE618;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v10, "readFromPluginID:instanceIDs:priority:withResponse:", v11, v12, v13, v16);

}

void __45__CAFCarManager_readCharacteristic_response___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CAFRequestResponseLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager writeCharacteristic:value:response:].cold.1();

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "remoteProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14;
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __52__CAFCarManager_writeCharacteristic_value_response___block_invoke;
  v21[3] = &unk_2508FE618;
  v21[4] = self;
  v22 = v8;
  v23 = v10;
  v18 = v10;
  v19 = v8;
  objc_msgSend(v12, "writeToPluginID:values:priority:withResponse:", v13, v16, v17, v21);

  if (!v9)
}

void __52__CAFCarManager_writeCharacteristic_value_response___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  CAFRequestResponseLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager enableNotificationForCharacteristic:enable:response:].cold.1(v6, v8);

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registrationInstanceIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke;
    v25[3] = &unk_2508FE618;
    v16 = &v26;
    v25[4] = self;
    v26 = v8;
    v17 = &v27;
    v27 = v9;
    v18 = v9;
    v19 = v8;
    objc_msgSend(v12, "addRegistrationToPluginID:instanceIDs:priority:withResponse:", v13, v14, v15, v25);
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke_2;
    v22[3] = &unk_2508FE618;
    v16 = &v23;
    v22[4] = self;
    v23 = v8;
    v17 = &v24;
    v24 = v9;
    v20 = v9;
    v21 = v8;
    objc_msgSend(v12, "removeRegistrationFromPluginID:instanceIDs:priority:withResponse:", v13, v14, v15, v22);
  }

}

void __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

void __69__CAFCarManager_enableNotificationForCharacteristic_enable_response___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  CAFRequestResponseLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CAFCarManager enableNotificationForControl:enable:response:].cold.1(v6, v8);

  -[CAFCarManager connectionProxy](self, "connectionProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registrationInstanceIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke;
    v25[3] = &unk_2508FE618;
    v16 = &v26;
    v25[4] = self;
    v26 = v8;
    v17 = &v27;
    v27 = v9;
    v18 = v9;
    v19 = v8;
    objc_msgSend(v12, "addRegistrationToPluginID:instanceIDs:priority:withResponse:", v13, v14, v15, v25);
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke_2;
    v22[3] = &unk_2508FE618;
    v16 = &v23;
    v22[4] = self;
    v23 = v8;
    v17 = &v24;
    v24 = v9;
    v20 = v9;
    v21 = v8;
    objc_msgSend(v12, "removeRegistrationFromPluginID:instanceIDs:priority:withResponse:", v13, v14, v15, v22);
  }

}

void __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

void __62__CAFCarManager_enableNotificationForControl_enable_response___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "instanceID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:instanceID:response:", v5, v6, a1[6]);

}

- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CAFRequestResponseLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CAFCarManager performGroupedRequest:key:value:withResponse:].cold.1();

    -[CAFCarManager connectionProxy](self, "connectionProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pluginID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "priority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "readFromPluginID:instanceIDs:priority:withResponse:", v17, v12, v18, v13);
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CAFRequestResponseLogging();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CAFCarManager performGroupedRequest:key:value:withResponse:].cold.2();

    -[CAFCarManager connectionProxy](self, "connectionProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pluginID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "priority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addRegistrationToPluginID:instanceIDs:priority:withResponse:", v17, v12, v18, v13);
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CAFRequestResponseLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CAFCarManager performGroupedRequest:key:value:withResponse:].cold.3();

    -[CAFCarManager connectionProxy](self, "connectionProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pluginID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "priority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeRegistrationFromPluginID:instanceIDs:priority:withResponse:", v17, v12, v18, v13);
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CAFRequestResponseLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[CAFCarManager performGroupedRequest:key:value:withResponse:].cold.4();

    -[CAFCarManager connectionProxy](self, "connectionProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pluginID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "priority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToPluginID:values:priority:withResponse:", v17, v12, v18, v13);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, v0, v1, "%{public}@ time to invalidate", v2);
  OUTLINED_FUNCTION_6();
}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
  objc_storeStrong(&self->_observableCache, a3);
}

- (CAFCar)currentCar
{
  return self->_currentCar;
}

- (void)setCurrentCar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCar, a3);
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CAFCarManagerConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)carDataToken
{
  return self->_carDataToken;
}

- (void)setCarDataToken:(int)a3
{
  self->_carDataToken = a3;
}

- (_CAFCarDataClientProxy)connectionProxy
{
  return self->_connectionProxy;
}

- (void)setConnectionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentCar, 0);
  objc_storeStrong(&self->_observableCache, 0);
}

- (void)initWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, v0, v1, "init with identifier of %@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)initWithRegistrationFilePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "plist registation requested, using identifier instead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_5(&dword_237717000, v0, v1, "%s %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_6();
}

- (void)initWithConfig:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "Unable to register for car data available notifications (%i)", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_15();
}

void __32__CAFCarManager_initWithConfig___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "Received car data available notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)_didReceiveLifecycleNotification:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_5(&dword_237717000, a3, v6, "%{public}@ notification %@ fired, trigger refresh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

- (void)_locked_closeConnectionWithReason:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_11_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_237717000, v2, OS_LOG_TYPE_DEBUG, "%s %{public}@: connection cleared for %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)shouldAllocAccessoryType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, a2, v4, "should not allocate accessory %{public}@", v5);

  OUTLINED_FUNCTION_12();
}

- (void)shouldAllocAccessoryType:serviceConfig:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_5(&dword_237717000, v7, v5, "should not allocate service %{public}@.%{public}@", v6);

}

void __56__CAFCarManager_shouldAllocAccessoryType_serviceConfig___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_5(&dword_237717000, v7, v5, "characteristic %{public}@.%{public}@ value is not available!", v6);

}

- (void)requestControl:value:response:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v2, "pluginID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22(), "instanceID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_23(), "priority");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Request pluginID: %@ instanceID: %@ with priority: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)notifyControl:value:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v2, "pluginID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22(), "instanceID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_23(), "priority");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Notify pluginID: %@ instanceID: %@ value with priority: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)readCharacteristic:response:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v2, "pluginID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22(), "instanceID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_23(), "priority");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Read characteristic pluginID: %@ instanceID: %@ value with priority: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)writeCharacteristic:value:response:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "priority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12_0(&dword_237717000, v5, v6, "Write characteristic pluginID: %@ instanceID: %@ value: %@ with priority: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6_1();
}

- (void)enableNotificationForCharacteristic:(uint64_t)a1 enable:(void *)a2 response:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a2, "pluginID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22(), "instanceID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_23(), "priority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0(&dword_237717000, v5, v6, "%@ notification characteristic pluginID: %@ instanceID: %@ with priority: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6_1();
}

- (void)enableNotificationForControl:(uint64_t)a1 enable:(void *)a2 response:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a2, "pluginID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22(), "instanceID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_23(), "priority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12_0(&dword_237717000, v5, v6, "%@ notification control pluginID: %@ instanceID: %@ with priority: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6_1();
}

- (void)performGroupedRequest:key:value:withResponse:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "priority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v3, v4, "Perform group read request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)performGroupedRequest:key:value:withResponse:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "priority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v3, v4, "Perform group register request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)performGroupedRequest:key:value:withResponse:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "priority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v3, v4, "Perform group unregister request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)performGroupedRequest:key:value:withResponse:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "priority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v3, v4, "Perform group write request pluginID: %@ instanceID count: %lu with priority: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
