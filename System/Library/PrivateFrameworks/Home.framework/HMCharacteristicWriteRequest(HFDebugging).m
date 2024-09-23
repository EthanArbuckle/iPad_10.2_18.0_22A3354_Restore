@implementation HMCharacteristicWriteRequest(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_1F0452698;
  objc_msgSendSuper2(&v5, sel_hf_stateDumpBuilderWithContext_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("value"));

  return v2;
}

@end
