@implementation HUSafetyAndSecuritySettingsItemModuleController

- (HUSafetyAndSecuritySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6;
  HUSafetyAndSecuritySettingsItemModuleController *v7;
  HUSafetyAndSecuritySettingsItemModuleController *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  v7 = -[HUItemModuleController initWithModule:](&v11, sel_initWithModule_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHomeManagerObserver:", v8);

  }
  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "homeUpgradeBannerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isEqual:", v8);

  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HUBannerView *v33;
  HUBannerView *softwareUpdateBannerView;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v35, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v6, "bounds");
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSafetyAndSecuritySettingsItemModuleController setLayoutOptions:](self, "setLayoutOptions:", v13);
  objc_msgSend(v10, "listenForSoundsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v14))
  {

LABEL_7:
    v17 = v6;
    objc_msgSend(v17, "setAccessoryView:", 0);
    objc_msgSend(v17, "setAccessoryType:", 1);
    objc_msgSend(v17, "setHideIcon:", 1);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v10, "notificationsItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "isEqual:", v15);

  if (v16)
    goto LABEL_7;
  objc_msgSend(v10, "homeUpgradeBannerItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v7, "isEqual:", v21);

  if (v22)
  {
    v23 = objc_opt_class();
    v24 = v6;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v17 = v24;
      if (v25)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v23, objc_opt_class());

    }
    v17 = 0;
LABEL_23:

    -[HUSafetyAndSecuritySettingsItemModuleController layoutOptions](self, "layoutOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bannerCellOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cornerRadius");
    objc_msgSend(v29, "setCellCornerRadius:");

    -[HUSafetyAndSecuritySettingsItemModuleController layoutOptions](self, "layoutOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bannerCellOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLayoutOptions:", v32);

    objc_msgSend(v17, "setDelegate:", self);
    objc_msgSend(v17, "bannerView");
    v33 = (HUBannerView *)objc_claimAutoreleasedReturnValue();
    softwareUpdateBannerView = self->_softwareUpdateBannerView;
    self->_softwareUpdateBannerView = v33;

    goto LABEL_8;
  }
LABEL_9:
  objc_opt_class();
  v18 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
    objc_msgSend(v20, "setDelegate:", self);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v26, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_opt_class();
    v13 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "user");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_handleForUser:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserHandle:", v18);

      objc_msgSend(v16, "homeAccessControlForUser:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOn:", objc_msgSend(v19, "audioAnalysisUserDropInAccessLevel") == 2);
      if ((objc_msgSend(v16, "hf_currentUserIsOwner") & 1) != 0)
      {
        v20 = 0;
      }
      else if (objc_msgSend(v16, "hf_currentUserIsAdministrator"))
      {
        objc_msgSend(v17, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentUser");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v21, "hmf_isEqualToUUID:", v23);

        objc_msgSend(v16, "homeAccessControlForUser:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = objc_msgSend(v24, "isAdministrator");

        v20 = v22 & ~v25;
      }
      else
      {
        v20 = 1;
      }
      objc_msgSend(v12, "setDisabled:", v20);

    }
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  __objc2_class *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "listenForSoundsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    v10 = HUAudioAnalysisSettingsViewController;
  }
  else
  {
    objc_msgSend(v7, "notificationsItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqual:", v11);

    if (!v12)
    {
      v19 = 0;
      goto LABEL_10;
    }
    v10 = HUSafetyAndSecuritySettingsNotificationsViewController;
  }
  v13 = [v10 alloc];
  objc_msgSend(v7, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithHome:", v14);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAnimated:", 1);
  objc_msgSend(v16, "setPreferredPresentationType:", 1);
  -[HUItemModuleController host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "moduleController:presentViewControllerForRequest:", self, v16);

  v19 = 1;
LABEL_10:

  return v19;
}

- (void)bannerView:(id)a3 footerViewTapped:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v13 = v7;

  -[HUSafetyAndSecuritySettingsItemModuleController softwareUpdateBannerView](self, "softwareUpdateBannerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (!v9)
    goto LABEL_7;
  -[HUSafetyAndSecuritySettingsItemModuleController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUSafetyAndSecuritySettingsItemModuleController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "devices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentHH2OnboardingForHome:withDevices:", v11, v12);

LABEL_7:
  }

}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  void *v31;
  id v32;
  BOOL v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("OFF");
    if (v4)
      v9 = CFSTR("ON");
    *(_DWORD *)buf = 138412290;
    v35 = v9;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "User Tapped switch to turn %@.", buf, 0xCu);
  }

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v7, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enableUserPermissionSetting:forItem:", v4, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __76__HUSafetyAndSecuritySettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke;
    v31 = &unk_1E6F4D1D8;
    v32 = v7;
    v33 = v4;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", &v28);

  }
  objc_msgSend(v12, "itemUpdater", v28, v29, v30, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(v12, "itemProviders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requestToReloadItemProviders:senderSelector:", v20, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v18, "performItemUpdateRequest:", v21);

  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0D31170];
    objc_msgSend(v7, "item");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v27, v4, CFSTR("userDisplayString"), v25);

  }
}

uint64_t __76__HUSafetyAndSecuritySettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setOn:animated:", *(_BYTE *)(result + 40) == 0, 1);
  return result;
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUSafetyAndSecuritySettingsItemModuleController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: didUpdateHH2State = %{BOOL}d", (uint8_t *)&v10, 0x1Cu);

  }
  if (v4)
  {
    -[HUSafetyAndSecuritySettingsItemModuleController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissToHomeSettings");

  }
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (HUBannerView)softwareUpdateBannerView
{
  return self->_softwareUpdateBannerView;
}

- (void)setSoftwareUpdateBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, a3);
}

- (HUSafetyAndSecuritySettingsModuleControllerDelegate)delegate
{
  return (HUSafetyAndSecuritySettingsModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
