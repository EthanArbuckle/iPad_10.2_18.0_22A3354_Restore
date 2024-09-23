@implementation MFAccountLoader

+ (Class)accountClassForPersistentAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "_accountClassStringWithPersistentAccount:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)objc_msgSend(a1, "_accountClassForString:error:", v7, a4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

+ (id)_accountClassStringWithPersistentAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accountPropertyForKey:", CFSTR("Class"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (a4 && !v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 1, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)_accountClassForString:(id)a3 error:(id *)a4
{
  NSString *v6;
  NSString *v7;
  id v8;
  objc_class *v9;

  v6 = (NSString *)a3;
  v7 = v6;
  if (!v6)
  {
LABEL_5:
    if (!a4)
      goto LABEL_12;
    goto LABEL_6;
  }
  v6 = (NSString *)NSClassFromString(v6);
  if (v6)
    goto LABEL_12;
  if (objc_msgSend(a1, "loadBundleForAccountClassString:error:", v7, a4))
  {
    v6 = (NSString *)NSClassFromString(v7);
    goto LABEL_5;
  }
  v6 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_6:
  if (!v6)
  {
    if (*a4)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 2, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      *a4 = v8;
    }
  }
LABEL_12:
  v9 = v6;

  return v9;
}

+ (id)accountWithPersistentAccount:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  void *v7;

  v5 = a3;
  v6 = +[MFAccountLoader accountClassForPersistentAccount:error:](MFAccountLoader, "accountClassForPersistentAccount:error:", v5, a4);
  if (v6)
    v7 = (void *)objc_msgSend([v6 alloc], "initWithPersistentAccount:", v5);
  else
    v7 = 0;

  return v7;
}

+ (BOOL)loadBundleForAccountClassString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "_bundlePathForAccountClassString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = a1;
      objc_sync_enter(v8);
      if ((objc_msgSend(0, "containsObject:", v7) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "loadAndReturnError:", a4))
        {
          objc_msgSend(0, "addObject:", v7);
          MFLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v14 = 138412290;
            v15 = v7;
            _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "Loaded bundle at %@", (uint8_t *)&v14, 0xCu);
          }

          v9 = 1;
        }
        else
        {
          v9 = 0;
        }

      }
      objc_sync_exit(v8);

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAccountLoaderErrorDomain"), 3, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_bundlePathForAccountClassString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundlePathForAccountClassString__onceToken != -1)
  {
    dispatch_once(&_bundlePathForAccountClassString__onceToken, block);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

void __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MailServices"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v28, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v7)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      v29 = v7;
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v28, "stringByAppendingPathComponent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataWithContentsOfFile:", v12);
        v30 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v30;
        if (v30)
        {
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v30, 0, 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("InstantiableMailAccountClasses"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              v16 = v15;
              v25 = v14;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v32;
                do
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v32 != v18)
                      objc_enumerationMutation(v16);
                    v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                    objc_msgSend(v2, "objectForKey:", v20);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21 == 0;

                    if (v22)
                    {
                      objc_msgSend(v2, "setObject:forKey:", v10, v20);
                    }
                    else
                    {
                      MFLogGeneral();
                      v23 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v40 = v9;
                        v41 = 2112;
                        v42 = v20;
                        _os_log_error_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_ERROR, "Ignoring MailServices bundle %@ for %@", buf, 0x16u);
                      }

                    }
                  }
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                }
                while (v17);
              }

              v14 = v25;
            }
          }

          v13 = (void *)v30;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v7);
  }

  v24 = (void *)_bundlePathForAccountClassString__sAccountClassToBundlePathMap;
  _bundlePathForAccountClassString__sAccountClassToBundlePathMap = (uint64_t)v2;

}

+ (id)accountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C8F0A8];
  v15[0] = *MEMORY[0x1E0C8F028];
  v15[1] = v7;
  v16[0] = CFSTR("AOLAccount");
  v16[1] = CFSTR("GmailAccount");
  v8 = *MEMORY[0x1E0C8F0D0];
  v15[2] = *MEMORY[0x1E0C8F160];
  v15[3] = v8;
  v16[2] = CFSTR("YahooAccount");
  v16[3] = CFSTR("IMAPAccount");
  v9 = *MEMORY[0x1E0C8F138];
  v15[4] = *MEMORY[0x1E0C8F118];
  v15[5] = v9;
  v16[4] = CFSTR("POPAccount");
  v16[5] = CFSTR("SMTPAccount");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (v12 = (objc_class *)objc_msgSend(a1, "_accountClassForString:error:", v11, a4)) != 0)
    v13 = objc_alloc_init(v12);
  else
    v13 = 0;

  return v13;
}

@end
