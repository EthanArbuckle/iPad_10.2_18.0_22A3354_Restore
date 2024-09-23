@implementation HMServiceGroup(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:options:", v8, CFSTR("services"), v9, 0);

    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isOnForContextType:", 0), CFSTR("isLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_shouldBeOnForContextType:", 0), CFSTR("showInLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isFavorite"), CFSTR("isFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveIsFavorite"), CFSTR("effectiveIsFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveShowInHomeDashboard"), CFSTR("effectiveShowInHomeDashboard"));
  }

  return v5;
}

@end
