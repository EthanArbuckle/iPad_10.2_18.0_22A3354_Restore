@implementation BYConcreteEnvironment

- (BuddyPendingRestoreState)pendingRestoreState
{
  if (!self->_pendingRestoreState)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "pendingRestoreState", a2);
  return self->_pendingRestoreState;
}

- (BYChronicle)chronicle
{
  if (!self->_chronicle)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "chronicle", a2);
  return self->_chronicle;
}

- (BuddyMiscState)miscState
{
  if (!self->_miscState)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "miscState", a2);
  return self->_miscState;
}

- (ProximitySetupController)proximitySetupController
{
  if (!self->_proximitySetupController)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "proximitySetupController", a2);
  return self->_proximitySetupController;
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  if (!self->_proximityAutomatedDeviceEnrollmentController)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "proximityAutomatedDeviceEnrollmentController", a2);
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (BFFBackupDeviceController)backupDeviceController
{
  if (!self->_backupDeviceController)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "backupDeviceController", a2);
  return self->_backupDeviceController;
}

- (BuddySystemTimeUpdateManager)systemTimeUpdateManager
{
  if (!self->_systemTimeUpdateManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "systemTimeUpdateManager", a2);
  return self->_systemTimeUpdateManager;
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  if (!self->_enrollmentCoordinator)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "enrollmentCoordinator", a2);
  return self->_enrollmentCoordinator;
}

- (id)menuButtonPressedBlock
{
  if (!self->_menuButtonPressedBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "menuButtonPressedBlock", a2);
  return objc_retainBlock(self->_menuButtonPressedBlock);
}

- (id)showModalWiFiSettingsBlock
{
  if (!self->_showModalWiFiSettingsBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "showModalWiFiSettingsBlock", a2);
  return objc_retainBlock(self->_showModalWiFiSettingsBlock);
}

- (id)writeGreenInformedDefaultPlistIfNecessaryBlock
{
  if (!self->_writeGreenInformedDefaultPlistIfNecessaryBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "writeGreenInformedDefaultPlistIfNecessaryBlock", a2);
  return objc_retainBlock(self->_writeGreenInformedDefaultPlistIfNecessaryBlock);
}

- (id)doesRestartFlowCauseEraseBlock
{
  if (!self->_doesRestartFlowCauseEraseBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "doesRestartFlowCauseEraseBlock", a2);
  return objc_retainBlock(self->_doesRestartFlowCauseEraseBlock);
}

- (id)prepareForCloudRestoreRebootBlock
{
  if (!self->_prepareForCloudRestoreRebootBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "prepareForCloudRestoreRebootBlock", a2);
  return objc_retainBlock(self->_prepareForCloudRestoreRebootBlock);
}

- (id)exitBuddyForDemoSetUpBlock
{
  if (!self->_exitBuddyForDemoSetUpBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "exitBuddyForDemoSetUpBlock", a2);
  return objc_retainBlock(self->_exitBuddyForDemoSetUpBlock);
}

- (id)prepareForDeviceMigrationBlock
{
  if (!self->_prepareForDeviceMigrationBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "prepareForDeviceMigrationBlock", a2);
  return objc_retainBlock(self->_prepareForDeviceMigrationBlock);
}

- (id)startDeviceMigrationBlock
{
  if (!self->_startDeviceMigrationBlock)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "startDeviceMigrationBlock", a2);
  return objc_retainBlock(self->_startDeviceMigrationBlock);
}

- (BYSeedProgramManager)seedProgramManager
{
  if (!self->_seedProgramManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "seedProgramManager", a2);
  return self->_seedProgramManager;
}

- (BYPreferencesController)buddyPreferences
{
  if (!self->_buddyPreferences)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buddyPreferences", a2);
  return self->_buddyPreferences;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  if (!self->_buddyPreferencesExcludedFromBackup)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buddyPreferencesExcludedFromBackup", a2);
  return self->_buddyPreferencesExcludedFromBackup;
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  if (!self->_betaEnrollmentStateManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "betaEnrollmentStateManager", a2);
  return self->_betaEnrollmentStateManager;
}

- (BYCapabilities)capabilities
{
  if (!self->_capabilities)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "capabilities", a2);
  return self->_capabilities;
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  if (!self->_softwareUpdateCache)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "softwareUpdateCache", a2);
  return self->_softwareUpdateCache;
}

- (BFFSettingsManager)settingsManager
{
  if (!self->_settingsManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "settingsManager", a2);
  return self->_settingsManager;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  if (!self->_passcodeCacheManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "passcodeCacheManager", a2);
  return self->_passcodeCacheManager;
}

- (BYRunState)runState
{
  if (!self->_runState)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "runState", a2);
  return self->_runState;
}

- (BYAnalyticsManager)analyticsManager
{
  if (!self->_analyticsManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "analyticsManager", a2);
  return self->_analyticsManager;
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  if (!self->_paneFeatureAnalyticsManager)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "paneFeatureAnalyticsManager", a2);
  return self->_paneFeatureAnalyticsManager;
}

- (MCProfileConnection)managedConfiguration
{
  if (!self->_managedConfiguration)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "managedConfiguration", a2);
  return self->_managedConfiguration;
}

- (BuddyActivationRecord)activationRecord
{
  if (!self->_activationRecord)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "activationRecord", a2);
  return self->_activationRecord;
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  if (!self->_combinedTermsProvider)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "combinedTermsProvider", a2);
  return self->_combinedTermsProvider;
}

- (BuddyFeatureFlags)featureFlags
{
  if (!self->_featureFlags)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "featureFlags", a2);
  return self->_featureFlags;
}

- (BuddyButtonMonitor)buttonMonitor
{
  if (!self->_buttonMonitor)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "buttonMonitor", a2);
  return self->_buttonMonitor;
}

- (BuddyEmergencyExecutor)emergencyExecutor
{
  if (!self->_emergencyExecutor)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "emergencyExecutor", a2);
  return self->_emergencyExecutor;
}

- (BuddyActivationState)activationState
{
  if (!self->_activationState)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "activationState", a2);
  return self->_activationState;
}

- (BYFlowSkipController)flowSkipController
{
  if (!self->_flowSkipController)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "flowSkipController", a2);
  return self->_flowSkipController;
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  if (!self->_mdmReturnToServiceController)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "mdmReturnToServiceController", a2);
  return self->_mdmReturnToServiceController;
}

- (AppearanceModeProvider)appearanceModeProvider
{
  if (!self->_appearanceModeProvider)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "appearanceModeProvider", a2);
  return self->_appearanceModeProvider;
}

- (SetupUserDispositionProvider)userDispositionProvider
{
  if (!self->_userDispositionProvider)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "userDispositionProvider", a2);
  return self->_userDispositionProvider;
}

- (BYDeviceConfiguration)deviceConfiguration
{
  if (!self->_deviceConfiguration)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "deviceConfiguration", a2);
  return self->_deviceConfiguration;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  if (!self->_flowItemDispositionProvider)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "flowItemDispositionProvider", a2);
  return self->_flowItemDispositionProvider;
}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  if (!self->_analyticsEventAppearance)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "analyticsEventAppearance", a2);
  return self->_analyticsEventAppearance;
}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  if (!self->_childSetupPresenter)
    -[BYConcreteEnvironment _faultForNilPropertyWithDescription:](self, "_faultForNilPropertyWithDescription:", "childSetupPresenter", a2);
  return self->_childSetupPresenter;
}

- (void)_faultForNilPropertyWithDescription:(char *)a3
{
  os_log_t oslog;
  char *v4;
  SEL v5;
  BYConcreteEnvironment *v6;
  uint8_t buf[24];

  v6 = self;
  v5 = a2;
  v4 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    sub_10011FC00((uint64_t)buf, (uint64_t)v4);
    _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "Environment has nil %{public}s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->_chronicle, a3);
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, a3);
}

- (void)setBackupDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceController, a3);
}

- (void)setSystemTimeUpdateManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemTimeUpdateManager, a3);
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentCoordinator, a3);
}

- (void)setMenuButtonPressedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDoesRestartFlowCauseEraseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setPrepareForCloudRestoreRebootBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setExitBuddyForDemoSetUpBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_displayZoomExecutor, a3);
}

- (void)setSeedProgramManager:(id)a3
{
  objc_storeStrong((id *)&self->_seedProgramManager, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (id)willPerformSoftwareUpdateBlock
{
  return self->_willPerformSoftwareUpdateBlock;
}

- (void)setWillPerformSoftwareUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_betaEnrollmentStateManager, a3);
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setActivationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_activationRecord, a3);
}

- (void)setCombinedTermsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_combinedTermsProvider, a3);
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (void)setButtonMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonMonitor, a3);
}

- (void)setEmergencyExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyExecutor, a3);
}

- (void)setActivationState:(id)a3
{
  objc_storeStrong((id *)&self->_activationState, a3);
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (void)setMdmReturnToServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, a3);
}

- (void)setAppearanceModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceModeProvider, a3);
}

- (void)setUserDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userDispositionProvider, a3);
}

- (void)setDeviceConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_deviceConfiguration, a3);
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (void)setAnalyticsEventAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventAppearance, a3);
}

- (void)setChildSetupPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_childSetupPresenter, a3);
}

- (BuddyBackgroundViewController)buddyBackgroundViewController
{
  return (BuddyBackgroundViewController *)objc_loadWeakRetained((id *)&self->_buddyBackgroundViewController);
}

- (void)setBuddyBackgroundViewController:(id)a3
{
  objc_storeWeak((id *)&self->_buddyBackgroundViewController, a3);
}

- (IntelligenceProvider)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_intelligenceProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceProvider, 0);
  objc_destroyWeak((id *)&self->_buddyBackgroundViewController);
  objc_storeStrong((id *)&self->_childSetupPresenter, 0);
  objc_storeStrong((id *)&self->_analyticsEventAppearance, 0);
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_userDispositionProvider, 0);
  objc_storeStrong((id *)&self->_appearanceModeProvider, 0);
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_activationState, 0);
  objc_storeStrong((id *)&self->_emergencyExecutor, 0);
  objc_storeStrong((id *)&self->_buttonMonitor, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_combinedTermsProvider, 0);
  objc_storeStrong((id *)&self->_activationRecord, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_betaEnrollmentStateManager, 0);
  objc_storeStrong(&self->_willPerformSoftwareUpdateBlock, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_seedProgramManager, 0);
  objc_storeStrong((id *)&self->_displayZoomExecutor, 0);
  objc_storeStrong(&self->_startDeviceMigrationBlock, 0);
  objc_storeStrong(&self->_prepareForDeviceMigrationBlock, 0);
  objc_storeStrong(&self->_exitBuddyForDemoSetUpBlock, 0);
  objc_storeStrong(&self->_prepareForCloudRestoreRebootBlock, 0);
  objc_storeStrong(&self->_doesRestartFlowCauseEraseBlock, 0);
  objc_storeStrong(&self->_writeGreenInformedDefaultPlistIfNecessaryBlock, 0);
  objc_storeStrong(&self->_showModalWiFiSettingsBlock, 0);
  objc_storeStrong(&self->_menuButtonPressedBlock, 0);
  objc_storeStrong((id *)&self->_enrollmentCoordinator, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_storeStrong((id *)&self->_systemTimeUpdateManager, 0);
  objc_storeStrong((id *)&self->_backupDeviceController, 0);
  objc_storeStrong((id *)&self->_proximityAutomatedDeviceEnrollmentController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_chronicle, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_storeStrong((id *)&self->_suspendTask, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
}

@end
