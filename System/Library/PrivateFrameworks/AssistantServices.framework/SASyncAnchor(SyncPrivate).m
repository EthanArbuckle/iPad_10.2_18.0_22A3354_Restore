@implementation SASyncAnchor(SyncPrivate)

+ (id)_af_normalizedKeyForKey:()SyncPrivate appBundleID:syncSlotName:
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  if (a4)
    v7 = a4;
  else
    v7 = &stru_1E3A37708;
  v8 = v7;
  v9 = a5;
  v10 = a3;
  if (v9)
    v11 = v9;
  else
    v11 = &stru_1E3A37708;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@#%@#%@"), v10, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_af_normalizedKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "appMetaData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_af_preferredBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncSlots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_af_normalizedKeyForKey:appBundleID:syncSlotName:", v7, v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)_af_isValid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  int v18;
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "appMetaData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appIdentifyingInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri.appIntentSupportPolicyAndVocab")))
    {
      if (objc_msgSend(v5, "length"))
      {
        v7 = v5;
        v8 = v7;
        if (v7 == CFSTR("com.apple.ShortcutsActions")
          || v7 && (v9 = objc_msgSend(CFSTR("com.apple.ShortcutsActions"), "isEqual:", v7), v8, v9))
        {
          v10 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            v18 = 136315394;
            v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
            v20 = 2112;
            v21 = v8;
            _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s ShortcutsActions received in %@ anchor key, marking as invalid and skipping", (uint8_t *)&v18, 0x16u);
          }
          goto LABEL_23;
        }
LABEL_15:
        v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
      v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315138;
        v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
        v16 = "%s SASyncAppMetaData has no bundleID, but it is required for this key";
LABEL_22:
        _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (!objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri.vocabularyupdates")))
        goto LABEL_15;
      objc_msgSend(v3, "syncSlots");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 == 1)
      {
        if (objc_msgSend(v6, "length"))
          goto LABEL_15;
        v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315138;
          v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
          v16 = "%s SASyncAppMetaData has no -applicationClientIdentifier, as required for this key";
          goto LABEL_22;
        }
      }
      else
      {
        v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315138;
          v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
          v16 = "%s SASyncAppMetaData does not have exactly one -syncSlots, as required for this key";
          goto LABEL_22;
        }
      }
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v18 = 136315138;
    v19 = "-[SASyncAnchor(SyncPrivate) _af_isValid]";
    _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Sync info is missing a key", (uint8_t *)&v18, 0xCu);
  }
  v12 = 0;
LABEL_25:

  return v12;
}

@end
