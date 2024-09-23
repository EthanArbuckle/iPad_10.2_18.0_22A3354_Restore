@implementation FCFileCoordinatedAppConfigurationManager

- (FCFileCoordinatedAppConfigurationManager)initWithFileURL:(id)a3 storefrontID:(id)a4
{
  id v6;
  id v7;
  FCFileCoordinatedAppConfigurationManager *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NFUnfairLock *lock;
  FCFileCoordinatedDictionary *v17;
  FCFileCoordinatedDictionary *fileCoordinatedDictionary;
  uint64_t v19;
  NSString *storefrontID;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFileCoordinatedAppConfigurationManager initWithFileURL:storefrontID:]";
    v27 = 2080;
    v28 = "FCFileCoordinatedAppConfigurationManager.m";
    v29 = 1024;
    v30 = 34;
    v31 = 2114;
    v32 = v22;
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
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storefrontID");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFileCoordinatedAppConfigurationManager initWithFileURL:storefrontID:]";
    v27 = 2080;
    v28 = "FCFileCoordinatedAppConfigurationManager.m";
    v29 = 1024;
    v30 = 35;
    v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCFileCoordinatedAppConfigurationManager;
  v8 = -[FCFileCoordinatedAppConfigurationManager init](&v24, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v8->_lock;
    v8->_lock = (NFUnfairLock *)v15;

    v17 = -[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]([FCFileCoordinatedDictionary alloc], "initWithFileURL:allowedClasses:", v6, v14);
    fileCoordinatedDictionary = v8->_fileCoordinatedDictionary;
    v8->_fileCoordinatedDictionary = v17;

    v19 = objc_msgSend(v7, "copy");
    storefrontID = v8->_storefrontID;
    v8->_storefrontID = (NSString *)v19;

  }
  return v8;
}

- (FCFileCoordinatedAppConfigurationManager)init
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
    v8 = "-[FCFileCoordinatedAppConfigurationManager init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedAppConfigurationManager.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedAppConfigurationManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)depositAppConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appConfiguration");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedAppConfigurationManager depositAppConfiguration:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedAppConfigurationManager.m";
    v14 = 1024;
    v15 = 58;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedAppConfigurationManager fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FCFileCoordinatedAppConfigurationManager_depositAppConfiguration___block_invoke;
  v8[3] = &unk_1E463B8D0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "writeWithAccessor:completion:", v8, 0);

}

void __68__FCFileCoordinatedAppConfigurationManager_depositAppConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_dictionaryFromAppConfiguration:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  -[FCFileCoordinatedAppConfigurationManager depositAppConfiguration:](self, "depositAppConfiguration:", a4);
}

- (FCNewsAppConfiguration)appConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[FCFileCoordinatedAppConfigurationManager lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__FCFileCoordinatedAppConfigurationManager_appConfiguration__block_invoke;
  v8[3] = &unk_1E463AD80;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "performWithLockSync:", v8);

  v4 = (void *)v10[5];
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[FCFileCoordinatedAppConfigurationManager storefrontID](self, "storefrontID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v9, 8);

  return (FCNewsAppConfiguration *)v5;
}

void __60__FCFileCoordinatedAppConfigurationManager_appConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchedAppConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
  -[FCFileCoordinatedAppConfigurationManager fetchAppConfigurationIfNeededWithCompletionQueue:completion:](self, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", MEMORY[0x1E0C80D38], a3);
}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  -[FCFileCoordinatedAppConfigurationManager lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v13[3] = &unk_1E463AD80;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v8, "performWithLockSync:", v13);

  if (v15[5])
  {
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    v10[3] = &unk_1E463B8F8;
    v11 = v7;
    v12 = &v14;
    dispatch_async(v6, v10);

  }
  else
  {
    -[FCFileCoordinatedAppConfigurationManager refreshAppConfigurationIfNeededWithCompletionQueue:refreshCompletion:](self, "refreshAppConfigurationIfNeededWithCompletionQueue:refreshCompletion:", v6, v7);
  }
  _Block_object_dispose(&v14, 8);

}

void __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchedAppConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FCFileCoordinatedAppConfigurationManager fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke;
  v11[3] = &unk_1E463B920;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "readWithAccessor:", v11);

}

void __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v3 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "storefrontID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_appConfigurationFromDictionary:forStorefrontID:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "lock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2;
      v13[3] = &unk_1E463AD10;
      v13[4] = *(_QWORD *)(a1 + 32);
      v14 = v7;
      objc_msgSend(v8, "performWithLockSync:", v13);

    }
  }
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_3;
  v11[3] = &unk_1E463B2D0;
  v9 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  dispatch_async(v9, v11);

}

uint64_t __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFetchedAppConfiguration:", *(_QWORD *)(a1 + 40));
}

void __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "appConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)_dictionaryFromAppConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
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
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appConfiguration");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCFileCoordinatedAppConfigurationManager _dictionaryFromAppConfiguration:]";
    v15 = 2080;
    v16 = "FCFileCoordinatedAppConfigurationManager.m";
    v17 = 1024;
    v18 = 162;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v3, "internalConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("c");
  objc_msgSend(v4, "configDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("l");
  objc_msgSend(v4, "languageConfigDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("s");
  objc_msgSend(v4, "storefrontID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_appConfigurationFromDictionary:(id)a3 forStorefrontID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dictionary");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedAppConfigurationManager _appConfigurationFromDictionary:forStorefrontID:]";
    v17 = 2080;
    v18 = "FCFileCoordinatedAppConfigurationManager.m";
    v19 = 1024;
    v20 = 175;
    v21 = 2114;
    v22 = v13;
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
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "desiredStorefrontID");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedAppConfigurationManager _appConfigurationFromDictionary:forStorefrontID:]";
    v17 = 2080;
    v18 = "FCFileCoordinatedAppConfigurationManager.m";
    v19 = 1024;
    v20 = 176;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("s"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    if (objc_msgSend(v9, "isEqualToString:", v6))
      v11 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v7, v10, v8);
    else
      v11 = 0;
  }

  return v11;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (FCNewsAppConfiguration)fetchedAppConfiguration
{
  return self->_fetchedAppConfiguration;
}

- (void)setFetchedAppConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, 0);
  objc_storeStrong((id *)&self->_fetchedAppConfiguration, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
