@implementation SORequestQueue

+ (id)requestQueueWithIdentifier:(id)a3
{
  id v3;
  id v4;
  SORequestQueue *v5;

  v3 = a3;
  if (requestQueueWithIdentifier__onceToken != -1)
    dispatch_once(&requestQueueWithIdentifier__onceToken, &__block_literal_global_3);
  v4 = (id)queues;
  objc_sync_enter(v4);
  objc_msgSend((id)queues, "objectForKeyedSubscript:", v3);
  v5 = (SORequestQueue *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SORequestQueue initWithIdentifier:]([SORequestQueue alloc], "initWithIdentifier:", v3);
    objc_msgSend((id)queues, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

void __45__SORequestQueue_requestQueueWithIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)queues;
  queues = v0;

}

+ (id)debugDescription
{
  id v2;
  void *v3;

  v2 = (id)queues;
  objc_sync_enter(v2);
  objc_msgSend((id)queues, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (SORequestQueue)initWithIdentifier:(id)a3
{
  id v4;
  SORequestQueue *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSMutableArray *queue;
  SOQueueItem *processingItem;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SORequestQueue;
  v5 = -[SORequestQueue init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (NSMutableArray *)v8;

    processingItem = v5->_processingItem;
    v5->_processingItem = 0;

  }
  return v5;
}

- (void)enqueueRequest:(id)a3
{
  id v4;
  SORequestQueue *v5;
  NSObject *v6;
  NSString *identifier;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableArray addObject:](v5->_queue, "addObject:", v4);
  SO_LOG_SORequestQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    identifier = v5->_identifier;
    objc_msgSend(v4, "requestParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSMutableArray count](v5->_queue, "count");
    v11 = 138544386;
    v12 = identifier;
    v13 = 2048;
    v14 = v4;
    v15 = 2114;
    v16 = v4;
    v17 = 2114;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    _os_log_debug_impl(&dword_20DABC000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: enqueueRequest: %p, %{public}@, %{public}@, queue count: %d", (uint8_t *)&v11, 0x30u);

  }
  if (-[NSMutableArray count](v5->_queue, "count") == 1)
    -[SORequestQueue _processItem:](v5, "_processItem:", v4);
  objc_sync_exit(v5);

}

- (void)processNextRequest
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_1_2(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_20DABC000, "%{public}@: processNextRequest: queue count: %d", v3, v4);
}

- (void)removeAllRequestsWithBlock:(id)a3
{
  void (**v4)(id, SORequestQueue *, void *);
  SORequestQueue *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSString *identifier;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  char v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, SORequestQueue *, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  SO_LOG_SORequestQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SORequestQueue removeAllRequestsWithBlock:].cold.1((uint64_t)v5->_identifier, -[NSMutableArray count](v5->_queue, "count"), (uint64_t)v30);

  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)-[NSMutableArray copy](v5->_queue, "copy");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      v20 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          SO_LOG_SORequestQueue();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            identifier = v5->_identifier;
            objc_msgSend(v11, "requestParameters");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = identifier;
            v27 = 2114;
            v28 = v16;
            _os_log_debug_impl(&dword_20DABC000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: checking %{public}@", buf, 0x16u);

            v7 = v20;
          }

          if ((objc_msgSend(v11, "isRunning") & 1) == 0)
          {
            SO_LOG_SORequestQueue();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v17 = v5->_identifier;
              objc_msgSend(v11, "requestParameters");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v26 = v17;
              v27 = 2114;
              v28 = v19;
              _os_log_debug_impl(&dword_20DABC000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: removing %{public}@", buf, 0x16u);

              v7 = v20;
            }

            v4[2](v4, v5, v11);
            -[NSMutableArray removeObject:](v5->_queue, "removeObject:", v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

  }
  objc_sync_exit(v5);

}

- (void)removeRequestWithIdentifier:(id)a3 block:(id)a4
{
  id v6;
  SORequestQueue *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSString *identifier;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(id, SORequestQueue *, void *);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v26 = (void (**)(id, SORequestQueue *, void *))a4;
  v7 = self;
  objc_sync_enter(v7);
  SO_LOG_SORequestQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SORequestQueue removeRequestWithIdentifier:block:].cold.1((uint64_t)v7, (uint64_t)v6, v8);

  if (v26)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = (void *)-[NSMutableArray copy](v7->_queue, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v28;
      v25 = v6;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
          SO_LOG_SORequestQueue();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            identifier = v7->_identifier;
            objc_msgSend(v13, "requestParameters");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = identifier;
            v33 = 2114;
            v34 = v21;
            _os_log_debug_impl(&dword_20DABC000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: checking %{public}@", buf, 0x16u);

            v6 = v25;
          }

          if ((objc_msgSend(v13, "isRunning") & 1) == 0)
          {
            objc_msgSend(v13, "requestParameters");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v6);

            if (v17)
            {
              SO_LOG_SORequestQueue();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                v22 = v7->_identifier;
                objc_msgSend(v13, "requestParameters");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v32 = v22;
                v33 = 2114;
                v34 = v24;
                _os_log_debug_impl(&dword_20DABC000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: removing %{public}@", buf, 0x16u);

                v6 = v25;
              }

              v26[2](v26, v7, v13);
              -[NSMutableArray removeObject:](v7->_queue, "removeObject:", v13);
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v10);
    }

  }
  objc_sync_exit(v7);

}

- (unint64_t)queueCount
{
  SORequestQueue *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableArray count](v2->_queue, "count");
  objc_sync_exit(v2);

  return v3;
}

+ (void)removeQueueWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)queues;
  objc_sync_enter(v3);
  objc_msgSend((id)queues, "setObject:forKeyedSubscript:", 0, v4);
  objc_sync_exit(v3);

}

- (void)_processItem:(id)a3
{
  id v5;
  SORequestQueue *v6;
  NSObject *v7;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  SO_LOG_SORequestQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SORequestQueue _processItem:].cold.1();

  objc_storeStrong((id *)&v6->_processingItem, a3);
  if (v6->_processItemBlock)
  {
    objc_msgSend(v5, "setIsRunning:", 1);
    (*((void (**)(void))v6->_processItemBlock + 2))();
  }
  objc_sync_exit(v6);

}

- (void)_itemCompleted
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  v4 = v0;
  OUTLINED_FUNCTION_0_1(&dword_20DABC000, v1, v2, "%{public}@: itemCompleted: %p", v3);
  OUTLINED_FUNCTION_1();
}

- (id)description
{
  SORequestQueue *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableArray description](v2->_queue, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)processItemBlock
{
  return self->_processItemBlock;
}

- (void)setProcessItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processItemBlock, 0);
  objc_storeStrong((id *)&self->_processingItem, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)removeAllRequestsWithBlock:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_1_2(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2_2(&dword_20DABC000, "%{public}@: removeAllRequests: queue count: %d", v3, v4);
}

- (void)removeRequestWithIdentifier:(NSObject *)a3 block:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_0_1(&dword_20DABC000, a3, (uint64_t)a3, "%{public}@: removeRequestWithIdentifier: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_processItem:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_20DABC000, v1, (uint64_t)v1, "%{public}@: processItem: %p", v2);
  OUTLINED_FUNCTION_1();
}

@end
