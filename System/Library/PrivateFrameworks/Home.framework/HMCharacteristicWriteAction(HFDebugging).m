@implementation HMCharacteristicWriteAction(HFDebugging)

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
  v10.super_class = (Class)&off_1F044FA30;
  objc_msgSendSuper2(&v10, sel_hf_stateDumpBuilderWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
  objc_msgSend(v5, "appendObject:withName:context:", v6, CFSTR("characteristic"), v7);

  objc_msgSend(a1, "targetValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

  return v5;
}

@end
