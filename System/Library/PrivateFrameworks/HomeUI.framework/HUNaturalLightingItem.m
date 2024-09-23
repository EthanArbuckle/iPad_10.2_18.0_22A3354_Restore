@implementation HUNaturalLightingItem

- (HUNaturalLightingItem)initWithSourceItem:(id)a3 defaultSelected:(BOOL)a4
{
  _BOOL8 v4;
  HUNaturalLightingItem *v5;
  HUNaturalLightingItem *v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingItem;
  v5 = -[HFTransformItem initWithSourceItem:resultKeyExclusionFilter:](&v11, sel_initWithSourceItem_resultKeyExclusionFilter_, a3, MEMORY[0x1E0C9AA60]);
  v6 = v5;
  if (v5)
  {
    -[HUNaturalLightingItem accessory](v5, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasOnboardedForNaturalLighting");

    if (v8)
    {
      -[HUNaturalLightingItem lightProfiles](v6, "lightProfiles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNaturalLightingItem setSelected:](v6, "setSelected:", objc_msgSend(v9, "na_all:", &__block_literal_global_164));

    }
    else
    {
      -[HUNaturalLightingItem setSelected:](v6, "setSelected:", v4);
    }
  }
  return v6;
}

uint64_t __60__HUNaturalLightingItem_initWithSourceItem_defaultSelected___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNaturalLightingEnabled");

  return v3;
}

- (HMRoom)hf_parentRoom
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HUNaturalLightingItem homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2D9368))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "hf_parentRoom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMRoom *)v5;
}

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUNaturalLightingItem;
  -[HFTransformItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HUNaturalLightingItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__HUNaturalLightingItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "selected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30DA0]);

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)lightProfiles
{
  void *v3;
  void *v4;
  void *v5;

  -[HUNaturalLightingItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUNaturalLightingItem accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v5;
}

- (id)accessory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_opt_class();
  -[HUNaturalLightingItem homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  -[HUNaturalLightingItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v5)
  {
    objc_msgSend(v5, "accessory");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;

  return v10;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

@end
