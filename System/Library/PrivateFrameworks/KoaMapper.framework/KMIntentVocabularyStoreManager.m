@implementation KMIntentVocabularyStoreManager

- (id)savedCustomVocabularyOverviewDictionary
{
  return (id)objc_msgSend(MEMORY[0x24BDDA388], "savedCustomVocabularyOverviewDictionary");
}

- (id)resolveIntentSlotsForApp:(id)a3 fromAllAppsOverview:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  int v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (__CFString *)objc_msgSend(v6, "copy");
  v8 = objc_msgSend(CFSTR("com.apple.VoiceShortcuts"), "isEqualToString:", v6);

  if (v8)
  {

    v7 = CFSTR("com.apple.siriVoiceShortcuts");
  }
  objc_msgSend(v5, "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)storedVocabularyForApp:(id)a3 intentSlot:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDDA388], "managerForBundleID:bundlePath:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v8 = (id)objc_msgSend(v7, "getPathToLatestVocabulary:pathDuringReading:sentVocabulary:forIntentSlot:", &v22, &v21, &v20, v6);
  v9 = v22;
  v10 = v21;
  v11 = v20;
  v12 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
    v25 = 2112;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    _os_log_debug_impl(&dword_218838000, v12, OS_LOG_TYPE_DEBUG, "%s Reading latest vocabulary from file for appId=%@ intentSlot=%@", buf, 0x20u);
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA378]), "initWithContentsOfFile:", v9);
  if (!v13)
  {
    v14 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_debug_impl(&dword_218838000, v14, OS_LOG_TYPE_DEBUG, "%s Latest vocabulary file not found for appId=%@ intentSlot=%@. Checking SentVocabulary file.", buf, 0x20u);
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA378]), "initWithContentsOfFile:", v11);
  }
  objc_msgSend(v13, "vocabularyItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "count"))
  {
    v17 = v16;
  }
  else
  {
    v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:]";
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_218838000, v18, OS_LOG_TYPE_INFO, "%s Found no vocabulary stored for appId=%@ intentSlot=%@. Will push empty donation.", buf, 0x20u);
    }
    v17 = (id)MEMORY[0x24BDBD1A8];
  }

  return v17;
}

@end
