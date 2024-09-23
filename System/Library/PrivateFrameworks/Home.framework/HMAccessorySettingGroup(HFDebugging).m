@implementation HMAccessorySettingGroup(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  objc_msgSend(a1, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v7, CFSTR("keyPath"), 2);

  v8 = objc_msgSend(v4, "detailLevel");
  if (v8 == 2)
  {
    objc_msgSend(a1, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("settings"));

    objc_msgSend(a1, "groups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("groups"));

  }
  return v5;
}

@end
