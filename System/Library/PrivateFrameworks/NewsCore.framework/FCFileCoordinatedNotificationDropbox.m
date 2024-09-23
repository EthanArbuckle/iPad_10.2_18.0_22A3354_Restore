@implementation FCFileCoordinatedNotificationDropbox

- (FCFileCoordinatedNotificationDropbox)initWithFileURL:(id)a3
{
  id v4;
  FCFileCoordinatedNotificationDropbox *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  FCFileCoordinatedDictionary *v10;
  FCFileCoordinatedDictionary *fileCoordinatedDictionary;
  void *v13;
  objc_super v14;
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
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedNotificationDropbox initWithFileURL:]";
    v17 = 2080;
    v18 = "FCFileCoordinatedNotificationDropbox.m";
    v19 = 1024;
    v20 = 46;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v14.receiver = self;
  v14.super_class = (Class)FCFileCoordinatedNotificationDropbox;
  v5 = -[FCFileCoordinatedNotificationDropbox init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]([FCFileCoordinatedDictionary alloc], "initWithFileURL:allowedClasses:", v4, v9);
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v10;

  }
  return v5;
}

- (FCFileCoordinatedNotificationDropbox)init
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
    v8 = "-[FCFileCoordinatedNotificationDropbox init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    v11 = 1024;
    v12 = 41;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedNotificationDropbox init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
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
    v11 = "-[FCFileCoordinatedNotificationDropbox peekWithAccessor:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedNotificationDropbox.m";
    v14 = 1024;
    v15 = 59;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedNotificationDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__FCFileCoordinatedNotificationDropbox_peekWithAccessor___block_invoke;
  v8[3] = &unk_1E463CA08;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWithAccessor:", v8);

}

void __57__FCFileCoordinatedNotificationDropbox_peekWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  FCNotificationDropboxData *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    v5 = -[FCNotificationDropboxData initWithDictionary:]([FCNotificationDropboxData alloc], "initWithDictionary:", v3);
    (*(void (**)(uint64_t, FCNotificationDropboxData *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

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
    v14 = "-[FCFileCoordinatedNotificationDropbox depositWithAccessor:completion:]";
    v15 = 2080;
    v16 = "FCFileCoordinatedNotificationDropbox.m";
    v17 = 1024;
    v18 = 76;
    v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedNotificationDropbox fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__FCFileCoordinatedNotificationDropbox_depositWithAccessor_completion___block_invoke;
  v11[3] = &unk_1E463CA30;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "writeWithAccessor:completion:", v11, v7);

}

void __71__FCFileCoordinatedNotificationDropbox_depositWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  FCMutableNotificationData *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[FCMutableNotificationData initWithDictionary:]([FCMutableNotificationData alloc], "initWithDictionary:", v3);

  (*(void (**)(uint64_t, FCMutableNotificationData *))(v2 + 16))(v2, v4);
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
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
