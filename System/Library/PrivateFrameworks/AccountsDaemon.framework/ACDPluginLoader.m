@implementation ACDPluginLoader

+ (id)_currentSystemVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *Value;
  void *v5;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BDBD1F0]);
    v5 = Value;
    if (Value)
      CFRetain(Value);
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_buildPluginCache
{
  void *v3;
  void *v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "pluginBundlesAtSubpath:", CFSTR("Authentication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ACDPluginLoader _buildPluginCache].cold.1(v5);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        objc_msgSend(v8, "bundlePath", v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForInfoDictionaryKey:", CFSTR("ACSupportedAccountTypes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v25 = v7;
        if (v11)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
                _ACDLogSystem();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v35 = v10;
                  v36 = 2112;
                  v37 = v17;
                  _os_log_debug_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEBUG, "\"Adding %@ to cache as supporting %@\", buf, 0x16u);
                }

                objc_msgSend(v3, "setObject:forKey:", v10, v17);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            }
            while (v14);
          }
        }
        else
        {
          _ACDLogSystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v35 = v10;
            _os_log_error_impl(&dword_20D8CB000, v19, OS_LOG_TYPE_ERROR, "\"Plugin %@ does not have any supported account types in its plist!\", buf, 0xCu);
          }

        }
        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v24);
  }

  return v3;
}

+ (id)pluginForIdentifier:(id)a3 subpath:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  const void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_currentSystemVersion");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@PluginCache"), v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)CFPreferencesCopyAppValue(v9, CFSTR("com.apple.accountsd"));
    v11 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("LastSystemVersion"), CFSTR("com.apple.accountsd"));
    if (v11 && objc_msgSend(v10, "count") && CFStringCompare(v8, v11, 1uLL) == kCFCompareEqualTo)
    {
      v14 = 0;
    }
    else
    {
      _ACDLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v11;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEFAULT, "\"System build version changed from %@ to %@\", buf, 0x16u);
      }

      objc_msgSend(a1, "_buildPluginCache");
      v13 = (const void *)objc_claimAutoreleasedReturnValue();

      CFPreferencesSetAppValue(v9, v13, CFSTR("com.apple.accountsd"));
      CFPreferencesSetAppValue(CFSTR("LastSystemVersion"), v8, CFSTR("com.apple.accountsd"));
      v14 = 1;
      v10 = (void *)v13;
    }
    objc_msgSend(v10, "objectForKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[ACPluginLoader pluginWithName:inSubpath:](ACDPluginLoader, "pluginWithName:inSubpath:", v15, CFSTR("Authentication"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _ACDLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v18)
          +[ACDPluginLoader pluginForIdentifier:subpath:].cold.4((uint64_t)v15, v17, v19, v20, v21, v22, v23, v24);
        goto LABEL_20;
      }
      if (v18)
        +[ACDPluginLoader pluginForIdentifier:subpath:].cold.3((uint64_t)v15, v17, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      _ACDLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[ACDPluginLoader pluginForIdentifier:subpath:].cold.2((uint64_t)v6, v17, v25, v26, v27, v28, v29, v30);
    }
    v16 = 0;
LABEL_20:

    if (v11)
      CFRelease(v11);
    if (v14)
      CFPreferencesAppSynchronize(CFSTR("com.apple.accountsd"));

    goto LABEL_25;
  }
  _ACDLogSystem();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    +[ACDPluginLoader pluginForIdentifier:subpath:].cold.1((os_log_t)v9);
  v16 = 0;
LABEL_25:

  return v16;
}

+ (void)_buildPluginCache
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D8CB000, log, OS_LOG_TYPE_DEBUG, "\"Building plugin cache\", v1, 2u);
}

+ (void)pluginForIdentifier:(os_log_t)log subpath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"Unable to get current build version!\", v1, 2u);
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, a2, a3, "\"No bundle name for %@ in cache!\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, a2, a3, "\"Unable to load bundle %@ in cache!\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, a2, a3, "\"Loaded auth plugin %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
