@implementation HFValveStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B08]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleValve_One"), CFSTR("HFStatusTitleValve_One"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleValve_Multiple"), CFSTR("HFStatusTitleValve_Multiple"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_OneRunning"), CFSTR("HFStatusDescriptionValve_OneRunning"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_OneStarting"), CFSTR("HFStatusDescriptionValve_OneStarting"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_OneStopping"), CFSTR("HFStatusDescriptionValve_OneStopping"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_OneOff"), CFSTR("HFStatusDescriptionValve_OneOff"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_MultipleRunning"), CFSTR("HFStatusDescriptionValve_MultipleRunning"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_MultipleStarting"), CFSTR("HFStatusDescriptionValve_MultipleStarting"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_MultipleStopping"), CFSTR("HFStatusDescriptionValve_MultipleStopping"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionValve_MultipleOff"), CFSTR("HFStatusDescriptionValve_MultipleOff"), 1);
}

@end
