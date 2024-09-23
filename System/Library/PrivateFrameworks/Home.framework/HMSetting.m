@implementation HMSetting

id __62__HMSetting_HFAdditions__hf_debugDescriptionForValue_keyPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "objectForKey:", CFSTR("MTAlarms"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("$MTAlarm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("MTAlarmID"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = CFSTR("(null)");
  v12 = v11;

  objc_msgSend(v8, "objectForKey:", CFSTR("MTAlarmEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = CFSTR("(null)");
  v17 = v16;

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Item UUID: %@, Alarm UUID:'%@', enabled:'%@'"), v19, v12, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
