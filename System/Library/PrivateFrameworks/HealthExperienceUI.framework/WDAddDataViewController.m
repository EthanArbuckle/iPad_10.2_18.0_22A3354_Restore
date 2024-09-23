@implementation WDAddDataViewController

- (WDAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WDAddDataViewController *v17;
  WDAddDataViewController *v18;
  HKManualEntryValidationController *v19;
  HKManualEntryValidationController *validationController;
  void *v21;
  void *v22;
  id v24;
  objc_super v25;

  v13 = a3;
  v24 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WDAddDataViewController;
  v17 = -[HKTableViewController initWithUsingInsetStyling:](&v25, sel_initWithUsingInsetStyling_, 1);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayType, a3);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    objc_storeStrong((id *)&v18->_unitController, a5);
    objc_storeStrong((id *)&v18->_initialStartDate, a6);
    objc_storeStrong((id *)&v18->_dateCache, a7);
    v19 = (HKManualEntryValidationController *)objc_alloc_init(MEMORY[0x1E0D2F790]);
    validationController = v18->_validationController;
    v18->_validationController = v19;

    objc_msgSend(v13, "localization");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataViewController setTitle:](v18, "setTitle:", v22);

  }
  return v18;
}

- (WDAddDataViewController)initWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (WDAddDataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;
  void *v55;
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)WDAddDataViewController;
  -[HKTableViewController viewDidLoad](&v46, sel_viewDidLoad);
  -[WDAddDataViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", 44.0);

  v56[0] = CFSTR("UIA.Health.AddData");
  v56[1] = CFSTR("View");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x1E0DC1140];
  v7 = v54;
  v55 = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  HABundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, sel_cancelButtonTapped_);

  objc_msgSend(v42, "setTitleTextAttributes:forState:", v40, 0);
  v53[0] = CFSTR("UIA.Health.AddData");
  v53[1] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAccessibilityIdentifier:", v12);

  -[WDAddDataViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v42);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v39, 17.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
  HABundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ADD"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, self, sel_addButtonTapped_);

  v51[0] = *MEMORY[0x1E0DC1138];
  v21 = v51[0];
  v51[1] = v7;
  v52[0] = v16;
  v52[1] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitleTextAttributes:forState:", v38, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v21;
  v49[1] = v7;
  v50[0] = v16;
  v50[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitleTextAttributes:forState:", v22, 2);
  v48[0] = CFSTR("UIA.Health.AddData");
  v48[1] = CFSTR("Add");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", v24);

  -[WDAddDataViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setRightBarButtonItem:", v20);

  v26 = (void *)MEMORY[0x1E0DC3930];
  HABundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v28, 0, sel_cancelButtonTapped_, *MEMORY[0x1E0DC4DA0], 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0DC3930];
  HABundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ADD"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v32, 0, sel_addButtonTapped_, CFSTR("\r"), 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAddDataViewController addKeyCommand:](self, "addKeyCommand:", v29);
  -[WDAddDataViewController addKeyCommand:](self, "addKeyCommand:", v33);
  -[WDAddDataViewController reloadContent](self, "reloadContent");
  objc_initWeak(&location, self);
  objc_opt_self();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __38__WDAddDataViewController_viewDidLoad__block_invoke;
  v43[3] = &unk_1E55756A8;
  objc_copyWeak(&v44, &location);
  v36 = (id)-[WDAddDataViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v35, v43);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

void __38__WDAddDataViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePreferredContentSize");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endUpdates");

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "updatePreferredContentSize");

}

- (void)reloadContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  WDAddDataManualEntrySectionData *v7;
  WDAddDataManualEntryTableData *v8;
  WDAddDataManualEntryTableData *model;
  void *v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[WDAddDataViewController numberOfSections](self, "numberOfSections");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[WDAddDataViewController manualEntryItemsForSection:](self, "manualEntryItemsForSection:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WDAddDataManualEntrySectionData initWithItems:]([WDAddDataManualEntrySectionData alloc], "initWithItems:", v6);
      objc_msgSend(v11, "addObject:", v7);

    }
  }
  v8 = -[WDAddDataManualEntryTableData initWithSections:]([WDAddDataManualEntryTableData alloc], "initWithSections:", v11);
  model = self->_model;
  self->_model = v8;

  -[WDAddDataViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

  -[WDAddDataViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDAddDataViewController;
  -[WDAddDataViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  -[WDAddDataViewController defaultEditingItem](self, "defaultEditingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEditing");

  -[WDAddDataViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDAddDataViewController;
  -[WDAddDataViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDAddDataViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)updatePreferredContentSize
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSString *lhs;

  -[WDAddDataViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = dbl_1A9A9F060[UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) == NSOrderedAscending];
  -[WDAddDataViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[WDAddDataViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  -[WDAddDataViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v8);
  -[WDAddDataViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredContentSize:", v4, v8);

}

- (void)setSavingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[WDAddDataViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)savingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[WDAddDataViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (void)cancelButtonTapped:(id)a3
{
  -[WDAddDataViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)addButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[WDAddDataViewController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__WDAddDataViewController_addButtonTapped___block_invoke;
  v6[3] = &unk_1E55756D0;
  v6[4] = self;
  -[WDAddDataViewController validateDataWithCompletion:](self, "validateDataWithCompletion:", v6);
}

void __43__WDAddDataViewController_addButtonTapped___block_invoke(uint64_t a1, int a2, void *a3, int a4)
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  if (a2)
  {
    objc_msgSend(v8, "_dataValidated");
  }
  else if (a4)
  {
    objc_msgSend(v8, "_showValidationConfirmAlertWithErrorString:", v7);
  }
  else
  {
    objc_msgSend(v8, "_showValidationErrorAlertWithErrorString:", v7);
  }

}

- (void)_showValidationErrorAlertWithErrorString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  HABundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ERROR_TITLE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  HABundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_OK"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__WDAddDataViewController__showValidationErrorAlertWithErrorString___block_invoke;
  v13[3] = &unk_1E55756F8;
  v13[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  -[WDAddDataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

void __68__WDAddDataViewController__showValidationErrorAlertWithErrorString___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)_showValidationConfirmAlertWithErrorString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  HABundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_CONFIRM_TITLE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  HABundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_CONFIRM"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke;
  v19[3] = &unk_1E55756F8;
  v19[4] = self;
  objc_msgSend(v9, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v11, 0, 0, v19, &__block_literal_global_2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  HABundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_CANCEL"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_3;
  v18[3] = &unk_1E55756F8;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13);
  objc_msgSend(v8, "addAction:", v17);
  -[WDAddDataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

void __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dataValidated");
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

uint64_t __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_2()
{
  return 0;
}

void __70__WDAddDataViewController__showValidationConfirmAlertWithErrorString___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)_dataValidated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__WDAddDataViewController__dataValidated__block_invoke;
  v2[3] = &unk_1E5575760;
  v2[4] = self;
  -[WDAddDataViewController saveHKObjectWithCompletion:](self, "saveHKObjectWithCompletion:", v2);
}

void __41__WDAddDataViewController__dataValidated__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __41__WDAddDataViewController__dataValidated__block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__WDAddDataViewController__dataValidated__block_invoke_244;
  block[3] = &unk_1E5575398;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __41__WDAddDataViewController__dataValidated__block_invoke_244(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)validateMaximumAllowedDurationFor:(id)a3 endDate:(id)a4 competion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *, uint64_t);
  double v10;
  double v11;
  HKManualEntryValidationController *validationController;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *, uint64_t))a5;
  objc_msgSend(v8, "timeIntervalSinceDate:", v36);
  v11 = v10;
  validationController = self->_validationController;
  -[HKDisplayType sampleType](self->_displayType, "sampleType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKManualEntryValidationController validateMaximumAllowedDuration:ofType:](validationController, "validateMaximumAllowedDuration:ofType:", v13, v11);

  if (v14)
  {
    if (v14 == 1)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      CPDateFormatStringForFormatType();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDateFormat:", v28);

      objc_msgSend(v19, "stringFromDate:", v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3940];
      HABundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", v32, v21, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v9[2](v9, 0, v33, 1);
LABEL_13:

      goto LABEL_14;
    }
    if (v14 == 2)
    {
      -[HKDisplayType sampleType](self->_displayType, "sampleType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "maximumAllowedDuration");
      v17 = v16;

      v18 = (int)(v17 / 86400.0);
      v19 = objc_alloc_init(MEMORY[0x1E0CB3570]);
      objc_msgSend(v19, "setAllowedUnits:", 16);
      if (v18 > 10)
        v20 = 3;
      else
        v20 = 4;
      objc_msgSend(v19, "setUnitsStyle:", v20);
      objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithDays:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType wd_outOfRangeAlertDisplayName](self->_displayType, "wd_outOfRangeAlertDisplayName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      HABundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v22)
      {
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_SAMPLE_DURATION_ERROR_%@_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringFromDateComponents:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v26, v27, v22);
      }
      else
      {
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_DEFAULT_DURATION_ERROR_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringFromDateComponents:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v26, v27, v35);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v9[2](v9, 0, v34, 0);
      goto LABEL_13;
    }
  }
  else
  {
    v9[2](v9, 1, 0, 0);
  }
LABEL_14:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[WDAddDataManualEntryTableData numberOfSections](self->_model, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[WDAddDataManualEntryTableData numberOfRowsInSection:](self->_model, "numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[WDAddDataManualEntryTableData cellForRowAtIndexPath:](self->_model, "cellForRowAtIndexPath:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  WDAddDataViewController *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryTableData itemForCell:](self->_model, "itemForCell:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemTapped:", v8);
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__WDAddDataViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E5575788;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "animateWithDuration:animations:", v13, 0.2);

}

uint64_t __61__WDAddDataViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "indexPathsForVisibleRows", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(a1[4], "cellForRowAtIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EEB4FDC8))
        {
          v9 = v8;
          if (objc_msgSend(a1[5], "isEqual:", v7))
            v10 = objc_msgSend(v9, "expanded") ^ 1;
          else
            v10 = 0;
          objc_msgSend(v9, "setExpanded:", v10);
          if ((objc_msgSend(v9, "expanded") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v9, "endEditing");
          }

        }
        else if ((objc_msgSend(a1[5], "isEqual:", v7) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v8, "endEditing");
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[4], "beginUpdates");
  objc_msgSend(a1[4], "endUpdates");
  objc_msgSend(a1[6], "updatePreferredContentSize");
  return objc_msgSend(a1[4], "scrollToRowAtIndexPath:atScrollPosition:animated:", a1[5], 0, 1);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  -[WDAddDataManualEntryTableData cellForRowAtIndexPath:](self->_model, "cellForRowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEB4FDC8))
  {
    v5 = v4;
    if (objc_msgSend(v5, "expanded"))
    {
      objc_msgSend(v5, "expandedHeight");
      v7 = v6;
    }
    else
    {
      objc_msgSend(v5, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;

      objc_msgSend(v5, "sizeThatFits:", v10, 10000.0);
      v7 = v11;
    }

  }
  else
  {
    v7 = *MEMORY[0x1E0DC53D8];
  }

  return v7;
}

- (void)saveHKObjectWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDAddDataViewController generateHKObjects](self, "generateHKObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore saveObjects:withCompletion:](self->_healthStore, "saveObjects:withCompletion:", v5, v4);

}

- (void)validateDataWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD, uint64_t))a3 + 2))(a3, 1, 0, 1);
}

- (id)defaultMetadata
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB5608];
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)defaultEditingItem
{
  return 0;
}

- (NSDate)initialStartDate
{
  return self->_initialStartDate;
}

- (void)setInitialStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStartDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_validationController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

- (id)generateHKObjects
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

void __41__WDAddDataViewController__dataValidated__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_1A95F5000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error saving HKObjects: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
