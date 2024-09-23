@implementation HFMediaCategoryStatusItem

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup mediaAccessoryTypeGroup](HFAccessoryTypeGroup, "mediaAccessoryTypeGroup");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HFMediaCategoryStatusItem *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMediaCategoryStatusItem;
  -[HFAccessoryCategoryStatusItem _subclass_updateWithOptions:](&v12, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HFMediaCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA726DC0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_244 != -1)
    dispatch_once(&_MergedGlobals_244, &__block_literal_global_2_8);
  return (id)qword_1ED379010;
}

id __57__HFMediaCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    goto LABEL_8;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameSpeakersAndTVs"), CFSTR("HFAccessoryTypeGroupNameSpeakersAndTVs"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Home.Status.Category.SpeakersAndTVs"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("tv.and.hifispeaker.fill.fill"), CFSTR("iconNames"));
  v7 = [HFImageIconDescriptor alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iconNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFImageIconDescriptor initWithSystemImageNamed:](v7, "initWithSystemImageNamed:", v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("icon"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (!v12)
      goto LABEL_8;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    objc_msgSend(*(id *)(a1 + 40), "_statusItemOfClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_statusItemOfClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqual:", &unk_1EA7CC0B8) & 1) != 0)
    {

      if (!v14)
        goto LABEL_17;
    }
    else
    {
      v38 = v15;
      objc_msgSend(v16, "latestResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("state"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isEqual:", &unk_1EA7CC0B8) & 1) != 0)
      {
        v29 = 0;
      }
      else
      {
        objc_msgSend(v38, "latestResults");
        v36 = v16;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
        v37 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v31, "count") != 0;

        v13 = v37;
        v16 = v36;
      }

      if (!v14)
      {
        v15 = v38;
        if (!v29)
        {
          v33 = CFSTR("HFMediaCategoryStatusDescription_AllOff");
          goto LABEL_21;
        }
LABEL_17:
        v33 = CFSTR("HFMediaCategoryStatusDescription_NonePlaying");
LABEL_21:
        _HFLocalizedStringWithDefaultValue(v33, v33, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v15 = v38;
      if (!v29)
      {
        v32 = CFSTR("HFMediaCategoryStatusDescription_On");
        goto LABEL_19;
      }
    }
    v32 = CFSTR("HFMediaCategoryStatusDescription_Playing");
LABEL_19:
    HFLocalizedStringWithFormat(v32, CFSTR("%lu"), v19, v20, v21, v22, v23, v24, v14);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v35 = (void *)v34;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("description"));

    objc_msgSend(*(id *)(a1 + 40), "applyInflectionToDescriptions:", v3);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v25;
}

void __46__HFMediaCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379010;
  qword_1ED379010 = v0;

}

@end
