@implementation CALNNotificationServerModule

id __36__CALNNotificationServerModule_init__block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  id *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC74E8]), "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", 256, 0, 0, 1, 1);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_storeWeak(WeakRetained + 2, v2);

  return v2;
}

- (void)receivedNotificationNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE13D58]))
    -[CALNNotificationServerModule refreshEventStoreInResponseToDatabaseChangeNotification:](self, "refreshEventStoreInResponseToDatabaseChangeNotification:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "receivedNotificationNamed:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE14080]) & 1) != 0)
  {
    -[CALNNotificationServerModule notificationSourceRefresher](self, "notificationSourceRefresher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "refreshNotifications");

    -[CALNNotificationServerModule snoozeUpdateTimer](self, "snoozeUpdateTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "significantTimeChange");
LABEL_16:

    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7400]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7448]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE13D68]))
  {
    -[CALNNotificationServerModule notificationSourceRefresher](self, "notificationSourceRefresher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "refreshNotifications");
    goto LABEL_16;
  }
LABEL_17:

}

- (NSArray)modules
{
  return self->_modules;
}

- (CALNNotificationServerModule)init
{
  CALNNotificationServerModule *v2;
  NSObject *v3;
  CALNNotificationStorageWrapper *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CALNNotificationStorageWrapper *calendarStorageWrapper;
  id v9;
  uint64_t v10;
  EKEphemeralCacheEventStoreProvider *eventStoreProvider;
  CALNInboxNotificationMonitor *v12;
  CALNInboxNotificationMonitor *inboxNotificationMonitor;
  _EKAlarmEngine *v14;
  uint64_t v15;
  CALNEKAlarmEngineMonitor *v16;
  void *v17;
  __objc2_class **v18;
  uint64_t v19;
  EKTravelEngine *v20;
  CALNEKTravelEngine *v21;
  void *v22;
  CALNDefaultTimeToLeaveRefreshMonitor *v23;
  void *v24;
  uint64_t v25;
  CALNNotificationIconProvider *iconProvider;
  CALNNotificationIconCache *v27;
  CALNNotificationIconCache *iconCache;
  void *v29;
  id v30;
  void *v31;
  CALNNotificationSourceRefresher *v32;
  void *v33;
  uint64_t v34;
  CALNNotificationSourceRefresher *notificationSourceRefresher;
  CALNCalendarAppBadgeUpdater *v36;
  void *v37;
  uint64_t v38;
  CALNCalendarAppBadgeUpdater *calendarAppBadgeUpdater;
  CALNInboxNotificationMonitor *v40;
  uint64_t v41;
  NSArray *modules;
  void *v44;
  EKTravelEngine *v45;
  _EKAlarmEngine *v46;
  void *v47;
  unsigned int v48;
  _QWORD v49[4];
  id v50;
  id buf;
  objc_super v52;
  _QWORD v53[7];

  v53[5] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)CALNNotificationServerModule;
  v2 = -[CALNNotificationServerModule init](&v52, sel_init);
  if (v2)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Creating notification server module", (uint8_t *)&buf, 2u);
    }

    +[CALNNotificationServerModule _migrateNotificationFiles](CALNNotificationServerModule, "_migrateNotificationFiles");
    v48 = objc_msgSend(MEMORY[0x24BE13F98], "hasBeenUnlockedSinceBoot");
    v4 = [CALNNotificationStorageWrapper alloc];
    v5 = (void *)objc_opt_class();
    if (v48)
      objc_msgSend(v5, "_protectedCalendarNotificationStorage");
    else
      objc_msgSend(v5, "_unprotectedCalendarNotificationStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CALNNotificationStorageWrapper initWithWrappedStorage:](v4, "initWithWrappedStorage:", v6);
    calendarStorageWrapper = v2->_calendarStorageWrapper;
    v2->_calendarStorageWrapper = (CALNNotificationStorageWrapper *)v7;

    objc_initWeak(&buf, v2);
    v9 = objc_alloc(MEMORY[0x24BDC74D8]);
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __36__CALNNotificationServerModule_init__block_invoke;
    v49[3] = &unk_24D4851C0;
    objc_copyWeak(&v50, &buf);
    v10 = objc_msgSend(v9, "initWithCreationBlock:", v49);
    eventStoreProvider = v2->_eventStoreProvider;
    v2->_eventStoreProvider = (EKEphemeralCacheEventStoreProvider *)v10;

    v12 = -[CALNInboxNotificationMonitor initWithEventStoreProvider:]([CALNInboxNotificationMonitor alloc], "initWithEventStoreProvider:", v2->_eventStoreProvider);
    inboxNotificationMonitor = v2->_inboxNotificationMonitor;
    v2->_inboxNotificationMonitor = v12;

    v14 = objc_alloc_init(_EKAlarmEngine);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[CALNEKAlarmEngineMonitor initWithAlarmEngine:notificationCenter:]([CALNEKAlarmEngineMonitor alloc], "initWithAlarmEngine:notificationCenter:", v14, v15);
    v46 = v14;
    v47 = (void *)v15;
    objc_msgSend(MEMORY[0x24BDC74D0], "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "syntheticTravelAdvisoriesEnabled");

    v18 = off_24D483CD8;
    if (!(_DWORD)v15)
      v18 = off_24D483AF8;
    -[__objc2_class sharedInstance](*v18, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = -[EKTravelEngine initWithRouteHypothesizerProvider:]([EKTravelEngine alloc], "initWithRouteHypothesizerProvider:", v19);
    v21 = -[CALNEKTravelEngine initWithTravelEngine:]([CALNEKTravelEngine alloc], "initWithTravelEngine:", v20);
    objc_msgSend((id)objc_opt_class(), "_timeToLeaveRefreshStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v19;
    v45 = v20;
    v23 = -[CALNDefaultTimeToLeaveRefreshMonitor initWithStorage:]([CALNDefaultTimeToLeaveRefreshMonitor alloc], "initWithStorage:", v22);
    +[CALNUNUserNotificationCenterFactory sharedInstance](CALNUNUserNotificationCenterFactory, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNCUIKIconProvider sharedInstance](CALNCUIKIconProvider, "sharedInstance");
    v25 = objc_claimAutoreleasedReturnValue();
    iconProvider = v2->_iconProvider;
    v2->_iconProvider = (CALNNotificationIconProvider *)v25;

    v27 = -[CALNNotificationIconCache initWithIconProvider:]([CALNNotificationIconCache alloc], "initWithIconProvider:", v2->_iconProvider);
    iconCache = v2->_iconCache;
    v2->_iconCache = v27;

    -[CALNNotificationServerModule _createCalendarNotificationServerWithUserNotificationCenterFactory:storage:eventStoreProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:](v2, "_createCalendarNotificationServerWithUserNotificationCenterFactory:storage:eventStoreProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:", v24, v2->_calendarStorageWrapper, v2->_eventStoreProvider, v16, v21, v23, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    objc_msgSend(v30, "notificationSources");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_calendarNotificationServer, v29);
    v32 = [CALNNotificationSourceRefresher alloc];
    -[CALNNotificationServerModule inboxNotificationMonitor](v2, "inboxNotificationMonitor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[CALNNotificationSourceRefresher initWithSources:notificationMonitor:notificationManager:](v32, "initWithSources:notificationMonitor:notificationManager:", v31, v33, v30);
    notificationSourceRefresher = v2->_notificationSourceRefresher;
    v2->_notificationSourceRefresher = (CALNNotificationSourceRefresher *)v34;

    v36 = [CALNCalendarAppBadgeUpdater alloc];
    -[CALNNotificationServerModule inboxNotificationMonitor](v2, "inboxNotificationMonitor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[CALNCalendarAppBadgeUpdater initWithInboxNotificationMonitor:](v36, "initWithInboxNotificationMonitor:", v37);
    calendarAppBadgeUpdater = v2->_calendarAppBadgeUpdater;
    v2->_calendarAppBadgeUpdater = (CALNCalendarAppBadgeUpdater *)v38;

    v40 = v2->_inboxNotificationMonitor;
    v53[0] = v2->_calendarNotificationServer;
    v53[1] = v40;
    v53[2] = v16;
    v53[3] = v21;
    v53[4] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 5);
    v41 = objc_claimAutoreleasedReturnValue();
    modules = v2->_modules;
    v2->_modules = (NSArray *)v41;

    if (v48)
    {
      -[CALNNotificationServerModule _reloadTriggeredEventNotificationData](v2, "_reloadTriggeredEventNotificationData");
      -[CALNTriggeredEventNotificationSource updateSnoozeOptionsForPostedNotifications](v2->_triggeredEventNotificationSource, "updateSnoozeOptionsForPostedNotifications");
    }
    -[CALNNotificationServerModule _updateLocaleReloadIfDifferent:](v2, "_updateLocaleReloadIfDifferent:", v48);
    -[CALNNotificationServerModule _registerSettingsCaptureHandlers](v2, "_registerSettingsCaptureHandlers");

    objc_destroyWeak(&v50);
    objc_destroyWeak(&buf);
  }
  return v2;
}

- (void)updateIconsToNewVersionIfNeeded
{
  CALNNotificationIconUpdater *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CALNNotificationIconUpdater *v8;
  CALNDefaultIconIdentifierVersionProvider *v9;

  v9 = objc_alloc_init(CALNDefaultIconIdentifierVersionProvider);
  v3 = [CALNNotificationIconUpdater alloc];
  objc_msgSend((id)objc_opt_class(), "_protectedCalendarNotificationStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule iconCache](self, "iconCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule iconProvider](self, "iconProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule calendarNotificationServer](self, "calendarNotificationServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CALNNotificationIconUpdater initWithIconIdentifierVersionProvider:protectedNotificationStorage:iconCache:iconIdentifierProvider:notificationManager:](v3, "initWithIconIdentifierVersionProvider:protectedNotificationStorage:iconCache:iconIdentifierProvider:notificationManager:", v9, v4, v5, v6, v7);

  -[CALNNotificationIconUpdater updateIconsToNewVersionIfNeeded](v8, "updateIconsToNewVersionIfNeeded");
}

- (id)_createCalendarNotificationServerWithUserNotificationCenterFactory:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CALNUNUserNotificationCenter *v23;
  CALNUNUserNotificationCenter *v24;
  void *v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = [CALNUNUserNotificationCenter alloc];
  v24 = -[CALNUNUserNotificationCenter initWithBundleIdentifier:userNotificationCenterFactory:storage:notificationIconCache:](v23, "initWithBundleIdentifier:userNotificationCenterFactory:storage:notificationIconCache:", *MEMORY[0x24BE14020], v22, v21, self->_iconCache);

  -[CALNNotificationServerModule _createNotificationServerWithUserNotificationCenter:storage:eventStoreProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:](self, "_createNotificationServerWithUserNotificationCenter:storage:eventStoreProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:", v24, v21, v20, v19, v18, v17, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_createNotificationServerWithUserNotificationCenter:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  CALNNotificationServer *v23;
  void *v24;
  id v26;
  id v27;
  id v28;

  v27 = a9;
  v28 = a8;
  v26 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[CALNNotificationServerModule inboxNotificationMonitor](self, "inboxNotificationMonitor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNCalAnalyticsHandler sharedInstance](CALNCalAnalyticsHandler, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BE13F98]);
  v23 = -[CALNNotificationServer initWithUserNotificationCenter:storage:analyticsHandler:deviceLockObserver:]([CALNNotificationServer alloc], "initWithUserNotificationCenter:storage:analyticsHandler:deviceLockObserver:", v19, v18, v21, v22);

  -[CALNNotificationServerModule _createNotificationSourcesWithNotificationManager:eventStoreProvider:inboxNotificationProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:](self, "_createNotificationSourcesWithNotificationManager:eventStoreProvider:inboxNotificationProvider:alarmEngineMonitor:travelEngine:timeToLeaveRefreshMonitor:timeToLeaveRefreshStorage:", v23, v17, v20, v16, v26, v28, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNNotificationServer setNotificationSources:](v23, "setNotificationSources:", v24);
  return v23;
}

- (id)_createNotificationSourcesWithNotificationManager:(id)a3 eventStoreProvider:(id)a4 inboxNotificationProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CALNEventInvitationNotificationEKDataSource *v22;
  void *v23;
  CALNEventInvitationResponseNotificationEKDataSource *v24;
  void *v25;
  CALNEventCanceledNotificationEKDataSource *v26;
  void *v27;
  CALNTriggeredEventNotificationMailtoURLProvider *v28;
  void *v29;
  CALNSchedulingSnoozeUpdateTimer *v30;
  CALNSchedulingSnoozeUpdateTimer *snoozeUpdateTimer;
  CALNTriggeredEventNotificationSource *v32;
  CALNTriggeredEventNotificationSource *triggeredEventNotificationSource;
  CALNSharedCalendarInvitationNotificationEKDataSource *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  CALNSharedCalendarInvitationResponseNotificationEKDataSource *v38;
  void *v39;
  CALNSharedCalendarInvitationResponseNotificationSource *v40;
  CALNCalendarResourceChangedNotificationEKDataSource *v41;
  void *v42;
  CALNCalendarResourceChangedNotificationEKDataSource *v43;
  uint64_t v44;
  CALNCalendarResourceChangedNotificationEKDataSource *v45;
  CALNCalendarResourceChangedNotificationSource *v46;
  CALNSuggestedEventNotificationEKDataSource *v47;
  CALNSuggestedEventNotificationSource *v48;
  CALNFakeNotificationSource *v49;
  CALNTriggeredEventNotificationSource *v50;
  CALNSharedCalendarInvitationNotificationSource *v52;
  CALNSharedCalendarInvitationResponseNotificationEKDataSource *v53;
  void *v54;
  void *v55;
  void *v56;
  CALNEKTravelAdvisoryTimelinessAuthority *v57;
  CALNXPCActivityScheduler *v58;
  CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *v59;
  CALNDefaultTriggeredEventNotificationTransitionProvider *v60;
  CALNDefaultTriggeredEventNotificationTriggerHelper *v61;
  xpc_object_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  CALNCUIKTravelAdvisoryDescriptionGenerator *v67;
  id v68;
  CALNDefaultTravelAdvisoryAuthority *v69;
  id v70;
  CALNSharedCalendarInvitationNotificationEKDataSource *v71;
  CALNEventCanceledNotificationSource *v72;
  CALNTriggeredEventNotificationMailtoURLProvider *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CALNEventInvitationResponseNotificationSource *v78;
  void *v79;
  void *v80;
  void *v81;
  CALNEventInvitationNotificationSource *v82;
  CALNEventCanceledNotificationEKDataSource *v83;
  CALNEventInvitationResponseNotificationEKDataSource *v84;
  CALNEventInvitationNotificationEKDataSource *v85;
  void *v86;
  void *v87;
  CALNTriggeredEventNotificationEKDataSource *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[11];

  v94[9] = *MEMORY[0x24BDAC8D0];
  v70 = a9;
  v66 = a8;
  v64 = a7;
  v68 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[CALNDefaultEKCalendarNotificationReferenceProvider sharedInstance](CALNDefaultEKCalendarNotificationReferenceProvider, "sharedInstance");
  v18 = objc_claimAutoreleasedReturnValue();
  +[CALNCUIKIconProvider sharedInstance](CALNCUIKIconProvider, "sharedInstance");
  v19 = objc_claimAutoreleasedReturnValue();
  +[CALNNullRemoteMutator sharedInstance](CALNNullRemoteMutator, "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDataAccessExpressSharedConnection sharedConnection](CALNDataAccessExpressSharedConnection, "sharedConnection");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEKUIEventRepresentationProvider sharedInstance](CALNEKUIEventRepresentationProvider, "sharedInstance");
  v20 = objc_claimAutoreleasedReturnValue();
  +[CALNEKUIEventRepresentationProvider sharedInstance](CALNEKUIEventRepresentationProvider, "sharedInstance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE13FD0], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [CALNEventInvitationNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[CALNEventInvitationNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:remoteMutator:dataSourceEventRepresentationProvider:preferences:](v22, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:remoteMutator:dataSourceEventRepresentationProvider:preferences:", v16, v15, v18, v92, v20, v23);

  v82 = -[CALNEventInvitationNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:]([CALNEventInvitationNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:", v85, v17, v19, v21);
  v24 = [CALNEventInvitationResponseNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v15;
  v87 = (void *)v18;
  v84 = -[CALNEventInvitationResponseNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:dataSourceEventRepresentationProvider:preferences:](v24, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:dataSourceEventRepresentationProvider:preferences:", v16, v15, v18, v20, v25);

  v86 = (void *)v19;
  v78 = -[CALNEventInvitationResponseNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:]([CALNEventInvitationResponseNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:", v84, v17, v19, v21);
  v26 = [CALNEventCanceledNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v20;
  v83 = -[CALNEventCanceledNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:remoteMutator:dataSourceEventRepresentationProvider:preferences:](v26, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:remoteMutator:dataSourceEventRepresentationProvider:preferences:", v16, v15, v18, v92, v20, v27);

  v72 = -[CALNEventCanceledNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:]([CALNEventCanceledNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:dateProvider:", v83, v17, v19, v21);
  +[CALNCLCoreLocationProvider sharedInstance](CALNCLCoreLocationProvider, "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEKTTLEventTracker sharedInstance](CALNEKTTLEventTracker, "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEKFoundInAppsEventTracker sharedInstance](CALNEKFoundInAppsEventTracker, "sharedInstance");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEKSuggestionsServiceLogger sharedInstance](CALNEKSuggestionsServiceLogger, "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNGEORouteHypothesizerProvider sharedInstance](CALNGEORouteHypothesizerProvider, "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEKDebugPreferences sharedInstance](CALNEKDebugPreferences, "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = [CALNTriggeredEventNotificationMailtoURLProvider alloc];
  +[CALNMSMailAccounts sharedInstance](CALNMSMailAccounts, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[CALNTriggeredEventNotificationMailtoURLProvider initWithMailAccounts:](v28, "initWithMailAccounts:", v29);

  v88 = -[CALNTriggeredEventNotificationEKDataSource initWithEventStoreProvider:remoteMutator:dataSourceEventRepresentationProvider:coreLocationProvider:ttlEventTracker:alarmEngineMonitor:travelEngine:foundInAppsEventTracker:suggestionsServiceLogger:routeHypothesizerProvider:timeToLeaveRefreshMonitor:debugPreferences:mailtoURLProvider:]([CALNTriggeredEventNotificationEKDataSource alloc], "initWithEventStoreProvider:remoteMutator:dataSourceEventRepresentationProvider:coreLocationProvider:ttlEventTracker:alarmEngineMonitor:travelEngine:foundInAppsEventTracker:suggestionsServiceLogger:routeHypothesizerProvider:timeToLeaveRefreshMonitor:debugPreferences:mailtoURLProvider:", v16, v92, v20, v80, v77, v68, v64, v79, v76, v75, v66, v74, v73);
  v69 = objc_alloc_init(CALNDefaultTravelAdvisoryAuthority);
  v61 = -[CALNDefaultTriggeredEventNotificationTriggerHelper initWithTravelAdvisoryAuthority:dateProvider:]([CALNDefaultTriggeredEventNotificationTriggerHelper alloc], "initWithTravelAdvisoryAuthority:dateProvider:", v69, v21);
  v60 = -[CALNDefaultTriggeredEventNotificationTransitionProvider initWithTravelAdvisoryAuthority:dateProvider:]([CALNDefaultTriggeredEventNotificationTransitionProvider alloc], "initWithTravelAdvisoryAuthority:dateProvider:", v69, v21);
  v67 = objc_alloc_init(CALNCUIKTravelAdvisoryDescriptionGenerator);
  v59 = -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider initWithTravelAdvisoryDescriptionGenerator:dateProvider:]([CALNDefaultTriggeredEventNotificationBodyDescriptionProvider alloc], "initWithTravelAdvisoryDescriptionGenerator:dateProvider:", v67, v21);
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC7558]), "initWithDateProvider:", v21);
  v57 = -[CALNEKTravelAdvisoryTimelinessAuthority initWithTravelAdvisoryTimelinessAuthority:]([CALNEKTravelAdvisoryTimelinessAuthority alloc], "initWithTravelAdvisoryTimelinessAuthority:", v65);
  objc_msgSend((id)objc_opt_class(), "_unprotectedTriggeredEventNotificationDataStorage");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLaunchServicesURLHandler sharedInstance](CALNLaunchServicesURLHandler, "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDefaultTriggeredEventNotificationMapItemURLProvider sharedInstance](CALNDefaultTriggeredEventNotificationMapItemURLProvider, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v62, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  v58 = -[CALNXPCActivityScheduler initWithActivityIdentifier:otherCriteria:]([CALNXPCActivityScheduler alloc], "initWithActivityIdentifier:otherCriteria:", CFSTR("com.apple.calendar.notification.snoozeRefresh"), v62);
  v30 = -[CALNSchedulingSnoozeUpdateTimer initWithDateProvider:scheduler:]([CALNSchedulingSnoozeUpdateTimer alloc], "initWithDateProvider:scheduler:", v21, v58);
  snoozeUpdateTimer = self->_snoozeUpdateTimer;
  self->_snoozeUpdateTimer = v30;

  v32 = -[CALNTriggeredEventNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:triggerHelper:transitionProvider:bodyDescriptionProvider:travelAdvisoryTimelinessAuthority:dateProvider:notificationDataStorage:urlHandler:mapItemURLProvider:timeToLeaveRefreshStorage:snoozeUpdateTimer:]([CALNTriggeredEventNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:triggerHelper:transitionProvider:bodyDescriptionProvider:travelAdvisoryTimelinessAuthority:dateProvider:notificationDataStorage:urlHandler:mapItemURLProvider:timeToLeaveRefreshStorage:snoozeUpdateTimer:", v88, v17, v19, v91, v61, v60, v59, v57, v21, v56, v55, v54, v70, self->_snoozeUpdateTimer);
  triggeredEventNotificationSource = self->_triggeredEventNotificationSource;
  self->_triggeredEventNotificationSource = v32;

  v34 = [CALNSharedCalendarInvitationNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  v37 = v18;
  v71 = -[CALNSharedCalendarInvitationNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:dataAccessExpressConnection:preferences:](v34, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:dataAccessExpressConnection:preferences:", v36, v63, v18, v93, v35);

  v52 = -[CALNSharedCalendarInvitationNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:]([CALNSharedCalendarInvitationNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:", v71, v17, v19, v91);
  v38 = [CALNSharedCalendarInvitationResponseNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[CALNSharedCalendarInvitationResponseNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:preferences:](v38, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:preferences:", v36, v63, v18, v39);

  v40 = -[CALNSharedCalendarInvitationResponseNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:]([CALNSharedCalendarInvitationResponseNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:", v53, v17, v19, v91);
  v41 = [CALNCalendarResourceChangedNotificationEKDataSource alloc];
  objc_msgSend(MEMORY[0x24BDC74A0], "calendarPreferences");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v41;
  v44 = v37;
  v45 = -[CALNCalendarResourceChangedNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:preferences:](v43, "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:preferences:", v36, v63, v37, v42);

  v46 = -[CALNCalendarResourceChangedNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:dateProvider:]([CALNCalendarResourceChangedNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:sourceEventRepresentationProvider:dateProvider:", v45, v17, v19, v91, v21);
  v47 = -[CALNSuggestedEventNotificationEKDataSource initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:]([CALNSuggestedEventNotificationEKDataSource alloc], "initWithEventStoreProvider:inboxNotificationProvider:notificationReferenceProvider:", v36, v63, v44);

  v48 = -[CALNSuggestedEventNotificationSource initWithDataSource:notificationManager:iconIdentifierProvider:]([CALNSuggestedEventNotificationSource alloc], "initWithDataSource:notificationManager:iconIdentifierProvider:", v47, v17, v19);
  v49 = -[CALNFakeNotificationSource initWithNotificationManager:iconIdentifierProvider:sourceIdentifierSuffix:]([CALNFakeNotificationSource alloc], "initWithNotificationManager:iconIdentifierProvider:sourceIdentifierSuffix:", v17, v86, CFSTR("calendar"));

  v94[0] = v82;
  v94[1] = v78;
  v50 = self->_triggeredEventNotificationSource;
  v94[2] = v72;
  v94[3] = v50;
  v94[4] = v52;
  v94[5] = v40;
  v94[6] = v46;
  v94[7] = v48;
  v94[8] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 9);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  return v90;
}

- (void)activate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "activate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  if (objc_msgSend(MEMORY[0x24BE13F98], "hasBeenUnlockedSinceBoot"))
    -[CALNNotificationServerModule _updateSourceClientIdentifiersIfNeeded](self, "_updateSourceClientIdentifiersIfNeeded");
}

- (void)deactivate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "deactivate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)refreshEventStoreInResponseToDatabaseChangeNotification:(id)a3
{
  id v4;
  NSObject *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastCreatedEventStore);
  if (WeakRetained)
  {
    -[EKEphemeralCacheEventStoreProvider eventStore](self->_eventStoreProvider, "eventStore");
    v6 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == WeakRetained)
    {
      if (v8)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Got a database changed notification and we have an EKEventStore. Letting the event store handle the notification first.", v10, 2u);
      }

      -[NSObject handleExternalDatabaseChangeNotification:](WeakRetained, "handleExternalDatabaseChangeNotification:", v4);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Missed refreshing EKEventStore in response to handling database change notification; continuing without refreshing.",
          buf,
          2u);
      }

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Not refreshing EKEventStore before handling database change notification because we don't have an EKEventStore right now.", v9, 2u);
    }
  }

}

- (void)_registerSettingsCaptureHandlers
{
  NSObject *v2;
  dispatch_queue_t v3;

  CADStatsRegisterCollectionCallback();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.calendar.notifications.stateCaptureQ", v2);

  CalAddStateCaptureBlock();
}

void __64__CALNNotificationServerModule__registerSettingsCaptureHandlers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = a2;
  objc_msgSend(v2, "userNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectSettingsStats:", v3);

}

id __64__CALNNotificationServerModule__registerSettingsCaptureHandlers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectSettingsStats:", v2);

  return v2;
}

- (void)_updateLocaleReloadIfDifferent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  CALNNotificationServerModule *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("NotificationsLastLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
  {
    if (v3)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__CALNNotificationServerModule__updateLocaleReloadIfDifferent___block_invoke;
      block[3] = &unk_24D484800;
      v12 = v8;
      v13 = v6;
      v14 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v9 = v12;
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v16 = v8;
        v17 = 2114;
        v18 = v6;
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Updating locale from %{public}@ to %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BE13F88], "shared");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("NotificationsLastLocale"));
    }

  }
}

void __63__CALNNotificationServerModule__updateLocaleReloadIfDifferent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "Reloading notifications because locale changed from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }

  +[CALNNotificationServerModule _protectedCalendarNotificationStorage](CALNNotificationServerModule, "_protectedCalendarNotificationStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v5, "notificationRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "calendarNotificationServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_reloadNotificationRecords:forNotificationServer:", v7, v8);

  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("NotificationsLastLocale"));

}

- (void)_reloadTriggeredEventNotificationData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  +[CALNNotificationServerModule _unprotectedTriggeredEventNotificationDataStorage](CALNNotificationServerModule, "_unprotectedTriggeredEventNotificationDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationServerModule _protectedTriggeredEventNotificationDataStorage](CALNNotificationServerModule, "_protectedTriggeredEventNotificationDataStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CALNTriggeredEventNotificationSource migrateToStorage:](self->_triggeredEventNotificationSource, "migrateToStorage:", v4);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Reloaded triggered event notification data after first unlock", buf, 2u);
    }

    objc_msgSend(v3, "removeNotificationData");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Already reloaded triggered event notification data after first unlock; not doing it again",
        v8,
        2u);
    }

  }
}

- (void)_reloadNotificationsAfterFirstUnlock
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Reloading calendar notifications after first unlock", v8, 2u);
  }

  -[CALNNotificationServerModule calendarNotificationServer](self, "calendarNotificationServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_unprotectedCalendarNotificationStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_protectedCalendarNotificationStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule calendarStorageWrapper](self, "calendarStorageWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule _reloadNotificationsFromUnprotectedStorage:intoProtectedStorage:withStorageWrapper:forNotificationServer:](self, "_reloadNotificationsFromUnprotectedStorage:intoProtectedStorage:withStorageWrapper:forNotificationServer:", v5, v6, v7, v4);

}

- (void)_reloadNotificationsFromUnprotectedStorage:(id)a3 intoProtectedStorage:(id)a4 withStorageWrapper:(id)a5 forNotificationServer:(id)a6
{
  id v10;
  void *v11;
  id v12;

  v10 = a6;
  v12 = a3;
  objc_msgSend(a5, "setWrappedStorage:", a4);
  objc_msgSend(v12, "notificationRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationServerModule _reloadNotificationRecords:forNotificationServer:](self, "_reloadNotificationRecords:forNotificationServer:", v11, v10);

  -[CALNNotificationServerModule _removeNotificationsFromUnprotectedStorage:](self, "_removeNotificationsFromUnprotectedStorage:", v12);
}

- (void)didRegisterForAlarms
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "didRegisterForAlarms");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)receivedAlarmNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "receivedAlarmNamed:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)protectedDataDidBecomeAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  +[CALNNotificationUtilities createSentinelFileIfNeeded](CALNNotificationUtilities, "createSentinelFileIfNeeded");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CALNNotificationServerModule modules](self, "modules", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "protectedDataDidBecomeAvailable");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[CALNNotificationServerModule _reloadTriggeredEventNotificationData](self, "_reloadTriggeredEventNotificationData");
  -[CALNNotificationServerModule _reloadNotificationsAfterFirstUnlock](self, "_reloadNotificationsAfterFirstUnlock");
  -[CALNNotificationServerModule _updateSourceClientIdentifiersIfNeeded](self, "_updateSourceClientIdentifiersIfNeeded");
  -[CALNNotificationServerModule updateIconsToNewVersionIfNeeded](self, "updateIconsToNewVersionIfNeeded");

}

- (void)_updateSourceClientIdentifiersIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("NotificationSourceClientIdentifierVersion"));

  if (v4 != 1)
  {
    objc_msgSend(MEMORY[0x24BE13F88], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteger:forKey:", 1, CFSTR("NotificationSourceClientIdentifierVersion"));

    -[CALNNotificationServerModule notificationSourceRefresher](self, "notificationSourceRefresher");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshNotifications");

  }
}

- (void)_reloadNotificationRecords:(id)a3 forNotificationServer:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v34;
    v11 = 0x24D483000uLL;
    *(_QWORD *)&v8 = 138412546;
    v29 = v8;
    v30 = v6;
    do
    {
      v12 = 0;
      v31 = v9;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        objc_msgSend(v13, "sourceIdentifier", v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationSourceForSourceIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v13, "mutableCopy");
          objc_msgSend(v13, "sourceClientIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "contentForNotificationWithSourceClientIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setContent:](v16, "setContent:", v18);

          v19 = -[NSObject copy](v16, "copy");
          objc_msgSend(v6, "updateRecord:", v19);

          objc_msgSend(*(id *)(v11 + 2864), "calendar");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject sourceIdentifier](v16, "sourceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject sourceClientIdentifier](v16, "sourceClientIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject content](v16, "content");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "title");
            v24 = v11;
            v25 = v10;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v21;
            v39 = 2114;
            v40 = v22;
            v41 = 2112;
            v42 = v26;
            _os_log_impl(&dword_215D9B000, v20, OS_LOG_TYPE_DEFAULT, "Reloaded notification record with source identifier = %{public}@, source client identifier = %{public}@, title = %@", buf, 0x20u);

            v10 = v25;
            v11 = v24;
            v6 = v30;

            v9 = v31;
          }

        }
        else
        {
          objc_msgSend(*(id *)(v11 + 2864), "defaultCategory");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "sourceClientIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "sourceIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v38 = v27;
            v39 = 2114;
            v40 = v28;
            _os_log_error_impl(&dword_215D9B000, v16, OS_LOG_TYPE_ERROR, "Cannot reload notification with sourceClientIdentifier = %@. Failed to find notification source with sourceIdentifier = %{public}@.", buf, 0x16u);

          }
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v9);
  }

}

- (void)_removeNotificationsFromUnprotectedStorage:(id)a3
{
  objc_msgSend(a3, "removeNotificationRecordsPassingTest:", &__block_literal_global_19);
}

uint64_t __75__CALNNotificationServerModule__removeNotificationsFromUnprotectedStorage___block_invoke()
{
  return 1;
}

+ (id)_notificationStoragePathWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  CALNDefaultCalendarDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createNotificationStorageAtPath:(id)a3 protected:(BOOL)a4
{
  uint64_t v4;
  void *v5;

  +[CALNPersistentNotificationStorage persistentNotificationStorageWithPath:isProtectedStorage:](CALNPersistentNotificationStorage, "persistentNotificationStorageWithPath:isProtectedStorage:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_createNotificationStorageAtPath_protected__storage;
  _createNotificationStorageAtPath_protected__storage = v4;

  return (id)_createNotificationStorageAtPath_protected__storage;
}

+ (void)_setProtectedClassForStorageAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD0CF0];
  v11[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v5, v3, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CALNNotificationServerModule _setProtectedClassForStorageAtPath:].cold.1((uint64_t)v3, v8);

  }
}

+ (id)_unprotectedCalendarNotificationStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CALNNotificationServerModule__unprotectedCalendarNotificationStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_unprotectedCalendarNotificationStorage_onceToken != -1)
    dispatch_once(&_unprotectedCalendarNotificationStorage_onceToken, block);
  return (id)_unprotectedCalendarNotificationStorage_storage;
}

void __71__CALNNotificationServerModule__unprotectedCalendarNotificationStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_notificationStoragePathWithName:", CFSTR("Notifications.Calendar.Unprotected"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createNotificationStorageAtPath:protected:", v4, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unprotectedCalendarNotificationStorage_storage;
  _unprotectedCalendarNotificationStorage_storage = v2;

}

+ (id)_protectedCalendarNotificationStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CALNNotificationServerModule__protectedCalendarNotificationStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_protectedCalendarNotificationStorage_onceToken != -1)
    dispatch_once(&_protectedCalendarNotificationStorage_onceToken, block);
  return (id)_protectedCalendarNotificationStorage_storage;
}

void __69__CALNNotificationServerModule__protectedCalendarNotificationStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_notificationStoragePathWithName:", CFSTR("Notifications.Calendar.Protected"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createNotificationStorageAtPath:protected:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_protectedCalendarNotificationStorage_storage;
  _protectedCalendarNotificationStorage_storage = v2;

  objc_msgSend(*(id *)(a1 + 32), "_setProtectedClassForStorageAtPath:", v4);
}

+ (id)_unprotectedTriggeredEventNotificationDataStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CALNNotificationServerModule__unprotectedTriggeredEventNotificationDataStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_unprotectedTriggeredEventNotificationDataStorage_onceToken != -1)
    dispatch_once(&_unprotectedTriggeredEventNotificationDataStorage_onceToken, block);
  return (id)_unprotectedTriggeredEventNotificationDataStorage_storage;
}

void __81__CALNNotificationServerModule__unprotectedTriggeredEventNotificationDataStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_triggeredEventNotificationDataStoragePathWithName:", CFSTR("Notifications.Calendar.TriggeredEvent.NotificationData.Unprotected"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createTriggeredEventNotificationDataStorageAtPath:protected:", v4, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unprotectedTriggeredEventNotificationDataStorage_storage;
  _unprotectedTriggeredEventNotificationDataStorage_storage = v2;

}

+ (id)_protectedTriggeredEventNotificationDataStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CALNNotificationServerModule__protectedTriggeredEventNotificationDataStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_protectedTriggeredEventNotificationDataStorage_onceToken != -1)
    dispatch_once(&_protectedTriggeredEventNotificationDataStorage_onceToken, block);
  return (id)_protectedTriggeredEventNotificationDataStorage_storage;
}

void __79__CALNNotificationServerModule__protectedTriggeredEventNotificationDataStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_triggeredEventNotificationDataStoragePathWithName:", CFSTR("Notifications.Calendar.TriggeredEvent.NotificationData"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createTriggeredEventNotificationDataStorageAtPath:protected:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_protectedTriggeredEventNotificationDataStorage_storage;
  _protectedTriggeredEventNotificationDataStorage_storage = v2;

  objc_msgSend(*(id *)(a1 + 32), "_setProtectedClassForStorageAtPath:", v4);
}

+ (id)_triggeredEventNotificationDataStoragePathWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  CALNDefaultCalendarDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createTriggeredEventNotificationDataStorageAtPath:(id)a3 protected:(BOOL)a4
{
  return +[CALNPersistentTriggeredEventNotificationDataStorage persistentStorageWithPath:isProtectedStorage:](CALNPersistentTriggeredEventNotificationDataStorage, "persistentStorageWithPath:isProtectedStorage:", a3, a4);
}

+ (id)_timeToLeaveRefreshStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CALNNotificationServerModule__timeToLeaveRefreshStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_timeToLeaveRefreshStorage_onceToken != -1)
    dispatch_once(&_timeToLeaveRefreshStorage_onceToken, block);
  return (id)_timeToLeaveRefreshStorage_storage;
}

void __58__CALNNotificationServerModule__timeToLeaveRefreshStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_timeToLeaveRefreshStoragePathWithName:", CFSTR("Notifications.Calendar.TriggeredEvent.TimeToLeaveRefresh"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createTimeToLeaveRefreshStorageAtPath:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_timeToLeaveRefreshStorage_storage;
  _timeToLeaveRefreshStorage_storage = v2;

}

+ (id)_timeToLeaveRefreshStoragePathWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  CALNDefaultCalendarDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createTimeToLeaveRefreshStorageAtPath:(id)a3
{
  return +[CALNPersistentTimeToLeaveRefreshStorage persistentStorageWithPath:](CALNPersistentTimeToLeaveRefreshStorage, "persistentStorageWithPath:", a3);
}

+ (void)_migrateNotificationFiles
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Failed to remove old directory (%@): %@", (uint8_t *)&v3, 0x16u);
}

+ (id)_filesToMigrate
{
  return &unk_24D49C080;
}

+ (void)_migrateNotificationFilesFromDirectory:(id)a3 toDirectory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  NSObject *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v6 = a4;
  objc_msgSend(a1, "_filesToMigrate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    *(_QWORD *)&v11 = 138543618;
    v22 = v11;
    v24 = *(_QWORD *)v29;
    v25 = v9;
    v23 = v6;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v6, "stringByAppendingPathComponent:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "fileExistsAtPath:", v16))
        {
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v15;
            _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "Not attempting to migrate file %{public}@ because it already exists in the destination directory", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v26, "stringByAppendingPathComponent:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "fileExistsAtPath:", v17) & 1) != 0)
          {
            v27 = 0;
            v18 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v17, v16, &v27);
            v19 = v27;
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if ((v18 & 1) != 0)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v15;
                _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Successfully moved file %{public}@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v22;
              v33 = v15;
              v34 = 2112;
              v35 = v19;
              _os_log_error_impl(&dword_215D9B000, v21, OS_LOG_TYPE_ERROR, "Error moving file %{public}@: %@", buf, 0x16u);
            }

            v6 = v23;
            v13 = v24;
            v9 = v25;
          }
          else
          {
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v15;
              _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Not attempting to migrate file %{public}@ because it doesn't exist in the source directory", buf, 0xCu);
            }
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (CALNNotificationServer)calendarNotificationServer
{
  return self->_calendarNotificationServer;
}

- (CALNNotificationSourceRefresher)notificationSourceRefresher
{
  return self->_notificationSourceRefresher;
}

- (CALNCalendarAppBadgeUpdater)calendarAppBadgeUpdater
{
  return self->_calendarAppBadgeUpdater;
}

- (CALNNotificationStorageWrapper)calendarStorageWrapper
{
  return self->_calendarStorageWrapper;
}

- (CALNTriggeredEventNotificationSource)triggeredEventNotificationSource
{
  return self->_triggeredEventNotificationSource;
}

- (CALNNotificationIconCache)iconCache
{
  return self->_iconCache;
}

- (CALNSchedulingSnoozeUpdateTimer)snoozeUpdateTimer
{
  return self->_snoozeUpdateTimer;
}

- (CALNNotificationIconProvider)iconProvider
{
  return self->_iconProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
  objc_storeStrong((id *)&self->_snoozeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_triggeredEventNotificationSource, 0);
  objc_storeStrong((id *)&self->_calendarStorageWrapper, 0);
  objc_storeStrong((id *)&self->_calendarAppBadgeUpdater, 0);
  objc_storeStrong((id *)&self->_notificationSourceRefresher, 0);
  objc_storeStrong((id *)&self->_calendarNotificationServer, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
  objc_destroyWeak((id *)&self->_lastCreatedEventStore);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

+ (void)_setProtectedClassForStorageAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Failed to set data class protection for path %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
