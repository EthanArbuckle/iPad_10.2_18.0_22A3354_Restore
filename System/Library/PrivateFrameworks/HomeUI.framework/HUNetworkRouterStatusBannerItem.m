@implementation HUNetworkRouterStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUNetworkRouterStatusBannerItem;
  -[HUStatusBannerItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HUNetworkRouterStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__HUNetworkRouterStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a2;
  v4 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "type");

    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0D315D0], "combinedType");
    }
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stateTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D315D0], "combinedStateTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_sortedObjectDisplayNamesForHomeKitObjects:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = CFSTR("HFStatusTitleNetworkRouter_One");
      if (v16 > 1)
        v17 = CFSTR("HFStatusTitleNetworkRouter_MultipleUnknown");
      v18 = *MEMORY[0x1E0D30D20];
      v19 = v17;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v18);
      HFLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D18]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUBannerNetworkRouter_Description_%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocalizedStringKey:representedHomeKitObjects:", v21, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D30BF8]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7040F48, CFSTR("bannerItemCategory"));
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

@end
