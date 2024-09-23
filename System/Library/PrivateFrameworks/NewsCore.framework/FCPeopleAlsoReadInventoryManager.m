@implementation FCPeopleAlsoReadInventoryManager

- (FCPeopleAlsoReadInventoryManager)initWithInventory:(id)a3 readingHistory:(id)a4
{
  id v7;
  id v8;
  FCPeopleAlsoReadInventoryManager *v9;
  FCPeopleAlsoReadInventoryManager *v10;
  FCOperationThrottler *v11;
  FCOperationThrottler *refreshThrottler;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "inventory");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPeopleAlsoReadInventoryManager initWithInventory:readingHistory:]";
    v19 = 2080;
    v20 = "FCPeopleAlsoReadInventoryManager.m";
    v21 = 1024;
    v22 = 32;
    v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "readingHistory");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPeopleAlsoReadInventoryManager initWithInventory:readingHistory:]";
    v19 = 2080;
    v20 = "FCPeopleAlsoReadInventoryManager.m";
    v21 = 1024;
    v22 = 33;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCPeopleAlsoReadInventoryManager;
  v9 = -[FCPeopleAlsoReadInventoryManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inventory, a3);
    objc_msgSend(v8, "addObserver:", v10);
    v11 = -[FCOperationThrottler initWithDelegate:]([FCOperationThrottler alloc], "initWithDelegate:", v10);
    refreshThrottler = v10->_refreshThrottler;
    v10->_refreshThrottler = v11;

  }
  return v10;
}

- (FCPeopleAlsoReadInventoryManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPeopleAlsoReadInventoryManager init]";
    v9 = 2080;
    v10 = "FCPeopleAlsoReadInventoryManager.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPeopleAlsoReadInventoryManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[FCPeopleAlsoReadInventoryManager inventory](self, "inventory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__FCPeopleAlsoReadInventoryManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v8[3] = &unk_1E4644630;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "refreshIfNeededWithCompletion:", v8);

}

uint64_t __91__FCPeopleAlsoReadInventoryManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readingHistoryDidClear:(id)a3
{
  id v3;

  -[FCPeopleAlsoReadInventoryManager refreshThrottler](self, "refreshThrottler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickle");

}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
  id v3;

  -[FCPeopleAlsoReadInventoryManager refreshThrottler](self, "refreshThrottler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tickle");

}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  id v4;

  -[FCPeopleAlsoReadInventoryManager refreshThrottler](self, "refreshThrottler", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tickle");

}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  id v4;

  -[FCPeopleAlsoReadInventoryManager refreshThrottler](self, "refreshThrottler", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tickle");

}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a4, "allValues", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntegerValue") == 1)
        {
          -[FCPeopleAlsoReadInventoryManager refreshThrottler](self, "refreshThrottler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "tickle");

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (FCFeedItemInventoryType)inventory
{
  return self->_inventory;
}

- (FCOperationThrottler)refreshThrottler
{
  return self->_refreshThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshThrottler, 0);
  objc_storeStrong((id *)&self->_inventory, 0);
}

@end
