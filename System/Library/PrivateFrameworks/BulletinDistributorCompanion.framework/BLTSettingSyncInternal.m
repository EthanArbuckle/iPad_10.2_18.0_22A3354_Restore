@implementation BLTSettingSyncInternal

- (BLTSettingSyncInternal)init
{
  return -[BLTSettingSyncInternal initWithSectionConfiguration:queue:](self, "initWithSectionConfiguration:queue:", 0, 0);
}

- (BLTSettingSyncInternal)initWithSectionConfiguration:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  BLTSettingSyncInternal *v9;
  BLTSettingSyncInternal *v10;
  void *v11;
  BLTWristStateObserver *v12;
  BLTWristStateObserver *wristStateObserver;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BLTSettingSyncInternal;
  v9 = -[BLTSettingSyncInternal init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionConfiguration, a3);
    +[BLTSettingsGateway surrogateWithQueue:](BLTSettingsGateway, "surrogateWithQueue:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSettingSyncInternal setSettingsGateway:](v10, "setSettingsGateway:", v11);

    v12 = objc_alloc_init(BLTWristStateObserver);
    wristStateObserver = v10->_wristStateObserver;
    v10->_wristStateObserver = v12;

    +[BLTBBObserver surrogateWithQueue:calloutQueue:](BLTBBObserver, "surrogateWithQueue:calloutQueue:", v8, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSettingSyncInternal setObserver:](v10, "setObserver:", v14);

    -[BLTSettingSyncInternal observer](v10, "observer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v10);

    -[BLTSettingSyncInternal observer](v10, "observer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObserverFeed:", 512);

  }
  return v10;
}

- (void)connect
{
  BLTSettingSyncServer *v3;
  void *v4;
  BLTSpokenSettingSync *v5;
  void *v6;
  void *v7;
  BLTSpokenSettingSync *v8;
  BLTSpokenSettingSync *spokenSettingSync;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(BLTSettingSyncServer);
  -[BLTSettingSyncInternal setConnection:](self, "setConnection:", v3);

  -[BLTSettingSyncInternal connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = [BLTSpokenSettingSync alloc];
  -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSyncInternal connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLTSpokenSettingSync initWithSettingsGateway:syncServer:](v5, "initWithSettingsGateway:syncServer:", v6, v7);
  spokenSettingSync = self->_spokenSettingSync;
  self->_spokenSettingSync = v8;

  -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSyncInternal connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTRemoteGlobalSettingsSyncServer remoteGlobalSettingsSyncServerWithLocalEndpoint:remoteEndpoint:](BLTRemoteGlobalSettingsSyncServer, "remoteGlobalSettingsSyncServerWithLocalEndpoint:remoteEndpoint:", v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSyncInternal setRemoteGlobalSettingsSyncServer:](self, "setRemoteGlobalSettingsSyncServer:", v11);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingSyncInternal;
  -[BLTSettingSyncInternal dealloc](&v4, sel_dealloc);
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setSectionInfo:completion:]", "BLTSettingSyncInternal.m", 114, "0");
}

- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __assert_rtn("-[BLTSettingSyncInternal setSectionInfo:keypaths:completion:]", "BLTSettingSyncInternal.m", 118, "0");
}

- (void)setSectionSubtypeParametersIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:]", "BLTSettingSyncInternal.m", 122, "0");
}

- (void)removeSectionWithSectionID:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[BLTSettingSyncInternal removeSectionWithSectionID:]", "BLTSettingSyncInternal.m", 126, "0");
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6
{
  id v6;

  v6 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsLevel:sectionID:mirror:fromRemote:]", "BLTSettingSyncInternal.m", 130, "0");
}

- (void)setNotificationsGrouping:(int)a3 sectionID:(id)a4
{
  id v4;

  v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsGrouping:sectionID:]", "BLTSettingSyncInternal.m", 134, "0");
}

- (void)setNotificationsSoundEnabled:(int)a3 sectionID:(id)a4
{
  id v4;

  v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsSoundEnabled:sectionID:]", "BLTSettingSyncInternal.m", 138, "0");
}

- (void)setNotificationsCriticalAlertEnabled:(int)a3 sectionID:(id)a4
{
  id v4;

  v4 = a4;
  __assert_rtn("-[BLTSettingSyncInternal setNotificationsCriticalAlertEnabled:sectionID:]", "BLTSettingSyncInternal.m", 142, "0");
}

- (void)transportUpdateRemoteGlobalSpokenSettingEnabled:(BOOL)a3 date:(id)a4
{
  -[BLTSpokenSettingSync transportUpdateRemoteGlobalSpokenSettingEnabled:date:](self->_spokenSettingSync, "transportUpdateRemoteGlobalSpokenSettingEnabled:date:", a3, a4);
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
  -[BLTSettingSyncInternal setNotificationsLevel:sectionID:mirror:fromRemote:](self, "setNotificationsLevel:sectionID:mirror:fromRemote:", a3, a4, a5, 0);
}

- (void)enableNotifications:(BOOL)a3 sectionID:(id)a4 mirror:(BOOL)a5
{
  uint64_t v5;

  if (a3)
    v5 = 2;
  else
    v5 = 0;
  -[BLTSettingSyncInternal setNotificationsLevel:sectionID:mirror:fromRemote:](self, "setNotificationsLevel:sectionID:mirror:fromRemote:", v5, a4, a5, 0);
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  id v10;

  -[BLTSettingSyncInternal connection](self, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableStandaloneTestModeWithMinimumSendDelay:maximumSendDelay:minimumResponseDelay:maximumResponseDelay:", a3, a4, a5, a6);

}

- (void)disableStandaloneTestMode
{
  id v2;

  -[BLTSettingSyncInternal connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableStandaloneTestMode");

}

- (id)_overriddenSectionInfoForSectionID:(id)a3
{
  return 0;
}

- (BOOL)isWristDetectDisabled
{
  return -[BLTWristStateObserver isWristDetectDisabled](self->_wristStateObserver, "isWristDetectDisabled");
}

- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5
{
  return -[BLTSettingSyncInternal willNanoPresentNotificationForSectionID:subsectionIDs:subtype:category:ignoresDowntime:isCritical:](self, "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:category:ignoresDowntime:isCritical:", a3, a4, a5, 0, 0, 0);
}

- (unint64_t)willNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 subtype:(int64_t)a5 category:(id)a6 ignoresDowntime:(BOOL)a7 isCritical:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  BLTAlertStateTester *v17;
  void *v18;
  BLTSectionConfiguration *v19;
  _BOOL8 v20;
  void *v21;
  BLTSectionConfiguration *sectionConfiguration;
  void *v23;
  BLTSectionConfiguration *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  _QWORD v29[5];

  HIDWORD(v28) = a8;
  v8 = a7;
  v13 = a3;
  v14 = a6;
  v15 = a4;
  -[BLTSettingSyncInternal _overriddenSectionInfoForSectionID:](self, "_overriddenSectionInfoForSectionID:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(BLTAlertStateTester);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __124__BLTSettingSyncInternal_willNanoPresentNotificationForSectionID_subsectionIDs_subtype_category_ignoresDowntime_isCritical___block_invoke;
  v29[3] = &unk_24D762DB8;
  v29[4] = self;
  -[BLTAlertStateTester setSectionInfoRetriever:](v17, "setSectionInfoRetriever:", v29);
  objc_msgSend(v16, "factorySectionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    && (v19 = self->_sectionConfiguration,
        objc_msgSend(v16, "factorySectionID"),
        v20 = v8,
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v19) = -[BLTSectionConfigurationInternal applyAllowListToChildSections:](v19, "applyAllowListToChildSections:", v21), v21, v8 = v20, (_DWORD)v19))
  {
    sectionConfiguration = self->_sectionConfiguration;
    objc_msgSend(v16, "factorySectionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = sectionConfiguration;
    v8 = v20;
    v25 = -[BLTSectionConfigurationInternal coordinationTypeForSectionID:subtype:category:](v24, "coordinationTypeForSectionID:subtype:category:", v23, a5, v14);

  }
  else
  {
    v25 = -[BLTSectionConfigurationInternal coordinationTypeForSectionID:subtype:category:](self->_sectionConfiguration, "coordinationTypeForSectionID:subtype:category:", v13, a5, v14);
  }
  LOBYTE(v28) = BYTE4(v28);
  v26 = -[BLTAlertStateTester willNanoPresentNotificationForSectionInfo:subsectionIDs:isWristDetectDisabled:hasSectionIDOptedOutOfCoordination:hasSectionIDOptedForwardOnly:ignoresDowntime:isCritical:](v17, "willNanoPresentNotificationForSectionInfo:subsectionIDs:isWristDetectDisabled:hasSectionIDOptedOutOfCoordination:hasSectionIDOptedForwardOnly:ignoresDowntime:isCritical:", v16, v15, -[BLTSettingSyncInternal isWristDetectDisabled](self, "isWristDetectDisabled"), v25 == 2, v25 == 1, v8, v28);

  return v26;
}

uint64_t __124__BLTSettingSyncInternal_willNanoPresentNotificationForSectionID_subsectionIDs_subtype_category_ignoresDowntime_isCritical___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_overriddenSectionInfoForSectionID:", a2);
}

- (void)updateGlobalSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  BLTSettingSyncInternal *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  blt_global_settings_sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ updateGlobalSettings: %@", (uint8_t *)&v7, 0x16u);
  }

  -[BLTSettingSyncInternal remoteGlobalSettingsSyncServer](self, "remoteGlobalSettingsSyncServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateLocalSettingsWithProvider:", v4);

}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  BLTSettingSyncInternal *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  blt_global_settings_sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ observer: %@ globalSettings: %@", (uint8_t *)&v10, 0x20u);
  }

  -[BLTSpokenSettingSync bbUpdateLocalGlobalSpokenSettingEnabled:](self->_spokenSettingSync, "bbUpdateLocalGlobalSpokenSettingEnabled:", objc_msgSend(v7, "globalSpokenNotificationSetting"));
  -[BLTSettingSyncInternal remoteGlobalSettingsSyncServer](self, "remoteGlobalSettingsSyncServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "observer:updateGlobalSettings:", v6, v7);

}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGateway, a3);
}

- (BLTMuteSync)muteSync
{
  return self->_muteSync;
}

- (void)setMuteSync:(id)a3
{
  objc_storeStrong((id *)&self->_muteSync, a3);
}

- (BLTSettingSyncServer)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BLTSectionConfiguration)sectionConfiguration
{
  return self->_sectionConfiguration;
}

- (BLTSpokenSettingSync)spokenSettingSync
{
  return self->_spokenSettingSync;
}

- (void)setSpokenSettingSync:(id)a3
{
  objc_storeStrong((id *)&self->_spokenSettingSync, a3);
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (BLTRemoteGlobalSettingsSyncServer)remoteGlobalSettingsSyncServer
{
  return self->_remoteGlobalSettingsSyncServer;
}

- (void)setRemoteGlobalSettingsSyncServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteGlobalSettingsSyncServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteGlobalSettingsSyncServer, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_spokenSettingSync, 0);
  objc_storeStrong((id *)&self->_sectionConfiguration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_muteSync, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_wristStateObserver, 0);
}

@end
