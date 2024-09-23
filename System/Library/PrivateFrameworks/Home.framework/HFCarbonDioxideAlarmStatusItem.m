@implementation HFCarbonDioxideAlarmStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99E0]);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", a3, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("carbon.dioxide.cloud.fill"), v3);

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleCO2Alarm"), CFSTR("HFStatusTitleCO2Alarm"), 1);
}

- (id)iconDescription
{
  return CFSTR("CO₂");
}

- (id)statusDescriptionAllNormal
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionCO2Alarm_Normal"), CFSTR("HFStatusDescriptionCO2Alarm_Normal"), 1);
}

- (id)statusDescriptionOneTriggered
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionCO2Alarm_Triggered"), CFSTR("HFStatusDescriptionCO2Alarm_Triggered"), 1);
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return HFLocalizedStringWithFormat(CFSTR("HFStatusDescriptionCO2Alarm_Multiple"), CFSTR("%lu"), a3, v3, v4, v5, v6, v7, a3);
}

@end
