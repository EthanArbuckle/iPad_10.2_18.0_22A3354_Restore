@implementation HMCharacteristic(HFDebugging)

+ (id)hf_descriptionForProperties:()HFDebugging
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (_MergedGlobals_232 != -1)
    dispatch_once(&_MergedGlobals_232, &__block_literal_global_198);
  v4 = (id)qword_1ED378EB0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_4;
  v10[3] = &unk_1EA72A1E8;
  v11 = v4;
  v5 = v4;
  objc_msgSend(v3, "na_map:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (void *)objc_msgSend(a3, "copyWithOutputStyle:", 1);
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "hf_characteristicTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  if (objc_msgSend(v4, "includeVolatileObjects"))
  {
    objc_msgSend(a1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

    objc_msgSend(a1, "hf_formattedValueUpdatedTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("time"));

  }
  if (objc_msgSend(a1, "isNotificationEnabled"))
    v10 = CFSTR("on");
  else
    v10 = CFSTR("off");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("notifications"));
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v11, CFSTR("service"), v12);

    objc_msgSend(a1, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v13, CFSTR("metadata"), v14);

    v15 = (void *)objc_opt_class();
    objc_msgSend(a1, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_descriptionForProperties:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("properties"));

    objc_msgSend(a1, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v18, "containsObject:", *MEMORY[0x1E0CB8778]);

    if ((_DWORD)v16)
      objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hasAuthorizationData"), CFSTR("hasAuthorizationData"));
  }

  return v5;
}

@end
