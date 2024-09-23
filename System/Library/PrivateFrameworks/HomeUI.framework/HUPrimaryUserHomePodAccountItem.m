@implementation HUPrimaryUserHomePodAccountItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUPrimaryUserHomePodAccountItem valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserHomePodAccountItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithValueSource:mediaProfileContainer:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
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
  v10.super_class = (Class)HUPrimaryUserHomePodAccountItem;
  -[HUPrimaryUserHomePodAccountItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HUPrimaryUserHomePodAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __63__HUPrimaryUserHomePodAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _DWORD v16[2];
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsUserSection_HomePodAccountTitle"), CFSTR("HUPrimaryUserSettingsUserSection_HomePodAccountTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_1E6F60E80, *MEMORY[0x1E0D30BF8]);
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsUserSection_HomePodAccountDescription_SignedOut"), CFSTR("HUPrimaryUserSettingsUserSection_HomePodAccountDescription_SignedOut"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30BF8]);

  }
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_preferredUserSelectionType");

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109376;
    v16[1] = v8 != 0;
    v17 = 1024;
    v18 = v11 == 0;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Is there a signed-in account on this HomePod?: %{BOOL}d isSelectionTypeHomePodAccount?: %{BOOL}d", (uint8_t *)v16, 0xEu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 == 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30DA0]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
