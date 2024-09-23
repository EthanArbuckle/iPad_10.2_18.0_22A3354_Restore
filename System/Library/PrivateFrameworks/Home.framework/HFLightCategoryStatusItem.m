@implementation HFLightCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HFLightCategoryStatusItem *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFLightCategoryStatusItem;
  -[HFAccessoryCategoryStatusItem _subclass_updateWithOptions:](&v12, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HFLightCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA726DC0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup lightAccessoryTypeGroup](HFAccessoryTypeGroup, "lightAccessoryTypeGroup");
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_318 != -1)
    dispatch_once(&_MergedGlobals_318, &__block_literal_global_2_34);
  return (id)qword_1ED379D80;
}

id __57__HFLightCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  HFImageIconDescriptor *v7;
  void *v8;
  HFImageIconDescriptor *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    goto LABEL_7;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameLights"), CFSTR("HFAccessoryTypeGroupNameLights"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Home.Status.Category.Lights"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("lightbulb.fill"), CFSTR("iconNames"));
  v7 = [HFImageIconDescriptor alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iconNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFImageIconDescriptor initWithSystemImageNamed:](v7, "initWithSystemImageNamed:", v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("icon"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
  {

LABEL_7:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (!v12)
    goto LABEL_7;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (v14)
    HFLocalizedStringWithFormat(CFSTR("HFLightCategoryStatusDescription_On"), CFSTR("%lu"), v15, v16, v17, v18, v19, v20, v14);
  else
    _HFLocalizedStringWithDefaultValue(CFSTR("HFLightCategoryStatusDescription_AllOff"), CFSTR("HFLightCategoryStatusDescription_AllOff"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("description"));

  objc_msgSend(*(id *)(a1 + 40), "applyInflectionToDescriptions:", v3);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v21;
}

void __46__HFLightCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379D80;
  qword_1ED379D80 = v0;

}

@end
