@implementation MGGroupQuery

- (MGGroupQuery)initWithConnectionProvider:(id)a3 predicate:(id)a4 updateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MGGroupQuery *v11;
  uint64_t v12;
  MGClientService *service;
  uint64_t v14;
  id updateHandler;
  NSObject *v16;
  MGClientService *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  MGGroupQuery *v24;
  __int16 v25;
  MGClientService *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MGGroupQuery;
  v11 = -[MGGroupQuery init](&v22, sel_init);
  if (v11)
  {
    +[MGClientService clientServiceWithConnectionProvider:](MGClientService, "clientServiceWithConnectionProvider:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    service = v11->_service;
    v11->_service = (MGClientService *)v12;

    objc_storeStrong((id *)&v11->_predicate, a4);
    v14 = objc_msgSend(v10, "copy");
    updateHandler = v11->_updateHandler;
    v11->_updateHandler = (id)v14;

    MGLogForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v11->_service;
      *(_DWORD *)buf = 134218240;
      v24 = v11;
      v25 = 2048;
      v26 = v17;
      _os_log_impl(&dword_2172B2000, v16, OS_LOG_TYPE_DEFAULT, "%p query initializing with service %p", buf, 0x16u);
    }

    objc_initWeak((id *)buf, v11);
    -[MGGroupQuery service](v11, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__MGGroupQuery_initWithConnectionProvider_predicate_updateHandler___block_invoke;
    v20[3] = &unk_24D726D48;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v18, "startQueryWithPredicate:completion:", v9, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __67__MGGroupQuery_initWithConnectionProvider_predicate_updateHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void (**v13)(void);
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      MGLogForCategory(3);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = 134218498;
        v20 = v11;
        v21 = 2112;
        v22 = (uint64_t)v7;
        v23 = 2112;
        v24 = v9;
        _os_log_error_impl(&dword_2172B2000, v12, OS_LOG_TYPE_ERROR, "%p query %@ failed (%@)", (uint8_t *)&v19, 0x20u);
      }
LABEL_5:

      objc_msgSend(v11, "updateHandler");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

      goto LABEL_17;
    }
    objc_msgSend(WeakRetained, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "query");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
        if (!v8)
          goto LABEL_17;
        MGLogForCategory(3);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134218498;
          v20 = v11;
          v21 = 2048;
          v22 = objc_msgSend(v8, "count");
          v23 = 2112;
          v24 = v7;
          _os_log_impl(&dword_2172B2000, v12, OS_LOG_TYPE_DEFAULT, "%p received %ld items in an update for %@", (uint8_t *)&v19, 0x20u);
        }
        goto LABEL_5;
      }
      MGLogForCategory(3);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "query");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = v11;
        v21 = 2112;
        v22 = (uint64_t)v7;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_2172B2000, v17, OS_LOG_TYPE_DEFAULT, "%p query %@ restarted (was %@)", (uint8_t *)&v19, 0x20u);

      }
    }
    else
    {
      MGLogForCategory(3);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134218242;
        v20 = v11;
        v21 = 2112;
        v22 = (uint64_t)v7;
        _os_log_impl(&dword_2172B2000, v17, OS_LOG_TYPE_DEFAULT, "%p query %@ started", (uint8_t *)&v19, 0x16u);
      }
    }

    objc_msgSend(v11, "setQuery:", v7);
  }
LABEL_17:

}

- (MGGroupQuery)initWithPredicate:(id)a3 updateHandler:(id)a4
{
  return -[MGGroupQuery initWithConnectionProvider:predicate:updateHandler:](self, "initWithConnectionProvider:predicate:updateHandler:", 0, a3, a4);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  MGGroupQuery *v9;
  uint8_t buf[4];
  MGGroupQuery *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MGGroupQuery query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    MGLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2172B2000, v4, OS_LOG_TYPE_DEFAULT, "%p query %@ stopping", buf, 0x16u);
    }

    -[MGGroupQuery service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __23__MGGroupQuery_dealloc__block_invoke;
    v7[3] = &unk_24D726D70;
    v9 = self;
    v8 = v3;
    objc_msgSend(v5, "stopQuery:completion:", v8, v7);

  }
  v6.receiver = self;
  v6.super_class = (Class)MGGroupQuery;
  -[MGGroupQuery dealloc](&v6, sel_dealloc);
}

void __23__MGGroupQuery_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 134218242;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_2172B2000, v5, OS_LOG_TYPE_DEFAULT, "%p query %@ stopped", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = 0;
    _os_log_error_impl(&dword_2172B2000, v5, OS_LOG_TYPE_ERROR, "%p query stop %@ failed (%@)", (uint8_t *)&v10, 0x20u);
  }

}

+ (id)queryWithPredicate:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:updateHandler:", v7, v6);

  return v8;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (MGClientService)service
{
  return self->_service;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (NSUUID)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
