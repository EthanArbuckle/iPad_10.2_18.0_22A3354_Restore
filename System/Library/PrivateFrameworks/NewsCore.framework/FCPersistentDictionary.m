@implementation FCPersistentDictionary

- (id)read
{
  void *v3;
  void *v4;
  void *v5;

  -[FCPersistentDictionary fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersistentDictionary allowedClasses](self, "allowedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCReadDictionary(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)writeWithAccessor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[FCPersistentDictionary fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersistentDictionary allowedClasses](self, "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersistentDictionary fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = FCReadWriteDictionaryWithAccessor(v5, v6, v7, 0, v4);

  return v8;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (FCPersistentDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4
{
  id v6;
  id v7;
  FCPersistentDictionary *v8;
  uint64_t v9;
  NSURL *fileURL;
  void *v11;
  uint64_t v12;
  NSSet *allowedClasses;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[2];
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
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPersistentDictionary initWithFileURL:allowedClasses:]";
    v21 = 2080;
    v22 = "FCFileCoordinatedDictionary.m";
    v23 = 1024;
    v24 = 135;
    v25 = 2114;
    v26 = v15;
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
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "allowedClasses");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCPersistentDictionary initWithFileURL:allowedClasses:]";
    v21 = 2080;
    v22 = "FCFileCoordinatedDictionary.m";
    v23 = 1024;
    v24 = 136;
    v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)FCPersistentDictionary;
  v8 = -[FCPersistentDictionary init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v9;

    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    allowedClasses = v8->_allowedClasses;
    v8->_allowedClasses = (NSSet *)v12;

  }
  return v8;
}

- (FCPersistentDictionary)init
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
    v8 = "-[FCPersistentDictionary init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedDictionary.m";
    v11 = 1024;
    v12 = 130;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersistentDictionary init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
