@implementation FCNewsVersionAccessChecker

- (FCNewsVersionAccessChecker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCNewsVersionAccessChecker;
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
    v7 = "-[FCNewsVersionAccessChecker canSynchronouslyCheckAccessToItem:]";
    v8 = 2080;
    v9 = "FCNewsVersionAccessChecker.m";
    v10 = 1024;
    v11 = 23;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
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
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCNewsVersionAccessChecker hasAccessToItem:blockedReason:error:]";
    v17 = 2080;
    v18 = "FCNewsVersionAccessChecker.m";
    v19 = 1024;
    v20 = 31;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNewsVersionAllowed:", objc_msgSend(v6, "minimumNewsVersion"));

  if (a4)
  {
    if ((v8 & 1) == 0)
    {
      *a4 = 1;
      v9 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v6, "identifier");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "minimumNewsVersion");
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        v17 = 2048;
        v18 = (char *)v12;
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it requires minimum News version %llu", buf, 0x16u);

      }
    }
  }

  return v8;
}

@end
