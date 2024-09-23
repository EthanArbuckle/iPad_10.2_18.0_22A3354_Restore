@implementation FCFileCoordinatedTodayDropbox

void __64__FCFileCoordinatedTodayDropbox_depositWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  FCMutableTodayPrivateData *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[FCMutableTodayPrivateData initWithDictionary:]([FCMutableTodayPrivateData alloc], "initWithDictionary:", v3);

  (*(void (**)(uint64_t, FCMutableTodayPrivateData *))(v2 + 16))(v2, v4);
}

- (FCFileCoordinatedTodayDropbox)initWithFileURL:(id)a3
{
  id v4;
  FCFileCoordinatedTodayDropbox *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  FCFileCoordinatedDictionary *v15;
  FCFileCoordinatedDictionary *fileCoordinatedDictionary;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCFileCoordinatedTodayDropbox initWithFileURL:]";
    v25 = 2080;
    v26 = "FCFileCoordinatedTodayDropbox.m";
    v27 = 1024;
    v28 = 50;
    v29 = 2114;
    v30 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22.receiver = self;
  v22.super_class = (Class)FCFileCoordinatedTodayDropbox;
  v5 = -[FCFileCoordinatedTodayDropbox init](&v22, sel_init);
  if (v5)
  {
    v21 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v20, v19, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]([FCFileCoordinatedDictionary alloc], "initWithFileURL:allowedClasses:", v4, v14);
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v15;

  }
  return v5;
}

- (void)depositWithAccessor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
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
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCFileCoordinatedTodayDropbox depositWithAccessor:completion:]";
    v15 = 2080;
    v16 = "FCFileCoordinatedTodayDropbox.m";
    v17 = 1024;
    v18 = 106;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__FCFileCoordinatedTodayDropbox_depositWithAccessor_completion___block_invoke;
  v11[3] = &unk_1E463CA30;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "writeWithAccessor:completion:", v11, v7);

}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (FCFileCoordinatedTodayDropbox)init
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
    v8 = "-[FCFileCoordinatedTodayDropbox init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedTodayDropbox init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)peekSyncWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[4];
  id v11;
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
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFileCoordinatedTodayDropbox peekSyncWithAccessor:]";
    v14 = 2080;
    v15 = "FCFileCoordinatedTodayDropbox.m";
    v16 = 1024;
    v17 = 76;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__FCFileCoordinatedTodayDropbox_peekSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E463CA08;
  v11 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "readSyncWithAccessor:", v10);

  return v7;
}

void __54__FCFileCoordinatedTodayDropbox_peekSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  FCTodayPrivateData *v4;
  id v5;
  FCTodayPrivateData *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = [FCTodayPrivateData alloc];
  if (v7)
    v5 = v7;
  else
    v5 = (id)MEMORY[0x1E0C9AA70];
  v6 = -[FCTodayPrivateData initWithDictionary:](v4, "initWithDictionary:", v5);
  (*(void (**)(uint64_t, FCTodayPrivateData *))(v3 + 16))(v3, v6);

}

- (void)peekWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
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
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedTodayDropbox peekWithAccessor:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedTodayDropbox.m";
    v14 = 1024;
    v15 = 86;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__FCFileCoordinatedTodayDropbox_peekWithAccessor___block_invoke;
  v8[3] = &unk_1E463CA08;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWithAccessor:", v8);

}

void __50__FCFileCoordinatedTodayDropbox_peekWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  FCTodayPrivateData *v4;
  id v5;
  FCTodayPrivateData *v6;
  id v7;

  v7 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = [FCTodayPrivateData alloc];
  if (v7)
    v5 = v7;
  else
    v5 = (id)MEMORY[0x1E0C9AA70];
  v6 = -[FCTodayPrivateData initWithDictionary:](v4, "initWithDictionary:", v5);
  (*(void (**)(uint64_t, FCTodayPrivateData *))(v3 + 16))(v3, v6);

}

- (BOOL)depositSyncWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[4];
  id v11;
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
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFileCoordinatedTodayDropbox depositSyncWithAccessor:]";
    v14 = 2080;
    v15 = "FCFileCoordinatedTodayDropbox.m";
    v16 = 1024;
    v17 = 96;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__FCFileCoordinatedTodayDropbox_depositSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E463CA30;
  v11 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "writeSyncWithAccessor:", v10);

  return v7;
}

void __57__FCFileCoordinatedTodayDropbox_depositSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  FCMutableTodayPrivateData *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[FCMutableTodayPrivateData initWithDictionary:]([FCMutableTodayPrivateData alloc], "initWithDictionary:", v3);

  (*(void (**)(uint64_t, FCMutableTodayPrivateData *))(v2 + 16))(v2, v4);
}

- (void)setFileCoordinatedDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, 0);
}

@end
