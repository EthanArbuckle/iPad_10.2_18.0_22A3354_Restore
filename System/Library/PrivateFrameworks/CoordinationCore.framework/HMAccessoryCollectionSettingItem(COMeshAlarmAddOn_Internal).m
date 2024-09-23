@implementation HMAccessoryCollectionSettingItem(COMeshAlarmAddOn_Internal)

- (id)_co_alarm
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67858]), "initWithEncodedDictionary:", v1);
    objc_msgSend(v2, "decodeObjectForKey:", CFSTR("MTAlarms"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)co_alarm
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_co_alarm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "co_sanitizedHomeKitAlarm");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
