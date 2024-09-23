@implementation HMSetting(HFAdditions)

- (uint64_t)hf_isBooleanSetting
{
  return 0;
}

- (id)hf_debugValueDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_debugDescriptionForValue:keyPath:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_debugDescriptionForValue:()HFAdditions keyPath:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("root.mobileTimer.alarms")))
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "na_map:", &__block_literal_global_204);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
