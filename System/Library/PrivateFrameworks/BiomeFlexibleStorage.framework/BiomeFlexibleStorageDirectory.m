@implementation BiomeFlexibleStorageDirectory

+ (id)directoryForPrivateTable
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0D01D10], "biomeDirectoryForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("tables"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__BiomeFlexibleStorageDirectory_directoryForPrivateTable__block_invoke;
  block[3] = &unk_1E6649F80;
  v9 = v3;
  v4 = directoryForPrivateTable_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&directoryForPrivateTable_onceToken, block);
  v6 = (id)directoryForPrivateTable_dir;

  return v6;
}

void __57__BiomeFlexibleStorageDirectory_directoryForPrivateTable__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("privateTable"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)directoryForPrivateTable_dir;
  directoryForPrivateTable_dir = v1;

}

+ (id)privateDBPathWithIdentifier:(id)a3 directory:(id)a4 create:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v19;
  _QWORD v20[3];

  v5 = a5;
  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  v20[0] = v8;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathWithComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
    goto LABEL_7;
  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v19);
  v15 = v19;

  if (v15)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[BiomeFlexibleStorageDirectory privateDBPathWithIdentifier:directory:create:].cold.1(v16);

    v17 = 0;
  }
  else
  {
LABEL_7:
    v17 = v12;
  }

  return v17;
}

+ (void)privateDBPathWithIdentifier:(os_log_t)log directory:create:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B399A000, log, OS_LOG_TYPE_FAULT, "Unable to create table storage directory.", v1, 2u);
}

@end
