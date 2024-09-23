@implementation NSError(sqlite3)

+ (uint64_t)hmbErrorWithSQLContext:()sqlite3
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:", objc_msgSend(a3, "context"));
}

+ (uint64_t)hmbErrorWithSQLContext:()sqlite3 statement:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hmbErrorWithSQLite3Context:statement:", objc_msgSend(a3, "context"), a4);
}

+ (id)hmbErrorWithSQLite3Context:()sqlite3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D27FC8];
  v14[0] = CFSTR("extcode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_errcode(db));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("text");
  v15[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = sqlite3_errmsg(db);
  if (v8)
    v9 = v8;
  else
    v9 = "NULL SQLite3 error for context";
  objc_msgSend(v7, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)hmbErrorWithSQLite3Context:()sqlite3 statement:
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0D27FC8];
  v16[0] = CFSTR("extcode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_errcode(db));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = CFSTR("text");
  objc_msgSend(a1, "errorMessageForSQLite3Context:", db);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = CFSTR("statement");
  if (a4)
    v11 = a4;
  else
    v11 = "NULL statement";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)hmbErrorWithSQLite3Statement:()sqlite3
{
  void *v5;
  uint64_t v6;
  void *v7;
  sqlite3 *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D27FC8];
  v18[0] = CFSTR("extcode");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = sqlite3_db_handle(a3);
  objc_msgSend(v7, "numberWithInt:", sqlite3_errcode(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v18[1] = CFSTR("text");
  objc_msgSend(a1, "errorMessageForSQLite3Context:", sqlite3_db_handle(a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  v18[2] = CFSTR("statement");
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = sqlite3_sql(a3);
  if (v12)
    v13 = v12;
  else
    v13 = "NULL SQLite3 statement";
  objc_msgSend(v11, "stringWithUTF8String:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)hmbErrorWithSQLite3Status:()sqlite3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D27FC8];
  v14[0] = CFSTR("extcode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("text");
  v15[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = sqlite3_errstr(a3);
  if (v8)
    v9 = v8;
  else
    v9 = "NULL SQLite3 error for status";
  objc_msgSend(v7, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (__CFString)errorMessageForSQLite3Context:()sqlite3
{
  const char *v4;
  const char *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_errmsg(a3);
  if (!v4)
    return CFSTR("<NULL SQLite3 error>");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v8 = v10;
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17B6230]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2080;
        v19 = v5;
        _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not convert SQLite error into NSString: %s", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v8 = CFSTR("<Unknown SQLite3 error>");
    }

  }
  return v8;
}

@end
