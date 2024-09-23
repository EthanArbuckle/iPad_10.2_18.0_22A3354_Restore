@implementation HUAppleMusicLoginItem

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
  v10.super_class = (Class)HUAppleMusicLoginItem;
  -[HUAppleMusicItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HUAppleMusicLoginItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __53__HUAppleMusicLoginItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appleMusicMagicAuthCapableAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = *MEMORY[0x1E0D30D70];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_appleMusicCurrentLoggedInAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", v12 != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D30D70];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30D70]);

  }
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hf_homePodSupportsMultiUser");

  if (v15)
  {
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_appleMusicCurrentLoggedInAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mediaAccountForHomeIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    v27 = (void *)MEMORY[0x1E0CB37E8];
    if (v17)
    {
      objc_msgSend(v17, "ams_altDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ams_altDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v20, "isEqualToString:", v21) ^ 1;
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v27, "numberWithInt:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v9);

    if (v17)
    {

    }
    HFLocalizedString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0D30D18];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D30D18]);

    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hf_supportsPreferredMediaUser");

    if (v33)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsHomePodAccountSection_SignInButton"), CFSTR("HUPrimaryUserSettingsHomePodAccountSection_SignInButton"), 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, v31);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17 != 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, v9);

    }
  }
  else
  {
    HFLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D18]);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

@end
