@implementation HUCameraSmartDetectionSettingsItemProvider

- (HUCameraSmartDetectionSettingsItemProvider)initWithCameraProfiles:(id)a3 settingsContext:(unint64_t)a4
{
  id v6;
  HUCameraSmartDetectionSettingsItemProvider *v7;
  uint64_t v8;
  NSSet *cameraProfiles;
  uint64_t v10;
  NSMutableSet *smartDetectionSettingsItems;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUCameraSmartDetectionSettingsItemProvider;
  v7 = -[HFItemProvider init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    cameraProfiles = v7->_cameraProfiles;
    v7->_cameraProfiles = (NSSet *)v8;

    v7->_settingsContext = a4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    smartDetectionSettingsItems = v7->_smartDetectionSettingsItems;
    v7->_smartDetectionSettingsItems = (NSMutableSet *)v10;

  }
  return v7;
}

- (HUCameraSmartDetectionSettingsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCameraProfiles_settingsContext_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraSmartDetectionSettingsItemProvider.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraSmartDetectionSettingsItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUCameraSmartDetectionSettingsItemProvider _homeSupportsPackageDetection](self, "_homeSupportsPackageDetection"))
  {
    objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 16, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if (-[HUCameraSmartDetectionSettingsItemProvider settingsContext](self, "settingsContext") == 1
    && _os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 2, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 2, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v13);

  }
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_3;
  v20[3] = &unk_1E6F52F30;
  objc_copyWeak(&v21, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v8, &__block_literal_global_90, &__block_literal_global_14, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_5;
  v18[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v15, "flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v16;
}

uint64_t __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

id __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "significantEventConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HUCameraSmartDetectionSettingsItem *__57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUCameraSmartDetectionSettingsItem *v7;
  HUCameraSmartDetectionSettingsItem *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E6F4DAD8;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  v7 = (HUCameraSmartDetectionSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUCameraSmartDetectionSettingsItem alloc];
    objc_msgSend(WeakRetained, "cameraProfiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUCameraSmartDetectionSettingsItem initWithSignificantEventConfiguration:cameraProfiles:settingsContext:](v8, "initWithSignificantEventConfiguration:cameraProfiles:settingsContext:", v6, v9, objc_msgSend(WeakRetained, "settingsContext"));

  }
  return v7;
}

BOOL __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "significantEventConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v8 == objc_msgSend(*(id *)(a1 + 32), "hash");

  return v9;
}

id __57__HUCameraSmartDetectionSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "smartDetectionSettingsItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "smartDetectionSettingsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_homeSupportsPackageDetection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUCameraSmartDetectionSettingsItemProvider cameraProfiles](self, "cameraProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");

  return v6;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (NSMutableSet)smartDetectionSettingsItems
{
  return self->_smartDetectionSettingsItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartDetectionSettingsItems, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
}

@end
