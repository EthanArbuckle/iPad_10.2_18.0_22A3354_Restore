@implementation HUAddPersonRoleViewController

- (HUAddPersonRoleViewController)initWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HUAddPersonRoleViewController *v9;
  HUAddPersonRoleViewController *v10;
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
  objc_super v26;

  v4 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRoleTitle"), CFSTR("HUAddPersonRoleTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRoleSubtitle"), CFSTR("HUAddPersonRoleSubtitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_canAddRestrictedGuest"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_Title"), CFSTR("HUAddPersonRole_Title"), 1);
    v7 = objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_Subtitle"), CFSTR("HUAddPersonRole_Subtitle"), 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
    v6 = (void *)v8;
  }
  v26.receiver = self;
  v26.super_class = (Class)HUAddPersonRoleViewController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v26, sel_initWithTitle_detailText_symbolName_, v5, v6, 0);
  v10 = v9;
  if (v9)
  {
    -[HUAddPersonRoleViewController setHome:](v9, "setHome:", v4);
    v11 = objc_alloc(MEMORY[0x1E0CEAA58]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBTableWelcomeController setTableView:](v10, "setTableView:", v12);

    -[OBTableWelcomeController tableView](v10, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataSource:", v10);

    -[OBTableWelcomeController tableView](v10, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v10);

    -[OBTableWelcomeController tableView](v10, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](v10, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[OBTableWelcomeController tableView](v10, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUAddPersonRoleCell"));

    -[OBTableWelcomeController tableView](v10, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddPersonRoleViewController view](v10, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

  }
  return v10;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddPersonRoleViewController.m"), 73, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddPersonRoleViewController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddPersonRoleViewController.m"), 78, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddPersonRoleViewController initWithTitle:detailText:icon:adoptTableViewScrollView:]",
    v9);

  return 0;
}

- (HUAddPersonRoleViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddPersonRoleViewController.m"), 83, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddPersonRoleViewController initWithTitle:detailText:symbolName:adoptTableViewScrollView:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAddPersonRoleViewController;
  -[OBTableWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[HUAddPersonRoleViewController shouldShowPinCodeRoleOption](self, "shouldShowPinCodeRoleOption", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
    return 1;
  if (-[HUAddPersonRoleViewController shouldShowRestrictedGuestRoleOption](self, "shouldShowRestrictedGuestRoleOption", a3, v4, v5))
  {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("HUAddPersonRoleCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA718], "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "row"))
    {
      if (objc_msgSend(v6, "row") != 1)
        goto LABEL_14;
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_RestrictedGuest_Title"), CFSTR("HUAddPersonRole_RestrictedGuest_Title"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v17);

      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_RestrictedGuest_Subtitle"), CFSTR("HUAddPersonRole_RestrictedGuest_Subtitle"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondaryText:", v18);

      v19 = (void *)MEMORY[0x1E0CEA638];
      v20 = CFSTR("person");
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonResidentTitle"), CFSTR("HUAddPersonResidentTitle"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v21);

      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonResidentSubitle"), CFSTR("HUAddPersonResidentSubitle"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondaryText:", v22);

      if (!-[HUAddPersonRoleViewController shouldShowRestrictedGuestRoleOption](self, "shouldShowRestrictedGuestRoleOption"))goto LABEL_14;
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_Resident_Subtitle"), CFSTR("HUAddPersonRole_Resident_Subtitle"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondaryText:", v23);

      v19 = (void *)MEMORY[0x1E0CEA638];
      v20 = CFSTR("house.fill");
    }
    objc_msgSend(v19, "_systemImageNamed:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v15);
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonPinGuestTitle"), CFSTR("HUAddPersonPinGuestTitle"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonPinGuestSubitle"), CFSTR("HUAddPersonPinGuestSubitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecondaryText:", v10);

    if (-[HUAddPersonRoleViewController shouldShowRestrictedGuestRoleOption](self, "shouldShowRestrictedGuestRoleOption"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_PinCode_Title"), CFSTR("HUAddPersonRole_PinCode_Title"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v11);

      objc_msgSend(v8, "setSecondaryText:", 0);
      objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("number"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v12);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v13);

    }
    if (-[HUAddPersonRoleViewController _disableAddPinCode](self, "_disableAddPinCode"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setColor:", v15);

LABEL_13:
    }
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTextProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setColor:", v24);

  objc_msgSend(v8, "setAxesPreservingSuperviewLayoutMargins:", 3);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x1E0CEA370], "listGroupedCellConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v27);

  objc_msgSend(v7, "setBackgroundConfiguration:", v26);
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4 == 1)
  {
    if (-[HUAddPersonRoleViewController _disableAddPinCode](self, "_disableAddPinCode", a3, v4, v5))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonPinGuestSectionHeaderDisabled"), CFSTR("HUAddPersonPinGuestSectionHeaderDisabled"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;

  if (a4 == 1 && -[HUAddPersonRoleViewController _disableAddPinCode](self, "_disableAddPinCode", a3))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonPinGuestFooterDisabled"), CFSTR("HUAddPersonPinGuestFooterDisabled"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HUAddPersonRoleViewController shouldShowRestrictedGuestRoleOption](self, "shouldShowRestrictedGuestRoleOption"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonRole_PinCode_Disabled_Footer"), CFSTR("HUAddPersonRole_PinCode_Disabled_Footer"), 1);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = v5;
  if (v6 == 1)
  {
    if (-[HUAddPersonRoleViewController _disableAddPinCode](self, "_disableAddPinCode"))
      v7 = 0;
    else
      v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  HUAddGuestViewController *v6;
  void *v7;
  void *v8;
  HUAddGuestViewController *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!objc_msgSend(v5, "section"))
  {
    if (!objc_msgSend(v5, "row"))
    {
      -[HUAddPersonRoleViewController navigationController](self, "navigationController");
      v9 = (HUAddGuestViewController *)objc_claimAutoreleasedReturnValue();
      -[HUAddPersonRoleViewController home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:](HUAddPeopleViewController, "presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:", v9, v10, 0, 0, self);
      v12 = CFSTR("HUAddPersonRoleSectionUser - HUUserSectionRowResident");
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "row") == 1)
    {
      -[HUAddPersonRoleViewController navigationController](self, "navigationController");
      v9 = (HUAddGuestViewController *)objc_claimAutoreleasedReturnValue();
      -[HUAddPersonRoleViewController home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:](HUAddPeopleViewController, "presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:", v9, v10, 1, self, self);
      v12 = CFSTR("HUAddPersonRoleSectionUser - HUUserSectionRowRestrictedGuest");
      goto LABEL_9;
    }
LABEL_7:
    v12 = &stru_1E6F60E80;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "section") != 1)
    goto LABEL_7;
  v6 = [HUAddGuestViewController alloc];
  -[HUAddPersonRoleViewController pinCodeManager](self, "pinCodeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddPersonRoleViewController home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUAddGuestViewController initWithPinCodeManager:home:](v6, "initWithPinCodeManager:home:", v7, v8);

  -[HUAddGuestViewController setPresentationDelegate:](v9, "setPresentationDelegate:", self);
  -[HUAddPersonRoleViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);
  v12 = CFSTR("HUAddPersonRoleSectionPinCode");
LABEL_9:

LABEL_10:
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[HUAddPersonRoleViewController tableView:didSelectRowAtIndexPath:]";
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%s) User selected %@", (uint8_t *)&v14, 0x16u);
  }

}

- (void)cancelButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HUAddPersonRoleViewController cancelButtonPressed:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button %@", (uint8_t *)&v6, 0x16u);
  }

  -[HUAddPersonRoleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)shouldShowRestrictedGuestRoleOption
{
  void *v2;
  char v3;

  -[HUAddPersonRoleViewController home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_canAddRestrictedGuest");

  return v3;
}

- (BOOL)shouldShowPinCodeRoleOption
{
  void *v2;
  char v3;

  -[HUAddPersonRoleViewController home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_canAddAccessCode");

  return v3;
}

- (BOOL)_disableAddPinCode
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;

  -[HUAddPersonRoleViewController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_accessoriesSupportingAccessCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_196);

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[HUAddPersonRoleViewController home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hf_hasEnabledResident") ^ 1;

  }
  return v6;
}

uint64_t __51__HUAddPersonRoleViewController__disableAddPinCode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDirectlyReachable");
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2578B8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "requiresPresentingViewControllerDismissal");

  if (v9)
  {
    -[HUAddPersonRoleViewController presentationDelegate](self, "presentationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishPresentation:animated:", self, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)didSelectPeopleForInvite:(id)a3 inviteeAddresses:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HUAddRestrictedGuestViewController *v9;
  void *v10;
  HUAddRestrictedGuestViewController *v11;
  void *v12;
  id v13;
  int v14;
  HUAddPersonRoleViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User did select people to invite. Continuing with restricted guest flow.", (uint8_t *)&v14, 0x16u);

  }
  v9 = [HUAddRestrictedGuestViewController alloc];
  -[HUAddPersonRoleViewController home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUAddRestrictedGuestViewController initWithHome:inviteeAddresses:](v9, "initWithHome:inviteeAddresses:", v10, v6);

  -[HUAddRestrictedGuestViewController setPresentationDelegate:](v11, "setPresentationDelegate:", self);
  -[HUAddPersonRoleViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
