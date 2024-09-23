@implementation MDSearchQuery

- (MDSearchQuery)initWithPredicate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MDSearchQuery *v9;
  uint64_t v10;
  NSPredicate *predicate;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "generateMetadataDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MDSearchQuery initWithQueryString:options:](self, "initWithQueryString:options:", v8, v7);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    predicate = v9->_predicate;
    v9->_predicate = (NSPredicate *)v10;

  }
  return v9;
}

- (MDSearchQuery)initWithQueryString:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  MDSearchQuery *v8;
  CSSearchQuery *v9;
  CSSearchQuery *query;
  uint64_t v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MDSearchQuery;
  v8 = -[MDSearchQuery init](&v20, sel_init);
  if (v8)
  {
    location = 0;
    objc_initWeak(&location, v8);
    v9 = -[CSSearchQuery initWithQueryString:options:]([CSSearchQuery alloc], "initWithQueryString:options:", v6, v7);
    query = v8->_query;
    v8->_query = v9;

    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__MDSearchQuery_initWithQueryString_options___block_invoke;
    v17[3] = &unk_1E2402878;
    objc_copyWeak(&v18, &location);
    -[CSSearchQuery setFoundItemsHandler:](v8->_query, "setFoundItemsHandler:", v17);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __45__MDSearchQuery_initWithQueryString_options___block_invoke_2;
    v15[3] = &unk_1E24028A0;
    objc_copyWeak(&v16, &location);
    -[CSSearchQuery setCompletionHandler:](v8->_query, "setCompletionHandler:", v15);
    -[CSSearchQuery queue](v8->_query, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    v8->_status = 0;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__MDSearchQuery_initWithQueryString_options___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didReturnItems:", v3);

}

void __45__MDSearchQuery_initWithQueryString_options___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didFinishWithError:", v3);

}

- (id)queryString
{
  return -[CSSearchQuery queryString](self->_query, "queryString");
}

- (NSDictionary)options
{
  return (NSDictionary *)-[CSSearchQuery options](self->_query, "options");
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MDSearchQuery_start__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  dispatch_async(queue, block);
}

void __22__MDSearchQuery_start__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D782104]();
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "setStatus:", 1);
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __22__MDSearchQuery_start__block_invoke_cold_1((uint64_t)v3);

  objc_msgSend(*v3, "setStatus:", 2);
  objc_msgSend(*v3, "clientBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*v3, "clientBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)*v3 + 5), "setBundleIDs:", v8);

  }
  objc_msgSend(*((id *)*v3 + 5), "start");
  objc_autoreleasePoolPop(v2);
}

- (void)cancel
{
  -[CSSearchQuery cancel](self->_query, "cancel");
}

- (unint64_t)status
{
  MDSearchQuery *v2;
  unint64_t status;

  v2 = self;
  objc_sync_enter(v2);
  status = v2->_status;
  objc_sync_exit(v2);

  return status;
}

- (void)setStatus:(unint64_t)a3
{
  MDSearchQuery *v5;
  unint64_t status;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v11;
  MDSearchQuery *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self;
  objc_sync_enter(v5);
  status = v5->_status;
  v5->_status = a3;
  objc_sync_exit(v5);

  if (status != a3)
  {
    logForCSLogCategoryQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = -[CSSearchQuery isCancelled](v5->_query, "isCancelled");
      v10 = CFSTR("NO");
      v11 = 138413058;
      v12 = v5;
      v13 = 2048;
      if (v9)
        v10 = CFSTR("YES");
      v14 = status;
      v15 = 2048;
      v16 = a3;
      v17 = 2112;
      v18 = v10;
      _os_log_debug_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEBUG, "%@, status changed, status:%ld/%ld, canceled:%@", (uint8_t *)&v11, 0x2Au);
    }

    -[MDSearchQuery delegate](v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "searchQuery:statusChanged:", v5, a3);

  }
}

- (void)_didReturnItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MDSearchQuery _didReturnItems:].cold.1((uint64_t)self, v4);

  -[MDSearchQuery delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchQuery:didReturnItems:", self, v4);

}

- (void)_didFinishWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v6)
    {
      v7 = v4;
LABEL_9:
      -[MDSearchQuery setStatus:](self, "setStatus:", 5);
      logForCSLogCategoryQuery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MDSearchQuery _didFinishWithError:].cold.2((uint64_t)self, (uint64_t)v7, v11);

      -[MDSearchQuery delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "searchQuery:didFailWithError:", self, v7);

      goto LABEL_16;
    }
    if (objc_msgSend(v4, "code") != -2003)
    {
      v8 = objc_msgSend(v4, "code") == -2001 ? -1100 : -1;
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("MDSearchQueryErrorDomain"), v8, v10);

      if (v7)
        goto LABEL_9;
    }
  }
  -[MDSearchQuery setStatus:](self, "setStatus:", 3);
  logForCSLogCategoryQuery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MDSearchQuery _didFinishWithError:].cold.1((uint64_t)self);
LABEL_16:

}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (MDSearchQueryDelegate)delegate
{
  return (MDSearchQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predicate, 0);
}

void __22__MDSearchQuery_start__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 40), "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v1, v2, "%@ searching with query:\"%@\", v3, v4, v5, v6, 2u);

}

- (void)_didReturnItems:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "%@, found %lu results", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)_didFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 40), "foundItemCount");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v1, v2, "%@, completed with %ld results", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)_didFinishWithError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "%@, failed with error:%@", (uint8_t *)&v3, 0x16u);
}

@end
