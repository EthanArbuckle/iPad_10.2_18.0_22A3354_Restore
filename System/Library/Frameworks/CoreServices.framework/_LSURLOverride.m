@implementation _LSURLOverride

- (_LSURLOverride)initWithOriginalURL:(id)a3 checkingForAvailableApplications:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _LSURLOverride *v8;
  NSURLComponents *v9;
  LaunchServices::URLOverrides *v10;
  NSObject *v11;
  NSObject *v12;
  _LSURLOverride *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  LaunchServices::URLOverrides *v19;
  char *v20;
  void *v21;
  LaunchServices::URLOverrides *v22;
  int v23;
  char **v24;
  SEL *v25;
  uint64_t v26;
  LaunchServices::URLOverrides *v27;
  const char *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  LaunchServices::URLOverrides *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSURL *overrideURL;
  void *v37;
  char v38;
  _LSURLOverride *v39;
  LaunchServices::URLOverrides *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  id v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 v52;
  objc_super v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  char *v63;
  char *v64;
  _BYTE v65[24];
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint8_t buf[4];
  char *v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v4 = a4;
  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v53.receiver = self;
  v53.super_class = (Class)_LSURLOverride;
  v8 = -[_LSURLOverride init](&v53, sel_init);
  if (!v8)
    goto LABEL_63;
  v9 = (NSURLComponents *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7, 1);
  if (v9)
  {
    LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v48, v9, v4);
    v10 = (LaunchServices::URLOverrides *)_os_feature_enabled_impl();
    if ((_DWORD)v10)
    {
      LaunchServices::URLOverrides::getLog(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.3();
    }
    else
    {
      if (LaunchServices::URLOverrides::overrideBlocks)
      {
        v10 = (LaunchServices::URLOverrides *)objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure");
        if ((_DWORD)v10)
        {
          v46 = v4;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v14 = (id)LaunchServices::URLOverrides::overrideBlocks;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, buf, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v55 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
                (*(void (**)(uint64_t, id, _QWORD, _QWORD, _QWORD))(v18 + 16))(v18, v48, v49, v50, v52);
                v19 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
                v20 = (char *)v19;
                if (v19)
                {
                  LaunchServices::URLOverrides::getLog(v19);
                  v31 = objc_claimAutoreleasedReturnValue();
                  v4 = v46;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    v42 = (void *)MEMORY[0x186DAE9BC](v18);
                    objc_msgSend(v48, "URL");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v65 = 138478339;
                    *(_QWORD *)&v65[4] = v42;
                    *(_WORD *)&v65[12] = 2113;
                    *(_QWORD *)&v65[14] = v43;
                    *(_WORD *)&v65[22] = 2113;
                    v66 = v20;
                    _os_log_debug_impl(&dword_182882000, v31, OS_LOG_TYPE_DEBUG, "Block %{private}@ overrode URL %{private}@ to %{private}@", v65, 0x20u);

                  }
                  goto LABEL_48;
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, buf, 16);
              if (v15)
                continue;
              break;
            }
          }

          v4 = v46;
        }
      }
      if (v49 || v50 || v51)
      {
        v22 = (LaunchServices::URLOverrides *)objc_opt_class();
        *(_QWORD *)v65 = sel_fmfURL_;
        *(_QWORD *)&v65[8] = sel_fmipURL_;
        *(_QWORD *)&v65[16] = sel_iTunesStoreURL_;
        v66 = sel_iCloudEmailPrefsURL_;
        v23 = v49 | v50;
        v67 = sel_keynoteLiveURL_;
        v68 = sel_iCloudFamilyURL_;
        v24 = &v64;
        if (!v51)
          v24 = 0;
        v69 = sel_iCloudSchoolworkURL_;
        if (v23)
          v25 = (SEL *)v65;
        else
          v25 = (SEL *)v24;
        if (v23)
          v26 = 7;
        else
          v26 = v51;
        v64 = sel_booksStoreAuthorizationURL_;
        if (v26)
        {
          v27 = v22;
          while (1)
          {
            v28 = *v25;
            objc_msgSend(v27, *v25, &v48);
            v22 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
            v20 = (char *)v22;
            if (v22)
              break;
            ++v25;
            if (!--v26)
              goto LABEL_39;
          }
          LaunchServices::URLOverrides::getLog(v22);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(v28);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "URL");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138478339;
            v59 = v44;
            v60 = 2113;
            v61 = v45;
            v62 = 2113;
            v63 = v20;
            _os_log_debug_impl(&dword_182882000, v29, OS_LOG_TYPE_DEBUG, "Selector %{private}@ overrode URL %{private}@ to %{private}@", v58, 0x20u);

          }
        }
        else
        {
LABEL_39:
          LaunchServices::URLOverrides::getLog(v22);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v48, "URL");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.5(v30, (uint64_t)v58, v29);
          }
          v20 = 0;
        }

LABEL_48:
        LaunchServices::URLOverrides::getLog(v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v20)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v71 = v20;
            v72 = 2113;
            v73 = v7;
            _os_log_impl(&dword_182882000, v34, OS_LOG_TYPE_DEFAULT, "URL %{private}@ overrides URL %{private}@", buf, 0x16u);
          }

          objc_storeStrong((id *)&v8->_originalURL, a3);
          v35 = objc_msgSend(v20, "copy");
          overrideURL = v8->_overrideURL;
          v8->_overrideURL = (NSURL *)v35;

          if (!v4)
            goto LABEL_62;
          +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0;
          v38 = objc_msgSend(v37, "isApplicationAvailableToOpenURL:error:", v20, &v47);
          v39 = (_LSURLOverride *)v47;

          if ((v38 & 1) != 0)
          {
LABEL_61:

LABEL_62:
LABEL_63:
            v8 = v8;
            v13 = v8;
            goto LABEL_64;
          }

          if (!v39)
          {
LABEL_60:
            v8 = 0;
            goto LABEL_61;
          }
          LaunchServices::URLOverrides::getLog(v40);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.2((uint64_t)v20);
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.1();
          v39 = v8;
        }

        goto LABEL_60;
      }
      LaunchServices::URLOverrides::getLog(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v48, "URL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.4(v21, (uint64_t)v65, v11);
      }
    }

    v20 = 0;
    goto LABEL_48;
  }
  LaunchServices::URLOverrides::getLog(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v71 = (char *)v7;
    _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "URL %{private}@ could not be decomposed into its components. Cannot override.", buf, 0xCu);
  }

  v13 = 0;
LABEL_64:

  return v13;
}

- (_LSURLOverride)initWithOriginalURL:(id)a3
{
  return -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:](self, "initWithOriginalURL:checkingForAvailableApplications:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
}

- (_LSURLOverride)init
{
  abort();
}

+ (id)new
{
  abort();
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

+ (void)addOverrideBlock:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_LSURLOverride(Tests) addOverrideBlock:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("LSURLOverride.mm"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    if (!LaunchServices::URLOverrides::overrideBlocks)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = (void *)LaunchServices::URLOverrides::overrideBlocks;
      LaunchServices::URLOverrides::overrideBlocks = (uint64_t)v4;

      v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    }
    v6 = (void *)MEMORY[0x186DAE9BC](v9);
    objc_msgSend(v3, "addObject:", v6);

  }
}

+ (void)removeAllOverrideBlocks
{
  void *v2;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v2 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    LaunchServices::URLOverrides::overrideBlocks = 0;

  }
}

+ (void)setUseMacOverrides:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = v4;

  }
}

+ (void)resetPlatformFlag
{
  void *v2;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v2 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = 0;

  }
}

+ (id)fmfURL:(State *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(a3->var0, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("fmfmail.icloud.com")) & 1) != 0)
  {
    objc_msgSend(a3->var0, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3->var0, "query");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v9, "appendString:", CFSTR("?"));
      objc_msgSend(v9, "appendString:", v8);
      v10 = objc_msgSend(v9, "copy");

      v6 = (void *)v10;
    }
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("/")) & 1) != 0)
    {
      v11 = (void *)objc_msgSend(a3->var0, "copy");
      objc_msgSend(v11, "setScheme:", CFSTR("fmf1"));
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

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

+ (id)fmipURL:(State *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3->var0, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("fmipmail.icloud.com")) & 1) != 0)
  {
    v6 = (void *)objc_msgSend(a3->var0, "copy");
    objc_msgSend(v6, "setScheme:", CFSTR("fmip1"));
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)iTunesStoreURL:(State *)a3
{
  NSObject *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  LaunchServices::URLOverrides *v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  BOOL v39;
  NSObject *v40;
  void *v41;
  void *v42;
  __int128 v44;
  int v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id obj;
  void *v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[_LSURLOverride(Functions) iTunesStoreURL:].cold.1();
    v4 = 0;
    goto LABEL_65;
  }
  objc_msgSend(a3->var0, "scheme");
  v59 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3->var0, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = objc_claimAutoreleasedReturnValue();

  v58 = (void *)v7;
  objc_msgSend(a3->var0, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3->var0, "query");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v4 = 0;
  if (!v59 || !v7 || !v8)
    goto LABEL_64;
  v52 = (void *)v9;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "appendString:", CFSTR("?"));
    objc_msgSend(v11, "appendString:", v10);
    v12 = objc_msgSend(v11, "copy");

    v8 = (void *)v12;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"));
  if (v13)
  {
    v14 = CFSTR("/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MobileCoreServices"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pathForResource:ofType:", CFSTR("iTunesStoreURLPatterns"), CFSTR("plist"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v14 || (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v14)) == 0)
    {
      v4 = 0;
      goto LABEL_63;
    }
  }
  v48 = v14;
  objc_msgSend(v13, "objectForKey:", CFSTR("p2-url-resolution"));
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (!v15)
  {
    v4 = 0;
    goto LABEL_62;
  }
  v50 = *(_QWORD *)v69;
  *(_QWORD *)&v16 = 138477827;
  v44 = v16;
  do
  {
    v17 = 0;
    v46 = v15;
    do
    {
      if (*(_QWORD *)v69 != v50)
        objc_enumerationMutation(obj);
      v55 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v17);
      objc_msgSend(v55, "objectForKey:", CFSTR("scheme-mapping"), v44);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v17;
      objc_msgSend(v18, "objectForKey:", v59);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3->var1)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0CB3998]);
        objc_msgSend(v19, "setScheme:", v57);
        +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isApplicationAvailableToOpenURL:error:", v21, 0);

        if (!v22)
        {
          LaunchServices::URLOverrides::getLog(v23);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v44;
            v75 = v57;
            _os_log_debug_impl(&dword_182882000, v40, OS_LOG_TYPE_DEBUG, "Skipping iTunes Store scheme %{private}@ because no app is installed to handle it", buf, 0xCu);
          }

          v24 = v19;
          goto LABEL_53;
        }

      }
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v55, "objectForKey:", CFSTR("host-patterns"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v24;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v25)
      {
        v26 = 0;
        v53 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v65 != v53)
              objc_enumerationMutation(v24);
            objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i), 1, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v28, "rangeOfFirstMatchInString:options:range:", v58, 0, 0, objc_msgSend(v58, "length")) != 0x7FFFFFFFFFFFFFFFLL|| v29 != 0;
            v26 |= v31;
            if ((v26 & 1) != 0)
            {
              v62 = 0u;
              v63 = 0u;
              v60 = 0u;
              v61 = 0u;
              v49 = v28;
              objc_msgSend(v55, "objectForKey:", CFSTR("path-patterns"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v26;
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              if (v33)
              {
                v34 = *(_QWORD *)v61;
                while (2)
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v61 != v34)
                      objc_enumerationMutation(v32);
                    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j), 1, 0);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v36, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) == 0x7FFFFFFFFFFFFFFFLL&& v37 == 0;

                    if (!v39)
                    {

                      v41 = (void *)objc_msgSend(a3->var0, "copy");
                      objc_msgSend(v41, "setScheme:", v57);
                      objc_msgSend(v41, "URL");
                      v4 = (void *)objc_claimAutoreleasedReturnValue();

                      goto LABEL_62;
                    }
                  }
                  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                  if (v33)
                    continue;
                  break;
                }
              }

              v26 = v45;
              v28 = v49;
            }

            v24 = v54;
          }
          v25 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        }
        while (v25);
      }
LABEL_53:

      v17 = v51 + 1;
    }
    while (v51 + 1 != v46);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    v4 = 0;
  }
  while (v15);
LABEL_62:

  v14 = v48;
LABEL_63:

  v10 = v52;
LABEL_64:

  v3 = v59;
LABEL_65:

  return v4;
}

+ (id)iCloudEmailPrefsURL:(State *)a3
{
  void *v4;
  void *v5;
  _BOOL8 HasCaseInsensitivePrefix;
  _BOOL4 var6;
  NSObject *v8;
  _BOOL4 v9;
  __CFString *v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3->var3)
    return 0;
  objc_msgSend(a3->var0, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("setup.icloud.com")) & 1) != 0)
  {
    objc_msgSend(a3->var0, "query");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37
      && (HasCaseInsensitivePrefix = LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, CFSTR("/email/prefs"))))
    {
      var6 = a3->var6;
      LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)HasCaseInsensitivePrefix);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      if (var6)
      {
        if (v9)
          +[_LSURLOverride(Functions) iCloudEmailPrefsURL:].cold.2();

        objc_msgSend(a3->var0, "path");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString hasPrefix:](v10, "hasPrefix:", CFSTR("/")))
        {
          -[__CFString substringWithRange:](v10, "substringWithRange:", 1, -[__CFString length](v10, "length") - 1);
          v11 = objc_claimAutoreleasedReturnValue();

          v10 = (__CFString *)v11;
        }
        v35 = v10;
        if (v10 && -[__CFString length](v10, "length"))
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          objc_msgSend(v12, "setScheme:", CFSTR("x-apple.systempreferences"));
          if (LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, CFSTR("/email/prefs/family")))
          {
            v13 = CFSTR("com.apple.preferences.FamilySharingPrefPane");
          }
          else
          {
            v13 = CFSTR("com.apple.preferences.AppleIDPrefPane");
          }
          objc_msgSend(v12, "setPath:", v13);
          v14 = (void *)-[__CFString mutableCopy](v10, "mutableCopy");
          objc_msgSend(v14, "appendString:", CFSTR("?"));
          objc_msgSend(v14, "appendString:", v37);
          objc_msgSend(v12, "setQuery:", v14);
          objc_msgSend(v12, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        if (v9)
          +[_LSURLOverride(Functions) iCloudEmailPrefsURL:].cold.1();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(a3->var0, "queryItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v43 != v19)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("path"));

              if ((v22 & 1) != 0)
              {

                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(a3->var0, "queryItems");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                if (v25)
                {
                  v26 = *(_QWORD *)v39;
                  v35 = &stru_1E10473A0;
                  while (2)
                  {
                    for (j = 0; j != v25; ++j)
                    {
                      if (*(_QWORD *)v39 != v26)
                        objc_enumerationMutation(v24);
                      v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                      objc_msgSend(v28, "name");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "lowercaseString");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "isEqual:", CFSTR("path"));

                      if (v31)
                      {
                        v32 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(v28, "value");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "stringWithFormat:", CFSTR("ICLOUD_SERVICE/%@"), v33);
                        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

                        goto LABEL_42;
                      }
                    }
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                    if (v25)
                      continue;
                    break;
                  }
                }
                else
                {
                  v35 = &stru_1E10473A0;
                }
LABEL_42:

                v34 = objc_alloc(MEMORY[0x1E0C99E98]);
                objc_msgSend(CFSTR("settings-navigation://com.apple.Settings.AppleAccount/"), "stringByAppendingString:", v35);
                v12 = (id)objc_claimAutoreleasedReturnValue();
                v15 = (void *)objc_msgSend(v34, "initWithString:", v12);
                goto LABEL_43;
              }
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
            if (v18)
              continue;
            break;
          }
        }

        v23 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(CFSTR("settings-navigation://com.apple.Settings.AppleAccount?"), "stringByAppendingString:", v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v23, "initWithString:");

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)keynoteLiveURL:(State *)a3
{
  void *v5;

  if ((LaunchServices::URLOverrides::State::isNooverride(&a3->var0) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "keynoteLiveURL_noFragment:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)keynoteLiveURL_noFragment:(State *)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = !a3->var3 || !a3->var5;
  if (v3 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, CFSTR("/keynote-live")))
  {
    v9 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(a3->var0, "copy");
    objc_msgSend(v5, "setScheme:", CFSTR("com.apple.iwork.keynote-live"));
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isApplicationAvailableToOpenURL:error:", v7, 0);

    if (v8)
    {
      objc_msgSend(v5, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a3->var0, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("www.icloud.com"));

      if (v11)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(a3->var0, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
        objc_msgSend(v14, "setScheme:", CFSTR("x-keynote-live"));
        objc_msgSend(v14, "setHost:", v13);
        objc_msgSend(v14, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v9;
}

+ (id)iCloudFamilyURL:(State *)a3
{
  NSObject *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[_LSURLOverride(Functions) iCloudFamilyURL:].cold.1();

    v4 = 0;
  }
  else
  {
    objc_msgSend(a3->var0, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqual:", CFSTR("setup.icloud.com")) & 1) != 0)
    {
      objc_msgSend(a3->var0, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", CFSTR("/family/messages")) & 1) != 0)
      {
        v9 = (void *)objc_msgSend(a3->var0, "copy");
        objc_msgSend(v9, "setScheme:", CFSTR("family"));
        objc_msgSend(v9, "setHost:", CFSTR("messages"));
        objc_msgSend(v9, "setPath:", 0);
        objc_msgSend(v9, "URL");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)iCloudSchoolworkURL:(State *)a3
{
  NSObject *v3;
  void *v5;
  void *v6;
  LaunchServices::URLOverrides *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  LaunchServices::URLOverrides *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;

  if (a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.4();
  }
  else if (a3->var5)
  {
    objc_msgSend(a3->var0, "fragment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "mutableCopy");

    if (v3 && (v7 = (LaunchServices::URLOverrides *)-[NSObject count](v3, "count"), (unint64_t)v7 > 1))
    {
      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("schoolwork"));

      if (!v24)
      {
        v35 = (void *)objc_msgSend(a3->var0, "copy");
        objc_msgSend(v35, "setScheme:", CFSTR("schoolwork"));
        objc_msgSend(v35, "setHost:", CFSTR("schoolwork"));
        -[NSObject replaceObjectAtIndex:withObject:](v3, "replaceObjectAtIndex:withObject:", 0, &stru_1E10473A0);
        -[NSObject componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR("/"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setPath:", v36);

        objc_msgSend(v35, "setFragment:", 0);
        objc_msgSend(v35, "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      LaunchServices::URLOverrides::getLog(v25);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.3(v8, v26, v27, v28, v29, v30, v31, v32);
    }
    else
    {
      LaunchServices::URLOverrides::getLog(v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.1(v3, v16, v17, v18, v19, v20, v21, v22);
  }
  v33 = 0;
LABEL_16:

  return v33;
}

+ (id)booksStoreAuthorizationURL:(State *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (!a3->var6)
  {
    LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[_LSURLOverride(Functions) booksStoreAuthorizationURL:].cold.1();

    goto LABEL_8;
  }
  if (!a3->var4
    || (objc_msgSend(a3->var0, "host"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", CFSTR("www.audible.com")),
        v4,
        !v5))
  {
LABEL_8:
    v7 = 0;
    return v7;
  }
  v6 = (void *)objc_msgSend(a3->var0, "copy");
  objc_msgSend(v6, "setScheme:", CFSTR("ibooks"));
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "No override for URL %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOriginalURL:(uint64_t)a1 checkingForAvailableApplications:.cold.2(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138478083;
  v3 = a1;
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(&dword_182882000, v1, OS_LOG_TYPE_DEBUG, "Error determining if app is available to open URL %{private}@: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "URL overrides are disabled via feature flag.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

- (void)initWithOriginalURL:(NSObject *)a3 checkingForAvailableApplications:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "URL %{private}@ was not an HTTP(S) or ITMS URL. Skipping URL overrides.", (uint8_t *)a2);

}

- (void)initWithOriginalURL:(NSObject *)a3 checkingForAvailableApplications:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "Nothing overrode URL %{private}@", (uint8_t *)a2);

}

@end
