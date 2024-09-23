@implementation HMAccessoryCollectionSettingItem(COMeshAlarmAddOn)

+ (id)co_accessoryCollectionSettingItemWithAlarm:()COMeshAlarmAddOn
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "co_sanitizedHomeKitAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE67860]);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("MTAlarms"));

  objc_msgSend(v5, "encodedDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend([a1 alloc], "initWithValue:", v7);

  return v8;
}

@end
