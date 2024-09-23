@implementation MGRemoteQueryClientManager

- (MGRemoteQueryClientManager)initWithQueryRunner:(id)a3 groupsQueryAgent:(id)a4
{
  id v6;
  id v7;
  MGRemoteQueryClientManager *v8;
  MGRemoteQueryClientManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *dispatchQueue;
  MGRemoteQueryClientBrowser *browser;
  uint64_t v14;
  NSSet *targets;
  uint64_t v16;
  NSDictionary *queries;
  NSArray *v18;
  NSArray *homeHashes;
  uint64_t v20;
  NSArray *clients;
  uint64_t v22;
  NSDictionary *watchdogs;
  NSObject *v24;
  _QWORD block[4];
  MGRemoteQueryClientManager *v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MGRemoteQueryClientManager;
  v8 = -[MGRemoteQueryClientManager init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_invalidated = 0;
    objc_storeWeak((id *)&v8->_queryRunner, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.MediaGroups.RemoteQuery.Client", v10);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v9->_queryAgent, v7);
    browser = v9->_browser;
    v9->_browser = 0;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    targets = v9->_targets;
    v9->_targets = (NSSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    queries = v9->_queries;
    v9->_queries = (NSDictionary *)v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    homeHashes = v9->_homeHashes;
    v9->_homeHashes = v18;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    clients = v9->_clients;
    v9->_clients = (NSArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    watchdogs = v9->_watchdogs;
    v9->_watchdogs = (NSDictionary *)v22;

    -[MGRemoteQueryClientManager dispatchQueue](v9, "dispatchQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__MGRemoteQueryClientManager_initWithQueryRunner_groupsQueryAgent___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v27 = v9;
    dispatch_async(v24, block);

  }
  return v9;
}

uint64_t __67__MGRemoteQueryClientManager_initWithQueryRunner_groupsQueryAgent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupQuery");
  objc_msgSend(*(id *)(a1 + 32), "_prepareURLSession");
  return objc_msgSend(*(id *)(a1 + 32), "_browserUpdateState");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MGRemoteQueryClientManager _invalidate](self, "_invalidate");
  -[MGRemoteQueryClientManager query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MGRemoteQueryClientManager queryRunner](self, "queryRunner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopOutstandingQuery:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)MGRemoteQueryClientManager;
  -[MGRemoteQueryClientManager dealloc](&v5, sel_dealloc);
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager queries](self, "queries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager targets](self, "targets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager browser](self, "browser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _clients = %lu, _queries = %lu, _targets = %lu, _session = %@, _browser = %@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)addOutstandingQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__MGRemoteQueryClientManager_addOutstandingQuery___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__MGRemoteQueryClientManager_addOutstandingQuery___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryAdd:", *(_QWORD *)(a1 + 40));
}

- (void)removeOutstandingQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__MGRemoteQueryClientManager_removeOutstandingQuery___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__MGRemoteQueryClientManager_removeOutstandingQuery___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryRemove:", *(_QWORD *)(a1 + 40));
}

- (void)_prepareURLSession
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  void *v8;
  MGRemoteQueryClientManagerForwarder *v9;
  MGRemoteQueryClientManagerForwarder *forwarder;
  void *v11;
  void *v12;
  NSURLSession *v13;
  NSURLSession *session;
  id v15;
  uint8_t buf[4];
  MGRemoteQueryClientManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      v6 = "%p session already prepared";
LABEL_7:
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (-[MGRemoteQueryClientManager invalidated](self, "invalidated"))
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      v6 = "%p invalidated, not preparing session";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNetworkServiceType:", 6);
  objc_msgSend(v15, "setAllowsCellularAccess:", 0);
  objc_msgSend(v15, "setTimeoutIntervalForRequest:", 0.0);
  objc_msgSend(v15, "setTimeoutIntervalForResource:", 0.0);
  objc_msgSend(v15, "setWaitsForConnectivity:", 0);
  objc_msgSend(v15, "setRequestCachePolicy:", 4);
  objc_msgSend(v15, "setURLCache:", 0);
  objc_msgSend(v15, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v15, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v15, "setHTTPCookieStorage:", 0);
  objc_msgSend(v15, "set_reportsDataStalls:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BDD1710]);
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnderlyingQueue:", v8);

  v9 = -[MGRemoteQueryClientManagerForwarder initWithClientManager:]([MGRemoteQueryClientManagerForwarder alloc], "initWithClientManager:", self);
  forwarder = self->_forwarder;
  self->_forwarder = v9;

  v11 = (void *)MEMORY[0x24BDB74B0];
  -[MGRemoteQueryClientManager forwarder](self, "forwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v15, v12, v7);
  v13 = (NSURLSession *)objc_claimAutoreleasedReturnValue();

  session = self->_session;
  self->_session = v13;

}

- (void)_invalidate
{
  id v2;

  -[MGRemoteQueryClientManager session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndCancel");

}

- (void)_setupQuery
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  uint8_t buf[4];
  MGRemoteQueryClientManager *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientManager query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClientManager query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v20 = self;
      v21 = 2112;
      v22 = v7;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p client monitoring query already running %@", buf, 0x16u);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x24BE64BB8], "predicateForType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v12 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke;
    v16[3] = &unk_24E0AA7C8;
    objc_copyWeak(&v17, (id *)buf);
    v13 = (void *)MEMORY[0x220788584](v16);
    -[MGRemoteQueryClientManager queryRunner](self, "queryRunner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_16;
    v15[3] = &unk_24E0AA840;
    v15[4] = self;
    objc_msgSend(v14, "startOutstandingQueryWithPredicate:handler:completion:", v5, v13, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2;
    v7[3] = &unk_24E0AA5E8;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21[128];
  unsigned __int8 md[16];
  CC_MD5_CTX buf;
  _QWORD data[5];

  data[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  MGLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    buf.A = 134218240;
    *(_QWORD *)&buf.B = v4;
    LOWORD(buf.D) = 2048;
    *(_QWORD *)((char *)&buf.D + 2) = v2;
    _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p client monitoring query received %lu groups", (uint8_t *)&buf, 0x16u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MGHomeIdentifierForGroupIdentifier(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          data[0] = 0;
          data[1] = 0;
          objc_msgSend(v11, "getUUIDBytes:", data);
          memset(&buf, 0, sizeof(buf));
          CC_MD5_Init(&buf);
          CC_MD5_Update(&buf, data, 0x10u);
          CC_MD5_Final(md, &buf);
          v12 = objc_alloc_init(MEMORY[0x24BDD17C8]);
          for (j = 0; j != 16; ++j)
          {
            v14 = v12;
            objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%hhX"), md[j]);
            v12 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v5, "arrayByAddingObject:", v12);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v15;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "setHomeHashes:", v5);
}

void __41__MGRemoteQueryClientManager__setupQuery__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2_17;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __41__MGRemoteQueryClientManager__setupQuery__block_invoke_2_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21CBD2000, v2, OS_LOG_TYPE_DEFAULT, "%p client monitoring using query %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setQuery:", *(_QWORD *)(a1 + 40));
}

- (void)_browserUpdateState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientManager browser](self, "browser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryClientManager queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 || !v6)
  {
    if (v4)
    {
      if (!v6)
        -[MGRemoteQueryClientManager _browserStop](self, "_browserStop");
    }
  }
  else
  {
    -[MGRemoteQueryClientManager _browserStart](self, "_browserStart");
  }
}

- (void)_browserStart
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  MGRemoteQueryClientBrowser *v7;
  void *v8;
  MGRemoteQueryClientBrowser *v9;
  int v10;
  MGRemoteQueryClientManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientManager browser](self, "browser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryClientManager browser](self, "browser");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = v6;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p browser already started, running %p", (uint8_t *)&v10, 0x16u);
LABEL_6:

    }
  }
  else
  {
    v7 = [MGRemoteQueryClientBrowser alloc];
    -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MGRemoteQueryClientBrowser initWithDelegate:dispatchQueue:](v7, "initWithDelegate:dispatchQueue:", self, v8);
    -[MGRemoteQueryClientManager setBrowser:](self, "setBrowser:", v9);

    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MGRemoteQueryClientManager browser](self, "browser");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = v6;
      _os_log_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_DEFAULT, "%p started browser %p", (uint8_t *)&v10, 0x16u);
      goto LABEL_6;
    }
  }

}

- (void)_browserStop
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  MGRemoteQueryClientManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryClientManager browser](self, "browser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p stopping browser %p", (uint8_t *)&v7, 0x16u);
    }

    -[MGRemoteQueryClientManager setBrowser:](self, "setBrowser:", 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p browser already stopped", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_targetAdd:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  MGRemoteQueryClientManager *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager targets](self, "targets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
  {
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = (uint64_t)v4;
      v8 = "%p already tracking target %@";
LABEL_21:
      _os_log_error_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
    }
  }
  else if (-[MGRemoteQueryClientManager _targetValidate:](self, "_targetValidate:", v4))
  {
    objc_msgSend(v6, "setByAddingObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MGRemoteQueryClientManager setTargets:](self, "setTargets:", v9);
    MGLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2048;
      v27 = objc_msgSend(v9, "count");
      v28 = 2112;
      v29 = v4;
      _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p now %lu targets after adding %@", buf, 0x20u);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MGRemoteQueryClientManager queries](self, "queries", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v7 = objc_claimAutoreleasedReturnValue();

    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v7);
          v18 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
          -[MGRemoteQueryClientManager _clientForTarget:withQuery:](self, "_clientForTarget:withQuery:", v4, v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            -[MGRemoteQueryClientManager _clientStartWithQuery:target:](self, "_clientStartWithQuery:target:", v18, v4);
          ++v16;
          v17 = v14;
        }
        while (v13 != v16);
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);

    }
    v6 = v9;
  }
  else
  {
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = (uint64_t)v4;
      v8 = "%p ignoring invalid target %@";
      goto LABEL_21;
    }
  }

}

- (void)_targetRemove:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  MGRemoteQueryClientManager *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager targets](self, "targets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = objc_msgSend(v6, "mutableCopy");
    -[NSObject removeObject:](v7, "removeObject:", v4);
    -[MGRemoteQueryClientManager setTargets:](self, "setTargets:", v7);
    MGLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218498;
      v10 = self;
      v11 = 2048;
      v12 = -[NSObject count](v7, "count");
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p now %lu targets after removing %@", (uint8_t *)&v9, 0x20u);
    }

  }
  else
  {
    MGLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = (uint64_t)v4;
      _os_log_debug_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEBUG, "%p not tracking target %@", (uint8_t *)&v9, 0x16u);
    }
  }

}

- (BOOL)_targetValidate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  MGRemoteQueryClientManager *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "homeHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MGRemoteQueryClientManager homeHashes](self, "homeHashes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (v8)
    {
      MGLogForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p same source target %@", buf, 0x16u);
      }
LABEL_18:
      v10 = 0;
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[MGRemoteQueryClientManager targets](self, "targets", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "homeHash");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v6);

            if (v16)
            {
              MGLogForCategory(6);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v25 = self;
                v26 = 2112;
                v27 = v4;
                _os_log_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_DEFAULT, "%p duplicate target %@", buf, 0x16u);
              }

              goto LABEL_18;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          v10 = 1;
          if (v12)
            continue;
          break;
        }
      }
      else
      {
        v10 = 1;
      }
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)browser:(id)a3 foundTarget:(id)a4
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
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__MGRemoteQueryClientManager_browser_foundTarget___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__MGRemoteQueryClientManager_browser_foundTarget___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_targetAdd:", *(_QWORD *)(a1 + 48));
}

- (void)browser:(id)a3 lostTarget:(id)a4
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
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MGRemoteQueryClientManager_browser_lostTarget___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __49__MGRemoteQueryClientManager_browser_lostTarget___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_targetRemove:", *(_QWORD *)(a1 + 48));
}

- (void)browser:(id)a3 invalidatedWithError:(id)a4
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
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__MGRemoteQueryClientManager_browser_invalidatedWithError___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __59__MGRemoteQueryClientManager_browser_invalidatedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    MGLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v21 = v5;
      v22 = 2048;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_DEFAULT, "%p browser %p stopped, error %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setBrowser:", 0);
    objc_msgSend(*(id *)(a1 + 32), "targets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(a1 + 32), "_targetRemove:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)_queryAdd:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  MGRemoteQueryClientManager *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager queries](self, "queries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    MGLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      v33 = 2112;
      v34 = (uint64_t)v6;
      _os_log_error_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_ERROR, "%p already tracking query %@", buf, 0x16u);
    }
    goto LABEL_4;
  }
  objc_msgSend(v4, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rq_restrictedToLocal");

  if (v11)
  {
    MGLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 134218242;
    v32 = self;
    v33 = 2112;
    v34 = (uint64_t)v6;
    v12 = "%p query %@ ineligible by locality";
LABEL_11:
    _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
    goto LABEL_4;
  }
  objc_msgSend(v4, "predicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mg_containsCurrentDevice");

  if (v14)
  {
    MGLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 134218242;
    v32 = self;
    v33 = 2112;
    v34 = (uint64_t)v6;
    v12 = "%p query %@ ineligible by context";
    goto LABEL_11;
  }
  v9 = objc_msgSend(v7, "mutableCopy");
  -[NSObject setObject:forKey:](v9, "setObject:forKey:", v4, v6);
  -[MGRemoteQueryClientManager setQueries:](self, "setQueries:", v9);
  MGLogForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v32 = self;
    v33 = 2048;
    v34 = -[NSObject count](v9, "count");
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_DEFAULT, "%p now %lu queries after adding %@", buf, 0x20u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MGRemoteQueryClientManager targets](self, "targets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v24 = v7;
    v25 = v6;
    v19 = 0;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v16);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21);
        -[MGRemoteQueryClientManager _clientForTarget:withQuery:](self, "_clientForTarget:withQuery:", v23, v4, v24, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          -[MGRemoteQueryClientManager _clientStartWithQuery:target:](self, "_clientStartWithQuery:target:", v4, v23);
        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);

    v7 = v24;
    v6 = v25;
  }

  -[MGRemoteQueryClientManager _browserUpdateState](self, "_browserUpdateState");
LABEL_4:

}

- (void)_queryRemove:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  MGRemoteQueryClientManager *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager queries](self, "queries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v7, "mutableCopy");
    -[NSObject removeObjectForKey:](v9, "removeObjectForKey:", v6);
    -[MGRemoteQueryClientManager setQueries:](self, "setQueries:", v9);
    MGLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v22 = self;
      v23 = 2048;
      v24 = -[NSObject count](v9, "count");
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p now %lu queries after removing %@", buf, 0x20u);
    }

    -[MGRemoteQueryClientManager _browserUpdateState](self, "_browserUpdateState");
    -[MGRemoteQueryClientManager _clientsWithQuery:](self, "_clientsWithQuery:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[MGRemoteQueryClientManager _clientStop:](self, "_clientStop:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
  else
  {
    MGLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v22 = self;
      v23 = 2112;
      v24 = (uint64_t)v6;
      _os_log_debug_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEBUG, "%p not tracking query %@", buf, 0x16u);
    }
  }

}

- (void)_clientStartWithQuery:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  MGRemoteQueryClientManager *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[MGRemoteQueryClientManager queryAgent](self, "queryAgent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGRemoteQueryClientHandlerQuery handlerWithQuery:forGroupsQueryAgent:](MGRemoteQueryClientHandlerQuery, "handlerWithQuery:forGroupsQueryAgent:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGRemoteQueryClient clientWithHandler:target:dispatchQueue:delegate:usingSession:](MGRemoteQueryClient, "clientWithHandler:target:dispatchQueue:delegate:usingSession:", v10, v6, v11, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryClientManager clients](self, "clients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObject:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryClientManager setClients:](self, "setClients:", v15);
  MGLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134218498;
    v19 = self;
    v20 = 2048;
    v21 = objc_msgSend(v15, "count");
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after starting %@", (uint8_t *)&v18, 0x20u);
  }

  -[MGRemoteQueryClientManager _watchdogForTarget:](self, "_watchdogForTarget:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    -[MGRemoteQueryClientManager _watchdogAdd:](self, "_watchdogAdd:", v6);

}

- (void)_clientStop:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  MGRemoteQueryClientManager *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager _clientRemove:](self, "_clientRemove:", v4);
  MGLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MGRemoteQueryClientManager clients](self, "clients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218498;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v7, "count");
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after stopping %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)_clientRemove:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  -[MGRemoteQueryClientManager setClients:](self, "setClients:", v7);
  objc_msgSend(v4, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v22 = v8;
    v23 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MGRemoteQueryClientManager targets](self, "targets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "homeHash");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v9);

          if (v17)
          {
            objc_msgSend(v4, "query");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v21 = (void *)v18;
              -[MGRemoteQueryClientManager _clientStartWithQuery:target:](self, "_clientStartWithQuery:target:", v18, v15);

              v8 = v22;
              v7 = v23;
              goto LABEL_15;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
          continue;
        break;
      }
    }

    v8 = v22;
    v7 = v23;
  }
  -[MGRemoteQueryClientManager _clientsForTarget:](self, "_clientsForTarget:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
    -[MGRemoteQueryClientManager _watchdogRemove:](self, "_watchdogRemove:", v8);
LABEL_15:

}

- (id)_clientForTask:(id)a3 includeOthers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MGRemoteQueryClientManager clients](self, "clients");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "task");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "isEqual:", v13);

        if (v14)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  if (v4)
  {
    -[MGRemoteQueryClientManager watchdogs](self, "watchdogs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "pingClient", (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "task");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v6, "isEqual:", v24);

            if (v25)
            {

              goto LABEL_23;
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v19)
          continue;
        break;
      }
    }
    v23 = v9;
LABEL_23:

    v9 = v23;
  }

  return v9;
}

- (id)_clientForTarget:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager clients](self, "clients");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v19 = v7;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "target", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isEqual:", v14) & 1) != 0)
        {
          objc_msgSend(v13, "query");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v20, "isEqual:", v16);

          if (v17)
          {
            v10 = v13;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
LABEL_12:
    v7 = v19;
  }

  return v10;
}

- (id)_clientsWithQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v19;
  MGRemoteQueryClientManager *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  MGRemoteQueryClientManager *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self;
  -[MGRemoteQueryClientManager clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "query");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v7, "isEqual:", v15);

        if (v16)
          objc_msgSend(v6, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v10);
  }
  MGLogForCategory(6);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218498;
    v27 = v20;
    v28 = 2048;
    v29 = v19;
    v30 = 2112;
    v31 = v7;
    _os_log_debug_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_DEBUG, "%p have %lu clients for query %@", buf, 0x20u);
  }

  return v6;
}

- (id)_clientsForTarget:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientManager clients](self, "clients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "target");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "isEqual:", v13);

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_watchdogForTarget:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager watchdogs](self, "watchdogs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_watchdogAdd:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  MGRemoteQueryClientManager *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager _watchdogForTarget:](self, "_watchdogForTarget:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    MGLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = (uint64_t)v7;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p already tracking watchdog %@ for target %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClientManager session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MGRemoteQueryClientWatchdog watchdogForTarget:dispatchQueue:delegate:usingSession:](MGRemoteQueryClientWatchdog, "watchdogForTarget:dispatchQueue:delegate:usingSession:", v4, v9, self, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MGRemoteQueryClientManager watchdogs](self, "watchdogs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "mutableCopy");

    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v7, v4);
    -[MGRemoteQueryClientManager setWatchdogs:](self, "setWatchdogs:", v8);
    MGLogForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2048;
      v16 = -[NSObject count](v8, "count");
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p now %lu watchdogs after adding %@", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (void)_watchdogReset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  MGRemoteQueryClientManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager _watchdogForTarget:](self, "_watchdogForTarget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "reset");
  }
  else
  {
    MGLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p no watchdog to reset for %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_watchdogRemove:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  MGRemoteQueryClientManager *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager _watchdogForTarget:](self, "_watchdogForTarget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MGRemoteQueryClientManager watchdogs](self, "watchdogs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");

    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
    -[MGRemoteQueryClientManager setWatchdogs:](self, "setWatchdogs:", v8);
    MGLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218498;
      v11 = self;
      v12 = 2048;
      v13 = -[NSObject count](v8, "count");
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p now %lu watchdogs after removing %@", (uint8_t *)&v10, 0x20u);
    }

  }
  else
  {
    MGLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = (uint64_t)v4;
      _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p not tracking watchdog for target %@", (uint8_t *)&v10, 0x16u);
    }
  }

}

- (void)_watchdogFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  MGRemoteQueryClientManager *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MGRemoteQueryClientManager _targetRemove:](self, "_targetRemove:", v4);
  -[MGRemoteQueryClientManager _clientsForTarget:](self, "_clientsForTarget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[MGRemoteQueryClientManager _clientStop:](self, "_clientStop:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v8);
  }
  -[MGRemoteQueryClientManager _clientsForTarget:](self, "_clientsForTarget:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {

  }
  else
  {
    -[MGRemoteQueryClientManager _watchdogForTarget:](self, "_watchdogForTarget:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      MGLogForCategory(6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v19 = self;
        v20 = 2112;
        v21 = v4;
        _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p watchdog for target %@ lingered after firing", buf, 0x16u);
      }

      -[MGRemoteQueryClientManager _watchdogRemove:](self, "_watchdogRemove:", v4);
    }
  }

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
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MGRemoteQueryClientManager_clientInvalidated_withError___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__MGRemoteQueryClientManager_clientInvalidated_withError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientRemove:", *(_QWORD *)(a1 + 40));
    MGLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "clients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 134218754;
      v11 = v5;
      v12 = 2048;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_DEFAULT, "%p now %lu clients after invalidation of %@ with error %@", (uint8_t *)&v10, 0x2Au);

    }
  }
}

- (void)watchdogFired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MGRemoteQueryClientManager *v9;

  v4 = a3;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__MGRemoteQueryClientManager_watchdogFired___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__MGRemoteQueryClientManager_watchdogFired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_watchdogForTarget:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((_DWORD)v3)
  {
    MGLogForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218498;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2112;
      v13 = v2;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p watchdog %p fired for %@", (uint8_t *)&v8, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_watchdogFired:", v2);
  }

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  MGRemoteQueryClientManager *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, uint64_t, void *))a5;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticationMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)*MEMORY[0x24BDB7410], "isEqual:", v11)
    && (v12 = objc_msgSend(v10, "serverTrust")) != 0)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MGLogForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = 134218498;
      v18 = self;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v7;
      _os_log_debug_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_DEBUG, "%p allowing trust %@ for challenge %@", (uint8_t *)&v17, 0x20u);
    }

    v16 = 0;
  }
  else
  {
    v14 = 0;
    v16 = 1;
  }
  v8[2](v8, v16, v14);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  MGRemoteQueryClientManager *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[MGRemoteQueryClientManager _clientForTask:includeOthers:](self, "_clientForTask:includeOthers:", v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = v10;
    objc_msgSend(v13, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClientManager _watchdogReset:](self, "_watchdogReset:", v15);

    objc_msgSend(v13, "consumeResponse:", v14);
    v16 = 1;
  }
  else
  {
    MGLogForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 134218754;
      v19 = self;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_ERROR, "%p bad response %@ from task %@ for client %@", (uint8_t *)&v18, 0x2Au);
    }

    v16 = 0;
  }
  v11[2](v11, v16);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  MGRemoteQueryClientManager *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[MGRemoteQueryClientManager _clientForTask:includeOthers:](self, "_clientForTask:includeOthers:", v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClientManager _watchdogReset:](self, "_watchdogReset:", v12);

    objc_msgSend(v11, "consumeData:", v8);
  }
  else
  {
    MGLogForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_ERROR, "%p no data consumer for task %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(v7, "cancel");
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  v7 = a4;
  -[MGRemoteQueryClientManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[MGRemoteQueryClientManager _clientForTask:includeOthers:](self, "_clientForTask:includeOthers:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryClientManager _watchdogReset:](self, "_watchdogReset:", v10);

    objc_msgSend(v9, "completeWithError:", v11);
  }

}

- (MGInternalQueryRunner)queryRunner
{
  return (MGInternalQueryRunner *)objc_loadWeakRetained((id *)&self->_queryRunner);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MGGroupsQueryAgent)queryAgent
{
  return (MGGroupsQueryAgent *)objc_loadWeakRetained((id *)&self->_queryAgent);
}

- (MGRemoteQueryClientBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (NSSet)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  objc_storeStrong((id *)&self->_targets, a3);
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_storeStrong((id *)&self->_queries, a3);
}

- (NSArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSDictionary)watchdogs
{
  return self->_watchdogs;
}

- (void)setWatchdogs:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogs, a3);
}

- (MGRemoteQueryClientManagerForwarder)forwarder
{
  return self->_forwarder;
}

- (NSURLSession)session
{
  return self->_session;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSArray)homeHashes
{
  return self->_homeHashes;
}

- (void)setHomeHashes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHashes, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_watchdogs, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_destroyWeak((id *)&self->_queryAgent);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_queryRunner);
}

@end
