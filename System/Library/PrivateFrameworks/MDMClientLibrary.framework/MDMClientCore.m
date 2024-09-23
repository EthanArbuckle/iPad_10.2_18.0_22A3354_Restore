@implementation MDMClientCore

+ (id)clientWithChannelType:(unint64_t)a3
{
  return -[MDMClientCore initWithChannelType:]([MDMClientCore alloc], "initWithChannelType:", a3);
}

- (MDMClientCore)initWithChannelType:(unint64_t)a3
{
  void *v5;
  MDMClientCore *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[MDMClientCore initWithChannelType:dataProvider:](self, "initWithChannelType:dataProvider:", a3, v5);

  return v6;
}

- (MDMClientCore)initWithChannelType:(unint64_t)a3 dataProvider:(id)a4
{
  id v7;
  MDMClientCore *v8;
  MDMClientCore *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *xpcConnectionSyncQueue;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MDMClientCore;
  v8 = -[MDMClientCore init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_channelType = a3;
    v10 = dispatch_queue_create("com.apple.devicemanagementclient.MDMClientCore._xpcConnectionSyncQueue", 0);
    xpcConnectionSyncQueue = v9->_xpcConnectionSyncQueue;
    v9->_xpcConnectionSyncQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_dataProvider, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MDMClientCore;
  -[MDMClientCore dealloc](&v3, sel_dealloc);
}

- (BOOL)isActivationLockAllowedWhileSupervised
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MDMClientCore dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mdmDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MDMOptions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
  }
  else
  {
    +[MDMOptionsUtilities defaultMDMOptions](MDMOptionsUtilities, "defaultMDMOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      v7 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ActivationLockAllowedWhileSupervised"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

LABEL_5:
  return v7;
}

- (unint64_t)accessRights
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[MDMClientCore dataProvider](self, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mdmDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AccessRights"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MDMClientCore_getAssertionDescriptionsWithCompletion___block_invoke;
  v8[3] = &unk_1E98527A0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getAssertionDescriptionsWithCompletion:", v6);
}

void __56__MDMClientCore_getAssertionDescriptionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_msgSend(v3, "DMCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Failed to get assertion descriptions. Error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)notifyNewConfiguration
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyNewConfigurationWithCompletion:", &__block_literal_global_0);

}

void __39__MDMClientCore_notifyNewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in notifyNewConfiguration XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)scheduleTokenUpdate
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleTokenUpdateWithCompletion:", &__block_literal_global_6);

}

void __36__MDMClientCore_scheduleTokenUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in scheduleTokenUpdate XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)scheduleTokenUpdateIfNecessary
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleTokenUpdateIfNecessaryWithCompletion:", &__block_literal_global_7);

}

void __47__MDMClientCore_scheduleTokenUpdateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in scheduleTokenUpdate XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)retryNotNowResponse
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retryNotNowWithCompletion:", &__block_literal_global_8);

}

void __36__MDMClientCore_retryNotNowResponse__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in retryNotNowResponse XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)simulatePush
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulatePushWithCompletion:", &__block_literal_global_9);

}

void __29__MDMClientCore_simulatePush__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in simulatePush XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)simulatePushWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MDMClientCore_simulatePushWithCompletion___block_invoke;
  v9[3] = &unk_1E98527A0;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D826525C](v9);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simulatePushWithCompletion:", v6);

}

void __44__MDMClientCore_simulatePushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error in simulatePushWithCompletion XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__MDMClientCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke;
  v9[3] = &unk_1E98527A0;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D826525C](v9);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simulatePushIfNetworkTetheredWithCompletion:", v6);

}

void __61__MDMClientCore_simulatePushIfNetworkTetheredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error in simulatePushIfNetworkTethered XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (id)pushToken
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__MDMClientCore_pushToken__block_invoke_11;
  v6[3] = &unk_1E9852828;
  v6[4] = &v7;
  objc_msgSend(v3, "pushTokenWithCompletion:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __26__MDMClientCore_pushToken__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error getting user push token from mdmuserd. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __26__MDMClientCore_pushToken__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "DMCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_ERROR, "Error getting user push token from mdmuserd. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (void)touchWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__MDMClientCore_touchWithCompletion___block_invoke;
  v12[3] = &unk_1E98527A0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __37__MDMClientCore_touchWithCompletion___block_invoke_13;
  v10[3] = &unk_1E98527A0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "touchWithCompletion:", v10);

}

void __37__MDMClientCore_touchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error reaching out to mdm daemon: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __37__MDMClientCore_touchWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error touching mdm daemon: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_DEBUG, "TouchWithCompletion completed!", (uint8_t *)&v7, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)reauthenticationComplete
{
  void *v2;
  id v3;

  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reauthenticationCompleteWithCompletion:", &__block_literal_global_14);

}

void __41__MDMClientCore_reauthenticationComplete__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in reauthenticationComplete XPC reply. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)depPushTokenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "depPushTokenWithCompletion:", v4);

}

void __44__MDMClientCore_depPushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error connecting to remote. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDEPPushTokenWithCompletion:", v4);

}

void __48__MDMClientCore_syncDEPPushTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error connecting to remote. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MDMClientCore_migrateMDMWithContext_completion___block_invoke;
  v11[3] = &unk_1E98527A0;
  v12 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x1D826525C](v11);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migrateMDMWithContext:completion:", v4, v8);

}

void __50__MDMClientCore_migrateMDMWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error in migrateMDMWithContext XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)uprootMDM
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__MDMClientCore_uprootMDM__block_invoke_18;
  v6[3] = &unk_1E9852870;
  objc_copyWeak(&v8, &location);
  v7 = &__block_literal_global_17;
  v3 = (void *)MEMORY[0x1D826525C](v6);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uprootMDMWithCompletion:", v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __26__MDMClientCore_uprootMDM__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Error in uprootMDM XPC reply. Error: %{public}@. Not attempting a retry.", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __26__MDMClientCore_uprootMDM__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v3, "DMCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1D4BF7000, v6, OS_LOG_TYPE_ERROR, "Error in uprootMDM XPC reply. Error: %{public}@. Retrying exactly once...", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(WeakRetained, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uprootMDMWithCompletion:", *(_QWORD *)(a1 + 32));

  }
}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_DEFAULT, "asking to restore applications", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__MDMClientCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke;
  v10[3] = &unk_1E98527A0;
  v11 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D826525C](v10);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestInstallOfAppsInRestoreWithCompletion:", v7);

}

void __61__MDMClientCore_requestInstallOfAppsInRestoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Error in restoreApps XPC reply. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, client block", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MDMClientCore_blockAppInstallsWithCompletion___block_invoke;
  v10[3] = &unk_1E98527A0;
  v11 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D826525C](v10);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blockAppInstallsWithCompletion:", v7);

}

void __48__MDMClientCore_blockAppInstallsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "block app installs, client block, error in XPC reply: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, client unblock", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MDMClientCore_unblockAppInstallsWithCompletion___block_invoke;
  v10[3] = &unk_1E98527A0;
  v11 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D826525C](v10);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unblockAppInstallsWithCompletion:", v7);

}

void __50__MDMClientCore_unblockAppInstallsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "block app installs, client unblock, error in XPC reply: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__MDMClientCore_processDeviceRequest_encodeResponse_completion___block_invoke;
  v14[3] = &unk_1E98527A0;
  v15 = v8;
  v9 = v8;
  v10 = a3;
  v11 = (void *)MEMORY[0x1D826525C](v14);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processDeviceRequest:encodeResponse:completion:", v10, v5, v9);

}

void __64__MDMClientCore_processDeviceRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Failed to process device request. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v3, 0, 0);

}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__MDMClientCore_processUserRequest_encodeResponse_completion___block_invoke;
  v14[3] = &unk_1E98527A0;
  v15 = v8;
  v9 = v8;
  v10 = a3;
  v11 = (void *)MEMORY[0x1D826525C](v14);
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processUserRequest:encodeResponse:completion:", v10, v5, v9);

}

void __62__MDMClientCore_processUserRequest_encodeResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "DMCVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_ERROR, "Failed to process user request. Error: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v3, 0, 0);

}

- (BOOL)isAwaitingUserConfigured
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[MDMClientCore xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MDMClientCore_isAwaitingUserConfigured__block_invoke_20;
  v5[3] = &unk_1E9852898;
  v5[4] = &v6;
  objc_msgSend(v3, "isAwaitingUserConfiguredWithCompletion:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __41__MDMClientCore_isAwaitingUserConfigured__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "DMCVerboseDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D4BF7000, v4, OS_LOG_TYPE_ERROR, "Failed to start query for isAwaitingUserConfigured. Error: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __41__MDMClientCore_isAwaitingUserConfigured__block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "DMCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_ERROR, "Failed to query isAwaitingUserConfigured. Error: %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

- (BOOL)authenticateWithCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 useDevelopmentAPNS:(BOOL)a8 signMessage:(BOOL)a9 isUserEnrollment:(BOOL)a10 enrollmentID:(id)a11 outError:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  MDMHTTPTransaction *v24;
  void *v25;
  void *v26;
  MDMHTTPTransaction *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v36 = a6;
  v40 = *MEMORY[0x1E0C80C00];
  v17 = a11;
  v18 = a7;
  v19 = a5;
  v20 = a3;
  v21 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_DEFAULT, "Authenticating with MDM", buf, 2u);
  }
  v37 = v17;
  if (a10)
    -[MDMClientCore _userEnrollmentAuthenticationDictWithEnrollmentID:](self, "_userEnrollmentAuthenticationDictWithEnrollmentID:", v17);
  else
    -[MDMClientCore _deviceEnrollmentAuthenticationDict](self, "_deviceEnrollmentAuthenticationDict");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("Topic"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v22, 100, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [MDMHTTPTransaction alloc];
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rmAccountID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v35) = 0;
  LOWORD(v35) = 1;
  v27 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v24, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v20, v23, a4, v19, v36, a9, v35, v26);

  if (objc_msgSend(MEMORY[0x1E0D1C1C8], "shouldSimulateMDMCommunication"))
  {
    +[DMCHTTPTransaction emptySuccessResponseBlock](MDMHTTPTransaction, "emptySuccessResponseBlock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCHTTPTransaction setSimulatedTransactionBlock:](v27, "setSimulatedTransactionBlock:", v28);

  }
  -[DMCHTTPTransaction performSynchronously](v27, "performSynchronously");
  -[DMCHTTPTransaction error](v27, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = DMCLogObjects();
  v31 = *(NSObject **)(v30 + 8);
  if (v29)
  {
    if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      objc_msgSend(v29, "DMCVerboseDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_1D4BF7000, v32, OS_LOG_TYPE_ERROR, "Cannot Authenticate. Error: %{public}@", buf, 0xCu);

    }
    if (a12)
      *a12 = objc_retainAutorelease(v29);
  }
  else if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v31, OS_LOG_TYPE_DEFAULT, "Authentication with MDM finished.", buf, 2u);
  }

  return v29 == 0;
}

- (BOOL)checkOutCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 topic:(id)a7 signMessage:(BOOL)a8 isUserEnrollment:(BOOL)a9 enrollmentID:(id)a10 outError:(id *)a11
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  MDMHTTPTransaction *v24;
  void *v25;
  void *v26;
  MDMHTTPTransaction *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v36 = a8;
  v12 = a6;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a10;
  v17 = a7;
  v18 = a5;
  v19 = a3;
  v20 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v20, OS_LOG_TYPE_DEFAULT, "Checking out of MDM service", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("CheckOut"), CFSTR("MessageType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("Topic"));

  v37 = v16;
  if (a9)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("EnrollmentID"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1C1E0], "deviceUDID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("UDID"));

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v21, 100, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [MDMHTTPTransaction alloc];
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rmAccountID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v35) = 1;
  LOWORD(v35) = 256;
  v27 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v24, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v19, v23, a4, v18, v12, v36, v35, v26);

  if (objc_msgSend(MEMORY[0x1E0D1C1C8], "shouldSimulateMDMCommunication"))
  {
    +[DMCHTTPTransaction emptySuccessResponseBlock](MDMHTTPTransaction, "emptySuccessResponseBlock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCHTTPTransaction setSimulatedTransactionBlock:](v27, "setSimulatedTransactionBlock:", v28);

  }
  -[DMCHTTPTransaction performSynchronously](v27, "performSynchronously");
  -[DMCHTTPTransaction error](v27, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = DMCLogObjects();
  v31 = *(NSObject **)(v30 + 8);
  if (v29)
  {
    if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      objc_msgSend(v29, "DMCVerboseDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_1D4BF7000, v32, OS_LOG_TYPE_ERROR, "Cannot Check Out. Error: %{public}@", buf, 0xCu);

    }
    if (a11)
      *a11 = objc_retainAutorelease(v29);
  }
  else if (os_log_type_enabled(*(os_log_t *)(v30 + 8), OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v31, OS_LOG_TYPE_DEFAULT, "Check out finished.", buf, 2u);
  }

  return v29 == 0;
}

- (BOOL)remoteManagementCheckInURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 endpoint:(id)a10 requestData:(id)a11 outResponse:(id *)a12 outError:(id *)a13
{
  _BOOL4 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MDMHTTPTransaction *v30;
  void *v31;
  void *v32;
  MDMHTTPTransaction *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[5];

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v61[3] = *MEMORY[0x1E0C80C00];
  v53 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a5;
  v23 = a3;
  v24 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v24, OS_LOG_TYPE_DEFAULT, "Running DeclarativeManagement command of MDM service", buf, 2u);
  }
  v52 = v21;
  if (v13)
  {
    v60[0] = CFSTR("MessageType");
    v60[1] = CFSTR("EnrollmentID");
    v61[0] = CFSTR("DeclarativeManagement");
    v61[1] = v53;
    v61[2] = v20;
    v60[2] = CFSTR("Endpoint");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");
  }
  else
  {
    v59[0] = CFSTR("DeclarativeManagement");
    v58[0] = CFSTR("MessageType");
    v58[1] = CFSTR("UDID");
    objc_msgSend(MEMORY[0x1E0D1C1E0], "deviceUDID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = CFSTR("Endpoint");
    v59[1] = v25;
    v59[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v27, "mutableCopy");

    v21 = v52;
  }

  if (v21)
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("Data"));
  v51 = v20;
  if (-[MDMClientCore channelType](self, "channelType") == 1)
  {
    -[MDMClientCore _userFieldsForResponse](self, "_userFieldsForResponse");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEntriesFromDictionary:", v28);

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v26, 100, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = [MDMHTTPTransaction alloc];
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rmAccountID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v50) = 1;
  LOWORD(v50) = 1;
  v33 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v30, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v23, v29, a4, v22, v15, v14, v50, v32);

  -[DMCHTTPTransaction performSynchronously](v33, "performSynchronously");
  -[DMCHTTPTransaction error](v33, "error");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

    v35 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      objc_msgSend(v34, "DMCVerboseDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v37;
      _os_log_impl(&dword_1D4BF7000, v36, OS_LOG_TYPE_ERROR, "Cannot Check Out. Error: %{public}@", buf, 0xCu);

    }
    v38 = v52;
    if (a13)
      *a13 = objc_retainAutorelease(v34);
  }
  else
  {
    v39 = -[DMCHTTPTransaction statusCode](v33, "statusCode");
    -[DMCHTTPTransaction responseHeaders](v33, "responseHeaders");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = (void *)MEMORY[0x1E0C9AA70];
    if (v40)
      v42 = (void *)v40;
    v43 = v42;

    -[DMCHTTPTransaction responseData](v33, "responseData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (a12)
    {
      v54[0] = CFSTR("ResponseStatusCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = CFSTR("ResponseHeaders");
      v55[0] = v45;
      v55[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "mutableCopy");

      objc_msgSend(v47, "setObject:forKeyedSubscript:", v44, CFSTR("ResponseBody"));
      *a12 = (id)objc_msgSend(v47, "copy");

    }
    v48 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4BF7000, v48, OS_LOG_TYPE_DEFAULT, "Finished running DeclarativeManagement command of MDM service", buf, 2u);
    }

    v38 = v52;
  }

  return v34 == 0;
}

- (BOOL)checkInRequestAtURL:(id)a3 identity:(__SecIdentity *)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isUserEnrollment:(BOOL)a8 enrollmentID:(id)a9 messageType:(id)a10 requestDict:(id)a11 outResponse:(id *)a12 outError:(id *)a13
{
  _BOOL4 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MDMHTTPTransaction *v30;
  void *v31;
  void *v32;
  MDMHTTPTransaction *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[4];

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v63[2] = *MEMORY[0x1E0C80C00];
  v53 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a5;
  v23 = a3;
  v24 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v57 = v20;
    _os_log_impl(&dword_1D4BF7000, v24, OS_LOG_TYPE_DEFAULT, "Running CheckIn Request to MDM service with MessageType: %{public}@", buf, 0xCu);
  }
  v52 = v20;
  if (v13)
  {
    v62[0] = CFSTR("MessageType");
    v62[1] = CFSTR("EnrollmentID");
    v63[0] = v20;
    v63[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");
  }
  else
  {
    v60[0] = CFSTR("MessageType");
    v60[1] = CFSTR("UDID");
    v61[0] = v20;
    objc_msgSend(MEMORY[0x1E0D1C1E0], "deviceUDID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v27, "mutableCopy");

  }
  if (v21)
    objc_msgSend(v26, "addEntriesFromDictionary:", v21);
  v51 = v21;
  if (-[MDMClientCore channelType](self, "channelType") == 1)
  {
    -[MDMClientCore _userFieldsForResponse](self, "_userFieldsForResponse");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEntriesFromDictionary:", v28);

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v26, 100, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = [MDMHTTPTransaction alloc];
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rmAccountID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v50) = 1;
  LOWORD(v50) = 1;
  v33 = -[MDMHTTPTransaction initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:](v30, "initWithURL:data:identity:pinnedCertificates:pinningRevocationCheckRequired:signMessage:isCheckin:isCheckout:isShortTransaction:rmAccountID:", v23, v29, a4, v22, v15, v14, v50, v32);

  -[DMCHTTPTransaction performSynchronously](v33, "performSynchronously");
  -[DMCHTTPTransaction error](v33, "error");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

    v35 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      objc_msgSend(v34, "DMCVerboseDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v52;
      v58 = 2114;
      v59 = v37;
      _os_log_impl(&dword_1D4BF7000, v36, OS_LOG_TYPE_ERROR, "Could Not Check In for MessageType: %{public}@ with Error: %{public}@", buf, 0x16u);

    }
    v38 = v51;
    if (a13)
      *a13 = objc_retainAutorelease(v34);
  }
  else
  {
    v39 = -[DMCHTTPTransaction statusCode](v33, "statusCode");
    -[DMCHTTPTransaction responseHeaders](v33, "responseHeaders");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = (void *)MEMORY[0x1E0C9AA70];
    if (v40)
      v42 = (void *)v40;
    v43 = v42;

    -[DMCHTTPTransaction responseData](v33, "responseData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (a12)
    {
      v54[0] = CFSTR("ResponseStatusCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = CFSTR("ResponseHeaders");
      v55[0] = v45;
      v55[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "mutableCopy");

      objc_msgSend(v47, "setObject:forKeyedSubscript:", v44, CFSTR("ResponseBody"));
      *a12 = (id)objc_msgSend(v47, "copy");

    }
    v48 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4BF7000, v48, OS_LOG_TYPE_DEFAULT, "Finished running CheckIn Request on MDM service", buf, 2u);
    }

    v38 = v51;
  }

  return v34 == 0;
}

- (id)_userFieldsForResponse
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  DMCLKLogoutSupportClass();
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isCurrentUserAnonymous");

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("Temporary Session");
  }
  else
  {
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "username");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v9[0] = CFSTR("UserID");
  v9[1] = CFSTR("UserShortName");
  v10[0] = CFSTR("FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF");
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[MDMClientCore xpcConnectionSyncQueue](self, "xpcConnectionSyncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MDMClientCore_xpcConnection__block_invoke;
  v6[3] = &unk_1E98528C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

void __30__MDMClientCore_xpcConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_queue_createAndStartMDMXPCConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_destroyXPCConnectionAndInvalidate:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MDMClientCore xpcConnectionSyncQueue](self, "xpcConnectionSyncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MDMClientCore__destroyXPCConnectionAndInvalidate___block_invoke;
  v6[3] = &unk_1E98528E8;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

void __52__MDMClientCore__destroyXPCConnectionAndInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_queue_createAndStartMDMXPCConnection
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *xpcConnection;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = -[MDMClientCore channelType](self, "channelType");
  if (v3 == 1)
  {
    v4 = CFSTR("com.apple.managedconfiguration.mdmuserdservice");
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFECF330);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MDMUserXPCProtocolInitialize(v5);
  }
  else if (v3)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = CFSTR("com.apple.managedconfiguration.mdmdservice");
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFECF2D0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MDMXPCProtocolInitialize(v5);
  }
  v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v6;

  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke;
  v11[3] = &unk_1E9852910;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v11);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke_108;
  v9[3] = &unk_1E9852910;
  objc_copyWeak(&v10, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v9);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D4BF7000, v2, OS_LOG_TYPE_ERROR, "MDM connection invalidation handler called", v3, 2u);
  }
  objc_msgSend(WeakRetained, "_destroyXPCConnectionAndInvalidate:", 0);

}

void __54__MDMClientCore__queue_createAndStartMDMXPCConnection__block_invoke_108(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D4BF7000, v2, OS_LOG_TYPE_DEFAULT, "MDM connection interruption handler called", v3, 2u);
  }
  objc_msgSend(WeakRetained, "_destroyXPCConnectionAndInvalidate:", 1);

}

- (id)_userEnrollmentAuthenticationDictWithEnrollmentID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("MessageType");
  v13[1] = CFSTR("EnrollmentID");
  v14[0] = CFSTR("Authenticate");
  v14[1] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D1C1E0], "marketingVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DMCSetObjectIfNotNil:forKey:", v7, CFSTR("OSVersion"));

  objc_msgSend(MEMORY[0x1E0D1C1E0], "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DMCSetObjectIfNotNil:forKey:", v8, CFSTR("BuildVersion"));

  v9 = (void *)MEMORY[0x1E0D1C1C8];
  objc_msgSend(MEMORY[0x1E0D1C1E0], "productType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "productNameWithDefaultValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "DMCSetObjectIfNotNil:forKey:", v11, CFSTR("ProductName"));
  return v6;
}

- (id)_deviceEnrollmentAuthenticationDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("MessageType");
  v22[1] = CFSTR("UDID");
  v23[0] = CFSTR("Authenticate");
  objc_msgSend(MEMORY[0x1E0D1C1E0], "deviceUDID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v21[0] = CFSTR("OSVersion");
  v21[1] = CFSTR("BuildVersion");
  v21[2] = CFSTR("ProductName");
  v21[3] = CFSTR("SerialNumber");
  v21[4] = CFSTR("IMEI");
  v21[5] = CFSTR("MEID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v20);
  v7 = -[MDMClientCore accessRights](self, "accessRights");
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMDeviceQueryUtilities allowedDeviceQueriesForAccessRights:isDataSeparated:](MDMDeviceQueryUtilities, "allowedDeviceQueriesForAccessRights:isDataSeparated:", v7, v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "intersectSet:", v10);
  if (objc_msgSend(v6, "containsObject:", CFSTR("OSVersion")))
  {
    objc_msgSend(MEMORY[0x1E0D1C1E0], "marketingVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v11, CFSTR("OSVersion"));

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("BuildVersion")))
  {
    objc_msgSend(MEMORY[0x1E0D1C1E0], "buildVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v12, CFSTR("BuildVersion"));

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("ProductName")))
  {
    v13 = (void *)MEMORY[0x1E0D1C1C8];
    objc_msgSend(MEMORY[0x1E0D1C1E0], "productType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "productNameWithDefaultValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v15, CFSTR("ProductName"));

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("SerialNumber")))
  {
    DMCIOSerialString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v16, CFSTR("SerialNumber"));

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("IMEI")))
  {
    DMCCTIMEI();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v17, CFSTR("IMEI"));

  }
  if (objc_msgSend(v6, "containsObject:", CFSTR("MEID")))
  {
    DMCCTMEID();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DMCSetObjectIfNotNil:forKey:", v18, CFSTR("MEID"));

  }
  return v5;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)xpcConnectionSyncQueue
{
  return self->_xpcConnectionSyncQueue;
}

- (MDMClientDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_xpcConnectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
