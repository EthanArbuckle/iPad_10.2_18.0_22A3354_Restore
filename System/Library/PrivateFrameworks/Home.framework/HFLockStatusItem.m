@implementation HFLockStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A80]);
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLock_One"), CFSTR("HFStatusTitleLock_One"), 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_OneUnlocked"), CFSTR("HFStatusDescriptionLock_OneUnlocked"), 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLock_Multiple"), CFSTR("HFStatusTitleLock_Multiple"), 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_OneJammed"), CFSTR("HFStatusDescriptionLock_OneJammed"), 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_OneUnlocking"), CFSTR("HFStatusDescriptionLock_OneUnlocking"), 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_OneLocking"), CFSTR("HFStatusDescriptionLock_OneLocking"), 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_OneLocked"), CFSTR("HFStatusDescriptionLock_OneLocked"), 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_MultipleJammed"), CFSTR("HFStatusDescriptionLock_MultipleJammed"), 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_MultipleUnlocked"), CFSTR("HFStatusDescriptionLock_MultipleUnlocked"), 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_MultipleUnlocking"), CFSTR("HFStatusDescriptionLock_MultipleUnlocking"), 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_MultipleLocking"), CFSTR("HFStatusDescriptionLock_MultipleLocking"), 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLock_MultipleLocked"), CFSTR("HFStatusDescriptionLock_MultipleLocked"), 1);
}

@end
