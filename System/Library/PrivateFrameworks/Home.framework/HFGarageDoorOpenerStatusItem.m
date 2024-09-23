@implementation HFGarageDoorOpenerStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A28]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleGarageDoor_One"), CFSTR("HFStatusTitleGarageDoor_One"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneOpen"), CFSTR("HFStatusDescriptionGarageDoor_OneOpen"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleGarageDoor_Multiple"), CFSTR("HFStatusTitleGarageDoor_Multiple"), 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneObstructed"), CFSTR("HFStatusDescriptionGarageDoor_OneObstructed"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneOpening"), CFSTR("HFStatusDescriptionGarageDoor_OneOpening"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneClosing"), CFSTR("HFStatusDescriptionGarageDoor_OneClosing"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneClosed"), CFSTR("HFStatusDescriptionGarageDoor_OneClosed"), 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_MultipleObstructed"), CFSTR("HFStatusDescriptionGarageDoor_MultipleObstructed"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_MultipleOpen"), CFSTR("HFStatusDescriptionGarageDoor_MultipleOpen"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_MultipleOpening"), CFSTR("HFStatusDescriptionGarageDoor_MultipleOpening"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_MultipleClosing"), CFSTR("HFStatusDescriptionGarageDoor_MultipleClosing"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_MultipleClosed"), CFSTR("HFStatusDescriptionGarageDoor_MultipleClosed"), 1);
}

@end
