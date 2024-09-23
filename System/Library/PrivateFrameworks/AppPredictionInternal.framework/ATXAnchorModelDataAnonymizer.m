@implementation ATXAnchorModelDataAnonymizer

+ (void)anonymizeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[16];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Anchor Model Data Collection: starting anonymization procedure for log entry message...", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "readDeviceSpecificSalt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anchorEventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ATXAnchorModelSha256Hash(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorEventIdentifier:", v9);

  objc_msgSend(v4, "anchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ATXAnchorModelSha256Hash(v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocationIdentifier:", v13);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "positiveAppLaunches");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v19);
        v21 = (void *)objc_opt_class();
        objc_msgSend(v20, "bundleId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = objc_msgSend(v21, "shouldAnonymizeBundle:", v22);

        if ((_DWORD)v21)
        {
          objc_msgSend(v20, "bundleId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _ATXAnchorModelSha256Hash(v23, v6);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setBundleId:", v24);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v17);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v4, "negativeAppLaunches", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v39;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v29);
        v31 = (void *)objc_opt_class();
        objc_msgSend(v30, "bundleId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31) = objc_msgSend(v31, "shouldAnonymizeBundle:", v32);

        if ((_DWORD)v31)
        {
          objc_msgSend(v30, "bundleId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _ATXAnchorModelSha256Hash(v33, v6);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setBundleId:", v34);

        }
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v27);
  }

  objc_msgSend(v4, "positiveActions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hashAndSaltActionKeyMetadataIfNeededInList:withSalt:", v35, v6);

  objc_msgSend(v4, "negativeActions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hashAndSaltActionKeyMetadataIfNeededInList:withSalt:", v36, v6);

  __atxlog_handle_default();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "Anchor Model Data Collection: finished anonymization procedure for log entry message.", buf, 2u);
  }

}

+ (void)_hashAndSaltActionKeyMetadataIfNeededInList:(id)a3 withSalt:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "appLaunchMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "actionKeyMetadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "actionType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend((id)objc_opt_class(), "shouldAnonymizeBundle:", v13))
        {
          _ATXAnchorModelSha256Hash(v13, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appLaunchMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBundleId:", v16);

        }
        if (objc_msgSend((id)objc_opt_class(), "shouldAnonymizeActionType:forBundleId:", v15, v13))
        {
          _ATXAnchorModelSha256Hash(v15, v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "actionKeyMetadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setActionType:", v18);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isSystemAppForBundleId:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."));

  return v4;
}

+ (BOOL)shouldAnonymizeBundle:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isFirstPartyApp:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "whitelistedBundlesForAnchorModelLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 == 0;

  }
  return v5;
}

+ (BOOL)shouldAnonymizeActionType:(id)a3 forBundleId:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;

  v6 = a3;
  if ((objc_msgSend(a1, "isFirstPartyApp:", a4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "whitelistedActionTypesForAnchorModelLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    objc_msgSend(v8, "approvedSiriKitIntents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v6);

    v7 = v11 & ~v13;
  }

  return v7;
}

+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __SecRandom *v8;
  id v9;
  NSObject *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v9 = objc_retainAutorelease(v7);
  if (SecRandomCopyBytes(v8, 0x20uLL, (void *)objc_msgSend(v9, "mutableBytes")))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "setObject:forKey:", v11, v6);
      goto LABEL_8;
    }
  }
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    +[ATXAnchorModelDataAnonymizer setSaltToUserDefaults:scheme:].cold.1(v10);

  v11 = 0;
LABEL_8:

  return v11;
}

+ (id)readDeviceSpecificSalt
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "dataForKey:", CFSTR("ATXAnchorModelOfflineDataHarvesterDeviceSpecificSalt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "setSaltToUserDefaults:scheme:", v3, CFSTR("ATXAnchorModelOfflineDataHarvesterDeviceSpecificSalt"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "Anchor Model Data Collection: Created a new salt for data collection.", v7, 2u);
    }

  }
  return v4;
}

+ (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Anchor Model Data Collection: Tried to generate a salt for data collection, but got back an empty NSData object", v1, 2u);
}

@end
