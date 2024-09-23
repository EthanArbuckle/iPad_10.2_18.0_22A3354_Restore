@implementation CRKConcreteIDSLocalPrimitives

- (CRKConcreteIDSLocalPrimitives)initWithServiceName:(id)a3
{
  id v4;
  CRKConcreteIDSLocalPrimitives *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *backingAccounts;
  uint64_t v9;
  NSHashTable *didSendSubscriptions;
  uint64_t v11;
  NSHashTable *didReceiveSubscriptions;
  uint64_t v13;
  NSString *serviceName;
  uint64_t v15;
  IDSService *service;
  void *v17;
  uint64_t v18;
  IDSAccountController *accountController;
  uint64_t v20;
  CRKArrayDifferenceEngine *accountsDifferenceEngine;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKConcreteIDSLocalPrimitives;
  v5 = -[CRKConcreteIDSLocalPrimitives init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setWantsCrossAccountMessaging:", 1);
    v7 = objc_opt_new();
    backingAccounts = v5->_backingAccounts;
    v5->_backingAccounts = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    didSendSubscriptions = v5->_didSendSubscriptions;
    v5->_didSendSubscriptions = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    didReceiveSubscriptions = v5->_didReceiveSubscriptions;
    v5->_didReceiveSubscriptions = (NSHashTable *)v11;

    v13 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v4);
    service = v5->_service;
    v5->_service = (IDSService *)v15;

    v17 = (void *)MEMORY[0x24BDAC9B8];
    -[IDSService addDelegate:withDelegateProperties:queue:](v5->_service, "addDelegate:withDelegateProperties:queue:", v5, v6, MEMORY[0x24BDAC9B8]);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FBE0]), "initWithService:", v4);
    accountController = v5->_accountController;
    v5->_accountController = (IDSAccountController *)v18;

    -[IDSAccountController addDelegate:queue:](v5->_accountController, "addDelegate:queue:", v5, v17);
    objc_msgSend((id)objc_opt_class(), "makeAccountsDifferenceEngineForPrimitives:", v5);
    v20 = objc_claimAutoreleasedReturnValue();
    accountsDifferenceEngine = v5->_accountsDifferenceEngine;
    v5->_accountsDifferenceEngine = (CRKArrayDifferenceEngine *)v20;

    -[CRKConcreteIDSLocalPrimitives publishAccountChanges](v5, "publishAccountChanges");
  }

  return v5;
}

- (id)subscribeToMessageReceivesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  CRKConcreteIDSMessageDidReceiveSubscription *v8;
  int v10;
  void *v11;
  __int16 v12;
  CRKConcreteIDSLocalPrimitives *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogASM_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "%{public}@ - %p: Creating message receive subscription", (uint8_t *)&v10, 0x16u);

  }
  v8 = -[CRKConcreteIDSMessageDidReceiveSubscription initWithHandler:]([CRKConcreteIDSMessageDidReceiveSubscription alloc], "initWithHandler:", v4);

  -[CRKConcreteIDSMessageDidReceiveSubscription setDelegate:](v8, "setDelegate:", self);
  return v8;
}

- (id)subscribeToMessageSendsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  CRKConcreteIDSMessageDidSendSubscription *v8;
  int v10;
  void *v11;
  __int16 v12;
  CRKConcreteIDSLocalPrimitives *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogASM_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "%{public}@ - %p: Creating message send subscription", (uint8_t *)&v10, 0x16u);

  }
  v8 = -[CRKConcreteIDSMessageDidSendSubscription initWithHandler:]([CRKConcreteIDSMessageDidSendSubscription alloc], "initWithHandler:", v4);

  -[CRKConcreteIDSMessageDidSendSubscription setDelegate:](v8, "setDelegate:", self);
  return v8;
}

- (BOOL)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  int v29;
  void *v30;
  __int16 v31;
  CRKConcreteIDSLocalPrimitives *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = (void *)MEMORY[0x219A21F80](a5);
  _CRKLogASM_5();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544642;
    v30 = v20;
    v31 = 2048;
    v32 = self;
    v33 = 2114;
    v34 = v14;
    v35 = 2114;
    v36 = v15;
    v37 = 2114;
    v38 = v17;
    v39 = 2114;
    v40 = v16;
    _os_log_impl(&dword_218C99000, v18, OS_LOG_TYPE_INFO, "%{public}@ - %p: Sending message %{public}@ to destination %{public}@ from appleID %{public}@ with options: %{public}@", (uint8_t *)&v29, 0x3Eu);

  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "shouldFireAndForget"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE4FAA8]);

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE4FAC8]);
  objc_msgSend(v16, "deliveryTimeout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE4FB30]);

  -[CRKConcreteIDSLocalPrimitives service](self, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v21, "copy");
  v27 = objc_msgSend(v24, "sendMessage:toDestinations:priority:options:identifier:error:", v14, v25, 300, v26, a7, a8);

  return v27;
}

- (void)fetchFirewallWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CRKConcreteIDSLocalPrimitives_fetchFirewallWithCompletion___block_invoke;
  v7[3] = &unk_24D9C76E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "retrieveFirewallWithQueue:completion:", MEMORY[0x24BDAC9B8], v7);

}

void __61__CRKConcreteIDSLocalPrimitives_fetchFirewallWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CRKConcreteIDSFirewall *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = -[CRKConcreteIDSFirewall initWithUnderlyingFirewall:]([CRKConcreteIDSFirewall alloc], "initWithUnderlyingFirewall:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)forceRefreshIDStatusForDestinations:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE4FC40];
  v8 = a3;
  objc_msgSend(v7, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteIDSLocalPrimitives serviceName](self, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteIDSLocalPrimitives serviceName](self, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__CRKConcreteIDSLocalPrimitives_forceRefreshIDStatusForDestinations_completion___block_invoke;
  v13[3] = &unk_24D9C7708;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v9, "forceRefreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v8, v10, v11, MEMORY[0x24BDAC9B8], v13);

}

void __80__CRKConcreteIDSLocalPrimitives_forceRefreshIDStatusForDestinations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "errorsByAddressForQueryRefreshResult:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (NSDictionary)debugInfo
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Accounts");
  -[CRKConcreteIDSLocalPrimitives accounts](self, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

uint64_t __42__CRKConcreteIDSLocalPrimitives_debugInfo__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (id)makeRemoteUserNotRegisteredError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE4F9D0], 3, 0);
}

- (BOOL)isRemoteUserNotRegisteredError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE4F9D0]))
    v5 = objc_msgSend(v3, "code") == 3;
  else
    v5 = 0;

  return v5;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  CRKConcreteIDSLocalPrimitives *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v8 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a7;
  _CRKLogASM_5();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "verboseDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v29 = v14;
    v30 = 2048;
    v31 = self;
    v32 = 2114;
    v33 = v10;
    v34 = 2114;
    v35 = v15;
    v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "%{public}@ - %p: IDSService did send message (%{public}@) with success (%{public}@) and error (%{public}@)", buf, 0x34u);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CRKConcreteIDSLocalPrimitives didSendSubscriptions](self, "didSendSubscriptions", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "receiveMessageIdentifier:didSucceed:error:", v10, v8, v11);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  CRKConcreteIDSLocalPrimitives *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  _CRKLogASM_5();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v13;
    v28 = 2048;
    v29 = self;
    v30 = 2114;
    v31 = v9;
    v32 = 2114;
    v33 = v10;
    _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@ - %p: IDSService did receive message (%{public}@) from sender (%{public}@)", buf, 0x2Au);

  }
  v14 = (void *)IDSCopyRawAddressForDestination();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CRKConcreteIDSLocalPrimitives didReceiveSubscriptions](self, "didReceiveSubscriptions", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "receiveMessage:senderAppleID:senderAddress:", v9, v14, v10);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

}

- (void)didSendSubscriptionDidResume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives didSendSubscriptions](self, "didSendSubscriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)didSendSubscriptionDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives didSendSubscriptions](self, "didSendSubscriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)didReceiveSubscriptionDidResume:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives didReceiveSubscriptions](self, "didReceiveSubscriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)didReceiveSubscriptionDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives didReceiveSubscriptions](self, "didReceiveSubscriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

+ (id)makeAccountsDifferenceEngineForPrimitives:(id)a3
{
  id v3;
  void *v4;
  CRKArrayDifferenceEngine *v5;

  v3 = a3;
  +[CRKArrayDifferenceEngine configurationWithIncomingItemsIdentifierFunction:publishedItemsIdentifierFunction:](CRKArrayDifferenceEngine, "configurationWithIncomingItemsIdentifierFunction:publishedItemsIdentifierFunction:", &__block_literal_global_23, &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdateBlock:", &__block_literal_global_27);
  objc_msgSend(v4, "setLiftingFunction:", &__block_literal_global_29);
  v5 = -[CRKArrayDifferenceEngine initWithObject:keyPath:configuration:]([CRKArrayDifferenceEngine alloc], "initWithObject:keyPath:configuration:", v3, CFSTR("accounts"), v4);

  return v5;
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginID");
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginID");
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "updateWithAccount:");
  return 0;
}

CRKConcreteIDSAccount *__75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  CRKConcreteIDSAccount *v3;

  v2 = a2;
  v3 = -[CRKConcreteIDSAccount initWithAccount:]([CRKConcreteIDSAccount alloc], "initWithAccount:", v2);

  return v3;
}

- (void)publishAccountChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[CRKConcreteIDSLocalPrimitives accountController](self, "accountController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1A8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  -[CRKConcreteIDSLocalPrimitives accountsDifferenceEngine](self, "accountsDifferenceEngine");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithNewArray:", v8);

}

- (id)errorsByAddressForQueryRefreshResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  CRKConcreteIDSLocalPrimitives *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __70__CRKConcreteIDSLocalPrimitives_errorsByAddressForQueryRefreshResult___block_invoke;
  v12 = &unk_24D9C7870;
  v13 = v5;
  v14 = self;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __70__CRKConcreteIDSLocalPrimitives_errorsByAddressForQueryRefreshResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorForIDSIDStatus:", objc_msgSend(a3, "integerValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)errorForIDSIDStatus:(int64_t)a3
{
  uint64_t v3;

  if (a3)
  {
    if (a3 == 1)
      return 0;
    if (a3 == 2)
      v3 = 46;
    else
      v3 = 1;
  }
  else
  {
    v3 = 45;
  }
  CRKErrorWithCodeAndUserInfo(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)accounts
{
  void *v2;
  void *v3;

  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)insertObject:(id)a3 inAccountsAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

}

- (void)insertAccounts:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObjects:atIndexes:", v7, v6);

}

- (void)removeObjectFromAccountsAtIndex:(unint64_t)a3
{
  id v4;

  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectAtIndex:", a3);

}

- (void)removeAccountsAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v4);

}

- (void)replaceObjectInAccountsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CRKConcreteIDSLocalPrimitives backingAccounts](self, "backingAccounts");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (IDSService)service
{
  return self->_service;
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (CRKArrayDifferenceEngine)accountsDifferenceEngine
{
  return self->_accountsDifferenceEngine;
}

- (NSMutableArray)backingAccounts
{
  return self->_backingAccounts;
}

- (NSHashTable)didSendSubscriptions
{
  return self->_didSendSubscriptions;
}

- (NSHashTable)didReceiveSubscriptions
{
  return self->_didReceiveSubscriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didReceiveSubscriptions, 0);
  objc_storeStrong((id *)&self->_didSendSubscriptions, 0);
  objc_storeStrong((id *)&self->_backingAccounts, 0);
  objc_storeStrong((id *)&self->_accountsDifferenceEngine, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
