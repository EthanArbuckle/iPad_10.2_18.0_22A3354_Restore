@implementation ACHClient

- (ACHClient)initWithHealthStore:(id)a3
{
  id v4;
  ACHClient *v5;
  uint64_t v6;
  OS_dispatch_queue *serverQueue;
  uint64_t v8;
  OS_dispatch_queue *clientQueue;
  uint64_t v10;
  HKPluginProxyProvider *pluginProxyProvider;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHClient;
  v5 = -[ACHClient init](&v13, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueueWithQOSClass();
    v6 = objc_claimAutoreleasedReturnValue();
    serverQueue = v5->_serverQueue;
    v5->_serverQueue = (OS_dispatch_queue *)v6;

    HKCreateSerialDispatchQueueWithQOSClass();
    v8 = objc_claimAutoreleasedReturnValue();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3E18]), "initWithHealthStore:pluginIdentifier:exportedObject:", v4, CFSTR("com.apple.ActivityAchievements.Plugin"), v5);
    pluginProxyProvider = v5->_pluginProxyProvider;
    v5->_pluginProxyProvider = (HKPluginProxyProvider *)v10;

  }
  return v5;
}

- (id)exportedInterface
{
  return 0;
}

- (void)fetchAllTemplatesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_2;
  v5[3] = &unk_24D127418;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_fetchAllTemplatesWithCompletion:", v5);

}

void __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __45__ACHClient_fetchAllTemplatesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addTemplate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __36__ACHClient_addTemplate_completion___block_invoke;
  v13[3] = &unk_24D127490;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __36__ACHClient_addTemplate_completion___block_invoke_2;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __36__ACHClient_addTemplate_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_clientQueueCompletion:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_addTemplate:completion:", v2, v6);

}

uint64_t __36__ACHClient_addTemplate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeTemplate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__ACHClient_removeTemplate_completion___block_invoke;
  v13[3] = &unk_24D127490;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __39__ACHClient_removeTemplate_completion___block_invoke_2;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __39__ACHClient_removeTemplate_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_clientQueueCompletion:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_removeTemplate:completion:", v2, v6);

}

uint64_t __39__ACHClient_removeTemplate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllTemplatesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke;
  v9[3] = &unk_24D1274B8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke_2;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_clientQueueCompletion:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_removeAllTemplatesWithCompletion:", v5);

}

uint64_t __46__ACHClient_removeAllTemplatesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllEarnedInstancesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_2;
  v5[3] = &unk_24D127418;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_fetchAllEarnedInstancesWithCompletion:", v5);

}

void __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__ACHClient_fetchAllEarnedInstancesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addEarnedInstance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__ACHClient_addEarnedInstance_completion___block_invoke;
  v13[3] = &unk_24D127490;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __42__ACHClient_addEarnedInstance_completion___block_invoke_2;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __42__ACHClient_addEarnedInstance_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_clientQueueCompletion:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_addEarnedInstance:completion:", v2, v6);

}

uint64_t __42__ACHClient_addEarnedInstance_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeEarnedInstance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__ACHClient_removeEarnedInstance_completion___block_invoke;
  v13[3] = &unk_24D127490;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __45__ACHClient_removeEarnedInstance_completion___block_invoke_2;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __45__ACHClient_removeEarnedInstance_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_clientQueueCompletion:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_removeEarnedInstance:completion:", v2, v6);

}

uint64_t __45__ACHClient_removeEarnedInstance_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllEarnedInstancesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke;
  v9[3] = &unk_24D1274B8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke_2;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_clientQueueCompletion:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_removeAllEarnedInstancesWithCompletion:", v5);

}

uint64_t __52__ACHClient_removeAllEarnedInstancesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllAchievementsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_2;
  v5[3] = &unk_24D127418;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_fetchAllAchievementsWithCompletion:", v5);

}

void __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__ACHClient_fetchAllAchievementsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke;
  v13[3] = &unk_24D127508;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_4;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_2;
  v6[3] = &unk_24D1274E0;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "remote_fetchAchievementWithTemplateUniqueName:completion:", v4, v6);

}

void __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __63__ACHClient_fetchAchievementWithTemplateUniqueName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchEphemeralAchievementWithTemplateUniqueName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke;
  v13[3] = &unk_24D127508;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_4;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_2;
  v6[3] = &unk_24D1274E0;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "remote_fetchEphemeralAchievementWithTemplateUniqueName:completion:", v4, v6);

}

void __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __72__ACHClient_fetchEphemeralAchievementWithTemplateUniqueName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceAwardingSchedulerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_2;
  v5[3] = &unk_24D127558;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_forceAwardingSchedulerWithCompletion:", v5);

}

void __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_3;
    block[3] = &unk_24D127530;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __50__ACHClient_forceAwardingSchedulerWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runMonthlyChallengesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_2;
  v5[3] = &unk_24D127558;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_runMonthlyChallengesWithCompletion:", v5);

}

void __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_3;
    block[3] = &unk_24D127530;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __48__ACHClient_runMonthlyChallengesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)templateForMonthlyChallengeType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke;
  v11[3] = &unk_24D1275A8;
  v13 = a3;
  v11[4] = self;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_4;
  v9[3] = &unk_24D127468;
  v10 = v12;
  v8 = v12;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v11, v9);

}

void __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_2;
  v6[3] = &unk_24D127580;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(a2, "remote_templateForMonthlyChallengeType:completion:", v4, v6);

}

void __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __56__ACHClient_templateForMonthlyChallengeType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)monthlyChallengeForDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke;
  v13[3] = &unk_24D127508;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_4;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __48__ACHClient_monthlyChallengeForDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_2;
  v6[3] = &unk_24D127580;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "remote_monthlyChallengeForDate:completion:", v4, v6);

}

void __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__ACHClient_monthlyChallengeForDate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchActivityChallengeAssetsServerURLWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_2;
  v5[3] = &unk_24D1275D0;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_fetchActivityChallengeAssetsServerURLWithCompletion:", v5);

}

void __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_3;
    block[3] = &unk_24D1268F0;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __65__ACHClient_fetchActivityChallengeAssetsServerURLWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setActivityChallengeAssetsServerURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ACHClient *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke;
  v13[3] = &unk_24D127508;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_4;
  v11[3] = &unk_24D127468;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v13, v11);

}

void __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_2;
  v6[3] = &unk_24D127558;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "remote_setActivityChallengeAssetsServerURL:completion:", v4, v6);

}

void __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_3;
    block[3] = &unk_24D127530;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __60__ACHClient_setActivityChallengeAssetsServerURL_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)availableMobileAssetsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke;
  v9[3] = &unk_24D127440;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_4;
  v7[3] = &unk_24D127468;
  v8 = v10;
  v6 = v10;
  -[ACHClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v9, v7);

}

void __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_2;
  v5[3] = &unk_24D1275F8;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_availableMobileAssetsWithCompletion:", v5);

}

void __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_3;
    v5[3] = &unk_24D126BF0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __49__ACHClient_availableMobileAssetsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACHClient serverQueue](self, "serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ACHClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_24D127648;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pluginProxyProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__ACHClient__remoteProxy_errorHandler___block_invoke_2;
  v4[3] = &unk_24D127620;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchPluginProxyWithHandler:errorHandler:", v3, v4);

}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;

  v3 = a2;
  ACHLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__ACHClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "injectedErrorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "injectedErrorHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v3);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }

}

- (id)_clientQueueCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__ACHClient__clientQueueCompletion___block_invoke;
  v8[3] = &unk_24D127558;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199C8598](v8);

  return v6;
}

void __36__ACHClient__clientQueueCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ACHClient__clientQueueCompletion___block_invoke_2;
    block[3] = &unk_24D127530;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __36__ACHClient__clientQueueCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_addPluginProxyErrorHandler:(id)a3
{
  void *v4;
  id injectedErrorHandler;

  v4 = (void *)MEMORY[0x2199C8598](a3, a2);
  injectedErrorHandler = self->_injectedErrorHandler;
  self->_injectedErrorHandler = v4;

}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverQueue, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (ACHServerInterface)serverProxy
{
  return self->_serverProxy;
}

- (void)setServerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serverProxy, a3);
}

- (HKPluginProxyProvider)pluginProxyProvider
{
  return self->_pluginProxyProvider;
}

- (void)setPluginProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pluginProxyProvider, a3);
}

- (id)injectedErrorHandler
{
  return self->_injectedErrorHandler;
}

- (void)setInjectedErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectedErrorHandler, 0);
  objc_storeStrong((id *)&self->_pluginProxyProvider, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __39__ACHClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_214029000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch plugin proxy with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
