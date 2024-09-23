@implementation KMProviderBridgeFactory

- (id)intentVocabularyMultiDatasetBridge
{
  return objc_alloc_init(KMIntentVocabularyMultiDatasetBridge);
}

- (KMProviderBridgeFactory)initWithDirectory:(id)a3
{
  id v5;
  KMProviderBridgeFactory *v6;
  KMProviderBridgeFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KMProviderBridgeFactory;
  v6 = -[KMProviderBridgeFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_directory, a3);

  return v7;
}

- (id)bridgeForOriginAppId:(id)a3
{
  id v4;
  __objc2_class *v5;
  KMContactStoreBridge *v6;
  KMContactStoreBridge *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E870]))
  {
    v5 = KMCalendarEventBridge;
LABEL_15:
    v6 = (KMContactStoreBridge *)objc_alloc_init(v5);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E880]))
  {
    v6 = -[KMContactStoreBridge initWithDirectory:]([KMContactStoreBridge alloc], "initWithDirectory:", self->_directory);
LABEL_16:
    v7 = v6;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E888]))
  {
    v5 = KMCoreRoutineBridge;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E898]))
  {
    v5 = KMHomeManagerBridge;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E8A8]))
  {
    v5 = KMPortraitEntitiesBridge;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E878]))
  {
    v5 = KMRadioStationBridge;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE5E890]))
  {
    v5 = KMFindMySyncDevicesBridge;
    goto LABEL_15;
  }
  v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315394;
    v11 = "-[KMProviderBridgeFactory bridgeForOriginAppId:]";
    v12 = 2112;
    v13 = v4;
    _os_log_error_impl(&dword_218838000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected originAppId: \"%@\" for unlocalized single-dataset bridge", (uint8_t *)&v10, 0x16u);
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (id)bridgeForOriginAppId:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v8 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v12 = 136315394;
    v13 = "-[KMProviderBridgeFactory bridgeForOriginAppId:languageCode:]";
    v14 = 2112;
    v15 = 0;
    v9 = "%s invalid language code: %@";
    goto LABEL_13;
  }
  if (!objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE5E868]))
  {
    if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE5E8A0]))
    {
      v7 = KMLanguageModelBridge;
      goto LABEL_8;
    }
    v8 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v12 = 136315394;
    v13 = "-[KMProviderBridgeFactory bridgeForOriginAppId:languageCode:]";
    v14 = 2112;
    v15 = v5;
    v9 = "%s Unexpected originAppId: \"%@\" for localized single-dataset bridge";
LABEL_13:
    _os_log_error_impl(&dword_218838000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  v7 = KMLaunchServicesBridge;
LABEL_8:
  v10 = (void *)objc_msgSend([v7 alloc], "initWithLanguageCode:", v6);
LABEL_11:

  return v10;
}

- (id)globalTermMultiDatasetBridgeWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  KMAppGlobalVocabularyMultiDatasetBridge *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[KMAppGlobalVocabularyMultiDatasetBridge initWithModifiedOriginAppIds:languageCode:]([KMAppGlobalVocabularyMultiDatasetBridge alloc], "initWithModifiedOriginAppIds:languageCode:", v6, v5);

  return v7;
}

- (void)bootstrapBridgeListenersWithHandler:(id)a3
{
  +[KMRadioStationBridge bootstrapListenerWithHandler:](KMRadioStationBridge, "bootstrapListenerWithHandler:", a3);
}

- (id)allInstalledAppBundleIdentifiers
{
  return +[KMLaunchServicesBridge allInstalledAppBundleIdentifiers](KMLaunchServicesBridge, "allInstalledAppBundleIdentifiers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
}

+ (void)initialize
{
  if (KMLogInit_onceToken != -1)
    dispatch_once(&KMLogInit_onceToken, &__block_literal_global_130);
}

@end
