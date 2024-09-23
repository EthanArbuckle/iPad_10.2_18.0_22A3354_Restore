@implementation CARThemeAssetOverrider

+ (id)overrideAssetNewerThanAssetVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  CARThemeAsset *v17;
  CARThemeAssetVersion *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iOSContentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryContentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_overrideAssetSourceURLForAssetIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_readVersionFromAsset:assetIdentifier:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "iOSContentVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessoryContentVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "_shouldForceUpdateAsset"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "integerValue") + 1);
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
        v14 = objc_claimAutoreleasedReturnValue();

        CarThemeAssetsLogging();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v27 = v13;
          v28 = 2114;
          v29 = v14;
          _os_log_impl(&dword_1A83A2000, v15, OS_LOG_TYPE_DEFAULT, "force updating asset versions to: iOS %{public}@, accessory %{public}@", buf, 0x16u);
        }

      }
      else
      {
        v13 = (uint64_t)v11;
        v14 = (uint64_t)v12;
      }
      v24 = (void *)v14;
      v25 = (void *)v13;
      v18 = -[CARThemeAssetVersion initWithIdentifier:iOSContentVersion:accessoryContentVersion:]([CARThemeAssetVersion alloc], "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v5, v13, v14);
      v19 = objc_msgSend(v4, "compare:", v18);
      CarThemeAssetsLogging();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19 == -1)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138543362;
          v27 = (uint64_t)v18;
          _os_log_impl(&dword_1A83A2000, v20, OS_LOG_TYPE_DEFAULT, "preparing override asset: %{public}@", buf, 0xCu);
        }

        objc_msgSend(a1, "_generatedAssetForSourceAssetURL:version:", v8, v18);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v17 = -[CARThemeAsset initWithBaseURL:version:]([CARThemeAsset alloc], "initWithBaseURL:version:", v20, v18);
          CarThemeAssetsLogging();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = (uint64_t)v17;
            _os_log_impl(&dword_1A83A2000, v22, OS_LOG_TYPE_DEFAULT, "prepared override asset %@", buf, 0xCu);
          }
        }
        else
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to prepare override asset"));
          objc_msgSend(a1, "postAssetErrorNotification:forAsset:", v22, v5);
          v17 = 0;
        }

      }
      else
      {
        if (v21)
        {
          *(_DWORD *)buf = 138543362;
          v27 = (uint64_t)v4;
          _os_log_impl(&dword_1A83A2000, v20, OS_LOG_TYPE_DEFAULT, "asset is already the latest overall version: %{public}@", buf, 0xCu);
        }
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no asset source for %@"), v5);
    objc_msgSend(a1, "postAssetErrorNotification:forAsset:", v16, v5);

    v17 = 0;
  }

  return v17;
}

+ (id)_overrideAssetSourceURLForAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "_carplayLibraryDirectoryForAssetIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("CarPlayAccessory.assets.zip"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("CarPlayAccessory.assets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "path"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, 0),
          v10,
          v9,
          v11))
    {
      CarThemeAssetsLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v7;
        v13 = "using override zipped asset %@";
LABEL_12:
        _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      if (!v8
        || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "path"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v16, 0),
            v16,
            v15,
            !v17))
      {
        CarThemeAssetsLogging();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[CARThemeAssetOverrider _overrideAssetSourceURLForAssetIdentifier:].cold.1();

        v14 = 0;
        goto LABEL_17;
      }
      CarThemeAssetsLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v8;
        v13 = "using override asset folder %@";
        goto LABEL_12;
      }
    }

    v14 = v6;
LABEL_17:

    goto LABEL_18;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

+ (id)_generatedAssetForSourceAssetURL:(id)a3 version:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  CARZipArchiver *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  CARZipArchiver *v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id obj;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  _QWORD v52[4];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  CARZipArchiver *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_assetURLForVersion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v51);
  v12 = v51;

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("CarPlayAccessory.assets.zip"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("CarPlayAccessory.assets.zip"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v13, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      v42 = v13;
      v19 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v13, v14, &v50);
      v20 = (CARZipArchiver *)v50;

      v40 = v14;
      v41 = v12;
      v44 = v7;
      if ((v19 & 1) == 0)
      {
        CarThemeAssetsLogging();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[NSObject path](v42, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v38;
          v56 = 2112;
          v57 = v39;
          v58 = 2112;
          v59 = v20;
          _os_log_error_impl(&dword_1A83A2000, v23, OS_LOG_TYPE_ERROR, "failed to copy %@ to %@: %@", buf, 0x20u);

        }
      }
    }
    else
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("CarPlayAccessory.assets"));
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc_init(CARZipArchiver);
      if (!-[CARZipArchiver archiveDirectory:toLocation:](v20, "archiveDirectory:toLocation:", v21, v14))
      {
        CarThemeAssetsLogging();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          +[CARThemeAssetOverrider _generatedAssetForSourceAssetURL:version:].cold.1(v14, v36);

        v22 = 0;
        goto LABEL_28;
      }
      v40 = v14;
      v41 = v12;
      v44 = v7;
      v42 = v21;
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v52[0] = CFSTR("CarPlayPhone.assets");
    v52[1] = CFSTR("Certificate.chain.pem");
    v52[2] = CFSTR("CarPlayAccessory.assets.sha256");
    v52[3] = CFSTR("AccessoryAdditions");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          v29 = v6;
          objc_msgSend(v6, "URLByAppendingPathComponent:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "URLByAppendingPathComponent:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v33 = objc_msgSend(v32, "copyItemAtURL:toURL:error:", v30, v31, &v45);
          v34 = (CARZipArchiver *)v45;

          if ((v33 & 1) == 0)
          {
            CarThemeAssetsLogging();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v55 = v30;
              v56 = 2112;
              v57 = v31;
              v58 = 2112;
              v59 = v34;
              _os_log_error_impl(&dword_1A83A2000, v35, OS_LOG_TYPE_ERROR, "failed to copy %@ to %@, error: %@", buf, 0x20u);
            }

          }
          v6 = v29;
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v25);
    }

    v7 = v44;
    v22 = v44;
    v12 = v41;
    v21 = v42;
    v14 = v40;
LABEL_28:

    goto LABEL_29;
  }
  CarThemeAssetsLogging();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[CARThemeAssetOverrider _generatedAssetForSourceAssetURL:version:].cold.2(v7, (uint64_t)v12, v21);
  v22 = 0;
LABEL_29:

  return v22;
}

+ (BOOL)_shouldForceUpdateAsset
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("AlwaysUpdateAsset"), CRPreferencesNotMigratedDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

+ (id)_carplayLibraryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlay"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_carplayLibraryDirectoryForAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(a1, "_carplayLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hasPrefix:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = v7;
  }
  else
  {
    CarThemeAssetsLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CARThemeAssetOverrider _carplayLibraryDirectoryForAssetIdentifier:].cold.1();

    v11 = 0;
  }

  return v11;
}

+ (id)_assetURLForVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "_carplayLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlayApp"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "iOSContentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "accessoryContentVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("Asset-%@-%lu"), v10, objc_msgSend(v12, "unsignedIntegerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_readVersionFromAsset:(id)a3 assetIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  CARThemeAssetVersion *v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Info.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, &v24);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v24;
  v10 = v9;
  if (v8)
  {
    v11 = v7;
    v12 = v9;
    goto LABEL_6;
  }
  CarThemeAssetsLogging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:].cold.1();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("CarPlayPhone.assets"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("Info.plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v11, &v23);
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = v23;

  if (v8)
  {
LABEL_6:
    objc_opt_class();
    -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("iOSContentVersion"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0)
      v16 = (__CFString *)v15;
    else
      v16 = 0;

    objc_opt_class();
    -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("AccessoryContentVersion"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (!v16)
      v16 = CFSTR("0");
    if (!v18)
    {
      CarThemeAssetsLogging();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:].cold.2(v20);

      -[NSObject objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0C9AE90]);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v19 = 0;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "integerValue"));
      v21 = objc_claimAutoreleasedReturnValue();

      if (v21)
        v18 = (id)v21;
      else
        v18 = &unk_1E543F6A0;
    }
    v19 = -[CARThemeAssetVersion initWithIdentifier:iOSContentVersion:accessoryContentVersion:]([CARThemeAssetVersion alloc], "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v6, v16, v18);
LABEL_26:

    goto LABEL_27;
  }
  CarThemeAssetsLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:].cold.1();
  v19 = 0;
LABEL_27:

  return v19;
}

+ (void)postAssetErrorNotification:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  CarThemeAssetsLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[CARThemeAssetOverrider postAssetErrorNotification:forAsset:].cold.1();

  if (CRIsInternalInstall())
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("dd/MM HH:mm:ss"));
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("🚨🚙 Asset Discovery ERROR: %@"), v11);

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v6)
      v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("CDS Asset Identifier:\n%@ \nError:\n%@ "), v6, v5);
    else
      v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("CDS Asset Identifier is MISSING!\nError:\n%@"), v5, v16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__CARThemeAssetOverrider_postAssetErrorNotification_forAsset___block_invoke;
    v17[3] = &unk_1E5427E58;
    v18 = v14;
    v15 = v14;
    CRPostBannerToPhone(v12, v15, v17);

  }
}

void __62__CARThemeAssetOverrider_postAssetErrorNotification_forAsset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_DEFAULT, "Posting Asset Error Message %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (void)_overrideAssetSourceURLForAssetIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "No assets found in asset folder %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_generatedAssetForSourceAssetURL:(void *)a1 version:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, a2, v4, "failed to create %@", v5);

}

+ (void)_generatedAssetForSourceAssetURL:(NSObject *)a3 version:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_1_4(&dword_1A83A2000, a3, v6, "failed to create %@: %@", (uint8_t *)&v7);

}

+ (void)_carplayLibraryDirectoryForAssetIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "invalid asset identifier %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_readVersionFromAsset:assetIdentifier:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_4(&dword_1A83A2000, v0, (uint64_t)v0, "failed to read %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)_readVersionFromAsset:(os_log_t)log assetIdentifier:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "asset doesn't have AccessoryContentVersion, using CFBundleVersion", v1, 2u);
}

+ (void)postAssetErrorNotification:forAsset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1();
}

@end
