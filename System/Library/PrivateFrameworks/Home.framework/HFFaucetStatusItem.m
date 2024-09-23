@implementation HFFaucetStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A18]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFaucet_One"), CFSTR("HFStatusTitleFaucet_One"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFaucet_Multiple"), CFSTR("HFStatusTitleFaucet_Multiple"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_OneRunning"), CFSTR("HFStatusDescriptionFaucet_OneRunning"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_OneStarting"), CFSTR("HFStatusDescriptionFaucet_OneStarting"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_OneStopping"), CFSTR("HFStatusDescriptionFaucet_OneStopping"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_OneOff"), CFSTR("HFStatusDescriptionFaucet_OneOff"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_MultipleRunning"), CFSTR("HFStatusDescriptionFaucet_MultipleRunning"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_MultipleStarting"), CFSTR("HFStatusDescriptionFaucet_MultipleStarting"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_MultipleStopping"), CFSTR("HFStatusDescriptionFaucet_MultipleStopping"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFaucet_MultipleOff"), CFSTR("HFStatusDescriptionFaucet_MultipleOff"), 1);
}

@end
