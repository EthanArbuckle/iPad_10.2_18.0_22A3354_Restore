@implementation DOCFileRenamingSupport

+ (id)fallbackRename:(id)a3 toProposedName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject **v15;
  NSObject *v16;
  id v17;
  NSObject **v18;
  NSObject *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23 = 0;
  objc_msgSend((id)objc_opt_class(), "_urlForProposedName:originalURL:error:", v8, v7, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v23;
  v11 = v10;
  if (!v9 || v10)
  {
    v18 = (NSObject **)MEMORY[0x24BE2DF90];
    v19 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[DOCFileRenamingSupport fallbackRename:toProposedName:error:].cold.1((uint64_t)v11, v19, v20);
    v17 = 0;
    if (a5 && v11)
    {
      v17 = 0;
      *a5 = objc_retainAutorelease(v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v13 = objc_msgSend(v12, "moveItemAtURL:toURL:error:", v7, v9, &v22);
    v14 = v22;

    v15 = (NSObject **)MEMORY[0x24BE2DF90];
    v16 = *MEMORY[0x24BE2DF90];
    if (v13)
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v7;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_209052000, v16, OS_LOG_TYPE_INFO, "Renamed: %@ to: %@", buf, 0x16u);
      }
      v17 = v9;
    }
    else
    {
      if (!v16)
      {
        DOCInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[DOCFileRenamingSupport fallbackRename:toProposedName:error:].cold.2(v16, v14);
      v17 = 0;
      if (a5 && v14)
      {
        v17 = 0;
        *a5 = objc_retainAutorelease(v14);
      }
    }

  }
  return v17;
}

+ (BOOL)_validateFileName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  BOOL v10;
  __CFString *v11;
  uint64_t v12;

  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR(".")))
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("You can’t use a name that begins with a dot “.”, because these names are reserved for the system. Please choose another name.");
  }
  else if (objc_msgSend(v5, "containsString:", CFSTR(":")))
  {
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("You can’t use a name that contains “:”. Please choose another name.");
  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_11;
    }
    _DocumentManagerBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("You can’t use an empty name. Please choose another name.");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v8, CFSTR("Localizable"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  __50__DOCFileRenamingSupport__validateFileName_error___block_invoke(v12, v11, (void *)*MEMORY[0x24BDD0B88], 258);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v9 == 0;
  if (a4 && v9)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a4 = v9;
  }
LABEL_11:

  return v10;
}

id __50__DOCFileRenamingSupport__validateFileName_error___block_invoke(uint64_t a1, __CFString *a2, void *a3, uint64_t a4)
{
  const __CFString *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
    v6 = a2;
  else
    v6 = CFSTR("UNLOCALIZED");
  v13 = *MEMORY[0x24BDD0FC8];
  v14[0] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v8, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_filteredNameForName:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v5 = a3;
  v13 = 0;
  v6 = objc_msgSend((id)objc_opt_class(), "_validateFileName:error:", v5, &v13);
  v7 = v13;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    if (a4 && v7)
    {
      v11 = 0;
      *a4 = objc_retainAutorelease(v7);
    }
  }

  return v11;
}

+ (id)_urlForProposedName:(id)a3 originalURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject **v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend((id)objc_opt_class(), "_filteredNameForName:error:", v8, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v25;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v12, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    v17 = (NSObject **)MEMORY[0x24BE2DF90];
    if (v16 && v10)
    {
      if ((objc_msgSend(v9, "isEqualToString:", v15) & 1) == 0)
      {
        v18 = *v17;
        if (!*v17)
        {
          DOCInitLogging();
          v18 = *v17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:].cold.3();
      }
    }
    else if (!v16 || v10)
    {
      if (!v16 && v10)
      {
        v21 = *MEMORY[0x24BE2DF90];
        if (!*MEMORY[0x24BE2DF90])
        {
          DOCInitLogging();
          v21 = *v17;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:].cold.1();
      }
    }
    else
    {
      v20 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v20 = *v17;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        +[DOCFileRenamingSupport _urlForProposedName:originalURL:error:].cold.2();
    }
    objc_msgSend(v12, "stringByAppendingPathExtension:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *v17;
    if (!*v17)
    {
      DOCInitLogging();
      v23 = *v17;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v9;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_209052000, v23, OS_LOG_TYPE_INFO, "Prepared new url from: %@ to: %@", buf, 0x16u);
    }

  }
  else
  {
    v19 = 0;
    if (a5 && v13)
    {
      v19 = 0;
      *a5 = objc_retainAutorelease(v13);
    }
  }

  return v19;
}

+ (void)fallbackRename:(uint64_t)a1 toProposedName:(NSObject *)a2 error:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_1(&dword_209052000, a2, a3, "Rename failed validation with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

+ (void)fallbackRename:(void *)a1 toProposedName:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_209052000, v3, v5, "Rename operation failed: %@", (uint8_t *)&v6);

}

+ (void)_urlForProposedName:originalURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_209052000, v0, v1, "Removing file extension from: %@ to: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)_urlForProposedName:originalURL:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_209052000, v0, v1, "Adding file extension from: %@ to: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)_urlForProposedName:originalURL:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_209052000, v0, v1, "Changing file extension from: %@ to: %@");
  OUTLINED_FUNCTION_3();
}

@end
