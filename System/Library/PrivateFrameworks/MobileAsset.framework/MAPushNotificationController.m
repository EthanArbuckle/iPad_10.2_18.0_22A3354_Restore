@implementation MAPushNotificationController

- (MAPushNotificationController)init
{
  MAPushNotificationController *v2;
  NSLock *v3;
  NSLock *serviceConnectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MAPushNotificationController;
  v2 = -[MAPushNotificationController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  return (id)sharedInstance_instance_0;
}

void __46__MAPushNotificationController_sharedInstance__block_invoke()
{
  MAPushNotificationController *v0;
  void *v1;

  v0 = objc_alloc_init(MAPushNotificationController);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (id)_serviceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id location;

  -[MAPushNotificationController serviceConnectionLock](self, "serviceConnectionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[MAPushNotificationController serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileassetd.push-notifications"), 4096);
    -[MAPushNotificationController setServiceConnection:](self, "setServiceConnection:", v5);

    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      _MobileAssetLog(0, 3, (uint64_t)"-[MAPushNotificationController _serviceConnection]", CFSTR("Could not connect to service %@"), v7, v8, v9, v10, (uint64_t)CFSTR("com.apple.mobileassetd.push-notifications"));
    MAPushServiceInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteObjectInterface:", v11);

    MAServiceClientInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExportedInterface:", v13);

    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExportedObject:", self);

    objc_initWeak(&location, self);
    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInterruptionHandler:", &__block_literal_global_6);

    -[MAPushNotificationController serviceConnection](self, "serviceConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__MAPushNotificationController__serviceConnection__block_invoke_2;
    v22[3] = &unk_1E5D5E8B0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "setInvalidationHandler:", v22);

    v18 = objc_loadWeakRetained(&location);
    objc_msgSend(v18, "serviceConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  -[MAPushNotificationController serviceConnectionLock](self, "serviceConnectionLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

  -[MAPushNotificationController serviceConnection](self, "serviceConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__MAPushNotificationController__serviceConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _MobileAssetLog(0, 3, (uint64_t)"-[MAPushNotificationController _serviceConnection]_block_invoke", CFSTR("Service connection interrupted"), a5, a6, a7, a8, a9);
}

void __50__MAPushNotificationController__serviceConnection__block_invoke_2(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  _MobileAssetLog(0, 4, (uint64_t)"-[MAPushNotificationController _serviceConnection]_block_invoke_2", CFSTR("Service connection invalidated"), a5, a6, a7, a8, v13);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "serviceConnectionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lock");

  v11 = objc_loadWeakRetained(a1);
  objc_msgSend(v11, "setServiceConnection:", 0);

  v14 = objc_loadWeakRetained(a1);
  objc_msgSend(v14, "serviceConnectionLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

}

- (id)synchronousProxy
{
  void *v2;
  void *v3;

  -[MAPushNotificationController _serviceConnection](self, "_serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__MAPushNotificationController_synchronousProxy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"-[MAPushNotificationController synchronousProxy]_block_invoke", CFSTR("Error making connection to mobileassetd: %@"), a5, a6, a7, a8, a2);
}

- (id)asyncProxy
{
  void *v2;
  void *v3;

  -[MAPushNotificationController _serviceConnection](self, "_serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __42__MAPushNotificationController_asyncProxy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"-[MAPushNotificationController asyncProxy]_block_invoke", CFSTR("Error making connection to mobileassetd: %@"), a5, a6, a7, a8, a2);
}

- (void)asyncSubscribeToChannelWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeToChannelWithIdentifier:", v4);

}

- (void)subscribeToChannelWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeToChannelWithIdentifier:", v4);

}

- (void)asyncUnsubscribeToChannelWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribeToChannelWithIdentifier:", v4);

}

- (void)unsubscribeToChannelWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribeToChannelWithIdentifier:", v4);

}

- (void)subscribedChannelIDsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController asyncProxy](self, "asyncProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribedChannelIDsWithCompletion:", v4);

}

- (void)unsubscribeFromAllChannels
{
  id v2;

  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeFromAllChannels");

}

- (id)subscribedChannelIDs
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MAPushNotificationController_subscribedChannelIDs__block_invoke;
  v5[3] = &unk_1E5D5E938;
  v5[4] = &v6;
  objc_msgSend(v2, "subscribedChannelIDsWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__MAPushNotificationController_subscribedChannelIDs__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)triggerNotificationWithPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerPushNotificationWithPayload:", v4);

}

- (id)pushJobDescriptions
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MAPushNotificationController_pushJobDescriptions__block_invoke;
  v5[3] = &unk_1E5D5E938;
  v5[4] = &v6;
  objc_msgSend(v2, "pushJobsAwaitingTriggerWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__MAPushNotificationController_pushJobDescriptions__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[MAPushNotificationController synchronousProxy](self, "synchronousProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSyntheticJobWithType:assetSpecifier:matchingAssetVersion:triggerInterval:", v12, v11, v10, a6);

}

- (void)didReceivePushNotificationWithInfo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _MobileAssetLog(0, 6, (uint64_t)"-[MAPushNotificationController didReceivePushNotificationWithInfo:]", CFSTR("Client received notification with info %@"), v3, v4, v5, v6, (uint64_t)a3);
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSLock)serviceConnectionLock
{
  return self->_serviceConnectionLock;
}

- (void)setServiceConnectionLock:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnectionLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnectionLock, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
