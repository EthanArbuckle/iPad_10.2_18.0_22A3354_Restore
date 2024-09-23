@implementation FCCommand

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCCommand executeWithContext:delegate:qualityOfService:]";
    v15 = 2080;
    v16 = "FCCommand.m";
    v17 = 1024;
    v18 = 46;
    v19 = 2114;
    v20 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCCommand executeWithContext:delegate:qualityOfService:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  return 0;
}

- (void)coalesceWithCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCommand coalesceWithCommand:]";
    v11 = 2080;
    v12 = "FCCommand.m";
    v13 = 1024;
    v14 = 56;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCommand coalesceWithCommand:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (unint64_t)statusForCloudKitError:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  unint64_t v8;
  NSObject *v10;
  id v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_13;
  v4 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v10 = v4;
    *(_DWORD *)v12 = 138543618;
    *(_QWORD *)&v12[4] = objc_opt_class();
    *(_WORD *)&v12[12] = 2114;
    *(_QWORD *)&v12[14] = v3;
    v11 = *(id *)&v12[4];
    _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "command type: %{public}@ encountered error: %{public}@", v12, 0x16u);

  }
  if ((objc_msgSend(v3, "fc_hasIdentityStillSyncingError", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13) & 1) != 0)
    goto LABEL_5;
  if ((objc_msgSend(v3, "fc_hasErrorCode:", 40) & 1) != 0)
  {
LABEL_7:
    v5 = 3;
    goto LABEL_14;
  }
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v7)
  {
    v8 = objc_msgSend(v3, "code");
    if (v8 <= 0x1B)
    {
      if (((1 << v8) & 0xA009002) != 0)
        goto LABEL_7;
      if (((1 << v8) & 0x18) != 0)
      {
        v5 = 1;
        goto LABEL_14;
      }
      if (((1 << v8) & 0x40004) == 0)
        goto LABEL_5;
LABEL_13:
      v5 = 0;
      goto LABEL_14;
    }
  }
LABEL_5:
  v5 = 2;
LABEL_14:

  return v5;
}

- (FCCommand)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCommand initWithCoder:]";
    v11 = 2080;
    v12 = "FCCommand.m";
    v13 = 1024;
    v14 = 119;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCCommand initWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCCommand encodeWithCoder:]";
    v11 = 2080;
    v12 = "FCCommand.m";
    v13 = 1024;
    v14 = 124;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCCommand encodeWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
