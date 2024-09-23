@implementation HMTrigger(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isEnabled"), CFSTR("enabled"), 0);
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "actionSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_filter:", &__block_literal_global_259_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v9, CFSTR("actionSets"), v10);

    objc_msgSend(a1, "actionSets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_filter:", &__block_literal_global_260);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:", v12, CFSTR("triggerOwnedActionSets"));

  }
  return v5;
}

@end
