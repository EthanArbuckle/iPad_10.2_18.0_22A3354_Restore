@implementation GEOFilePaths

+ (id)urlFor:(unint64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "pathFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t i;
  __CFString *v33;
  void *v34;
  _QWORD v36[8];
  _QWORD v37[8];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("homeDirectory");
  objc_msgSend(a1, "_internal_homeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("geoServicesCacheDirectoryPath");
  v39[0] = v3;
  objc_msgSend(a1, "_internal_geoServicesCacheDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v36[0] = CFSTR("systemContainerPathUsingLibSystem");
  +[GEOFilePathsPrivate systemContainerPathUsingLibSystem](GEOFilePathsPrivate, "systemContainerPathUsingLibSystem");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("<nil>");
  v37[0] = v9;
  v36[1] = CFSTR("systemContainerLibraryPathUsingLibSystem");
  +[GEOFilePathsPrivate systemContainerLibraryPathUsingLibSystem](GEOFilePathsPrivate, "systemContainerLibraryPathUsingLibSystem");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("<nil>");
  v37[1] = v12;
  v36[2] = CFSTR("systemContainerCachesPathUsingLibSystem");
  +[GEOFilePathsPrivate systemContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "systemContainerCachesPathUsingLibSystem");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("<nil>");
  v37[2] = v15;
  v36[3] = CFSTR("daemonContainerPathUsingLibSystem");
  +[GEOFilePathsPrivate daemonContainerPathUsingLibSystem](GEOFilePathsPrivate, "daemonContainerPathUsingLibSystem");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("<nil>");
  v37[3] = v18;
  v36[4] = CFSTR("daemonContainerLibraryPathUsingLibSystem");
  +[GEOFilePathsPrivate daemonContainerLibraryPathUsingLibSystem](GEOFilePathsPrivate, "daemonContainerLibraryPathUsingLibSystem");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("<nil>");
  v37[4] = v21;
  v36[5] = CFSTR("daemonContainerCachesPathUsingLibSystem");
  +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "daemonContainerCachesPathUsingLibSystem");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("<nil>");
  v37[5] = v24;
  v36[6] = CFSTR("userContainerLibPathUsingLibSystem");
  +[GEOFilePathsPrivate userContainerLibPathUsingLibSystem](GEOFilePathsPrivate, "userContainerLibPathUsingLibSystem");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = CFSTR("<nil>");
  v37[6] = v27;
  v36[7] = CFSTR("userContainerCachesPathUsingLibSystem");
  +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "userContainerCachesPathUsingLibSystem");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (const __CFString *)v28;
  else
    v30 = CFSTR("<nil>");
  v37[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v31);

  for (i = 0; i != 40; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x26)
    {
      if ((unint64_t)(i - 1) >= 0x27)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid GEOFilePath (%d)"), i);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = off_1E1C0D530[i - 1];
      }
      +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, v33);

    }
  }
  return v6;
}

+ (id)pathFor:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint8_t *v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;

  objc_opt_self();
  if (qword_1ECDBC130 != -1)
    dispatch_once(&qword_1ECDBC130, &__block_literal_global_104);
  if ((~(_WORD)a3 & 0xC000) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v38 = 0;
      v33 = MEMORY[0x1E0C81028];
      v34 = "Assertion failed: !(unVaulted && forceVaulted)";
      v35 = (uint8_t *)&v38;
      goto LABEL_49;
    }
    return 0;
  }
  v4 = a3 & 0xFFFFFFFFFFFF3FFFLL;
  if ((a3 & 0xFFFFFFFFFFFF3FFFLL) >= 0x28)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v37 = 0;
      v33 = MEMORY[0x1E0C81028];
      v34 = "Assertion failed: filePathType < GEOFilePath_Count";
      v35 = (uint8_t *)&v37;
      goto LABEL_49;
    }
    return 0;
  }
  if (pathFor__filePathRecords[4 * v4] != v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return 0;
    v36 = 0;
    v33 = MEMORY[0x1E0C81028];
    v34 = "Assertion failed: record->filePathType == filePathType";
    v35 = (uint8_t *)&v36;
LABEL_49:
    _os_log_fault_impl(&dword_1885A9000, v33, OS_LOG_TYPE_FAULT, v34, v35, 2u);
    return 0;
  }
  v5 = (unsigned __int16)a3 & 0x8000;
  v6 = (a3 >> 14) & 1;
  v7 = (char *)&pathFor__filePathRecords[4 * v4];
  v8 = *((_QWORD *)v7 + 1);
  v9 = (void *)*((_QWORD *)v7 + 3);
  if ((0xEEECD7BBDFuLL >> v4) & 1 | v5)
    v10 = v6;
  else
    v10 = 1;
  objc_opt_self();
  objc_opt_self();
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsMultiUser");

  if ((v12 & 1) != 0)
    goto LABEL_13;
  if (qword_1ECDBC138 != -1)
    dispatch_once(&qword_1ECDBC138, &__block_literal_global_3_2);
  if (_MergedGlobals_248)
  {
LABEL_13:
    switch(v8)
    {
      case 1:
        +[GEOFilePathsPrivate userContainerLibPathUsingLibSystem](GEOFilePathsPrivate, "userContainerLibPathUsingLibSystem");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 2:
        +[GEOFilePathsPrivate systemContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "systemContainerCachesPathUsingLibSystem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 3:
        +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "userContainerCachesPathUsingLibSystem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        v18 = CFSTR("GeoServices");
        goto LABEL_26;
      case 4:
        +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "daemonContainerCachesPathUsingLibSystem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        v14 = v17;
        v18 = CFSTR("com.apple.geod");
        goto LABEL_26;
      case 5:
        +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "userContainerCachesPathUsingLibSystem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("com.apple.geod");
        goto LABEL_30;
      case 6:
        +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "userContainerCachesPathUsingLibSystem");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 7:
        +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "daemonContainerCachesPathUsingLibSystem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        v18 = CFSTR("com.apple.geoanalyticsd");
LABEL_26:
        objc_msgSend(v17, "stringByAppendingPathComponent:", v18);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      case 8:
        +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem](GEOFilePathsPrivate, "userContainerCachesPathUsingLibSystem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("com.apple.geoanalyticsd");
LABEL_30:
        objc_msgSend(v19, "stringByAppendingPathComponent:", v21);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_37;
        goto LABEL_36;
      case 9:
        v16 = CFSTR("/AppleInternal/Maps");
        goto LABEL_37;
      default:
        goto LABEL_17;
    }
  }
  switch(v8)
  {
    case 1:
      +[GEOFilePaths _internal_homeDirectory](GEOFilePaths, "_internal_homeDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Library"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v31, 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    case 2:
    case 3:
      +[GEOFilePaths _internal_geoServicesCacheDirectoryPath](GEOFilePaths, "_internal_geoServicesCacheDirectoryPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v14, 0);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v16 = (__CFString *)v15;
      goto LABEL_28;
    case 4:
    case 5:
      +[GEOFilePaths _internal_homeDirectory](GEOFilePaths, "_internal_homeDirectory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Library"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("Caches"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("com.apple.geod");
      goto LABEL_35;
    case 6:
      +[GEOFilePaths _internal_homeDirectory](GEOFilePaths, "_internal_homeDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Library"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringByAppendingPathComponent:", CFSTR("Caches"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v32, 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_40:
LABEL_28:

      break;
    case 7:
    case 8:
      +[GEOFilePaths _internal_homeDirectory](GEOFilePaths, "_internal_homeDirectory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Library"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("Caches"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("com.apple.geoanalyticsd");
LABEL_35:
      objc_msgSend(v25, "stringByAppendingPathComponent:", v27);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      if (v10)
      {
LABEL_36:
        -[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", CFSTR("Vault"));
        v28 = objc_claimAutoreleasedReturnValue();

        v16 = (__CFString *)v28;
      }
      break;
    case 9:
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("AppleInternal/Maps"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v16 = (__CFString *)v13;
      break;
    default:
LABEL_17:
      v16 = 0;
      break;
  }
LABEL_37:
  -[NSString _geo_stringByAppendingOptionalPathComponent:](v16, v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (NSString)_internal_geoServicesCacheDirectoryPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEOFilePaths__internal_geoServicesCacheDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC148 != -1)
    dispatch_once(&qword_1ECDBC148, block);
  return (NSString *)(id)qword_1ECDBC140;
}

+ (NSString)_internal_homeDirectory
{
  return (NSString *)CFSTR("/var/mobile");
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  return +[GEOFilePaths dictionaryRepresentation](GEOFilePaths, "dictionaryRepresentation", a3);
}

void __47__GEOFilePaths_registerStateCaptureIfNecessary__block_invoke()
{
  GEOFilePaths *v0;
  void *v1;

  v0 = objc_alloc_init(GEOFilePaths);
  v1 = (void *)registerStateCaptureIfNecessary_instance;
  registerStateCaptureIfNecessary_instance = (uint64_t)v0;

}

- (GEOFilePaths)init
{
  GEOFilePaths *v2;
  void *global_queue;
  uint64_t v4;
  geo_state_capture_handle *stateCaptureHandle;
  GEOFilePaths *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOFilePaths;
  v2 = -[GEOFilePaths init](&v8, sel_init);
  if (v2)
  {
    global_queue = (void *)geo_get_global_queue();
    GEORegisterPListStateCaptureAtFrequency();
    v4 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (geo_state_capture_handle *)v4;

    v6 = v2;
  }

  return v2;
}

uint64_t __27__GEOFilePaths__isMultUser__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  uint32_t multiuser_mode;

  multiuser_mode = 0;
  result = host_check_multiuser_mode(0, &multiuser_mode);
  if ((_DWORD)result)
    v1 = 0;
  else
    v1 = multiuser_mode == 1;
  v2 = v1;
  _MergedGlobals_248 = v2;
  return result;
}

void __55__GEOFilePaths__internal_geoServicesCacheDirectoryPath__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_internal_homeDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Library/Caches/GeoServices"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECDBC140;
  qword_1ECDBC140 = v2;

  GEOGetGEOFilePathsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = qword_1ECDBC140;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "geoServicesCacheDirectory: %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (NSString)preferencesDirectoryPath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 9);
}

+ (NSString)geodCacheDirectoryPath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 4);
}

+ (NSString)requestCountsDBFilePath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 26);
}

+ (NSString)locationShifterDBFilePath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 25);
}

+ (NSURL)imageServiceDBFileURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "pathFor:", 28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (NSString)analyticsUploadDirectoryPath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 15);
}

+ (NSString)mapsSuggestionsCacheDirectoryPath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 22);
}

+ (NSString)analyticsPipelineFilePath
{
  return (NSString *)objc_msgSend(a1, "pathFor:", 27);
}

+ (BOOL)createDirectoryCopyingAttributesFromParent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  BOOL v25;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
    *a4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) != 0)
  {
    v25 = 1;
    goto LABEL_26;
  }
  v8 = v5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
  {
    v10 = (uint64_t)v8;
LABEL_9:

    v11 = (void *)v10;
  }
  else
  {
    v11 = v8;
    while (1)
    {
      v12 = objc_msgSend(v11, "length");

      if (v12 < 6)
        break;
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (objc_msgSend(v9, "fileExistsAtPath:", v10))
        goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileExistsAtPath:", v11))
  {
    v14 = objc_msgSend(v11, "length");

    if (v14 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v15, "attributesOfItemAtPath:error:", v11, &v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v28;

      if (!v16 || v17)
      {
        GEOGetGEOFilePathsLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
          *(_DWORD *)buf = 136446466;
          v30 = v19;
          v31 = 2112;
          v32 = v17;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Unable to get attributes for %{public}s: %@", buf, 0x16u);
        }

      }
      goto LABEL_19;
    }
  }
  else
  {

  }
  v17 = 0;
  v16 = 0;
LABEL_19:
  NSLog(CFSTR("creating %@ with attributes: %@"), v8, v16);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  v21 = objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v16, &v27);
  v22 = v27;

  if ((v21 & 1) == 0)
  {
    GEOGetGEOFilePathsLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
      *(_DWORD *)buf = 136446466;
      v30 = v24;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Unable to create parent directory at %{public}s: %@", buf, 0x16u);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v22);
  v25 = v22 == 0;

LABEL_26:
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
}

@end
