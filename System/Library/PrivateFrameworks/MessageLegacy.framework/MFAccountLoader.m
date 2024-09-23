@implementation MFAccountLoader

+ (Class)accountClassForPersistentAccount:(id)a3 error:(id *)a4
{
  uint64_t v6;

  if (a3 && (v6 = objc_msgSend(a1, "_accountClassStringWithPersistentAccount:error:")) != 0)
    return (Class)objc_msgSend(a1, "_accountClassForString:error:", v6, a4);
  else
    return 0;
}

+ (id)_accountClassStringWithPersistentAccount:(id)a3 error:(id *)a4
{
  id result;
  void *v6;

  if (!a3)
    return 0;
  result = (id)objc_msgSend(a3, "accountPropertyForKey:", CFSTR("Class"));
  if (a4)
  {
    if (!result)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 1, 0);
      result = 0;
      *a4 = v6;
    }
  }
  return result;
}

+ (Class)_accountClassForString:(id)a3 error:(id *)a4
{
  Class result;
  void *v8;

  if (!a3)
    goto LABEL_6;
  result = NSClassFromString((NSString *)a3);
  if (result)
    return result;
  if (objc_msgSend(a1, "loadBundleForAccountClassString:error:", a3, a4))
  {
    result = NSClassFromString((NSString *)a3);
    if (!a4)
      return result;
  }
  else
  {
LABEL_6:
    result = 0;
    if (!a4)
      return result;
  }
  if (!result)
  {
    if (*a4)
    {
      return 0;
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 2, 0);
      result = 0;
      *a4 = v8;
    }
  }
  return result;
}

+ (id)accountWithPersistentAccount:(id)a3 error:(id *)a4
{
  id result;

  result = +[MFAccountLoader accountClassForPersistentAccount:error:](MFAccountLoader, "accountClassForPersistentAccount:error:", a3, a4);
  if (result)
    return (id)objc_msgSend(objc_alloc((Class)result), "initWithPersistentAccount:", a3);
  return result;
}

+ (BOOL)loadBundleForAccountClassString:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v6 = objc_msgSend(a1, "_bundlePathForAccountClassString:");
  if (!v6)
  {
    if (a4)
    {
      v8 = 0;
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 3, 0);
      return v8;
    }
    return 0;
  }
  v7 = v6;
  objc_sync_enter(a1);
  if ((objc_msgSend(0, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
    if (v9 && objc_msgSend(v9, "loadAndReturnError:", a4))
    {
      objc_msgSend(0, "addObject:", v7);
      v10 = MFLogGeneral();
      v8 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "Loaded bundle at %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      v8 = 0;
    }
  }
  objc_sync_exit(a1);
  return v8;
}

+ (id)_bundlePathForAccountClassString:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke;
  block[3] = &unk_1E81C9B98;
  block[4] = a1;
  if (_bundlePathForAccountClassString__onceToken == -1)
  {
    if (a3)
      return (id)objc_msgSend((id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap, "objectForKey:", a3);
  }
  else
  {
    dispatch_once(&_bundlePathForAccountClassString__onceToken, block);
    if (a3)
      return (id)objc_msgSend((id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap, "objectForKey:", a3);
  }
  return 0;
}

uint64_t __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  id obj;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32)), "bundlePath"), "stringByAppendingPathComponent:", CFSTR("MailServices"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", v19, 0);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  v20 = result;
  if (result)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v6 = (void *)objc_msgSend(v19, "stringByAppendingPathComponent:", v5);
        v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Info.plist")));
        if (v7)
        {
          v8 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
          if (v8)
          {
            v9 = (void *)v8;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("InstantiableMailAccountClasses"));
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              v24 = 0u;
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v22;
                do
                {
                  for (i = 0; i != v12; ++i)
                  {
                    if (*(_QWORD *)v22 != v13)
                      objc_enumerationMutation(v10);
                    v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
                    if (objc_msgSend(v2, "objectForKey:", v15))
                    {
                      v16 = MFLogGeneral();
                      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v30 = v5;
                        v31 = 2112;
                        v32 = v15;
                        _os_log_error_impl(&dword_1C8839000, v16, OS_LOG_TYPE_ERROR, "Ignoring MailServices bundle %@ for %@", buf, 0x16u);
                      }
                    }
                    else
                    {
                      objc_msgSend(v2, "setObject:forKey:", v6, v15);
                    }
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
                }
                while (v12);
              }
            }
          }
        }
        ++v4;
      }
      while (v4 != v20);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      v20 = result;
    }
    while (result);
  }
  _bundlePathForAccountClassString__sAccountClassToBundlePathMap = (uint64_t)v2;
  return result;
}

+ (id)accountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0C8F0A8];
  v11[0] = *MEMORY[0x1E0C8F028];
  v11[1] = v6;
  v12[0] = CFSTR("AOLAccount");
  v12[1] = CFSTR("GmailAccount");
  v7 = *MEMORY[0x1E0C8F0D0];
  v11[2] = *MEMORY[0x1E0C8F160];
  v11[3] = v7;
  v12[2] = CFSTR("YahooAccount");
  v12[3] = CFSTR("IMAPAccount");
  v8 = *MEMORY[0x1E0C8F138];
  v11[4] = *MEMORY[0x1E0C8F118];
  v11[5] = v8;
  v12[4] = CFSTR("POPAccount");
  v12[5] = CFSTR("SMTPAccount");
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6), "objectForKeyedSubscript:", a3);
  if (v9)
  {
    v9 = (objc_class *)objc_msgSend(a1, "_accountClassForString:error:", v9, a4);
    if (v9)
      v9 = (objc_class *)objc_alloc_init(v9);
  }
  return v9;
}

@end
