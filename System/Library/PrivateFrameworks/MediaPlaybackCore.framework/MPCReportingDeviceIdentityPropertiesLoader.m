@implementation MPCReportingDeviceIdentityPropertiesLoader

- (MPCReportingDeviceIdentityPropertiesLoader)init
{
  MPCReportingDeviceIdentityPropertiesLoader *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialWorkQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCReportingDeviceIdentityPropertiesLoader;
  v2 = -[MPCReportingDeviceIdentityPropertiesLoader init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCReportingDeviceIdentityPropertiesLoader.serialWorkQueue", 0);
    serialWorkQueue = v2->_serialWorkQueue;
    v2->_serialWorkQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCReportingDeviceIdentityPropertiesLoader.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *serialWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialWorkQueue = self->_serialWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CAB9830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialWorkQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24CAB2600;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v2;
  v9 = v4;
  v10 = v5;
  v6 = v2;
  objc_msgSend(v3, "getPropertiesForUserIdentity:completionHandler:", v6, v7);

}

void __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  MPCReportingIdentityProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  MPCReportingIdentityProperties *v14;
  _QWORD v15[4];
  MPCReportingIdentityProperties *v16;
  id v17;

  v3 = a2;
  v4 = objc_alloc_init(MPCReportingIdentityProperties);
  objc_msgSend(v3, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCReportingIdentityProperties setStoreAccountID:](v4, "setStoreAccountID:", objc_msgSend(v5, "unsignedLongLongValue"));

  objc_msgSend(v3, "storefrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MPCReportingIdentityProperties setStoreFrontID:](v4, "setStoreFrontID:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localStoreAccountProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storefrontIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCReportingIdentityProperties setStoreFrontID:](v4, "setStoreFrontID:", v9);

  }
  objc_msgSend(MEMORY[0x24BDDC710], "cloudServiceStatusControllerWithUserIdentity:", a1[4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "musicSubscriptionStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCReportingIdentityProperties setHasSubscriptionPlaybackCapability:](v4, "setHasSubscriptionPlaybackCapability:", objc_msgSend(v11, "hasCapability:", 1));
  v12 = (void *)a1[6];
  v13 = *(NSObject **)(a1[5] + 8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_24CAB9830;
  v16 = v4;
  v17 = v12;
  v14 = v4;
  dispatch_async(v13, v15);

}

uint64_t __99__MPCReportingDeviceIdentityPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (MPCReportingDeviceIdentityPropertiesLoader)sharedLoader
{
  if (sharedLoader_sOnceToken != -1)
    dispatch_once(&sharedLoader_sOnceToken, &__block_literal_global_3043);
  return (MPCReportingDeviceIdentityPropertiesLoader *)(id)sharedLoader_sSharedLoader;
}

void __58__MPCReportingDeviceIdentityPropertiesLoader_sharedLoader__block_invoke()
{
  MPCReportingDeviceIdentityPropertiesLoader *v0;
  void *v1;

  v0 = objc_alloc_init(MPCReportingDeviceIdentityPropertiesLoader);
  v1 = (void *)sharedLoader_sSharedLoader;
  sharedLoader_sSharedLoader = (uint64_t)v0;

}

@end
