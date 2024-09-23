@implementation IRXPCServicesManager

- (IRXPCServicesManager)init
{
  IRXPCServicesManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *xpcQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IRXPCServicesManager;
  v2 = -[IRXPCServicesManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.intelligentroutingd.xpcQueue", v3);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v4;

    -[IRXPCServicesManager _createServices](v2, "_createServices");
    -[IRXPCServicesManager _setupXPCListeners](v2, "_setupXPCListeners");
  }
  return v2;
}

- (void)startServices
{
  NSMutableArray *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  void *v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_listeners;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    v7 = (os_log_t *)MEMORY[0x24BE5B270];
    *(_QWORD *)&v4 = 138412290;
    v13 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v9, "serviceName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v13;
          v19 = v12;
          _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] resuming listener for mach service: %@", buf, 0xCu);

        }
        objc_msgSend(v9, "resume", v13, (_QWORD)v14);
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

- (void)_createServices
{
  NSMutableDictionary *v3;
  NSMutableDictionary *machServices;
  NSMutableArray *v5;
  NSMutableArray *listeners;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  machServices = self->_machServices;
  self->_machServices = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  listeners = self->_listeners;
  self->_listeners = v5;

  +[IRRecommendationService serviceWithQueue:](IRRecommendationService, "serviceWithQueue:", self->_xpcQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "machServicesNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    v13 = (os_log_t *)MEMORY[0x24BE5B270];
    *(_QWORD *)&v10 = 138412290;
    v17 = v10;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        v16 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v23 = v15;
          _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] creating recommendation mach service with name: %@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v7, v15, v17);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

}

- (void)_setupXPCListeners
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE5B270];
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] setting up XPC listeners", buf, 2u);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_machServices, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] setting up XPC listener for mach service: %@", buf, 0xCu);
        }
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v10);
        objc_msgSend(v12, "setDelegate:", self);
        -[NSMutableArray addObject:](self->_listeners, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSMutableDictionary *machServices;
  void *v11;
  void *v12;
  char v13;
  os_log_t v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE5B270];
  v9 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] listener shouldAcceptNewConnection. Connection: %@", (uint8_t *)&v16, 0xCu);
  }
  machServices = self->_machServices;
  objc_msgSend(v7, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](machServices, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v12, "shouldAcceptNewConnection:", v7);
  }
  else
  {
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[IRXPCServicesManager listener:shouldAcceptNewConnection:].cold.1(v14, v7);
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_machServices, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_ERROR, "[ErrorId - Service listener  error] [IRXPCServicesManager] no service listening for %@, connection: %@", (uint8_t *)&v5, 0x16u);

}

@end
