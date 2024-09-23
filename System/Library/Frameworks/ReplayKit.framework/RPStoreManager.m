@implementation RPStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)sStoreManager;
}

void __31__RPStoreManager_sharedManager__block_invoke()
{
  RPStoreManager *v0;
  void *v1;

  v0 = objc_alloc_init(RPStoreManager);
  v1 = (void *)sStoreManager;
  sStoreManager = (uint64_t)v0;

}

- (void)loadItemDetailsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  RPStoreInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  RPStoreInfo *v35;
  id v36;
  id v37;
  _QWORD block[4];
  RPStoreInfo *v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v41 = 0;
  v7 = objc_alloc_init(RPStoreInfo);
  v8 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bagForProfile:profileVersion:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE081E0], "bagKeySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerBagKeySet:forProfile:profileVersion:", v13, v14, v15);

  v16 = objc_alloc(MEMORY[0x24BE081E0]);
  v17 = (void *)objc_msgSend(v16, "initWithBag:caller:keyProfile:", v11, CFSTR("com.apple.replayd"), *MEMORY[0x24BE07E48]);
  v42[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performLookupWithBundleIdentifiers:itemIdentifiers:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "resultWithError:", &v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v41)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPStoreManager loadItemDetailsForBundleIdentifier:completionHandler:].cold.2(&v41);
  }
  else
  {
    v37 = v5;
    objc_msgSend(v20, "allItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v23, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPStoreInfo setBundleID:](v7, "setBundleID:", v25);

    }
    else
    {
      -[RPStoreInfo setBundleID:](v7, "setBundleID:", &stru_24D15E550);
    }

    objc_msgSend(v23, "displayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v23, "displayName");
    else
      objc_msgSend(MEMORY[0x24BDD1488], "_rpLocalizedAppNameFromBundleID:", v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPStoreInfo setAppName:](v7, "setAppName:", v27);

    objc_msgSend(v23, "artistName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v23, "artistName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPStoreInfo setAuthor:](v7, "setAuthor:", v29);

    }
    else
    {
      -[RPStoreInfo setAuthor:](v7, "setAuthor:", &stru_24D15E550);
    }

    objc_msgSend(v23, "productPageURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPStoreInfo setItemURL:](v7, "setItemURL:", v30);

    objc_msgSend(v23, "artwork");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URLWithHeight:width:cropStyle:format:", 128, 128, *MEMORY[0x24BE07E20], *MEMORY[0x24BE07E30]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPStoreInfo setAppArtworkURL:](v7, "setAppArtworkURL:", v33);

    -[RPStoreInfo appArtworkURL](v7, "appArtworkURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPStoreManager loadItemDetailsForBundleIdentifier:completionHandler:].cold.1();

    v5 = v37;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__RPStoreManager_loadItemDetailsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24D15D798;
  v39 = v7;
  v40 = v6;
  v35 = v7;
  v36 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__RPStoreManager_loadItemDetailsForBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)loadItemDetailsForBundleIdentifier:completionHandler:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "RPStoreManager::AMSLookupItemArtwork::URLWithHeight could not find artwork with specified parameters", v0, 2u);
}

- (void)loadItemDetailsForBundleIdentifier:(uint64_t *)a1 completionHandler:.cold.2(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "RPStoreManager::performLookupWithBundleIdentifiers could not complete lookup with error:%@", (uint8_t *)&v2, 0xCu);
}

@end
