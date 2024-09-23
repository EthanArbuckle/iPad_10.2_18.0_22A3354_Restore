@implementation HFDoorStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A00]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleDoor_One"), CFSTR("HFStatusTitleDoor_One"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleDoor_Multiple"), CFSTR("HFStatusTitleDoor_Multiple"), 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneObstructed"), CFSTR("HFStatusDescriptionDoor_OneObstructed"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneOpen"), CFSTR("HFStatusDescriptionDoor_OneOpen"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneOpening"), CFSTR("HFStatusDescriptionDoor_OneOpening"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneClosing"), CFSTR("HFStatusDescriptionDoor_OneClosing"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneClosed"), CFSTR("HFStatusDescriptionDoor_OneClosed"), 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_MultipleObstructed"), CFSTR("HFStatusDescriptionDoor_MultipleObstructed"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_MultipleOpen"), CFSTR("HFStatusDescriptionDoor_MultipleOpen"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_MultipleOpening"), CFSTR("HFStatusDescriptionDoor_MultipleOpening"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_MultipleClosing"), CFSTR("HFStatusDescriptionDoor_MultipleClosing"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_MultipleClosed"), CFSTR("HFStatusDescriptionDoor_MultipleClosed"), 1);
}

@end
