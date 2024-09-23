@implementation AFSiriDataSharingSensitivityManager

- (AFSiriDataSharingSensitivityManager)init
{
  AFSiriDataSharingSensitivityManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  TRIClient *client;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)AFSiriDataSharingSensitivityManager;
  v2 = -[AFSiriDataSharingSensitivityManager init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getTRIClientClass_softClass;
    v13 = getTRIClientClass_softClass;
    if (!getTRIClientClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTRIClientClass_block_invoke;
      v9[3] = &unk_1E3A365A8;
      v9[4] = &v10;
      __getTRIClientClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v4, "clientWithIdentifier:", 317);
    v5 = objc_claimAutoreleasedReturnValue();
    client = v2->_client;
    v2->_client = (TRIClient *)v5;

    -[AFSiriDataSharingSensitivityManager _registerUpdateHandler](v2, "_registerUpdateHandler");
  }
  return v2;
}

- (BOOL)isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (+[AFFeatureFlags isOptOutLogRedactionEnabled](AFFeatureFlags, "isOptOutLogRedactionEnabled"))
  {
    v9 = -[AFSiriDataSharingSensitivityManager _isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:](self, "_isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:", a3, a4, v8);
    v10 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      if (v9)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if ((unint64_t)(a3 - 1) > 2)
        v12 = CFSTR("AFSiriDataSharingSensitivityPolicyUnknown");
      else
        v12 = off_1E3A34640[a3 - 1];
      v14 = v10;
      if ((unint64_t)a4 > 3)
        v15 = CFSTR("(unknown)");
      else
        v15 = off_1E3A35998[a4];
      v16 = v15;
      v18 = 136316162;
      v19 = "-[AFSiriDataSharingSensitivityManager isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:]";
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s Request is sensitive:%@ with policy:%@, optInStatus:%@, siriLanguage:%@", (uint8_t *)&v18, 0x34u);

    }
  }
  else
  {
    v13 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315138;
      v19 = "-[AFSiriDataSharingSensitivityManager isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:]";
      _os_log_debug_impl(&dword_19AF50000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureFlag opt_out_log_redaction disabled. Skipping.", (uint8_t *)&v18, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isOptedOutOfMTE
{
  void *v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AFSiriDataSharingSensitivityManager _iOSIsOptedOutOfMTEWithOptInStatus:supportsUOD:](self, "_iOSIsOptedOutOfMTEWithOptInStatus:supportsUOD:", objc_msgSend(v3, "siriDataSharingOptInStatus"), AFDeviceSupportsSiriUOD());

  return (char)self;
}

- (void)_registerUpdateHandler
{
  NSObject *v3;
  void *v4;
  TRIClient *client;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFSiriDataSharingSensitivityManager _registerUpdateHandler]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s Registering update handler", buf, 0xCu);
  }
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__AFSiriDataSharingSensitivityManager__registerUpdateHandler__block_invoke;
  v11 = &unk_1E3A34608;
  objc_copyWeak(&v12, &location);
  v4 = (void *)MEMORY[0x1A1AC0C3C](&v8);
  client = self->_client;
  objc_msgSend(getTRINamespaceClass(), "namespaceNameFromId:", 1571, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](client, "addUpdateHandlerForNamespaceName:usingBlock:", v6, v4);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)_isTrialConfigEnabledWithNamespaceId:(int)a3 factorName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v4 = *(_QWORD *)&a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(getTRINamespaceClass(), "namespaceNameFromId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](self->_client, "levelForFactor:withNamespaceName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "BOOLeanValue");
    v11 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v11;
      objc_msgSend(v12, "numberWithBool:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "-[AFSiriDataSharingSensitivityManager _isTrialConfigEnabledWithNamespaceId:factorName:]";
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s TRILevel %@: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    v15 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[AFSiriDataSharingSensitivityManager _isTrialConfigEnabledWithNamespaceId:factorName:]";
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s TRILevel not found for factor: %@. Assuming feature disabled.", (uint8_t *)&v17, 0x16u);
    }
    v23 = CFSTR("Factor");
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)_isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5
{
  id v8;
  BOOL v9;
  BOOL v10;

  v8 = a5;
  if (a4 != 1)
  {
    switch(a3)
    {
      case 0:
        v9 = -[AFSiriDataSharingSensitivityManager _isRequestSensitiveForUnknownPolicy](self, "_isRequestSensitiveForUnknownPolicy");
        goto LABEL_9;
      case 3:
        v9 = -[AFSiriDataSharingSensitivityManager _isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:](self, "_isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:", v8);
        goto LABEL_9;
      case 2:
        v9 = -[AFSiriDataSharingSensitivityManager _isRequestSensitiveForSensitiveDomainPolicy](self, "_isRequestSensitiveForSensitiveDomainPolicy");
LABEL_9:
        v10 = v9;
        goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_isRequestSensitiveForUnknownPolicy
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[AFSiriDataSharingSensitivityManager _isRequestSensitiveForUnknownPolicy]";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s Unknown sensitivity policy used. This should not happen! Assuming non-sensitive.", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (BOOL)_isRequestSensitiveForSensitiveDomainWithSamplingPolicyForLanguage:(id)a3
{
  return 0;
}

- (BOOL)_isTrialConfigForLogRedactionForMessagesEnabled
{
  return -[AFSiriDataSharingSensitivityManager _isTrialConfigEnabledWithNamespaceId:factorName:](self, "_isTrialConfigEnabledWithNamespaceId:factorName:", 1570, CFSTR("messages_log_redaction_enablement_status"));
}

- (BOOL)_iOSIsOptedOutOfMTEWithOptInStatus:(int64_t)a3 supportsUOD:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;
  void *v7;
  const __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3 != 1 && a4;
  v7 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v7;
    if ((unint64_t)a3 > 3)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_1E3A35998[a3];
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "-[AFSiriDataSharingSensitivityManager _iOSIsOptedOutOfMTEWithOptInStatus:supportsUOD:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s #MTEOptOut Should drop MTE for iOS device: %@ with optInStatus: %@, supportsUOD: %@", (uint8_t *)&v14, 0x2Au);

  }
  return v6;
}

- (BOOL)_macOSIsOptedOutOfMTEWithOptInStatus:(int64_t)a3 supportsGM:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;
  void *v7;
  const __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3 != 1 && a4;
  v7 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v7;
    if ((unint64_t)a3 > 3)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_1E3A35998[a3];
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "-[AFSiriDataSharingSensitivityManager _macOSIsOptedOutOfMTEWithOptInStatus:supportsGM:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s #MTEOptOut Should drop MTE for macOS device: %@ with optInStatus: %@, supportsGM: %@", (uint8_t *)&v14, 0x2Au);

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

void __61__AFSiriDataSharingSensitivityManager__registerUpdateHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id *WeakRetained;
  id *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_msgSend(v3, "namespaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[AFSiriDataSharingSensitivityManager _registerUpdateHandler]_block_invoke";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s New update for %@", (uint8_t *)&v9, 0x16u);

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[1], "refresh");

}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_33718);
  return (id)shared_shared;
}

void __45__AFSiriDataSharingSensitivityManager_shared__block_invoke()
{
  AFSiriDataSharingSensitivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(AFSiriDataSharingSensitivityManager);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

@end
