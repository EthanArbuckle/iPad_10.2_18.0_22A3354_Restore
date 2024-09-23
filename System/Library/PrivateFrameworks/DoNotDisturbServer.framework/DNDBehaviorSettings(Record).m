@implementation DNDBehaviorSettings(Record)

+ (id)settingsForRecord:()Record
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D1D6C8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "interruptionBehaviorSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInterruptionBehaviorSetting:", objc_msgSend(v6, "unsignedIntegerValue"));
  return v5;
}

- (DNDSMutableBehaviorSettingsRecord)makeRecord
{
  DNDSMutableBehaviorSettingsRecord *v2;
  void *v3;

  v2 = objc_alloc_init(DNDSMutableBehaviorSettingsRecord);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "interruptionBehaviorSetting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBehaviorSettingsRecord setInterruptionBehaviorSetting:](v2, "setInterruptionBehaviorSetting:", v3);

  return v2;
}

@end
