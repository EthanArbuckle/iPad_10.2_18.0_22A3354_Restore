@implementation NPSPrefPlistSizeUtil

+ (unint64_t)sizeForPlistAtPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "fileExistsAtPath:", v3),
        v4,
        !v5))
  {
    v11 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1B5280000, v11, OS_LOG_TYPE_DEFAULT, "Unable to locate prefs for domain %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "attributesOfItemAtPath:error:", v3, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (!v7 || v8)
  {
    v12 = (void *)nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v8, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1B5280000, v13, OS_LOG_TYPE_DEFAULT, "Unable to extract attributes for %@ : %@", buf, 0x16u);

    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

LABEL_12:
  return v10;
}

+ (unint64_t)prefSizeFor:(id)a3 inContainer:(id)a4
{
  void *v5;
  unint64_t v6;

  objc_msgSend(a1, "_domainPlistPathFor:inContainer:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "sizeForPlistAtPath:", v5);

  return v6;
}

+ (id)_domainPlistPathFor:(id)a3 inContainer:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id)objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("var/mobile"));
  if (v6)
  {
    v8 = objc_msgSend(v6, "copy");

    v7 = (id)v8;
  }
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Library/Preferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".plist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B5280000, v12, OS_LOG_TYPE_DEFAULT, "Domain: %@ Container: %@ Path: %@", (uint8_t *)&v14, 0x20u);
  }

  return v11;
}

@end
