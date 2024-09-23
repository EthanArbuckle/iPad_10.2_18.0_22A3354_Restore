@implementation HUAppleMusicLogoutItem

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
  v10.super_class = (Class)HUAppleMusicLogoutItem;
  -[HUAppleMusicItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HUAppleMusicLogoutItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __54__HUAppleMusicLogoutItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7 != 0;
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_homePodSupportsMultiUser");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaAccountForHomeIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v7)
    {
      objc_msgSend(v7, "ams_altDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ams_altDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v20, "isEqualToString:", v21) ^ 1;

    }
    else
    {
      v8 = 0;
    }

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicStopUsingThisAccount"), CFSTR("HUAppleMusicStopUsingThisAccount"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 ^ 1u);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30D70]);

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hf_supportsPreferredMediaUser");

  if (v27)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicSignOut"), CFSTR("HUAppleMusicSignOut"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 == 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v25);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
