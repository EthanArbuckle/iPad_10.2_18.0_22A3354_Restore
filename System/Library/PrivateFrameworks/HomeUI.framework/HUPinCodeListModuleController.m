@implementation HUPinCodeListModuleController

- (HUPinCodeListModuleController)initWithModule:(id)a3
{
  id v4;
  HUPinCodeListModuleController *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUPinCodeListModuleController;
  v5 = -[HUItemModuleController initWithModule:](&v10, sel_initWithModule_, v4);
  if (v5)
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "setEditButtonHeaderDelegate:", v5);
    -[HUPinCodeListModuleController setEditing:](v5, "setEditing:", 0);

  }
  return v5;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "listType");

  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPinCodeItem");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v4)
  {

  }
  else
  {
    v9 = (void *)v8;
    -[HUItemModuleController module](self, "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "revokePinCodeItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v4)
    {
      -[HUItemModuleController module](self, "module");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 1)
          -[HUPinCodeListModuleController editing](self, "editing");
      }
    }
  }
  objc_opt_class();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v41, "setAccessoryType:", 1);
    v7 = v6;
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "listType");

    switch(v9)
    {
      case 1:
        objc_opt_class();
        v28 = v41;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v11 = v29;

        objc_msgSend(v7, "latestResults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setUserHandle:", v31);

        -[HUItemModuleController module](self, "module");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "accessory");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          objc_msgSend(v28, "setAccessoryType:", 0);
        objc_opt_class();
        v34 = v28;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
        v18 = v35;

        objc_msgSend(v18, "setDelegate:", self);
        +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPrefersSideBySideTextAndSecondaryText:", 0);
        objc_msgSend(v34, "setContentConfiguration:", v36);

        goto LABEL_27;
      case 2:
      case 4:
        objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v10, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setPrefersSideBySideTextAndSecondaryText:", 0);
        if (_os_feature_enabled_impl())
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeGuestAccessDescription"), CFSTR("HUPinCodeGuestAccessDescription"), 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setSecondaryText:", v12);

        }
        objc_msgSend(v11, "imageProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setReservedLayoutSize:", 37.0, 37.0);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTintColor:", v14);

        objc_msgSend(v11, "setAxesPreservingSuperviewLayoutMargins:", 2);
        objc_msgSend(v41, "setContentConfiguration:", v11);
        objc_opt_class();
        v16 = v41;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        objc_msgSend(v18, "setDelegate:", self);
        goto LABEL_27;
      case 3:
        objc_msgSend(v41, "setAccessoryType:", 0);
        objc_opt_class();
        v37 = v41;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v38 = v37;
        else
          v38 = 0;
        v11 = v38;

        objc_msgSend(v7, "latestResults");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setUserHandle:", v40);

        +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setPrefersSideBySideTextAndSecondaryText:", 0);
        objc_msgSend(v37, "setContentConfiguration:", v18);
LABEL_27:

        break;
      default:
        goto LABEL_28;
    }
    goto LABEL_28;
  }
  -[HUItemModuleController module](self, "module");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addPinCodeItem");
  v20 = objc_claimAutoreleasedReturnValue();
  if ((id)v20 == v6)
  {

LABEL_13:
    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setColor:", v24);

    v26 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v7, "imageProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setReservedLayoutSize:", 37.0, v26);

    objc_msgSend(v41, "setContentConfiguration:", v7);
LABEL_28:

    goto LABEL_29;
  }
  v21 = (void *)v20;
  -[HUItemModuleController module](self, "module");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "revokePinCodeItem");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v6)
    goto LABEL_13;
LABEL_29:

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v12;
    objc_opt_class();
    v8 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "setDisabled:", 1);
      objc_msgSend(v7, "updateUIWithAnimation:", 0);
    }

  }
}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  BOOL result;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPinCodeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "revokePinCodeItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  result = 1;
  if (v6 != v4 && v8 != v4)
  {
    -[HUItemModuleController module](self, "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = -[HUPinCodeListModuleController editing](self, "editing");

      if (!v13)
        return 0;
    }
    else
    {

    }
    return 1;
  }
  return result;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  HUPinCodeDetailsViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HUPinCodeDetailsViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v38[5];

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPinCodeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "revokePinCodeItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v8 == v4)
  {
    -[HUPinCodeListModuleController showSpinner](self, "showSpinner");
    -[HUItemModuleController module](self, "module");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pinCodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "revokeAccessForAllRemovedUsers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __47__HUPinCodeListModuleController_didSelectItem___block_invoke;
    v38[3] = &unk_1E6F4C610;
    v38[4] = self;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v38);

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16 || v6 == v4)
    {

    }
    else
    {
      v18 = -[HUPinCodeListModuleController editing](self, "editing");

      if (!v18)
        goto LABEL_17;
    }
    objc_opt_class();
    v19 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v11 = v20;

    v21 = [HUPinCodeDetailsViewController alloc];
    -[HUItemModuleController module](self, "module");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pinCodeManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController module](self, "module");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v26 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v21, "initWithItem:pinCodeManager:home:", 0, v23, v25);

      -[HUPinCodeDetailsViewController setDelegate:](v26, "setDelegate:", self);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_addGuestDoneButtonPressed_);
      -[HUPinCodeListModuleController setAddGuestDoneButtonItem:](self, "setAddGuestDoneButtonItem:", v28);

      -[HUPinCodeListModuleController addGuestDoneButtonItem](self, "addGuestDoneButtonItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setEnabled:", 0);

      -[HUPinCodeListModuleController addGuestDoneButtonItem](self, "addGuestDoneButtonItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPinCodeDetailsViewController navigationItem](v26, "navigationItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setRightBarButtonItem:", v30);

      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAddGuest_);
      -[HUPinCodeDetailsViewController navigationItem](v26, "navigationItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLeftBarButtonItem:", v32);

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v26);
      objc_msgSend(v34, "setModalPresentationStyle:", 2);
      +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPreferredPresentationType:", 0);
      -[HUPinCodeListModuleController setAddGuestViewController:](self, "setAddGuestViewController:", v26);

    }
    else
    {
      v26 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v21, "initWithItem:pinCodeManager:home:", v11, v23, v25);

      +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPreferredPresentationType:", 1);
    }

    -[HUItemModuleController host](self, "host");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (id)objc_msgSend(v35, "moduleController:presentViewControllerForRequest:", self, v27);

  }
LABEL_17:

  return 0;
}

uint64_t __47__HUPinCodeListModuleController_didSelectItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideSpinner");
}

- (void)cancelAddGuest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[HUPinCodeListModuleController addGuestViewController](self, "addGuestViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "moduleController:dismissViewControllerForRequest:", self, v7);

  -[HUPinCodeListModuleController setAddGuestViewController:](self, "setAddGuestViewController:", 0);
}

- (void)addGuestDoneButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[HUPinCodeListModuleController addGuestViewController](self, "addGuestViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitNewPinCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke;
  v7[3] = &unk_1E6F4CDD0;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

void __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addGuestViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D30980];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke_2;
    v13[3] = &unk_1E6F4E020;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v16 = v6;
    objc_msgSend(v7, "handleError:operationType:options:retryBlock:cancelBlock:", v9, v8, 0, 0, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "moduleController:dismissViewControllerForRequest:", *(_QWORD *)(a1 + 32), v6);

    objc_msgSend(*(id *)(a1 + 32), "setAddGuestViewController:", 0);
  }

}

void __59__HUPinCodeListModuleController_addGuestDoneButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D30598]))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v2 == 80)
    {
      objc_msgSend(*(id *)(a1 + 40), "host");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v3, "moduleController:dismissViewControllerForRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 40), "setAddGuestViewController:", 0);
    }
  }
  else
  {

  }
}

- (UIBarButtonItem)addButtonItem
{
  void *v2;
  void *v3;
  void *v4;

  -[HUPinCodeListModuleController addGuestViewController](self, "addGuestViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v4;
}

- (void)setAddButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (!v4)
  {
    -[HUPinCodeListModuleController addGuestDoneButtonItem](self, "addGuestDoneButtonItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  -[HUPinCodeListModuleController addGuestViewController](self, "addGuestViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v7);

}

- (void)showSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUItemModuleController host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForModuleController:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v4);
    objc_msgSend(v7, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

    objc_msgSend(v4, "startAnimating");
  }

}

- (void)hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[HUItemModuleController host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForModuleController:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v10, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v10, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", 0);

    objc_msgSend(v8, "stopAnimating");
  }

}

- (void)_switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUPinCodeListModuleController showSpinner](self, "showSpinner");
  objc_opt_class();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pinCodeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPinCodeWithItem:enabled:onAccessories:", v9, v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__HUPinCodeListModuleController__switchCell_didTurnOn___block_invoke;
  v17[3] = &unk_1E6F5A3A8;
  v17[4] = self;
  v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v17);

}

void __55__HUPinCodeListModuleController__switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hideSpinner");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v5, *MEMORY[0x1E0D30A60], 0, 0, 0);

  }
}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
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
  void *v27;
  id v28;

  v5 = a4;
  -[HUPinCodeListModuleController setEditing:](self, "setEditing:", -[HUPinCodeListModuleController editing](self, "editing") ^ 1);
  if (_os_feature_enabled_impl())
  {
    objc_opt_class();
    -[HUItemModuleController host](self, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_opt_class();
    objc_msgSend(v8, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = (void *)MEMORY[0x1E0C99DE8];
    -[HUItemModuleController module](self, "module");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pinCodeItemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "transformedGuestUserItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v20);

    -[HUItemModuleController host](self, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadCellForItems:withDiffableDataSourceReload:", v17, 1);
  }
  else
  {
    -[HUItemModuleController host](self, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController module](self, "module");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pinCodeItemProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadCellForItems:withDiffableDataSourceReload:", v24, 1);

  }
  objc_opt_class();
  v28 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v28;
  else
    v25 = 0;
  v26 = v25;

  -[HUPinCodeListModuleController editing](self, "editing");
  HFLocalizedString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setOverrideAccessoryButtonTitle:", v27);
  objc_msgSend(v26, "updateUIWithAnimation:", 1);

}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (HUPinCodeDetailsViewController)addGuestViewController
{
  return self->_addGuestViewController;
}

- (void)setAddGuestViewController:(id)a3
{
  objc_storeStrong((id *)&self->_addGuestViewController, a3);
}

- (UIBarButtonItem)addGuestDoneButtonItem
{
  return self->_addGuestDoneButtonItem;
}

- (void)setAddGuestDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addGuestDoneButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addGuestDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_addGuestViewController, 0);
}

@end
