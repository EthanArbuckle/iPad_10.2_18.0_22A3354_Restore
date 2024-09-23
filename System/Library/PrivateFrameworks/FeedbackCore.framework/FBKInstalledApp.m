@implementation FBKInstalledApp

+ (id)appWithAppProxy:(id)a3
{
  id v3;
  FBKInstalledApp *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  v4 = objc_alloc_init(FBKInstalledApp);
  -[FBKInstalledApp setApplicationProxy:](v4, "setApplicationProxy:", v3);
  objc_msgSend(v3, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInstalledApp setIdentifier:](v4, "setIdentifier:", v5);

  objc_msgSend(v3, "localizedNameForContext:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInstalledApp setName:](v4, "setName:", v6);

  objc_msgSend(v3, "shortVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKInstalledApp setVersion:](v4, "setVersion:", v7);
  Log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[FBKInstalledApp appWithAppProxy:].cold.1(v4, v8);

  return v4;
}

- (NSNumber)adamID
{
  void *v2;
  void *v3;

  -[FBKInstalledApp applicationProxy](self, "applicationProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)isAppleApp
{
  void *v3;
  void *v4;
  char v5;

  -[FBKInstalledApp identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FBKInstalledApp identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple."));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isIWorkApp
{
  void *v3;
  void *v4;
  char v5;

  -[FBKInstalledApp identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FBKInstalledApp identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.iWork"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKInstalledApp identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKInstalledApp version](self, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        objc_msgSend(v5, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKInstalledApp name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_searchVersionInAppURL:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1E0]);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    Log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
        +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.6();
LABEL_34:

      goto LABEL_35;
    }
    if (v11)
      +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.5();
  }
  else
  {
    Log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.4();
  }

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject shortVersionString](v10, "shortVersionString");
  v12 = objc_claimAutoreleasedReturnValue();
  v9 = (__CFString *)v12;
  if (v10 && v12)
  {
    Log_0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "found version using app proxy for URL [%@]", buf, 0xCu);
    }

    goto LABEL_34;
  }

  if (!v9)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Contents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("version.plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "fileExistsAtPath:", v16);

    if (!(_DWORD)v15)
    {
      Log_0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.3();

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentsAtPath:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v19, 0, 0, &v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v26;
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E0]);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      Log_0();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v20;
        v29 = 2112;
        v30 = v21;
        v31 = 2112;
        v32 = v9;
        _os_log_debug_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_DEBUG, "plist %@ error %@ version %@", buf, 0x20u);
      }

      Log_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.2();

    }
    else
    {
      Log_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.1((uint64_t)v5, v21);
      v9 = 0;
    }

    if (!v9)
    {
LABEL_31:
      Log_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v5;
        _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Could not find version for app URL %@", buf, 0xCu);
      }
      v9 = CFSTR("0");
      goto LABEL_34;
    }
  }
LABEL_35:

  return v9;
}

+ (id)_searchIdentifierInAppURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    Log_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[FBKInstalledApp _searchIdentifierInAppURL:].cold.4();

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD288]);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    Log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13)
        +[FBKInstalledApp _searchIdentifierInAppURL:].cold.3();
LABEL_22:

      v6 = (void *)v11;
      goto LABEL_23;
    }
    if (v13)
      +[FBKInstalledApp _searchIdentifierInAppURL:].cold.2();

LABEL_19:
    Log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "could not find identifier for app URL %@", (uint8_t *)&v16, 0xCu);
    }
    v11 = &stru_24E15EAF8;
    goto LABEL_22;
  }
  Log_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.4();

  if (!v6)
    goto LABEL_19;
LABEL_23:

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInstalledApp identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInstalledApp version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKInstalledApp name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: identifier [%@], version [%@], name [%@]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)appWithAppProxy:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "created: %@", v4, 0xCu);

}

+ (void)_searchVersionInAppURL:(uint64_t)a1 identifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "no version file for App URL %@ error: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchVersionInAppURL:identifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "found version using version.plist for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchVersionInAppURL:identifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "no data in version file for App URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchVersionInAppURL:identifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Could get bundle from URL [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchVersionInAppURL:identifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Could not find version from bundle in URL [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchVersionInAppURL:identifier:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_21D9A9000, v0, v1, "found version using bundle for URL [%@] version [%@]");
  OUTLINED_FUNCTION_7();
}

+ (void)_searchIdentifierInAppURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Could not find identifier from bundle in URL [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)_searchIdentifierInAppURL:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_21D9A9000, v0, v1, "found identifier using bundle for URL [%@] version [%@]");
  OUTLINED_FUNCTION_7();
}

+ (void)_searchIdentifierInAppURL:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_21D9A9000, v0, v1, "found identifier using app proxy for URL [%@] in app [%@]");
  OUTLINED_FUNCTION_7();
}

@end
