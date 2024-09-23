@implementation HFWindowStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9B28]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleWindow_One"), CFSTR("HFStatusTitleWindow_One"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleWindow_Multiple"), CFSTR("HFStatusTitleWindow_Multiple"), 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_OneObstructed"), CFSTR("HFStatusDescriptionWindow_OneObstructed"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_OneOpen"), CFSTR("HFStatusDescriptionWindow_OneOpen"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_OneOpening"), CFSTR("HFStatusDescriptionWindow_OneOpening"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_OneClosing"), CFSTR("HFStatusDescriptionWindow_OneClosing"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_OneClosed"), CFSTR("HFStatusDescriptionWindow_OneClosed"), 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_MultipleObstructed"), CFSTR("HFStatusDescriptionWindow_MultipleObstructed"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_MultipleOpen"), CFSTR("HFStatusDescriptionWindow_MultipleOpen"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_MultipleOpening"), CFSTR("HFStatusDescriptionWindow_MultipleOpening"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_MultipleClosing"), CFSTR("HFStatusDescriptionWindow_MultipleClosing"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionWindow_MultipleClosed"), CFSTR("HFStatusDescriptionWindow_MultipleClosed"), 1);
}

@end
