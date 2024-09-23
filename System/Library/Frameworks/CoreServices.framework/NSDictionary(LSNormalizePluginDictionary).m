@implementation NSDictionary(LSNormalizePluginDictionary)

- (id)ls_fixupExtensionPointIdentifierKey
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_opt_class();
  objc_msgSend(v1, "objectForKey:", CFSTR("EXAppExtensionAttributes"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  v6 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("EXExtensionPointIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;

    v8 = 0;
  }
  if (v4 && !v8)
  {
    _LSRegistrationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412546;
      v23 = CFSTR("EXExtensionPointIdentifier");
      v24 = 2112;
      v25 = CFSTR("EXAppExtensionAttributes");
    }
LABEL_32:

    goto LABEL_33;
  }
  if (v8)
  {
LABEL_16:
    v9 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v9, "objectForKey:", CFSTR("NSExtension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v11)
    {
      _LSRegistrationLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AE78]);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (__CFString *)v14;
        if (v13 && v14 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v15 = 0;
        }
        v22 = 138412546;
        v23 = (const __CFString *)v8;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_INFO, "Overriding NSExtension->NSExtensionPointIdentifier to %@ for bundleID %@", (uint8_t *)&v22, 0x16u);

      }
    }
    else
    {
      _LSRegistrationLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_opt_class();
        objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AE78]);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (__CFString *)v18;
        if (v17 && v18 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v19 = 0;
        }
        v22 = 138412546;
        v23 = (const __CFString *)v8;
        v24 = 2112;
        v25 = v19;
        _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_INFO, "Synthesizing NSExtension->NSExtensionPointIdentifier to %@ for bundleID %@", (uint8_t *)&v22, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("NSExtensionPointIdentifier"));
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("NSExtension"));
    v20 = objc_msgSend(v9, "copy");

    v1 = (id)v20;
    goto LABEL_32;
  }
LABEL_33:

  return v1;
}

- (id)ls_insertExtensionPointVersion:()LSNormalizePluginDictionary
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(a1, "objectForKey:", CFSTR("NSExtension"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  v9 = objc_opt_class();
  objc_msgSend(v7, "objectForKey:", CFSTR("NSExtensionAttributes"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  v12 = objc_opt_class();
  objc_msgSend(v11, "objectForKey:", CFSTR("NSExtensionVersion"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v12 || !v13)
  {
    if (!v13)
      goto LABEL_17;
LABEL_16:
    v15 = a1;
    goto LABEL_22;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;

LABEL_17:
  v15 = (id)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v15, "objectForKey:", CFSTR("NSExtension"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v16, "mutableCopy");

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("NSExtensionAttributes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "setObject:forKey:", v4, CFSTR("NSExtensionVersion"));
  objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("NSExtensionAttributes"));
  objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("NSExtension"));

LABEL_22:
  return v15;
}

- (id)_ls_normalizedPluginPlist
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "objectForKey:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_opt_class();
    objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AAF0]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)v4;
    if (v3 && v4 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }
    if (v5)
      v6 = v5;
    else
      v6 = CFSTR("1");
    objc_msgSend(v1, "ls_insertExtensionPointVersion:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v7;
  }
  objc_msgSend(v1, "objectForKey:", CFSTR("EXAppExtensionAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v1, "ls_fixupExtensionPointIdentifierKey");
    v9 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v9;
  }
  return v1;
}

@end
