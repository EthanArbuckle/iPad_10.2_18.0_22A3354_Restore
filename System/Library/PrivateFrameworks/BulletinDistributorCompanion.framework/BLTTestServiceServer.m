@implementation BLTTestServiceServer

+ (id)sharedTestServer
{
  if (sharedTestServer___onceToken != -1)
    dispatch_once(&sharedTestServer___onceToken, &__block_literal_global_10);
  return (id)sharedTestServer___sharedInstance;
}

void __40__BLTTestServiceServer_sharedTestServer__block_invoke()
{
  BLTTestServiceServer *v0;
  void *v1;

  v0 = objc_alloc_init(BLTTestServiceServer);
  v1 = (void *)sharedTestServer___sharedInstance;
  sharedTestServer___sharedInstance = (uint64_t)v0;

}

- (BLTTestServiceServer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLTTestServiceServer;
  return -[BLTTestServiceServer init](&v3, sel_init);
}

- (void)resume
{
  NSMutableArray *v3;
  NSMutableArray *clientConnections;
  NSXPCListener *v5;
  NSXPCListener *listener;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  clientConnections = self->_clientConnections;
  self->_clientConnections = v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v5 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletindistributor.testservice"));
  listener = self->_listener;
  self->_listener = v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00EB8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke;
  v17[3] = &unk_24D762CB0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  objc_msgSend(v7, "setInvalidationHandler:", v17);
  v11 = v9;
  v12 = 3221225472;
  v13 = __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v14 = &unk_24D762CB0;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_msgSend(v7, "setInterruptionHandler:", &v11);
  -[NSMutableArray addObject:](self->_clientConnections, "addObject:", v7, v11, v12, v13, v14);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeClientConnection:", v2);

}

void __59__BLTTestServiceServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeClientConnection:", v2);

}

- (void)_removeClientConnection:(id)a3
{
  -[NSMutableArray removeObject:](self->_clientConnections, "removeObject:", a3);
}

- (void)addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;

  v14 = a3;
  v15 = a6;
  v16 = a9;
  BLTWorkQueue();
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke;
  v21[3] = &unk_24D762CD8;
  v27 = a5;
  v22 = v14;
  v23 = v15;
  v25 = a4;
  v26 = a7;
  v28 = a8;
  v24 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  dispatch_async(v17, v21);

}

void __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(unsigned __int8 *)(a1 + 73);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke_2;
  v9[3] = &unk_24D762AC0;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:completion:", v4, v7, v3, v5, v6, v8, v9);

}

uint64_t __112__BLTTestServiceServer_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  BLTWorkQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke;
  v10[3] = &unk_24D762270;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke_2;
  v4[3] = &unk_24D761B98;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "sendSectionInfoWithSectionID:completion:", v3, v4);

}

uint64_t __64__BLTTestServiceServer_sendSectionInfoWithSectionID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a4;
  BLTWorkQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke;
  v8[3] = &unk_24D762D00;
  v10 = a3;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke_2;
  v4[3] = &unk_24D761B98;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "sendAllSectionInfoWithSpool:completion:", v3, v4);

}

uint64_t __63__BLTTestServiceServer_sendAllSectionInfoWithSpool_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke_2;
  v3[3] = &unk_24D761B98;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "spoolSectionInfoWithCompletion:", v3);

}

uint64_t __55__BLTTestServiceServer_spoolSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSectionInfoSentCacheWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__BLTTestServiceServer_clearSectionInfoSentCacheWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __64__BLTTestServiceServer_clearSectionInfoSentCacheWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSectionInfoSentCache");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getStandaloneTestModeEnabledWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BLTTestServiceServer_getStandaloneTestModeEnabledWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __67__BLTTestServiceServer_getStandaloneTestModeEnabledWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isStandaloneTestModeEnabled");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6 completion:(id)a7
{
  id v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v11 = a7;
  BLTWorkQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __139__BLTTestServiceServer_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke;
  block[3] = &unk_24D762D28;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v15 = v11;
  v16 = a3;
  v13 = v11;
  dispatch_async(v12, block);

}

uint64_t __139__BLTTestServiceServer_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:", a1[5], a1[6], a1[7], a1[8]);

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)disableStandaloneTestModeWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__BLTTestServiceServer_disableStandaloneTestModeWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __64__BLTTestServiceServer_disableStandaloneTestModeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableStandaloneTestMode");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)willAlertForSectionID:(id)a3 subtype:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  int64_t v15;

  v7 = a3;
  v8 = a5;
  BLTWorkQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke;
  block[3] = &unk_24D762D50;
  v14 = v8;
  v15 = a4;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke_2;
  v5[3] = &unk_24D762AC0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "getWillNanoPresentNotificationForSectionID:subsectionIDs:subtype:completion:", v3, 0, v4, v5);

}

uint64_t __65__BLTTestServiceServer_willAlertForSectionID_subtype_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)settingOverridesWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_settingOverridesWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __55__BLTTestServiceServer_settingOverridesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "settingOverrides");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)originalSettingsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BLTTestServiceServer_originalSettingsWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __55__BLTTestServiceServer_originalSettingsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "originalSettings");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)overriddenSettingsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BLTTestServiceServer_overriddenSettingsWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __57__BLTTestServiceServer_overriddenSettingsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "overriddenSettings");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)removeSectionID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  BLTWorkQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__BLTTestServiceServer_removeSectionID_completion___block_invoke;
  v10[3] = &unk_24D761B20;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __51__BLTTestServiceServer_removeSectionID_completion___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeSectionID:", *(_QWORD *)(v1 + 32));

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)logFaultWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke;
  block[3] = &unk_24D761B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke_cold_1(v2);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)simulateAnalytics:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("BLTAnalyticsLogCompanionToGizmoDelay")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -50.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BLTAnalyticsLogCompanionToGizmoDelay(CFSTR("com.apple.test_section_id"), CFSTR("publisher_match_id"), v6, v7, 1);

  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("BLTAnalyticsLogBulletinSize")))
  {
    BLTAnalyticsLogBulletinSize(CFSTR("com.apple.test_section_id"), 5000000, CFSTR("publisher_match_id"));
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("BLTAnalyticsLogOutOfOrderMessage")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.invalid.analytics.type"), -1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v8);

      goto LABEL_8;
    }
    BLTAnalyticsLogOutOfOrderMessage();
  }
  v5[2](v5, 0);
LABEL_8:

}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __47__BLTTestServiceServer_logFaultWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2173D9000, log, OS_LOG_TYPE_FAULT, "Log fault called from test service", v1, 2u);
}

@end
