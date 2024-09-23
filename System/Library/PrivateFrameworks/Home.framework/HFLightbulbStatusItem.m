@implementation HFLightbulbStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A70]);
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLightbulb_One"), CFSTR("HFStatusTitleLightbulb_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLightbulb_One"), CFSTR("HFStatusTitleLightbulb_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLightbulb_Multiple"), CFSTR("HFStatusTitleLightbulb_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleLightbulb_Multiple"), CFSTR("HFStatusTitleLightbulb_Multiple"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLightbulb_OneOn"), CFSTR("HFStatusDescriptionLightbulb_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLightbulb_OneOff"), CFSTR("HFStatusDescriptionLightbulb_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLightbulb_MultipleOn"), CFSTR("HFStatusDescriptionLightbulb_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionLightbulb_MultipleOff"), CFSTR("HFStatusDescriptionLightbulb_MultipleOff"), 1);
}

@end
