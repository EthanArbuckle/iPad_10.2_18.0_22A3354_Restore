@implementation FCWebURLResolutionEndpointConnection

- (FCWebURLResolutionEndpointConnection)initWithConfigurationManager:(id)a3 cachesDirectoryURL:(id)a4 networkReachability:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCWebURLResolutionEndpointConnection *v12;
  FCWebURLResolutionEndpointConnection *v13;
  uint64_t v14;
  NSURL *cachesDirectoryURL;
  uint64_t v16;
  NFLazy *lazyStoreFrontIDPromise;
  uint64_t v18;
  NBURLCanonicalizer *canonicalizer;
  uint64_t v20;
  NBURLHasher *hasher;
  uint64_t v22;
  NBHashBucketer *bucketer;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    v33 = 1024;
    v34 = 52;
    v35 = 2114;
    v36 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cachesDirectoryURL");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    v33 = 1024;
    v34 = 53;
    v35 = 2114;
    v36 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkReachability");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCWebURLResolutionEndpointConnection initWithConfigurationManager:cachesDirectoryURL:networkReachability:]";
    v31 = 2080;
    v32 = "FCWebURLResolutionEndpointConnection.m";
    v33 = 1024;
    v34 = 54;
    v35 = 2114;
    v36 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v28.receiver = self;
  v28.super_class = (Class)FCWebURLResolutionEndpointConnection;
  v12 = -[FCWebURLResolutionEndpointConnection init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configurationManager, a3);
    v14 = objc_msgSend(v10, "copy");
    cachesDirectoryURL = v13->_cachesDirectoryURL;
    v13->_cachesDirectoryURL = (NSURL *)v14;

    objc_storeStrong((id *)&v13->_networkReachability, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_156);
    lazyStoreFrontIDPromise = v13->_lazyStoreFrontIDPromise;
    v13->_lazyStoreFrontIDPromise = (NFLazy *)v16;

    v18 = objc_opt_new();
    canonicalizer = v13->_canonicalizer;
    v13->_canonicalizer = (NBURLCanonicalizer *)v18;

    v20 = objc_opt_new();
    hasher = v13->_hasher;
    v13->_hasher = (NBURLHasher *)v20;

    v22 = objc_opt_new();
    bucketer = v13->_bucketer;
    v13->_bucketer = (NBHashBucketer *)v22;

  }
  return v13;
}

- (FCWebURLResolutionEndpointConnection)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCWebURLResolutionEndpointConnection init]";
    v9 = 2080;
    v10 = "FCWebURLResolutionEndpointConnection.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCWebURLResolutionEndpointConnection init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithResolver:", &__block_literal_global_14_4);
}

void __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v2 = a2;
  v3 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "determining storefront ID", buf, 2u);
  }
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_16;
  v7[3] = &unk_1E463B2D0;
  v8 = v4;
  v9 = v2;
  v5 = v4;
  v6 = v2;
  objc_msgSend(v5, "loadStoreFrontWithCompletionHandler:", v7);

}

void __108__FCWebURLResolutionEndpointConnection_initWithConfigurationManager_cachesDirectoryURL_networkReachability___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "loaded storefront ID", v5, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentStoreFrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)resolveWebURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  __int128 *p_buf;
  _QWORD v30[5];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  int64_t v34;
  _QWORD v35[7];
  _QWORD v36[4];
  id v37;
  FCWebURLResolutionEndpointConnection *v38;
  int64_t v39;
  _QWORD v40[7];
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a5;
  v9 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "resolving web URL %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__65;
  v49 = __Block_byref_object_dispose__65;
  v50 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__65;
  v44[4] = __Block_byref_object_dispose__65;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__65;
  v42[4] = __Block_byref_object_dispose__65;
  v43 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke;
  v41[3] = &unk_1E463D3A8;
  v41[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v41, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2;
  v40[3] = &unk_1E4648D58;
  v40[4] = self;
  v40[5] = &buf;
  v40[6] = a4;
  objc_msgSend(v11, "then:", v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_3;
  v36[3] = &unk_1E4648D80;
  v13 = v8;
  v37 = v13;
  v38 = self;
  v39 = a4;
  objc_msgSend(v12, "then:", v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_24;
  v35[3] = &unk_1E4648DA8;
  v35[4] = self;
  v35[5] = v44;
  v35[6] = a4;
  objc_msgSend(v14, "then:", v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_26;
  v30[3] = &unk_1E4648DD0;
  v32 = v42;
  v30[4] = self;
  v16 = v13;
  v31 = v16;
  v33 = v44;
  v34 = a4;
  objc_msgSend(v15, "then:", v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_28;
  v26[3] = &unk_1E4648DF8;
  v26[4] = self;
  v28 = v42;
  p_buf = &buf;
  v18 = v23;
  v27 = v18;
  objc_msgSend(v17, "then:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_30;
  v24[3] = &unk_1E4644848;
  v24[4] = self;
  v20 = v18;
  v25 = v20;
  v21 = (id)objc_msgSend(v19, "error:", v24);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(&buf, 8);
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "lazyStoreFrontIDPromise");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fetchBloomFilterInfoPromiseWithQualityOfService:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[5];

  if ((objc_msgSend(a2, "fc_maybeContainsURL:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_fetchCoreConfigurationIfNeededPromiseWithQualityOfService:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4;
    v5[3] = &unk_1E463D3A8;
    v5[4] = *(_QWORD *)(a1 + 40);
    __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "bloom filter did not contain domain", v7, 2u);
  }
  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  objc_msgSend(*(id *)(a1 + 32), "_bloomFilterError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithError:", v4);

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fetchConfigIfNeededPromiseWithCoreConfiguration:qualityOfService:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_26(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v3 = a2;
  v4 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "querying bucket", v15, 2u);
  }
  v5 = (void *)a1[4];
  v6 = a1[5];
  objc_msgSend(v3, "bucketGroupConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_hashOfURLWithWebURL:config:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (void *)a1[4];
  objc_msgSend(v3, "bucketGroupConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:", v12, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_28(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_articleIDWithHash:lists:storeFrontID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 0;
}

void __86__FCWebURLResolutionEndpointConnection_resolveWebURL_withQualityOfService_completion___block_invoke_2_30(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_bloomFilterError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isEqual:", v3);

  if (v4)
    v5 = 0;
  else
    v5 = v6;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v5);

}

- (void)fetchWebURLBloomFilterInfoWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCWebURLResolutionEndpointConnection fetchWebURLBloomFilterInfoWithQualityOfService:completion:]";
    v21 = 2080;
    v22 = "FCWebURLResolutionEndpointConnection.m";
    v23 = 1024;
    v24 = 130;
    v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke;
  v18[3] = &unk_1E4640CD0;
  v18[4] = self;
  v18[5] = a3;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_2;
  v16[3] = &unk_1E4648E20;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v8, "then:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_3;
  v14[3] = &unk_1E463DB48;
  v15 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v10, "error:", v14);

}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchBloomFilterInfoPromiseWithQualityOfService:", *(_QWORD *)(a1 + 40));
}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

uint64_t __98__FCWebURLResolutionEndpointConnection_fetchWebURLBloomFilterInfoWithQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_sharedProxyingScheduler
{
  if (qword_1ED0F8780 != -1)
    dispatch_once(&qword_1ED0F8780, &__block_literal_global_34_0);
  return (id)_MergedGlobals_205;
}

void __64__FCWebURLResolutionEndpointConnection__sharedProxyingScheduler__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  FCURLRequestScheduler *v5;
  void *v6;
  id v7;

  +[FCAssetDownloadOperation sharedURLSession](FCAssetDownloadOperation, "sharedURLSession");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v1, "copy");

  objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.news.urlresolution"));
  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v2, "setName:", CFSTR("FCWebURLResolutionEndpointConnection.bucketDownloadCallbackQueue"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaxConcurrentOperationCount:", objc_msgSend(v3, "processorCount"));

  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v7, 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCURLRequestScheduler initWithURLSession:]([FCURLRequestScheduler alloc], "initWithURLSession:", v4);
  v6 = (void *)_MergedGlobals_205;
  _MergedGlobals_205 = (uint64_t)v5;

}

+ (id)_bloomFilterScheduler
{
  if (qword_1ED0F8790 != -1)
    dispatch_once(&qword_1ED0F8790, &__block_literal_global_44_6);
  return (id)qword_1ED0F8788;
}

void __61__FCWebURLResolutionEndpointConnection__bloomFilterScheduler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  FCURLRequestScheduler *v4;
  void *v5;
  id v6;

  +[FCAssetDownloadOperation sharedURLSession](FCAssetDownloadOperation, "sharedURLSession");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v1, "copy");

  objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setURLCache:", v2);

  objc_msgSend(v6, "setRequestCachePolicy:", 0);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v6, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCURLRequestScheduler initWithURLSession:]([FCURLRequestScheduler alloc], "initWithURLSession:", v3);
  v5 = (void *)qword_1ED0F8788;
  qword_1ED0F8788 = (uint64_t)v4;

}

- (id)_fetchCoreConfigurationIfNeededPromiseWithQualityOfService:(int64_t)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke;
  v6[3] = &unk_1E463DAD0;
  v6[4] = self;
  return (id)objc_msgSend(v4, "initWithResolver:", v6);
}

void __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke_2;
  v7[3] = &unk_1E463DAA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "fetchConfigurationIfNeededWithCompletionQueue:completion:", v5, v7);

}

uint64_t __99__FCWebURLResolutionEndpointConnection__fetchCoreConfigurationIfNeededPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_fetchConfigIfNeededPromiseWithCoreConfiguration:(id)a3 qualityOfService:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  int64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[6];
  uint8_t buf[4];
  _BYTE v33[24];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "coreConfiguration");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v33 = "-[FCWebURLResolutionEndpointConnection _fetchConfigIfNeededPromiseWithCoreConfiguration:qualityOfService:]";
    *(_WORD *)&v33[8] = 2080;
    *(_QWORD *)&v33[10] = "FCWebURLResolutionEndpointConnection.m";
    *(_WORD *)&v33[18] = 1024;
    *(_DWORD *)&v33[20] = 187;
    v34 = 2114;
    v35 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCWebURLResolutionEndpointConnection cachesDirectoryURL](self, "cachesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("bucketGroupConfigResponse3"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62660]), "initWithData:", v9);
  v11 = v10;
  if (!v10)
  {
    v23 = FCWebURLResolutionLog;
    if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "fetching new bucket group config because we have no cached data", buf, 2u);
    }
    goto LABEL_15;
  }
  v28 = a4;
  objc_msgSend(v10, "bucketGroupConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "validUntilDate");

  objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bucketGroupConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "version");

  v17 = objc_msgSend(v6, "minimumBucketGroupConfigVersion");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fc_isEarlierThan:", v14);

  v20 = FCWebURLResolutionLog;
  v21 = os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT);
  if (!v19 || v17 > v16)
  {
    if (v21)
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v33 = v16;
      *(_WORD *)&v33[4] = 2114;
      *(_QWORD *)&v33[6] = v14;
      *(_WORD *)&v33[14] = 2048;
      *(_QWORD *)&v33[16] = v17;
      _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "fetching new bucket group config of version %d because expiration date %{public}@ was in the past or cached version did not meet or exceed minimum version of %lld", buf, 0x1Cu);
    }

    a4 = v28;
LABEL_15:
    v24 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke;
    v31[3] = &unk_1E4640CD0;
    v31[4] = self;
    v31[5] = a4;
    objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke_2;
    v29[3] = &unk_1E4648E48;
    v30 = v8;
    objc_msgSend(v25, "then:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  if (v21)
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v33 = v16;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v14;
    *(_WORD *)&v33[14] = 2048;
    *(_QWORD *)&v33[16] = v17;
    _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "using cached bucket group config of version %d because expiration date %{public}@ was not in the past and cached version met or exceeded minimum version of %lld", buf, 0x1Cu);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", v11);
LABEL_16:

  return v22;
}

uint64_t __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchConfigPromiseWithQualityOfService:", *(_QWORD *)(a1 + 40));
}

id __106__FCWebURLResolutionEndpointConnection__fetchConfigIfNeededPromiseWithCoreConfiguration_qualityOfService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", v3);
  return v5;
}

- (id)_fetchConfigPromiseWithQualityOfService:(int64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCAssetDownloadOperation *v10;
  void *v11;
  FCAssetDownloadOperation *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];

  v5 = a2;
  v6 = a3;
  FCNewsAssetServerHostName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/owl-bucket-groups/currentBucketGroupConfig"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [FCAssetDownloadOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "networkReachability");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCAssetDownloadOperation initWithNetworkReachability:](v10, "initWithNetworkReachability:", v11);

    -[FCAssetDownloadOperation setURL:](v12, "setURL:", v9);
    -[FCOperation setQualityOfService:](v12, "setQualityOfService:", *(_QWORD *)(a1 + 40));
    -[FCAssetDownloadOperation setDownloadDestination:](v12, "setDownloadDestination:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_3;
    v14[3] = &unk_1E4648E70;
    v15 = v6;
    v16 = v5;
    -[FCAssetDownloadOperation setDataDownloadCompletionHandler:](v12, "setDataDownloadCompletionHandler:", v14);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v12);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2;
    v17[3] = &unk_1E463B598;
    v17[4] = v6;
    __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2((uint64_t)v17);
  }

}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *v7;
  void (*v8)(void);
  id v9;
  _QWORD v10[5];

  v9 = a2;
  v6 = a4;
  if (v9)
  {
    v7 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62660]), "initWithData:", v9);
    if (!v7)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5;
      v10[3] = &unk_1E463B598;
      v10[4] = *(_QWORD *)(a1 + 32);
      __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5((uint64_t)v10);
      goto LABEL_7;
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v7 = *(id *)(a1 + 32);
    v8 = (void (*)(void))v7[2];
  }
  v8();
LABEL_7:

}

void __80__FCWebURLResolutionEndpointConnection__fetchConfigPromiseWithQualityOfService___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 13, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_fetchBloomFilterInfoPromiseWithQualityOfService:(int64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCAssetDownloadOperation *v11;
  void *v12;
  FCAssetDownloadOperation *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];

  v5 = a2;
  v6 = a3;
  FCNewsAssetServerHostName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/open-web-links/domainBloomFilter"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_bloomFilterScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [FCAssetDownloadOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "networkReachability");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:](v11, "initWithNetworkReachability:URLRequestScheduler:", v12, v10);

    -[FCAssetDownloadOperation setURL:](v13, "setURL:", v9);
    -[FCOperation setQualityOfService:](v13, "setQualityOfService:", *(_QWORD *)(a1 + 40));
    -[FCAssetDownloadOperation setCachePolicy:](v13, "setCachePolicy:", 0);
    -[FCAssetDownloadOperation setDownloadDestination:](v13, "setDownloadDestination:", 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_3;
    v15[3] = &unk_1E4648E70;
    v16 = v6;
    v17 = v5;
    -[FCAssetDownloadOperation setDataDownloadCompletionHandler:](v13, "setDataDownloadCompletionHandler:", v15);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v13);

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2;
    v18[3] = &unk_1E463B598;
    v18[4] = v6;
    __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2((uint64_t)v18);
  }

}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *v7;
  void (*v8)(void);
  id v9;
  _QWORD v10[5];

  v9 = a2;
  v6 = a4;
  if (v9)
  {
    v7 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62658]), "initWithData:", v9);
    if (!v7)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5;
      v10[3] = &unk_1E463B598;
      v10[4] = *(_QWORD *)(a1 + 32);
      __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5((uint64_t)v10);
      goto LABEL_7;
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v7 = *(id *)(a1 + 32);
    v8 = (void (*)(void))v7[2];
  }
  v8();
LABEL_7:

}

void __89__FCWebURLResolutionEndpointConnection__fetchBloomFilterInfoPromiseWithQualityOfService___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 13, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_hashOfURLWithWebURL:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  NSObject *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "webURL");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCWebURLResolutionEndpointConnection _hashOfURLWithWebURL:config:]";
    v19 = 2080;
    v20 = "FCWebURLResolutionEndpointConnection.m";
    v21 = 1024;
    v22 = 309;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "config");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCWebURLResolutionEndpointConnection _hashOfURLWithWebURL:config:]";
    v19 = 2080;
    v20 = "FCWebURLResolutionEndpointConnection.m";
    v21 = 1024;
    v22 = 310;
    v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  -[FCWebURLResolutionEndpointConnection canonicalizer](self, "canonicalizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canonicalizedURLForURL:", v6);
  v9 = (char *)objc_claimAutoreleasedReturnValue();

  v10 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    v18 = v9;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "canonicalized URL is %{sensitive}@", buf, 0xCu);
  }
  -[FCWebURLResolutionEndpointConnection hasher](self, "hasher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hashForURL:maxLength:", v9, objc_msgSend(v7, "byteCount"));
  v12 = (char *)objc_claimAutoreleasedReturnValue();

  v13 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v12;
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "hash is %{private}@", buf, 0xCu);
  }

  return v12;
}

- (id)_fetchListsPromiseWithConfig:(id)a3 coreConfiguration:(id)a4 hash:(id)a5 qualityOfService:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  FCWebURLResolutionEndpointConnection *v26;
  id v27;
  uint64_t v28;
  int64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "config");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    v32 = 2080;
    v33 = "FCWebURLResolutionEndpointConnection.m";
    v34 = 1024;
    v35 = 324;
    v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "coreConfiguration");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    v32 = 2080;
    v33 = "FCWebURLResolutionEndpointConnection.m";
    v34 = 1024;
    v35 = 325;
    v36 = 2114;
    v37 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "hash");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseWithConfig:coreConfiguration:hash:qualityOfService:]";
    v32 = 2080;
    v33 = "FCWebURLResolutionEndpointConnection.m";
    v34 = 1024;
    v35 = 326;
    v36 = 2114;
    v37 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCWebURLResolutionEndpointConnection bucketer](self, "bucketer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "bucketForHash:bucketCount:", v12, objc_msgSend(v10, "numberOfBuckets"));

  v15 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = (const char *)v14;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "bucket is %ld", buf, 0xCu);
  }
  v16 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke;
  v24[3] = &unk_1E4648EC0;
  v25 = v10;
  v26 = self;
  v28 = v14;
  v29 = a6;
  v27 = v11;
  v17 = v11;
  v18 = v10;
  v19 = (void *)objc_msgSend(v16, "initWithResolver:", v24);

  return v19;
}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD);
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[6];

  v5 = a2;
  v6 = a3;
  FCNewsAssetServerHostName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/owl-bucket-groups/%d/index/%zd"), v7, objc_msgSend(*(id *)(a1 + 32), "version"), *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_3;
    aBlock[3] = &unk_1E4648E98;
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 64);
    v23 = v11;
    v26 = v12;
    v24 = v6;
    v13 = v5;
    v25 = v13;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(*(id *)(a1 + 48), "shouldProxyURLBucketFetch"))
    {
      v15 = FCWebURLResolutionLog;
      if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "trying fetch for lists through proxy", buf, 2u);
      }
      v16 = *(void **)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 64);
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_69;
      v18[3] = &unk_1E46404F0;
      v19 = v13;
      v20 = v14;
      objc_msgSend(v16, "_fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:", 1, v11, v17, v18);

    }
    else
    {
      v14[2](v14);
    }

  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2;
    v27[3] = &unk_1E463B598;
    v27[4] = v6;
    __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2((uint64_t)v27);
  }

}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "trying fetch for lists directly", buf, 2u);
  }
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_66;
  v6[3] = &unk_1E46404F0;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:", 0, v4, v5, v6);

}

uint64_t __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_66(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __109__FCWebURLResolutionEndpointConnection__fetchListsPromiseWithConfig_coreConfiguration_hash_qualityOfService___block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchListsPromiseThroughProxy:(BOOL)a3 withResourceURL:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  FCAssetDownloadOperation *v13;
  void *v14;
  FCAssetDownloadOperation *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v8 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "resourceURL");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:]";
    v24 = 2080;
    v25 = "FCWebURLResolutionEndpointConnection.m";
    v26 = 1024;
    v27 = 393;
    v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCWebURLResolutionEndpointConnection _fetchListsPromiseThroughProxy:withResourceURL:qualityOfService:completion:]";
    v24 = 2080;
    v25 = "FCWebURLResolutionEndpointConnection.m";
    v26 = 1024;
    v27 = 394;
    v28 = 2114;
    v29 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_sharedProxyingScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = [FCAssetDownloadOperation alloc];
  -[FCWebURLResolutionEndpointConnection networkReachability](self, "networkReachability");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:](v13, "initWithNetworkReachability:URLRequestScheduler:", v14, v12);

  -[FCAssetDownloadOperation setURL:](v15, "setURL:", v10);
  -[FCOperation setQualityOfService:](v15, "setQualityOfService:", a5);
  -[FCAssetDownloadOperation setDownloadDestination:](v15, "setDownloadDestination:", 1);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke;
  v20[3] = &unk_1E4648EE8;
  v21 = v11;
  v16 = v11;
  -[FCAssetDownloadOperation setDataDownloadCompletionHandler:](v15, "setDataDownloadCompletionHandler:", v20);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v15);

}

void __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void (**v8)(id, _QWORD, id);
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a2;
  v6 = a4;
  if (v11)
  {
    v7 = (void (**)(id, _QWORD, id))objc_msgSend(objc_alloc(MEMORY[0x1E0D62620]), "initWithData:", v11);
    v8 = v7;
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "articleInfoLists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3;
      v12[3] = &unk_1E463B598;
      v12[4] = *(_QWORD *)(a1 + 32);
      __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3((uint64_t)v12);
    }
  }
  else
  {
    v8 = (void (**)(id, _QWORD, id))*(id *)(a1 + 32);
    v8[2](v8, 0, v6);
  }

}

void __115__FCWebURLResolutionEndpointConnection__fetchListsPromiseThroughProxy_withResourceURL_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 13, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_articleIDWithHash:(id)a3 lists:(id)a4 storeFrontID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "hash");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    v23 = 2080;
    v24 = "FCWebURLResolutionEndpointConnection.m";
    v25 = 1024;
    v26 = 421;
    v27 = 2114;
    v28 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "lists");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    v23 = 2080;
    v24 = "FCWebURLResolutionEndpointConnection.m";
    v25 = 1024;
    v26 = 422;
    v27 = 2114;
    v28 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storeFrontID");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCWebURLResolutionEndpointConnection _articleIDWithHash:lists:storeFrontID:]";
    v23 = 2080;
    v24 = "FCWebURLResolutionEndpointConnection.m";
    v25 = 1024;
    v26 = 423;
    v27 = 2114;
    v28 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v8, "fc_objectInSortedOrderedCollectionWithFeature:usingFeatureProvider:comparator:", v7, &__block_literal_global_75, &__block_literal_global_77_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "articleInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_3;
  v19[3] = &unk_1E4648F50;
  v20 = v9;
  v12 = v9;
  objc_msgSend(v11, "fc_firstObjectPassingTest:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "articleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "urlHash");
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_bigEndianCompareAsUnsignedInteger:");
}

uint64_t __78__FCWebURLResolutionEndpointConnection__articleIDWithHash_lists_storeFrontID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "storeFrontId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "storeFrontId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)_bloomFilterError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("bloomfilter"), 0, 0);
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NFLazy)lazyStoreFrontIDPromise
{
  return self->_lazyStoreFrontIDPromise;
}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (NBURLCanonicalizer)canonicalizer
{
  return self->_canonicalizer;
}

- (NBURLHasher)hasher
{
  return self->_hasher;
}

- (NBHashBucketer)bucketer
{
  return self->_bucketer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketer, 0);
  objc_storeStrong((id *)&self->_hasher, 0);
  objc_storeStrong((id *)&self->_canonicalizer, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_cachesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lazyStoreFrontIDPromise, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
