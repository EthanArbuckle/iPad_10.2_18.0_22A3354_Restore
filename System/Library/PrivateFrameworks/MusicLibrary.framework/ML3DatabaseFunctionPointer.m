@implementation ML3DatabaseFunctionPointer

- (void)setFunctionPointer:(void *)a3
{
  self->_functionPointer = a3;
}

- (BOOL)registerWithConnection:(id)a3
{
  id v4;
  void *v5;
  sqlite3 *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_functionPointer)
  {
    v6 = (sqlite3 *)objc_msgSend(v4, "_sqliteHandle");
    -[ML3DatabaseFunction name](self, "name");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v6) = sqlite3_create_function_v2(v6, (const char *)objc_msgSend(v7, "UTF8String"), -[ML3DatabaseFunction argumentCount](self, "argumentCount"), 2049, -[ML3DatabaseFunctionPointer userData](self, "userData"), (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))self->_functionPointer, 0, 0, 0);

    if (!(_DWORD)v6)
    {
      v12 = 1;
      goto LABEL_8;
    }
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend(v5, "sqliteError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error registering function: %{public}@", buf, 0x16u);

    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)userData
{
  return self->_userData;
}

- (void)functionPointer
{
  return self->_functionPointer;
}

- (void)setUserData:(void *)a3
{
  self->_userData = a3;
}

@end
