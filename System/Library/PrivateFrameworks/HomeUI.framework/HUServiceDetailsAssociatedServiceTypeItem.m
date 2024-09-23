@implementation HUServiceDetailsAssociatedServiceTypeItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "na_setWithSafeObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v7 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0CBA7E0];
    objc_msgSend(v9, "hf_effectiveServiceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_userFriendlyLocalizedCapitalizedDescription:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v12 = 0;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30B80]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsTypeTitle"), CFSTR("HUServiceDetailsTypeTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.DisplayAs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30BA0]);

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
