@implementation ACPluginLoader

+ (id)pluginBundlesAtSubpath:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "_populatePluginBundles:atSubpath:inAppleInternal:", v5, v4, 0);
  if (ACIsInternal())
  {
    _ACLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[ACPluginLoader pluginBundlesAtSubpath:].cold.1(v6);

    objc_msgSend(a1, "_populatePluginBundles:atSubpath:inAppleInternal:", v5, v4, 1);
  }
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

+ (void)_populatePluginBundles:(id)a3 atSubpath:(id)a4 inAppleInternal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  _QWORD v29[4];
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  v27 = v5;
  objc_msgSend(a1, "_accountsPluginDirectoryURLs:inAppleInternal:", v9, v5);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v26 = *MEMORY[0x1E0C999D0];
    v25 = *MEMORY[0x1E0C99A28];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v26, v25, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __67__ACPluginLoader__populatePluginBundles_atSubpath_inAppleInternal___block_invoke;
          v29[3] = &__block_descriptor_33_e27_B24__0__NSURL_8__NSError_16l;
          v30 = v27;
          objc_msgSend(v28, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v14, v15, 1, v29);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "nextObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            do
            {
              _ACLogSystem();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v18;
                _os_log_debug_impl(&dword_1A2BCD000, v19, OS_LOG_TYPE_DEBUG, "\"Validating bundle at %@...\", buf, 0xCu);
              }

              objc_msgSend(a1, "_validatedBundleAtURL:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v8, "addObject:", v20);
              _ACLogSystem();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v18;
                _os_log_debug_impl(&dword_1A2BCD000, v21, OS_LOG_TYPE_DEBUG, "\"Validated bundle at %@\", buf, 0xCu);
              }

              objc_msgSend(v16, "nextObject");
              v22 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v22;
            }
            while (v22);
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v11);
  }

}

+ (id)_validatedBundleAtURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("bundle"));

  if (v5)
  {
    v22 = 0;
    v6 = *MEMORY[0x1E0C999D0];
    v21 = 0;
    v7 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v22, v6, &v21);
    v8 = v22;
    v9 = v21;
    if ((v7 & 1) == 0)
    {
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[ACPluginLoader _validatedBundleAtURL:].cold.2();
      v16 = 0;
      goto LABEL_21;
    }
    if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
      goto LABEL_7;
    v20 = 0;
    v10 = *MEMORY[0x1E0C99A28];
    v19 = 0;
    v11 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v20, v10, &v19);
    v12 = v20;

    v13 = v19;
    if ((v11 & 1) != 0)
    {
      if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
      {
        v8 = v12;
        v9 = v13;
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v15 = v14;
          v16 = v15;
        }
        else
        {
          _ACLogSystem();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v3;
            _os_log_impl(&dword_1A2BCD000, v17, OS_LOG_TYPE_DEFAULT, "\"Couldn't create plugin at %@\", buf, 0xCu);
          }

          v16 = 0;
        }
        goto LABEL_21;
      }
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ACPluginLoader _validatedBundleAtURL:].cold.1((uint64_t)v3, v15);
    }
    else
    {
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[ACPluginLoader _validatedBundleAtURL:].cold.2();
    }
    v16 = 0;
    v9 = v13;
    v8 = v12;
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

+ (id)_accountsPluginDirectoryURLs:(id)a3 inAppleInternal:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v4 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/AppleInternal/Library"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLsForDirectory:inDomains:", 5, 8);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  if (v9 && objc_msgSend(v9, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "URLByAppendingPathComponent:isDirectory:", CFSTR("Accounts"), 1, (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v5, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
  }
  else
  {
    _ACLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ACPluginLoader _accountsPluginDirectoryURLs:inAppleInternal:].cold.1(v10);
  }

  return v6;
}

uint64_t __67__ACPluginLoader__populatePluginBundles_atSubpath_inAppleInternal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(a1 + 32))
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A2BCD000, v7, OS_LOG_TYPE_DEFAULT, "\"Encountered an error while scanning for plugins at %@: %@\", (uint8_t *)&v9, 0x16u);
    }

  }
  return 1;
}

+ (id)_pluginWithName:(id)a3 inSubpath:(id)a4 inAppleInternal:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "_accountsPluginDirectoryURLs:inAppleInternal:", a4, v5);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
      if (v14)
      {
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v8, 1, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_validatedBundleAtURL:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

+ (id)pluginWithName:(id)a3 inSubpath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_pluginWithName:inSubpath:inAppleInternal:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (ACIsInternal())
    {
      _ACLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[ACPluginLoader pluginWithName:inSubpath:].cold.1();

      objc_msgSend(a1, "_pluginWithName:inSubpath:inAppleInternal:", v6, v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (void)_accountsPluginDirectoryURLs:(os_log_t)log inAppleInternal:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_ERROR, "\"Couldn't find the system library directory to search for plugins.\", v1, 2u);
}

+ (void)_validatedBundleAtURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_DEBUG, "\"Skipping file at %@ because it isn't a directory\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)_validatedBundleAtURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A2BCD000, v0, v1, "\"Couldn't get value for the directory at %@: %@\");
  OUTLINED_FUNCTION_0();
}

+ (void)pluginBundlesAtSubpath:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_DEBUG, "\"Loading AppleInternal plugins\", v1, 2u);
}

+ (void)pluginWithName:inSubpath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1A2BCD000, v0, OS_LOG_TYPE_DEBUG, "\"Looking for AppleInternal plugin '%@' at '%@'\", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
