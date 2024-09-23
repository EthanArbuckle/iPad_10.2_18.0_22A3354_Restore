@implementation MPCReportingPlaybackEnvironmentPropertiesLoader

- (MPCReportingPlaybackEnvironmentPropertiesLoader)initWithPlaybackRequestEnvironment:(id)a3
{
  id v4;
  MPCReportingPlaybackEnvironmentPropertiesLoader *v5;
  uint64_t v6;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCReportingPlaybackEnvironmentPropertiesLoader;
  v5 = -[MPCReportingPlaybackEnvironmentPropertiesLoader init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v6;

  }
  return v5;
}

- (void)loadReportingIdentityPropertiesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MPCReportingPlaybackEnvironmentPropertiesLoader *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24CAB6988;
  v24 = v4;
  v6 = v4;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_24CAB6988;
  v22 = _Block_copy(aBlock);
  v7 = v22;
  v8 = _Block_copy(v21);
  -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithBlock:", &__block_literal_global_18558);
  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_5;
  v15[3] = &unk_24CAB6AB8;
  v16 = v10;
  v17 = self;
  v18 = v9;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  v11 = v8;
  v12 = v19;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v12, "getBagForRequestContext:withCompletionHandler:", v14, v15);

}

- (void)_getHasSubscriptionPlaybackCapabilityForUserIdentity:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BEC88B8];
  v7 = a3;
  objc_msgSend(v6, "sharedStatusController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __115__MPCReportingPlaybackEnvironmentPropertiesLoader__getHasSubscriptionPlaybackCapabilityForUserIdentity_completion___block_invoke;
  v10[3] = &unk_24CAB6AE0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getSubscriptionStatusForUserIdentity:withCompletionHandler:", v7, v10);

}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
}

void __115__MPCReportingPlaybackEnvironmentPropertiesLoader__getHasSubscriptionPlaybackCapabilityForUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BDDCCB0];
    v4 = a2;
    v5 = (id)objc_msgSend([v3 alloc], "initWithICSubscriptionStatus:", v4);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "hasPlaybackCapability");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_24CAB69B0;
    v9 = v5;
    v11 = *(id *)(a1 + 32);
    v10 = v6;
    objc_msgSend(v7, "getLastKnownHouseholdIDWithCompletion:", v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_6;
  v10[3] = &unk_24CAB6A90;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v11 = v3;
  v12 = v6;
  v10[1] = 3221225472;
  v13 = v4;
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v8 = v4;
  v9 = v3;
  objc_msgSend(v5, "getPropertiesForUserIdentity:completionHandler:", v8, v10);

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  MPCReportingIdentityProperties *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  MPCReportingIdentityProperties *v15;
  _QWORD v16[4];
  MPCReportingIdentityProperties *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  v4 = objc_alloc_init(MPCReportingIdentityProperties);
  objc_msgSend(v3, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCReportingIdentityProperties setStoreAccountID:](v4, "setStoreAccountID:", objc_msgSend(v5, "unsignedLongLongValue"));

  objc_msgSend(v3, "storefrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "storefrontHeaderSuffix");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CABB5D0;
  objc_msgSend(v6, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCReportingIdentityProperties setStoreFrontID:](v4, "setStoreFrontID:", v10);

  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_7;
  v16[3] = &unk_24CAB6A68;
  v17 = v4;
  v18 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 40);
  v19 = v13;
  v20 = v14;
  v21 = *(id *)(a1 + 72);
  v15 = v4;
  objc_msgSend(v11, "_getHasSubscriptionPlaybackCapabilityForUserIdentity:completion:", v12, v16);

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "setHasSubscriptionPlaybackCapability:", a2);
  objc_msgSend(*(id *)(a1 + 40), "delegatedIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 40);
    v6 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_8;
    v16[3] = &unk_24CAB8258;
    v17 = v3;
    v7 = (void *)objc_msgSend(v5, "copyWithBlock:", v16);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_9;
    v11[3] = &unk_24CAB6A40;
    v9 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v12 = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 64);
    v10 = v7;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", v10, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  objc_msgSend(v3, "setDelegatedIdentity:", 0);

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_10;
  v8[3] = &unk_24CAB6A18;
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "getPropertiesForUserIdentity:completionHandler:", v5, v8);

}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "delegationProperties");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BEC88E0]);
  objc_msgSend(v4, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoreAccountID:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v4, "storefrontIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "storefrontHeaderSuffix");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24CABB5D0;
  objc_msgSend(v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoreFrontID:", v11);

  objc_msgSend(v18, "requestUserAgent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBuildVersion:", v12);

  objc_msgSend(v18, "deviceGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceGUID:", v13);

  objc_msgSend(v18, "deviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceName:", v14);

  v15 = objc_msgSend(v18, "systemReleaseType");
  if ((unint64_t)(v15 - 1) >= 4)
    v16 = 0;
  else
    v16 = v15;
  objc_msgSend(v5, "setSystemReleaseType:", v16);
  objc_msgSend(v18, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v17);

  objc_msgSend(v5, "setSBEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setEnqueuerProperties:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegatedIdentity:", 0);
}

void __104__MPCReportingPlaybackEnvironmentPropertiesLoader_loadReportingIdentityPropertiesWithCompletionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v5, "setHouseholdID:", a2);
  v6 = v7;
  if (a1[5])
    v6 = (id)a1[5];
  (*(void (**)(_QWORD, _QWORD, id))(a1[6] + 16))(a1[6], a1[4], v6);

}

@end
