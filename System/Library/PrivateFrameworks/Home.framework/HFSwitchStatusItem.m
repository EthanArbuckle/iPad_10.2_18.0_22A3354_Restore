@implementation HFSwitchStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AD8]);
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSwitch_One"), CFSTR("HFStatusTitleSwitch_One"), 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSwitch_One"), CFSTR("HFStatusTitleSwitch_One"), 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSwitch_Multiple"), CFSTR("HFStatusTitleSwitch_Multiple"), 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSwitch_Multiple"), CFSTR("HFStatusTitleSwitch_Multiple"), 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionSwitch_OneOn"), CFSTR("HFStatusDescriptionSwitch_OneOn"), 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionSwitch_OneOff"), CFSTR("HFStatusDescriptionSwitch_OneOff"), 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionSwitch_MultipleOn"), CFSTR("HFStatusDescriptionSwitch_MultipleOn"), 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionSwitch_MultipleOff"), CFSTR("HFStatusDescriptionSwitch_MultipleOff"), 1);
}

@end
