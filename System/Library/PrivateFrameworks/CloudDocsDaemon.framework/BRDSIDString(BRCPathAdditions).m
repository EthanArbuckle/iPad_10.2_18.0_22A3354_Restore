@implementation BRDSIDString(BRCPathAdditions)

+ (id)brc_dbAccountDSIDForPath:()BRCPathAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "brc_accountIDPathForAccountPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "stringWithContentsOfFile:encoding:error:", v6, 4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] Got error reading the account DSID from '%@': %@%@", buf, 0x20u);
    }

    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

@end
