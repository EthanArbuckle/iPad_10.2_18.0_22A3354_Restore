@implementation FLLoggingContext

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FLLoggingContext)init
{
  void *v3;
  FLLoggingContext *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FLLoggingContext initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (FLLoggingContext)initWithFileManager:(id)a3
{
  return -[FLLoggingContext initWithFileManager:persistenceConfiguration:](self, "initWithFileManager:persistenceConfiguration:", a3, 0);
}

- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  FLAutoBugCapture *v9;
  FLContainerStorePathManager *v10;
  FLLoggingContext *v11;

  v6 = (objc_class *)MEMORY[0x1E0C99EA0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithSuiteName:", CFSTR("com.apple.parsecd"));
  v9 = objc_alloc_init(FLAutoBugCapture);
  v10 = objc_alloc_init(FLContainerStorePathManager);
  v11 = -[FLLoggingContext initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:](self, "initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:", v7, a4, v8, v9, v10);

  return v11;
}

- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5
{
  id v8;
  id v9;
  id v10;
  FLContainerStorePathManager *v11;
  FLLoggingContext *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(FLContainerStorePathManager);
  v12 = -[FLLoggingContext initWithFileManager:userDefaults:autoBugCapture:containerStorePathManager:](self, "initWithFileManager:userDefaults:autoBugCapture:containerStorePathManager:", v10, v9, v8, v11);

  return v12;
}

- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5 containerStorePathManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FLLoggingContext *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[FLLoggingContext initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:](self, "initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:", v13, objc_msgSend((id)objc_opt_class(), "inferredPersistenceConfiguration"), v12, v11, v10);

  return v14;
}

- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4 userDefaults:(id)a5 autoBugCapture:(id)a6 containerStorePathManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FLLoggingContext *v17;
  FLLoggingContext *v18;
  uint64_t v19;
  OS_os_log *log;
  uint64_t v21;
  NSString *timestampReferenceIdentifier;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  uint64_t v26;
  NSMutableDictionary *storeIdToUserCachesDirectoryPathMap;
  objc_super v29;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FLLoggingContext;
  v17 = -[FLLoggingContext init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    flLogForObject(v17);
    v19 = objc_claimAutoreleasedReturnValue();
    log = v18->_log;
    v18->_log = (OS_os_log *)v19;

    objc_storeStrong((id *)&v18->_fileManager, a3);
    if (!a4)
      a4 = objc_msgSend((id)objc_opt_class(), "inferredPersistenceConfiguration");
    v18->_persistenceConfiguration = a4;
    FLGetBootSessionUUID();
    v21 = objc_claimAutoreleasedReturnValue();
    timestampReferenceIdentifier = v18->_timestampReferenceIdentifier;
    v18->_timestampReferenceIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v18->_userDefaults, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.feedbacklogger", v23);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v18->_containerStorePathManager, a7);
    objc_storeStrong((id *)&v18->_autoBugCapture, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    storeIdToUserCachesDirectoryPathMap = v18->_storeIdToUserCachesDirectoryPathMap;
    v18->_storeIdToUserCachesDirectoryPathMap = (NSMutableDictionary *)v26;

  }
  return v18;
}

- (BOOL)deviceUnlockedSinceBoot
{
  BOOL result;

  if (self->_deviceUnlockedSinceBoot)
    return 1;
  result = MKBDeviceUnlockedSinceBoot() == 1;
  self->_deviceUnlockedSinceBoot = result;
  return result;
}

- (void)reportTelemetry:(id)a3 payload:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

- (id)pathForStore:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v5 = a3;
  v6 = -[FLLoggingContext persistenceConfiguration](self, "persistenceConfiguration");
  if (v6)
  {
    if (v6 == 2)
    {
      -[FLLoggingContext userCachesDirectoryPathForStore:](self, "userCachesDirectoryPathForStore:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v6 == 1)
    {
      -[FLLoggingContext containerStorePathManager](self, "containerStorePathManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "containerPathForStoreId:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[FLLoggingContext log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Default persistence configuration should have been replaced with an inferred value.", v10, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (id)userCachesDirectoryPathForStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[FLLoggingContext storeIdToUserCachesDirectoryPathMap](self, "storeIdToUserCachesDirectoryPathMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[FLLoggingContext fileManager](self, "fileManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlForStoreWithId:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[FLLoggingContext storeIdToUserCachesDirectoryPathMap](self, "storeIdToUserCachesDirectoryPathMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v4);

    }
  }

  return v6;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (unint64_t)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (void)setPersistenceConfiguration:(unint64_t)a3
{
  self->_persistenceConfiguration = a3;
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (FLContainerStorePathManager)containerStorePathManager
{
  return self->_containerStorePathManager;
}

- (void)setContainerStorePathManager:(id)a3
{
  objc_storeStrong((id *)&self->_containerStorePathManager, a3);
}

- (FLAutoBugCapture)autoBugCapture
{
  return self->_autoBugCapture;
}

- (void)setAutoBugCapture:(id)a3
{
  objc_storeStrong((id *)&self->_autoBugCapture, a3);
}

- (NSMutableDictionary)storeIdToUserCachesDirectoryPathMap
{
  return self->_storeIdToUserCachesDirectoryPathMap;
}

- (void)setStoreIdToUserCachesDirectoryPathMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_storeIdToUserCachesDirectoryPathMap, 0);
  objc_storeStrong((id *)&self->_autoBugCapture, 0);
  objc_storeStrong((id *)&self->_containerStorePathManager, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __44__FLLoggingContext_reportTelemetry_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (unint64_t)inferredPersistenceConfiguration
{
  if (objc_msgSend(a1, "isRunningInExtension"))
    return 1;
  else
    return 2;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_544);
  return isInternalBuild_osVariantIsInternal;
}

+ (BOOL)isRunningInExtension
{
  if (isRunningInExtension_onceToken != -1)
    dispatch_once(&isRunningInExtension_onceToken, &__block_literal_global_8);
  return isRunningInExtension_isBundleExtensionType;
}

void __40__FLLoggingContext_isRunningInExtension__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForInfoDictionaryKey:", CFSTR("EXAppExtensionAttributes"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningInExtension_isBundleExtensionType = v0 != 0;

}

uint64_t __35__FLLoggingContext_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  isInternalBuild_osVariantIsInternal = result;
  return result;
}

@end
