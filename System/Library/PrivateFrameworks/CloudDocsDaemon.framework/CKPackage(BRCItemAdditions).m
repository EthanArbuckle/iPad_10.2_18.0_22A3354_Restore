@implementation CKPackage(BRCItemAdditions)

+ (void)destroyAnchorAndPackageAnchoredAtURL:()BRCItemAdditions
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[CKPackage(BRCItemAdditions) destroyAnchorAndPackageAnchoredAtURL:].cold.1();

  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("databaseBasePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138413058;
      v13 = v3;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Destroying anchor %@, databaseBasePath: %@, UUID: %@%@", (uint8_t *)&v12, 0x2Au);
    }

    if (v7)
      objc_msgSend(MEMORY[0x1E0C94FC8], "destroyClientPackageWithDatabaseBasePath:UUID:", v7, v8);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtURL:error:", v3, 0);

  }
}

+ (uint64_t)anchorExistsForArchiverInfo:()BRCItemAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0);

  return v7;
}

- (uint64_t)anchorAtURL:()BRCItemAdditions error:
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rootDatabasePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v19;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Anchoring %@ at %@ (db at %@)%@", buf, 0x2Au);

  }
  objc_msgSend((id)objc_opt_class(), "destroyAnchorAndPackageAnchoredAtURL:", v6);
  objc_msgSend(a1, "UUID", CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("databaseBasePath");
  v22[0] = v9;
  objc_msgSend(a1, "rootDatabasePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (!objc_msgSend(v12, "writeToURL:options:error:", v6, 1, a4))
    {
      v16 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(a1, "setArchiverInfo:error:", v15, a4);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      -[CKPackage(BRCItemAdditions) anchorAtURL:error:].cold.1();

    v16 = 0;
  }

LABEL_11:
  return v16;
}

+ (void)destroyAnchorAndPackageAnchoredAtURL:()BRCItemAdditions .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Destroying anchor %@%@", v1, 0x16u);
}

- (void)anchorAtURL:()BRCItemAdditions error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Unable to serialize property list - %@%@", v1, 0x16u);
}

@end
