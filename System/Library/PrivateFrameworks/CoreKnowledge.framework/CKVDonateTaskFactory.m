@implementation CKVDonateTaskFactory

- (id)taskForId:(unsigned __int16)a3 usingLocalization:(id)a4
{
  uint64_t v4;
  id v6;
  CKVDonateTask *v7;
  CKVDonatorProvider *donatorProvider;
  CKVSimulatedMultiDatasetBridge *v9;
  CKVDonateTask *v10;
  CKVDonateTask *v11;
  CKVDonatorProvider *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CKVDonateTask *v16;
  CKVDonatorProvider *v17;
  CKVDonateTask *v18;
  CKVDonatorProvider *v19;
  KMProviderBridgeFactory *factory;
  _QWORD *v21;
  CKVDonateTask *v22;
  CKVDonatorProvider *v23;
  KMProviderBridgeFactory *v24;
  _QWORD *v25;
  void *v26;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[CKVDonateTaskFactory useSimulatedProviderBridge](self, "useSimulatedProviderBridge"))
  {
    v7 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    v9 = -[CKVSimulatedMultiDatasetBridge initWithTask:]([CKVSimulatedMultiDatasetBridge alloc], "initWithTask:", v4);
    v10 = -[CKVDonateTask initWithDonatorProvider:multiDatasetBridge:timeout:](v7, "initWithDonatorProvider:multiDatasetBridge:timeout:", donatorProvider, v9, self->_timeout);
LABEL_3:

  }
  else
  {
    v10 = 0;
    switch((int)v4)
    {
      case 0:
        goto LABEL_7;
      case 1:
        v11 = [CKVDonateTask alloc];
        v12 = self->_donatorProvider;
        -[KMProviderBridgeFactory intentVocabularyMultiDatasetBridge](self->_factory, "intentVocabularyMultiDatasetBridge");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKVDonateTask initWithDonatorProvider:multiDatasetBridge:timeout:](v11, "initWithDonatorProvider:multiDatasetBridge:timeout:", v12, v13, self->_timeout);
        goto LABEL_21;
      case 2:
        v16 = [CKVDonateTask alloc];
        v17 = self->_donatorProvider;
        -[KMProviderBridgeFactory bridgeForOriginAppId:](self->_factory, "bridgeForOriginAppId:", *MEMORY[0x1E0D42B38]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKVDonateTask initWithDonatorProvider:deltaDatasetBridge:timeout:](v16, "initWithDonatorProvider:deltaDatasetBridge:timeout:", v17, v13, self->_timeout);
        goto LABEL_21;
      case 3:
        objc_msgSend(v6, "siriLanguageCode");
        v9 = (CKVSimulatedMultiDatasetBridge *)objc_claimAutoreleasedReturnValue();
        v18 = [CKVDonateTask alloc];
        v19 = self->_donatorProvider;
        factory = self->_factory;
        v21 = (_QWORD *)MEMORY[0x1E0D42B20];
        goto LABEL_14;
      case 4:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B50];
        goto LABEL_20;
      case 5:
        objc_msgSend(v6, "siriLanguageCode");
        v9 = (CKVSimulatedMultiDatasetBridge *)objc_claimAutoreleasedReturnValue();
        v18 = [CKVDonateTask alloc];
        v19 = self->_donatorProvider;
        factory = self->_factory;
        v21 = (_QWORD *)MEMORY[0x1E0D42B58];
LABEL_14:
        -[KMProviderBridgeFactory bridgeForOriginAppId:languageCode:](factory, "bridgeForOriginAppId:languageCode:", *v21, v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CKVDonateTask initWithDonatorProvider:fullDatasetBridge:timeout:](v18, "initWithDonatorProvider:fullDatasetBridge:timeout:", v19, v26, self->_timeout);

        goto LABEL_3;
      case 6:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B40];
        goto LABEL_20;
      case 7:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B80];
        goto LABEL_20;
      case 8:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B28];
        goto LABEL_20;
      case 9:
        break;
      case 10:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B48];
        goto LABEL_20;
      case 11:
        v22 = [CKVDonateTask alloc];
        v23 = self->_donatorProvider;
        v24 = self->_factory;
        v25 = (_QWORD *)MEMORY[0x1E0D42B30];
LABEL_20:
        -[KMProviderBridgeFactory bridgeForOriginAppId:](v24, "bridgeForOriginAppId:", *v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKVDonateTask initWithDonatorProvider:fullDatasetBridge:timeout:](v22, "initWithDonatorProvider:fullDatasetBridge:timeout:", v23, v13, self->_timeout);
LABEL_21:
        v10 = (CKVDonateTask *)v14;

        break;
      default:
        if ((v4 - 101) < 4)
        {
LABEL_7:
          v15 = (void *)CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)MEMORY[0x1E0CB37E8];
            v29 = v15;
            objc_msgSend(v28, "numberWithUnsignedShort:", v4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 136315394;
            v32 = "-[CKVDonateTaskFactory taskForId:usingLocalization:]";
            v33 = 2112;
            v34 = v30;
            _os_log_error_impl(&dword_1A48B3000, v29, OS_LOG_TYPE_ERROR, "%s Failed to find donation task for: %@", (uint8_t *)&v31, 0x16u);

          }
          v10 = 0;
        }
        break;
    }
  }

  return v10;
}

- (BOOL)useSimulatedProviderBridge
{
  return self->_useSimulatedProviderBridge;
}

- (CKVDonateTaskFactory)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CKVDonateTaskFactory)initWithDirectory:(id)a3 timeout:(double)a4
{
  id v6;
  CKVDonateTaskFactory *v7;
  CKVDonatorFactory *v8;
  CKVDonatorProvider *donatorProvider;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  KMProviderBridgeFactory *factory;
  CKVDonateTaskFactory *v14;
  NSObject *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKVDonateTaskFactory;
  v7 = -[CKVDonateTaskFactory init](&v17, sel_init);
  if (!v7)
  {
LABEL_6:
    v14 = v7;
    goto LABEL_10;
  }
  v8 = objc_alloc_init(CKVDonatorFactory);
  donatorProvider = v7->_donatorProvider;
  v7->_donatorProvider = (CKVDonatorProvider *)v8;

  if (v7->_donatorProvider)
  {
    v7->_useSimulatedProviderBridge = 0;
    v7->_timeout = a4;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getKMProviderBridgeFactoryClass_softClass;
    v21 = getKMProviderBridgeFactoryClass_softClass;
    if (!getKMProviderBridgeFactoryClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v23 = __getKMProviderBridgeFactoryClass_block_invoke;
      v24 = &unk_1E4D29880;
      v25 = &v18;
      __getKMProviderBridgeFactoryClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v12 = objc_msgSend([v11 alloc], "initWithDirectory:", v6);
    factory = v7->_factory;
    v7->_factory = (KMProviderBridgeFactory *)v12;

    goto LABEL_6;
  }
  v15 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CKVDonateTaskFactory initWithDirectory:timeout:]";
    _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s Invalid donate service provider", (uint8_t *)&buf, 0xCu);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)derivativeTaskForId:(unsigned __int16)a3 usingLocalization:(id)a4 modifiedItemIds:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  CKVDonateTask *v11;
  CKVDonatorProvider *donatorProvider;
  void *v13;
  CKVDonateTask *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((_DWORD)v6 == 9)
  {
    objc_msgSend(v8, "siriLanguageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    -[KMProviderBridgeFactory globalTermMultiDatasetBridgeWithModifiedOriginAppIds:languageCode:](self->_factory, "globalTermMultiDatasetBridgeWithModifiedOriginAppIds:languageCode:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CKVDonateTask initWithDonatorProvider:multiDatasetBridge:timeout:](v11, "initWithDonatorProvider:multiDatasetBridge:timeout:", donatorProvider, v13, self->_timeout);

  }
  else
  {
    v15 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v15;
      objc_msgSend(v17, "numberWithUnsignedShort:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315394;
      v21 = "-[CKVDonateTaskFactory derivativeTaskForId:usingLocalization:modifiedItemIds:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s taskId: %@ is not a supported derivative task", (uint8_t *)&v20, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (id)verificationTaskForId:(unsigned __int16)a3
{
  CKVDonateTask *v4;
  CKVDonatorProvider *donatorProvider;
  void *v6;
  CKVDonateTask *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v4 = [CKVDonateTask alloc];
    donatorProvider = self->_donatorProvider;
    -[KMProviderBridgeFactory bridgeForOriginAppId:](self->_factory, "bridgeForOriginAppId:", *MEMORY[0x1E0D42B38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKVDonateTask initWithDonatorProvider:fullDatasetBridge:timeout:](v4, "initWithDonatorProvider:fullDatasetBridge:timeout:", donatorProvider, v6, self->_timeout);

  }
  else
  {
    v8 = a3;
    v9 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = v9;
      objc_msgSend(v11, "numberWithUnsignedShort:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[CKVDonateTaskFactory verificationTaskForId:]";
      v16 = 2112;
      v17 = v13;
      _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s taskId: %@ is not a supported verification task", (uint8_t *)&v14, 0x16u);

    }
    v7 = 0;
  }
  return v7;
}

- (void)setupBridgeListenersWithHandler:(id)a3
{
  -[KMProviderBridgeFactory bootstrapBridgeListenersWithHandler:](self->_factory, "bootstrapBridgeListenersWithHandler:", a3);
}

- (id)allInstalledAppBundleIdentifiers
{
  return (id)-[KMProviderBridgeFactory allInstalledAppBundleIdentifiers](self->_factory, "allInstalledAppBundleIdentifiers");
}

- (void)setUseSimulatedProviderBridge:(BOOL)a3
{
  self->_useSimulatedProviderBridge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_donatorProvider, 0);
}

@end
