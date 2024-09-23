@implementation DKExtensionDiscovery

+ (id)discoveryUsingExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  DKExtensionDiscovery *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[DKExtensionDiscovery initWithExtensionRegistry:services:bundleIdentifier:]([DKExtensionDiscovery alloc], "initWithExtensionRegistry:services:bundleIdentifier:", v9, v8, v7);

  return v10;
}

- (DKExtensionDiscovery)initWithExtensionRegistry:(id)a3 services:(id)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  DKExtensionDiscovery *v12;
  DKExtensionDiscovery *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *discoveryQueue;
  NSCondition *v16;
  NSCondition *discoveryLock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DKExtensionDiscovery;
  v12 = -[DKExtensionDiscovery init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
    v14 = dispatch_queue_create("com.apple.DiagnosticsKit.discovery", MEMORY[0x24BDAC9C0]);
    discoveryQueue = v13->_discoveryQueue;
    v13->_discoveryQueue = (OS_dispatch_queue *)v14;

    v16 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    discoveryLock = v13->_discoveryLock;
    v13->_discoveryLock = v16;

    v13->_discoveryComplete = 0;
    objc_storeStrong((id *)&v13->_services, a4);
    if (!v13->_bundleIdentifier)
      objc_storeStrong((id *)&v13->_bundleIdentifier, CFSTR("Default"));
    -[DKExtensionDiscovery _beginExtensionDiscovery](v13, "_beginExtensionDiscovery");
  }

  return v13;
}

- (void)_beginExtensionDiscovery
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[DKExtensionDiscovery discoveryLock](self, "discoveryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[DKExtensionDiscovery setDiscoveryComplete:](self, "setDiscoveryComplete:", 0);
  -[DKExtensionDiscovery discoveryLock](self, "discoveryLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  -[DKExtensionDiscovery discoveryQueue](self, "discoveryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke;
  block[3] = &unk_24F99AA50;
  block[4] = self;
  dispatch_async(v5, block);

}

void __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke(uint64_t a1)
{
  id *v1;
  dispatch_group_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_group_t group;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  dispatch_group_t v24;
  id v25;
  id location;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = dispatch_group_create();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke_2;
  v23[3] = &unk_24F99ABD8;
  objc_copyWeak(&v25, &location);
  group = v2;
  v24 = group;
  v3 = (void *)MEMORY[0x22E320CF4](v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*v1, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    v7 = *MEMORY[0x24BDD0C48];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        dispatch_group_enter(group);
        DiagnosticsKitLogHandleForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "Starting extension matching...", buf, 2u);
        }

        v11 = (void *)MEMORY[0x24BDD1550];
        v27 = v7;
        v28 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extensionsWithMatchingAttributes:completion:", v12, v3);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v5);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "discoveryLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setDiscoveryComplete:", 1);
  objc_msgSend(*(id *)(a1 + 32), "discoveryLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "broadcast");

  objc_msgSend(*(id *)(a1 + 32), "discoveryLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __48__DKExtensionDiscovery__beginExtensionDiscovery__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint8_t v10[16];

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  DiagnosticsKitLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22DE4C000, v9, OS_LOG_TYPE_DEFAULT, "Finished extension matching.", v10, 2u);
  }

  objc_msgSend(WeakRetained, "_registerExtensions:error:", v7, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)waitUntilComplete
{
  void *v3;
  void *v4;
  id v5;

  -[DKExtensionDiscovery discoveryLock](self, "discoveryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!-[DKExtensionDiscovery discoveryComplete](self, "discoveryComplete"))
  {
    do
    {
      -[DKExtensionDiscovery discoveryLock](self, "discoveryLock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wait");

    }
    while (!-[DKExtensionDiscovery discoveryComplete](self, "discoveryComplete"));
  }
  -[DKExtensionDiscovery discoveryLock](self, "discoveryLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (void)_registerExtensions:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint8_t v25;
  _BYTE v26[15];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = v6;
  v24 = a4;
  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[DKExtensionDiscovery registry](self, "registry");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v12, "extensionClass")), "initWithExtension:", v11);

          if (!v13)
          {
            DiagnosticsKitLogHandleForCategory(1);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[DKExtensionDiscovery _registerExtensions:error:].cold.2(&v25, v26, v18);
            goto LABEL_13;
          }
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_10;
          objc_msgSend(v13, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[DKExtensionDiscovery bundleIdentifier](self, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
LABEL_10:
            +[DKExtensionAdapter extensionAdapterWithExtensionAttributes:](DKExtensionAdapter, "extensionAdapterWithExtensionAttributes:", v13);
            v18 = objc_claimAutoreleasedReturnValue();
            -[DKExtensionDiscovery registry](self, "registry");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_sync_enter(v19);
            -[DKExtensionDiscovery registry](self, "registry");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addExtensionAdapter:", v18);

            objc_sync_exit(v19);
LABEL_13:

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }
  }
  else
  {
    DiagnosticsKitLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DKExtensionDiscovery _registerExtensions:error:].cold.1(v7, v21, v22);
  }

}

- (DKExtensionRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (OS_dispatch_queue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryQueue, a3);
}

- (NSCondition)discoveryLock
{
  return self->_discoveryLock;
}

- (void)setDiscoveryLock:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryLock, a3);
}

- (BOOL)discoveryComplete
{
  return self->_discoveryComplete;
}

- (void)setDiscoveryComplete:(BOOL)a3
{
  self->_discoveryComplete = a3;
}

- (NSSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_discoveryLock, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

- (void)_registerExtensions:(uint64_t)a3 error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_22DE4C000, a1, a3, "Failed to perform extension matching.", v3);
}

- (void)_registerExtensions:(NSObject *)a3 error:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_22DE4C000, a3, (uint64_t)a3, "Extension info not valid, ignoring.", a1);
}

@end
