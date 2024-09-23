@implementation HFAccessorySettingManagedConfigurationAdapter

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  HFAccessorySettingManagedConfigurationAdapter *v10;
  uint64_t v11;
  NSHashTable *profileObservers;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingManagedConfigurationAdapter.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

  }
  v16[0] = CFSTR("root.general.profiles.managedConfigurationProfiles");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HFAccessorySettingManagedConfigurationAdapter;
  v10 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v15, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v7, v9, a4, 0);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    profileObservers = v10->_profileObservers;
    v10->_profileObservers = (NSHashTable *)v11;

    v10->_isSettingUp = 1;
    -[HFAccessorySettingManagedConfigurationAdapter _setupDebugHandler](v10, "_setupDebugHandler");
  }

  return v10;
}

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingManagedConfigurationAdapter.m"), 61, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingManagedConfigurationAdapter.m"), 66, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MCProfileConnection removeObserver:](self->_profileConnectionForSynchronization, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HFAccessorySettingManagedConfigurationAdapter;
  -[HFAccessorySettingManagedConfigurationAdapter dealloc](&v3, sel_dealloc);
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEBUG, "Ignoring managed config updates in direct mode.", v5, 2u);
  }

}

- (id)removeProfileFromHomeKit:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x39uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to remove profile %@", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingManagedConfigurationAdapter.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

  }
  objc_initWeak((id *)buf, self);
  -[HFAccessorySettingManagedConfigurationAdapter profilesSettingFuture](self, "profilesSettingFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke;
  v17[3] = &unk_1EA735B60;
  objc_copyWeak(&v19, (id *)buf);
  v9 = v5;
  v18 = v9;
  objc_msgSend(v7, "flatMap:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_3;
  v15[3] = &unk_1EA728EC8;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "addCompletionBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "valueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForSetting:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_2;
  v12[3] = &unk_1EA735340;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v7, "na_filter:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "valueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changeValueForSetting:toValue:changeType:", v4, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0D47220];
  objc_msgSend(a2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileWithData:outError:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7) ^ 1;

  return v8;
}

void __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Removal of '%@' failed with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Removal of '%@' finished successfully", (uint8_t *)&v9, 0xCu);
  }

}

- (id)removeProfileDataFromHomeKit:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingManagedConfigurationAdapter.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileData"));

  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    HFLogForCategory(0x39uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Unable to reconstitute data into a profile: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFAccessorySettingManagedConfigurationAdapter removeProfileFromHomeKit:](self, "removeProfileFromHomeKit:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)profiles
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFAccessorySettingManagedConfigurationAdapter _profilesSettingData](self, "_profilesSettingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke;
  v6[3] = &unk_1EA728350;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_2;
  v9[3] = &unk_1EA735A20;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_118);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    HFLogForCategory(0x39uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v12 = "-[HFAccessorySettingManagedConfigurationAdapter profiles]_block_invoke_2";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s(%@): Error (%@), ignoring profile data %@.", buf, 0x2Au);
    }

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

uint64_t __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "installDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)addProfileObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessorySettingManagedConfigurationAdapter profileObservers](self, "profileObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeProfileObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessorySettingManagedConfigurationAdapter profileObservers](self, "profileObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (unint64_t)numberOfProfiles
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFAccessorySettingAdapter valueManager](self, "valueManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForSettingAtKeyPath:", CFSTR("root.general.profiles.managedConfigurationProfiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  return v4;
}

- (id)profilesSettingFuture
{
  void *v2;
  void *v3;

  -[HFAccessorySettingAdapter settingWatchFutureForKeyPath:](self, "settingWatchFutureForKeyPath:", CFSTR("root.general.profiles.managedConfigurationProfiles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_28_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __70__HFAccessorySettingManagedConfigurationAdapter_profilesSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  objc_msgSend(v6, "setItemValueClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_installedProfileData
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[HFAccessorySettingAdapter mode](self, "mode"))
    return MEMORY[0x1E0C9AA70];
  -[HFAccessorySettingManagedConfigurationAdapter profileConnectionForSynchronization](self, "profileConnectionForSynchronization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installedProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[HFAccessorySettingManagedConfigurationAdapter _installedProfileData]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s: Current set of installed profiles %@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HFAccessorySettingManagedConfigurationAdapter__installedProfileData__block_invoke;
  v11[3] = &unk_1EA72CB68;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v4, "na_each:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

void __70__HFAccessorySettingManagedConfigurationAdapter__installedProfileData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "profileConnectionForSynchronization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installedProfileDataWithIdentifier:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v6, v4);
}

- (id)_profilesSettingData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[HFAccessorySettingAdapter valueManager](self, "valueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingManagedConfigurationAdapter profilesSettingFuture](self, "profilesSettingFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke;
  v8[3] = &unk_1EA735AD0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "valueForSetting:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke_2;
  v7[3] = &unk_1EA735AA8;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "na_each:", v7);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D47220];
  v4 = a2;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileWithData:outError:", v5, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, v8);

}

- (id)_removeProfileFromProfileManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  if (-[HFAccessorySettingAdapter mode](self, "mode"))
  {
    -[HFAccessorySettingManagedConfigurationAdapter profileConnectionForSynchronization](self, "profileConnectionForSynchronization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke;
    v12[3] = &unk_1EA729F18;
    v13 = v5;
    v14 = v4;
    v7 = v5;
    objc_msgSend(v6, "futureWithBlock:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke_2;
  v7[3] = &unk_1EA727DD8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "removeProfileWithIdentifier:completion:", v5, v7);

}

uint64_t __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (MCProfileConnection)profileConnectionForSynchronization
{
  MCProfileConnection *v3;
  MCProfileConnection *profileConnectionForSynchronization;
  MCProfileConnection *v5;
  MCProfileConnection *v6;

  v3 = -[HFAccessorySettingAdapter mode](self, "mode");
  if (v3)
  {
    profileConnectionForSynchronization = self->_profileConnectionForSynchronization;
    if (!profileConnectionForSynchronization)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v5 = (MCProfileConnection *)objc_claimAutoreleasedReturnValue();
      v6 = self->_profileConnectionForSynchronization;
      self->_profileConnectionForSynchronization = v5;

      -[MCProfileConnection addObserver:](self->_profileConnectionForSynchronization, "addObserver:", self);
      profileConnectionForSynchronization = self->_profileConnectionForSynchronization;
    }
    v3 = profileConnectionForSynchronization;
  }
  return v3;
}

- (id)_synchronizeManagedConfigurationToHomeKit
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  HFAccessorySettingManagedConfigurationAdapter *v12;
  id v13;
  id buf[2];

  if (-[HFAccessorySettingAdapter mode](self, "mode"))
  {
    HFLogForCategory(0x39uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing Managed Configuration -> HomeKit (Replacing HomeKit configuration with contents of ManagedConfiguration)", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    -[HFAccessorySettingManagedConfigurationAdapter profilesSettingFuture](self, "profilesSettingFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke;
    v11 = &unk_1EA735B60;
    v12 = self;
    objc_copyWeak(&v13, buf);
    objc_msgSend(v4, "flatMap:", &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCompletionBlock:", &__block_literal_global_44_2, v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_profilesSettingData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_2;
  v8[3] = &unk_1EA735B38;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke_2";
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s: set of HomeKit profiles: %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(WeakRetained, "_installedProfileData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x39uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%s: set of Managed Configuration profiles: %@", (uint8_t *)&v15, 0x16u);
  }

  if (objc_msgSend(v6, "isEqual:", v3))
  {
    HFLogForCategory(0x39uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke";
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%s: profiles match, no work needed", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_40_3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x39uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke_2";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%s: replace HomeKit profiles with Managed Configuration profiles %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(WeakRetained, "valueManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "changeValueForSetting:toValue:changeType:", *(_QWORD *)(a1 + 32), v11, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_39(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CBA1E8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

void __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (v3)
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject logError:operationDescription:](v4, "logError:operationDescription:", v3, CFSTR("_synchronizeManagedConfigurationToHomeKit"));
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Successfully Synchronized managed configuration -> homeKit", v5, 2u);
    }
  }

}

- (void)_dispatchWasUpdated
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HFAccessorySettingManagedConfigurationAdapter profileObservers](self, "profileObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "managedConfigurationAdapterSettingsWereUpdated:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "received notification from MobileConfig that profile lists changed: connection: %@ userInfo: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = -[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit](self, "_synchronizeManagedConfigurationToHomeKit");
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("root.general.profiles"));

  return !v5 || -[HFAccessorySettingManagedConfigurationAdapter numberOfProfiles](self, "numberOfProfiles") != 0;
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit](self, "_synchronizeManagedConfigurationToHomeKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__HFAccessorySettingManagedConfigurationAdapter__beginMonitoringSettingsKeyPath___block_invoke;
  v8[3] = &unk_1EA735BC8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "addCompletionBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __81__HFAccessorySettingManagedConfigurationAdapter__beginMonitoringSettingsKeyPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsSettingUp:", 0);

}

- (void)_setupDebugHandler
{
  void *v2;
  objc_class *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HFAccessorySettingManagedConfigurationAdapter__setupDebugHandler__block_invoke;
  v6[3] = &unk_1EA7266C0;
  objc_copyWeak(&v7, &location);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "registerStateDumpHandler:withName:", v6, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __67__HFAccessorySettingManagedConfigurationAdapter__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", WeakRetained, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installedProfileIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MCProfiles"));

    objc_msgSend(WeakRetained, "settingForKeyPath:", CFSTR("root.general.profiles.managedConfigurationProfiles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HKProfiles"));

    if (objc_msgSend(WeakRetained, "mode") == 1)
      v8 = CFSTR("Accessory");
    else
      v8 = CFSTR("Controller");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("adapterMode"));
    objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(WeakRetained, "isSettingUp"), CFSTR("settingUp"), 1);
    objc_msgSend(v3, "buildPropertyListRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (BOOL)isSettingUp
{
  return self->_isSettingUp;
}

- (void)setIsSettingUp:(BOOL)a3
{
  self->_isSettingUp = a3;
}

- (NSHashTable)profileObservers
{
  return self->_profileObservers;
}

- (void)setProfileObservers:(id)a3
{
  objc_storeStrong((id *)&self->_profileObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileObservers, 0);
  objc_storeStrong((id *)&self->_profileConnectionForSynchronization, 0);
}

@end
