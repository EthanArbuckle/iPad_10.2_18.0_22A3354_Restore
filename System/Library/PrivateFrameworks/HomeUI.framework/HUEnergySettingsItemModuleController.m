@implementation HUEnergySettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "gridForecastItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqual:", v9);

  if (!v10)
  {
    objc_msgSend(v8, "connectUtilityItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v11))
    {

    }
    else
    {
      objc_msgSend(v8, "utilityDetailsItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "isEqual:", v12);

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEnergySettingsItemModuleController.m"), 37, CFSTR("Couldn't find a cell class for item: %@"), v5);

        v14 = 0;
        goto LABEL_9;
      }
    }
  }
  objc_opt_class();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (Class)v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
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
  id v26;
  double v27;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUEnergySettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v29, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "connectUtilityItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v7, "isEqual:", v11);
  if ((_DWORD)v10)
  {
    objc_msgSend(v6, "defaultContentConfiguration");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v14);

    v15 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v7, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v18);

    objc_msgSend(v7, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v20, "BOOLValue");

    if ((_DWORD)v17)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setColor:", v21);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageProperties");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTintColor:", v23);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textProperties");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setColor:", v23);
    }

    v27 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v12, "imageProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setReservedLayoutSize:", 37.0, v27);

    objc_msgSend(v6, "setContentConfiguration:", v12);
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.ConnectUtility"));
  }
  else
  {
    objc_opt_class();
    v12 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v12;
    else
      v25 = 0;
    v26 = v25;

    if (v26)
      objc_msgSend(v26, "setDelegate:", self);
    else
      v12 = 0;
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
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
  double v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  objc_super v43;
  uint8_t buf[4];
  HUEnergySettingsItemModuleController *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HUEnergySettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v43, sel_updateCell_forItem_animated_, v9, v10, v5);
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "utilityDetailsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(v10, "isEqual:", v14);
  if ((_DWORD)v13)
  {
    objc_msgSend(v9, "defaultContentConfiguration");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v17);

    objc_msgSend(v10, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSecondaryText:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "secondaryTextProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setColor:", v20);

    objc_msgSend(v10, "latestResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v23);

    objc_msgSend(v15, "imageProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMaximumSize:", 37.0, 37.0);

    objc_msgSend(v15, "imageProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", 8.325);

    v26 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v15, "imageProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setReservedLayoutSize:", 37.0, v26);

    objc_msgSend(v10, "latestResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("show-connect-utility-item"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB590], 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textProperties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFont:", v31);

      v33 = 0;
      v34 = 0;
    }
    else
    {
      v34 = 3;
      v33 = 1;
    }
    objc_msgSend(v9, "setAccessoryType:", v33);
    objc_msgSend(v9, "setSelectionStyle:", v34);
    objc_msgSend(v9, "setContentConfiguration:", v15);
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.UtilityDetails"));
  }
  else
  {
    objc_opt_class();
    v15 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v15;
    else
      v35 = 0;
    v36 = v35;

    if (v36)
    {
      -[HUItemModuleController module](self, "module");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "home");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "hf_isGridForecastEnabled");

      HFLogForCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = self;
        v46 = 2112;
        v47 = v41;
        v48 = 1024;
        v49 = v39;
        _os_log_impl(&dword_1B8E1E000, v40, OS_LOG_TYPE_DEFAULT, "%@:%@ Update switch cell (Show Grid Forecast? --> %{BOOL}d)", buf, 0x1Cu);

      }
      objc_msgSend(v36, "setOn:", v39);
      objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.ShowGridForecast"));
      objc_msgSend(v36, "accessoryView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.ShowGridForecastSwitch"));

    }
    else
    {
      v15 = 0;
    }
  }

}

- (BOOL)canSelectItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  unint64_t v22;
  NSObject *v23;
  _TtC6HomeUI28UtilityDetailsViewController *v24;
  void *v25;
  void *v26;
  _TtC6HomeUI28UtilityDetailsViewController *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t v32[16];
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "connectUtilityItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "didSelectItem: connectUtilityItem", v32, 2u);
    }

    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = *MEMORY[0x1E0D306B8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController host](self, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
    v34 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[HUHomeFeatureOnboardingUtilities home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardFeaturesForKeyPaths:presentingViewController:usageOptions:", v12, v13, v14, v15);

    +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingEntryPointInSettingsTappedEvent](HUHomeEnergyAnalyticsHelper, "sendUtilityOnboardingEntryPointInSettingsTappedEvent");
  }
  objc_msgSend(v7, "utilityDetailsItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "isEqual:", v17);

  if (v18
    && (objc_msgSend(v4, "latestResults"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("show-connect-utility-item")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "BOOLValue"),
        v20,
        v19,
        (v21 & 1) == 0))
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "didSelectItem: utilityDetailsItem", v32, 2u);
    }

    v24 = [_TtC6HomeUI28UtilityDetailsViewController alloc];
    objc_msgSend(v7, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsDict");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[UtilityDetailsViewController initWithHome:details:](v24, "initWithHome:details:", v25, v26);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 1;
    objc_msgSend(v28, "setAnimated:", 1);
    objc_msgSend(v28, "setPreferredPresentationType:", 1);
    -[HUItemModuleController host](self, "host");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "moduleController:presentViewControllerForRequest:", self, v28);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  HUEnergySettingsItemModuleController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v8;
    v20 = 1024;
    v21 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User toggled switch. Show Grid Forecast? --> %{BOOL}d", (uint8_t *)&v16, 0x1Cu);

  }
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_setIsGridForecastEnabled:", v4);

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController module](self, "module");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_isGridForecastEnabled");
    v16 = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 1024;
    v21 = v15;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated user defaults %{BOOL}d ", (uint8_t *)&v16, 0x1Cu);

  }
}

@end
