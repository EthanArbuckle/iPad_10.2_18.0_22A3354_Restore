@implementation HMDAccessoryFirmwareUpdatePolicyCriteria

- (HMDAccessoryFirmwareUpdatePolicyCriteria)init
{
  HMDAccessoryFirmwareUpdatePolicyCriteria *v2;
  uint64_t v3;
  NSArray *characteristicConfigurations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryFirmwareUpdatePolicyCriteria;
  v2 = -[HMDAccessoryFirmwareUpdatePolicyCriteria init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    characteristicConfigurations = v2->_characteristicConfigurations;
    v2->_characteristicConfigurations = (NSArray *)v3;

  }
  return v2;
}

- (BOOL)noUserAtHome
{
  return self->_noUserAtHome;
}

- (void)setNoUserAtHome:(BOOL)a3
{
  self->_noUserAtHome = a3;
}

- (BOOL)anyUserAtHome
{
  return self->_anyUserAtHome;
}

- (void)setAnyUserAtHome:(BOOL)a3
{
  self->_anyUserAtHome = a3;
}

- (BOOL)checkForScheduledAutomation
{
  return self->_checkForScheduledAutomation;
}

- (void)setCheckForScheduledAutomation:(BOOL)a3
{
  self->_checkForScheduledAutomation = a3;
}

- (NSArray)characteristicConfigurations
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCharacteristicConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow
{
  return (HMDAccessoryFirmwareUpdateTimeWindow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdateTimeWindow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimeWindow, 0);
  objc_storeStrong((id *)&self->_characteristicConfigurations, 0);
}

@end
