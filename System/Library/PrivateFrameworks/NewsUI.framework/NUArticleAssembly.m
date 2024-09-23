@implementation NUArticleAssembly

NUArticlePrefetcher *__36__NUArticleAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NUArticlePrefetcher *v3;
  void *v4;
  void *v5;
  NUArticlePrefetcher *v6;

  v2 = a2;
  v3 = [NUArticlePrefetcher alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E651B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E75E58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUArticlePrefetcher initWithArticleFactory:articleDataProviderFactory:](v3, "initWithArticleFactory:articleDataProviderFactory:", v4, v5);
  return v6;
}

NUANFArticleDataProviderFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NUANFArticleDataProviderFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NUANFArticleDataProviderFactory *v9;

  v2 = a2;
  v3 = [NUANFArticleDataProviderFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83D78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E5F668);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83258);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E64E78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NUANFArticleDataProviderFactory initWithContentContext:fontRegistration:host:embedDataManager:linkedContentManagerFactory:](v3, "initWithContentContext:fontRegistration:host:embedDataManager:linkedContentManagerFactory:", v4, v5, v6, v7, v8);
  return v9;
}

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254E75E58, &__block_literal_global_12);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254E651B8, &__block_literal_global_197);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254E6C6E8, &__block_literal_global_206);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerProtocol:factory:", &unk_254E680A8, &__block_literal_global_213);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "inScope:", 3);

  objc_msgSend(v3, "publicContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerProtocol:factory:", &unk_254E6D328, &__block_literal_global_227);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254E5C6A0, &__block_literal_global_238);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254E5F468, &__block_literal_global_274);

  objc_msgSend(v3, "publicContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerClass:factory:", objc_opt_class(), &__block_literal_global_297);

  objc_msgSend(v3, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerClass:factory:", objc_opt_class(), &__block_literal_global_300);

  objc_msgSend(v3, "publicContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerProtocol:factory:", &unk_254E75288, &__block_literal_global_313_0);

  objc_msgSend(v3, "publicContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "registerClass:factory:", objc_opt_class(), &__block_literal_global_317);

  objc_msgSend(v3, "publicContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v28, "registerProtocol:factory:", &unk_254E6B1D0, &__block_literal_global_322);

  objc_msgSend(v3, "publicContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v30, "registerProtocol:factory:", &unk_254E75780, &__block_literal_global_333);

  objc_msgSend(v3, "publicContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v32, "registerProtocol:factory:", &unk_254E64428, &__block_literal_global_336);

  objc_msgSend(v3, "publicContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v34, "registerProtocol:factory:", &unk_254E6B0E8, &__block_literal_global_343);

  objc_msgSend(v3, "publicContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v36, "registerClass:factory:", objc_opt_class(), &__block_literal_global_408);

  objc_msgSend(v3, "publicContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v38, "registerClass:factory:", objc_opt_class(), &__block_literal_global_848);

  objc_msgSend(v3, "publicContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v40, "registerProtocol:factory:", &unk_254E67DC0, &__block_literal_global_855);

  objc_msgSend(v3, "publicContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v42, "registerProtocol:factory:", &unk_254E65108, &__block_literal_global_879);

  objc_msgSend(v3, "publicContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)objc_msgSend(v44, "registerProtocol:factory:", &unk_254E64830, &__block_literal_global_885);

  objc_msgSend(v3, "publicContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v46, "registerProtocol:factory:", &unk_254E64930, &__block_literal_global_893);

  objc_msgSend(v3, "publicContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "registerClass:factory:", objc_opt_class(), &__block_literal_global_895);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v49, "withConfiguration:", &__block_literal_global_897);

  objc_msgSend(v3, "publicContainer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)objc_msgSend(v51, "registerProtocol:factory:", &unk_254E64DF8, &__block_literal_global_902);

  objc_msgSend(v3, "publicContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "registerProtocol:factory:", &unk_254E64E78, &__block_literal_global_904);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (id)objc_msgSend(v54, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (id)objc_msgSend(v56, "registerProtocol:factory:", &unk_254E6C478, &__block_literal_global_915);

  objc_msgSend(v3, "publicContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v58, "registerProtocol:factory:", &unk_254E68628, &__block_literal_global_921);

  objc_msgSend(v3, "publicContainer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v60, "registerProtocol:factory:", &unk_254E6D7D0, &__block_literal_global_926);

  objc_msgSend(v3, "publicContainer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)objc_msgSend(v62, "registerProtocol:factory:", &unk_254E6CCA0, &__block_literal_global_933);

  objc_msgSend(v3, "publicContainer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "registerClass:factory:", objc_opt_class(), &__block_literal_global_935);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (id)objc_msgSend(v65, "withConfiguration:", &__block_literal_global_937);

  objc_msgSend(v3, "publicContainer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (id)objc_msgSend(v67, "registerClass:factory:", objc_opt_class(), &__block_literal_global_939);

  objc_msgSend(v3, "publicContainer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (id)objc_msgSend(v69, "registerProtocol:factory:", &unk_254E5F988, &__block_literal_global_940);

  objc_msgSend(v3, "publicContainer");
  v72 = (id)objc_claimAutoreleasedReturnValue();

  v71 = (id)objc_msgSend(v72, "registerProtocol:factory:", &unk_254E691F0, &__block_literal_global_942);
}

NUANFEmbedConfigurationLoader *__36__NUArticleAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NUANFEmbedConfigurationLoader *v3;
  void *v4;
  void *v5;
  NUANFEmbedConfigurationLoader *v6;

  v2 = a2;
  v3 = [NUANFEmbedConfigurationLoader alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E848E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUANFEmbedConfigurationLoader initWithAppConfigManager:flintResourceManager:](v3, "initWithAppConfigManager:flintResourceManager:", v4, v5);
  return v6;
}

NUANFArticleFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NUANFArticleFactory *v3;
  void *v4;
  NUANFArticleFactory *v5;

  v2 = a2;
  v3 = [NUANFArticleFactory alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUANFArticleFactory initWithArticleController:](v3, "initWithArticleController:", v4);
  return v5;
}

void __36__NUArticleAssembly_loadInRegistry___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addLinkedContentProviderFactory:", v6);
}

NULinkedContentManagerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_30()
{
  return objc_alloc_init(NULinkedContentManagerFactory);
}

NUEmbedDataManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  NUEmbedDataManager *v3;
  void *v4;
  NUEmbedDataManager *v5;

  v2 = a2;
  v3 = [NUEmbedDataManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6C478);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUEmbedDataManager initWithEmbedConfigurationLoader:](v3, "initWithEmbedConfigurationLoader:", v4);
  return v5;
}

NUANFLinkedContentProviderFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  NUANFLinkedContentProviderFactory *v3;
  void *v4;
  NUANFLinkedContentProviderFactory *v5;

  v2 = a2;
  v3 = [NUANFLinkedContentProviderFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83D78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUANFLinkedContentProviderFactory initWithContentContext:](v3, "initWithContentContext:", v4);
  return v5;
}

NUDocumentSectionBlueprintProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_3()
{
  return objc_alloc_init(NUDocumentSectionBlueprintProvider);
}

NUNoopChromeControl *__36__NUArticleAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(NUNoopChromeControl);
}

NUArticleViewControllerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NUArticleViewControllerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NUArticleViewControllerFactory *v11;

  v2 = a2;
  v3 = [NUArticleViewControllerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E75E58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E5CB88);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E5F988);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6C6E8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6D328);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E691F0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveOptionalProtocol:", &unk_254E85CF8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUArticleViewControllerFactory initWithArticleDataProviderFactory:appStateMonitor:keyCommandManager:headerBlueprintProvider:articlePrefetcher:articleScrollPositionManager:spotlightManager:resolver:](v3, "initWithArticleDataProviderFactory:appStateMonitor:keyCommandManager:headerBlueprintProvider:articlePrefetcher:articleScrollPositionManager:spotlightManager:resolver:", v4, v5, v6, v7, v8, v9, v10, v2);

  return v11;
}

NUArticleHostViewControllerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NUArticleHostViewControllerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NUArticleHostViewControllerFactory *v8;

  v2 = a2;
  v3 = [NUArticleHostViewControllerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E5C6A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E68300);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E68200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6DAD0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NUArticleHostViewControllerFactory initWithArticleViewControllerFactory:settings:errorMessageFactory:contentSizeManager:](v3, "initWithArticleViewControllerFactory:settings:errorMessageFactory:contentSizeManager:", v4, v5, v6, v7);
  return v8;
}

NUArticleHostViewControllerProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_8()
{
  return objc_alloc_init(NUArticleHostViewControllerProvider);
}

NUArticleContainerViewController *__36__NUArticleAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  NUArticleContainerViewController *v3;
  void *v4;
  void *v5;
  NUArticleContainerViewController *v6;

  v2 = a2;
  v3 = [NUArticleContainerViewController alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E75288);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E64428);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUArticleContainerViewController initWithPagingFactory:router:](v3, "initWithPagingFactory:router:", v4, v5);
  return v6;
}

NUPagingEngine *__36__NUArticleAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  NUPagingEngine *v3;
  void *v4;
  NUPagingEngine *v5;

  v2 = a2;
  v3 = [NUPagingEngine alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUPagingEngine initWithArticlePageFactory:](v3, "initWithArticlePageFactory:", v4);
  return v5;
}

NUArticlePageFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NUArticlePageFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  NUArticlePageFactory *v7;

  v2 = a2;
  v3 = [NUArticlePageFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E651B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6B1D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E5F468);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NUArticlePageFactory initWithArticleFactory:articleActivityFactory:articleHostViewControllerFactory:](v3, "initWithArticleFactory:articleActivityFactory:articleHostViewControllerFactory:", v4, v5, v6);
  return v7;
}

NUArticleActivityManagerFactory *__36__NUArticleAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NUArticleActivityManagerFactory *v8;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6C380);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E75780);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NUArticleActivityManagerFactory initWithReadingHistory:readingList:subscriptionList:URLHandler:optionsProvider:]([NUArticleActivityManagerFactory alloc], "initWithReadingHistory:readingList:subscriptionList:URLHandler:optionsProvider:", v4, v3, v5, v6, v7);
  return v8;
}

NUArticleActivityDefaultOptionsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_13()
{
  return objc_alloc_init(NUArticleActivityDefaultOptionsProvider);
}

NURouter *__36__NUArticleAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  NURouter *v3;
  void *v4;
  NURouter *v5;

  v2 = a2;
  v3 = [NURouter alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6C380);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NURouter initWithURLHandler:](v3, "initWithURLHandler:", v4);
  return v5;
}

NUStoreFrontProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NUStoreFrontProvider *v3;
  void *v4;
  NUStoreFrontProvider *v5;

  v2 = a2;
  v3 = [NUStoreFrontProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E85A68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUStoreFrontProvider initWithAppleAccount:](v3, "initWithAppleAccount:", v4);
  return v5;
}

NUMediaSharingPolicyProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  NUMediaSharingPolicyProvider *v3;
  void *v4;
  void *v5;
  NUMediaSharingPolicyProvider *v6;

  v2 = a2;
  v3 = [NUMediaSharingPolicyProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83150);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E848E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUMediaSharingPolicyProvider initWithHeadline:appConfigurationManager:](v3, "initWithHeadline:appConfigurationManager:", v4, v5);
  return v6;
}

NUWebContentLoadingPolicyProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  NUWebContentLoadingPolicyProvider *v3;
  void *v4;
  NUWebContentLoadingPolicyProvider *v5;

  v2 = a2;
  v3 = [NUWebContentLoadingPolicyProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83150);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUWebContentLoadingPolicyProvider initWithHeadline:](v3, "initWithHeadline:", v4);
  return v5;
}

NUReachabilityProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  NUReachabilityProvider *v3;
  void *v4;
  NUReachabilityProvider *v5;

  v2 = a2;
  v3 = [NUReachabilityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E853F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUReachabilityProvider initWithNetworkReachability:](v3, "initWithNetworkReachability:", v4);
  return v5;
}

NUANFDebugSettingsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_19()
{
  return objc_alloc_init(NUANFDebugSettingsProvider);
}

id __36__NUArticleAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__NUArticleAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

NUURLHandler *__36__NUArticleAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NUURLHandler *v5;
  void *v6;
  NUURLHandler *v7;

  v2 = a2;
  objc_msgSend(v2, "resolveProtocol:", &unk_254E848E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [NUURLHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E6C380);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NUURLHandler initWithURLHandling:universalLinksEnabled:](v5, "initWithURLHandling:universalLinksEnabled:", v6, objc_msgSend(v4, "universalLinksEnabled"));
  return v7;
}

void __36__NUArticleAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NUDeepLinkURLModifier *v7;

  v4 = a3;
  v5 = a2;
  v7 = objc_alloc_init(NUDeepLinkURLModifier);
  objc_msgSend(v4, "addModifier:", v7);
  objc_msgSend(v5, "resolveProtocol:", &unk_254E5D230);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setWebViewControllerFactory:", v6);
}

uint64_t __36__NUArticleAssembly_loadInRegistry___block_invoke_24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254E64E78);
}

NUWebContentContentRuleProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NUWebContentContentRuleProvider *v3;
  void *v4;
  void *v5;
  NUWebContentContentRuleProvider *v6;

  v2 = a2;
  v3 = [NUWebContentContentRuleProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E848E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83150);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUWebContentContentRuleProvider initWithAppConfigurationManager:headline:](v3, "initWithAppConfigurationManager:headline:", v4, v5);
  return v6;
}

NUWebContentComponentDeveloperSettingsProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  NUWebContentComponentDeveloperSettingsProvider *v3;
  void *v4;
  NUWebContentComponentDeveloperSettingsProvider *v5;

  v2 = a2;
  v3 = [NUWebContentComponentDeveloperSettingsProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E83150);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUWebContentComponentDeveloperSettingsProvider initWithHeadline:](v3, "initWithHeadline:", v4);
  return v5;
}

NUANFRenderingConfigurationProvider *__36__NUArticleAssembly_loadInRegistry___block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  NUANFRenderingConfigurationProvider *v3;
  void *v4;
  NUANFRenderingConfigurationProvider *v5;

  v2 = a2;
  v3 = [NUANFRenderingConfigurationProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E848E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUANFRenderingConfigurationProvider initWithAppConfigurationManager:](v3, "initWithAppConfigurationManager:", v4);
  return v5;
}

NUArticleKeyCommandManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_33()
{
  return objc_alloc_init(NUArticleKeyCommandManager);
}

NUArticleScrollPositionManager *__36__NUArticleAssembly_loadInRegistry___block_invoke_34()
{
  return objc_alloc_init(NUArticleScrollPositionManager);
}

@end
