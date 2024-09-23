@implementation FCManagedResourceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceID, 0);
}

- (FCManagedResourceConfiguration)initWithResourceID:(id)a3 refreshRate:(int64_t)a4
{
  id v6;
  FCManagedResourceConfiguration *v7;
  uint64_t v8;
  NSString *resourceID;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "resourceID");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCManagedResourceConfiguration initWithResourceID:refreshRate:]";
    v16 = 2080;
    v17 = "FCManagedResourceConfiguration.m";
    v18 = 1024;
    v19 = 20;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_6;
  }
  else if ((a4 & 0x8000000000000000) == 0)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "refreshRate >= 0");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCManagedResourceConfiguration initWithResourceID:refreshRate:]";
    v16 = 2080;
    v17 = "FCManagedResourceConfiguration.m";
    v18 = 1024;
    v19 = 21;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FCManagedResourceConfiguration;
  v7 = -[FCManagedResourceConfiguration init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    resourceID = v7->_resourceID;
    v7->_resourceID = (NSString *)v8;

    v7->_refreshRate = a4;
  }

  return v7;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (int64_t)refreshRate
{
  return self->_refreshRate;
}

- (FCManagedResourceConfiguration)init
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
    v8 = "-[FCManagedResourceConfiguration init]";
    v9 = 2080;
    v10 = "FCManagedResourceConfiguration.m";
    v11 = 1024;
    v12 = 15;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCManagedResourceConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
