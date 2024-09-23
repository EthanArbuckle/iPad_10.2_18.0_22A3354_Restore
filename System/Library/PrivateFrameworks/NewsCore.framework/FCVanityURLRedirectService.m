@implementation FCVanityURLRedirectService

- (void)updateUnderlyingMappingWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[FCVanityURLRedirectService vanityURLMappingManager](self, "vanityURLMappingManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__FCVanityURLRedirectService_updateUnderlyingMappingWithQualityOfService_completion___block_invoke;
  v9[3] = &unk_1E4647E00;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "fetchValueWithQualityOfService:completion:", a3, v9);

}

- (FCFetchedValueManager)vanityURLMappingManager
{
  FCFetchedValueManager *vanityURLMappingManager;
  FCCoreConfigurationFetchedValueDescriptor *v4;
  void *v5;
  void *v6;
  FCCoreConfigurationFetchedValueDescriptor *v7;
  FCFetchedValueManager *v8;
  FCVanityURLConfigurationFetchedValueDescriptor *v9;
  FCFetchedValueManager *v10;
  FCHeldPBCodableFetchedValueDescriptor *v11;
  uint64_t v12;
  void *v13;
  FCHeldPBCodableFetchedValueDescriptor *v14;
  FCFetchedValueManager *v15;
  FCFetchedValueManager *v16;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  vanityURLMappingManager = self->_vanityURLMappingManager;
  if (!vanityURLMappingManager)
  {
    v4 = [FCCoreConfigurationFetchedValueDescriptor alloc];
    -[FCVanityURLRedirectService contentContext](self, "contentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCCoreConfigurationFetchedValueDescriptor initWithConfigurationManager:](v4, "initWithConfigurationManager:", v6);

    v8 = -[FCFetchedValueManager initWithDescriptor:]([FCFetchedValueManager alloc], "initWithDescriptor:", v7);
    v9 = -[FCVanityURLConfigurationFetchedValueDescriptor initWithConfigurationManager:]([FCVanityURLConfigurationFetchedValueDescriptor alloc], "initWithConfigurationManager:", v8);
    v10 = -[FCFetchedValueManager initWithDescriptor:]([FCFetchedValueManager alloc], "initWithDescriptor:", v9);
    v11 = [FCHeldPBCodableFetchedValueDescriptor alloc];
    v12 = objc_opt_class();
    -[FCVanityURLRedirectService contentContext](self, "contentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:](v11, "initWithCodableClass:contentContext:resourceConfigurationManager:", v12, v13, v10);

    v15 = -[FCFetchedValueManager initWithDescriptor:]([FCFetchedValueManager alloc], "initWithDescriptor:", v14);
    v16 = self->_vanityURLMappingManager;
    self->_vanityURLMappingManager = v15;

    vanityURLMappingManager = self->_vanityURLMappingManager;
  }
  return vanityURLMappingManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

uint64_t __85__FCVanityURLRedirectService_updateUnderlyingMappingWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (FCVanityURLRedirectService)initWithContentContext:(id)a3
{
  id v5;
  FCVanityURLRedirectService *v6;
  FCVanityURLRedirectService *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCVanityURLRedirectService initWithContentContext:]";
    v13 = 2080;
    v14 = "FCVanityURLRedirectService.m";
    v15 = 1024;
    v16 = 42;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLRedirectService;
  v6 = -[FCVanityURLRedirectService init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentContext, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_vanityURLMappingManager, 0);
}

- (FCVanityURLRedirectService)init
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
    v8 = "-[FCVanityURLRedirectService init]";
    v9 = 2080;
    v10 = "FCVanityURLRedirectService.m";
    v11 = 1024;
    v12 = 37;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCVanityURLRedirectService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)hasRedirectForURL:(id)a3
{
  void *v3;
  BOOL v4;

  -[FCVanityURLRedirectService destinationURLForURL:](self, "destinationURLForURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)resolveURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "URL");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCVanityURLRedirectService resolveURL:withQualityOfService:completion:]";
    v20 = 2080;
    v21 = "FCVanityURLRedirectService.m";
    v22 = 1024;
    v23 = 85;
    v24 = 2114;
    v25 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCVanityURLRedirectService resolveURL:withQualityOfService:completion:]";
    v20 = 2080;
    v21 = "FCVanityURLRedirectService.m";
    v22 = 1024;
    v23 = 86;
    v24 = 2114;
    v25 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  -[FCVanityURLRedirectService vanityURLMappingManager](self, "vanityURLMappingManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke;
  v15[3] = &unk_1E4647DD8;
  v16 = v8;
  v17 = v9;
  v15[4] = self;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "fetchValueWithCachePolicy:qualityOfService:completion:", 1, a4, v15);

}

void __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)FCVanityURLLog;
  if (os_log_type_enabled((os_log_t)FCVanityURLLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(a2, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "fetched vanity URL mapping %{public}@", buf, 0xCu);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke_16;
  v13[3] = &unk_1E4647DB0;
  v14 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v17 = v9;
  v15 = v10;
  v16 = v11;
  v12 = v5;
  FCPerformBlockOnMainThread(v13);

}

void __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_destinationURLForURL:", *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

- (void)acquireHoldTokenOnUnderlyingAssets
{
  -[FCVanityURLRedirectService vanityURLMappingManager](self, "vanityURLMappingManager");

}

- (id)_destinationURLForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FCVanityURLMapper *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "URL");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCVanityURLRedirectService _destinationURLForURL:]";
    v14 = 2080;
    v15 = "FCVanityURLRedirectService.m";
    v16 = 1024;
    v17 = 127;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCVanityURLRedirectService vanityURLMappingManager](self, "vanityURLMappingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[FCVanityURLMapper initWithVanityURLMapping:]([FCVanityURLMapper alloc], "initWithVanityURLMapping:", v7);
    -[FCVanityURLMapper URLForVanityURL:](v8, "URLForVanityURL:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
