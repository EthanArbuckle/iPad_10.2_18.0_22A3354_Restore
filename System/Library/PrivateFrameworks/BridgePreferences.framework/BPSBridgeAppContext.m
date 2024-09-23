@implementation BPSBridgeAppContext

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  return (id)shared_sharedInstance;
}

- (NRDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setBridgeController:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeController, a3);
}

void __29__BPSBridgeAppContext_shared__block_invoke()
{
  BPSBridgeAppContext *v0;
  void *v1;

  v0 = objc_alloc_init(BPSBridgeAppContext);
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;

}

- (void)tellWatchToSetSiriEnabled:(BOOL)a3
{
  -[PBBridgeCompanionController tellWatchToSetSiriEnabled:](self->_bridgeController, "tellWatchToSetSiriEnabled:", a3);
}

- (void)setInWatchSetupFlow:(BOOL)a3
{
  self->_inWatchSetupFlow = a3;
}

- (BOOL)isInWatchSetupFlow
{
  return self->_inWatchSetupFlow;
}

- (void)setSyncTrapUIEnabled:(BOOL)a3
{
  self->_syncTrapUIEnabled = a3;
}

- (BOOL)isSyncTrapUIEnabled
{
  return self->_syncTrapUIEnabled;
}

- (BOOL)isSyncTrapEnabled
{
  return self->_syncTrapUIEnabled;
}

- (void)updateIsRestoringToKnownDevice:(BOOL)a3
{
  self->_isRestoringToKnownDevice = a3;
}

- (NSDictionary)installedWatchkitApps
{
  return self->_installedWatchkitApps;
}

- (void)setInstalledWatchkitApps:(id)a3
{
  objc_storeStrong((id *)&self->_installedWatchkitApps, a3);
}

- (NSMutableDictionary)watchAppInstallStates
{
  return self->_watchAppInstallStates;
}

- (void)setWatchAppInstallStates:(id)a3
{
  objc_storeStrong((id *)&self->_watchAppInstallStates, a3);
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (BOOL)inWatchSetupFlow
{
  return self->_inWatchSetupFlow;
}

- (BOOL)syncTrapEnabled
{
  return self->_syncTrapEnabled;
}

- (BOOL)syncTrapUIEnabled
{
  return self->_syncTrapUIEnabled;
}

- (BOOL)isRestoringToKnownDevice
{
  return self->_isRestoringToKnownDevice;
}

- (PBBridgeCompanionController)bridgeController
{
  return self->_bridgeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeController, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_watchAppInstallStates, 0);
  objc_storeStrong((id *)&self->_installedWatchkitApps, 0);
}

@end
