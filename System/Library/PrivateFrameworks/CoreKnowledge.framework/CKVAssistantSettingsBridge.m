@implementation CKVAssistantSettingsBridge

+ (BOOL)isSiriUODSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFShouldRunAsrOnServerForUOD();
}

+ (BOOL)isASRSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFOfflineDictationCapable();
}

+ (id)currentSiriLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

+ (id)currentDictationLanguageCodes
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0CD7F48]);
  objc_msgSend(v2, "installationStatusForLanguagesWithAssetType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__401;
  v11 = __Block_byref_object_dispose__402;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CKVAssistantSettingsBridge_currentDictationLanguageCodes__block_invoke;
  v6[3] = &unk_1E4D29050;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (BOOL)isSpeechProfileEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLinkVocabularyEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)getConformingSharedUserIds
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "+[CKVAssistantSettingsBridge getConformingSharedUserIds]";
    _os_log_error_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_ERROR, "%s Unexpected call to getConformingSharedUserIds from non-tvOS platform, returning empty results", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isAssistantEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

+ (BOOL)isDictationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationIsEnabled");

  return v3;
}

void __59__CKVAssistantSettingsBridge_currentDictationLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (AFOfflineDictationStatusStringIsInstalled())
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

- (CKVAssistantSettingsBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
