@implementation HUNetworkConfigurationSettingsModuleController

- (HUNetworkConfigurationSettingsModuleController)initWithModule:(id)a3
{
  id v4;
  HUNetworkConfigurationSettingsModuleController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUNetworkConfigurationSettingsModuleController;
  v5 = -[HUItemModuleController initWithModule:](&v13, sel_initWithModule_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = v4;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v7;
      if (v8)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

    }
    v9 = 0;
LABEL_9:

    objc_msgSend(v9, "setNetworkConfigurationSettingsModuleDelegate:", v5);
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HUNetworkConfigurationSettingsModuleController %p (%@)>"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkProtectionModeOptionItem:", v4);

  if (v6)
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  objc_super v31;
  uint8_t buf[4];
  HUNetworkConfigurationSettingsModuleController *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HUNetworkConfigurationSettingsModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v31, sel_updateCell_forItem_animated_, v8, v9, v5);
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemNetworkProtectionModeOptionItem:", v9);

  if (!v11)
    goto LABEL_18;
  v12 = objc_opt_class();
  v13 = v8;
  if (!v13)
    goto LABEL_8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

LABEL_8:
    v15 = 0;
  }

  objc_msgSend(v9, "latestResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitleText:", v19);

  objc_msgSend(v9, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDescriptionText:", v21);

  objc_msgSend(v9, "latestResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setChecked:", objc_msgSend(v23, "BOOLValue"));

  if (objc_msgSend(v15, "checked"))
  {
    objc_msgSend(v9, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
    {
      -[HUItemModuleController module](self, "module");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAnimating:", objc_msgSend(v26, "isUpdatingProtectionMode"));

    }
    else
    {
      objc_msgSend(v15, "setAnimating:", 0);
    }

  }
  else
  {
    objc_msgSend(v15, "setAnimating:", 0);
  }
  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[HUItemModuleController module](self, "module");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "group");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "targetProtectionMode");
    *(_DWORD *)buf = 138412802;
    v33 = self;
    v34 = 2112;
    v35 = v15;
    v36 = 2048;
    v37 = v30;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@: %@ (target mode %lu)", buf, 0x20u);

  }
LABEL_18:

}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkProtectionModeOptionItem:", v4);

  return v6;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkProtectionModeOptionItem:", v4);

  if (v6)
  {
    v7 = objc_opt_class();
    v8 = v4;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v8;
      if (v9)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

    }
    v10 = 0;
LABEL_9:

    -[HUItemModuleController module](self, "module");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "updateProtectionMode:", objc_msgSend(v10, "targetProtectionModeOption"));

  }
  return 0;
}

- (void)tappableTextView:(id)a3 tappedAtIndex:(unint64_t)a4 withAttributes:(id)a5
{
  void *v6;
  int v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("HUNetworkConfigurationSettingsMismatchLinkAttributeName"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    -[HUNetworkConfigurationSettingsModuleController _presentNetworkConfigurationSettingsMismatchViewController](self, "_presentNetworkConfigurationSettingsMismatchViewController");
}

- (void)_presentNetworkConfigurationSettingsMismatchViewController
{
  id v3;
  HUNetworkConfigurationSettingsMismatchViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUNetworkConfigurationSettingsMismatchViewController *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0CEA7B8]);
  v4 = [HUNetworkConfigurationSettingsMismatchViewController alloc];
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_networkConfigurationProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUNetworkConfigurationSettingsMismatchViewController initWithProfiles:](v4, "initWithProfiles:", v9);
  v14 = (id)objc_msgSend(v3, "initWithRootViewController:", v10);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredPresentationType:", 0);
  objc_msgSend(v11, "setAnimated:", 1);
  -[HUItemModuleController host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "moduleController:presentViewControllerForRequest:", self, v11);

}

@end
