@implementation HUAlarmStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAlarmStatusBannerItem;
  -[HUStatusBannerItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HUAlarmStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__HUAlarmStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  uint64_t isKindOfClass;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {

LABEL_4:
    v8 = (void *)MEMORY[0x1E0D519C0];
    v9 = objc_alloc(MEMORY[0x1E0D314B8]);
    v28 = v4;
    v29[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithResults:", v10);
    objc_msgSend(v8, "futureWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
    goto LABEL_4;
  v10 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v17 = CFSTR("HUBannerAlert_CO2_Description");
    v18 = 2;
    v19 = CFSTR("Home.Banners.Status.Alarm.CarbonDioxide");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) != 0)
    {
      v17 = CFSTR("HUBannerAlert_CO_Description");
      v18 = 1;
      v19 = CFSTR("Home.Banners.Status.Alarm.CarbonMonoxide");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sourceItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v23 = objc_opt_isKindOfClass();

      if ((v23 & 1) != 0)
      {
        v18 = 0;
        v17 = CFSTR("HUBannerAlert_Smoke_Description");
        v19 = CFSTR("Home.Banners.Status.Alarm.Smoke");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "sourceItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = objc_opt_isKindOfClass();

        v18 = -1;
        if ((v25 & 1) == 0)
        {
          v17 = 0;
          goto LABEL_15;
        }
        v17 = CFSTR("HUBannerAlert_Leak_Description");
        v19 = CFSTR("Home.Banners.Status.Alarm.Leak");
      }
    }
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30BA0]);
LABEL_15:
  if (-[__CFString length](v17, "length"))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D20]);
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocalizedStringKey:representedHomeKitObjects:options:", v17, v14, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E7041698, CFSTR("bannerItemCategory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30CA0]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D30BC0]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v12;
}

@end
