@implementation HUFirmwareUpdateStatusBannerItem

id __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

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
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__21;
    v23 = __Block_byref_object_dispose__21;
    v24 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke_1;
    v18[3] = &unk_1E6F58230;
    v18[4] = &v19;
    objc_msgSend(v9, "na_filter:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v10, "count");
      v12 = CFSTR("HUBannerFirmwareUpdate_Title_Multiple");
      if (v11 == 1)
        v12 = CFSTR("HUBannerFirmwareUpdate_Title");
      v13 = v12;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D20]);
      _HULocalizedStringWithDefaultValue(v13, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D18]);

      objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocalizedStringKey:representedHomeKitObjects:", CFSTR("HUBannerFirmwareUpdate_Description"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30BF8]);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("square.and.arrow.down.fill"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30C60]);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7041260, CFSTR("bannerItemCategory"));
      if (_os_feature_enabled_impl()
        && objc_msgSend((id)v20[5], "hf_currentUserIsRestrictedGuest"))
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
      }

    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v19, 8);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFirmwareUpdateStatusBannerItem;
  -[HUStatusBannerItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __64__HUFirmwareUpdateStatusBannerItem__subclass_updateWithOptions___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (objc_msgSend(v6, "hf_isReadyToInstallSoftwareUpdate")
    && objc_msgSend(v6, "isControllable"))
  {
    v10 = objc_msgSend(v6, "hf_isHomePod");
    objc_msgSend(v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) != 0)
      v13 = objc_msgSend(v11, "isAutomaticSoftwareUpdateEnabled");
    else
      v13 = objc_msgSend(v11, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    v14 = v13 ^ 1u;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
