@implementation PHNetworkFetcher

- (PHNetworkFetcher)init
{
  PHNetworkFetcher *v2;
  NSObject *v3;
  uint64_t v4;
  NSMutableArray *mutableNetworks;
  uint64_t v6;
  id networkNotificationHandler;
  id v8;
  _QWORD v10[4];
  id v11;
  id buf[2];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PHNetworkFetcher;
  v2 = -[PHNetworkFetcher init](&v13, sel_init);
  if (v2)
  {
    PHDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher initialized", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    mutableNetworks = v2->_mutableNetworks;
    v2->_mutableNetworks = (NSMutableArray *)v4;

    v2->_state = 1;
    objc_initWeak(buf, v2);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __24__PHNetworkFetcher_init__block_invoke;
    v10[3] = &unk_24E38CCF0;
    objc_copyWeak(&v11, buf);
    v6 = MEMORY[0x2207BC210](v10);
    networkNotificationHandler = v2->_networkNotificationHandler;
    v2->_networkNotificationHandler = (id)v6;

    v8 = MEMORY[0x24BDAC9B8];
    v2->_server = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    _CTServerConnectionRegisterForNotification();
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __24__PHNetworkFetcher_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  id *v17;
  id WeakRetained;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v40 = a2;
    v41 = 2112;
    v42 = a3;
    _os_log_impl(&dword_21ED2A000, v6, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher got notification %@: %@", buf, 0x16u);
  }

  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x24BDC2BA0]))
  {
    v33 = a2;
    PHDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED2A000, v7, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher handling network list update notification", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDC2B98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          +[PHNetwork networkFromDictionary:](PHNetwork, "networkFromDictionary:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v8, "addObject:", v15);
            PHDefaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v40 = v15;
              v41 = 2112;
              v42 = v14;
              _os_log_impl(&dword_21ED2A000, v16, OS_LOG_TYPE_DEFAULT, "Added a new network to new list: %@ from dictionary: %@", buf, 0x16u);
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v11);
    }

    v17 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "mutableNetworks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v8, "isEqualToArray:", v19);

    a2 = v33;
    if ((v20 & 1) == 0)
    {
      v21 = objc_loadWeakRetained(v17);
      objc_msgSend(v21, "setMutableNetworks:", v8);

      PHDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED2A000, v22, OS_LOG_TYPE_DEFAULT, "The networks list has changed, and we will notify", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_loadWeakRetained(v17);
      objc_msgSend(v23, "postNotificationName:object:", CFSTR("PHNetworkFetcherNetworksChangedNotification"), v24);

    }
    objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDC2BA8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "BOOLValue"))
      v26 = 1;
    else
      v26 = 2;
    v27 = objc_loadWeakRetained(v17);
    objc_msgSend(v27, "setState:", v26);

  }
  PHDefaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED2A000, v28, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher will update selection status of networks in response to notification", buf, 2u);
  }

  v29 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v29, "updateNetworkSelectionStatus");

  if (objc_msgSend(a2, "isEqualToString:", *MEMORY[0x24BDC2BB0]))
  {
    PHDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED2A000, v30, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher handling network list failure notification", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "postNotificationName:object:", CFSTR("PHNetworkFetcherErrorNotification"), 0);

    v32 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v32, "setState:", 1);

  }
}

- (NSArray)networks
{
  void *v2;
  void *v3;

  -[PHNetworkFetcher mutableNetworks](self, "mutableNetworks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)fetchNetworkList
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkListFetcher beginning list fetch", v5, 2u);
  }

  if (-[PHNetworkFetcher state](self, "state") == 1)
  {
    -[NSMutableArray removeAllObjects](self->_mutableNetworks, "removeAllObjects");
    -[PHNetworkFetcher setState:](self, "setState:", 2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("PHNetworkFetcherNetworksChangedNotification"), self);

    _CTServerConnectionFetchNetworkList();
  }
}

- (void)updateNetworkSelectionStatus
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE buf[12];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher updating network selection status", buf, 2u);
  }

  v23 = 0;
  -[PHNetworkFetcher server](self, "server");
  _CTServerConnectionCopyManualNetworkSelection();
  v4 = 0;
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BDC2B90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PHNetworkFetcher mutableNetworks](self, "mutableNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v18 = v4;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x24BDC2BF0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "code");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if (v14)
        {
          *(_QWORD *)buf = 0;
          _CTServerConnectionGetNetworkSelectionState();
          if (objc_msgSend(*(id *)buf, "isEqualToString:", v10))
            v15 = 2;
          else
            v15 = 3;
          v16 = v12;
        }
        else
        {
          v16 = v12;
          v15 = 1;
        }
        objc_msgSend(v16, "setState:", v15);
        PHDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v12;
          _os_log_impl(&dword_21ED2A000, v17, OS_LOG_TYPE_DEFAULT, "... updated network object: %@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PHNetworkFetcherNetworkSelectionChangedNotification"), 0);
    v4 = v18;
  }

}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    self->_state = a3;
    PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher state changed to %lu", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PHNetworkFetcherStateChangedNotification"), self);

  }
}

- (void)selectNetwork:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "PHNetworkFetcher asked to select network %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHNetworkFetcher server](self, "server");
  objc_msgSend(v4, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CTServerConnectionSelectNetwork();

  -[PHNetworkFetcher updateNetworkSelectionStatus](self, "updateNetworkSelectionStatus");
}

- (void)dealloc
{
  objc_super v3;

  _CTServerConnectionUnregisterForAllNotifications();
  v3.receiver = self;
  v3.super_class = (Class)PHNetworkFetcher;
  -[PHNetworkFetcher dealloc](&v3, sel_dealloc);
}

- (unint64_t)state
{
  return self->_state;
}

- (__CTServerConnection)server
{
  return self->_server;
}

- (void)setServer:(__CTServerConnection *)a3
{
  self->_server = a3;
}

- (NSMutableArray)mutableNetworks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMutableNetworks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)networkNotificationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworkNotificationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkNotificationHandler, 0);
  objc_storeStrong((id *)&self->_mutableNetworks, 0);
}

@end
