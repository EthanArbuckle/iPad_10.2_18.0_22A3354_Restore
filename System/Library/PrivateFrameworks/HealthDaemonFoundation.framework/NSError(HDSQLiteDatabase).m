@implementation NSError(HDSQLiteDatabase)

- (uint64_t)hd_sqliteExtendedErrorCode
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  if (objc_msgSend(v1, "hk_isErrorInDomain:code:", CFSTR("com.apple.healthd.SQLite"), 2))
  {
    objc_msgSend(v1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  objc_msgSend(v1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SQLite"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extended_error_code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = objc_msgSend(v7, "intValue");
    else
      v8 = objc_msgSend(v1, "code");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hd_isDatabaseCorruptionError
{
  return objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 11;
}

- (BOOL)hd_isNotADatabaseError
{
  return objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 26;
}

- (uint64_t)hd_isConstraintViolation
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "hk_isHealthKitError") && objc_msgSend(a1, "code") == 400
    || objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 19)
  {
    return 1;
  }
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = objc_msgSend(v4, "hd_isConstraintViolation");
  else
    v2 = 0;

  return v2;
}

- (id)hd_failingSQLStatement
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "hk_isErrorInDomain:code:", CFSTR("com.apple.healthd.SQLite"), 2))
  {
    objc_msgSend(v1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  objc_msgSend(v1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SQLite"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sql_statement"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
