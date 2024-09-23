@implementation PQLConnection(BRCAdditions)

- (uint64_t)numberWithSQL:()BRCAdditions
{
  id v10;
  uint64_t v11;

  v10 = a3;
  v11 = objc_msgSend(a1, "fetchObjectOfClass:sql:args:", objc_opt_class(), v10, &a9);

  return v11;
}

- (uint64_t)stringWithSQL:()BRCAdditions
{
  id v10;
  uint64_t v11;

  v10 = a3;
  v11 = objc_msgSend(a1, "fetchObjectOfClass:sql:args:", objc_opt_class(), v10, &a9);

  return v11;
}

- (uint64_t)dataWithSQL:()BRCAdditions
{
  id v10;
  uint64_t v11;

  v10 = a3;
  v11 = objc_msgSend(a1, "fetchObjectOfClass:sql:args:", objc_opt_class(), v10, &a9);

  return v11;
}

- (uint64_t)itemIDWithSQL:()BRCAdditions
{
  id v10;
  uint64_t v11;

  v10 = a3;
  v11 = objc_msgSend(a1, "fetchObjectOfClass:sql:args:", objc_opt_class(), v10, &a9);

  return v11;
}

- (uint64_t)registerFunction:()BRCAdditions nArgs:handler:error:
{
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a1, "registerFunction:nArgs:handler:");
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "lastError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[PQLConnection(BRCAdditions) registerFunction:nArgs:handler:error:]";
        v16 = 2080;
        if (!a6)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v9);

  }
  return v8;
}

- (uint64_t)br_isTableExists:()BRCAdditions
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(a1, "numberWithSQL:", CFSTR("SELECT 1 FROM sqlite_master where type = 'table' AND name = %@"), a3);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
