@implementation HMAccessorySelectionSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&off_1F0457110;
  v4 = a3;
  objc_msgSendSuper2(&v13, sel_hf_stateDumpBuilderWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "detailLevel", v13.receiver, v13.super_class);

  if (v6 == 2)
  {
    objc_msgSend(a1, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("root.siri.language"));

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendObject:withName:", v11, CFSTR("language count (too many items to list)"));

    }
    else
    {
      objc_msgSend(a1, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("items"));
    }

  }
  return v5;
}

@end
