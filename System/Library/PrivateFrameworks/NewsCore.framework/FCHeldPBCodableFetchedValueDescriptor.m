@implementation FCHeldPBCodableFetchedValueDescriptor

- (void)_processFetchOperationResult:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  FCShallowCopyPair *v15;
  void *v16;
  FCShallowCopyPair *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "result");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCHeldPBCodableFetchedValueDescriptor _processFetchOperationResult:withBlock:]";
    v22 = 2080;
    v23 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v24 = 1024;
    v25 = 130;
    v26 = 2114;
    v27 = v18;
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
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCHeldPBCodableFetchedValueDescriptor _processFetchOperationResult:withBlock:]";
    v22 = 2080;
    v23 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v24 = 1024;
    v25 = 131;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7, 0, v8);
  }
  else
  {
    objc_msgSend(v6, "fetchedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_onlyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v10, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithContentsOfURL:", v12);

    v14 = (void *)objc_msgSend(objc_alloc(-[FCHeldPBCodableFetchedValueDescriptor codableClass](self, "codableClass")), "initWithData:", v13);
    v15 = [FCShallowCopyPair alloc];
    objc_msgSend(v10, "assetHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCPair initWithFirst:second:](v15, "initWithFirst:second:", v14, v16);

    ((void (**)(id, FCShallowCopyPair *, void *))v7)[2](v7, v17, 0);
  }

}

- (Class)codableClass
{
  return self->_codableClass;
}

void __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __95__FCHeldPBCodableFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processFetchOperationResult:withBlock:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "left");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCHeldPBCodableFetchedValueDescriptor isValue:equalToValue:]";
    v15 = 2080;
    v16 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v17 = 1024;
    v18 = 121;
    v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "right");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCHeldPBCodableFetchedValueDescriptor isValue:equalToValue:]";
    v15 = 2080;
    v16 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v17 = 1024;
    v18 = 122;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(v5, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  return v9;
}

- (FCHeldPBCodableFetchedValueDescriptor)initWithCodableClass:(Class)a3 contentContext:(id)a4 resourceConfigurationManager:(id)a5
{
  id v9;
  id v10;
  FCHeldPBCodableFetchedValueDescriptor *v11;
  FCHeldPBCodableFetchedValueDescriptor *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
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
  v9 = a4;
  v10 = a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "codableClass");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    v20 = 2080;
    v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v22 = 1024;
    v23 = 35;
    v24 = 2114;
    v25 = v14;
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
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    v20 = 2080;
    v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v22 = 1024;
    v23 = 36;
    v24 = 2114;
    v25 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "resourceConfigurationManager");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCHeldPBCodableFetchedValueDescriptor initWithCodableClass:contentContext:resourceConfigurationManager:]";
    v20 = 2080;
    v21 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v22 = 1024;
    v23 = 37;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v17.receiver = self;
  v17.super_class = (Class)FCHeldPBCodableFetchedValueDescriptor;
  v11 = -[FCFetchedValueDescriptor init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_codableClass = a3;
    objc_storeStrong((id *)&v11->_contentContext, a4);
    objc_storeStrong((id *)&v12->_resourceConfigurationManager, a5);
  }

  return v12;
}

- (id)fastCachedValue
{
  void *v3;
  void *v4;
  FCResourcesFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  FCResourcesFetchOperation *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__57;
  v17 = __Block_byref_object_dispose__57;
  v18 = 0;
  -[FCHeldPBCodableFetchedValueDescriptor resourceConfigurationManager](self, "resourceConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [FCResourcesFetchOperation alloc];
    -[FCHeldPBCodableFetchedValueDescriptor contentContext](self, "contentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v5, "initWithContext:resourceIDs:downloadAssets:", v6, v8, 0);

    -[FCFetchOperation setCachePolicy:](v9, "setCachePolicy:", 3);
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v9, "setCanSendFetchCompletionSynchronously:", 1);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke;
    v12[3] = &unk_1E4647D60;
    v12[4] = self;
    v12[5] = &v13;
    -[FCFetchOperation setFetchCompletionBlock:](v9, "setFetchCompletionBlock:", v12);
    -[FCOperation start](v9, "start");
    -[FCResourcesFetchOperation waitUntilFinished](v9, "waitUntilFinished");

  }
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCResourcesFetchOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  FCResourcesFetchOperation *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  FCHeldPBCodableFetchedValueDescriptor *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3)
    v9 = a3 == 1;
  else
    v9 = 5;
  -[FCHeldPBCodableFetchedValueDescriptor resourceConfigurationManager](self, "resourceConfigurationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [FCResourcesFetchOperation alloc];
  -[FCHeldPBCodableFetchedValueDescriptor contentContext](self, "contentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v12, "initWithContext:resourceIDs:downloadAssets:", v13, v15, 1);

  -[FCOperation setQualityOfService:](v16, "setQualityOfService:", a4);
  -[FCFetchOperation setCachePolicy:](v16, "setCachePolicy:", v9);
  -[FCFetchOperation setMaximumCachedAge:](v16, "setMaximumCachedAge:", (double)objc_msgSend(v11, "refreshRate"));
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __95__FCHeldPBCodableFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  v21 = &unk_1E463B768;
  v22 = self;
  v23 = v8;
  v17 = v8;
  -[FCFetchOperation setFetchCompletionBlock:](v16, "setFetchCompletionBlock:", &v18);
  -[FCOperation start](v16, "start", v18, v19, v20, v21, v22);

}

- (id)inputManagers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[FCHeldPBCodableFetchedValueDescriptor resourceConfigurationManager](self, "resourceConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCFetchedValueManager)resourceConfigurationManager
{
  return self->_resourceConfigurationManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

uint64_t __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__FCHeldPBCodableFetchedValueDescriptor_fastCachedValue__block_invoke_2;
  v4[3] = &unk_1E4647D38;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "_processFetchOperationResult:withBlock:", a2, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceConfigurationManager, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

- (FCHeldPBCodableFetchedValueDescriptor)init
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
    v8 = "-[FCHeldPBCodableFetchedValueDescriptor init]";
    v9 = 2080;
    v10 = "FCHeldPBCodableFetchedValueDescriptor.m";
    v11 = 1024;
    v12 = 28;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCHeldPBCodableFetchedValueDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
