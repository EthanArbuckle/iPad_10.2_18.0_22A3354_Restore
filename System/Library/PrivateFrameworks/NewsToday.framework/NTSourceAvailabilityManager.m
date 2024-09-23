@implementation NTSourceAvailabilityManager

- (NSOrderedSet)availabilityEntriesInPreferredOrder
{
  return self->_availabilityEntriesInPreferredOrder;
}

- (NTSourceAvailabilityManager)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSourceAvailabilityManager init]";
    v9 = 2080;
    v10 = "NTSourceAvailabilityManager.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSourceAvailabilityManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTSourceAvailabilityManager)initWithAvailabilityEntriesInPreferredOrder:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSOrderedSet *availabilityEntriesInPreferredOrder;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v17;
  NTSourceAvailabilityManager *val;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id location;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:].cold.2();
  if (!objc_msgSend(v6, "count", v6) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:].cold.1();
  v27.receiver = self;
  v27.super_class = (Class)NTSourceAvailabilityManager;
  val = -[NTSourceAvailabilityManager init](&v27, sel_init);
  if (val)
  {
    v8 = objc_msgSend(v17, "copy");
    availabilityEntriesInPreferredOrder = val->_availabilityEntriesInPreferredOrder;
    val->_availabilityEntriesInPreferredOrder = (NSOrderedSet *)v8;

    objc_storeStrong((id *)&val->_queue, a4);
    objc_initWeak(&location, val);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v17;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      v13 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v19[0] = v13;
          v19[1] = 3221225472;
          v19[2] = __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke;
          v19[3] = &unk_24DB5F6C8;
          v20 = v7;
          objc_copyWeak(&v21, &location);
          objc_msgSend(v15, "setAvailabilityChangedNotificationBlock:", v19);
          objc_destroyWeak(&v21);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v11);
    }

    -[NTSourceAvailabilityManager _recomputePreferredAvailableTodayResultsSource](val, "_recomputePreferredAvailableTodayResultsSource");
    objc_destroyWeak(&location);
  }

  return val;
}

void __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke_2;
  block[3] = &unk_24DB5F6A0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __81__NTSourceAvailabilityManager_initWithAvailabilityEntriesInPreferredOrder_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recomputePreferredAvailableTodayResultsSource");

}

- (void)setPreferredSourceChangedNotificationBlock:(id)a3
{
  void *v4;
  id preferredSourceChangedNotificationBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  preferredSourceChangedNotificationBlock = self->_preferredSourceChangedNotificationBlock;
  self->_preferredSourceChangedNotificationBlock = v4;

}

- (id)preferredSourceChangedNotificationBlock
{
  return (id)MEMORY[0x219A33CDC](self->_preferredSourceChangedNotificationBlock, a2);
}

- (void)_recomputePreferredAvailableTodayResultsSource
{
  uint64_t v3;
  void *v4;
  id v5;

  -[NTSourceAvailabilityManager availabilityEntriesInPreferredOrder](self, "availabilityEntriesInPreferredOrder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_11);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NTSourceAvailabilityManager _setPreferredAvailableTodayResultsSource:](self, "_setPreferredAvailableTodayResultsSource:", 0);
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTSourceAvailabilityManager _setPreferredAvailableTodayResultsSource:](self, "_setPreferredAvailableTodayResultsSource:", objc_msgSend(v4, "todayResultsFetchDescriptorClass"));

  }
}

uint64_t __77__NTSourceAvailabilityManager__recomputePreferredAvailableTodayResultsSource__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAvailable");
}

- (void)_setPreferredAvailableTodayResultsSource:(Class)a3
{
  void *v5;
  void (**v6)(void);

  if (-[NTSourceAvailabilityManager preferredSourceFetchDescriptorClass](self, "preferredSourceFetchDescriptorClass") != a3)
  {
    -[NTSourceAvailabilityManager setPreferredSourceFetchDescriptorClass:](self, "setPreferredSourceFetchDescriptorClass:", a3);
    -[NTSourceAvailabilityManager preferredSourceChangedNotificationBlock](self, "preferredSourceChangedNotificationBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NTSourceAvailabilityManager preferredSourceChangedNotificationBlock](self, "preferredSourceChangedNotificationBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }
}

- (Class)preferredSourceFetchDescriptorClass
{
  return self->_preferredSourceFetchDescriptorClass;
}

- (void)setPreferredSourceFetchDescriptorClass:(Class)a3
{
  self->_preferredSourceFetchDescriptorClass = a3;
}

- (void)setAvailabilityEntriesInPreferredOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_availabilityEntriesInPreferredOrder, 0);
  objc_storeStrong(&self->_preferredSourceChangedNotificationBlock, 0);
}

- (void)initWithAvailabilityEntriesInPreferredOrder:queue:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"availabilityEntries.count > 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAvailabilityEntriesInPreferredOrder:queue:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"availabilityEntries", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
