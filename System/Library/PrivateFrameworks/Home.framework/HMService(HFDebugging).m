@implementation HMService(HFDebugging)

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  v8 = (void *)MEMORY[0x1E0CBA7E0];
  objc_msgSend(a1, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDescriptionForServiceType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("type"));

  objc_msgSend(a1, "serviceSubtype");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CBA7E0];
    objc_msgSend(a1, "serviceSubtype");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_descriptionForServiceSubtype:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("subtype"));

  }
  objc_msgSend(a1, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
  objc_msgSend(v5, "appendObject:withName:context:", v15, CFSTR("accessory"), v16);

  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "characteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("characteristics"));

    objc_msgSend(a1, "associatedServiceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CBA7E0];
      objc_msgSend(a1, "associatedServiceType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDescriptionForServiceType:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("associatedServiceType"));

    }
    objc_msgSend(a1, "linkedServices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:options:", v22, CFSTR("linkedServices"), v23, 1);

    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isOnForContextType:", 0), CFSTR("isLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_shouldBeOnForContextType:", 0), CFSTR("showInLegacyFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_isFavorite"), CFSTR("isFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveIsFavorite"), CFSTR("effectiveIsFavorite"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_showInHomeDashboard"), CFSTR("showInHomeDashboard"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "hf_effectiveShowInHomeDashboard"), CFSTR("effectiveShowInHomeDashboard"));
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isPrimaryService"), CFSTR("primaryService"));
  }

  return v5;
}

@end
