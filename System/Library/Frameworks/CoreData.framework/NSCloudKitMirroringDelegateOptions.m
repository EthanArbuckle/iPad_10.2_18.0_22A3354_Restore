@implementation NSCloudKitMirroringDelegateOptions

- (NSCloudKitMirroringDelegateOptions)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  v2 = -[NSCloudKitMirroringDelegateOptions init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 10) = objc_alloc_init(PFCloudKitContainerProvider);
    *((_QWORD *)v2 + 11) = objc_alloc_init(PFCloudKitStoreMonitorProvider);
    *((_QWORD *)v2 + 9) = objc_alloc_init(PFCloudKitMetricsClient);
    *(_WORD *)(v2 + 13) = 1;
    *(_DWORD *)(v2 + 9) = 0;
    v2[15] = 0;
    *((_QWORD *)v2 + 12) = objc_alloc_init(PFCloudKitMetadataPurger);
    *((_QWORD *)v2 + 14) = 0;
    *((_QWORD *)v2 + 15) = 2;
    *((_QWORD *)v2 + 17) = objc_alloc_init(PFCloudKitArchivingUtilities);
    v2[18] = 1;
    v2[16] = 0;
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("homed")))v2[16] = 1;
  }
  return (NSCloudKitMirroringDelegateOptions *)v2;
}

- (NSCloudKitMirroringDelegateOptions)initWithContainerIdentifier:(id)a3
{
  NSCloudKitMirroringDelegateOptions *v4;

  v4 = -[NSCloudKitMirroringDelegateOptions init](self, "init");
  if (v4)
    v4->_containerIdentifier = (NSString *)a3;
  return v4;
}

- (NSCloudKitMirroringDelegateOptions)initWithCloudKitContainerOptions:(id)a3
{
  NSCloudKitMirroringDelegateOptions *v4;
  NSCloudKitMirroringDelegateOptions *v5;
  void *v6;

  v4 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:](self, "initWithContainerIdentifier:", objc_msgSend(a3, "containerIdentifier"));
  v5 = v4;
  if (v4)
  {
    v4->_automaticallyScheduleImportAndExportOperations = 1;
    v4->_useDeviceToDeviceEncryption = objc_msgSend(a3, "useDeviceToDeviceEncryption");
    v5->_apsConnectionMachServiceName = (NSString *)(id)objc_msgSend(a3, "apsConnectionMachServiceName");
    v5->_databaseScope = objc_msgSend(a3, "databaseScope");
    v5->_containerOptions = (CKContainerOptions *)(id)objc_msgSend(a3, "containerOptions");
    v5->_operationMemoryThresholdBytes = (NSNumber *)(id)objc_msgSend(a3, "operationMemoryThresholdBytes");
    v5->_automaticallyDownloadFileBackedFutures = objc_msgSend(a3, "automaticallyDownloadFileBackedFutures");
    v5->_ckAssetThresholdBytes = (NSNumber *)(id)objc_msgSend(a3, "ckAssetThresholdBytes");
    v6 = (void *)MEMORY[0x18D76B4E4]();
    objc_storeWeak((id *)&v5->_progressProvider, (id)objc_msgSend(a3, "progressProvider"));
    if (objc_msgSend(a3, "testContainerOverride"))
    {

      v5->_containerProvider = (PFCloudKitContainerProvider *)-[PFStaticCloudKitContainerProvider initWithContainer:]([PFStaticCloudKitContainerProvider alloc], "initWithContainer:", objc_msgSend(a3, "testContainerOverride"));
      v5->_bypassDasdRateLimiting = 1;
    }
    objc_autoreleasePoolPop(v6);
  }
  return v5;
}

- (id)copy
{
  id v3;
  void *v4;
  id Weak;

  v3 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v3 + 3) = -[NSString copy](self->_containerIdentifier, "copy");
  *((_QWORD *)v3 + 4) = -[NSNumber copy](self->_ckAssetThresholdBytes, "copy");
  *((_BYTE *)v3 + 9) = self->_useDeviceToDeviceEncryption;
  *((_QWORD *)v3 + 5) = self->_operationMemoryThresholdBytes;
  *((_QWORD *)v3 + 6) = self->_containerOptions;
  *((_BYTE *)v3 + 10) = self->_automaticallyDownloadFileBackedFutures;
  *((_BYTE *)v3 + 11) = self->_automaticallyScheduleImportAndExportOperations;
  *((_QWORD *)v3 + 7) = self->_scheduler;
  *((_QWORD *)v3 + 8) = self->_notificationListener;
  *((_BYTE *)v3 + 12) = self->_skipCloudKitSetup;
  *((_BYTE *)v3 + 13) = self->_useDaemon;
  *((_BYTE *)v3 + 14) = self->_useTestDaemon;

  *((_QWORD *)v3 + 10) = self->_containerProvider;
  *((_QWORD *)v3 + 11) = self->_storeMonitorProvider;
  *((_BYTE *)v3 + 15) = self->_preserveLegacyRecordMetadataBehavior;
  *((_QWORD *)v3 + 13) = self->_apsConnectionMachServiceName;

  *((_QWORD *)v3 + 9) = self->_metricsClient;
  *((_QWORD *)v3 + 12) = self->_metadataPurger;
  *((_QWORD *)v3 + 14) = self->_defaultOperationConfiguration;
  *((_QWORD *)v3 + 15) = self->_databaseScope;
  v4 = (void *)MEMORY[0x18D76B4E4]();
  Weak = objc_loadWeak((id *)&self->_progressProvider);
  objc_storeWeak((id *)v3 + 16, Weak);
  objc_autoreleasePoolPop(v4);

  *((_QWORD *)v3 + 17) = self->_archivingUtilities;
  *((_BYTE *)v3 + 18) = self->_test_useLegacySavePolicy;
  *((_BYTE *)v3 + 16) = self->_bypassSchedulerActivityForInitialImport;
  *((_BYTE *)v3 + 17) = self->_bypassDasdRateLimiting;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_ckAssetThresholdBytes = 0;
  self->_operationMemoryThresholdBytes = 0;

  self->_containerOptions = 0;
  self->_scheduler = 0;

  self->_notificationListener = 0;
  self->_apsConnectionMachServiceName = 0;

  self->_defaultOperationConfiguration = 0;
  objc_storeWeak((id *)&self->_progressProvider, 0);

  self->_archivingUtilities = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  -[NSCloudKitMirroringDelegateOptions dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSString *containerIdentifier;
  uint64_t v5;
  NSNumber *ckAssetThresholdBytes;
  NSNumber *operationMemoryThresholdBytes;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSString *apsConnectionMachServiceName;
  PFCloudKitContainerProvider *containerProvider;
  PFCloudKitStoreMonitorProvider *storeMonitorProvider;
  PFCloudKitMetricsClient *metricsClient;
  PFCloudKitMetadataPurger *metadataPurger;
  CKScheduler *scheduler;
  CKNotificationListener *notificationListener;
  CKContainerOptions *containerOptions;
  CKOperationConfiguration *defaultOperationConfiguration;
  void *v24;
  id WeakRetained;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  id v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  v3 = (void *)objc_msgSend(-[NSCloudKitMirroringDelegateOptions description](&v32, sel_description), "mutableCopy");
  containerIdentifier = self->_containerIdentifier;
  if (!containerIdentifier)
    containerIdentifier = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" containerIdentifier:%@"), containerIdentifier);
  if (softLinkCKDatabaseScopeString(self->_databaseScope))
    v5 = softLinkCKDatabaseScopeString(self->_databaseScope);
  else
    v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" databaseScope:%@"), v5);
  ckAssetThresholdBytes = self->_ckAssetThresholdBytes;
  if (!ckAssetThresholdBytes)
    ckAssetThresholdBytes = (NSNumber *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" ckAssetThresholdBytes:%@"), ckAssetThresholdBytes);
  operationMemoryThresholdBytes = self->_operationMemoryThresholdBytes;
  if (!operationMemoryThresholdBytes)
    operationMemoryThresholdBytes = (NSNumber *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" operationMemoryThresholdBytes:%@"), operationMemoryThresholdBytes);
  if (self->_useDeviceToDeviceEncryption)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" useEncryptedStorage:%@"), v8);
  if (self->_useDeviceToDeviceEncryption)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" useDeviceToDeviceEncryption:%@"), v9);
  if (self->_automaticallyDownloadFileBackedFutures)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" automaticallyDownloadFileBackedFutures:%@"), v10);
  if (self->_automaticallyScheduleImportAndExportOperations)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" automaticallyScheduleImportAndExportOperations:%@"), v11);
  if (self->_skipCloudKitSetup)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" skipCloudKitSetup:%@"), v12);
  if (self->_preserveLegacyRecordMetadataBehavior)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" preserveLegacyRecordMetadataBehavior:%@"), v13);
  if (self->_useDaemon)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" useDaemon:%@"), v14);
  apsConnectionMachServiceName = self->_apsConnectionMachServiceName;
  if (!apsConnectionMachServiceName)
    apsConnectionMachServiceName = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" apsConnectionMachServiceName:%@"), apsConnectionMachServiceName);
  containerProvider = self->_containerProvider;
  if (!containerProvider)
    containerProvider = (PFCloudKitContainerProvider *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" containerProvider:%@"), containerProvider);
  storeMonitorProvider = self->_storeMonitorProvider;
  if (!storeMonitorProvider)
    storeMonitorProvider = (PFCloudKitStoreMonitorProvider *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" storeMonitorProvider:%@"), storeMonitorProvider);
  metricsClient = self->_metricsClient;
  if (!metricsClient)
    metricsClient = (PFCloudKitMetricsClient *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" metricsClient:%@"), metricsClient);
  metadataPurger = self->_metadataPurger;
  if (!metadataPurger)
    metadataPurger = (PFCloudKitMetadataPurger *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" metadataPurger:%@"), metadataPurger);
  scheduler = self->_scheduler;
  if (!scheduler)
    scheduler = (CKScheduler *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" scheduler:%@"), scheduler);
  notificationListener = self->_notificationListener;
  if (!notificationListener)
    notificationListener = (CKNotificationListener *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" notificationListener:%@"), notificationListener);
  containerOptions = self->_containerOptions;
  if (!containerOptions)
    containerOptions = (CKContainerOptions *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" containerOptions:%@"), containerOptions);
  defaultOperationConfiguration = self->_defaultOperationConfiguration;
  if (!defaultOperationConfiguration)
    defaultOperationConfiguration = (CKOperationConfiguration *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)MEMORY[0x18D76B4E4](objc_msgSend(v3, "appendFormat:", CFSTR(" defaultOperationConfiguration:%@"), defaultOperationConfiguration));
  WeakRetained = objc_loadWeakRetained((id *)&self->_progressProvider);
  v26 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" progressProvider:%@"), WeakRetained);

  objc_autoreleasePoolPop(v24);
  if (self->_test_useLegacySavePolicy)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" test_useLegacySavePolicy:%@"), v27);
  objc_msgSend(v3, "appendFormat:", CFSTR(" archivingUtilities:%@"), self->_archivingUtilities);
  if (self->_bypassSchedulerActivityForInitialImport)
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" bypassSchedulerActivityForInitialImport:%@"), v28);
  if (self->_bypassDasdRateLimiting)
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" bypassDasdRateLimiting:%@"), v29);
  v30 = (id)objc_msgSend(v3, "copy");

  return v30;
}

- (void)setInitializeSchema:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;

  self->_initializeSchema = a3;
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCloudKitMirroringDelegateOptions.initializeSchema is no longer supported and will be removed in a future release. Please use -[NSPersistentCloudKitContainer initializeSchemaWithOptions:error:] or NSCloudKitMirroringInitializeSchemaRequest instead.");
  _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
  v10 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: NSCloudKitMirroringDelegateOptions.initializeSchema is no longer supported and will be removed in a future release. Please use -[NSPersistentCloudKitContainer initializeSchemaWithOptions:error:] or NSCloudKitMirroringInitializeSchemaRequest instead.", (uint8_t *)&v11, 2u);
  }
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)initializeSchema
{
  return self->_initializeSchema;
}

- (BOOL)useDeviceToDeviceEncryption
{
  return self->_useDeviceToDeviceEncryption;
}

- (void)setUseDeviceToDeviceEncryption:(BOOL)a3
{
  self->_useDeviceToDeviceEncryption = a3;
}

- (NSNumber)ckAssetThresholdBytes
{
  return self->_ckAssetThresholdBytes;
}

- (void)setCkAssetThresholdBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSNumber)operationMemoryThresholdBytes
{
  return self->_operationMemoryThresholdBytes;
}

- (void)setOperationMemoryThresholdBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (void)setContainerOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)automaticallyDownloadFileBackedFutures
{
  return self->_automaticallyDownloadFileBackedFutures;
}

- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3
{
  self->_automaticallyDownloadFileBackedFutures = a3;
}

- (BOOL)automaticallyScheduleImportAndExportOperations
{
  return self->_automaticallyScheduleImportAndExportOperations;
}

- (void)setAutomaticallyScheduleImportAndExportOperations:(BOOL)a3
{
  self->_automaticallyScheduleImportAndExportOperations = a3;
}

- (BOOL)preserveLegacyRecordMetadataBehavior
{
  return self->_preserveLegacyRecordMetadataBehavior;
}

- (void)setPreserveLegacyRecordMetadataBehavior:(BOOL)a3
{
  self->_preserveLegacyRecordMetadataBehavior = a3;
}

- (NSString)apsConnectionMachServiceName
{
  return self->_apsConnectionMachServiceName;
}

- (void)setApsConnectionMachServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CKOperationConfiguration)defaultOperationConfiguration
{
  return self->_defaultOperationConfiguration;
}

- (void)setDefaultOperationConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (NSCloudKitMirroringDelegateProgressProvider)progressProvider
{
  return (NSCloudKitMirroringDelegateProgressProvider *)objc_loadWeak((id *)&self->_progressProvider);
}

- (void)setProgressProvider:(id)a3
{
  objc_storeWeak((id *)&self->_progressProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressProvider);
}

@end
