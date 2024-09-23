@implementation _INSiriAuthorizationManager

+ (BOOL)_isSiriAuthorizationRestricted
{
  return TCCAccessRestricted() != 0;
}

+ (void)_requestSiriAuthorization:(id)a3 auditToken:(id *)a4
{
  id v6;
  NSObject *v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  __int128 v12;

  v6 = a3;
  if (v6)
  {
    if ((objc_msgSend(a1, "_siriEnabled") & 1) != 0)
    {
      dispatch_get_global_queue(25, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke;
      block[3] = &unk_1E228D728;
      v8 = *(_OWORD *)&a4->var0[4];
      v11 = *(_OWORD *)a4->var0;
      v12 = v8;
      v10 = v6;
      dispatch_async(v7, block);

    }
    else
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 2);
    }
  }

}

+ (int64_t)_rawSiriAuthorizationStatusForAppID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  int64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "_siriEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA5808]))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_6;
      objc_msgSend(v5, "containingBundle");
      v6 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_6:
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v18 = 136315650;
      v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Resolved appBundleProxy: %@ for appID: %@", (uint8_t *)&v18, 0x20u);
    }
    if (v5)
    {
      objc_msgSend(v5, "bundleType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CA5820]) & 1) != 0)
      {
        v10 = 3;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v5, "bundleType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CA57F0]);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(a1, "_tccAccessInfoForBundle:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          v18 = 136315650;
          v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
          v20 = 2112;
          v21 = v5;
          v22 = 2112;
          v23 = v9;
          _os_log_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_INFO, "%s TCC access for %@: %@", (uint8_t *)&v18, 0x20u);
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DB11B0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          if (objc_msgSend(v15, "BOOLValue"))
            v10 = 3;
          else
            v10 = 2;
        }
        else
        {
          v10 = 0;
        }

        goto LABEL_24;
      }
    }
    v10 = 3;
LABEL_25:

    goto LABEL_26;
  }
  v11 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "+[_INSiriAuthorizationManager _rawSiriAuthorizationStatusForAppID:]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Siri is not enabled on this device, therefore Siri cannot be authorized for %@", (uint8_t *)&v18, 0x16u);
  }
  v10 = 2;
LABEL_26:

  return v10;
}

+ (BOOL)_siriEnabled
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getAFPreferencesClass_softClass_50536;
  v11 = getAFPreferencesClass_softClass_50536;
  if (!getAFPreferencesClass_softClass_50536)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getAFPreferencesClass_block_invoke_50537;
    v7[3] = &unk_1E22953C0;
    v7[4] = &v8;
    __getAFPreferencesClass_block_invoke_50537((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  return v5;
}

+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3 intentSlot:(id)a4
{
  id v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  __int128 *p_buf;
  id v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AutoShortcutNameType")))
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]";
      _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s IntentSlot is App Shortcut, authorizing", (uint8_t *)&buf, 0xCu);
    }
    v8 = 3;
  }
  else if (v6)
  {
    if (_siriAuthorizationStatusForAppID_intentSlot__onceToken != -1)
      dispatch_once(&_siriAuthorizationStatusForAppID_intentSlot__onceToken, &__block_literal_global_50546);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2020000000;
    v17 = 0;
    v9 = _siriAuthorizationStatusForAppID_intentSlot__queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_10;
    block[3] = &unk_1E228D7D8;
    v12 = v6;
    p_buf = &buf;
    v14 = a1;
    dispatch_sync(v9, block);
    v8 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

+ (int64_t)_siriAuthorizationStatusForAppID:(id)a3
{
  return objc_msgSend(a1, "_siriAuthorizationStatusForAppID:intentSlot:", a3, 0);
}

+ (id)_tccAccessInfoForBundle:(id)a3
{
  id v3;
  void *v4;
  CFBundleRef v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  CFBundleRef cf;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v18 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "+[_INSiriAuthorizationManager _tccAccessInfoForBundle:]";
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v3;
      _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Could not lookup TCC info for nil bundleURL: %@ bundle: %@", buf, 0x20u);
    }
    goto LABEL_13;
  }
  v5 = CFBundleCreate(0, (CFURLRef)objc_msgSend(v3, "bundleURL"));
  if (!v5)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  cf = v5;
  v21 = v4;
  v6 = (void *)TCCAccessCopyInformationForBundle();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = (_QWORD *)MEMORY[0x1E0DB10B8];
    v13 = (_QWORD *)MEMORY[0x1E0DB10A8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", *v12, cf);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v17, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v10);
  }

  CFRelease(cf);
  v4 = v21;
LABEL_14:

  return v7;
}

@end
