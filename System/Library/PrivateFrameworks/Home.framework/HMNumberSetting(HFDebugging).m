@implementation HMNumberSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = (void *)objc_msgSend(a3, "copyWithOutputStyle:", 1);
  v10.receiver = a1;
  v10.super_class = (Class)&off_1F0456DF8;
  objc_msgSendSuper2(&v10, sel_hf_stateDumpBuilderWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("min"));

    objc_msgSend(a1, "maximumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("max"));

    objc_msgSend(a1, "stepValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("step"));

  }
  return v5;
}

@end
