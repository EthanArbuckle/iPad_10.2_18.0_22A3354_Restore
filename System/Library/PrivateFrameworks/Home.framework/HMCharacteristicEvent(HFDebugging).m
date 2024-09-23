@implementation HMCharacteristicEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_1F0451F10;
  objc_msgSendSuper2(&v6, sel_hf_stateDumpBuilderWithContext_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("characteristic"));

  objc_msgSend(a1, "triggerValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("value"));

  return v2;
}

@end
