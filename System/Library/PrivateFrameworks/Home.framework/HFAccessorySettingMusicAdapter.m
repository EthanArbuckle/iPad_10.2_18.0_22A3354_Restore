@implementation HFAccessorySettingMusicAdapter

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  HFAccessorySettingMusicAdapter *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:mode:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HFAccessorySettingMusicAdapter.m"), 29, CFSTR("Music adapter does not do what you think it does."));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingMusicAdapter;
  v8 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v12, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v6, v7, a4, 0);

  return v8;
}

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingMusicAdapter.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingMusicAdapter.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

+ (BOOL)areAllAccessoriesLoggedIntoSameAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedIntoSameAccount___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v6;
  v7 = v6;
  LOBYTE(v5) = objc_msgSend(v3, "na_all:", v9);

  return (char)v5;
}

uint64_t __73__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedIntoSameAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

+ (BOOL)areAllAccessoriesLoggedOut:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_17);

  return v4;
}

BOOL __61__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedOut___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("root.music")) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("root.music.account")))
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F0449888))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      if (objc_msgSend(v8, "isItemGroup"))
      {
        v9 = +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedIntoSameAccount:](HFAccessorySettingMusicAdapter, "areAllAccessoriesLoggedIntoSameAccount:", v8);
        v5 = v9 | +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedOut:](HFAccessorySettingMusicAdapter, "areAllAccessoriesLoggedOut:", v8);
      }
      else if (objc_msgSend(v8, "isContainedWithinItemGroup"))
      {
        -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "hf_home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "anyObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hf_mediaSystemForAccessory:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v10) = +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedIntoSameAccount:](HFAccessorySettingMusicAdapter, "areAllAccessoriesLoggedIntoSameAccount:", v14);
        v5 = v10 | +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedOut:](HFAccessorySettingMusicAdapter, "areAllAccessoriesLoggedOut:", v14);

        LOBYTE(v5) = v5 ^ 1;
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end
