@implementation NELaunchServices

+ (id)lookupIdentifier:(id)a3 plugins:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t i;
  NEBundleProxy *v16;
  void *v17;
  void *v18;
  void *v19;
  NEBundleProxy *v20;
  char isKindOfClass;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NEBundleProxy *v31;
  void *v32;
  void *v33;
  void *v34;
  NEBundleProxy *v35;
  NEBundleProxy *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    v42 = a4;
    objc_msgSend(v6, "objectForInfoDictionaryKey:ofClass:", *MEMORY[0x1E0C9AAC8], objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v7, "objectForInfoDictionaryKey:ofClass:", *MEMORY[0x1E0C9AE88], objc_opt_class());
      v8 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "entitlementValueForKey:ofClass:", CFSTR("com.apple.security.application-groups"), objc_opt_class());
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    v11 = v9;
    if (v10)
    {
      v12 = v10;
      v13 = v8;
      v14 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v11 = 0;
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v12)
          continue;
        break;
      }
      v11 = v9;
LABEL_16:
      v8 = v13;
    }

    v16 = [NEBundleProxy alloc];
    objc_msgSend(v7, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "machOUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:](v16, "initWithIdentifier:url:machOUUIDs:name:appGroups:", v17, v18, v19, v8, v11);

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v42)
    {
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "plugInKitPlugins");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          v37 = v20;
          v38 = v11;
          v39 = v8;
          v41 = v5;
          v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v40 = v7;
          objc_msgSend(v7, "plugInKitPlugins");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v44 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                v31 = [NEBundleProxy alloc];
                objc_msgSend(v30, "bundleIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "bundleURL");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "machOUUIDs");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:](v31, "initWithIdentifier:url:machOUUIDs:name:appGroups:", v32, v33, v34, 0, 0);

                objc_msgSend(v24, "addObject:", v35);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v27);
          }

          *v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v24);
          v7 = v40;
          v5 = v41;
          v11 = v38;
          v8 = v39;
          v20 = v37;
        }
      }
    }

  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v5;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find %@ in LaunchServices", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

+ (id)bundleProxyForIdentifier:(id)a3 uid:(unsigned int)a4 plugins:(id *)a5
{
  return +[NELaunchServices lookupIdentifier:plugins:](NELaunchServices, "lookupIdentifier:plugins:", a3, a5);
}

+ (id)pluginClassToExtensionPoint:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 5)
    return 0;
  else
    return off_1E3CC2440[a3 - 2];
}

+ (id)pluginProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  NSObject *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v38 = (int64_t)v10;
    v27 = "Failed to find application with bundle identifier %@";
LABEL_29:
    _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    goto LABEL_22;
  }
  objc_msgSend(v13, "appState");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_21;
  v16 = (void *)v15;
  objc_msgSend(v14, "appState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isInstalled") & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(v14, "appState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isValid");

  if ((v19 & 1) == 0)
  {
LABEL_21:
    ne_log_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 138412290;
    v38 = (int64_t)v10;
    v27 = "App %@ is not installed or is not valid";
    goto LABEL_29;
  }
  v20 = v11;
  if (!v20)
  {
    +[NELaunchServices pluginClassToExtensionPoint:](NELaunchServices, "pluginClassToExtensionPoint:", a5);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      ne_log_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v38 = a5;
        _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "Failed to map plugin class %ld to an extension point", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v14, "plugInKitPlugins");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v30 = v14;
    v21 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v23, "protocol", v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", v20);

        if (v25)
        {
          v12 = v23;
          goto LABEL_26;
        }
      }
      v12 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v12)
        continue;
      break;
    }
LABEL_26:
    v14 = v30;
  }

LABEL_24:
  return v12;
}

+ (id)pluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 uid:(unsigned int)a7
{
  void *v7;
  NEBundleProxy *v8;
  void *v9;
  void *v10;
  void *v11;
  NEBundleProxy *v12;

  +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", a3, a4, a5, a6, *(_QWORD *)&a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [NEBundleProxy alloc];
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "machOUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NEBundleProxy initWithIdentifier:url:machOUUIDs:name:appGroups:](v8, "initWithIdentifier:url:machOUUIDs:name:appGroups:", v9, v10, v11, 0, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
