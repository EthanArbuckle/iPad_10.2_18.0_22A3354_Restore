@implementation NMSModelEditorialRecommendationsRequestOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  -[MPStoreModelRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "nms_useCachedDataOnly"))
  {
    objc_msgSend(v3, "nms_cachedLoadedOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "nms_cachedLoadedOutput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __59__NMSModelEditorialRecommendationsRequestOperation_execute__block_invoke;
      v10[3] = &unk_24D647E98;
      v10[4] = self;
      -[NMSModelEditorialRecommendationsRequestOperation produceResponseWithLoadedOutput:completion:](self, "produceResponseWithLoadedOutput:completion:", v5, v10);

    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDDCA10]);
      -[MPStoreModelRequestOperation request](self, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithRequest:", v7);
      -[MPStoreModelRequestOperation _finishWithResponse:error:](self, "_finishWithResponse:error:", v8, 0);

    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
    -[MPModelStoreBrowseRequestOperation execute](&v9, sel_execute);
  }

}

uint64_t __59__NMSModelEditorialRecommendationsRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", a2, a3);
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  objc_msgSend(v6, "dictionaryForBagKey:", CFSTR("musicSubscription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getAKAccountManagerClass_softClass_0;
  v26 = getAKAccountManagerClass_softClass_0;
  if (!getAKAccountManagerClass_softClass_0)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __getAKAccountManagerClass_block_invoke_0;
    v22[3] = &unk_24D6474E0;
    v22[4] = &v23;
    __getAKAccountManagerClass_block_invoke_0((uint64_t)v22);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v9, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryAuthKitAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "userUnderAgeForAccount:", v11);

  v13 = CFSTR("musicStarterPackOver13");
  if (v12)
    v13 = CFSTR("musicStarterPackUnder13");
  v14 = v13;
  objc_msgSend(v7, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreModelRequestOperation request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLoadAdditionalContentURL:", v16);

  }
  else
  {
    NMLogForCategory(5);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[NMSModelEditorialRecommendationsRequestOperation configurationForLoadingModelDataWithStoreURLBag:error:].cold.1((uint64_t)v14, v18);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7201, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
  -[MPModelStoreBrowseRequestOperation configurationForLoadingModelDataWithStoreURLBag:error:](&v21, sel_configurationForLoadingModelDataWithStoreURLBag_error_, v6, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MPStoreModelRequestOperation request](self, "request");
  v12[1] = 3221225472;
  v12[2] = __95__NMSModelEditorialRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v12[3] = &unk_24D6471A0;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = v7;
  v11.receiver = self;
  v11.super_class = (Class)NMSModelEditorialRecommendationsRequestOperation;
  v12[0] = MEMORY[0x24BDAC760];
  v8 = v7;
  v9 = v6;
  v10 = v13;
  -[MPModelStoreBrowseRequestOperation produceResponseWithLoadedOutput:completion:](&v11, sel_produceResponseWithLoadedOutput_completion_, v9, v12);

}

void __95__NMSModelEditorialRecommendationsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "nms_useCachedDataOnly") & 1) == 0)
    objc_msgSend(v7, "nms_setCachedLoadedOutput:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)configurationForLoadingModelDataWithStoreURLBag:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "[Recommendation] (Editorial) Missing musicStarterPack bag key: %@", (uint8_t *)&v2, 0xCu);
}

@end
