@implementation CDPUIDeviceToDeviceEncryptionFlowContext

- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithAltDSID:(id)a3
{
  void *v4;
  CDPUIDeviceToDeviceEncryptionFlowContext *v5;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForAccountWithAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CDPUIDeviceToDeviceEncryptionFlowContext initWithCDPContext:](self, "initWithCDPContext:", v4);

  return v5;
}

- (CDPUIDeviceToDeviceEncryptionFlowContext)initWithCDPContext:(id)a3
{
  id v5;
  CDPUIDeviceToDeviceEncryptionFlowContext *v6;
  CDPUIDeviceToDeviceEncryptionFlowContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPUIDeviceToDeviceEncryptionFlowContext;
  v6 = -[CDPUIDeviceToDeviceEncryptionFlowContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cdpContext, a3);
    objc_storeStrong((id *)&v7->_securityUpgradeContext, (id)*MEMORY[0x24BE0AC58]);
    v7->_isDemoDevice = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0) != 0;
  }

  return v7;
}

- (NSString)altDSID
{
  void *v2;
  void *v3;

  -[CDPUIDeviceToDeviceEncryptionFlowContext cdpContext](self, "cdpContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (int64_t)deviceToDeviceEncryptionUpgradeUIStyle
{
  return self->_deviceToDeviceEncryptionUpgradeUIStyle;
}

- (void)setDeviceToDeviceEncryptionUpgradeUIStyle:(int64_t)a3
{
  self->_deviceToDeviceEncryptionUpgradeUIStyle = a3;
}

- (int64_t)deviceToDeviceEncryptionUpgradeType
{
  return self->_deviceToDeviceEncryptionUpgradeType;
}

- (void)setDeviceToDeviceEncryptionUpgradeType:(int64_t)a3
{
  self->_deviceToDeviceEncryptionUpgradeType = a3;
}

- (NSString)securityUpgradeContext
{
  return self->_securityUpgradeContext;
}

- (void)setSecurityUpgradeContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (BOOL)requiresSynchronousRepair
{
  return self->_requiresSynchronousRepair;
}

- (void)setRequiresSynchronousRepair:(BOOL)a3
{
  self->_requiresSynchronousRepair = a3;
}

- (CDPContext)repairContext
{
  return self->_repairContext;
}

- (void)setRepairContext:(id)a3
{
  objc_storeStrong((id *)&self->_repairContext, a3);
}

- (BOOL)shouldSuppressPasscodeCreationCancelPrompt
{
  return self->_shouldSuppressPasscodeCreationCancelPrompt;
}

- (void)setShouldSuppressPasscodeCreationCancelPrompt:(BOOL)a3
{
  self->_shouldSuppressPasscodeCreationCancelPrompt = a3;
}

- (BOOL)isDemoDevice
{
  return self->_isDemoDevice;
}

- (void)setIsDemoDevice:(BOOL)a3
{
  self->_isDemoDevice = a3;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_repairContext, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_securityUpgradeContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
