@implementation HKClinicalProviderServiceStore

- (HKClinicalProviderServiceStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalProviderServiceStore)initWithHealthStore:(id)a3
{
  id v4;
  HKClinicalProviderServiceStore *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKClinicalProviderServiceStore;
  v5 = -[HKClinicalProviderServiceStore init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

  }
  return v5;
}

- (void)fetchRemoteSearchResultsPageForQuery:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke;
  v13[3] = &unk_24D54A5D8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteSearchResultsPageForQuery:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __82__HKClinicalProviderServiceStore_fetchRemoteSearchResultsPageForQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelInFlightSearchQueriesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke;
  v9[3] = &unk_24D54A600;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_cancelInFlightSearchQueriesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__HKClinicalProviderServiceStore_cancelInFlightSearchQueriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRemoteProviderWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke;
  v17[3] = &unk_24D54A628;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteProviderWithExternalID:batchID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __87__HKClinicalProviderServiceStore_fetchRemoteProviderWithExternalID_batchID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRemoteGatewayWithExternalID:(id)a3 batchID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke;
  v17[3] = &unk_24D54A628;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchRemoteGatewayWithExternalID:batchID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __86__HKClinicalProviderServiceStore_fetchRemoteGatewayWithExternalID_batchID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLogoDataForBrand:(id)a3 scaleKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke;
  v17[3] = &unk_24D54A628;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoDataForBrand:scaleKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __76__HKClinicalProviderServiceStore_fetchLogoDataForBrand_scaleKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLogoDataForFeaturedBrandsAtScaleKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke;
  v13[3] = &unk_24D54A5D8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalProviderServiceStore _fetchServerProxyWithHandler:errorHandler:](self, "_fetchServerProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchLogoDataForFeaturedBrandsAtScaleKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __86__HKClinicalProviderServiceStore_fetchLogoDataForFeaturedBrandsAtScaleKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
