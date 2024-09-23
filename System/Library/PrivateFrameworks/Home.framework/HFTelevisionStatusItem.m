@implementation HFTelevisionStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AF0]);
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleTelevision_One"), CFSTR("HFStatusTitleTelevision_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleTelevision_One"), CFSTR("HFStatusTitleTelevision_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleTelevision_Multiple"), CFSTR("HFStatusTitleTelevision_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleTelevision_Multiple"), CFSTR("HFStatusTitleTelevision_Multiple"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionTelevision_OneOn"), CFSTR("HFStatusDescriptionTelevision_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionTelevision_OneOff"), CFSTR("HFStatusDescriptionTelevision_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionTelevision_MultipleOn"), CFSTR("HFStatusDescriptionTelevision_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionTelevision_MultipleOff"), CFSTR("HFStatusDescriptionTelevision_MultipleOff"), 1);
}

@end
