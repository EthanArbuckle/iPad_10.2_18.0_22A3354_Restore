@implementation HUPinCodeDetailsViewController

- (HUPinCodeDetailsViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HUPinCodeDetailsItemManager *v12;
  HUPinCodeDetailsViewController *v13;
  HUPinCodeDetailsViewController *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HUPinCodeDetailsItemManager *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSMutableSet *inFlightAllowedAccessoryRemovals;
  uint64_t v38;
  NSMutableSet *inFlightAllowedAccessoryAdditions;
  id v41;
  _QWORD v42[4];
  HUPinCodeDetailsViewController *v43;
  objc_super v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        NSLog(CFSTR("Supplied item is not HFPinCodeItem or HFUserItem %@"), v8);
    }
  }
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = -[HUPinCodeDetailsItemManager initWithDelegate:sourceItem:pinCodeManager:home:]([HUPinCodeDetailsItemManager alloc], "initWithDelegate:sourceItem:pinCodeManager:home:", self, v11, v9, v10);
  v44.receiver = self;
  v44.super_class = (Class)HUPinCodeDetailsViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v44, sel_initWithItemManager_tableViewStyle_, v12, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a4);
    objc_storeWeak((id *)&v14->_pinCodeItemManager, v12);
    v14->_isClosing = 0;
    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v14, "setAutomaticallyUpdatesViewControllerTitle:", 0);
    objc_opt_class();
    v15 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v8)
    {
      objc_msgSend(v17, "accessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");
      -[HUPinCodeDetailsViewController setPinAccessories:](v14, "setPinAccessories:", v19);

      -[HUPinCodeDetailsViewController pinAccessories](v14, "pinAccessories");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      -[HUPinCodeDetailsViewController setAccessoriesToEdit:](v14, "setAccessoriesToEdit:", v21);

      -[HUPinCodeDetailsViewController pinCodeItemManager](v14, "pinCodeItemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sourceItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "latestResults");
      v41 = v8;
      v24 = v12;
      v25 = v11;
      v26 = v10;
      v27 = v9;
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPinCodeDetailsViewController setTitle:](v14, "setTitle:", v30);

      v17 = v28;
      v9 = v27;
      v10 = v26;
      v11 = v25;
      v12 = v24;
      v8 = v41;

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAddGuestPinCodeTitle"), CFSTR("HUAddGuestPinCodeTitle"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPinCodeDetailsViewController setTitle:](v14, "setTitle:", v31);

      -[HUPinCodeDetailsViewController setCreatingNewPinCode:](v14, "setCreatingNewPinCode:", 1);
      -[HUPinCodeDetailsViewController setPinAccessories:](v14, "setPinAccessories:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(v10, "hf_accessoriesSupportingAccessCodes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "mutableCopy");
      -[HUPinCodeDetailsViewController setAccessoriesToEdit:](v14, "setAccessoriesToEdit:", v33);

      objc_msgSend(v9, "generateNewCodeValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __67__HUPinCodeDetailsViewController_initWithItem_pinCodeManager_home___block_invoke;
      v42[3] = &unk_1E6F5C608;
      v43 = v14;
      v35 = (id)objc_msgSend(v34, "addSuccessBlock:", v42);

      v22 = v43;
    }

    v36 = objc_opt_new();
    inFlightAllowedAccessoryRemovals = v14->_inFlightAllowedAccessoryRemovals;
    v14->_inFlightAllowedAccessoryRemovals = (NSMutableSet *)v36;

    v38 = objc_opt_new();
    inFlightAllowedAccessoryAdditions = v14->_inFlightAllowedAccessoryAdditions;
    v14->_inFlightAllowedAccessoryAdditions = (NSMutableSet *)v38;

  }
  return v14;
}

void __67__HUPinCodeDetailsViewController_initWithItem_pinCodeManager_home___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEditedPinCodeValue:", a2);
  objc_msgSend(*(id *)(a1 + 32), "pinCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pinCodeValueItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateCellForItems:", v6);

  }
}

- (HUPinCodeDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItem_pinCodeManager_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPinCodeDetailsViewController.m"), 140, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPinCodeDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[HUPinCodeDetailsViewController setIsClosing:](self, "setIsClosing:", 1);
  -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HUPinCodeDetailsViewController;
  -[HUItemTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUPinCodeDetailsViewController;
  -[HUItemTableViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinCodeLabelItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && v7)
    objc_msgSend(v7, "becomeFirstResponder");

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)showSpinner
{
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
  void *v14;
  id v15;
  id v16;

  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[HUPinCodeDetailsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v16);
  if (v4)
  {
    -[HUPinCodeDetailsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAddButtonItem:", v5);
  }
  else
  {
    -[HUPinCodeDetailsViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);
  }

  objc_msgSend(v16, "startAnimating");
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOperationInProgress:", 1);

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteGuestPINCodeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeRestoreAccessItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v8, "updateResultsForItems:senderSelector:", v14, a2);

}

- (void)hideSpinner
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  -[HUPinCodeDetailsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (v4)
  {
    -[HUPinCodeDetailsViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v23 = v8;

    -[HUPinCodeDetailsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAddButtonItem:", 0);
  }
  else
  {
    -[HUPinCodeDetailsViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v23 = v13;

    -[HUPinCodeDetailsViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", 0);
  }

  objc_msgSend(v23, "stopAnimating");
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOperationInProgress:", 0);

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteGuestPINCodeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pinCodeRestoreAccessItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithObjects:", v18, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v15, "updateResultsForItems:senderSelector:", v21, a2);

}

- (id)commitAccessoryChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUPinCodeDetailsViewController showSpinner](self, "showSpinner");
    objc_opt_class();
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    -[HUPinCodeDetailsViewController accessoriesToEdit](self, "accessoriesToEdit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPinCodeDetailsViewController pinAccessories](self, "pinAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "differenceFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "insertions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v11, "insertions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "na_map:", &__block_literal_global_235);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPinCodeWithItem:enabled:onAccessories:", v8, 1, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v17);

    }
    objc_msgSend(v11, "removals");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v11, "removals");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "na_map:", &__block_literal_global_25_0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPinCodeWithItem:enabled:onAccessories:", v8, 0, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v23);

    }
    -[HUPinCodeDetailsViewController accessoriesToEdit](self, "accessoriesToEdit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    objc_initWeak(&location, self);
    v26 = (void *)MEMORY[0x1E0D519C0];
    v27 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_3;
    v34[3] = &unk_1E6F4E9E8;
    objc_copyWeak(&v36, &location);
    v28 = v25;
    v35 = v28;
    objc_msgSend(v26, "futureWithBlock:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    v32[1] = 3221225472;
    v32[2] = __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_4;
    v32[3] = &unk_1E6F4E380;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v30, "addCompletionBlock:", v32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

void __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setPinAccessories:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "finishWithNoResult");

}

void __56__HUPinCodeDetailsViewController_commitAccessoryChanges__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hideSpinner");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v6, *MEMORY[0x1E0D30A60], 0, 0, 0);

  }
}

- (id)commitPinCodeChanges
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18[2];
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (-[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[HUPinCodeDetailsViewController _codeLabelHasChanged](self, "_codeLabelHasChanged");
    v10 = MEMORY[0x1E0C809B0];
    if (v9
      && (-[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "length"),
          v11,
          v12))
    {
      -[HUPinCodeDetailsViewController showSpinner](self, "showSpinner");
      objc_initWeak(&location, self);
      -[HUPinCodeDetailsViewController _validatePinCodeLabel](self, "_validatePinCodeLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke;
      v19[3] = &unk_1E6F5C690;
      objc_copyWeak(&v21, &location);
      v20 = v7;
      objc_msgSend(v13, "flatMap:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_initWeak(&location, self);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_2;
    v16[3] = &unk_1E6F4FFE0;
    objc_copyWeak(v18, &location);
    v17 = v7;
    v18[1] = (id)a2;
    objc_msgSend(v14, "addCompletionBlock:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  return v8;
}

id __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "editedPinCodeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateGuestPinCodeWithItem:withLabel:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "hideSpinner");
  if (a3)
  {
    objc_msgSend(WeakRetained, "setEditedPinCodeValue:", 0);
    objc_msgSend(WeakRetained, "setEditedPinCodeLabel:", 0);
    objc_msgSend(WeakRetained, "pinCodeItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinCodeValueItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateCellForItems:", v8);

  }
  else
  {
    objc_msgSend(WeakRetained, "editedPinCodeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "pinCodeValue");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;

    objc_msgSend(WeakRetained, "pinCodeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinCodeForCodeValue:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_3;
    v15[3] = &unk_1E6F5C1F0;
    v16 = *(id *)(a1 + 32);
    v17 = WeakRetained;
    v18 = *(_QWORD *)(a1 + 48);
    v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v15);

    v7 = v16;
  }

}

void __54__HUPinCodeDetailsViewController_commitPinCodeChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateFromPinCode:", a2);
  objc_msgSend(*(id *)(a1 + 40), "setEditedPinCodeValue:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setEditedPinCodeLabel:", 0);
  objc_msgSend(*(id *)(a1 + 40), "pinCodeItemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

}

- (id)commitNewPinCode
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[HUPinCodeDetailsViewController showSpinner](self, "showSpinner");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    -[HUPinCodeDetailsViewController _resignFirstResponderForAllTextFields](self, "_resignFirstResponderForAllTextFields");
    objc_initWeak(&location, self);
    -[HUPinCodeDetailsViewController _validatePinCodeLabel](self, "_validatePinCodeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke;
    v16[3] = &unk_1E6F55128;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "flatMap:", v16);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v3 = (void *)v7;
  }
  else
  {
    NSLog(CFSTR("commitNewPinCode shouldn't be called for existing PIN Codes"));
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2;
  v13[3] = &unk_1E6F5C6F8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v14 = v10;
  objc_msgSend(v3, "addCompletionBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

id __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pinCodeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "editedPinCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "editedPinCodeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessoriesToEdit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addGuestPinCode:withLabel:onAccessories:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v7, *(_QWORD *)(a1 + 32), 0);

  v10 = (id)objc_msgSend(v9, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D30310]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", &unk_1E70417B8, *MEMORY[0x1E0D301C8]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E0D301C0]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E0D30300]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 26, v11);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "hideSpinner");
    if (v7)
    {
      v12 = dispatch_time(0, 650000000);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_36;
      v13[3] = &unk_1E6F4C638;
      v14 = v9;
      v15 = *(id *)(a1 + 32);
      dispatch_after(v12, MEMORY[0x1E0C80D38], v13);

    }
  }

}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_36(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
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
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  if (objc_msgSend(MEMORY[0x1E0CA58E0], "isCurrentProcessAnApplicationExtension"))
  {
    NSLog(CFSTR("We are currently unable to launch the upgrade flow from an extension.  Please reach out to me if this becomes a need."));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "performSelector:", sel_sharedApplication);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "keyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentedViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v5)
    {
      v7 = (void *)v5;
      v8 = v4;
      while (1)
      {
        objc_msgSend(v8, "presentedViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isBeingDismissed");

        if ((v10 & 1) != 0)
          break;
        objc_msgSend(v8, "presentedViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "presentedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        if (!v7)
          goto LABEL_9;
      }
      v6 = v8;
    }
LABEL_9:
    v11 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareButtonTitle"), CFSTR("HUPinCodeShareButtonTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareAlertMessage"), CFSTR("HUPinCodeShareAlertMessage"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareAlertButton"), CFSTR("HUPinCodeShareAlertButton"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2_51;
    v22[3] = &unk_1E6F526A0;
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v25 = v6;
    v17 = v6;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v18);

    v19 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeShareAlertNotNowButton"), CFSTR("HUPinCodeShareAlertNotNowButton"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, &__block_literal_global_60);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v21);

    objc_msgSend(v17, "presentViewController:animated:completion:", v14, 1, 0);
  }
}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_2_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke_2";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped share button '%@' from the alert popup", (uint8_t *)&v9, 0x16u);

  }
  +[HUPinCodeUtilities createSharingViewControllerForPinCodeItem:inHome:](HUPinCodeUtilities, "createSharingViewControllerForPinCodeItem:inHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "modalPresentationStyle") == 7)
  {
    objc_msgSend(v6, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceView:", v8);

  }
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v6, 1, &__block_literal_global_55_0);

}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_53()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) Completed presenting activity view controller", (uint8_t *)&v1, 0xCu);
  }

}

void __50__HUPinCodeDetailsViewController_commitNewPinCode__block_invoke_59(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[HUPinCodeDetailsViewController commitNewPinCode]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Not now button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);

  }
}

- (void)pinCodeManagerFetchDidComplete:(id)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  id v9;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
}

- (void)itemManagerDidFinishUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUPinCodeDetailsViewController;
  -[HUItemTableViewController itemManagerDidFinishUpdate:](&v9, sel_itemManagerDidFinishUpdate_, a3);
  -[HUPinCodeDetailsViewController title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPinCodeDetailsViewController setTitle:](self, "setTitle:", v8);

  }
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;

  v5 = a3;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOrShowHomeKeyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v7))
  {
LABEL_2:

LABEL_19:
    objc_opt_class();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "restoreHomeKeyAccessItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
    goto LABEL_19;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteGuestPINCodeItem");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v5;
  if ((id)v11 == v5)
  {
LABEL_18:

    goto LABEL_19;
  }
  v13 = (void *)v11;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pinCodeRestoreAccessItem");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((id)v15 == v5)
  {

    v12 = v13;
    goto LABEL_18;
  }
  v16 = (void *)v15;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pinCodeChangeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "isEqual:", v18);

  if ((v19 & 1) != 0)
    goto LABEL_19;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transformedLocksItemProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", v5);

  if (!v23)
  {
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pinCodeLabelItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v5, "isEqual:", v39);

    if (v40)
      goto LABEL_19;
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinCodeValueItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqual:", v7))
    {
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "personalPINCodeItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isEqual:", v42);

    }
    goto LABEL_2;
  }
  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sourceItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sourceItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v31, "user");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = v34;
  }
  else
  {
    objc_msgSend(v27, "user");
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = v35;

  if (!objc_msgSend(v33, "hf_currentUserIsAdministrator")
    || (objc_msgSend(v33, "hf_userIsRestrictedGuest:", v43) & 1) == 0)
  {
    objc_msgSend(v27, "user");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44 | v31)

    else
      objc_msgSend(v27, "isUnknownGuestFromMatter");
  }
  objc_opt_class();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return (Class)v36;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_super v75;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v75.receiver = self;
  v75.super_class = (Class)HUPinCodeDetailsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v75, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteGuestPINCodeItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    v29 = v10;
    objc_msgSend(v29, "setDestructive:", 1);
LABEL_16:
    objc_msgSend(v11, "latestResults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v20, "BOOLValue") ^ 1;
    objc_msgSend(v29, "textLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setEnabled:", v31);
    goto LABEL_28;
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pinCodeRestoreAccessItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v11)
  {
    v29 = v10;
    goto LABEL_16;
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pinCodeLabelItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v11)
  {
    objc_opt_class();
    v33 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v20 = v34;

    objc_msgSend(v11, "latestResults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", v36);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAddPersonPinGuestNamePlaceholder"), CFSTR("HUAddPersonPinGuestNamePlaceholder"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setPlaceholder:", v38);

    objc_msgSend(v20, "textField");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setClearButtonMode:", 3);

    objc_msgSend(v20, "textField");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setKeyboardType:", 1);

    objc_msgSend(v11, "latestResults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setDisabled:", objc_msgSend(v43, "BOOLValue"));
    -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textField");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setText:", v45);

    }
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v18 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v20, "setDelegate:", self);
    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v11);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v11, "latestResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D10]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    if (v25)
    {
      objc_msgSend(v21, "imageProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTintColor:", v25);

    }
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPreferredSymbolConfiguration:", v27);

    objc_msgSend(v20, "setContentConfiguration:", v21);
  }
  else
  {
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pinCodeValueItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v11, "isEqual:", v48);

    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v50, v11);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSecondaryText:", v52);

      }
      objc_msgSend(v10, "setContentConfiguration:", v20);
      objc_msgSend(v10, "layer");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDisableUpdateMask:", 16);
    }
    else
    {
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "personalPINCodeItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v11, "isEqual:", v54);

      if (v55)
      {
        objc_msgSend(MEMORY[0x1E0CEA718], "sidebarCellConfiguration");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v56, v11);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setContentConfiguration:", v20);
        objc_msgSend(v10, "setAccessoryType:", 1);
        goto LABEL_28;
      }
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addOrShowHomeKeyItem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v11, "isEqual:", v58);

      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "latestResults");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v61);

        objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "textProperties");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setColor:", v62);

        objc_msgSend(MEMORY[0x1E0CEA638], "hu_walletAppIconImage");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setImage:", v64);

        objc_msgSend(v10, "setContentConfiguration:", v20);
        goto LABEL_28;
      }
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "transformedLocksItemProvider");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "items");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "containsObject:", v11);

      if (!v68)
        goto LABEL_29;
      +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v11);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v11, "latestResults");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D10]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v71 = v70;
      else
        v71 = 0;
      v21 = v71;

      if (v21)
      {
        objc_msgSend(v20, "imageProperties");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setTintColor:", v21);

      }
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageProperties");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setPreferredSymbolConfiguration:", v73);

      objc_msgSend(v10, "setContentConfiguration:", v20);
    }
  }

LABEL_28:
LABEL_29:

}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v7 = a5;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinCodeLabelItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
    -[HUPinCodeDetailsViewController setEditedPinCodeLabel:](self, "setEditedPinCodeLabel:", v10);
  -[HUPinCodeDetailsViewController _updateSaveEnabled](self, "_updateSaveEnabled");

}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  void *v4;
  BOOL v6;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") || -[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode"))
  {

    return 1;
  }
  v6 = -[HUPinCodeDetailsViewController isClosing](self, "isClosing");

  return v6;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[HUPinCodeDetailsViewController commitPinCodeChanges](self, "commitPinCodeChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke;
  v9[3] = &unk_1E6F4D1B0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addFailureBlock:", v9);

}

void __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isClosing"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[HUPinCodeDetailsViewController textFieldDidEndEditing:item:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Supressing PIN Code validation error because we're closing view: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D30A60];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke_78;
    v7[3] = &unk_1E6F4D988;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v3, v6, 0, 0, v7);

    v4 = v8;
  }

}

uint64_t __62__HUPinCodeDetailsViewController_textFieldDidEndEditing_item___block_invoke_78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 1;
  }
  else
  {
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pinCodeValueItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != v7;

  }
  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedLocksItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) != 0)
    v12 = 0;
  else
    v12 = v5;

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  void (**v26)(void *, _QWORD);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void (**v61)(_QWORD);
  id v62;
  int v63;
  id v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  id v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v101;
  _QWORD v102[5];
  id v103;
  SEL v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  void (**v109)(_QWORD);
  id v110;
  _QWORD v111[4];
  id v112;
  id location;
  _QWORD v114[4];
  id v115;
  HUPinCodeDetailsViewController *v116;
  SEL v117;
  _QWORD v118[4];
  id v119;
  _QWORD aBlock[5];
  id v121;
  objc_super v122;
  uint8_t buf[4];
  const char *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v122.receiver = self;
  v122.super_class = (Class)HUPinCodeDetailsViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v122, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v124 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
    v125 = 2112;
    v126 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) User selected item %@", buf, 0x16u);
  }

  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v101 = v13;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteGuestPINCodeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 == v15;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    v24 = objc_msgSend(v17, "operationInProgress");

    if ((v24 & 1) != 0)
      goto LABEL_46;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E6F526C8;
    aBlock[4] = self;
    v25 = v101;
    v121 = v25;
    v26 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v25, "isUnknownGuestFromMatter"))
    {
      objc_msgSend(v25, "latestResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      HULocalizedStringWithFormat(CFSTR("HUUsersRemovePersonAlertTitle"), CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v98);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "home");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "name");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUsersRemovePersonConfirmationMessage"), CFSTR("%@%@"), v36, v37, v38, v39, v40, v41, (uint64_t)v98);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v97, v42, v7);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "actionWithTitle:style:handler:", v45, 1, &__block_literal_global_96_0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v46);

      v47 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "actionWithTitle:style:handler:", v48, 2, v26);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v49);

      -[HUPinCodeDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v43, 1, 0);
    }
    else
    {
      v26[2](v26, 0);
    }

  }
  else
  {
    objc_msgSend(v17, "pinCodeChangeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "isEqual:", v19);

    if (v20)
    {
      objc_initWeak((id *)buf, self);
      -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hasValidConstraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_99;
      v118[3] = &unk_1E6F5C788;
      objc_copyWeak(&v119, (id *)buf);
      v23 = (id)objc_msgSend(v22, "addSuccessBlock:", v118);

      objc_destroyWeak(&v119);
      objc_destroyWeak((id *)buf);
      goto LABEL_33;
    }
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "pinCodeRestoreAccessItem");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v9 == v51;

    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v52)
    {
      v66 = objc_msgSend(v53, "operationInProgress");

      if ((v66 & 1) != 0)
        goto LABEL_46;
      -[HUPinCodeDetailsViewController showSpinner](self, "showSpinner");
      -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "restoreFullAccessForUserWithItem:", v101);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_110;
      v114[3] = &unk_1E6F5C7B0;
      v115 = v101;
      v116 = self;
      v117 = a2;
      objc_msgSend(v68, "addCompletionBlock:", v114);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (id)objc_msgSend(v69, "addFailureBlock:", &__block_literal_global_112_2);

      goto LABEL_33;
    }
    objc_msgSend(v53, "personalPINCodeItem");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v9, "isEqual:", v55);

    if (v56)
    {
      -[HUPinCodeDetailsViewController _resignFirstResponderForAllTextFields](self, "_resignFirstResponderForAllTextFields");
      objc_opt_class();
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "sourceItem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;
      v99 = v59;

      objc_initWeak(&location, self);
      v60 = MEMORY[0x1E0C809B0];
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_113;
      v111[3] = &unk_1E6F4DD08;
      objc_copyWeak(&v112, &location);
      v61 = (void (**)(_QWORD))_Block_copy(v111);
      v62 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      v110 = 0;
      v63 = objc_msgSend(v62, "canEvaluatePolicy:error:", 2, &v110);
      v64 = v110;
      v65 = v64;
      if (v99)
        goto LABEL_18;
      if (v63)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodePassCodeAuthString"), CFSTR("HUPinCodePassCodeAuthString"), 1);
        v71 = objc_claimAutoreleasedReturnValue();
        v107[0] = v60;
        v107[1] = 3221225472;
        v107[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
        v107[3] = &unk_1E6F5C7F8;
        v109 = v61;
        v108 = v62;
        objc_msgSend(v108, "evaluatePolicy:localizedReason:reply:", 2, v71, v107);

      }
      else
      {
        objc_msgSend(v64, "domain");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v72, "isEqualToString:", *MEMORY[0x1E0CC1280]))
        {
          v73 = objc_msgSend(v65, "code") == -5;

          if (v73)
          {
LABEL_18:
            v61[2](v61);
LABEL_32:

            objc_destroyWeak(&v112);
            objc_destroyWeak(&location);

            goto LABEL_33;
          }
        }
        else
        {

        }
        HFLogForCategory();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
          v125 = 2112;
          v126 = v65;
          _os_log_error_impl(&dword_1B8E1E000, v71, OS_LOG_TYPE_ERROR, "(%s) cannot local authenticate. error = %@", buf, 0x16u);
        }
      }

      goto LABEL_32;
    }
  }
LABEL_33:
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addOrShowHomeKeyItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v9, "isEqual:", v75);

  if (v76)
  {
    -[HUPinCodeDetailsViewController _resignFirstResponderForAllTextFields](self, "_resignFirstResponderForAllTextFields");
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "home");
    v78 = (id)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v124 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]";
      v125 = 2112;
      v126 = v9;
      v127 = 2112;
      v128 = v78;
      _os_log_impl(&dword_1B8E1E000, v79, OS_LOG_TYPE_DEFAULT, "(%s) user tapped %@ in home %@", buf, 0x20u);
    }

    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v82 = v81;
    else
      v82 = 0;
    v83 = v82;

    objc_msgSend(v83, "setShowSpinner:", 1);
    objc_msgSend(MEMORY[0x1E0D319E8], "handleAddOrShowHomeKeyButtonTapForHome:", v78);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_120;
    v105[3] = &unk_1E6F4C610;
    v106 = v83;
    v85 = v83;
    v86 = (id)objc_msgSend(v84, "addCompletionBlock:", v105);

    goto LABEL_45;
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "restoreHomeKeyAccessItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v9, "isEqual:", v88);

  if (v89)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v90;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v91 = v78;
    else
      v91 = 0;
    v92 = v91;

    objc_msgSend(v92, "setShowSpinner:", 1);
    -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "restoreFuture");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_121;
    v102[3] = &unk_1E6F5C848;
    v103 = v92;
    v104 = a2;
    v102[4] = self;
    v81 = v92;
    v95 = (id)objc_msgSend(v94, "addSuccessBlock:", v102);

LABEL_45:
  }
LABEL_46:

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "showSpinner");
  objc_msgSend(*(id *)(a1 + 32), "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteGuestPinCodeWithItem:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_82;
  v10[3] = &unk_1E6F4C820;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v10, *MEMORY[0x1E0D30A60], 0, 0, 0);

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "pinCodeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30310]);

  objc_msgSend(v5, "na_safeSetObject:forKey:", &unk_1E70417D0, *MEMORY[0x1E0D301C8]);
  objc_msgSend(v5, "na_safeSetObject:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D301C0]);
  objc_msgSend(v5, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30300]);
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 26, v5);
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_95()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HUPinCodeEditorViewController *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(WeakRetained, "editedPinCodeValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(WeakRetained, "pinCodeItemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pinCodeValueItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "latestResults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(WeakRetained, "pinCodeItemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [HUPinCodeEditorViewController alloc];
    objc_msgSend(WeakRetained, "pinCodeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v23[3] = &unk_1E6F5C740;
    objc_copyWeak(&v24, v4);
    v20 = -[HUPinCodeEditorViewController initForCreatingNewPinCodeWithManager:initialPinCodeValue:home:completionBlock:](v18, "initForCreatingNewPinCodeWithManager:initialPinCodeValue:home:completionBlock:", v19, v8, v9, v23);

    objc_msgSend(WeakRetained, "hu_delegateForModalPresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPresentationDelegate:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v20);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v22, 1, 0);

    objc_destroyWeak(&v24);
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditUnavailableAlertTitle"), CFSTR("HUPinCodeEditUnavailableAlertTitle"), 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditUnavailableAlertMessage"), CFSTR("HUPinCodeEditUnavailableAlertMessage"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_108_3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);
  }

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "setEditedPinCodeValue:", v3);
    objc_msgSend(v5, "pinCodeItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinCodeValueItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateCellForItems:", v8);

  }
  objc_msgSend(v5, "_updateSaveEnabled");

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke_3";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped OK button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_110(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateFromPinCode:", a2);
    objc_msgSend(*(id *)(a1 + 40), "pinCodeItemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 40), "hideSpinner");
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_111(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30A60], 0, 0, 0);

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_113(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  HUPersonalPINCodeViewController *v5;
  void *v6;
  HUPersonalPINCodeViewController *v7;
  void *v8;
  id v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pinCodeItemManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HUPersonalPINCodeViewController alloc];
  objc_msgSend(WeakRetained, "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUPersonalPINCodeViewController initWithItem:pinCodeManager:home:](v5, "initWithItem:pinCodeManager:home:", v4, v6, v2);

  -[HUPersonalPINCodeViewController setDelegate:](v7, "setDelegate:", WeakRetained);
  objc_msgSend(WeakRetained, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v7, 1);

}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[HUPinCodeDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke_4";
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(%s) When evaluating authentication policy, authError = %@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    if (a2)
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowSpinner:", 0);
}

void __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_121(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pinCodeItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_122;
  v9[3] = &unk_1E6F5C820;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v6, "restoreMissingWalletKeys:completion:", v4, v9);

}

uint64_t __68__HUPinCodeDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3_122(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pinCodeItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestoreFuture:", v3);

  objc_msgSend(*(id *)(a1 + 32), "pinCodeItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "setShowSpinner:", 0);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  _BOOL4 v52;
  _QWORD v53[4];
  id v54;
  BOOL v55;
  _QWORD v56[4];
  id v57;
  BOOL v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  BOOL v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  BOOL v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v52 = a4;
  v79 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUPinCodeDetailsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v50 = v13;

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v72 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]";
    v73 = 2112;
    v74 = v15;
    v75 = 1024;
    v76 = v52;
    v77 = 2112;
    v78 = v9;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: %@ | isOn = %{BOOL}d | item = %@", buf, 0x26u);

  }
  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v49 = v18;

  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sourceItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v23 = v22;
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "home");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "user");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    objc_msgSend(v49, "user");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  if (objc_msgSend(v25, "hf_currentUserIsAdministrator")
    && objc_msgSend(v25, "hf_userIsRestrictedGuest:", v29))
  {
    objc_msgSend(v50, "accessory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v31 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F5C870;
    objc_copyWeak(&v69, (id *)buf);
    v48 = v25;
    v65 = v48;
    v47 = v29;
    v66 = v47;
    v70 = v52;
    v32 = v30;
    v67 = v32;
    v33 = v5;
    v68 = v33;
    v34 = _Block_copy(aBlock);
    v59[0] = v31;
    v59[1] = 3221225472;
    v59[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_137;
    v59[3] = &unk_1E6F5C898;
    objc_copyWeak(&v62, (id *)buf);
    v35 = v32;
    v60 = v35;
    v63 = v52;
    v46 = v34;
    v61 = v46;
    v36 = _Block_copy(v59);
    v37 = v31;
    v38 = v29;
    v39 = v23;
    v40 = v5;
    v41 = (void *)MEMORY[0x1E0CEABB8];
    v56[0] = v37;
    v56[1] = 3221225472;
    v56[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_139;
    v56[3] = &unk_1E6F4D200;
    v57 = v33;
    v58 = v52;
    objc_msgSend(v41, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", self, v48, v47, v35, v56);

    v5 = v40;
    v23 = v39;
    v29 = v38;

    objc_destroyWeak(&v62);
    objc_destroyWeak(&v69);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[HUPinCodeDetailsViewController accessoriesToEdit](self, "accessoriesToEdit");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "accessory");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      objc_msgSend(v42, "addObject:", v43);
    else
      objc_msgSend(v42, "removeObject:", v43);

    -[HUPinCodeDetailsViewController _updateSaveEnabled](self, "_updateSaveEnabled");
    -[HUPinCodeDetailsViewController commitAccessoryChanges](self, "commitAccessoryChanges");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_140;
    v53[3] = &unk_1E6F52A58;
    v54 = v5;
    v55 = v52;
    v45 = (id)objc_msgSend(v44, "addFailureBlock:", v53);

    v35 = v54;
  }

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
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
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  char v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "restrictedGuestAccessSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessAllowedToAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSet:", v7);

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  else
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v4, "restrictedGuestAccessSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "setAccessAllowedToAccessories:", v15);
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v42 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke";
    v43 = 2112;
    v44 = v15;
    v45 = 2112;
    v46 = v19;
    v47 = 2112;
    v48 = v20;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "(%s) Updating allowed accessories to: %@ | In flight additions: %@ | In flight removals: %@", buf, 0x2Au);

  }
  v21 = (void *)MEMORY[0x1E0D519C0];
  v22 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_127;
  v38[3] = &unk_1E6F4D600;
  v23 = v4;
  v39 = v23;
  v24 = v17;
  v40 = v24;
  objc_msgSend(v21, "futureWithBlock:", v38);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_128;
  v35[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v37, v2);
  v36 = *(id *)(a1 + 48);
  v26 = (id)objc_msgSend(v25, "addCompletionBlock:", v35);
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_129;
  v32[3] = &unk_1E6F4D188;
  v33 = *(id *)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v27 = (id)objc_msgSend(v25, "addSuccessBlock:", v32);
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_136;
  v29[3] = &unk_1E6F52A58;
  v30 = *(id *)(a1 + 56);
  v31 = *(_BYTE *)(a1 + 72);
  v28 = (id)objc_msgSend(v25, "addFailureBlock:", v29);

  objc_destroyWeak(&v37);
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2;
  v7[3] = &unk_1E6F4E2D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateRestrictedGuestSettings:completionHandler:", v4, v7);

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "finishWithError:", v3);
  else
    objc_msgSend(v5, "finishWithNoResult");

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_128(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_129(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_131;
  v4[3] = &unk_1E6F4F418;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v4, 0);

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_136(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories with error: %@.", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30A18], 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_137(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "hf_servicesWithBulletinBoardNotificationTurnedOff");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
    v5 = objc_msgSend(v3, "count") != 0;
  else
    v5 = 0;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(unsigned __int8 *)(a1 + 56);
    v9 = 136316162;
    v10 = "-[HUPinCodeDetailsViewController switchCell:didTurnOn:]_block_invoke";
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = v7;
    v15 = 2048;
    v16 = objc_msgSend(v4, "count");
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) displayNotificationAlert = %{BOOL}d because cell isOn = %{BOOL}d and servicesWithNotificationOff = (%ld) %@", (uint8_t *)&v9, 0x2Cu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(WeakRetained, "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v4, 1, v8, *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(_QWORD))(v8 + 16))(*(_QWORD *)(a1 + 40));

}

uint64_t __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 40) == 0);
}

void __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_2_140(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30A60];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_3;
  v7[3] = &unk_1E6F4D200;
  v8 = *(id *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, v6, 0, 0, v7);

}

uint64_t __55__HUPinCodeDetailsViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 40) == 0);
}

- (void)personalPinCodeViewController:(id)a3 pinCodeDidChange:(id)a4
{
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v9)
  {
    objc_msgSend(v9, "updateFromPinCode:", v5);
  }
  else
  {
    objc_msgSend(v9, "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 || !v15)
    {
      if (v5 && v12)
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v5, v14, 0);
        -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSourceItem:", v20);

      }
      else
      {
        HFLogForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = 136315650;
          v24 = "-[HUPinCodeDetailsViewController personalPinCodeViewController:pinCodeDidChange:]";
          v25 = 2112;
          v26 = v9;
          v27 = 2112;
          v28 = v5;
          _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "(%s): Unexpected state. pinCodeItem: %@ newPinCode: %@", (uint8_t *)&v23, 0x20u);
        }
      }

    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0D31988]);
      objc_msgSend(v9, "user");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithHome:user:nameStyle:", v14, v17, 0);
      -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSourceItem:", v18);

    }
  }
  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resetItemProvidersAndModules");

}

- (id)_allTextFields
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUPinCodeDetailsViewController tableView](self, "tableView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = &unk_1EF258718;
        if (objc_msgSend(v10, "conformsToProtocol:", v11))
          v12 = v10;
        else
          v12 = 0;
        v13 = v12;

        objc_msgSend(v13, "textField");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "na_safeAddObject:", v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_resignFirstResponderForAllTextFields
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HUPinCodeDetailsViewController _allTextFields](self, "_allTextFields", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resignFirstResponder");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_codeValueHasChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pinCodeValueItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_codeLabelHasChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pinCodeLabelItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_updateSaveEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pinCodeLabelItem");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeDetailsViewController pinCodeItemManager](self, "pinCodeItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinCodeValueItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = -[HUPinCodeDetailsViewController _codeValueHasChanged](self, "_codeValueHasChanged");
  v10 = v9;
  if (v8)
  {
    -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length") == 0;
  }
  else
  {
    v10 = v9 || -[HUPinCodeDetailsViewController _codeLabelHasChanged](self, "_codeLabelHasChanged");
    -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v11 = v13;
    }
    else
    {
      objc_msgSend(v24, "latestResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[HUPinCodeDetailsViewController editedPinCodeValue](self, "editedPinCodeValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v5, "latestResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v11, "length"))
      v12 = objc_msgSend(v18, "length") == 0;
    else
      v12 = 1;

  }
  v20 = v10 ^ 1 | v12;
  if ((v20 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    -[HUPinCodeDetailsViewController accessoriesToEdit](self, "accessoriesToEdit");
    v10 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v10, "count"))
      v21 = 1;
    else
      v21 = -[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode") ^ 1;
  }
  -[HUPinCodeDetailsViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEnabled:", v21);

  if ((v20 & 1) == 0)
}

- (id)_validatePinCodeLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (-[HUPinCodeDetailsViewController creatingNewPinCode](self, "creatingNewPinCode")
    || -[HUPinCodeDetailsViewController _codeLabelHasChanged](self, "_codeLabelHasChanged"))
  {
    -[HUPinCodeDetailsViewController editedPinCodeLabel](self, "editedPinCodeLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPinCodeDetailsViewController pinCodeManager](self, "pinCodeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guestPinCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke;
    v9[3] = &unk_1E6F4CD30;
    v10 = v3;
    v6 = v3;
    objc_msgSend(v5, "flatMap:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke_2;
  v8[3] = &unk_1E6F531C0;
  v9 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "na_any:", v8);
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 76);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __55__HUPinCodeDetailsViewController__validatePinCodeLabel__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HUPinCodeDetailsViewDelegate)delegate
{
  return (HUPinCodeDetailsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUPinCodeDetailsItemManager)pinCodeItemManager
{
  return (HUPinCodeDetailsItemManager *)objc_loadWeakRetained((id *)&self->_pinCodeItemManager);
}

- (void)setPinCodeItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_pinCodeItemManager, a3);
}

- (NSString)editedPinCodeLabel
{
  return self->_editedPinCodeLabel;
}

- (void)setEditedPinCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_editedPinCodeLabel, a3);
}

- (NSString)editedPinCodeValue
{
  return self->_editedPinCodeValue;
}

- (void)setEditedPinCodeValue:(id)a3
{
  objc_storeStrong((id *)&self->_editedPinCodeValue, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (BOOL)creatingNewPinCode
{
  return self->_creatingNewPinCode;
}

- (void)setCreatingNewPinCode:(BOOL)a3
{
  self->_creatingNewPinCode = a3;
}

- (BOOL)isClosing
{
  return self->_isClosing;
}

- (void)setIsClosing:(BOOL)a3
{
  self->_isClosing = a3;
}

- (NSArray)pinAccessories
{
  return self->_pinAccessories;
}

- (void)setPinAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_pinAccessories, a3);
}

- (NSMutableArray)accessoriesToEdit
{
  return self->_accessoriesToEdit;
}

- (void)setAccessoriesToEdit:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesToEdit, a3);
}

- (NSMutableSet)inFlightAllowedAccessoryRemovals
{
  return self->_inFlightAllowedAccessoryRemovals;
}

- (void)setInFlightAllowedAccessoryRemovals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (NSMutableSet)inFlightAllowedAccessoryAdditions
{
  return self->_inFlightAllowedAccessoryAdditions;
}

- (void)setInFlightAllowedAccessoryAdditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryAdditions, 0);
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryRemovals, 0);
  objc_storeStrong((id *)&self->_accessoriesToEdit, 0);
  objc_storeStrong((id *)&self->_pinAccessories, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_editedPinCodeValue, 0);
  objc_storeStrong((id *)&self->_editedPinCodeLabel, 0);
  objc_destroyWeak((id *)&self->_pinCodeItemManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
