@implementation NUCoreAssembly

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "fetchAppConfigurationIfNeededWithCompletion:", 0);
}

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_22()
{
  return objc_msgSend(MEMORY[0x24BE6CAA0], "sharedAccount");
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E83D78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:factory:", objc_opt_class(), &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_254E83D78, &__block_literal_global_174);

  objc_msgSend(v3, "publicContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "registerProtocol:factory:", &unk_254E84530, &__block_literal_global_252);

  objc_msgSend(v3, "publicContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerProtocol:factory:", &unk_254E848E8, &__block_literal_global_290);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "withConfiguration:", &__block_literal_global_292);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_295);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:factory:", objc_opt_class(), &__block_literal_global_298);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:factory:", objc_opt_class(), &__block_literal_global_301);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerClass:factory:", objc_opt_class(), &__block_literal_global_304);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:factory:", objc_opt_class(), &__block_literal_global_307);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerClass:factory:", objc_opt_class(), &__block_literal_global_310);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerClass:factory:", objc_opt_class(), &__block_literal_global_313);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v32, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerClass:factory:", objc_opt_class(), &__block_literal_global_316);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerClass:factory:", objc_opt_class(), &__block_literal_global_319);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v38, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "registerProtocol:factory:", &unk_254E84C40, &__block_literal_global_355);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v41, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "registerProtocol:factory:", &unk_254E84F80, &__block_literal_global_389);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)objc_msgSend(v44, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "registerClass:factory:", objc_opt_class(), &__block_literal_global_392);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)objc_msgSend(v47, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerProtocol:factory:", &unk_254E85150, &__block_literal_global_407);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v50, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "registerClass:factory:", objc_opt_class(), &__block_literal_global_409);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (id)objc_msgSend(v53, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "registerProtocol:factory:", &unk_254E853F0, &__block_literal_global_427);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (id)objc_msgSend(v56, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "registerClass:factory:", objc_opt_class(), &__block_literal_global_430);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (id)objc_msgSend(v59, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "registerProtocol:factory:", &unk_254E85A68, &__block_literal_global_486);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)objc_msgSend(v62, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "registerProtocol:factory:", &unk_254E85B38, &__block_literal_global_495);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (id)objc_msgSend(v65, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "registerProtocol:factory:", &unk_254E5F668, &__block_literal_global_503);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (id)objc_msgSend(v68, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "registerProtocol:factory:", &unk_254E68300, &__block_literal_global_509);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (id)objc_msgSend(v71, "inScope:", 0);

  objc_msgSend(v3, "publicContainer");
  v74 = (id)objc_claimAutoreleasedReturnValue();

  v73 = (id)objc_msgSend(v74, "registerProtocol:factory:", &unk_254E68200, &__block_literal_global_518);
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E83D78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flintResourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleTypeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issueReadingHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readingHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutCategoryList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readingList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userEventHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "puzzleHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __33__NUCoreAssembly_loadInRegistry___block_invoke_19()
{
  return objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v2 = (void *)MEMORY[0x24BE6CB30];
  v3 = a2;
  objc_msgSend(v2, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCURLForContainerizedUserAccountCachesDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE6CB20]);
  objc_msgSend(MEMORY[0x24BE6CBC8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:", v4, v5, v7);

  v9 = objc_alloc(MEMORY[0x24BE6CB18]);
  FCURLForContainerizedUserAccountDocumentDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveProtocol:", &unk_254E5C988);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom") == 1;
  objc_msgSend(MEMORY[0x24BE6CCB8], "defaultAvailability");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = v14;
  v16 = (void *)objc_msgSend(v9, "initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:", v4, v8, v5, v10, 0, 0, v11, v12, 0xF87FFFFC1, 6, v18, 0, v15, 0, 0);

  return v16;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E83D78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254E84530);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __33__NUCoreAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentIssuesChecker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

NUFontManager *__33__NUCoreAssembly_loadInRegistry___block_invoke_24()
{
  return objc_alloc_init(NUFontManager);
}

NUSettings *__33__NUCoreAssembly_loadInRegistry___block_invoke_25()
{
  return objc_alloc_init(NUSettings);
}

NUErrorMessageFactory *__33__NUCoreAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NUErrorMessageFactory *v3;
  void *v4;
  NUErrorMessageFactory *v5;

  v2 = a2;
  v3 = [NUErrorMessageFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254E853F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[NUErrorMessageFactory initWithNetworkReachability:](v3, "initWithNetworkReachability:", v4);
  return v5;
}

@end
