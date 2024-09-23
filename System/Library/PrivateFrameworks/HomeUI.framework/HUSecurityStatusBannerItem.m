@implementation HUSecurityStatusBannerItem

id __58__HUSecurityStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CF8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if (!v7)
    {
      v10 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E60]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("HFStatusTitleSecuritySystem"), *MEMORY[0x1E0D30D20]);
      HFLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30D18]);

      objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocalizedStringKey:representedHomeKitObjects:", CFSTR("HUBannerAlert_Security_Description"), v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30BF8]);

      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E7041758, CFSTR("bannerItemCategory"));
      v12 = (void *)MEMORY[0x1E0D519C0];
      v13 = v10;
      goto LABEL_5;
    }
  }
  v8 = (void *)MEMORY[0x1E0D519C0];
  v9 = objc_alloc(MEMORY[0x1E0D314B8]);
  v18 = v4;
  v19[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithResults:", v10);
  v12 = v8;
  v13 = v11;
LABEL_5:
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSecurityStatusBannerItem;
  -[HUStatusBannerItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUSecurityStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
