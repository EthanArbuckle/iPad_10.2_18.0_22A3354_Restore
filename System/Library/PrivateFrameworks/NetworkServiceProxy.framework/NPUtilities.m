@implementation NPUtilities

+ (id)sharedEmphemeralSession
{
  if (qword_1ED062A18 != -1)
    dispatch_once(&qword_1ED062A18, &__block_literal_global_2);
  return (id)_MergedGlobals_31;
}

void __38__NPUtilities_sharedEmphemeralSession__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB39F0];
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sessionWithConfiguration:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v1;

}

+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  OSStatus v12;
  CFTypeRef v13;
  NSObject *v14;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v18;
  __int16 v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0CD6CA8];
  v8 = *MEMORY[0x1E0CD6B58];
  v21[0] = *MEMORY[0x1E0CD6C98];
  v21[1] = v8;
  v22[0] = v7;
  v22[1] = v5;
  v9 = *MEMORY[0x1E0CD6F30];
  v21[2] = *MEMORY[0x1E0CD68F8];
  v21[3] = v9;
  v10 = *MEMORY[0x1E0CD6F40];
  v22[2] = v6;
  v22[3] = v10;
  v21[4] = *MEMORY[0x1E0CD7018];
  v22[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v12 = SecItemCopyMatching(v11, &result);
  if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_debug_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }

    v13 = 0;
  }
  else
  {
    v13 = result;
  }

  return (id)v13;
}

+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  const __CFDictionary *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  OSStatus v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  OSStatus v26;
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[5];

  v31[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = *MEMORY[0x1E0CD6CA8];
  v9 = *MEMORY[0x1E0CD6B58];
  v22 = *MEMORY[0x1E0CD6C98];
  v29[0] = *MEMORY[0x1E0CD6C98];
  v29[1] = v9;
  v31[0] = v8;
  v31[1] = v7;
  v30 = *MEMORY[0x1E0CD68F8];
  v10 = v30;
  v31[2] = a5;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = a5;
  v13 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v31, v29, 3);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v27[1] = v10;
  v15 = v7;
  v28[0] = v7;
  v28[1] = v12;
  v16 = *MEMORY[0x1E0CD68A0];
  v27[2] = *MEMORY[0x1E0CD70D8];
  v27[3] = v16;
  v17 = *MEMORY[0x1E0CD68B0];
  v28[2] = v13;
  v28[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v19 = SecItemUpdate(v14, v18);
  if (v19 == -25300)
  {
    v20 = (void *)-[__CFDictionary mutableCopy](v18, "mutableCopy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v22);
    v19 = SecItemAdd((CFDictionaryRef)v20, 0);

  }
  if (v19)
  {
    nplog_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v15;
      v25 = 1024;
      v26 = v19;
      _os_log_error_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_ERROR, "Failed to save %@ to the keychain: %d", buf, 0x12u);
    }

  }
}

+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CFTypeRef result;
  _BYTE v24[128];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v25[0] = *MEMORY[0x1E0CD6C98];
  v25[1] = v5;
  v26[0] = v4;
  v26[1] = v3;
  v6 = *MEMORY[0x1E0CD6F38];
  v7 = *MEMORY[0x1E0CD7018];
  v25[2] = *MEMORY[0x1E0CD6F30];
  v25[3] = v7;
  v26[2] = v6;
  v26[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  v10 = 0;
  v11 = (void *)result;
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v11, "length");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v13)
        {
          v14 = v13;
          v10 = 0;
          v15 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v10 += objc_msgSend(v17, "length", (_QWORD)v19);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          }
          while (v14);
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }
    }
  }

  return v10;
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  OSStatus v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  OSStatus v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v15[0] = *MEMORY[0x1E0CD6C98];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = SecItemDelete(v6);
  if (v7 != -25300 && v7 != 0)
  {
    v9 = v7;
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v11, 0x12u);
    }

  }
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const __CFDictionary *v10;
  OSStatus v11;
  OSStatus v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  OSStatus v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CD6CA8];
  v7 = *MEMORY[0x1E0CD6B58];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v7;
  v20[0] = v6;
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E0CD68F8];
  v20[2] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v11 = SecItemDelete(v10);
  if (v11 != -25300 && v11 != 0)
  {
    v13 = v11;
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 1024;
      v18 = v13;
      _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete %@ from the keychain: %d", (uint8_t *)&v15, 0x12u);
    }

  }
}

+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  CFTypeID v10;
  __SecKey *v11;
  NSObject *v12;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v16;
  __int16 v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CD6CC0];
  v5 = *MEMORY[0x1E0CD6900];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v5;
  v20[0] = v4;
  v20[1] = v3;
  v6 = *MEMORY[0x1E0CD6F40];
  v7 = *MEMORY[0x1E0CD7028];
  v19[2] = *MEMORY[0x1E0CD6F30];
  v19[3] = v7;
  v20[2] = v6;
  v20[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  if (v9 || (v10 = CFGetTypeID(result), v10 != SecKeyGetTypeID()))
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v16 = v9;
      v17 = 2112;
      v18 = v3;
      _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }

    if (result)
      CFRelease(result);
    v11 = 0;
  }
  else
  {
    v11 = (__SecKey *)result;
  }

  return v11;
}

+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  OSStatus v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CD6CC0];
  v7 = *MEMORY[0x1E0CD6900];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v7;
  v8 = *MEMORY[0x1E0CD68A0];
  v18[2] = *MEMORY[0x1E0CD70E8];
  v18[3] = v8;
  v19[0] = v6;
  v19[1] = v5;
  v9 = *MEMORY[0x1E0CD68B0];
  v19[2] = a3;
  v19[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = SecItemAdd(v10, 0);
  if (v11)
  {
    v12 = v11;
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412546;
      v15 = v5;
      v16 = 1024;
      v17 = v12;
      _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, "Failed to save key %@ to the keychain: %d", (uint8_t *)&v14, 0x12u);
    }

  }
}

+ (void)removeKeyFromKeychainWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  OSStatus v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  OSStatus v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CD6CC0];
  v5 = *MEMORY[0x1E0CD6900];
  v15[0] = *MEMORY[0x1E0CD6C98];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = SecItemDelete(v6);
  if (v7 != -25300 && v7 != 0)
  {
    v9 = v7;
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete key %@ from the keychain: %d", (uint8_t *)&v11, 0x12u);
    }

  }
}

+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFDictionary *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  _QWORD v32[4];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD68F8];
  v32[0] = *MEMORY[0x1E0CD6C98];
  v32[1] = v5;
  v33[0] = v4;
  v33[1] = v3;
  v6 = *MEMORY[0x1E0CD6F38];
  v7 = *MEMORY[0x1E0CD7010];
  v32[2] = *MEMORY[0x1E0CD6F30];
  v32[3] = v7;
  v33[2] = v6;
  v33[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      v28 = v9;
      v29 = 2112;
      v30 = v3;
      _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching returned %d for %@", buf, 0x12u);
    }
    goto LABEL_19;
  }
  v10 = (id)result;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (!v11)
  {
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v12 = v11;
  v20 = v8;
  v21 = v3;
  v13 = 0;
  v14 = *(_QWORD *)v23;
  v15 = *MEMORY[0x1E0CD6B58];
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v13)
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v13, "addObject:", v18, v20, v21);
        }

      }
    }
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  }
  while (v12);
  v8 = v20;
  v3 = v21;
LABEL_20:

  if (result)
    CFRelease(result);

  return v13;
}

+ (int64_t)interfaceTypeOfInterface:(id)a3
{
  uint64_t v3;

  v3 = nw_interface_get_type((nw_interface_t)a3) - 1;
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

+ (int64_t)interfaceTypeOfNWInterface:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "type");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

+ (id)getInterfaceName:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("UNKNOWN");
  else
    return off_1E4137620[a3 - 1];
}

+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  int sa_family;
  uint64_t v9;
  int64_t v10;

  v5 = a3;
  v6 = a4;
  if (nw_path_has_ipv6(v5))
  {
    v7 = !nw_path_has_ipv4(v5);
    if (!v6)
    {
LABEL_13:
      if (v7)
        v10 = 2;
      else
        v10 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    v7 = 0;
    if (!v6)
      goto LABEL_13;
  }
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_address)
    goto LABEL_13;
  sa_family = nw_endpoint_get_address(v6)->sa_family;
  v9 = 3;
  if (!v7)
    v9 = 1;
  if (sa_family != 2)
    v9 = 0;
  if (sa_family == 30)
    v10 = 2;
  else
    v10 = v9;
LABEL_16:

  return v10;
}

+ (void)fillOutConnectionInfo:(id)a3 withPath:(id)a4 interface:(id)a5 remoteEndpoint:(id)a6 parameters:(id)a7 outputHandler:(nw_protocol *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(nw_protocol *, uint64_t, uint64_t *);
  uint64_t v24;
  id v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t (*__ptr32 *v31)(int, int, id);
  unint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  id v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t (*__ptr32 *v41)(int, int, id);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unsigned int v46;
  NSObject *v47;
  uint64_t v48;
  nw_protocol *v49;
  uint64_t v50;
  unsigned int *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  int v57;
  uint64_t v58;
  unsigned int *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  int v67;
  NSObject *v68;
  nw_protocol *v69;
  int v70;
  unint64_t v71;
  NSObject *v72;
  id v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint8_t buf[4];
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v16 || nw_endpoint_get_type(v16) != nw_endpoint_type_address)
    goto LABEL_10;
  v18 = nw_endpoint_copy_address_string(v16);
  v19 = nw_endpoint_copy_port_string(v16);
  v20 = v19;
  if (v18 && v19)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s@%s"), v18, v19);
    objc_msgSend(v13, "setEdgeAddress:", v21);

  }
  else if (!v18)
  {
    goto LABEL_8;
  }
  free(v18);
LABEL_8:
  if (v20)
    free(v20);
LABEL_10:
  if (v14 && !v15)
    v15 = nw_path_copy_interface();
  if (v14 && v15)
  {
    objc_msgSend(v13, "setIPType:", +[NPUtilities protocolTypeFromPath:endpoint:](NPUtilities, "protocolTypeFromPath:endpoint:", v14, v16));
    objc_msgSend(v13, "setInterfaceType:", +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v15));
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_interface_get_name(v15));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInterfaceName:", v22);

    goto LABEL_18;
  }
  if (v15)
    goto LABEL_17;
LABEL_18:
  if (a8)
  {
    v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((_QWORD *)a8->callbacks + 28);
    if (v23)
    {
      v77 = 0;
      if (v17)
      {
        v69 = a8;
        if (nw_parameters_get_multipath_service(v17))
        {
          v24 = (*((uint64_t (**)(nw_protocol *, uint64_t, uint64_t *))a8->callbacks + 28))(a8, 3, &v77);
          v25 = 0;
          LOBYTE(v26) = 0;
          v27 = v77;
          v28 = 0xFFFFFFFFLL;
          if (v24 && v77 == 24)
          {
            v29 = (_QWORD *)v24;
            v68 = v16;
            v30 = *(unsigned int *)(v24 + 16);
            v31 = &off_19E995000;
            v76 = v24;
            v75 = v17;
            if ((_DWORD)v30)
            {
              v32 = 0;
              v25 = 0;
              LOBYTE(v70) = 0;
              v28 = 0xFFFFFFFFLL;
              v72 = v15;
              v73 = v14;
              do
              {
                v33 = *(_QWORD *)(v29[1] + 8 * v32);
                if (v33)
                {
                  v34 = *(unsigned int **)(v33 + 32);
                  if (v34[15])
                  {
                    v35 = v25;
                    v36 = v28;
                    v37 = nw_interface_create_with_index();
                    v38 = v37;
                    if (v37)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_interface_get_name(v37));
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (v39)
                      {
                        v40 = v39;
                        v41 = v31;
                        if (!v25)
                          v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v34, 408);
                        v35 = v25;
                        objc_msgSend(v25, "setObject:forKeyedSubscript:", v42, v40);

                        v43 = v34[6];
                        if ((_DWORD)v43)
                        {
                          LODWORD(v44) = v34[7];
                          v44 = v43 >= v44 ? v44 : 0;
                          v45 = v43 - v44;
                          if (v45 < v36)
                            v36 = v45;
                        }
                        v31 = v41;
                        if ((v70 & 1) == 0)
                          v70 = (v34[61] >> 4) & 1;
                      }
                      else
                      {
                        nplog_obj();
                        v47 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v79 = v38;
                          _os_log_error_impl(&dword_19E8FE000, v47, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                        }

                        v40 = 0;
                      }
                    }
                    else
                    {
                      nplog_obj();
                      v40 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        v46 = v34[15];
                        *(_DWORD *)buf = 67109120;
                        LODWORD(v79) = v46;
                        _os_log_error_impl(&dword_19E8FE000, v40, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                      }
                    }

                    v29 = (_QWORD *)v76;
                    v30 = *(unsigned int *)(v76 + 16);
                    v28 = v36;
                    v17 = v75;
                    v25 = v35;
                    v15 = v72;
                    v14 = v73;
                  }
                }
                ++v32;
              }
              while (v32 < v30);
            }
            else
            {
              LOBYTE(v70) = 0;
              v25 = 0;
              v28 = 0xFFFFFFFFLL;
            }
            if (*(_DWORD *)(*v29 + 28) == 2)
            {
              v50 = 0;
              v74 = 0;
              v51 = *(unsigned int **)(*v29 + 32);
              v67 = *((_QWORD *)v31 + 142);
              v71 = v28;
              do
              {
                if (LOWORD(v51[v50 + 10]))
                {
                  v52 = nw_interface_create_with_index();
                  v53 = v52;
                  if (v52)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_interface_get_name(v52));
                    v54 = objc_claimAutoreleasedReturnValue();
                    if (v54)
                    {
                      v55 = v74;
                      if (!v74)
                        v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", HIWORD(v51[v50 + 10]));
                      v56 = objc_claimAutoreleasedReturnValue();
                      v74 = v55;
                      objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, v54);
                    }
                    else
                    {
                      nplog_obj();
                      v56 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v79 = v53;
                        _os_log_error_impl(&dword_19E8FE000, v56, OS_LOG_TYPE_ERROR, "Failed to get the interface name from %@", buf, 0xCu);
                      }
                    }

                    v28 = v71;
                  }
                  else
                  {
                    nplog_obj();
                    v54 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                    {
                      v57 = LOWORD(v51[v50 + 10]);
                      *(_DWORD *)buf = v67;
                      LODWORD(v79) = v57;
                      _os_log_error_impl(&dword_19E8FE000, v54, OS_LOG_TYPE_ERROR, "Failed to create an nw_interface object with interface index %d", buf, 8u);
                    }
                  }

                }
                v50 += 18;
              }
              while (v50 != 72);
              objc_msgSend(v13, "setMultipathSubflowSwitchCounts:", v74);
              objc_msgSend(v13, "setMultipathSubflowCount:", *v51);
              objc_msgSend(v13, "setMultipathConnectedSubflowCount:", *v51);

              v17 = v75;
            }
            if (v15)
              objc_msgSend(v13, "setMultipathPrimarySubflowInterfaceIndex:", nw_interface_get_index(v15));
            objc_msgSend(v13, "setIsMultipath:", 1);
            freemptcpinfo();
            v27 = v77;
            v16 = v68;
            LOBYTE(v26) = v70;
          }
          if (v27)
            goto LABEL_87;
        }
        else
        {
          v25 = 0;
          LOBYTE(v26) = 0;
          v28 = 0xFFFFFFFFLL;
        }
        v49 = v69;
        v23 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((_QWORD *)v69->callbacks + 28);
      }
      else
      {
        v49 = a8;
        v25 = 0;
        LOBYTE(v26) = 0;
        v28 = 0xFFFFFFFFLL;
      }
      v58 = v23(v49, 1, &v77);
      v59 = (unsigned int *)v58;
      if (v58 && v77 == 408)
      {
        objc_msgSend(v13, "interfaceName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          if (!v25)
            v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v61 = objc_alloc(MEMORY[0x1E0C99D50]);
          v62 = (void *)objc_msgSend(v61, "initWithBytesNoCopy:length:", v59, v77);
          objc_msgSend(v13, "interfaceName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v62, v63);

          v64 = v59[6];
          if ((_DWORD)v64)
          {
            LODWORD(v65) = v59[7];
            if (v64 >= v65)
              v65 = v65;
            else
              v65 = 0;
            v66 = v64 - v65;
            if (v66 < v28)
              v28 = v66;
          }
          v26 = (v59[61] >> 4) & 1;
          goto LABEL_87;
        }
      }
      else if (!v58)
      {
LABEL_87:
        v48 = v26 & 1;
        goto LABEL_88;
      }
      free(v59);
      goto LABEL_87;
    }
  }
  v48 = 0;
  v25 = 0;
  v28 = 0xFFFFFFFFLL;
LABEL_88:
  objc_msgSend(v13, "setTCPInfo:", v25);
  objc_msgSend(v13, "setMinimumRTT:", v28);
  objc_msgSend(v13, "setTFOSucceeded:", v48);

}

+ (BOOL)hasPacketDrop:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "state") && objc_msgSend(v4, "state") != 5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "TCPInfo", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v7);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v4, "TCPInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "length") == 408)
          {
            v13 = objc_retainAutorelease(v12);
            if (*(_QWORD *)(objc_msgSend(v13, "bytes") + 84))
            {

              LOBYTE(v5) = 1;
              goto LABEL_17;
            }
          }

        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)stripWhitespace:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s+"), &stru_1E4138CF8, 1024, 0, objc_msgSend(v3, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4
{
  void *v4;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = malloc_type_malloc((2 * a4) | 1, 0x1826C6ECuLL);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 2;
      do
      {
        sprintf(&v8[v10 - 2], "%x", *((char *)a3 + v9++));
        if (v9 >= a4)
          break;
        v11 = v10 >= 2 * a4 - 1;
        v10 += 2;
      }
      while (!v11);
      v8[2 * a4] = 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v8, 4);
      free(v8);
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (void)parseXTimeout:(id)a3 hardTTLInSeconds:(double *)a4
{
  double v5;
  double v6;
  BOOL v7;
  double v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    v6 = v5 * 60.0;
    v7 = v5 <= 0.0;
    v8 = 92160.0;
    if (!v7)
      v8 = v6;
    if (v8 > 151200.0)
      v8 = 151200.0;
  }
  else
  {
    v8 = 92160.0;
  }
  *a4 = v8;

}

+ (id)parseXHost:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (objc_msgSend(v4, "count"))
    {
      v7 = 0;
      *(_QWORD *)&v5 = 138412290;
      v13 = v5;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7, v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPUtilities endpointFromString:defaultPortString:](NPUtilities, "endpointFromString:defaultPortString:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
          objc_msgSend(v6, "addObject:", v9);
        }
        else
        {
          nplog_obj();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v13;
            v15 = v11;
            _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Invalid host specification: %@", buf, 0xCu);

          }
        }

        ++v7;
      }
      while (v7 < objc_msgSend(v4, "count"));
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)parseXRTT:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "integerValue"))
        v6 = objc_msgSend(v5, "integerValue") / 1000 + 1;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)copyBase64HeaderValueFromData:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *ifstate;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "status") == 1)
  {
    objc_msgSend(v3, "interface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && nwi_state_copy())
    {
      objc_msgSend(v5, "UTF8String");
      ifstate = (void *)nwi_state_get_ifstate();
      if (ifstate)
      {
        if ((nwi_ifstate_get_flags() & 3) != 0)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          nwi_ifstate_get_signature();
          nwi_ifstate_get_signature();
          objc_msgSend(v7, "appendBytes:length:", "default_signature", 18);
          v8 = ((unint64_t)nwi_ifstate_get_flags() >> 1) & 1;
          v13[0] = v7;
          v12[0] = CFSTR("Signature");
          v12[1] = CFSTR("InterfaceType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "type"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13[1] = v9;
          v12[2] = CFSTR("HasIPv6");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13[2] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
          ifstate = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          ifstate = 0;
        }
      }
      nwi_state_release();
    }
    else
    {
      ifstate = 0;
    }

  }
  else
  {
    ifstate = 0;
  }

  return ifstate;
}

+ (id)connectionInfoToDict:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v67;
  id obj;
  uint64_t v69;
  id v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD v77[5];
  char v78[128];
  char v79[8];
  uint64_t v80;
  char v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  *(_QWORD *)v79 = 0;
  v80 = 0;
  v81 = 0;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_57;
  }
  if (!v6)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_msgSend(v5, "pathType");
  if (v8 > 5)
    v9 = 0;
  else
    v9 = off_1E4137640[v8];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PathType"));
  if (objc_msgSend(v5, "pathType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "fallbackReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("FallbackReasonNumber"));

    +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", objc_msgSend(v5, "fallbackReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("FallbackReason"));

    v13 = objc_msgSend(v5, "fallbackReasonCategory");
    if (v13 <= 4)
      v9 = off_1E4137670[v13];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("FallbackCategory"));
    v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v5, "fallbackDelay");
    v15 = (__CFString *)objc_msgSend(v14, "initWithDouble:");
    v16 = CFSTR("FallbackDelay");
    v17 = v7;
    v18 = v15;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "pathType") == 1)
  {
    v19 = objc_msgSend(v5, "edgeType");
    if (v19 <= 3)
      v9 = off_1E4137698[v19];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("EdgeType"));
    objc_msgSend(v5, "edgeAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v5, "edgeAddress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("EdgeAddress"));

    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("EdgeAddress"));
    }

    objc_msgSend(v5, "firstTxByteTimeStamp");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v5, "firstTxByteTimeStamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("tunnelFirstTxByteTimestamp"));

      goto LABEL_21;
    }
    v18 = CFSTR("unknown");
    v16 = CFSTR("tunnelFirstTxByteTimestamp");
    v17 = v7;
LABEL_12:
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v16);
LABEL_21:

  }
  if (objc_msgSend(v5, "isMultipath"))
    v24 = CFSTR("yes");
  else
    v24 = CFSTR("no");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("IsMultipath"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "multipathSubflowCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("SubflowCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "multipathConnectedSubflowCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("ConnectedSubflowCount"));

  if (objc_msgSend(v5, "isTFOProbeSucceeded"))
    v27 = CFSTR("yes");
  else
    v27 = CFSTR("no");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("IsTFOProbeSucceeded"));
  if (if_indextoname(objc_msgSend(v5, "multipathPrimarySubflowInterfaceIndex"), v79))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v79);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("PrimarySubflowInterface"));

  }
  objc_msgSend(v5, "multipathSubflowSwitchCounts");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v5, "multipathSubflowSwitchCounts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      objc_msgSend(v5, "multipathSubflowSwitchCounts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("SwitchCounts"));

    }
  }
  objc_msgSend(v5, "connectionDelay");
  if (v34 > 0.0)
  {
    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "connectionDelay");
    objc_msgSend(v35, "numberWithDouble:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("ConnectionDelay"));

  }
  objc_msgSend(v5, "firstTxByteDelay");
  if (v37 > 0.0)
  {
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "firstTxByteDelay");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("FirstTxByteDelay"));

  }
  objc_msgSend(v5, "timeToFirstByte");
  if (v40 > 0.0)
  {
    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "timeToFirstByte");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, CFSTR("TimeToFirstByte"));

  }
  if (objc_msgSend(v5, "tunnelConnectionError"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "tunnelConnectionError"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v43, CFSTR("ConnectionError"));

  }
  objc_msgSend(v5, "TCPInfo");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    objc_msgSend(v5, "TCPInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47)
    {
      v67 = v7;
      v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v5, "TCPInfo");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      if (v71)
      {
        v69 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v73 != v69)
              objc_enumerationMutation(obj);
            v49 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v5, "TCPInfo");
            v50 = v5;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = objc_retainAutorelease(v52);
            v54 = objc_msgSend(v53, "bytes");
            v76[0] = CFSTR("TxBytes");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v54 + 76));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v77[0] = v55;
            v76[1] = CFSTR("TxPackets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v54 + 68));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v77[1] = v56;
            v76[2] = CFSTR("RxBytes");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v54 + 108));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v77[2] = v57;
            v76[3] = CFSTR("RxPackets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v54 + 100));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v77[3] = v58;
            v76[4] = CFSTR("Resend");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v54 + 284));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v77[4] = v59;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 5);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v70, "setObject:forKeyedSubscript:", v60, v49);
            v5 = v50;
          }
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        }
        while (v71);
      }

      v7 = v67;
      objc_msgSend(v67, "setObject:forKeyedSubscript:", v70, CFSTR("TCPMetrics"));

    }
  }
  objc_msgSend(v5, "timeIntervalSinceLastUsage");
  if (v61 > 0.0)
  {
    v62 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "timeIntervalSinceLastUsage");
    objc_msgSend(v62, "numberWithDouble:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v63, CFSTR("TimeSinceLastUsage"));

  }
  if (objc_msgSend(v5, "TFOSucceeded"))
    v64 = CFSTR("yes");
  else
    v64 = CFSTR("no");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, CFSTR("TFOSucceeded"));
  objc_msgSend(v5, "timingIntervals");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v65, CFSTR("TimingIntervals"));

  v7 = v7;
  v10 = v7;
LABEL_57:

  return v10;
}

+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  const char *v11;
  id v12;
  id v14;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v5))
  {
    printf("%s are not a valid JSON object\n", (const char *)objc_msgSend(v6, "UTF8String"));
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v7)
  {
    v11 = (const char *)objc_msgSend(v6, "UTF8String");
    objc_msgSend(v8, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Failed to create JSON data from the %s: %s\n", v11, (const char *)objc_msgSend(v12, "UTF8String"));

    goto LABEL_6;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  puts((const char *)objc_msgSend(v9, "UTF8String"));

  v10 = 1;
LABEL_7:

  return v10;
}

+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 3)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "isEqualToString:", CFSTR("_tcp")))
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)(objc_msgSend(v9, "count") - 4) > 0xFFFFFFFFFFFFFFFCLL)
            {
              v22 = v19;
            }
            else
            {
              v20 = 2;
              do
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(".%@"), v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                ++v20;
                v19 = v22;
              }
              while (v20 < objc_msgSend(v9, "count") - 1);
            }
            objc_msgSend(MEMORY[0x1E0CCEC60], "endpointWithName:type:domain:", v24, v22, v18);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CCEC80], "endpointWithHostname:port:", v6, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CCEC80];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endpointWithHostname:port:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_22:

  return v17;
}

+ (BOOL)compareAddressEndpoints:(id)a3 endpoint2:(id)a4 addressOnly:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = (unsigned __int8 *)objc_msgSend(v7, "address");
      v11 = (unsigned __int8 *)objc_msgSend(v9, "address");
      v12 = v10[1];
      if (v12 == v11[1])
      {
        if (v12 == 30)
        {
          if (*v10 >= 0x1Cu
            && *v11 >= 0x1Cu
            && (a5 || *((unsigned __int16 *)v10 + 1) == *((unsigned __int16 *)v11 + 1)))
          {
            v13 = *((_QWORD *)v10 + 1) == *((_QWORD *)v11 + 1) && *((_QWORD *)v10 + 2) == *((_QWORD *)v11 + 2);
            goto LABEL_22;
          }
        }
        else if (v12 == 2
               && *v10 >= 0x10u
               && *v11 >= 0x10u
               && (a5 || *((unsigned __int16 *)v10 + 1) == *((unsigned __int16 *)v11 + 1)))
        {
          v13 = *((_DWORD *)v10 + 1) == *((_DWORD *)v11 + 1);
LABEL_22:
          v14 = v13;
          goto LABEL_17;
        }
      }
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  v14 = 0;
LABEL_18:

  return v14;
}

+ (id)getInterfaceTypeString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Other");
  else
    return off_1E41376B8[a3 - 1];
}

+ (BOOL)rollDiceWithSuccessRatio:(id)a3
{
  id v3;
  double v4;
  NSObject *v5;
  double v6;
  BOOL v7;
  NSObject *v8;
  unsigned int bytes;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 4uLL, &bytes) < 0)
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed", buf, 2u);
    }

    v7 = 0;
  }
  else
  {
    v4 = (double)(bytes % 0x2710) / 10000.0;
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v4;
      _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Random ratio %f", buf, 0xCu);
    }

    objc_msgSend(v3, "doubleValue");
    v7 = v4 < v6;
  }

  return v7;
}

+ (id)timestampIdentifierToName:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return CFSTR("EnableNSP");
  else
    return off_1E41376D0[a3 - 1];
}

+ (id)getHashForObject:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD0810], "hashObject:withClassPrefixWhitelist:", a3, &unk_1E4151660);
}

+ (id)copyDataHexString:(id)a3
{
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  const __CFString *v10;
  char v12;
  _BYTE v13[255];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v13;
    memset(v13, 0, sizeof(v13));
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v12 = 60;
    if (objc_msgSend(v5, "length"))
    {
      v7 = 0;
      do
      {
        snprintf(v4, 3uLL, "%02x", *(unsigned __int8 *)(v6 + v7));
        v8 = v4 + 2;
        v9 = v4 + 2 - &v12;
        if (v7 && (v7 & 3) == 0 && v9 <= 254)
        {
          v4[2] = 32;
          v8 = v4 + 3;
          v9 = v4 + 3 - &v12;
        }
        if (++v7 >= (unint64_t)objc_msgSend(v5, "length"))
          break;
        v4 = v8;
      }
      while (v9 < 254);
      if (v9 > 254)
        goto LABEL_15;
    }
    else
    {
      v8 = v13;
    }
    *v8++ = 62;
LABEL_15:
    *v8 = 0;
    v10 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", &v12);
    goto LABEL_16;
  }
  v10 = &stru_1E4138CF8;
LABEL_16:

  return (id)v10;
}

+ (id)copyNetworkDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("InterfaceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Signature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", (int)objc_msgSend(v4, "intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[NPUtilities copyDataHexString:](NPUtilities, "copyDataHexString:", v5);
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("(%@): %@"), v7, v8);

  return v9;
}

+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3
{
  CFAbsoluteTime v3;
  CFAbsoluteTime v4;
  const __CFDate *v5;
  int64_t v6;
  CFAbsoluteTime v7;
  CFAbsoluteTime v8;
  const __CFDate *v9;
  double Current;
  const __CFDate *v11;
  const __CFDate *v12;
  NSObject *v13;
  __CFCalendar *v14;
  __CFCalendar *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    SecCertificateNotValidBefore();
    v4 = v3;
    if (v3 == 0.0)
      v5 = 0;
    else
      v5 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3);
    SecCertificateNotValidAfter();
    v8 = v7;
    if (v7 == 0.0)
      v9 = 0;
    else
      v9 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
    Current = CFAbsoluteTimeGetCurrent();
    if (Current == 0.0)
    {
      v12 = 0;
      v6 = 4;
    }
    else
    {
      v11 = CFDateCreate(0, Current);
      v12 = v11;
      v6 = 4;
      if (v5 && v11)
      {
        if (CFDateCompare(v11, v5, 0) == kCFCompareLessThan)
        {
          nplog_obj();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v6 = 2;
            _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_INFO, "Current time before valid time", buf, 2u);
          }
          else
          {
            v6 = 2;
          }
LABEL_23:

          v20 = 0;
          v21 = 0;
          v19 = 0;
          v14 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
          if (v14)
          {
            v15 = v14;
            CFCalendarDecomposeAbsoluteTime(v14, v4, "yMdHm", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v19);
            nplog_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              v23 = HIDWORD(v21);
              v24 = 1024;
              v25 = v21;
              v26 = 1024;
              v27 = HIDWORD(v20);
              v28 = 1024;
              v29 = v20;
              v30 = 1024;
              v31 = v19;
              _os_log_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_INFO, "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
            }

            CFCalendarDecomposeAbsoluteTime(v15, v8, "yMdHm", (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, &v19);
            nplog_obj();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              v23 = HIDWORD(v21);
              v24 = 1024;
              v25 = v21;
              v26 = 1024;
              v27 = HIDWORD(v20);
              v28 = 1024;
              v29 = v20;
              v30 = 1024;
              v31 = v19;
              _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_INFO, "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
            }

            CFRelease(v15);
          }
          goto LABEL_29;
        }
        if (v9 && CFDateCompare(v12, v9, 0) == kCFCompareGreaterThan)
        {
          nplog_obj();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_INFO, "Current time after valid time", buf, 2u);
          }
          v6 = 3;
          goto LABEL_23;
        }
        v6 = 1;
      }
    }
LABEL_29:
    CFRelease(v5);
    CFRelease(v9);
    CFRelease(v12);
    return v6;
  }
  return 4;
}

+ (void)postNotification:(id)a3 value:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int out_token;

  v5 = a3;
  NPGetInternalQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  out_token = -1;
  if (!notify_register_check((const char *)objc_msgSend(v5, "UTF8String"), &out_token))
  {
    v7 = 0;
    if (notify_get_state(out_token, &v7) || v7 != a4)
    {
      v7 = a4;
      if (!notify_set_state(out_token, a4))
        notify_post((const char *)objc_msgSend(v5, "UTF8String"));
    }
    notify_cancel(out_token);
  }

}

+ (id)copyTrueClientIPAddressFromPreferences
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!os_variant_allows_internal_security_policies())
    return 0;
  CFPreferencesCopyAppValue(CFSTR("NSPTrueClientIPAddress"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    nplog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "Detected true client ip address in preferences file: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromLinkQualityValue:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = CFSTR("Invalid");
  v4 = CFSTR("Minimally Viable");
  v5 = CFSTR("Poor");
  v6 = CFSTR("Good");
  if (a3 != 100)
    v6 = CFSTR("Invalid");
  if (a3 != 50)
    v5 = v6;
  if (a3 != 20)
    v4 = v5;
  if (a3 == 10)
    v3 = CFSTR("Bad");
  if (a3 == -1)
    v3 = CFSTR("Unknown");
  if (a3 == -2)
    v3 = CFSTR("Off");
  if (a3 <= 19)
    v7 = v3;
  else
    v7 = v4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (%d)"), v7, *(_QWORD *)&a3);
}

+ (id)machoUUIDFromPID:(int)a3
{
  void *v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  _OWORD buffer[3];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  memset(buffer, 0, sizeof(buffer));
  v4 = 0;
  if (proc_pidinfo(a3, 17, 1uLL, buffer, 56) == 56)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109378;
    v7[1] = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Mach-O UUID for process PID=%d is %@", (uint8_t *)v7, 0x12u);
  }

  return v4;
}

+ (int)pidFromAuditToken:(id *)a3
{
  return a3->var0[5];
}

+ (id)createAddressStringFromBuffer:(unint64_t)a3 addressLen:(uint64_t)a4 family:
{
  int v7;
  void *v9;
  char v10[64];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  if (a4 == 2)
  {
    v7 = 2;
  }
  else
  {
    v9 = 0;
    if (a3 < 0x10 || a4 != 30)
      return v9;
    v7 = 30;
  }
  inet_ntop(v7, a2, v10, 0x40u);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  int v11;
  int __b;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __b = 136315138;
      v13 = "+[NPUtilities createMaskedIPv4Address:prefix:]";
      _os_log_fault_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&__b, 0xCu);
    }
    goto LABEL_13;
  }
  v6 = a3;
  objc_opt_self();
  if (a4 >= 0x21)
  {
    v7 = 0;
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  __b = 0;
  if (a4 >= 8)
  {
    v8 = a4 >> 3;
    memset(&__b, 255, a4 >> 3);
  }
  else
  {
    v8 = 0;
  }
  if ((a4 & 7) != 0)
    *((_BYTE *)&__b + v8) = 0xFF00u >> (a4 & 7);
  +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 4uLL, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_13;
  v11 = 0;
  __b = 0;
  inet_pton(2, (const char *)objc_msgSend(v6, "UTF8String"), &__b);
  inet_pton(2, (const char *)-[NSObject UTF8String](v7, "UTF8String"), &v11);
  __b &= v11;
  +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 4uLL, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v9;
}

+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  int8x16_t v10;
  int8x16_t __b;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __b.i32[0] = 136315138;
      *(uint64_t *)((char *)__b.i64 + 4) = (uint64_t)"+[NPUtilities createMaskedIPv6Address:prefix:]";
      _os_log_fault_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&__b, 0xCu);
    }
    goto LABEL_10;
  }
  objc_opt_self();
  v6 = 0;
  __b = 0uLL;
  if (a4 >= 8)
  {
    v6 = a4 >> 3;
    memset(&__b, 255, a4 >> 3);
  }
  if ((a4 & 7) != 0)
    __b.i8[v6] = 0xFF00u >> (a4 & 7);
  +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 0x10uLL, 30);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  __b = 0uLL;
  v10 = 0uLL;
  inet_pton(30, (const char *)objc_msgSend(v5, "UTF8String"), &__b);
  inet_pton(30, (const char *)-[NSObject UTF8String](v7, "UTF8String"), &v10);
  __b = vandq_s8(v10, __b);
  +[NPUtilities createAddressStringFromBuffer:addressLen:family:]((uint64_t)NPUtilities, &__b, 0x10uLL, 30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v8;
}

@end
