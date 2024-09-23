@implementation DDSTrialManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DDSTrialManager)initWithWorkQueue:(id)a3
{
  id v4;
  DDSTrialManagerDataSource *v5;
  DDSTrialManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(DDSTrialManagerDataSource);
  v6 = -[DDSTrialManager initWithWorkQueue:dataSource:](self, "initWithWorkQueue:dataSource:", v4, v5);

  return v6;
}

- (DDSTrialManager)initWithWorkQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  DDSTrialManager *v9;
  DDSTrialManager *v10;
  uint64_t v11;
  NSMutableDictionary *trialClientByQuery;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSTrialManager;
  v9 = -[DDSTrialManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    trialClientByQuery = v10->_trialClientByQuery;
    v10->_trialClientByQuery = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (void)setUpTrialForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DDSTrialManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DDSTrialManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if (v7)
  {
    -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      DefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "Setting up trial for query: %@", (uint8_t *)&v20, 0xCu);
      }

      -[DDSTrialManager dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDSTrialManager workQueue](self, "workQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "createTrialClientWithWorkQueue:query:", v12, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "setDelegate:", self);
        objc_msgSend(v9, "start");
        -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, v4);
      }
      else
      {
        DefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[DDSTrialManager setUpTrialForQuery:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
        v9 = 0;
      }

    }
  }

}

- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[DDSTrialManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[DDSTrialManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if ((v9 & 1) != 0)
  {
    -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "fetchAssetWithCallback:", v6);
    }
    else
    {
      DDSTrialErrorWithCode(6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v12);

    }
  }
  else
  {
    DDSTrialErrorWithCode(0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);
  }

}

- (void)trialClient:(id)a3 didReceiveAsset:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DDSTrialManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
      -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 == v6)
        break;

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v14;

    if (!v17)
      goto LABEL_12;
    -[DDSTrialManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trialDidReceiveAsset:forQuery:", v7, v17);

  }
  else
  {
LABEL_9:

LABEL_12:
    DefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DDSTrialManager trialClient:didReceiveAsset:].cold.1((uint64_t)v7, (uint64_t)v6, v17);
  }

}

- (void)trialClientDidStop:(id)a3
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
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DDSTrialManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      -[DDSTrialManager trialClientByQuery](self, "trialClientByQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v4)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_12;
    -[DDSTrialManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trialDidStopForQuery:", v14);

  }
  else
  {
LABEL_9:

LABEL_12:
    DefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DDSTrialManager trialClientDidStop:].cold.1((uint64_t)v4, v14, v16, v17, v18, v19, v20, v21);
  }

}

- (DDSTrialManagerDelegate)delegate
{
  return (DDSTrialManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (DDSTrialManagerDataSource)dataSource
{
  return (DDSTrialManagerDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)trialClientByQuery
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClientByQuery, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setUpTrialForQuery:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, a2, a3, "Failed to create trial client for query: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)trialClient:(os_log_t)log didReceiveAsset:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DA990000, log, OS_LOG_TYPE_ERROR, "Did not handle did receive asset: %@ for client: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)trialClientDidStop:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, a2, a3, "Did not handle trial client did stop: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
