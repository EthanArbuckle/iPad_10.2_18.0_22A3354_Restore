@implementation HSBrowser

- (HSBrowser)initWithBrowserType:(int64_t)a3 groupID:(id)a4
{
  id v7;
  void *v8;
  HSBrowser *v9;
  HSBrowser *v10;
  uint64_t v11;
  NSMutableArray *availableLibraries;
  uint64_t v13;
  NSMutableArray *resolvingServices;
  uint64_t v15;
  NSMutableArray *librariesPendingRemoval;
  dispatch_queue_t v17;
  OS_dispatch_queue *serviceBrowserQueue;
  const __CFString *v19;
  NSString *serviceType;
  void *v22;
  objc_super v23;

  v7 = a4;
  v8 = v7;
  if (!a3 && !objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSBrowser.m"), 36, CFSTR("Home Sharing group ID is required for browser type HSBrowserTypeHomeSharing."));

  }
  v23.receiver = self;
  v23.super_class = (Class)HSBrowser;
  v9 = -[HSBrowser init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_browserType = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    availableLibraries = v10->_availableLibraries;
    v10->_availableLibraries = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    resolvingServices = v10->_resolvingServices;
    v10->_resolvingServices = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    librariesPendingRemoval = v10->_librariesPendingRemoval;
    v10->_librariesPendingRemoval = (NSMutableArray *)v15;

    v17 = dispatch_queue_create("com.apple.HomeSharing.HSBrowser.serviceBrowserQueue", 0);
    serviceBrowserQueue = v10->_serviceBrowserQueue;
    v10->_serviceBrowserQueue = (OS_dispatch_queue *)v17;

    if (a3)
    {
      v19 = CFSTR("_daap._tcp");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_home-sharing._tcp,_%@"), v8);
      v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    serviceType = v10->_serviceType;
    v10->_serviceType = &v19->isa;

  }
  return v10;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HSBrowser serviceBrowserQueue](self, "serviceBrowserQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __18__HSBrowser_start__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[HSBrowser serviceBrowserQueue](self, "serviceBrowserQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__HSBrowser_stop__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD10E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218240;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v8, "longLongValue");
    _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_ERROR, "Service browser: %p failed to search with error code: %lld", (uint8_t *)&v9, 0x16u);

  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v7;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_20AA9E000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p found service with name: '%{public}@'", (uint8_t *)&v13, 0x16u);

  }
  -[HSBrowser resolvingServices](self, "resolvingServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleInRunLoop:forMode:", v12, *MEMORY[0x24BDBCB80]);

  objc_msgSend(v8, "resolveWithTimeout:", 10.0);
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v31 = v7;
    v32 = 2114;
    v33 = v10;
    _os_log_impl(&dword_20AA9E000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p removed service with name: '%{public}@'", buf, 0x16u);

  }
  v23 = v7;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDBCB80];
  objc_msgSend(v8, "removeFromRunLoop:forMode:", v11);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = (void *)-[NSMutableArray copy](self->_availableLibraries, "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "service", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", v8);

        if (v19)
        {
          -[HSBrowser librariesPendingRemoval](self, "librariesPendingRemoval");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v17);

          objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__removalTimerFired_, v17, 0, 2.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addTimer:forMode:", v21, v24);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

}

- (void)_removalTimerFired:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HSBrowser *v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HSBrowser librariesPendingRemoval](self, "librariesPendingRemoval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[HSBrowser librariesPendingRemoval](self, "librariesPendingRemoval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);

    -[HSBrowser availableLibraries](self, "availableLibraries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v4);

    -[HSBrowser delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__HSBrowser__removalTimerFired___block_invoke;
      block[3] = &unk_24C364750;
      v12 = v9;
      v13 = self;
      v14 = v4;
      dispatch_async(v10, block);

    }
  }

}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HSHomeSharingLibrary *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD block[4];
  id v55;
  HSBrowser *v56;
  HSHomeSharingLibrary *v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HSBrowser resolvingServices](self, "resolvingServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)MEMORY[0x24BDD1808];
  v9 = v4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setScheme:", CFSTR("http"));
  objc_msgSend(v9, "hostName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHost:", v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = objc_msgSend(v9, "port");

  objc_msgSend(v12, "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPort:", v14);

  objc_msgSend(v10, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    -[HSBrowser serviceBrowser](self, "serviceBrowser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v59 = v17;
    v60 = 2114;
    v61 = v7;
    v62 = 2112;
    v63 = v15;
    _os_log_impl(&dword_20AA9E000, v16, OS_LOG_TYPE_INFO, "Service browser: %p resolved service '%{public}@' base URL: %@", buf, 0x20u);

  }
  if (v15)
  {
    v18 = (void *)MEMORY[0x24BDD16B8];
    objc_msgSend(v9, "TXTRecordData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryFromTXTRecordData:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[HSBrowser browserType](self, "browserType"))
    {
      v53 = v7;
      v52 = v15;
      v21 = v20;
      v22 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v21, "objectForKey:", CFSTR("iTSh Version"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithData:encoding:", v23, 4);

      v25 = objc_msgSend(v24, "intValue");
      v26 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v59) = v25;
        _os_log_impl(&dword_20AA9E000, v26, OS_LOG_TYPE_INFO, "iTunes sharing version: %i", buf, 8u);
      }

      v51 = v21;
      if (v25 <= 196611)
      {
        v38 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
        v40 = v52;
        v39 = v53;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v53;
          _os_log_impl(&dword_20AA9E000, v38, OS_LOG_TYPE_ERROR, "Service: %{public}@ has unsupported version", buf, 0xCu);
        }
        v41 = 0;
      }
      else
      {
        v49 = v24;
        v50 = v20;
        v27 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v21, "objectForKey:", CFSTR("Database ID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "initWithData:encoding:", v28, 4);

        v30 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v21, "objectForKey:", CFSTR("Machine ID"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "initWithData:encoding:", v31, 4);

        v33 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v46 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("%.0f"), v34);
        v47 = (void *)v32;
        v48 = v29;
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-%@-%@"), v29, v32, v46);
        objc_msgSend(v21, "objectForKey:", CFSTR("hG"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length"))
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v36, 4);
        else
          v37 = 0;
        v40 = v52;
        v39 = v53;
        v41 = -[HSHomeSharingLibrary initWithName:uniqueIdentifier:version:baseURL:homeSharingGroupID:connectionType:]([HSHomeSharingLibrary alloc], "initWithName:uniqueIdentifier:version:baseURL:homeSharingGroupID:connectionType:", v53, v35, 196624, v52, v37, 0);

        v24 = v49;
        v20 = v50;
        v38 = v48;
      }

      if (v41)
      {
        -[HSHomeSharingLibrary setService:](v41, "setService:", v9);
        -[HSBrowser availableLibraries](self, "availableLibraries");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v41);

        -[HSBrowser librariesPendingRemoval](self, "librariesPendingRemoval");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "removeObject:", v41);

        -[HSBrowser delegate](self, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          dispatch_get_global_queue(0, 0);
          v45 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __41__HSBrowser_netServiceDidResolveAddress___block_invoke;
          block[3] = &unk_24C364750;
          v55 = v44;
          v56 = self;
          v57 = v41;
          dispatch_async(v45, block);

        }
      }
    }

  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[HSBrowser serviceBrowser](self, "serviceBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD10E8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2048;
    v19 = objc_msgSend(v11, "longLongValue");
    _os_log_impl(&dword_20AA9E000, v8, OS_LOG_TYPE_ERROR, "Service browser: %p failed to resolve service '%{public}@' with error code: %lld", (uint8_t *)&v14, 0x20u);

  }
  -[HSBrowser resolvingServices](self, "resolvingServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v6);

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromRunLoop:forMode:", v13, *MEMORY[0x24BDBCB80]);

}

- (int64_t)browserType
{
  return self->_browserType;
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (HSBrowserDelegate)delegate
{
  return (HSBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)availableLibraries
{
  return self->_availableLibraries;
}

- (void)setAvailableLibraries:(id)a3
{
  objc_storeStrong((id *)&self->_availableLibraries, a3);
}

- (NSMutableArray)resolvingServices
{
  return self->_resolvingServices;
}

- (void)setResolvingServices:(id)a3
{
  objc_storeStrong((id *)&self->_resolvingServices, a3);
}

- (NSMutableArray)librariesPendingRemoval
{
  return self->_librariesPendingRemoval;
}

- (void)setLibrariesPendingRemoval:(id)a3
{
  objc_storeStrong((id *)&self->_librariesPendingRemoval, a3);
}

- (OS_dispatch_queue)serviceBrowserQueue
{
  return self->_serviceBrowserQueue;
}

- (void)setServiceBrowserQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBrowserQueue, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSNetServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (void)setServiceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBrowser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceBrowserQueue, 0);
  objc_storeStrong((id *)&self->_librariesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);
  objc_storeStrong((id *)&self->_availableLibraries, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
}

uint64_t __41__HSBrowser_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "browser:didAddLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HSBrowser__removalTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "browser:didRemoveLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __17__HSBrowser_stop__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serviceType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v35 = v5;
      v36 = 2114;
      v37 = v6;
      _os_log_impl(&dword_20AA9E000, v4, OS_LOG_TYPE_DEFAULT, "Service browser: %p stopping search for services of type: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stop");

    objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDBCB80];
    objc_msgSend(v8, "removeFromRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

    objc_msgSend(*(id *)(a1 + 32), "setServiceBrowser:", 0);
    objc_msgSend(*(id *)(a1 + 32), "availableLibraries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = v12;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v4);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            dispatch_get_global_queue(0, 0);
            v19 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __17__HSBrowser_stop__block_invoke_12;
            block[3] = &unk_24C364750;
            v20 = v18;
            v21 = *(_QWORD *)(a1 + 32);
            v26 = v20;
            v27 = v21;
            v28 = v17;
            dispatch_async(v19, block);

          }
          objc_msgSend(v17, "service");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeFromRunLoop:forMode:", v23, v10);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "availableLibraries");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllObjects");

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA9E000, v4, OS_LOG_TYPE_DEBUG, "Service browser is not searching, stopping has no effect.", buf, 2u);
  }

}

uint64_t __17__HSBrowser_stop__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "browser:didRemoveLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __18__HSBrowser_start__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEBUG, "Service browser is already active, starting again has no effect.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16C0]);
    objc_msgSend(*(id *)(a1 + 32), "setServiceBrowser:", v4);

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "serviceBrowser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);

    objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleInRunLoop:forMode:", v8, *MEMORY[0x24BDBCB80]);

    v9 = os_log_create("com.apple.amp.HomeSharing", "Browsing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_20AA9E000, v9, OS_LOG_TYPE_DEFAULT, "Service browser: %p starting search for services of type: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "serviceBrowser");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject searchForServicesOfType:inDomain:](v3, "searchForServicesOfType:inDomain:", v12, CFSTR("local."));

  }
}

+ (id)homeSharingBrowserWithGroupID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBrowserType:groupID:", 0, v3);

  return v4;
}

@end
