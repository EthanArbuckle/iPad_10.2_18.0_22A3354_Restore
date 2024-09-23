@implementation HFBlindsStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B30]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleBlinds_One"), CFSTR("HFStatusTitleBlinds_One"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleBlinds_Multiple"), CFSTR("HFStatusTitleBlinds_Multiple"), 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_OneObstructed"), CFSTR("HFStatusDescriptionBlinds_OneObstructed"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_OneOpen"), CFSTR("HFStatusDescriptionBlinds_OneOpen"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_OneOpening"), CFSTR("HFStatusDescriptionBlinds_OneOpening"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_OneClosing"), CFSTR("HFStatusDescriptionBlinds_OneClosing"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_OneClosed"), CFSTR("HFStatusDescriptionBlinds_OneClosed"), 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_MultipleObstructed"), CFSTR("HFStatusDescriptionBlinds_MultipleObstructed"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_MultipleOpen"), CFSTR("HFStatusDescriptionBlinds_MultipleOpen"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_MultipleOpening"), CFSTR("HFStatusDescriptionBlinds_MultipleOpening"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_MultipleClosing"), CFSTR("HFStatusDescriptionBlinds_MultipleClosing"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionBlinds_MultipleClosed"), CFSTR("HFStatusDescriptionBlinds_MultipleClosed"), 1);
}

@end
