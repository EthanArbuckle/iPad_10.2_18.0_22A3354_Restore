@implementation FCBlockedExplicitContentAccessChecker

- (FCBlockedExplicitContentAccessChecker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCBlockedExplicitContentAccessChecker;
  return -[FCAccessChecker init](&v3, sel_init);
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  id v3;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCBlockedExplicitContentAccessChecker canSynchronouslyCheckAccessToItem:]";
    v8 = 2080;
    v9 = "FCBlockedExplicitContentAccessChecker.m";
    v10 = 1024;
    v11 = 21;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v6;
  int v7;
  char v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v13;
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
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCBlockedExplicitContentAccessChecker hasAccessToItem:blockedReason:error:]";
    v16 = 2080;
    v17 = "FCBlockedExplicitContentAccessChecker.m";
    v18 = 1024;
    v19 = 29;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = objc_msgSend(v6, "isBlockedExplicitContent");
  v8 = v7;
  if (a4)
  {
    if (v7)
    {
      *a4 = 3;
      v9 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v6, "identifier");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it contains explicit content", buf, 0xCu);

      }
    }
  }

  return v8 ^ 1;
}

@end
