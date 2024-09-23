@implementation HFOutletStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AA0]);
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOutlet_One"), CFSTR("HFStatusTitleOutlet_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOutlet_One"), CFSTR("HFStatusTitleOutlet_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOutlet_Multiple"), CFSTR("HFStatusTitleOutlet_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOutlet_One"), CFSTR("HFStatusTitleOutlet_One"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionOutlet_OneOn"), CFSTR("HFStatusDescriptionOutlet_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionOutlet_OneOff"), CFSTR("HFStatusDescriptionOutlet_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionOutlet_MultipleOn"), CFSTR("HFStatusDescriptionOutlet_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionOutlet_MultipleOff"), CFSTR("HFStatusDescriptionOutlet_MultipleOff"), 1);
}

@end
