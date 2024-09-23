@implementation ACHQuery

- (ACHQuery)initWithInitialAchievementsHandler:(id)a3 newAchievementsHandler:(id)a4 updatedAchievementsHandler:(id)a5 removedAchievementsHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ACHQuery *v14;
  uint64_t v15;
  id initialAchievementsHandler;
  uint64_t v17;
  id newAchievementsHandler;
  uint64_t v19;
  id updatedAchievementsHandler;
  uint64_t v21;
  id removedAchievementsHandler;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ACHQuery;
  v14 = -[HKQuery _initWithObjectType:predicate:](&v24, sel__initWithObjectType_predicate_, 0, 0);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    initialAchievementsHandler = v14->_initialAchievementsHandler;
    v14->_initialAchievementsHandler = (id)v15;

    v17 = objc_msgSend(v11, "copy");
    newAchievementsHandler = v14->_newAchievementsHandler;
    v14->_newAchievementsHandler = (id)v17;

    v19 = objc_msgSend(v12, "copy");
    updatedAchievementsHandler = v14->_updatedAchievementsHandler;
    v14->_updatedAchievementsHandler = (id)v19;

    v21 = objc_msgSend(v13, "copy");
    removedAchievementsHandler = v14->_removedAchievementsHandler;
    v14->_removedAchievementsHandler = (id)v21;

  }
  return v14;
}

- (void)setErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ACHQuery_setErrorHandler___block_invoke;
  block[3] = &unk_24D126BC8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __28__ACHQuery_setErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (void)client_achievementsDidFinishInitialFetch:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_24D126C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject *v9;
  uint8_t buf[16];

  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214029000, v2, OS_LOG_TYPE_DEFAULT, "Query finished initial fetch", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "initialAchievementsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_184;
    v7[3] = &unk_24D126BF0;
    v9 = v4;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);

    v6 = v9;
  }
  else
  {
    ACHLogXPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_cold_1(v6);
  }

}

uint64_t __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)client_deliverNewAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHQuery *v9;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__ACHQuery_client_deliverNewAchievements___block_invoke;
  v7[3] = &unk_24D126C18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__ACHQuery_client_deliverNewAchievements___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v11 = v3;
    _os_log_impl(&dword_214029000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] new achievements", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "newAchievementsHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__ACHQuery_client_deliverNewAchievements___block_invoke_185;
    v7[3] = &unk_24D126BF0;
    v9 = v5;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __42__ACHQuery_client_deliverNewAchievements___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)client_deliverUpdatedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHQuery *v9;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke;
  v7[3] = &unk_24D126C18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v11 = v3;
    _os_log_impl(&dword_214029000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] updated achievements", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "updatedAchievementsHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke_186;
    v7[3] = &unk_24D126BF0;
    v9 = v5;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __46__ACHQuery_client_deliverUpdatedAchievements___block_invoke_186(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)client_deliverRemovedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHQuery *v9;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ACHQuery_client_deliverRemovedAchievements___block_invoke;
  v7[3] = &unk_24D126C18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__ACHQuery_client_deliverRemovedAchievements___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v11 = v3;
    _os_log_impl(&dword_214029000, v2, OS_LOG_TYPE_DEFAULT, "Query received [%lu] removed achievements", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "removedAchievementsHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__ACHQuery_client_deliverRemovedAchievements___block_invoke_187;
    v7[3] = &unk_24D126BF0;
    v9 = v5;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __46__ACHQuery_client_deliverRemovedAchievements___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)ACHQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, v4);

  -[ACHQuery setInitialAchievementsHandler:](self, "setInitialAchievementsHandler:", 0);
  -[ACHQuery setNewAchievementsHandler:](self, "setNewAchievementsHandler:", 0);
  -[ACHQuery setUpdatedAchievementsHandler:](self, "setUpdatedAchievementsHandler:", 0);
  -[ACHQuery setRemovedAchievementsHandler:](self, "setRemovedAchievementsHandler:", 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ACHQuery errorHandler](self, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __31__ACHQuery_queue_deliverError___block_invoke;
    v9[3] = &unk_24D126BF0;
    v11 = v7;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

uint64_t __31__ACHQuery_queue_deliverError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsTaskServers
{
  return 1;
}

+ (id)clientInterfaceProtocol
{
  return &unk_254D67888;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ACHQuery;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_achievementsDidFinishInitialFetch_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverNewAchievements_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverUpdatedAchievements_, 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverRemovedAchievements_, 0, 0);

}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (id)initialAchievementsHandler
{
  return self->_initialAchievementsHandler;
}

- (void)setInitialAchievementsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)newAchievementsHandler
{
  return self->_newAchievementsHandler;
}

- (void)setNewAchievementsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)updatedAchievementsHandler
{
  return self->_updatedAchievementsHandler;
}

- (void)setUpdatedAchievementsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)removedAchievementsHandler
{
  return self->_removedAchievementsHandler;
}

- (void)setRemovedAchievementsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removedAchievementsHandler, 0);
  objc_storeStrong(&self->_updatedAchievementsHandler, 0);
  objc_storeStrong(&self->_newAchievementsHandler, 0);
  objc_storeStrong(&self->_initialAchievementsHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
}

void __53__ACHQuery_client_achievementsDidFinishInitialFetch___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214029000, log, OS_LOG_TYPE_ERROR, "ACHQuery initialAchievementsHandler not provided!", v1, 2u);
}

@end
