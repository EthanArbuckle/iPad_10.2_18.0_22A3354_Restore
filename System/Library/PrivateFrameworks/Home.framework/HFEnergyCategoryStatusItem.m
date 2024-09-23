@implementation HFEnergyCategoryStatusItem

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup energyAccessoryTypeGroup](HFAccessoryTypeGroup, "energyAccessoryTypeGroup");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFEnergyCategoryStatusItem;
  -[HFAccessoryCategoryStatusItem _subclass_updateWithOptions:](&v11, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HFEnergyCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA726DC0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hidesWithNoAccessories
{
  return 0;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_290 != -1)
    dispatch_once(&_MergedGlobals_290, &__block_literal_global_2_25);
  return (id)qword_1ED379938;
}

- (void)setEnergyAdviceDisplayDescription:(id)a3
{
  objc_storeStrong((id *)&self->_energyAdviceDisplayDescription, a3);
}

id __58__HFEnergyCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  char v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  HFImageIconDescriptor *v20;
  void *v21;
  HFImageIconDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("currentHomeDependency"));
  objc_opt_class();
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("dependentHomeKitObjects"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hidden"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hf_isHomeEnergyVisible");

    if ((v16 & 1) != 0
      && (objc_msgSend(*(id *)(a1 + 32), "home"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "hf_isHomeEnergyHomeEmpty"),
          v17,
          !v18))
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameEnergy"), CFSTR("HFAccessoryTypeGroupNameEnergy"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("title"));

      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Home.Status.Category.Energy"), CFSTR("HFResultDisplayAccessibilityIDKey"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("bolt.fill"), CFSTR("iconNames"));
      v20 = [HFImageIconDescriptor alloc];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iconNames"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HFImageIconDescriptor initWithSystemImageNamed:](v20, "initWithSystemImageNamed:", v21);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("icon"));

      objc_msgSend(*(id *)(a1 + 32), "energyAdviceDisplayDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 32), "energyAdviceDisplayDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("description"));

      }
      objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v3);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "BOOLValue");

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (NSString)energyAdviceDisplayDescription
{
  return self->_energyAdviceDisplayDescription;
}

void __47__HFEnergyCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379938;
  qword_1ED379938 = MEMORY[0x1E0C9AA60];

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyAdviceDisplayDescription, 0);
}

@end
