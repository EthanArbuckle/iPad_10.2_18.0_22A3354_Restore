@implementation SOKerberosFileManager

+ (BOOL)archiveDictionary:(id)a3 toFile:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  char v19;
  id v20;
  id v22;
  id v23;

  v6 = a3;
  objc_msgSend(a1, "documentsDirectoryURLForFileName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOKerberosFileManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[SOKerberosFileManager archiveDictionary:toFile:].cold.3((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v23;
  if (v16)
  {
    v17 = v16;
    SO_LOG_SOKerberosFileManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[SOKerberosFileManager archiveDictionary:toFile:].cold.2();
    v19 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v22 = 0;
  v19 = objc_msgSend(v15, "writeToURL:options:error:", v7, 1073741825, &v22);
  v20 = v22;
  if (v20)
  {
    v17 = v20;
    SO_LOG_SOKerberosFileManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[SOKerberosFileManager archiveDictionary:toFile:].cold.1();
    goto LABEL_10;
  }
LABEL_11:

  return v19;
}

+ (id)loadDictionaryFromFile:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "documentsDirectoryURLForFileName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOKerberosFileManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SOKerberosFileManager loadDictionaryFromFile:].cold.3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v22 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 0, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  if (v12)
  {
    v13 = v12;
    SO_LOG_SOKerberosFileManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SOKerberosFileManager loadDictionaryFromFile:].cold.2();
    v15 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x24BDD1620];
  v17 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", v19, v11, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  if (v13)
  {
    SO_LOG_SOKerberosFileManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SOKerberosFileManager loadDictionaryFromFile:].cold.1((uint64_t)v13, v14);
    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

+ (id)documentsDirectoryURLForFileName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLsForDirectory:inDomains:", 9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)archiveDictionary:toFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_215A1B000, v0, v1, "Error writing file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)archiveDictionary:toFile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_215A1B000, v0, v1, "Error archiving file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)archiveDictionary:(uint64_t)a3 toFile:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, a2, a3, "archiving to file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)loadDictionaryFromFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215A1B000, a2, OS_LOG_TYPE_ERROR, "Error deserializing plist: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)loadDictionaryFromFile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_215A1B000, v0, v1, "Error reading plist file: %{public}@, message: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)loadDictionaryFromFile:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, a2, a3, "loading from file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
