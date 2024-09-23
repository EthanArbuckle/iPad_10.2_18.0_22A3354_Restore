@implementation HFFanStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_fanServiceTypes");
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFan_One"), CFSTR("HFStatusTitleFan_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFan_One"), CFSTR("HFStatusTitleFan_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFan_Multiple"), CFSTR("HFStatusTitleFan_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleFan_Multiple"), CFSTR("HFStatusTitleFan_Multiple"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFan_OneOn"), CFSTR("HFStatusDescriptionFan_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFan_OneOff"), CFSTR("HFStatusDescriptionFan_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFan_MultipleOn"), CFSTR("HFStatusDescriptionFan_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionFan_MultipleOff"), CFSTR("HFStatusDescriptionFan_MultipleOff"), 1);
}

@end
