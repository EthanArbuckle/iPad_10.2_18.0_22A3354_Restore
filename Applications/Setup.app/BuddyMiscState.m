@implementation BuddyMiscState

- (NSString)iCloudAppleIdFromActivation
{
  return self->_iCloudAppleIdFromActivation;
}

- (void)setICloudAppleIdFromActivation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BuddyTargetDeviceMigrationManager)migrationManager
{
  return self->_migrationManager;
}

- (void)setMigrationManager:(id)a3
{
  objc_storeStrong((id *)&self->_migrationManager, a3);
}

- (BuddyMigrationLockscreenController)migrationLockscreenController
{
  return self->_migrationLockscreenController;
}

- (void)setMigrationLockscreenController:(id)a3
{
  objc_storeStrong((id *)&self->_migrationLockscreenController, a3);
}

- (BOOL)userSkippedWiFi
{
  return self->_userSkippedWiFi;
}

- (void)setUserSkippedWiFi:(BOOL)a3
{
  self->_userSkippedWiFi = a3;
}

- (BOOL)userSelectedCellularActivation
{
  return self->_userSelectedCellularActivation;
}

- (void)setUserSelectedCellularActivation:(BOOL)a3
{
  self->_userSelectedCellularActivation = a3;
}

- (BOOL)userSelectedTetheredActivation
{
  return self->_userSelectedTetheredActivation;
}

- (void)setUserSelectedTetheredActivation:(BOOL)a3
{
  self->_userSelectedTetheredActivation = a3;
}

- (BOOL)userChoseExpress
{
  return self->_userChoseExpress;
}

- (void)setUserChoseExpress:(BOOL)a3
{
  self->_userChoseExpress = a3;
}

- (BOOL)forcePrimaryAppleIDAuthentication
{
  return self->_forcePrimaryAppleIDAuthentication;
}

- (void)setForcePrimaryAppleIDAuthentication:(BOOL)a3
{
  self->_forcePrimaryAppleIDAuthentication = a3;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)activationPlanRequest
{
  return self->_activationPlanRequest;
}

- (void)setActivationPlanRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activationPlanRequest, a3);
}

- (BOOL)skipActivationForActivationPlanRequest
{
  return self->_skipActivationForActivationPlanRequest;
}

- (void)setSkipActivationForActivationPlanRequest:(BOOL)a3
{
  self->_skipActivationForActivationPlanRequest = a3;
}

- (PKPaymentSetupAssistantProvisioningContext)walletProvisioningContext
{
  return self->_walletProvisioningContext;
}

- (void)setWalletProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_walletProvisioningContext, a3);
}

- (BOOL)hasPresentedPasscodeFlow
{
  return self->_hasPresentedPasscodeFlow;
}

- (void)setHasPresentedPasscodeFlow:(BOOL)a3
{
  self->_hasPresentedPasscodeFlow = a3;
}

- (BOOL)completedDemoSetup
{
  return self->_completedDemoSetup;
}

- (void)setCompletedDemoSetup:(BOOL)a3
{
  self->_completedDemoSetup = a3;
}

- (BOOL)launchedWithCombinedAnalyticsMismatch
{
  return self->_launchedWithCombinedAnalyticsMismatch;
}

- (void)setLaunchedWithCombinedAnalyticsMismatch:(BOOL)a3
{
  self->_launchedWithCombinedAnalyticsMismatch = a3;
}

- (BOOL)launchedToShowStolenDeviceProtection
{
  return self->_launchedToShowStolenDeviceProtection;
}

- (void)setLaunchedToShowStolenDeviceProtection:(BOOL)a3
{
  self->_launchedToShowStolenDeviceProtection = a3;
}

- (BOOL)launchedToShowSIMSetupAfterRestore
{
  return self->_launchedToShowSIMSetupAfterRestore;
}

- (void)setLaunchedToShowSIMSetupAfterRestore:(BOOL)a3
{
  self->_launchedToShowSIMSetupAfterRestore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletProvisioningContext, 0);
  objc_storeStrong((id *)&self->_activationPlanRequest, 0);
  objc_storeStrong((id *)&self->_migrationLockscreenController, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_iCloudAppleIdFromActivation, 0);
}

@end
