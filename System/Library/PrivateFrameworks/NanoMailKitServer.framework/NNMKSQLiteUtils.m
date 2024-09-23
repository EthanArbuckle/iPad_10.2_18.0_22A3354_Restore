@implementation NNMKSQLiteUtils

+ (void)closeExecutedPreparedStatement:(sqlite3_stmt *)a3
{
  sqlite3_clear_bindings(a3);
  sqlite3_reset(a3);
}

+ (BOOL)isResponseOkFromPreparedStatementExecution:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 100;
}

+ (void)bindString:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  if (a3)
    sqlite3_bind_text(a4, a5, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, 0);
  else
    sqlite3_bind_null(a4, a5);
}

+ (void)bindDate:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  double v7;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSince1970");
    sqlite3_bind_double(a4, a5, v7);
  }
  else
  {
    sqlite3_bind_null(a4, a5);
  }
}

+ (void)bindData:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  id v7;
  id v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v7 = a3;
  v11 = v7;
  if (v7)
  {
    v8 = objc_retainAutorelease(v7);
    v9 = objc_msgSend(v8, "bytes");
    if (v9)
      v10 = (const char *)v9;
    else
      v10 = "";
    sqlite3_bind_blob(a4, a5, v10, objc_msgSend(v8, "length"), 0);
  }
  else
  {
    sqlite3_bind_null(a4, a5);
  }

}

+ (void)bindInteger:(int64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  sqlite3_bind_int(a4, a5, a3);
}

+ (void)bindUnsignedInteger:(unint64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  sqlite3_bind_int(a4, a5, a3);
}

+ (void)bindDouble:(double)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  sqlite3_bind_double(a4, a5, a3);
}

+ (void)bindBool:(BOOL)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  sqlite3_bind_int(a4, a5, a3);
}

+ (id)stringFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  void *v6;

  if (sqlite3_column_type(a3, a4) == 5)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sqlite3_column_text(a3, a4);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

+ (id)dateFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  void *v6;

  if (sqlite3_column_type(a3, a4) == 5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)dataFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  id v6;
  size_t v7;
  void *v8;
  const void *v9;

  if (sqlite3_column_type(a3, a4) == 5)
  {
    v6 = 0;
  }
  else
  {
    v7 = sqlite3_column_bytes(a3, a4);
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v7);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (void *)objc_msgSend(v6, "mutableBytes");
    v9 = sqlite3_column_blob(a3, a4);
    memcpy(v8, v9, v7);
  }
  return v6;
}

+ (unint64_t)integerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4);
}

+ (unint64_t)unsignedIntegerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4);
}

+ (double)doubleFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_double(a3, a4);
}

+ (BOOL)BOOLFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4) != 0;
}

@end
