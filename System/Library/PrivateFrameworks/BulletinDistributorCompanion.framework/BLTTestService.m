@implementation BLTTestService

+ (id)sharedTestService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BLTTestService_sharedTestService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTestService_onceToken != -1)
    dispatch_once(&sharedTestService_onceToken, block);
  return (id)sharedTestService_sharedService;
}

void __35__BLTTestService_sharedTestService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTestService_sharedService;
  sharedTestService_sharedService = (uint64_t)v1;

}

- (BLTTestService)init
{
  BLTTestService *v2;
  BLTTestService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLTTestService;
  v2 = -[BLTTestService init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BLTTestService _connectIfNecessary](v2, "_connectIfNecessary");
  return v3;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTTestService;
  -[BLTTestService dealloc](&v4, sel_dealloc);
}

- (void)addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 completion:(id)a8
{
  -[BLTTestService addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:completion:](self, "addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:completion:", a3, a4, a5, a6, a7, 1, a8);
}

- (void)addBulletin:(id)a3 forFeed:(unint64_t)a4 playLightsAndSirens:(BOOL)a5 attachment:(id)a6 attachmentType:(int64_t)a7 alwaysSend:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v12;
  id v16;
  NSXPCConnection *connection;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a8;
  v12 = a5;
  v16 = a9;
  connection = self->_connection;
  v18 = a6;
  v19 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __106__BLTTestService_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke;
  v22[3] = &unk_24D762AC0;
  v23 = v16;
  v21 = v16;
  objc_msgSend(v20, "addBulletin:forFeed:playLightsAndSirens:attachment:attachmentType:alwaysSend:completion:", v19, a4, v12, v18, a7, v9, v22);

}

uint64_t __106__BLTTestService_addBulletin_forFeed_playLightsAndSirens_attachment_attachmentType_alwaysSend_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendSectionInfoWithSectionID:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__BLTTestService_sendSectionInfoWithSectionID_completion___block_invoke;
  v11[3] = &unk_24D761B98;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "sendSectionInfoWithSectionID:completion:", v8, v11);

}

uint64_t __58__BLTTestService_sendSectionInfoWithSectionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__BLTTestService_sendAllSectionInfoWithSpool_completion___block_invoke;
  v9[3] = &unk_24D761B98;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "sendAllSectionInfoWithSpool:completion:", v4, v9);

}

uint64_t __57__BLTTestService_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BLTTestService_spoolSectionInfoWithCompletion___block_invoke;
  v7[3] = &unk_24D761B98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "spoolSectionInfoWithCompletion:", v7);

}

uint64_t __49__BLTTestService_spoolSectionInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSectionInfoSentCacheWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__BLTTestService_clearSectionInfoSentCacheWithCompletion___block_invoke;
  v7[3] = &unk_24D761B98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "clearSectionInfoSentCacheWithCompletion:", v7);

}

uint64_t __58__BLTTestService_clearSectionInfoSentCacheWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getStandaloneTestModeEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BLTTestService_getStandaloneTestModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_24D762AC0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getStandaloneTestModeEnabledWithCompletion:", v7);

}

uint64_t __61__BLTTestService_getStandaloneTestModeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6 completion:(id)a7
{
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a7;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __133__BLTTestService_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke;
  v15[3] = &unk_24D761B98;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:completion:", a3, a4, a5, a6, v15);

}

uint64_t __133__BLTTestService_enableStandaloneTestModeWithMinimumSendDelay_maximumSendDelay_minimumResponseDelay_maximumResponseDelay_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)disableStandaloneTestModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__BLTTestService_disableStandaloneTestModeWithCompletion___block_invoke;
  v7[3] = &unk_24D761B98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "disableStandaloneTestModeWithCompletion:", v7);

}

uint64_t __58__BLTTestService_disableStandaloneTestModeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)willAlertForSectionID:(id)a3 subtype:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  connection = self->_connection;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__BLTTestService_willAlertForSectionID_subtype_completion___block_invoke;
  v13[3] = &unk_24D762AC0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "willAlertForSectionID:subtype:completion:", v10, a4, v13);

}

uint64_t __59__BLTTestService_willAlertForSectionID_subtype_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)settingOverridesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BLTTestService_settingOverridesWithCompletion___block_invoke;
  v7[3] = &unk_24D762AE8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "settingOverridesWithCompletion:", v7);

}

uint64_t __49__BLTTestService_settingOverridesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)originalSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BLTTestService_originalSettingsWithCompletion___block_invoke;
  v7[3] = &unk_24D762AE8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "originalSettingsWithCompletion:", v7);

}

uint64_t __49__BLTTestService_originalSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)overriddenSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__BLTTestService_overriddenSettingsWithCompletion___block_invoke;
  v7[3] = &unk_24D762AE8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "overriddenSettingsWithCompletion:", v7);

}

uint64_t __51__BLTTestService_overriddenSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSectionID:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__BLTTestService_removeSectionID_completion___block_invoke;
  v11[3] = &unk_24D761B98;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "removeSectionID:completion:", v8, v11);

}

uint64_t __45__BLTTestService_removeSectionID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)logFaultWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__BLTTestService_logFaultWithCompletion___block_invoke;
  v7[3] = &unk_24D761B98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "logFaultWithCompletion:", v7);

}

uint64_t __41__BLTTestService_logFaultWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)simulateAnalytics:(id)a3 completion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__BLTTestService_simulateAnalytics_completion___block_invoke;
  v11[3] = &unk_24D762B10;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "simulateAnalytics:completion:", v8, v11);

}

uint64_t __47__BLTTestService_simulateAnalytics_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_connectIfNecessary
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x24BDAC8D0];
  if (!self->_connection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletindistributor.testservice"), 4096);
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00EB8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    v12[3] = objc_opt_class();
    v12[4] = objc_opt_class();
    v12[5] = objc_opt_class();
    v12[6] = objc_opt_class();
    v12[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_overriddenSettingsWithCompletion_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_originalSettingsWithCompletion_, 0, 1);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_8);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_92);
    -[NSXPCConnection resume](self->_connection, "resume");

  }
}

void __37__BLTTestService__connectIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  blt_general_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2173D9000, v0, OS_LOG_TYPE_DEFAULT, "BLTTestService connection interrupted!", v1, 2u);
  }

}

void __37__BLTTestService__connectIfNecessary__block_invoke_91()
{
  NSObject *v0;
  uint8_t v1[16];

  blt_general_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2173D9000, v0, OS_LOG_TYPE_DEFAULT, "BLTTestService connection invalidated!", v1, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
