@implementation IRAVOutputDeviceProvider

- (void)didUpdateAVOutputDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRAVOutputDeviceProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__IRAVOutputDeviceProvider_didUpdateAVOutputDevices___block_invoke;
  v7[3] = &unk_251044D90;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __53__IRAVOutputDeviceProvider_didUpdateAVOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "cachedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v3, "setCachedDevices:", v6);

    objc_msgSend(v3, "cachedDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "observers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "provider:didUpdateAVOutputDevices:", v3, v8);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v11);
    }

    v14 = (void *)*MEMORY[0x24BE5B280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v14;
      objc_msgSend(v3, "_logDevicesString:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_DEFAULT, "#avod-provider, %@", buf, 0xCu);

    }
  }

}

- (NSSet)cachedDevices
{
  return self->_cachedDevices;
}

- (IRAVOutputDeviceProvider)init
{
  IRAVOutputDeviceProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IRAVOutputDeviceProvider;
  v2 = -[IRAVOutputDeviceProvider init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.intelligentroutingd.IRAVOutputDeviceProvider", v3);
    -[IRAVOutputDeviceProvider setQueue:](v2, "setQueue:", v4);

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRAVOutputDeviceProvider setObservers:](v2, "setObservers:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    -[IRAVOutputDeviceProvider setCachedDevices:](v2, "setCachedDevices:", v6);

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRAVOutputDeviceProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__IRAVOutputDeviceProvider_addObserver___block_invoke;
  v7[3] = &unk_251044D90;
  v8 = v4;
  v6 = v4;
  IRDispatchSyncWithStrongSelf(v5, self, v7);

}

void __40__IRAVOutputDeviceProvider_addObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v3, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "#avod-provider, ";
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "%s[%@], Registering for output devices notification", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(v3, "discoverySessionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerForAvailableOutputDevicesNotification");

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v3, "cachedDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v13, "provider:didUpdateAVOutputDevices:", v3, v15);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRAVOutputDeviceProvider queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__IRAVOutputDeviceProvider_removeObserver___block_invoke;
  v7[3] = &unk_251044D90;
  v8 = v4;
  v6 = v4;
  IRDispatchSyncWithStrongSelf(v5, self, v7);

}

void __43__IRAVOutputDeviceProvider_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v3, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v3, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v13 = 136315394;
        v14 = "#avod-provider, ";
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "%s[%@], Unregistering for output devices notification", (uint8_t *)&v13, 0x16u);
      }

      objc_msgSend(v3, "discoverySessionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unregisterForAvailableOutputDevicesNotification");

    }
  }

}

- (void)logActiveDevices
{
  id v3;

  -[IRAVOutputDeviceProvider queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_14);

}

void __44__IRAVOutputDeviceProvider_logActiveDevices__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = a2;
    objc_msgSend(v5, "cachedDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logDevicesString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#avod-provider, %@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)_logDevicesString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __46__IRAVOutputDeviceProvider__logDevicesString___block_invoke;
  v13 = &unk_251044DF8;
  v14 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10);

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("AVOD Active Devices:\n%@"), v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __46__IRAVOutputDeviceProvider__logDevicesString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "deviceID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "discoveredOverInfra"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "hasAirplayProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IRAVOutputDeviceTypeToString(objc_msgSend(v4, "deviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "deviceSubType");

  IRAVOutputDeviceSubTypeToString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ID: %@, model: %@, name: %@, infra: %@, hasAirplay: %@, type: %@, subtype: %@"), v13, v5, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

}

- (NSSet)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (IRAVOutputDeviceDiscoverySessionController)discoverySessionController
{
  return self->_discoverySessionController;
}

- (void)setDiscoverySessionController:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySessionController, a3);
}

- (void)setCachedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDevices, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_discoverySessionController, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
}

@end
