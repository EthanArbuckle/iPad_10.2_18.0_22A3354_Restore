@implementation HMSelectionSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_1F0457240;
  v4 = a3;
  objc_msgSendSuper2(&v9, sel_hf_stateDumpBuilderWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "detailLevel", v9.receiver, v9.super_class);

  if (v6 == 2)
  {
    objc_msgSend(a1, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("items"));

  }
  return v5;
}

@end
