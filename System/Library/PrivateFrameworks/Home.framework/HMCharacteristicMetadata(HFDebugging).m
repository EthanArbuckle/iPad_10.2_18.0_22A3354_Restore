@implementation HMCharacteristicMetadata(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v5, CFSTR("min"), 1);

  objc_msgSend(a1, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v6, CFSTR("max"), 1);

  objc_msgSend(a1, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v7, CFSTR("step"), 1);

  objc_msgSend(a1, "validValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v8, CFSTR("validValues"), 1);

  objc_msgSend(a1, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v9, CFSTR("format"), 1);

  objc_msgSend(a1, "units");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v10, CFSTR("units"), 1);

  return v4;
}

@end
