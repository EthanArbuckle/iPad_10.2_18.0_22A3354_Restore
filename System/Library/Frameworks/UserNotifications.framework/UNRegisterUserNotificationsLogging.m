@implementation UNRegisterUserNotificationsLogging

void __UNRegisterUserNotificationsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;

  v0 = os_log_create((const char *)UNLogSubsystem, "AppLaunching");
  v1 = (void *)UNLogAppLaunching;
  UNLogAppLaunching = (uint64_t)v0;

  v2 = os_log_create((const char *)UNLogSubsystem, "AttachmentsService");
  v3 = (void *)UNLogAttachmentsService;
  UNLogAttachmentsService = (uint64_t)v2;

  v4 = os_log_create((const char *)UNLogSubsystem, "AttachmentsRepository");
  v5 = (void *)UNLogAttachmentsRepository;
  UNLogAttachmentsRepository = (uint64_t)v4;

  v6 = os_log_create((const char *)UNLogSubsystem, "Categories");
  v7 = (void *)UNLogCategories;
  UNLogCategories = (uint64_t)v6;

  v8 = os_log_create((const char *)UNLogSubsystem, "CommunicationNotifications");
  v9 = (void *)UNLogCommunicationNotifications;
  UNLogCommunicationNotifications = (uint64_t)v8;

  v10 = os_log_create((const char *)UNLogSubsystem, "Connections");
  v11 = (void *)UNLogConnections;
  UNLogConnections = (uint64_t)v10;

  v12 = os_log_create((const char *)UNLogSubsystem, "ContentProtection");
  v13 = (void *)UNLogContentProtection;
  UNLogContentProtection = (uint64_t)v12;

  v14 = os_log_create((const char *)UNLogSubsystem, "DataProvider");
  v15 = (void *)UNLogDataProvider;
  UNLogDataProvider = (uint64_t)v14;

  v16 = os_log_create((const char *)UNLogSubsystem, "DataProviderFactory");
  v17 = (void *)UNLogDataProviderFactory;
  UNLogDataProviderFactory = (uint64_t)v16;

  v18 = os_log_create((const char *)UNLogSubsystem, "DataStore");
  v19 = (void *)UNLogDataStore;
  UNLogDataStore = (uint64_t)v18;

  v20 = os_log_create((const char *)UNLogSubsystem, "LocalNotifications");
  v21 = (void *)UNLogLocalNotifications;
  UNLogLocalNotifications = (uint64_t)v20;

  v22 = os_log_create((const char *)UNLogSubsystem, "Migration");
  v23 = (void *)UNLogMigration;
  UNLogMigration = (uint64_t)v22;

  v24 = os_log_create((const char *)UNLogSubsystem, "Persistence");
  v25 = (void *)UNLogPersistence;
  UNLogPersistence = (uint64_t)v24;

  v26 = os_log_create((const char *)UNLogSubsystem, "RemoteNotifications");
  v27 = (void *)UNLogRemoteNotifications;
  UNLogRemoteNotifications = (uint64_t)v26;

  v28 = os_log_create((const char *)UNLogSubsystem, "ServiceExtension");
  v29 = (void *)UNLogServiceExtension;
  UNLogServiceExtension = (uint64_t)v28;

  v30 = os_log_create((const char *)UNLogSubsystem, "Settings");
  v31 = (void *)UNLogSettings;
  UNLogSettings = (uint64_t)v30;

  v32 = os_log_create((const char *)UNLogSubsystem, "Spotlight");
  v33 = (void *)UNLogSpotlight;
  UNLogSpotlight = (uint64_t)v32;

  v34 = os_log_create((const char *)UNLogSubsystem, "SystemService");
  v35 = (void *)UNLogSystemService;
  UNLogSystemService = (uint64_t)v34;

  v36 = os_log_create((const char *)UNLogSubsystem, "Utilities");
  v37 = (void *)UNLogUtilities;
  UNLogUtilities = (uint64_t)v36;

  v38 = os_log_create((const char *)UNLogSubsystem, "PipelineAdapter");
  v39 = (void *)UNLogPipelineAdapter;
  UNLogPipelineAdapter = (uint64_t)v38;

}

@end
