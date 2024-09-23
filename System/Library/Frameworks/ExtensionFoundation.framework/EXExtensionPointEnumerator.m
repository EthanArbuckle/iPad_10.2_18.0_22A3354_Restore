@implementation EXExtensionPointEnumerator

+ (void)enumerateExtensionPointsInDirectoryAtURL:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("/System/iOSSupport/"));

  v9 = *MEMORY[0x1E0C99A18];
  v46[0] = *MEMORY[0x1E0C999D0];
  v46[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v10;
  v30 = v5;
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v10, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    v31 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      v32 = v14;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        objc_msgSend(v17, "pathExtension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("appexpt"));

        if (!v19)
        {
          v34 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v37;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v37 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
                  objc_msgSend(v21, "_EX_dictionaryForKey:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "translateAppexptDictionary:definitionURL:isCatalyst:", v27, v17, v8);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  v6[2](v6, v26, v28);
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v23);
            }
          }

          v15 = v31;
          v14 = v32;
          v16 = v34;
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v14);
  }

}

- (EXExtensionPointEnumerator)initWithCacheURLs:(id)a3 config:(id)a4
{
  return -[EXExtensionPointEnumerator initWithSDKDictionary:urls:config:](self, "initWithSDKDictionary:urls:config:", MEMORY[0x1E0C9AA70], a3, a4);
}

- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 config:(id)a4
{
  EXExtensionPointEnumerator *result;

  result = -[EXExtensionPointEnumerator initWithSDKDictionary:urls:config:](self, "initWithSDKDictionary:urls:config:", a3, MEMORY[0x1E0C9AA60], a4);
  if (result)
    result->_validateExtensionPoints = 1;
  return result;
}

- (EXExtensionPointEnumerator)initWithSDKDictionary:(id)a3 urls:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  EXExtensionPointEnumerator *v11;
  NSDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSDictionary *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSDictionary *extensionPoints;
  NSDictionary *v52;
  uint64_t v53;
  NSEnumerator *extensionPointsKeyEnumerator;
  uint64_t v55;
  _EXExtensionPoint *currentExtensionPoint;
  id obj;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  NSDictionary *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  _QWORD v74[4];
  NSDictionary *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  NSDictionary *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v84.receiver = self;
  v84.super_class = (Class)EXExtensionPointEnumerator;
  v11 = -[EXExtensionPointEnumerator init](&v84, sel_init);
  if (v11)
  {
    obj = a5;
    v59 = v10;
    v61 = v9;
    v12 = (NSDictionary *)objc_opt_new();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v60 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    if (v14)
    {
      v15 = v14;
      v68 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v81 != v68)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend(v13, "_EX_dictionaryForKey:", v17, obj);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "translateAppexptDictionary:definitionURL:isCatalyst:", v18, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count"))
          {
            -[NSDictionary _EX_dictionaryForKey:](v12, "_EX_dictionaryForKey:", v17);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            v22 = (void *)MEMORY[0x1E0C9AA70];
            if (v20)
              v22 = (void *)v20;
            v23 = v22;

            objc_msgSend(v23, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v19);
            v24 = objc_claimAutoreleasedReturnValue();

            -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v24, v17);
          }
          else
          {
            _EXDefaultLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v86 = v17;
            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      }
      while (v15);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v25 = v9;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v77;
      v29 = (char *)&unk_1EE209000;
      v30 = MEMORY[0x1E0C809B0];
      v62 = *(_QWORD *)v77;
      v63 = v25;
      do
      {
        v31 = 0;
        v65 = v27;
        do
        {
          if (*(_QWORD *)v77 != v28)
            objc_enumerationMutation(v25);
          v67 = v31;
          v32 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v31);
          if (objc_msgSend(v32, "_EX_isDirectory", obj))
          {
            v74[0] = v30;
            v74[1] = 3221225472;
            v74[2] = __64__EXExtensionPointEnumerator_initWithSDKDictionary_urls_config___block_invoke;
            v74[3] = &unk_1E2CFD398;
            v75 = v12;
            objc_msgSend(v29 + 3848, "enumerateExtensionPointsInDirectoryAtURL:block:", v32, v74);
            v33 = v75;
            goto LABEL_45;
          }
          +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v34, "enforceXPCCacheCodeSigning") & 1) != 0)
          {
            objc_msgSend(v32, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "hasSuffix:", CFSTR("System/Library/xpc/extensions.plist"));

            if (v36)
            {
              v73 = 0;
              objc_msgSend(MEMORY[0x1E0C99D80], "_EX_dictionaryWithSignedURL:error:", v32, &v73);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = (NSDictionary *)v73;
              if (v37)
                goto LABEL_29;
              goto LABEL_25;
            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          if (v37)
          {
LABEL_29:
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v38 = v37;
            v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
            if (v39)
            {
              v40 = v39;
              v64 = v37;
              v41 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v40; ++j)
                {
                  if (*(_QWORD *)v70 != v41)
                    objc_enumerationMutation(v38);
                  v43 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                  -[NSObject _EX_dictionaryForKey:](v38, "_EX_dictionaryForKey:", v43);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EXExtensionPointEnumerator translateXPCCacheDictionary:](v11, "translateXPCCacheDictionary:", v44);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v45, "count"))
                  {
                    -[NSDictionary _EX_dictionaryForKey:](v12, "_EX_dictionaryForKey:", v43);
                    v46 = objc_claimAutoreleasedReturnValue();
                    v47 = (void *)v46;
                    v48 = (void *)MEMORY[0x1E0C9AA70];
                    if (v46)
                      v48 = (void *)v46;
                    v49 = v48;

                    objc_msgSend(v49, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v45);
                    v50 = objc_claimAutoreleasedReturnValue();

                    -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v50, v43);
                  }
                  else
                  {
                    _EXDefaultLog();
                    v50 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v86 = v43;
                    }
                  }

                }
                v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
              }
              while (v40);
              v28 = v62;
              v25 = v63;
              v29 = (_BYTE *)&unk_1EE209000;
              v30 = MEMORY[0x1E0C809B0];
              v37 = v64;
            }
LABEL_43:
            v33 = v66;
            goto LABEL_44;
          }
LABEL_25:
          _EXDefaultLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
          *(_DWORD *)buf = 138543618;
          v86 = v32;
          v87 = 2114;
          v33 = v66;
          v88 = v66;
LABEL_44:

          v27 = v65;
LABEL_45:

          v31 = v67 + 1;
        }
        while (v67 + 1 != v27);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      }
      while (v27);
    }

    objc_storeStrong((id *)&v11->_config, obj);
    extensionPoints = v11->_extensionPoints;
    v11->_extensionPoints = v12;
    v52 = v12;

    -[NSDictionary keyEnumerator](v11->_extensionPoints, "keyEnumerator");
    v53 = objc_claimAutoreleasedReturnValue();
    extensionPointsKeyEnumerator = v11->_extensionPointsKeyEnumerator;
    v11->_extensionPointsKeyEnumerator = (NSEnumerator *)v53;

    v55 = objc_opt_new();
    currentExtensionPoint = v11->_currentExtensionPoint;
    v11->_currentExtensionPoint = (_EXExtensionPoint *)v55;

    v11->_validateExtensionPoints = 1;
    v8 = v60;
    v9 = v61;
    v10 = v59;
  }

  return v11;
}

void __64__EXExtensionPointEnumerator_initWithSDKDictionary_urls_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_EX_dictionaryForKey:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA70];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    objc_msgSend(v10, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v5);
  }
  else
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v5;
    }

  }
}

+ (id)translateAppexptDictionary:(id)a3 definitionURL:(id)a4 isCatalyst:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "absoluteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_EX_dictionaryBySettingObject:forKey:", v11, CFSTR("EXExtensionPointDefinitionPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = v9;
  v13 = v12;
  if (v12)
  {
    v16 = CFSTR("EXNativeSDKVariant");
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

- (id)translateXPCCacheDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EXExtensionPointEnumerator translateXPCCacheDictionary:].cold.2();

  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("/System/")))
  {

    goto LABEL_7;
  }
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "appleInternal") & 1) == 0)
  {

    goto LABEL_19;
  }
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/AppleInternal/System"));

  if (v9)
  {
LABEL_7:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v5;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v20 = v5;
      v12 = *(_QWORD *)v22;
      v13 = (void *)MEMORY[0x1E0C9AA70];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v6);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v3, "_EX_objectForKey:ofClass:", v15, objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_EX_dictionaryBySettingObject:forKey:", v15, CFSTR("EXExtensionPointDefinitionPath"));
          v17 = objc_claimAutoreleasedReturnValue();

          if (v17)
          {

            v25 = CFSTR("EXNativeSDKVariant");
            v26 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = (id)v17;
            goto LABEL_17;
          }
        }
        v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v11)
          continue;
        break;
      }
LABEL_17:
      v5 = v20;
      goto LABEL_20;
    }
LABEL_19:
    v13 = (void *)MEMORY[0x1E0C9AA70];
LABEL_20:

    goto LABEL_21;
  }
  v13 = (void *)MEMORY[0x1E0C9AA70];
LABEL_21:
  _EXRegistrationLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[EXExtensionPointEnumerator translateXPCCacheDictionary:].cold.1();

  return v13;
}

- (id)synthesizeNSExtensionKeysInDictionary:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_EX_objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    v9 = v5;
    goto LABEL_5;
  }
  objc_msgSend(v5, "_EX_objectForKey:ofClass:", CFSTR("XPCService"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  v25[0] = CFSTR("NSExtensionPointIdentifier");
  v25[1] = CFSTR("NSExtensionPrincipalClassProhibited");
  v26[0] = v6;
  v26[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = CFSTR("NSExtensionAttributes");
  v23[0] = CFSTR("NSExtensionPointName");
  v23[1] = CFSTR("NSExtensionPointVersion");
  v24[0] = v6;
  v24[1] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("NSExtension");
  v21[1] = CFSTR("EXRequiresLegacyInfrastructure");
  v22[0] = v12;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _EXRegistrationLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v9;
    _os_log_debug_impl(&dword_190C25000, v14, OS_LOG_TYPE_DEBUG, "Extension point '%{public}@' - Synthesized NSExtension dictionary: %{public}@ -> %{public}@", (uint8_t *)&v15, 0x20u);
  }

LABEL_5:
  return v9;
}

- (id)flattenEXExtensionPointConfigurationInDictionary:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_EX_objectForKey:ofClass:", CFSTR("EXExtensionPointConfiguration"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _EXRegistrationLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    _os_log_debug_impl(&dword_190C25000, v9, OS_LOG_TYPE_DEBUG, "Extension point '%{public}@' - flattened EXExtensionPointConfiguration dictionary: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v8;
}

- (BOOL)validateExtensionPointIdentifier:(id)a3 sdkDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  char v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  int v25;
  uint8_t v26[16];

  v6 = a3;
  v7 = a4;
  if (self->_validateExtensionPoints)
  {
    -[EXExtensionPointEnumerator config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legacyExtensionPointAllowList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("EXExtensionPointConfiguration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        goto LABEL_9;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("NSExtension"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_9;
      v15 = objc_msgSend(v9, "_EX_BOOLForKey:", v6);
      +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "appleInternal"))
      {
        objc_msgSend(v7, "_EX_stringForKey:", CFSTR("EXExtensionPointDefinitionPath"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("/AppleInternal/"));

      }
      else
      {
        v18 = 0;
      }

      _EXRegistrationLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:].cold.3();

      v20 = v18 ? 1 : v15;
      if ((v20 & 1) != 0)
        goto LABEL_9;
      +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "enforceLegacyExtensionPointAllowList");

      if (v22)
      {
        _EXRegistrationLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:].cold.1();

        v11 = 0;
        goto LABEL_10;
      }
      +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "enforceLegacyExtensionPointAllowList");

      if ((v25 & 1) != 0)
      {
LABEL_9:
        v11 = 1;
LABEL_10:

        goto LABEL_11;
      }
      _EXRegistrationLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:].cold.2();
    }
    else
    {
      _EXRegistrationLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_190C25000, v12, OS_LOG_TYPE_DEFAULT, "NO list of legacy extension points found. All extension points are considered valid... for now.", v26, 2u);
      }
    }

    goto LABEL_9;
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (id)nextObject
{
  EXExtensionPointEnumerator *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  EXExtensionPointEnumerator *v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  EXExtensionPointEnumerator *v42;
  void *v43;
  void *v44;
  _EXExtensionPoint *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  NSString *v61;
  NSObject *v62;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  unsigned int v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[2];
  _QWORD v80[2];
  const __CFString *v81;
  const __CFString *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _QWORD v85[4];

  v2 = self;
  v85[2] = *MEMORY[0x1E0C80C00];
  ++nextObject_count;
  v3 = 56;
  if (-[NSMutableDictionary count](self->_currentSDKDictionaryForPlatform, "count"))
    goto LABEL_55;
  v4 = 32;
  -[NSEnumerator nextObject](v2->_extensionPointsKeyEnumerator, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0x1EE208000uLL;
  v8 = 0x1E0C99000uLL;
  while (2)
  {
    v9 = v6;
    while (1)
    {
      if (!v5)
      {
        v10 = v6;
        goto LABEL_54;
      }
      objc_msgSend(*(id *)((char *)&v2->super.super.isa + *(int *)(v7 + 2628)), "_EX_dictionaryForKey:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_52;
      if (objc_msgSend(v10, "count"))
        break;
      v9 = v10;
      if (!objc_msgSend(v10, "count"))
        goto LABEL_52;
    }
    v11 = objc_alloc_init(*(Class *)(v8 + 3592));
    objc_msgSend(v10, "_EX_dictionaryForKey:", CFSTR("EXNativeSDKVariant"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:](v2, "validateExtensionPointIdentifier:sdkDictionary:", v5, v12))
    {

      v12 = 0;
    }
    objc_msgSend(v12, "objectForKey:", CFSTR("EXSupportedPlatforms"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v85[0] = CFSTR("EXSupportedPlatforms");
      v85[1] = CFSTR("EXSupportedPlatformsKey");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_EX_dictionaryForKeys:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_class();
    v67 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = v5;
      v15 = v3;
      objc_msgSend(*(id *)(v8 + 3592), "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v17 = v13;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      if (v18)
      {
        v19 = v18;
        v66 = v13;
        v20 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v76 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(&unk_1E2D15BB0, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v16, "setObject:forKey:", v12, v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        }
        while (v19);
        v11 = v16;
        v3 = v15;
LABEL_42:
        v5 = v69;
        v13 = v66;
        goto LABEL_50;
      }
      v11 = v16;
      v3 = v15;
      v5 = v69;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v8 + 3592), "dictionary");
        v23 = objc_claimAutoreleasedReturnValue();

        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v17 = v13;
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        if (v24)
        {
          v25 = v24;
          v68 = (void *)v23;
          v69 = v5;
          v65 = v3;
          v66 = v13;
          v26 = v2;
          v27 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v72 != v27)
                objc_enumerationMutation(v17);
              v29 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
              objc_msgSend(&unk_1E2D15BD8, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v17, "objectForKey:", v29);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32
                  && -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:](v26, "validateExtensionPointIdentifier:sdkDictionary:", v69, v32))
                {
                  objc_msgSend(v68, "setObject:forKey:", v32, v30);
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = objc_msgSend(v31, "BOOLValue");
                  if (v12)
                  {
                    if (v33)
                      objc_msgSend(v68, "setObject:forKey:", v12, v30);
                  }
                }
              }

            }
            v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          }
          while (v25);
          v11 = v68;
          v2 = v26;
          v3 = v65;
          goto LABEL_42;
        }
        v11 = (id)v23;
      }
      else
      {
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", dyld_get_active_platform());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v12, v34);

        }
        objc_msgSend(v10, "_EX_dictionaryForKey:", CFSTR("EXCatalystSDKVariant"));
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17
          && -[EXExtensionPointEnumerator validateExtensionPointIdentifier:sdkDictionary:](v2, "validateExtensionPointIdentifier:sdkDictionary:", v5, v17))
        {
          objc_msgSend(v11, "setObject:forKey:", v17, &unk_1E2D15C78);
        }
      }
    }
LABEL_50:

    if (!objc_msgSend(v11, "count"))
    {

      v10 = 0;
      v4 = v67;
      v7 = 0x1EE208000;
      v8 = 0x1E0C99000;
LABEL_52:
      objc_msgSend(*(id *)((char *)&v2->super.super.isa + v4), "nextObject");
      v35 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v35;
      v6 = v10;
      continue;
    }
    break;
  }
  objc_storeStrong((id *)&v2->_currentIdentifier, v5);
  v64 = *(Class *)((char *)&v2->super.super.isa + v3);
  *(Class *)((char *)&v2->super.super.isa + v3) = (Class)v11;

LABEL_54:
LABEL_55:
  dyld_get_active_platform();
  v36 = 0x1EE208000uLL;
  if (objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "count"))
  {
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "objectForKey:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "intValue");
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "removeObjectForKey:", v38);

    if (v39)
    {
      objc_msgSend(v39, "_EX_stringForKey:", CFSTR("EXExtensionPointDefinitionPath"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v40;
      v42 = v2;
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v41, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v39, "_EX_dictionaryByRemovingObjectForKey:", CFSTR("EXExtensionPointDefinitionPath"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "_EX_objectForKey:ofClass:", CFSTR("XPCService"), objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        objc_msgSend(v46, "_EX_dictionaryForKey:", CFSTR("EXExtensionPointConfiguration"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v49 = 0;
        }
        else
        {
          objc_msgSend(v46, "objectForKey:", CFSTR("EXSupportsNSExtensionPlistKeys"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v50 == 0;

        }
      }
      else
      {
        v49 = 0;
      }

      -[EXExtensionPointEnumerator synthesizeNSExtensionKeysInDictionary:identifier:](v2, "synthesizeNSExtensionKeysInDictionary:identifier:", v46, v2->_currentIdentifier);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[EXExtensionPointEnumerator flattenEXExtensionPointConfigurationInDictionary:identifier:](v2, "flattenEXExtensionPointConfigurationInDictionary:identifier:", v51, v2->_currentIdentifier);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (sdkDictionaryAdditions_onceToken != -1)
        dispatch_once(&sdkDictionaryAdditions_onceToken, &__block_literal_global_352);
      objc_msgSend((id)sdkDictionaryAdditions_sdkDictionaryAdditions, "objectForKeyedSubscript:", v2->_currentIdentifier);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v53);
        v54 = objc_claimAutoreleasedReturnValue();

        v52 = (void *)v54;
      }
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EXExtensionIconPersonality"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        if (v49)
        {
LABEL_74:
          objc_msgSend(v52, "_EX_dictionaryBySettingObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("EXRequiresLegacyInfrastructure"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          goto LABEL_77;
        }
      }
      else
      {
        v81 = CFSTR("EXExtensionIconPersonality");
        v82 = CFSTR("container");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (id)objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v57);

        if (v49)
          goto LABEL_74;
      }
      v79[0] = CFSTR("EXRequiresLegacyInfrastructure");
      v79[1] = CFSTR("EXExtensionPointConfiguration");
      v80[0] = MEMORY[0x1E0C9AAA0];
      v80[1] = MEMORY[0x1E0C9AA70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v59 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v59);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 1;
      v52 = (void *)v59;
LABEL_77:

      -[_EXExtensionPoint setVariant:](v42->_currentExtensionPoint, "setVariant:", v56);
      objc_msgSend(v44, "_EX_stringForKey:", CFSTR("EXExtensionPointDomain"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
        v61 = v42->_currentIdentifier;
      else
        v61 = 0;
      -[_EXExtensionPoint setIdentifier:](v42->_currentExtensionPoint, "setIdentifier:", v42->_currentIdentifier);
      -[_EXExtensionPoint setSDKDictionary:](v42->_currentExtensionPoint, "setSDKDictionary:", v44);
      -[_EXExtensionPoint setUrl:](v42->_currentExtensionPoint, "setUrl:", v43);
      -[_EXExtensionPoint setPlatform:](v42->_currentExtensionPoint, "setPlatform:", v70);
      -[_EXExtensionPoint setDomain:](v42->_currentExtensionPoint, "setDomain:", v60);
      -[_EXExtensionPoint setName:](v42->_currentExtensionPoint, "setName:", v61);
      v45 = v42->_currentExtensionPoint;

      v2 = v42;
      v36 = 0x1EE208000;
      if (v45)
        goto LABEL_81;
      goto LABEL_60;
    }
  }
  v44 = 0;
LABEL_60:
  objc_msgSend(*(id *)((char *)&v2->super.super.isa + *(int *)(v36 + 2636)), "reset");
  v45 = 0;
LABEL_81:
  _EXRegistrationLog();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    -[EXExtensionPointEnumerator nextObject].cold.1((uint64_t)v45, v62);

  return v45;
}

- (BOOL)validateExtensionPoints
{
  return self->_validateExtensionPoints;
}

- (EXEnumeratorConfig)config
{
  return (EXEnumeratorConfig *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)extensionPoints
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSEnumerator)extensionPointsKeyEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 32, 1);
}

- (_EXExtensionPoint)currentExtensionPoint
{
  return (_EXExtensionPoint *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)currentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)currentSDKDictionaryForPlatform
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSDKDictionaryForPlatform, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_currentExtensionPoint, 0);
  objc_storeStrong((id *)&self->_extensionPointsKeyEnumerator, 0);
  objc_storeStrong((id *)&self->_extensionPoints, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)translateXPCCacheDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Translated SDK Dictionary: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)translateXPCCacheDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Translating SDK Dictionary: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)validateExtensionPointIdentifier:sdkDictionary:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "NSExtension Extension Point identifier: %{public}@ is legacy: %{public}s");
  OUTLINED_FUNCTION_6();
}

- (void)nextObject
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = nextObject_count;
  v3 = 2114;
  v4 = a1;
  _os_log_debug_impl(&dword_190C25000, a2, OS_LOG_TYPE_DEBUG, "[%d] Enumerator returning: '%{public}@'", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_6();
}

@end
