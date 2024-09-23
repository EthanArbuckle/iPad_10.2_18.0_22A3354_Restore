@implementation HUPersonalPINCodeViewController

- (HUPersonalPINCodeViewController)initWithItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HUPersonalPINCodeItemManager *v12;
  HUPersonalPINCodeViewController *v13;
  HUPersonalPINCodeViewController *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      NSLog(CFSTR("Supplied item is not HFPinCodeItem or HFUserItem %@"), v8);
  }
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = -[HUPersonalPINCodeItemManager initWithDelegate:item:pinCodeManager:home:]([HUPersonalPINCodeItemManager alloc], "initWithDelegate:item:pinCodeManager:home:", self, v11, v9, v10);

  v16.receiver = self;
  v16.super_class = (Class)HUPersonalPINCodeViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v16, sel_initWithItemManager_tableViewStyle_, v12, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a4);
    objc_storeWeak((id *)&v14->_personalPINCodeItemManager, v12);
  }

  return v14;
}

- (HUPersonalPINCodeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItem_pinCodeManager_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalPINCodeViewController.m"), 68, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalPINCodeViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUPersonalPINCodeViewController;
  -[HUItemTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (-[HUPersonalPINCodeViewController showDoneButtonInNavBar](self, "showDoneButtonInNavBar"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
    -[HUPersonalPINCodeViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", v3);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)doneButtonPressed:(id)a3
{
  id v3;

  -[HUPersonalPINCodeViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HUPersonalPINCodeViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v32, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeValueItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (!v14)
  {
    -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pinCodeChangeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v19))
    {

    }
    else
    {
      -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shareButtonItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v11, "isEqual:", v21);

      if (!v22)
      {
        -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "createUserPINButtonItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v11, "isEqual:", v24);

        if (!v25)
        {
          -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeUserPINButtonItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v11, "isEqual:", v27);

          if (!v28)
            goto LABEL_10;
          +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:isDestructive:](HUListContentConfigurationUtilities, "buttonStyleConfigurationForItem:isDestructive:", v11, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "latestResults");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "BOOLValue"))
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "textProperties");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setColor:", v30);

          }
          objc_msgSend(v10, "setContentConfiguration:", v16);
          goto LABEL_3;
        }
      }
    }
    +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:isDestructive:](HUListContentConfigurationUtilities, "buttonStyleConfigurationForItem:isDestructive:", v11, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentConfiguration:", v16);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setContentConfiguration:", v16);
  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisableUpdateMask:", 16);
LABEL_3:

LABEL_9:
LABEL_10:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeValueItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v7)
  {
    objc_msgSend(v11, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v16 = 0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeUserPINButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v7)
  {
    objc_msgSend(v7, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    v16 = v20 ^ 1;
  }
  else
  {

    v16 = 1;
  }
LABEL_11:

  return v16;
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
  id v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  objc_super v65;
  uint8_t buf[4];
  HUPersonalPINCodeViewController *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)HUPersonalPINCodeViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v65, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v67 = self;
    v68 = 2080;
    v69 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]";
    v70 = 2112;
    v71 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "In %@'s %s, user selected item %@", buf, 0x20u);
  }

  objc_opt_class();
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pinCodeValueItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "isEqual:", v16);
  if (v14)
    v18 = v17;
  else
    v18 = 0;
  if ((v18 & 1) != 0)
  {
    objc_msgSend(v14, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalPINCodeViewController becomeFirstResponder](self, "becomeFirstResponder");
      -[HUPersonalPINCodeViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      objc_msgSend(v21, "showMenuFromView:rect:", v23);

      goto LABEL_24;
    }
  }
  else
  {

  }
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pinCodeChangeItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v9, "isEqual:", v25);

  if (v26)
    goto LABEL_14;
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shareButtonItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v9, "isEqual:", v28);

  if (v29)
  {
    -[HUPersonalPINCodeViewController _shareCode](self, "_shareCode");
    goto LABEL_24;
  }
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "createUserPINButtonItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v9, "isEqual:", v31);

  if (v32)
  {
LABEL_14:
    -[HUPersonalPINCodeViewController openPINCodeEditor](self, "openPINCodeEditor");
  }
  else
  {
    -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeUserPINButtonItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v9, "isEqual:", v34);

    if (v35)
    {
      -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "operationInProgress");

      if ((v37 & 1) == 0)
      {
        -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "home");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "currentUser");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v61, "uniqueIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "user");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "uniqueIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v38) = objc_msgSend(v40, "isEqual:", v42);

        _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeDeleteAlertTitle"), CFSTR("HUPinCodeDeleteAlertTitle"), 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "home");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if ((_DWORD)v38)
          v44 = CFSTR("HUPinCodeDeleteCurrentUserPINCodeAlertMessage");
        else
          v44 = CFSTR("HUPinCodeDeleteOtherUserPINCodeAlertMessage");
        objc_msgSend(v60, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(v44, CFSTR("%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v59, v58, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        v54 = (void *)MEMORY[0x1E0CEA2E0];
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v62[3] = &unk_1E6F4F440;
        objc_copyWeak(&v64, (id *)buf);
        v63 = v14;
        objc_msgSend(v54, "actionWithTitle:style:handler:", v57, 2, v62);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addAction:", v55);

        objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v52, 0, &__block_literal_global_188);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addAction:", v56);

        -[HUPersonalPINCodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v53, 1, 0);
        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);

      }
    }
  }
LABEL_24:

}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped confirm button with title '%@' from the alert popup", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showSpinner");
  objc_msgSend(*(id *)(a1 + 32), "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pinCodeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteUserPinCodeWithUser:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_38;
  v11[3] = &unk_1E6F4C820;
  v11[4] = WeakRetained;
  v12 = *(id *)(a1 + 32);
  v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);

}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v14 = v4;
  if (v4)
  {
    objc_msgSend(v5, "_hideSpinner");
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v14, *MEMORY[0x1E0D30A28], 0, 0, 0);
  }
  else
  {
    v7 = objc_msgSend(v5, "showDoneButtonInNavBar");
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personalPinCodeViewController:pinCodeDidChange:", *(_QWORD *)(a1 + 32), 0);
    }
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "personalPINCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0D30310]);

  objc_msgSend(v11, "na_safeSetObject:forKey:", &unk_1E7041488, *MEMORY[0x1E0D301C8]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D301C0]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E0D30300]);
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 26, v11);

}

void __69__HUPersonalPINCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_45()
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
    v2 = "-[HUPersonalPINCodeViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

}

- (id)currentPinCodeValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_opt_class();
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentUser");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  LOBYTE(v9) = objc_msgSend(v6, "isGuest");
  if ((v9 & 1) != 0 || (v14 = 0, v13))
  {
    -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pinCodeValueItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)openPINCodeEditor
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  HUPersonalPINCodeViewController *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2080;
    v13 = "-[HUPersonalPINCodeViewController openPINCodeEditor]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Opening PINCode Editor", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[HUPersonalPINCodeViewController pinCodeManager](self, "pinCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hasValidConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke;
  v8[3] = &unk_1E6F5A130;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = (id)a2;
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v8);

  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  HUPinCodeEditorViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HUPinCodeEditorViewController *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v24 = v3;
    objc_msgSend(WeakRetained, "currentPinCodeValue");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "personalPINCodeItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [HUPinCodeEditorViewController alloc];
    objc_msgSend(WeakRetained, "personalPINCodeItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pinCodeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_2;
    v25[3] = &unk_1E6F5A0E8;
    objc_copyWeak(v27, (id *)(a1 + 32));
    v12 = v7;
    v13 = *(void **)(a1 + 40);
    v26 = v12;
    v27[1] = v13;
    v14 = v8;
    v15 = (void *)v5;
    v16 = -[HUPinCodeEditorViewController initForEditingPinCodeWithItem:pinCodeManager:pinCodeValue:home:completionBlock:](v14, "initForEditingPinCodeWithItem:pinCodeManager:pinCodeValue:home:completionBlock:", v10, v11, v5, v12, v25);

    objc_msgSend(WeakRetained, "hu_delegateForModalPresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPresentationDelegate:", v17);

    v3 = v24;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v16);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v18, 1, 0);

    objc_destroyWeak(v27);
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditUnavailableAlertTitle"), CFSTR("HUPinCodeEditUnavailableAlertTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditUnavailableAlertMessage"), CFSTR("HUPinCodeEditUnavailableAlertMessage"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 2, &__block_literal_global_57_0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v23);

    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v20, 1, 0);
  }

}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  objc_msgSend(WeakRetained, "personalPINCodeItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v3 && v8)
  {
    objc_msgSend(v8, "updateFromPinCode:", v3);
    v9 = 2;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v3, *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(WeakRetained, "personalPINCodeItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceItem:", v10);

    v9 = 0;
  }
  objc_msgSend(WeakRetained, "personalPINCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetItemProvidersAndModules");

  objc_msgSend(WeakRetained, "personalPINCodeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

  objc_msgSend(WeakRetained, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "personalPinCodeViewController:pinCodeDidChange:", WeakRetained, v3);

  v22[0] = *MEMORY[0x1E0D30310];
  objc_msgSend(WeakRetained, "personalPINCodeItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D301C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  v22[2] = *MEMORY[0x1E0D301C0];
  objc_msgSend(WeakRetained, "personalPINCodeItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sourceItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 26, v21);
}

void __52__HUPersonalPINCodeViewController_openPINCodeEditor__block_invoke_3()
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
    v2 = "-[HUPersonalPINCodeViewController openPINCodeEditor]_block_invoke_3";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped ok button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HUPersonalPINCodeViewController currentPinCodeValue](self, "currentPinCodeValue", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forPasteboardType:", v5, v4);

  }
}

- (void)_shareCode
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
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_opt_class();
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v17 = v5;

  objc_msgSend(v17, "pinCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUPinCodeUtilities createSharingViewControllerForPinCodeItem:inHome:](HUPinCodeUtilities, "createSharingViewControllerForPinCodeItem:inHome:", v17, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "modalPresentationStyle") == 7)
    {
      objc_msgSend(v9, "popoverPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalPINCodeViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shareButtonItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForItem:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForRowAtIndexPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSourceView:", v16);

    }
    -[HUPersonalPINCodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)_showSpinner
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v13);
  -[HUPersonalPINCodeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(v13, "startAnimating");
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOperationInProgress:", 1);

  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeUserPINButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v7, "updateResultsForItems:senderSelector:", v11, a2);

}

- (void)_hideSpinner
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  objc_opt_class();
  -[HUPersonalPINCodeViewController navigationItem](self, "navigationItem");
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

  -[HUPersonalPINCodeViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", 0);

  objc_msgSend(v8, "stopAnimating");
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOperationInProgress:", 0);

  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  -[HUPersonalPINCodeViewController personalPINCodeItemManager](self, "personalPINCodeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeUserPINButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v16, "updateResultsForItems:senderSelector:", v14, a2);

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HUPersonalPINCodeViewControllerDelegate)delegate
{
  return (HUPersonalPINCodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showDoneButtonInNavBar
{
  return self->_showDoneButtonInNavBar;
}

- (void)setShowDoneButtonInNavBar:(BOOL)a3
{
  self->_showDoneButtonInNavBar = a3;
}

- (HUPersonalPINCodeItemManager)personalPINCodeItemManager
{
  return (HUPersonalPINCodeItemManager *)objc_loadWeakRetained((id *)&self->_personalPINCodeItemManager);
}

- (void)setPersonalPINCodeItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_personalPINCodeItemManager, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_destroyWeak((id *)&self->_personalPINCodeItemManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
