@implementation DNDSRegisterLogging

void __DNDSRegisterLogging_block_invoke()
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
  os_log_t v40;
  void *v41;
  os_log_t v42;
  void *v43;
  os_log_t v44;
  void *v45;
  os_log_t v46;
  void *v47;
  os_log_t v48;
  void *v49;
  os_log_t v50;
  void *v51;
  os_log_t v52;
  void *v53;
  os_log_t v54;
  void *v55;
  os_log_t v56;
  void *v57;
  os_log_t v58;
  void *v59;
  os_log_t v60;
  void *v61;
  os_log_t v62;
  void *v63;
  os_log_t v64;
  void *v65;
  os_log_t v66;
  void *v67;
  os_log_t v68;
  void *v69;
  os_log_t v70;
  void *v71;
  os_log_t v72;
  void *v73;
  os_log_t v74;
  void *v75;
  os_log_t v76;
  void *v77;
  os_log_t v78;
  void *v79;
  os_log_t v80;
  void *v81;
  os_log_t v82;
  void *v83;
  os_log_t v84;
  void *v85;
  os_log_t v86;
  void *v87;

  v0 = os_log_create("com.apple.donotdisturb", "ServerGeneral");
  v1 = (void *)DNDSLogGeneral;
  DNDSLogGeneral = (uint64_t)v0;

  v2 = os_log_create("com.apple.donotdisturb", "Resolver");
  v3 = (void *)DNDSLogResolver;
  DNDSLogResolver = (uint64_t)v2;

  v4 = os_log_create("com.apple.donotdisturb", "ServiceProvider");
  v5 = (void *)DNDSLogServiceProvider;
  DNDSLogServiceProvider = (uint64_t)v4;

  v6 = os_log_create("com.apple.donotdisturb", "AppConfiguration");
  v7 = (void *)DNDSLogAppConfigurationServiceProvider;
  DNDSLogAppConfigurationServiceProvider = (uint64_t)v6;

  v8 = os_log_create("com.apple.donotdisturb", "AppFocusConfigurationTask");
  v9 = (void *)DNDSLogAppFocusConfigurationTask;
  DNDSLogAppFocusConfigurationTask = (uint64_t)v8;

  v10 = os_log_create("com.apple.donotdisturb", "AppFocusConfiguration");
  v11 = (void *)DNDSLogAppFocusConfiguration;
  DNDSLogAppFocusConfiguration = (uint64_t)v10;

  v12 = os_log_create("com.apple.donotdisturb", "SystemFocusConfiguration");
  v13 = (void *)DNDSLogSystemFocusConfiguration;
  DNDSLogSystemFocusConfiguration = (uint64_t)v12;

  v14 = os_log_create("com.apple.donotdisturb", "AppSpecificSettingsManager");
  v15 = (void *)DNDSLogAppSpecificSettingsManager;
  DNDSLogAppSpecificSettingsManager = (uint64_t)v14;

  v16 = os_log_create("com.apple.donotdisturb", "AvailabilityProvider");
  v17 = (void *)DNDSLogAvailabilityProvider;
  DNDSLogAvailabilityProvider = (uint64_t)v16;

  v18 = os_log_create("com.apple.donotdisturb", "StateProvider");
  v19 = (void *)DNDSLogStateProvider;
  DNDSLogStateProvider = (uint64_t)v18;

  v20 = os_log_create("com.apple.donotdisturb", "AssertionManager");
  v21 = (void *)DNDSLogAssertionManager;
  DNDSLogAssertionManager = (uint64_t)v20;

  v22 = os_log_create("com.apple.donotdisturb", "AssertionStore");
  v23 = (void *)DNDSLogAssertionStore;
  DNDSLogAssertionStore = (uint64_t)v22;

  v24 = os_log_create("com.apple.donotdisturb", "IDSTransport");
  v25 = (void *)DNDSLogIDSTransport;
  DNDSLogIDSTransport = (uint64_t)v24;

  v26 = os_log_create("com.apple.donotdisturb", "Schedule");
  v27 = (void *)DNDSLogSchedule;
  DNDSLogSchedule = (uint64_t)v26;

  v28 = os_log_create("com.apple.donotdisturb", "AppForegroundTrigger");
  v29 = (void *)DNDSLogAppForegroundTrigger;
  DNDSLogAppForegroundTrigger = (uint64_t)v28;

  v30 = os_log_create("com.apple.donotdisturb", "BiomeDonation");
  v31 = (void *)DNDSLogBiomeDonation;
  DNDSLogBiomeDonation = (uint64_t)v30;

  v32 = os_log_create("com.apple.donotdisturb", "DrivingTrigger");
  v33 = (void *)DNDSLogDrivingTrigger;
  DNDSLogDrivingTrigger = (uint64_t)v32;

  v34 = os_log_create("com.apple.donotdisturb", "MindfulnessTrigger");
  v35 = (void *)DNDSLogMindfulnessTrigger;
  DNDSLogMindfulnessTrigger = (uint64_t)v34;

  v36 = os_log_create("com.apple.donotdisturb", "GamingTrigger");
  v37 = (void *)DNDSLogGamingTrigger;
  DNDSLogGamingTrigger = (uint64_t)v36;

  v38 = os_log_create("com.apple.donotdisturb", "SleepingTrigger");
  v39 = (void *)DNDSLogSleepingTrigger;
  DNDSLogSleepingTrigger = (uint64_t)v38;

  v40 = os_log_create("com.apple.donotdisturb", "SmartTrigger");
  v41 = (void *)DNDSLogSmartTrigger;
  DNDSLogSmartTrigger = (uint64_t)v40;

  v42 = os_log_create("com.apple.donotdisturb", "WorkoutTrigger");
  v43 = (void *)DNDSLogWorkoutTrigger;
  DNDSLogWorkoutTrigger = (uint64_t)v42;

  v44 = os_log_create("com.apple.donotdisturb", "Settings");
  v45 = (void *)DNDSLogSettings;
  DNDSLogSettings = (uint64_t)v44;

  v46 = os_log_create("com.apple.donotdisturb", "AuxiliaryState");
  v47 = (void *)DNDSLogAuxiliaryState;
  DNDSLogAuxiliaryState = (uint64_t)v46;

  v48 = os_log_create("com.apple.donotdisturb", "SystemState");
  v49 = (void *)DNDSLogSystemState;
  DNDSLogSystemState = (uint64_t)v48;

  v50 = os_log_create("com.apple.donotdisturb", "MeDeviceService");
  v51 = (void *)DNDSLogMeDeviceService;
  DNDSLogMeDeviceService = (uint64_t)v50;

  v52 = os_log_create("com.apple.donotdisturb", "LegacyAssertionSync");
  v53 = (void *)DNDSLogLegacyAssertionSync;
  DNDSLogLegacyAssertionSync = (uint64_t)v52;

  v54 = os_log_create("com.apple.donotdisturb", "LegacySettingsSync");
  v55 = (void *)DNDSLogLegacySettingsSync;
  DNDSLogLegacySettingsSync = (uint64_t)v54;

  v56 = os_log_create("com.apple.donotdisturb", "ModernAssertionSync");
  v57 = (void *)DNDSLogModernAssertionSync;
  DNDSLogModernAssertionSync = (uint64_t)v56;

  v58 = os_log_create("com.apple.donotdisturb", "PairedDeviceState");
  v59 = (void *)DNDSLogPairedDeviceState;
  DNDSLogPairedDeviceState = (uint64_t)v58;

  v60 = os_log_create("com.apple.donotdisturb", "DateIntervalLifetimeMonitor");
  v61 = (void *)DNDSLogDateIntervalLifetimeMonitor;
  DNDSLogDateIntervalLifetimeMonitor = (uint64_t)v60;

  v62 = os_log_create("com.apple.donotdisturb", "LocationLifetimeMonitor");
  v63 = (void *)DNDSLogLocationLifetimeMonitor;
  DNDSLogLocationLifetimeMonitor = (uint64_t)v62;

  v64 = os_log_create("com.apple.donotdisturb", "CalendarEventLifetimeMonitor");
  v65 = (void *)DNDSLogCalendarEventLifetimeMonitor;
  DNDSLogCalendarEventLifetimeMonitor = (uint64_t)v64;

  v66 = os_log_create("com.apple.donotdisturb", "ScheduleLifetimeMonitor");
  v67 = (void *)DNDSLogScheduleLifetimeMonitor;
  DNDSLogScheduleLifetimeMonitor = (uint64_t)v66;

  v68 = os_log_create("com.apple.donotdisturb", "DefaultLifetimeMonitor");
  v69 = (void *)DNDSLogDefaultLifetimeMonitor;
  DNDSLogDefaultLifetimeMonitor = (uint64_t)v68;

  v70 = os_log_create("com.apple.donotdisturb", "DataMigrator");
  v71 = (void *)DNDSLogDataMigrator;
  DNDSLogDataMigrator = (uint64_t)v70;

  v72 = os_log_create("com.apple.donotdisturb", "Sysdiagnose");
  v73 = (void *)DNDSLogSysdiagnose;
  DNDSLogSysdiagnose = (uint64_t)v72;

  v74 = os_log_create("com.apple.donotdisturb", "Metrics");
  v75 = (void *)DNDSLogMetrics;
  DNDSLogMetrics = (uint64_t)v74;

  v76 = os_log_create("com.apple.donotdisturb", "Keybag");
  v77 = (void *)DNDSLogKeybag;
  DNDSLogKeybag = (uint64_t)v76;

  v78 = os_log_create("com.apple.donotdisturb", "CloudSync");
  v79 = (void *)DNDSLogCloudSync;
  DNDSLogCloudSync = (uint64_t)v78;

  v80 = os_log_create("com.apple.donotdisturb", "ModeConfigurations");
  v81 = (void *)DNDSLogModeConfigurations;
  DNDSLogModeConfigurations = (uint64_t)v80;

  v82 = os_log_create("com.apple.donotdisturb", "GlobalConfiguration");
  v83 = (void *)DNDSLogGlobalConfiguration;
  DNDSLogGlobalConfiguration = (uint64_t)v82;

  v84 = os_log_create("com.apple.donotdisturb", "IDSSyncEngine");
  v85 = (void *)DNDSLogIDSSyncEngine;
  DNDSLogIDSSyncEngine = (uint64_t)v84;

  v86 = os_log_create("com.apple.donotdisturb", "XPCEventPublisher");
  v87 = (void *)DNDSLogXPCEventPublisher;
  DNDSLogXPCEventPublisher = (uint64_t)v86;

}

@end
