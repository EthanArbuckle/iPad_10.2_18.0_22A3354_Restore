@implementation HealthAppAnalyticsStore

+ (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  HealthAppAnalyticsStore *v9;
  id v10;
  HealthAppAnalyticsStore *v11;
  id v12;
  HealthAppAnalyticsStore *v13;
  _QWORD v14[4];
  HealthAppAnalyticsStore *v15;
  id v16;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = [HealthAppAnalyticsStore alloc];
  v10 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v11 = -[HealthAppAnalyticsStore initWithHealthStore:](v9, "initWithHealthStore:", v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke;
  v14[3] = &unk_1E9BE1648;
  v15 = v11;
  v16 = v7;
  v12 = v7;
  v13 = v11;
  -[HealthAppAnalyticsStore setUserDidAccept:currentAgreement:completion:](v13, "setUserDidAccept:currentAgreement:completion:", v6, v8, v14);

}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (HealthAppAnalyticsStore)initWithHealthStore:(id)a3
{
  id v5;
  HealthAppAnalyticsStore *v6;
  HealthAppAnalyticsStore *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HealthAppAnalyticsStore;
  v6 = -[HealthAppAnalyticsStore init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    v9 = HealthAppAnalyticsStoreTaskServerIdentifier;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v9, v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

  }
  return v7;
}

- (void)setUserDidAccept:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  HealthAppAnalyticsStore *v20;
  id v21;
  int64_t v22;
  BOOL v23;

  v10 = a4;
  v11 = a6;
  proxyProvider = self->_proxyProvider;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke;
  v18[3] = &unk_1E9BE1698;
  v23 = a3;
  v22 = a5;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_4;
  v16[3] = &unk_1E9BE16E8;
  v16[4] = self;
  v17 = v21;
  v14 = v21;
  v15 = v10;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_2;
  v6[3] = &unk_1E9BE1648;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_setAccepted:agreement:version:completion:", v3, v4, v5, v6);

}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_3;
  block[3] = &unk_1E9BE1670;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_5;
  v7[3] = &unk_1E9BE16C0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __73__HealthAppAnalyticsStore_setUserDidAccept_agreement_version_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)setUserDidAccept:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  HealthAppAnalyticsStore *v18;
  id v19;
  BOOL v20;

  v8 = a4;
  v9 = a5;
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke;
  v16[3] = &unk_1E9BE1710;
  v20 = a3;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_4;
  v14[3] = &unk_1E9BE16E8;
  v14[4] = self;
  v15 = v19;
  v12 = v19;
  v13 = v8;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_2;
  v5[3] = &unk_1E9BE1648;
  v4 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_setAccepted:currentAgreement:completion:", v3, v4, v5);

}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_3;
  block[3] = &unk_1E9BE1670;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_5;
  v7[3] = &unk_1E9BE16C0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __72__HealthAppAnalyticsStore_setUserDidAccept_currentAgreement_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00B3768);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00B37C8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
