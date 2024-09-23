@implementation DNDBypassSettings(Record)

+ (id)settingsForRecord:()Record
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D1D6D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "immediateBypassEventSourceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImmediateBypassEventSourceType:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v4, "immediateBypassCNGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImmediateBypassCNGroupIdentifier:", v7);

  objc_msgSend(v4, "repeatEventSourceBehaviorEnabledSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRepeatEventSourceBehaviorEnabledSetting:", objc_msgSend(v8, "unsignedIntegerValue"));
  return v5;
}

- (DNDSMutableBypassSettingsRecord)makeRecord
{
  DNDSMutableBypassSettingsRecord *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(DNDSMutableBypassSettingsRecord);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "immediateBypassEventSourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBypassSettingsRecord setImmediateBypassEventSourceType:](v2, "setImmediateBypassEventSourceType:", v3);

  objc_msgSend(a1, "immediateBypassCNGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBypassSettingsRecord setImmediateBypassCNGroupIdentifier:](v2, "setImmediateBypassCNGroupIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "repeatEventSourceBehaviorEnabledSetting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBypassSettingsRecord setRepeatEventSourceBehaviorEnabledSetting:](v2, "setRepeatEventSourceBehaviorEnabledSetting:", v5);

  return v2;
}

@end
