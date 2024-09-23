@implementation HMCharacteristicRequest(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("characteristic"));

  return v4;
}

@end
