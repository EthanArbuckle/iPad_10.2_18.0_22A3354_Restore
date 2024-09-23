@implementation MGRemoteQueryServerManager

- (MGRemoteQueryServerManager)initWithQueryRunner:(id)a3
{
  id v4;
  MGRemoteQueryServerManager *v5;
  MGRemoteQueryServerManager *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  MGRemoteQueryServer *server;
  uint64_t v11;
  NSUserDefaults *airplayDefaults;
  NSObject *v13;
  _QWORD block[4];
  MGRemoteQueryServerManager *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MGRemoteQueryServerManager;
  v5 = -[MGRemoteQueryServerManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_queryRunner, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaGroups.RemoteQuery.Server", v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    server = v6->_server;
    v6->_server = 0;

    *(_WORD *)&v6->_havePermissiveACL = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.airplay"));
    airplayDefaults = v6->_airplayDefaults;
    v6->_airplayDefaults = (NSUserDefaults *)v11;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v6->_airplayDefaults, "addObserver:forKeyPath:options:context:", v6, CFSTR("accessControlLevel"), 4, 0);
    -[MGRemoteQueryServerManager dispatchQueue](v6, "dispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__MGRemoteQueryServerManager_initWithQueryRunner___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v16 = v6;
    dispatch_async(v13, block);

  }
  return v6;
}

uint64_t __50__MGRemoteQueryServerManager_initWithQueryRunner___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupQuery");
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[MGRemoteQueryServerManager airplayDefaults](self, "airplayDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("accessControlLevel"), 0);

  -[MGRemoteQueryServerManager query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MGRemoteQueryServerManager queryRunner](self, "queryRunner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopOutstandingQuery:", v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)MGRemoteQueryServerManager;
  -[MGRemoteQueryServerManager dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MGRemoteQueryServerManager havePermissiveACL](self, "havePermissiveACL");
  v7 = -[MGRemoteQueryServerManager haveGroupsToAdvertise](self, "haveGroupsToAdvertise");
  -[MGRemoteQueryServerManager homeHash](self, "homeHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerManager server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 78;
  if (v7)
    v11 = 89;
  else
    v11 = 78;
  if (v6)
    v10 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, ACL(%c), Groups(%c), _homeHash = %@, _server = %@>"), v5, self, v10, v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)_updateState
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  char v6;

  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerManager server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MGRemoteQueryServerManager _shouldRunServer](self, "_shouldRunServer");
  if (v4 || !v5)
  {
    if (v4)
      v6 = v5;
    else
      v6 = 1;
    if ((v6 & 1) == 0)
      -[MGRemoteQueryServerManager _stopServer](self, "_stopServer");
  }
  else
  {
    -[MGRemoteQueryServerManager _startServer](self, "_startServer");
  }
}

- (BOOL)_shouldRunServer
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  MGRemoteQueryServerManager *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[MGRemoteQueryServerManager havePermissiveACL](self, "havePermissiveACL")
    && -[MGRemoteQueryServerManager haveGroupsToAdvertise](self, "haveGroupsToAdvertise"))
  {
    -[MGRemoteQueryServerManager homeHash](self, "homeHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }
  MGLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v8 = 89;
    else
      v8 = 78;
    if (-[MGRemoteQueryServerManager havePermissiveACL](self, "havePermissiveACL"))
      v9 = 89;
    else
      v9 = 78;
    if (-[MGRemoteQueryServerManager haveGroupsToAdvertise](self, "haveGroupsToAdvertise"))
      v10 = 89;
    else
      v10 = 78;
    -[MGRemoteQueryServerManager homeHash](self, "homeHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134219008;
    if (objc_msgSend(v11, "length"))
      v12 = 89;
    else
      v12 = 78;
    v14 = self;
    v15 = 1024;
    v16 = v8;
    v17 = 1024;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = v12;
    _os_log_debug_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEBUG, "%p server should run %c, ACL(%c) GTA(%c) HH(%c)", (uint8_t *)&v13, 0x24u);

  }
  return v5;
}

- (void)_startServer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  MGRemoteQueryServer *v7;
  void *v8;
  void *v9;
  MGRemoteQueryServer *v10;
  int v11;
  MGRemoteQueryServerManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerManager server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryServerManager server](self, "server");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218240;
      v12 = self;
      v13 = 2048;
      v14 = v6;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p server already started, running %p", (uint8_t *)&v11, 0x16u);
LABEL_6:

    }
  }
  else
  {
    v7 = [MGRemoteQueryServer alloc];
    -[MGRemoteQueryServerManager homeHash](self, "homeHash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MGRemoteQueryServer initWithHomeHash:delegate:dispatchQueue:](v7, "initWithHomeHash:delegate:dispatchQueue:", v8, self, v9);
    -[MGRemoteQueryServerManager setServer:](self, "setServer:", v10);

    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MGRemoteQueryServerManager server](self, "server");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218240;
      v12 = self;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_DEFAULT, "%p started server %p", (uint8_t *)&v11, 0x16u);
      goto LABEL_6;
    }
  }

}

- (void)_stopServer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  MGRemoteQueryServerManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerManager server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MGLogForCategory(5);
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
      _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p stopping server %p", (uint8_t *)&v7, 0x16u);
    }

    -[MGRemoteQueryServerManager setServer:](self, "setServer:", 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, "%p server already stopped", (uint8_t *)&v7, 0xCu);
    }

  }
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  _QWORD v25[2];
  uint8_t buf[4];
  MGRemoteQueryServerManager *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerManager query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryServerManager query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2112;
      v29 = v7;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p server monitoring query already running %@", buf, 0x16u);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE64BB8], "predicateForCurrentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v10 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForHaveCurrentHome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForLocal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v13;
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForInCurrentHome");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orPredicateWithSubpredicates:", v17);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v18 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke;
    v22[3] = &unk_24E0AA7C8;
    objc_copyWeak(&v23, (id *)buf);
    v19 = (void *)MEMORY[0x220788584](v22);
    -[MGRemoteQueryServerManager queryRunner](self, "queryRunner");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_17;
    v21[3] = &unk_24E0AA840;
    v21[4] = self;
    objc_msgSend(v20, "startOutstandingQueryWithPredicate:handler:completion:", v5, v19, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke(uint64_t a1, void *a2)
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
    v7[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2;
    v7[3] = &unk_24E0AA5E8;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned __int8 v23[128];
  unsigned __int8 md[16];
  CC_MD5_CTX buf;
  _QWORD data[5];

  data[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  MGLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    buf.A = 134218240;
    *(_QWORD *)&buf.B = v4;
    LOWORD(buf.D) = 2048;
    *(_QWORD *)((char *)&buf.D + 2) = v2;
    _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p server monitoring query received %lu groups", (uint8_t *)&buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          MGHomeIdentifierForGroupIdentifier(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v15 = *(void **)(a1 + 40);
            data[0] = 0;
            data[1] = 0;
            objc_msgSend(v12, "getUUIDBytes:", data);
            memset(&buf, 0, sizeof(buf));
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, data, 0x10u);
            CC_MD5_Final(md, &buf);
            v16 = objc_alloc_init(MEMORY[0x24BDD17C8]);
            for (i = 0; i != 16; ++i)
            {
              v18 = v16;
              objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("%hhX"), md[i]);
              v16 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v15, "setHomeHash:", v16);

            objc_msgSend(*(id *)(a1 + 40), "setHaveGroupsToAdvertise:", v2 != 1);
            return;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  MGLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 40);
    buf.A = 134217984;
    *(_QWORD *)&buf.B = v14;
    _os_log_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEFAULT, "%p no suitable home found for advertising.", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setHomeHash:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setHaveGroupsToAdvertise:", 0);
}

void __41__MGRemoteQueryServerManager__setupQuery__block_invoke_17(uint64_t a1, void *a2)
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
  v6[2] = __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2_18;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __41__MGRemoteQueryServerManager__setupQuery__block_invoke_2_18(uint64_t a1)
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
  MGLogForCategory(5);
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
    _os_log_impl(&dword_21CBD2000, v2, OS_LOG_TYPE_DEFAULT, "%p server monitoring using query %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setQuery:", *(_QWORD *)(a1 + 40));
}

- (void)setHavePermissiveACL:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = a3;
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_havePermissiveACL != v3)
  {
    self->_havePermissiveACL = v3;
    -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__MGRemoteQueryServerManager_setHavePermissiveACL___block_invoke;
    block[3] = &unk_24E0AA4F8;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

uint64_t __51__MGRemoteQueryServerManager_setHavePermissiveACL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)setHaveGroupsToAdvertise:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = a3;
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_haveGroupsToAdvertise != v3)
  {
    self->_haveGroupsToAdvertise = v3;
    -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__MGRemoteQueryServerManager_setHaveGroupsToAdvertise___block_invoke;
    block[3] = &unk_24E0AA4F8;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

uint64_t __55__MGRemoteQueryServerManager_setHaveGroupsToAdvertise___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)setHomeHash:(id)a3
{
  NSString *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSString *v9;
  NSString *homeHash;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  MGRemoteQueryServerManager *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_homeHash != v4)
  {
    -[MGRemoteQueryServerManager homeHash](self, "homeHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      MGLogForCategory(5);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v14 = self;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p home hash changing %@", buf, 0x16u);
      }

      -[MGRemoteQueryServerManager _stopServer](self, "_stopServer");
      v9 = (NSString *)-[NSString copy](v4, "copy");
      homeHash = self->_homeHash;
      self->_homeHash = v9;

      -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__MGRemoteQueryServerManager_setHomeHash___block_invoke;
      block[3] = &unk_24E0AA4F8;
      block[4] = self;
      dispatch_async(v11, block);

    }
  }

}

uint64_t __42__MGRemoteQueryServerManager_setHomeHash___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)serverInvalidated:(id)a3 withError:(id)a4
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
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke;
  block[3] = &unk_24E0AA778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  int64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setServer:", 0);
    v4 = objc_msgSend(*(id *)(a1 + 32), "relaunchCount");
    if (*(_QWORD *)(a1 + 48))
    {
      v5 = v4;
      v6 = exp2((double)v4);
      if (v5 >= 5)
        v7 = v5;
      else
        v7 = v5 + 1;
      v8 = 1000000000 * (unint64_t)(v6 + -1.0);
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setRelaunchCount:", v7);
    v9 = dispatch_time(0, v8);
    objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke_2;
    block[3] = &unk_24E0AA4F8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v9, v10, block);

  }
}

uint64_t __58__MGRemoteQueryServerManager_serverInvalidated_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MGRemoteQueryServerManager *v12;

  v7 = a3;
  -[MGRemoteQueryServerManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__MGRemoteQueryServerManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v10[3] = &unk_24E0AA5E8;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __77__MGRemoteQueryServerManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("accessControlLevel")))
  {
    objc_msgSend(*(id *)(a1 + 40), "airplayDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("accessControlLevel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "airplayDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerForKey:", CFSTR("accessControlLevel"));

      MGLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v12 = 134218240;
        v13 = v7;
        v14 = 2048;
        v15 = v5;
        _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p ACL changed to %ld", (uint8_t *)&v12, 0x16u);
      }

      v8 = *(void **)(a1 + 40);
      v9 = v5 == 0;
    }
    else
    {
      MGLogForCategory(5);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = 134217984;
        v13 = v11;
        _os_log_impl(&dword_21CBD2000, v10, OS_LOG_TYPE_DEFAULT, "%p ACL not set", (uint8_t *)&v12, 0xCu);
      }

      v8 = *(void **)(a1 + 40);
      v9 = 0;
    }
    objc_msgSend(v8, "setHavePermissiveACL:", v9);

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

- (MGRemoteQueryServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (BOOL)havePermissiveACL
{
  return self->_havePermissiveACL;
}

- (BOOL)haveGroupsToAdvertise
{
  return self->_haveGroupsToAdvertise;
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (NSUserDefaults)airplayDefaults
{
  return self->_airplayDefaults;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (unint64_t)relaunchCount
{
  return self->_relaunchCount;
}

- (void)setRelaunchCount:(unint64_t)a3
{
  self->_relaunchCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_airplayDefaults, 0);
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_queryRunner);
}

@end
