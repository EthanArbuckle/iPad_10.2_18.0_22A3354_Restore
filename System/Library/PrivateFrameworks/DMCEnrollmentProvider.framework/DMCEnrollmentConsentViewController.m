@implementation DMCEnrollmentConsentViewController

- (DMCEnrollmentConsentViewController)initWithDelegate:(id)a3 username:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DMCEnrollmentConsentViewController *v12;
  uint64_t v13;
  NSString *username;
  uint64_t v15;
  NSNumber *requiredAppID;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *orgName;
  void *v22;
  uint64_t v23;
  NSString *serverURL;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void **v29;
  void *v30;
  objc_super v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)DMCEnrollmentConsentViewController;
  v12 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v32, sel_initWithIconNames_title_subTitle_, &unk_24D5486C0, v11, 0);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    username = v12->_username;
    v12->_username = (NSString *)v13;

    objc_storeStrong((id *)&v12->_profile, a5);
    objc_storeWeak((id *)&v12->_delegate, v8);
    objc_msgSend(v10, "hasRequiredAppIDForMDM");
    v15 = objc_claimAutoreleasedReturnValue();
    requiredAppID = v12->_requiredAppID;
    v12->_requiredAppID = (NSNumber *)v15;

    if (v10)
    {
      objc_msgSend(v10, "payloadsWithClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "organization");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      orgName = v12->_orgName;
      v12->_orgName = (NSString *)v20;

      objc_msgSend(v18, "serverURLString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentConsentViewController _serverURLWithoutHTTP:](v12, "_serverURLWithoutHTTP:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      serverURL = v12->_serverURL;
      v12->_serverURL = (NSString *)v23;

      -[DMCEnrollmentConsentViewController _commonCellDataForRegularBYODDisclosure](v12, "_commonCellDataForRegularBYODDisclosure");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v12, "addCellData:animated:", v25, 0);
      objc_msgSend(v18, "enrollmentMode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE60F08]);

      if (v27)
      {
        -[DMCEnrollmentConsentViewController _platterCellDataForRegularADDEDisclosure](v12, "_platterCellDataForRegularADDEDisclosure");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v28;
        v29 = (void **)v34;
      }
      else
      {
        -[DMCEnrollmentConsentViewController _platterCellDataForRegularADUEDisclosure](v12, "_platterCellDataForRegularADUEDisclosure");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v28;
        v29 = &v33;
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v12, "addSectionWithCellData:animated:", v30, 0);

    }
    else
    {
      -[DMCEnrollmentConsentViewController _cellDataForESSOBYODDisclosure](v12, "_cellDataForESSOBYODDisclosure");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTemplateTableViewController addCellData:animated:](v12, "addCellData:animated:", v18, 0);
    }

  }
  return v12;
}

- (void)loadView
{
  DMCEnrollmentConfirmationView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  DMCEnrollmentConfirmationView *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentConsentViewController;
  -[DMCEnrollmentConsentViewController loadView](&v13, sel_loadView);
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__DMCEnrollmentConsentViewController_loadView__block_invoke;
  v10[3] = &unk_24D52E7F8;
  objc_copyWeak(&v11, &location);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __46__DMCEnrollmentConsentViewController_loadView__block_invoke_2;
  v8[3] = &unk_24D52E7F8;
  objc_copyWeak(&v9, &location);
  v7 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v3, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v4, v5, v10, v8);

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v7);
  -[DMCEnrollmentConsentViewController setConfirmationView:](self, "setConfirmationView:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__DMCEnrollmentConsentViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "consentViewController:didReceiveUserAction:", v3, 1);

    WeakRetained = v3;
  }

}

void __46__DMCEnrollmentConsentViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "consentViewController:didReceiveUserAction:", v3, 0);

    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCEnrollmentConsentViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[DMCEnrollmentConsentViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

  -[DMCEnrollmentConsentViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (BOOL)isEqual:(id)a3
{
  DMCEnrollmentConsentViewController *v4;
  DMCEnrollmentConsentViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (DMCEnrollmentConsentViewController *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMCEnrollmentConsentViewController username](self, "username");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentConsentViewController username](v5, "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[DMCEnrollmentConsentViewController orgName](self, "orgName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentConsentViewController orgName](v5, "orgName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)updateContinueButtonStatus
{
  _BOOL8 v3;
  id v4;

  v3 = -[DMCEnrollmentTemplateTableViewController inProgress](self, "inProgress");
  -[DMCEnrollmentConsentViewController confirmationView](self, "confirmationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInProgress:", v3);

}

- (id)_commonCellDataForRegularBYODDisclosure
{
  void *v3;
  DMCEnrollmentTableViewTextCell *v4;
  void *v5;
  DMCEnrollmentTableViewTextCell *v6;
  DMCEnrollmentTableViewTextCell *v7;
  void *v8;
  void *v9;
  DMCEnrollmentTableViewTextCell *v10;

  v3 = (void *)objc_opt_new();
  v4 = [DMCEnrollmentTableViewTextCell alloc];
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v4, "initWithText:bold:", v5, 0);
  objc_msgSend(v3, "addObject:", v6);

  v7 = [DMCEnrollmentTableViewTextCell alloc];
  -[DMCEnrollmentConsentViewController orgName](self, "orgName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentConsentViewController serverURL](self, "serverURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DMCEnrollmentTableViewTextCell initWithText:bold:subText:layoutStyle:](v7, "initWithText:bold:subText:layoutStyle:", v8, 1, v9, 0);
  objc_msgSend(v3, "addObject:", v10);

  return v3;
}

- (id)_platterCellDataForRegularADUEDisclosure
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("person.line.dotted.person.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentConsentViewController _platterCellDataWithImage:text:](self, "_platterCellDataWithImage:text:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_platterCellDataForRegularADDEDisclosure
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
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithPaletteColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "imageWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DMCLocalizedStringByDevice();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentConsentViewController _platterCellDataWithImage:text:](self, "_platterCellDataWithImage:text:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_platterCellDataWithImage:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  DMCEnrollmentTableViewIconCell *v8;
  void *v9;
  DMCEnrollmentTableViewIconCell *v10;
  DMCEnrollmentTableViewTextCell *v11;
  DMCEnrollmentTableViewTextCell *v12;
  void *v13;
  void *v14;
  void *v15;
  DMCEnrollmentTableViewPlatterCell *v16;
  void *v17;
  void *v18;
  DMCEnrollmentTableViewPlatterCell *v19;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [DMCEnrollmentTableViewIconCell alloc];
  v23[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DMCEnrollmentTableViewIconCell initWithIconImages:layoutStyle:](v8, "initWithIconImages:layoutStyle:", v9, 1);

  v11 = -[DMCEnrollmentTableViewTextCell initWithText:bold:subText:layoutStyle:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:subText:layoutStyle:", v7, 0, 0, 1);
  v12 = -[DMCEnrollmentTableViewTextCell initWithText:bold:subText:layoutStyle:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:subText:layoutStyle:", &stru_24D52F990, 0, 0, 1);
  -[DMCEnrollmentConsentViewController _setupManagementDetailsLinkTextForCell:](self, "_setupManagementDetailsLinkTextForCell:", v12);
  v22[0] = v10;
  v22[1] = v11;
  v22[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[DMCEnrollmentConsentViewController _requiredAppCellData](self, "_requiredAppCellData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "insertObject:atIndex:", v15, 1);
  v16 = [DMCEnrollmentTableViewPlatterCell alloc];
  v21 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[DMCEnrollmentTableViewPlatterCell initWithCellData:parentTableView:useShadow:](v16, "initWithCellData:parentTableView:useShadow:", v17, v18, 1);

  return v19;
}

- (void)_setupManagementDetailsLinkTextForCell:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke;
  v6[3] = &unk_24D52E7F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "configureLinkText:forceLineBreak:linkAction:", v5, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke_2;
    block[3] = &unk_24D52E500;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __77__DMCEnrollmentConsentViewController__setupManagementDetailsLinkTextForCell___block_invoke_2(uint64_t a1)
{
  DMCProfileViewModel *v2;
  void *v3;
  DMCProfileDetailsViewController *v4;
  void *v5;
  void *v6;
  DMCProfileViewModel *v7;

  v2 = [DMCProfileViewModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCProfileViewModel initWithProfile:managedPayloads:](v2, "initWithProfile:managedPayloads:", v3, 0);

  v4 = -[DMCProfileDetailsViewController initWithProfileViewModel:mode:]([DMCProfileDetailsViewController alloc], "initWithProfileViewModel:mode:", v7, 1);
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileDetailsViewController setTableTitle:](v4, "setTableTitle:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v4);
  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
    objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)_requiredAppCellData
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id *v7;
  void *v8;
  NSNumber *requiredAppID;
  void *v10;
  id v11;
  void *v12;
  DMCEnrollmentTableViewTextCell *v13;
  void *v14;
  DMCEnrollmentTableViewTextCell *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint64_t p_location;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (self->_requiredAppID)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v3 = (void *)getSKStoreProductViewControllerClass_softClass;
    v30 = getSKStoreProductViewControllerClass_softClass;
    v4 = MEMORY[0x24BDAC760];
    if (!getSKStoreProductViewControllerClass_softClass)
    {
      location = (id)MEMORY[0x24BDAC760];
      p_location = 3221225472;
      v24 = (uint64_t)__getSKStoreProductViewControllerClass_block_invoke;
      v25 = &unk_24D52E928;
      v26 = &v27;
      __getSKStoreProductViewControllerClass_block_invoke((uint64_t)&location);
      v3 = (void *)v28[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v27, 8);
    v6 = objc_alloc_init(v5);
    location = 0;
    p_location = (uint64_t)&location;
    v24 = 0x2020000000;
    v7 = (id *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    v25 = (void *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
    {
      v8 = (void *)StoreKitLibrary();
      v7 = (id *)dlsym(v8, "SKStoreProductParameterITunesItemIdentifier");
      *(_QWORD *)(p_location + 24) = v7;
      getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&location, 8);
    if (!v7)
      -[DMCEnrollmentConsentViewController _requiredAppCellData].cold.1();
    requiredAppID = self->_requiredAppID;
    v31 = *v7;
    v32[0] = requiredAppID;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = v31;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadProductWithParameters:completionBlock:", v12, &__block_literal_global_0);

    objc_msgSend(v6, "setShowsStoreButton:", 0);
    objc_msgSend(v6, "setShowsRightBarButton:", 0);
    v13 = [DMCEnrollmentTableViewTextCell alloc];
    DMCLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DMCEnrollmentTableViewTextCell initWithText:bold:subText:layoutStyle:](v13, "initWithText:bold:subText:layoutStyle:", v14, 0, 0, 1);

    objc_initWeak(&location, self);
    DMCLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_47;
    v19[3] = &unk_24D52E900;
    objc_copyWeak(&v21, &location);
    v17 = v6;
    v20 = v17;
    -[DMCEnrollmentTableViewTextCell configureLinkText:forceLineBreak:linkAction:](v15, "configureLinkText:forceLineBreak:linkAction:", v16, 0, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_ERROR, "Could not load product info for store!! : %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_47(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_2;
  v2[3] = &unk_24D52E900;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __58__DMCEnrollmentConsentViewController__requiredAppCellData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
    WeakRetained = v3;
  }

}

- (id)_cellDataForESSOBYODDisclosure
{
  void *v3;
  DMCEnrollmentTableViewTextCell *v4;
  void *v5;
  DMCEnrollmentTableViewTextCell *v6;
  DMCEnrollmentTableViewTextCell *v7;
  void *v8;
  DMCEnrollmentTableViewTextCell *v9;
  DMCEnrollmentTableViewTextCell *v10;
  void *v11;
  DMCEnrollmentTableViewTextCell *v12;
  DMCEnrollmentTableViewTextCell *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v3 = (void *)objc_opt_new();
  v4 = [DMCEnrollmentTableViewTextCell alloc];
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v4, "initWithText:bold:", v5, 0);
  objc_msgSend(v3, "addObject:", v6);

  v7 = [DMCEnrollmentTableViewTextCell alloc];
  DMCLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v7, "initWithText:bold:", v8, 0);
  objc_msgSend(v3, "addObject:", v9);

  v10 = [DMCEnrollmentTableViewTextCell alloc];
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v10, "initWithText:bold:", v11, 0);
  objc_msgSend(v3, "addObject:", v12);

  v13 = -[DMCEnrollmentTableViewTextCell initWithText:bold:]([DMCEnrollmentTableViewTextCell alloc], "initWithText:bold:", &stru_24D52F990, 0);
  objc_initWeak(&location, self);
  DMCLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __68__DMCEnrollmentConsentViewController__cellDataForESSOBYODDisclosure__block_invoke;
  v19 = &unk_24D52E7F8;
  objc_copyWeak(&v20, &location);
  -[DMCEnrollmentTableViewTextCell configureLinkText:forceLineBreak:linkAction:](v13, "configureLinkText:forceLineBreak:linkAction:", v14, 0, &v16);

  objc_msgSend(v3, "addObject:", v13, v16, v17, v18, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

void __68__DMCEnrollmentConsentViewController__cellDataForESSOBYODDisclosure__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__DMCEnrollmentConsentViewController__cellDataForESSOBYODDisclosure__block_invoke_2;
    block[3] = &unk_24D52E500;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __68__DMCEnrollmentConsentViewController__cellDataForESSOBYODDisclosure__block_invoke_2(uint64_t a1)
{
  return +[DMCEnrollmentAboutRemoteManagementViewController presentAboutRemoteManagementViewControllerWithBaseViewController:](DMCEnrollmentAboutRemoteManagementViewController, "presentAboutRemoteManagementViewControllerWithBaseViewController:", *(_QWORD *)(a1 + 32));
}

- (id)_serverURLWithoutHTTP:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "dmc_substringWithPattern:", CFSTR(".*:\\/\\/(.*)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)orgName
{
  return self->_orgName;
}

- (void)setOrgName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (NSString)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (NSNumber)requiredAppID
{
  return self->_requiredAppID;
}

- (void)setRequiredAppID:(id)a3
{
  objc_storeStrong((id *)&self->_requiredAppID, a3);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (DMCEnrollmentConsentViewControllerDelegate)delegate
{
  return (DMCEnrollmentConsentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMCEnrollmentTableViewPlatterCell)infoCell
{
  return self->_infoCell;
}

- (void)setInfoCell:(id)a3
{
  objc_storeStrong((id *)&self->_infoCell, a3);
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_infoCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_requiredAppID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)_requiredAppCellData
{
  dlerror();
  abort_report_np();
  __getSKStoreProductViewControllerClass_block_invoke_cold_1();
}

@end
