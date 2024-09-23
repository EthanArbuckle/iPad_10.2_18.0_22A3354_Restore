@implementation FCCKDatabaseUserAuthenticationMiddleware

- (_BYTE)initWithPrivateDataSyncingEnabled:(_BYTE *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)FCCKDatabaseUserAuthenticationMiddleware;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[8] = a2;
  }
  return result;
}

- (FCCKDatabaseUserAuthenticationMiddleware)init
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
    v8 = "-[FCCKDatabaseUserAuthenticationMiddleware init]";
    v9 = 2080;
    v10 = "FCCKDatabaseUserAuthenticationMiddleware.m";
    v11 = 1024;
    v12 = 21;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKDatabaseUserAuthenticationMiddleware init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  if (NSClassFromString(CFSTR("XCTest")))
    return 0;
  if (self)
    return !self->_privateDataSyncingEnabled;
  return 1;
}

@end
