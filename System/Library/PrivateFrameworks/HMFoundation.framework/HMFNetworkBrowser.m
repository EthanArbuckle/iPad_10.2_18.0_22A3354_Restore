@implementation HMFNetworkBrowser

void __33___HMFNetworkBrowser_workContext__block_invoke(uint64_t a1)
{
  HMFDispatchContext *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [HMFDispatchContext alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HMFDispatchContext initWithQueue:](v2, "initWithQueue:", v5);
  v4 = (void *)qword_1ED012F58;
  qword_1ED012F58 = v3;

}

void __33___HMFNetworkBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkBrowser"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F68;
  qword_1ED012F68 = v0;

}

- (HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceTypes:(id)a5
{
  NSObject *v8;
  id v9;
  HMFNetworkBrowser *v10;
  HMFNetworkBrowser *v11;
  uint64_t v12;
  NSMutableDictionary *networkServices;
  NSObject *v14;
  uint64_t v15;
  NSMutableArray *internalBrowsers;
  dispatch_queue_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  _HMFNetworkBrowser *v24;
  void *v25;
  HMFNetworkBrowser *v26;
  void *v27;
  _HMFNetworkBrowser *v28;
  void *v30;
  NSObject *v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _QWORD v39[4];
  HMFNetworkBrowser *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = a4;
  v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HMFNetworkBrowser;
  v10 = -[HMFNetworkBrowser init](&v38, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_domain, a4);
    objc_storeStrong((id *)&v11->_serviceTypes, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    networkServices = v11->_networkServices;
    v11->_networkServices = (NSMutableDictionary *)v12;

    v14 = MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v15 = objc_claimAutoreleasedReturnValue();
    internalBrowsers = v11->_internalBrowsers;
    v11->_internalBrowsers = (NSMutableArray *)v15;

    v17 = v8;
    if (!v8)
    {
      v18 = (const char *)HMFDispatchQueueName(v11, 0);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create(v18, v14);
    }
    objc_storeStrong((id *)&v11->_workQueue, v17);
    v31 = v8;
    if (!v8)
    {

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9, v9);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v24 = [_HMFNetworkBrowser alloc];
          -[HMFNetworkBrowser workQueue](v11, "workQueue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v11;
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __networkServiceDidUpdate_block_invoke;
          v39[3] = &unk_1E3B38C88;
          v40 = v26;
          v27 = (void *)MEMORY[0x1A1AC373C](v39);

          v28 = -[_HMFNetworkBrowser initWithQueue:domain:serviceType:updateBlock:](v24, "initWithQueue:domain:serviceType:updateBlock:", v25, v33, v23, v27);
          -[NSMutableArray addObject:](v11->_internalBrowsers, "addObject:", v28);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v20);
    }

    v9 = v30;
    v8 = v31;
  }

  return v11;
}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMFNetworkBrowser_workContext__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  if (qword_1ED012F70 != -1)
    dispatch_once(&qword_1ED012F70, block);
  return (id)qword_1ED012F78;
}

void __32__HMFNetworkBrowser_workContext__block_invoke(uint64_t a1)
{
  HMFDispatchContext *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [HMFDispatchContext alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HMFDispatchContext initWithQueue:](v2, "initWithQueue:", v5);
  v4 = (void *)qword_1ED012F78;
  qword_1ED012F78 = v3;

}

- (void)_addService:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *networkServices;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock_with_options();
  if (v11
    && (v4 = self->_networkServices,
        objc_msgSend(v11, "host"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    networkServices = self->_networkServices;
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](networkServices, "setObject:forKey:", v11, v8);

    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "browser:didFindNetworkService:", self, v11);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_removeService:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *networkServices;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock_with_options();
  if (v11
    && (v4 = self->_networkServices,
        objc_msgSend(v11, "host"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    networkServices = self->_networkServices;
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](networkServices, "removeObjectForKey:", v8);

    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "browser:didLoseNetworkService:", self, v11);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_updateService:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *networkServices;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  os_unfair_lock_lock_with_options();
  if (v14
    && (v4 = self->_networkServices,
        objc_msgSend(v14, "host"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    networkServices = self->_networkServices;
    objc_msgSend(v14, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](networkServices, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithService:", v14);

    v10 = self->_networkServices;
    objc_msgSend(v14, "host");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, v11);

    os_unfair_lock_unlock(&self->_lock);
    -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HMFNetworkBrowser browserDelegate](self, "browserDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "browser:didUpdateNetworkService:", self, v14);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (id)_startBrowsing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HMFNetworkBrowser internalBrowsers](self, "internalBrowsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMFNetworkBrowser internalBrowsers](self, "internalBrowsers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "startBrowsing");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __35__HMFNetworkBrowser__startBrowsing__block_invoke;
        v18[3] = &unk_1E3B38BC8;
        v18[4] = self;
        v18[5] = v11;
        objc_msgSend(v12, "then:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  +[HMFFuture allSettled:](HMFFuture, "allSettled:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ignoreResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __35__HMFNetworkBrowser__startBrowsing__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "browserDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "browserDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browser:didStartBrowsingForServiceType:", v5, v6);

  }
  return 1;
}

- (id)_stopBrowsing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HMFNetworkBrowser internalBrowsers](self, "internalBrowsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMFNetworkBrowser internalBrowsers](self, "internalBrowsers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "stopBrowsing");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __34__HMFNetworkBrowser__stopBrowsing__block_invoke;
        v18[3] = &unk_1E3B38BC8;
        v18[4] = self;
        v18[5] = v11;
        objc_msgSend(v12, "then:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  +[HMFFuture allSettled:](HMFFuture, "allSettled:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ignoreResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __34__HMFNetworkBrowser__stopBrowsing__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "browserDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "browserDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "browser:didStopBrowsingForServiceType:", v5, v6);

  }
  return 1;
}

- (id)stopBrowsing
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMFNetworkBrowser workContext](self, "workContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HMFNetworkBrowser_stopBrowsing__block_invoke;
  v6[3] = &unk_1E3B38910;
  v6[4] = self;
  +[HMFFuture inContext:perform:](HMFFuture, "inContext:perform:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __33__HMFNetworkBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopBrowsing");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1)
    _HMFPreconditionFailure(CFSTR("future"));
  v2 = v1;

  return 3;
}

- (id)startBrowsing
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMFNetworkBrowser workContext](self, "workContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMFNetworkBrowser_startBrowsing__block_invoke;
  v6[3] = &unk_1E3B38910;
  v6[4] = self;
  +[HMFFuture inContext:perform:](HMFFuture, "inContext:perform:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __34__HMFNetworkBrowser_startBrowsing__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_startBrowsing");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1)
    _HMFPreconditionFailure(CFSTR("future"));
  v2 = v1;

  return 3;
}

- (id)startBrowsingWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[HMFNetworkBrowser workContext](self, "workContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke;
  v8[3] = &unk_1E3B38C18;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  +[HMFFuture inContext:perform:](HMFFuture, "inContext:perform:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[6];

  objc_msgSend(*(id *)(a1 + 32), "_startBrowsing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_2;
  v6[3] = &unk_1E3B38BF0;
  v6[5] = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "then:", v6);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    _HMFPreconditionFailure(CFSTR("future"));
  v4 = v3;

  return 3;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v3 = a2;
  +[HMFFuture futureWithDelay:](HMFFuture, "futureWithDelay:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_3;
  v8[3] = &unk_1E3B38910;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "finally:", v8);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    _HMFPreconditionFailure(CFSTR("future"));
  v6 = v5;

  return 3;
}

uint64_t __46__HMFNetworkBrowser_startBrowsingWithTimeout___block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopBrowsing");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1)
    _HMFPreconditionFailure(CFSTR("future"));
  v2 = v1;

  return 3;
}

- (NSArray)foundNetworkServices
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_networkServices, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

+ (id)logCategory
{
  if (qword_1ED012F80 != -1)
    dispatch_once(&qword_1ED012F80, &__block_literal_global_67_0);
  return (id)qword_1ED012F88;
}

void __32__HMFNetworkBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkBrowser"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F88;
  qword_1ED012F88 = v0;

}

- (HMFNetworkBrowserDelegate)delegate
{
  return (HMFNetworkBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableArray)internalBrowsers
{
  return self->_internalBrowsers;
}

- (void)setInternalBrowsers:(id)a3
{
  objc_storeStrong((id *)&self->_internalBrowsers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalBrowsers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkServices, 0);
}

@end
