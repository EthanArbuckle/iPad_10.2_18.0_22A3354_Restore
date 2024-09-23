@implementation DELoggingPreferences

+ (void)installLoggingProfile:(id)a3 sessionIdentifier:(id)a4 extensionIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "managedLoggingProfilesDirectoryForSessionIdentifier:createIfNeeded:error:", a4, 1, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("plist"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "writeToURL:error:", v14, a6);
  if (!*a6)
  {
    OSLogInstallProfilePayload();
    if (*a6)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1A4EEE000, v15, OS_LOG_TYPE_INFO, "Failed to install logging preference payload. Deleting [%{public}@]", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtURL:error:", v14, 0);

    }
  }

}

+ (id)removeLoggingProfileForSessionIdentifier:(id)a3 extensionIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a1, "managedLoggingProfilesDirectoryForSessionIdentifier:createIfNeeded:error:", a3, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  v15 = 0;
  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v11);
    if (v15)
    {
      OSLogRemoveProfilePayload();
      if (!*a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeItemAtURL:error:", v11, a5);

        +[DEUtils lsDir:](DEUtils, "lsDir:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
        {
          +[DELogging fwHandle](DELogging, "fwHandle");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v25 = 138543362;
            v26 = v9;
            _os_log_impl(&dword_1A4EEE000, v19, OS_LOG_TYPE_INFO, "Deleting [%{public}@]", (uint8_t *)&v25, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeItemAtURL:error:", v9, a5);

        }
      }
      v21 = v15;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("url");
      v28[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 3, v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v15;
}

+ (id)loggingPayloadForURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_subsystemPayloadForURL:error:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8 = CFSTR("Subsystems");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)combinedLoggingPayloadForURLs:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v25;
  void *v26;
  id obj;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v25 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30 = 0;
        objc_msgSend(a1, "_subsystemPayloadForURL:error:", v9, &v30, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v30;
        if (v10)
        {
          objc_msgSend(v10, "allKeys");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, v16);

        }
        else
        {
          objc_msgSend(v26, "addObject:", v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v6);
  }

  if (v25 && objc_msgSend(v26, "count"))
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v37 = CFSTR("errors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 1, v19);
    *v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v28, "allKeys", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v35 = CFSTR("Subsystems");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_subsystemPayloadForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v5);
  if (v6)
  {
    objc_msgSend(v5, "URLByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v14 = v8;
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v16 = CFSTR("url");
        v17 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 4, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v9 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("url");
    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 2, v8);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v9;
}

+ (unint64_t)numberOfManagedLoggingPreferences
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1A85AB568](a1, a2);
  objc_msgSend(a1, "managedLoggingProfilesDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEUtils findAllItems:includeDirs:](DEUtils, "findAllItems:includeDirs:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_autoreleasePoolPop(v3);
  return v6;
}

+ (id)managedLoggingProfilesDirectory
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  +[DEUtils applicationSupportDirectoryForApp:](DEUtils, "applicationSupportDirectoryForApp:", CFSTR("com.apple.diagnosticextensions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("LoggingProfiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[DELoggingPreferences managedLoggingProfilesDirectory].cold.1(v5);

    v6 = (void *)MEMORY[0x1E0C99E98];
    NSHomeDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)managedLoggingProfilesDirectoryForSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "managedLoggingProfilesDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a5);

    }
  }
  return v10;
}

+ (void)managedLoggingProfilesDirectory
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_FAULT, "could not build Application Support directory url", v1, 2u);
}

@end
