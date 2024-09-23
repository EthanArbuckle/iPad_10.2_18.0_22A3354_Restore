@implementation FAScreenTimeWrapper

- (FAScreenTimeWrapper)initWithUserDSID:(id)a3
{
  id v4;
  FAScreenTimeWrapper *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[4];
  FAScreenTimeWrapper *v13;
  id v14;
  NSObject *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FAScreenTimeWrapper;
  v5 = -[FAScreenTimeWrapper init](&v16, sel_init);
  if (v5 && objc_msgSend(v4, "intValue") != -1)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__FAScreenTimeWrapper_initWithUserDSID___block_invoke;
    block[3] = &unk_24C88C190;
    v13 = v5;
    v14 = v4;
    v8 = v6;
    v15 = v8;
    dispatch_sync(v7, block);

    v9 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v8, v9))
    {
      _FALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FAScreenTimeWrapper initWithUserDSID:].cold.1(v10);

    }
  }

  return v5;
}

void __40__FAScreenTimeWrapper_initWithUserDSID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE84818]), "initWithUserDSID:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setUserDSID:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)getScreenTimeUsageGraphForUser
{
  void *v3;
  int v4;
  void *provider;

  -[FAScreenTimeWrapper userDSID](self, "userDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == -1)
  {
    provider = 0;
  }
  else
  {
    provider = self->_provider;
    if (provider)
    {
      objc_msgSend(provider, "usageSummaryTableViewCellForUser");
      provider = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return provider;
}

- (BOOL)activityEnabledForUser
{
  STUsageSummaryTableViewCellProvider *provider;
  uint64_t v4;

  provider = self->_provider;
  if (provider)
    v4 = -[STUsageSummaryTableViewCellProvider shouldShowUsageSummaryForUser](provider, "shouldShowUsageSummaryForUser");
  else
    v4 = 0;
  -[FAScreenTimeWrapper setPreviousState:](self, "setPreviousState:", v4);
  return v4;
}

- (BOOL)activityEnablementChanged
{
  BOOL v3;

  v3 = -[FAScreenTimeWrapper previousState](self, "previousState");
  return v3 ^ -[FAScreenTimeWrapper activityEnabledForUser](self, "activityEnabledForUser");
}

- (void)refresh
{
  STUsageSummaryTableViewCellProvider *provider;

  provider = self->_provider;
  if (provider)
    -[STUsageSummaryTableViewCellProvider refresh](provider, "refresh");
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  self->_userDSID = (NSNumber *)a3;
}

- (STUsageSummaryTableViewCellProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (BOOL)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(BOOL)a3
{
  self->_previousState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)initWithUserDSID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "Failed FAScreenTimeWrapper provider create! Timed out", v1, 2u);
}

@end
