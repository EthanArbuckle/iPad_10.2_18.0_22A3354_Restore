@implementation HMAccessorySetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  objc_msgSend(a1, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v7, CFSTR("keyPath"), 2);

  objc_msgSend(a1, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

  v9 = objc_msgSend(v4, "detailLevel");
  if (v9 == 2)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("HMAccessory"), &stru_1EA741FF8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isReflected"), CFSTR("reflected"), 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isWritable"), CFSTR("writable"), 0);
  }
  return v5;
}

@end
