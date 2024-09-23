@implementation HFAirPurifierStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99A8]);
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleAirPurifier_One"), CFSTR("HFStatusTitleAirPurifier_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleAirPurifier_One"), CFSTR("HFStatusTitleAirPurifier_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleAirPurifier_Multiple"), CFSTR("HFStatusTitleAirPurifier_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleAirPurifier_Multiple"), CFSTR("HFStatusTitleAirPurifier_Multiple"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionAirPurifier_OneOn"), CFSTR("HFStatusDescriptionAirPurifier_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionAirPurifier_OneOff"), CFSTR("HFStatusDescriptionAirPurifier_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionAirPurifier_MultipleOn"), CFSTR("HFStatusDescriptionAirPurifier_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionAirPurifier_MultipleOff"), CFSTR("HFStatusDescriptionAirPurifier_MultipleOff"), 1);
}

@end
