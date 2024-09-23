@implementation ASFriendListQuery

- (ASFriendListQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  ASFriendListQuery *v5;
  uint64_t v6;
  id updateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASFriendListQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updateHandler = v5->_updateHandler;
    v5->_updateHandler = (id)v6;

  }
  return v5;
}

- (void)client_deliverFriendList:(id)a3 queryUUID:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ASFriendListQuery *v15;
  id v16;
  int v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_mostRecentToken + 1;
  self->_mostRecentToken = v8;
  ASLoggingInitialize();
  v9 = ASLogFriendList;
  if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v8;
    _os_log_impl(&dword_21381F000, v9, OS_LOG_TYPE_DEFAULT, "Query received deliverFriendListData: %d", buf, 8u);
  }
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke;
  v13[3] = &unk_24D057D10;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, v13);

}

void __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke(uint64_t a1)
{
  ASCodableFriendList *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = -[ASCodableFriendList initWithData:]([ASCodableFriendList alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  ASFriendsFromCodableFriendList(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v4 = (void *)ASLogFriendList;
  if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Received data for %lu friends", buf, 0xCu);

  }
  v6 = (void *)MEMORY[0x2199B71D0](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke_3;
    v10[3] = &unk_24D057CE8;
    v13 = *(_DWORD *)(a1 + 56);
    v10[4] = v8;
    v12 = v6;
    v11 = v3;
    objc_msgSend(v8, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v9, 0, v10);

  }
}

void __56__ASFriendListQuery_client_deliverFriendList_queryUUID___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(_QWORD *)(a1 + 32) + 160))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    ASLoggingInitialize();
    v2 = ASLogFriendList;
    if (os_log_type_enabled((os_log_t)ASLogFriendList, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_DWORD *)(a1 + 56);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_21381F000, v2, OS_LOG_TYPE_DEFAULT, "Dropping this update for stale token: %d", (uint8_t *)v4, 8u);
    }
  }
}

+ (BOOL)supportsTaskServers
{
  return 1;
}

+ (id)clientInterfaceProtocol
{
  return &unk_254D0D780;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASFriendListQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASFriendListQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x2199B71D0](self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__ASFriendListQuery_queue_deliverError___block_invoke;
    block[3] = &unk_24D057D38;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __40__ASFriendListQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
