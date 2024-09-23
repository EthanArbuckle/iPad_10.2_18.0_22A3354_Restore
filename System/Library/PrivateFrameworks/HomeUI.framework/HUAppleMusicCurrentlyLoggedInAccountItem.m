@implementation HUAppleMusicCurrentlyLoggedInAccountItem

- (id)account
{
  void *v2;
  void *v3;

  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicCurrentlyLoggedInAccountItem;
  -[HUAppleMusicAccountItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HUAppleMusicCurrentlyLoggedInAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __72__HUAppleMusicCurrentlyLoggedInAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_homePodSupportsMultiUser");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaAccountForHomeIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(WeakRetained, "account");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_7;
    v18 = (void *)v17;
    objc_msgSend(WeakRetained, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_altDSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicUsername"), CFSTR("HUAppleMusicUsername"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D30D18]);

      objc_msgSend(WeakRetained, "account");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "username");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30BF8]);

      v23 = *MEMORY[0x1E0D30D70];
      v24 = MEMORY[0x1E0C9AAA0];
    }
    else
    {
LABEL_7:
      v23 = *MEMORY[0x1E0D30D70];
      v24 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v23);

  }
  else
  {
    objc_msgSend(WeakRetained, "account");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicUsername"), CFSTR("HUAppleMusicUsername"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30D18]);

      objc_msgSend(WeakRetained, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "username");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30BF8]);

      v23 = *MEMORY[0x1E0D30D70];
      v29 = MEMORY[0x1E0C9AAA0];
    }
    else
    {
      v23 = *MEMORY[0x1E0D30D70];
      v29 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v23);
  }
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hf_supportsPreferredMediaUser");

  if (v34)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsHomePodAccountSection_AccountInfoTitle"), CFSTR("HUPrimaryUserSettingsHomePodAccountSection_AccountInfoTitle"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D30D18]);

    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hf_appleMusicCurrentLoggedInAccount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(WeakRetained, "account");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "username");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D30BF8]);

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsHomePodAccountSection_AccountInfoPlaceholderValue"), CFSTR("HUPrimaryUserSettingsHomePodAccountSection_AccountInfoPlaceholderValue"), 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D30BF8]);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v23);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

@end
