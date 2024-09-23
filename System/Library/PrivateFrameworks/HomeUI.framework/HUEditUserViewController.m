@implementation HUEditUserViewController

- (HUEditUserViewController)initWithItem:(id)a3 home:(id)a4 pinCodeManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUEditUserItemManager *v12;
  void *v13;
  HUEditUserItemManager *v14;
  HUEditUserViewController *v15;
  uint64_t v16;
  HFUserItem *userItem;
  HUPendingAccessoriesGridViewController *v18;
  void *v19;
  uint64_t v20;
  HUPendingAccessoriesGridViewController *pendingAccessoriesViewController;
  void *v22;
  _QWORD v24[4];
  id v25[2];
  id location;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = [HUEditUserItemManager alloc];
  v13 = (void *)objc_msgSend(v9, "copy");
  v14 = -[HUEditUserItemManager initWithHome:userItem:delegate:](v12, "initWithHome:userItem:delegate:", v10, v13, self);

  v27.receiver = self;
  v27.super_class = (Class)HUEditUserViewController;
  v15 = -[HUUserTableViewController initWithUserItemManager:home:](&v27, sel_initWithUserItemManager_home_, v14, v10);
  if (v15)
  {
    v16 = objc_msgSend(v9, "copy");
    userItem = v15->_userItem;
    v15->_userItem = (HFUserItem *)v16;

    objc_storeStrong((id *)&v15->_pinCodeManager, a5);
    objc_storeStrong((id *)&v15->_editUserItemManager, v14);
    -[HFItemManager setDelegate:](v15->_editUserItemManager, "setDelegate:", v15);
    v18 = [HUPendingAccessoriesGridViewController alloc];
    objc_msgSend(v9, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HUPendingAccessoriesGridViewController initWithUser:home:](v18, "initWithUser:home:", v19, v10);
    pendingAccessoriesViewController = v15->_pendingAccessoriesViewController;
    v15->_pendingAccessoriesViewController = (HUPendingAccessoriesGridViewController *)v20;

    -[HFUserItem home](v15->_userItem, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v22, "isMultiUserEnabled");

    if ((_DWORD)v19)
    {
      objc_initWeak(&location, v15);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__HUEditUserViewController_initWithItem_home_pinCodeManager___block_invoke;
      v24[3] = &unk_1E6F55308;
      objc_copyWeak(v25, &location);
      v25[1] = (id)a2;
      +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguagesWithCompletion:", v24);
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

void __61__HUEditUserViewController_initWithItem_home_pinCodeManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);

  }
  if (!v6)
  {
    objc_msgSend(WeakRetained, "editUserItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSupportedMULanguageCodes:", v5);

    objc_msgSend(WeakRetained, "editUserItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

    objc_msgSend(WeakRetained, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUEditUserViewController;
  -[HUItemTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUEditUserViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel_doneButtonTapped_);
    -[HUEditUserViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUEditUserViewController;
  -[HUItemTableViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[HUEditUserViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HUEditUserViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5;

  if (a4 == self)
  {
    objc_msgSend(a4, "tableView", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)doneButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUEditUserViewController userItem](self, "userItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[HUEditUserViewController doneButtonTapped:]";
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'done' button %@. user = %@", (uint8_t *)&v9, 0x20u);

  }
  -[HUEditUserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)user
{
  void *v2;
  void *v3;

  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userBeingEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v6 = a3;
  v7 = a4;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowEditingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
    goto LABEL_15;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localAccessItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqual:", v12);

  if (v13)
    goto LABEL_15;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personalRequestsFooterItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isEqual:", v15);

  if (v16)
    goto LABEL_15;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pendingAccessoriesItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "isEqual:", v18);

  if (v19)
    goto LABEL_15;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "camerasItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v21) & 1) != 0)
    goto LABEL_14;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "locksItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v23) & 1) != 0)
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personalRequestsItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v25) & 1) != 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v46 = v24;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tvViewingProfilesItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v27) & 1) != 0)
  {
LABEL_11:

    v24 = v46;
    goto LABEL_12;
  }
  v44 = v27;
  v45 = v26;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "remoteAccessItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v29) & 1) != 0)
  {

    v27 = v44;
    v26 = v45;
    goto LABEL_11;
  }
  v41 = v29;
  v42 = v28;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "updateListeningHistoryItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:") & 1) != 0)
  {
    v43 = 1;
  }
  else
  {
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allowedAccessoryCategoryItemProvider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "items");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v34, "containsObject:", v6);

  }
  if ((v43 & 1) == 0)
  {
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "homeScheduleItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v6, "isEqual:", v36);

    if (!v37)
    {
      v47.receiver = self;
      v47.super_class = (Class)HUEditUserViewController;
      -[HUUserTableViewController cellClassForItem:indexPath:](&v47, sel_cellClassForItem_indexPath_, v6, v7);
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
LABEL_15:
  objc_opt_class();
  v30 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v31 = (void *)v30;

  return (Class)v31;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  objc_super v60;

  v8 = a3;
  v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)HUEditUserViewController;
  -[HUUserTableViewController setupCell:forItem:indexPath:](&v60, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowEditingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = v8;
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setSelectionStyle:", 0);
    goto LABEL_12;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pendingAccessoriesItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CEA478];
    v18 = v8;
    objc_msgSend(v17, "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

    -[HUEditUserViewController pendingAccessoriesViewController](self, "pendingAccessoriesViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setViewController:", v13);

    goto LABEL_12;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "camerasItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v23))
  {

LABEL_8:
    objc_opt_class();
    v27 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v13 = v28;

    objc_msgSend(v13, "setIconDisplayStyle:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMetrics:", v29);

    objc_msgSend(v13, "setDisableContinuousIconAnimation:", 1);
    objc_msgSend(v13, "setAccessoryType:", 1);
    goto LABEL_12;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "locksItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v9, "isEqual:", v25);

  if (v26)
    goto LABEL_8;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "personalRequestsItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v31) & 1) != 0)
    goto LABEL_21;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tvViewingProfilesItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v33) & 1) != 0)
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "remoteAccessItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v35) & 1) != 0)
  {
LABEL_19:

    goto LABEL_20;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updateListeningHistoryItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:") & 1) != 0)
  {

    goto LABEL_19;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "allowedAccessoryCategoryItemProvider");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "items");
  v57 = v36;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v44, "containsObject:", v9);

  if ((v58 & 1) != 0)
  {
LABEL_22:
    objc_opt_class();
    v37 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
    v13 = v38;

    objc_msgSend(v13, "setAccessoryView:", 0);
    objc_msgSend(v13, "setHideIcon:", 1);
    objc_msgSend(v13, "setAccessoryType:", 1);
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allowedAccessoryCategoryItemProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "items");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "containsObject:", v9);

    if (v42)
    {
      objc_msgSend(v13, "setHideIcon:", 0);
      +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setContentMetrics:", v43);

    }
    goto LABEL_12;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "homeScheduleItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v9, "isEqual:", v46);

  if (!v47)
    goto LABEL_13;
  objc_opt_class();
  v48 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v49 = v48;
  else
    v49 = 0;
  v13 = v49;

  objc_msgSend(v13, "setIconDisplayStyle:", 1);
  objc_msgSend(v13, "setDisableContinuousIconAnimation:", 1);
  HUDefaultSizeForIconSize();
  v51 = v50;
  v53 = v52;
  objc_msgSend(v13, "contentMetrics");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setIconSize:", v51, v53);

  objc_msgSend(v13, "setAccessoryType:", 0);
  objc_msgSend(v13, "setValueColorFollowsTintColor:", 1);
LABEL_12:

LABEL_13:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  objc_super v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUEditUserViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v24, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personalRequestsFooterItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    v15 = v10;
    objc_msgSend(v15, "headerFooterView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setType:", 1);

    objc_msgSend(v11, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "headerFooterView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMessage:", v18);

    objc_msgSend(v15, "headerFooterView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "messageTextView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", self);
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v22 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v21 = v23;

    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentConfiguration:", v20);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)HUEditUserViewController;
  LOBYTE(v8) = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v16, sel_shouldHideSeparatorsForCell_indexPath_, v7, v6);

  if ((v8 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allowEditingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v12) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pendingAccessoriesItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v14);

    }
  }

  return v10;
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
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  HURestrictedGuestScheduleViewController *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  HURestrictedGuestScheduleViewController *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  int v89;
  id v90;
  HUUserAccessoryAccessViewController *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  HUUserAccessoryAccessViewController *v97;
  void *v98;
  id v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  HURemoteAccessTableViewController *v105;
  void *v106;
  void *v107;
  void *v108;
  HURemoteAccessTableViewController *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  int v114;
  HUUserCamerasAccessLevelViewController *v115;
  void *v116;
  void *v117;
  void *v118;
  HUUserCamerasAccessLevelViewController *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  int v124;
  id v125;
  void *v126;
  void *v127;
  int v128;
  HUPersonalRequestsEditorTableViewController *v129;
  void *v130;
  HUPersonalRequestsEditorTableViewController *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  int v136;
  HUTVViewingProfilesEditorTableViewController *v137;
  void *v138;
  HUTVViewingProfilesEditorTableViewController *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  int v144;
  HUUpdateListeningHistorySettingsViewController *v145;
  void *v146;
  HUUpdateListeningHistorySettingsViewController *v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
  void *v153;
  _QWORD v154[4];
  id v155;
  HUEditUserViewController *v156;
  _QWORD v157[4];
  id v158;
  objc_super v159;
  uint8_t buf[4];
  HUEditUserViewController *v161;
  __int16 v162;
  void *v163;
  __int16 v164;
  id v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v159.receiver = self;
  v159.super_class = (Class)HUEditUserViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v159, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = v6;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HUEditUserViewController userItem](self, "userItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_prettyDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v161 = (HUEditUserViewController *)"-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]";
    v162 = 2112;
    v163 = v9;
    v164 = 2112;
    v165 = v13;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' for user = %@", buf, 0x20u);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "hf_currentUserIsAdministrator") & 1) != 0
      || objc_msgSend(v18, "hf_currentUserIsOwner"))
    {
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userBeingEdited");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUsersRemovePersonAlertTitle"), CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userBeingEdited");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUsersRemovePersonConfirmationMessage"), CFSTR("%@%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("HURemoveTitle");
    }
    else
    {
      objc_msgSend(v18, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUEditLocationLeaveHomeAlertTitle"), CFSTR("%@"), v42, v43, v44, v45, v46, v47, (uint64_t)v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "name");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUEditLocationLeaveHomeConfirmationMessage"), CFSTR("%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v48);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("HUDeleteTitle");
    }
    _HULocalizedStringWithDefaultValue(v40, v40, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v28, v38, v153);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = MEMORY[0x1E0C809B0];
    v58 = (void *)MEMORY[0x1E0CEA2E0];
    v157[0] = MEMORY[0x1E0C809B0];
    v157[1] = 3221225472;
    v157[2] = __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v157[3] = &unk_1E6F4C6E0;
    v158 = v39;
    v59 = v39;
    objc_msgSend(v58, "actionWithTitle:style:handler:", v59, 1, v157);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addAction:", v60);

    v61 = (void *)MEMORY[0x1E0CEA2E0];
    v154[0] = v57;
    v154[1] = 3221225472;
    v154[2] = __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke_51;
    v154[3] = &unk_1E6F526C8;
    v155 = v55;
    v156 = self;
    v62 = v55;
    objc_msgSend(v61, "actionWithTitle:style:handler:", v62, 2, v154);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addAction:", v63);

    -[HUEditUserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v56, 1, 0);
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "homeScheduleItem");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v9, "isEqual:", v65);

  if (v66)
  {
    v67 = [HURestrictedGuestScheduleViewController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "home");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserViewController userItem](self, "userItem");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "user");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[HURestrictedGuestScheduleViewController initWithHome:user:](v67, "initWithHome:user:", v69, v71);

    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v72);
    objc_msgSend(v73, "setModalPresentationStyle:", 2);
    v74 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v73, 1);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "allowedAccessoryCategoryItemProvider");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "items");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "containsObject:", v9);

  if (v78)
  {
    objc_opt_class();
    v79 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v80 = v79;
    else
      v80 = 0;
    v81 = v80;

    objc_opt_class();
    objc_msgSend(v81, "sourceItem");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v83 = v82;
    else
      v83 = 0;
    v84 = v83;

    objc_msgSend(v84, "categoryType");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "isEqualToString:", *MEMORY[0x1E0CB7A38]);

    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "home");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "hf_canAddAccessCode");

    if (v86 && v89)
    {
      v90 = -[HUEditUserViewController presentPinDetailsViewController](self, "presentPinDetailsViewController");
    }
    else
    {
      v151 = v81;
      v91 = [HUUserAccessoryAccessViewController alloc];
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "home");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "userBeingEdited");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "categoryType");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[HUUserAccessoryAccessViewController initWithHome:user:accessoryCategoryType:](v91, "initWithHome:user:accessoryCategoryType:", v93, v95, v96);

      -[HUEditUserViewController navigationController](self, "navigationController");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (id)objc_msgSend(v98, "hu_pushPreloadableViewController:animated:", v97, 1);

      HFLogForCategory();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v161 = self;
        v162 = 2112;
        v163 = v101;
        v164 = 2112;
        v165 = v84;
        _os_log_impl(&dword_1B8E1E000, v100, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking for allowed accessory category item: categoryItem=%@.", buf, 0x20u);

      }
      v81 = v151;
    }

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "remoteAccessItem");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v9, "isEqual:", v103);

  if (v104)
  {
    v105 = [HURemoteAccessTableViewController alloc];
    -[HUEditUserViewController userItem](self, "userItem");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "home");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = -[HURemoteAccessTableViewController initWithItem:home:](v105, "initWithItem:home:", v106, v108);

    -[HUEditUserViewController navigationController](self, "navigationController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (id)objc_msgSend(v110, "hu_pushPreloadableViewController:animated:", v109, 1);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "camerasItem");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v9, "isEqual:", v113);

  if (v114)
  {
    v115 = [HUUserCamerasAccessLevelViewController alloc];
    -[HUEditUserViewController userItem](self, "userItem");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "home");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[HUUserCamerasAccessLevelViewController initWithUserItem:home:](v115, "initWithUserItem:home:", v116, v118);

    -[HUEditUserViewController navigationController](self, "navigationController");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = (id)objc_msgSend(v120, "hu_pushPreloadableViewController:animated:", v119, 1);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "locksItem");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v9, "isEqual:", v123);

  if (v124)
    v125 = -[HUEditUserViewController presentPinDetailsViewController](self, "presentPinDetailsViewController");
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "personalRequestsItem");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v9, "isEqual:", v127);

  if (v128)
  {
    v129 = [HUPersonalRequestsEditorTableViewController alloc];
    -[HUEditUserViewController userItem](self, "userItem");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = -[HUPersonalRequestsEditorTableViewController initWithUserItem:onlyShowDeviceSwitches:](v129, "initWithUserItem:onlyShowDeviceSwitches:", v130, 0);

    -[HUEditUserViewController navigationController](self, "navigationController");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = (id)objc_msgSend(v132, "hu_pushPreloadableViewController:animated:", v131, 1);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "tvViewingProfilesItem");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v9, "isEqual:", v135);

  if (v136)
  {
    v137 = [HUTVViewingProfilesEditorTableViewController alloc];
    -[HUEditUserViewController userItem](self, "userItem");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = -[HUTVViewingProfilesEditorTableViewController initWithUserItem:](v137, "initWithUserItem:", v138);

    -[HUEditUserViewController navigationController](self, "navigationController");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = (id)objc_msgSend(v140, "hu_pushPreloadableViewController:animated:", v139, 1);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "updateListeningHistoryItem");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = objc_msgSend(v9, "isEqual:", v143);

  if (v144)
  {
    v145 = [HUUpdateListeningHistorySettingsViewController alloc];
    -[HUEditUserViewController userItem](self, "userItem");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = -[HUUpdateListeningHistorySettingsViewController initWithUserItem:](v145, "initWithUserItem:", v146);

    -[HUEditUserViewController navigationController](self, "navigationController");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = (id)objc_msgSend(v148, "hu_pushPreloadableViewController:animated:", v147, 1);

  }
}

void __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel butotn '%@' from the alert popup", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __62__HUEditUserViewController_tableView_didSelectRowAtIndexPath___block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[HUEditUserViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped commit button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_removeUser");
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;
  objc_super v18;

  v6 = a3;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reuseIdentifierForFooterViewInSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HUAboutResidentDeviceFooterViewReuseIdentifier")))
  {
    -[HUEditUserViewController _lazyAboutResidentDeviceFooterView](self, "_lazyAboutResidentDeviceFooterView");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = (id)v9;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30728]))
  {
    v17.receiver = self;
    v17.super_class = (Class)HUEditUserViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v17, sel_tableView_viewForFooterInSection_, v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)HUEditUserViewController;
  -[HUItemTableViewController tableView:viewForFooterInSection:](&v18, sel_tableView_viewForFooterInSection_, v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "messageTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textDragInteraction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", 1);

LABEL_10:
  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v6 = a3;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reuseIdentifierForFooterViewInSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HUAboutResidentDeviceFooterViewReuseIdentifier")))
  {
    -[HUEditUserViewController _lazyAboutResidentDeviceFooterView](self, "_lazyAboutResidentDeviceFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;

  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30728]))
  {
    v11 = *MEMORY[0x1E0CEBC10];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUEditUserViewController;
    -[HUItemTableViewController tableView:heightForFooterInSection:](&v14, sel_tableView_heightForFooterInSection_, v6, a4);
    v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = a3;
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier")) & 1) != 0)
  {
    v9 = 0.01;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUEditUserViewController;
    -[HUItemTableViewController tableView:heightForHeaderInSection:](&v12, sel_tableView_heightForHeaderInSection_, v6, a4);
    v9 = v10;
  }

  return v9;
}

- (id)childViewControllersToPreload
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HUEditUserViewController pendingAccessoriesViewController](self, "pendingAccessoriesViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)learnMoreLinkTapped:(id)a3
{
  void *v4;
  HUAboutResidentDeviceViewController *v5;

  v5 = -[HUAboutResidentDeviceViewController initWithStyle:]([HUAboutResidentDeviceViewController alloc], "initWithStyle:", 1);
  -[HUAboutResidentDeviceViewController setDelegate:](v5, "setDelegate:", self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[HUEditUserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
  -[HUEditUserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  id v39;
  BOOL v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUEditUserViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userBeingEdited");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeAccessControlForUser:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "hf_prettyDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v42 = "-[HUEditUserViewController switchCell:didTurnOn:]";
    v43 = 2112;
    v44 = v9;
    v45 = 2112;
    v46 = v16;
    v47 = 1024;
    v48 = v4;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch of %@ for %@ to be %{BOOL}d", buf, 0x26u);

  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allowEditingItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "isEqual:", v18);

  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F511A8;
    v39 = v14;
    v40 = v4;
    v21 = _Block_copy(aBlock);

  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)MEMORY[0x1E0D519C0];
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_2;
  v36[3] = &unk_1E6F55330;
  v23 = v21;
  v37 = v23;
  objc_msgSend(v22, "futureWithErrorOnlyHandlerAdapterBlock:", v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_3;
  v33[3] = &unk_1E6F55380;
  objc_copyWeak(&v35, (id *)buf);
  v25 = v11;
  v34 = v25;
  v26 = (id)objc_msgSend(v24, "addSuccessBlock:", v33);
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_5;
  v30[3] = &unk_1E6F52A58;
  v27 = v6;
  v31 = v27;
  v32 = v4;
  v28 = (id)objc_msgSend(v24, "addFailureBlock:", v30);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAdministratorAccess:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_4;
  v5[3] = &unk_1E6F55358;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v5, 0);

  objc_destroyWeak(&v7);
}

void __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didUpdateAccessControlForUser:", v5, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __49__HUEditUserViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, *MEMORY[0x1E0D30A10], 0, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HUAccessorySettingsItemModuleController *v7;
  void *v8;
  HUAccessorySettingsItemModuleController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUMediaServiceSettingsItemModuleController *v14;
  void *v15;
  void *v16;
  HUMediaServiceSettingsItemModuleController *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  -[HUEditUserViewController userSettingsItemModuleController](self, "userSettingsItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userSettingsItemModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    v7 = [HUAccessorySettingsItemModuleController alloc];
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSettingsItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUAccessorySettingsItemModuleController initWithModule:delegate:](v7, "initWithModule:delegate:", v8, self);
    -[HUEditUserViewController setUserSettingsItemModuleController:](self, "setUserSettingsItemModuleController:", v9);

  }
LABEL_5:
  -[HUEditUserViewController userSettingsItemModuleController](self, "userSettingsItemModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v10);

  -[HUEditUserViewController mediaServiceSettingsItemModuleController](self, "mediaServiceSettingsItemModuleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaServiceItemModule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [HUMediaServiceSettingsItemModuleController alloc];
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaServiceItemModule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HUItemModuleController initWithModule:](v14, "initWithModule:", v16);
    -[HUEditUserViewController setMediaServiceSettingsItemModuleController:](self, "setMediaServiceSettingsItemModuleController:", v17);

    -[HUEditUserViewController mediaServiceSettingsItemModuleController](self, "mediaServiceSettingsItemModuleController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);
    goto LABEL_8;
  }
LABEL_9:
  -[HUEditUserViewController mediaServiceSettingsItemModuleController](self, "mediaServiceSettingsItemModuleController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v18);

  return v3;
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30C80];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v15, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:](HUAccessorySettingsDetailsViewControllerFactory, "viewControllerForGroup:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditUserViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);

LABEL_6:
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__HUEditUserViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke;
  v12[3] = &unk_1E6F4D988;
  v10 = v9;
  v13 = v10;
  -[HUEditUserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, v6, v12);

  return v10;
}

uint64_t __98__HUEditUserViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  void *v18;
  int v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(id, void *);
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  void (**v44)(id, void *);
  id v45;
  _QWORD v46[4];
  id v47;
  HUEditUserViewController *v48;
  void (**v49)(id, void *);
  SEL v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  const __CFString *v55;
  _QWORD v56[3];

  v7 = a5;
  v56[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  if (!v11)
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ called with no settingItem"), v13);

  }
  objc_msgSend(v11, "settingKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D30750];
  v16 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D30750]);

  if (v16)
    v17 = !v7;
  else
    v17 = 1;
  if (!v17)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "home");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
    v56[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:", v38, self, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v40);
    goto LABEL_16;
  }
  objc_msgSend(v11, "settingKeyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D30730]);

  if (v19)
    v20 = !v7;
  else
    v20 = 1;
  if (!v20)
  {
    -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userSettingsItemModule");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessorySettingsItemProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "homeKitSettingsVendor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "settings");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "hf_accessorySettingAtKeyPath:", v15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    HFLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:]";
      v53 = 1024;
      v54 = v26;
      _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "(%s) isVoiceIDSetup = %{BOOL}d", buf, 0x12u);
    }

    if ((v26 & 1) != 0)
      goto LABEL_17;
    v28 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Title"), CFSTR("HUPlaybackInfluencesActivation_Alert_Title"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Description"), CFSTR("HUPlaybackInfluencesActivation_Alert_Description"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "alertControllerWithTitle:message:preferredStyle:", v29, v30, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Action_NotNow"), CFSTR("HUPlaybackInfluencesActivation_Alert_Action_NotNow"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
    v46[3] = &unk_1E6F553D0;
    v37 = v37;
    v47 = v37;
    v48 = self;
    v50 = a2;
    v33 = v12;
    v49 = v33;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 1, v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v34 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice"), CFSTR("HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_98;
    v43[3] = &unk_1E6F553F8;
    objc_copyWeak(&v45, (id *)buf);
    v44 = v33;
    objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v43);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "addAction:", v41);
    objc_msgSend(v39, "addAction:", v36);
    -[HUEditUserViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v39, 1, 0);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

    v40 = v47;
LABEL_16:

LABEL_17:
  }
  v12[2](v12, 0);

}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Not Now Action", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30730]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_94;
  v7[3] = &unk_1E6F553A8;
  v6 = v5;
  v8 = v6;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = *(id *)(a1 + 56);
  objc_msgSend(v6, "updateValue:completionHandler:", MEMORY[0x1E0C9AAA0], v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_destroyWeak(v9);

  objc_destroyWeak((id *)buf);
}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject editUserItemManager](WeakRetained, "editUserItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sectionIndexForDisplayedSectionIdentifier:", *MEMORY[0x1E0D30728]);

    -[NSObject itemManager](WeakRetained, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

    -[NSObject itemManager](WeakRetained, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "diffableDataSourceDisabled");

    if ((_DWORD)v8)
    {
      -[NSObject tableView](WeakRetained, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 5);
    }
    else
    {
      -[NSObject itemManager](WeakRetained, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemSectionForSectionIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[NSObject itemManager](WeakRetained, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadUIRepresentationForSections:withAnimation:", v14, 0);

    }
    goto LABEL_9;
  }
  HFLogForCategory();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v17 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, WeakRetained, OS_LOG_TYPE_DEFAULT, "(%s) Error [%@] setting value for setting [%@] to NO", buf, 0x20u);
  }
LABEL_10:

}

void __118__HUEditUserViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_98(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[HUEditUserViewController moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withComp"
          "letion:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped Identify Voice Action", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:", v6, WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);

}

- (void)moduleController:(id)a3 settingUpdatedForItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "settingKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D30750]);

    if (v11)
    {
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "sectionIndexForDisplayedSectionIdentifier:", *MEMORY[0x1E0D30780]);

      -[HUItemTableViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

      -[HUItemTableViewController itemManager](self, "itemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v16, "diffableDataSourceDisabled");

      if ((_DWORD)v14)
      {
        -[HUEditUserViewController tableView](self, "tableView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "reloadSections:withRowAnimation:", v18, 5);

      }
      else
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemSectionForSectionIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[HUItemTableViewController itemManager](self, "itemManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "reloadUIRepresentationForSections:withAnimation:", v22, 0);

        }
      }
    }
  }

}

- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  objc_msgSend(v5, "settingKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D30730]);

  if (!v6)
  {
    if (v8)
    {
      -[HUEditUserViewController userItem](self, "userItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "user");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentUser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isEqual:", v14) ^ 1;

      goto LABEL_13;
    }
LABEL_15:
    LOBYTE(v9) = 0;
    goto LABEL_16;
  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "settingKeyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D30750]);

    if (v16)
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "home");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 136315394;
        v25 = "-[HUEditUserViewController moduleController:shouldDisableItem:]";
        v26 = 1024;
        v27 = objc_msgSend(v19, "hf_hasRMVCapableAppleTV");
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "(%s) hasRMVCapableAppleTV = %{BOOL}d", (uint8_t *)&v24, 0x12u);

      }
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isUserBeingEditedTheDeviceUser");
        v24 = 136315394;
        v25 = "-[HUEditUserViewController moduleController:shouldDisableItem:]";
        v26 = 1024;
        v27 = v22;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "(%s) isUserBeingEditedTheDeviceUser = %{BOOL}d", (uint8_t *)&v24, 0x12u);

      }
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "hf_hasRMVCapableAppleTV"))
      {
        LOBYTE(v9) = 1;
        goto LABEL_14;
      }
      -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isUserBeingEditedTheDeviceUser") ^ 1;
LABEL_13:

LABEL_14:
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  LOBYTE(v9) = 1;
LABEL_16:

  return v9;
}

- (void)mediaServiceSettingsItemModuleController:(id)a3 didSelectMediaService:(id)a4
{
  id v5;
  HUMediaServiceTableViewController *v6;
  void *v7;
  void *v8;
  id v9;
  HUMediaServiceTableViewController *v10;

  v5 = a4;
  v6 = [HUMediaServiceTableViewController alloc];
  -[HUEditUserViewController userItem](self, "userItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUMediaServiceTableViewController initWithItem:mediaServiceItem:](v6, "initWithItem:mediaServiceItem:", v7, v5);

  -[HUEditUserViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

}

- (void)didSelectDefaultAccounts:(id)a3
{
  HUMediaServiceDefaultAccountsTableViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HUMediaServiceDefaultAccountsTableViewController *v12;

  v4 = [HUMediaServiceDefaultAccountsTableViewController alloc];
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaServiceItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultAccountsItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUMediaServiceDefaultAccountsTableViewController initWithItem:home:](v4, "initWithItem:home:", v7, v9);

  -[HUEditUserViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v12, 1);

}

- (void)_removeUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;

  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userBeingEdited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hf_currentUserIsAdministrator") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "hf_currentUserIsOwner");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditUserViewController pinCodeManager](self, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteUserPinCodeWithUser:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __39__HUEditUserViewController__removeUser__block_invoke;
  v34[3] = &unk_1E6F55420;
  v12 = v4;
  v35 = v12;
  v13 = v6;
  v36 = v13;
  objc_msgSend(v10, "recover:", v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObject:", v14);

  v15 = (void *)MEMORY[0x1E0D519C0];
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __39__HUEditUserViewController__removeUser__block_invoke_105;
  v30[3] = &unk_1E6F4DF30;
  v33 = v7;
  v16 = v13;
  v31 = v16;
  v17 = v12;
  v32 = v17;
  objc_msgSend(v15, "lazyFutureWithBlock:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  v24 = 3221225472;
  v25 = __39__HUEditUserViewController__removeUser__block_invoke_2;
  v26 = &unk_1E6F55498;
  v29 = v7;
  v27 = v16;
  v28 = v17;
  v20 = v17;
  v21 = v16;
  v22 = (id)objc_msgSend(v19, "addSuccessBlock:", &v23);
  -[HUUserTableViewController performRemovalAction:](self, "performRemovalAction:", v19, v23, v24, v25, v26);

}

id __39__HUEditUserViewController__removeUser__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[HUEditUserViewController _removeUser]_block_invoke";
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to remove user PIN Code before removing user (%@): %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D30A28];
    objc_msgSend(*(id *)(a1 + 32), "name", *MEMORY[0x1E0D305A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_errorWithCode:operation:options:", 78, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleError:", v13);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __39__HUEditUserViewController__removeUser__block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeUserWithoutConfirmation:completionHandler:", v3, v11);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D31430];
    v7 = a2;
    objc_msgSend(v6, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "removeHome:completionHandler:", v9, v10);
  }

}

void __39__HUEditUserViewController__removeUser__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__HUEditUserViewController__removeUser__block_invoke_3;
  v3[3] = &unk_1E6F55470;
  v6 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", v3, 0);

}

void __39__HUEditUserViewController__removeUser__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "home:didRemoveUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__HUEditUserViewController__removeUser__block_invoke_4;
    v8[3] = &unk_1E6F55448;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v6, "dispatchHomeManagerObserverMessage:sender:", v8, 0);

  }
}

uint64_t __39__HUEditUserViewController__removeUser__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeManager:didRemoveHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_lazyAboutResidentDeviceFooterView
{
  void *v3;
  HUAboutResidentDeviceFooterView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[HUAboutResidentDeviceFooterView initWithReuseIdentifier:]([HUAboutResidentDeviceFooterView alloc], "initWithReuseIdentifier:", CFSTR("HUAboutResidentDeviceFooterViewReuseIdentifier"));
    -[HUEditUserViewController setAboutResidentDeviceFooterView:](self, "setAboutResidentDeviceFooterView:", v4);

    -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[HUEditUserViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v9 = HUViewSizeSubclassForViewSize(v7, v8);

    v27[0] = &unk_1E7040FD8;
    v27[1] = &unk_1E7040FF0;
    v28[0] = &unk_1E70434E8;
    v28[1] = &unk_1E70434F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HUConstantFloatForViewSizeSubclass(v9, v10);

    -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessageInsets:", 0.0, v11, 0.0, v11);

    -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;

    -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    objc_msgSend(v18, "sizeThatFits:", v20, 10000.0);
    v22 = v21;
    v24 = v23;

    -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v15, v17, v22, v24);

  }
  -[HUEditUserViewController aboutResidentDeviceFooterView](self, "aboutResidentDeviceFooterView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  HUEditUserViewController *v15;
  HUEditUserViewController *v16;
  void *v17;
  void *v18;
  id v19;
  int v21;
  HUEditUserViewController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    -[HUEditUserViewController navigationController](self, "navigationController");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (HUEditUserViewController *)v13;
    else
      v15 = self;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "splashController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisplayDeviceType:", 6);

    objc_msgSend(v17, "setPresentingViewController:", v16);
    objc_msgSend(v17, "present");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "openURL:", v7);
  }

  return 0;
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUEditUserViewController;
  v8 = a5;
  v9 = a4;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v10, sel_itemManager_didUpdateResultsForItem_atIndexPath_, a3, v9, v8);
  -[HUEditUserViewController _handleUpdatedItem:atIndexPath:](self, "_handleUpdatedItem:atIndexPath:", v9, v8, v10.receiver, v10.super_class);

}

- (void)_handleUpdatedItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v21 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v21;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "settingKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D30750]);

  if (v11)
  {
    objc_msgSend(v21, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30178]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v9, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v15 == v17)
    {
      -[HUEditUserViewController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cellForRowAtIndexPath:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setOn:animated:", objc_msgSend(v20, "BOOLValue"), 1);

    }
  }

}

- (id)presentPinDetailsViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userBeingEdited");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditUserViewController pinCodeManager](self, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userPinCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke;
  v16[3] = &unk_1E6F531E8;
  objc_copyWeak(&v20, &location);
  v11 = v8;
  v17 = v11;
  v12 = v6;
  v18 = v12;
  v13 = v4;
  v19 = v13;
  v14 = (id)objc_msgSend(v10, "addSuccessBlock:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v10;
}

void __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  HUPinCodeDetailsViewController *v7;
  void *v8;
  HUPinCodeDetailsViewController *v9;
  HUPinCodeDetailsViewController *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke_2;
  v16[3] = &unk_1E6F531C0;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v5, *(_QWORD *)(a1 + 40), 0);
    v7 = [HUPinCodeDetailsViewController alloc];
    objc_msgSend(WeakRetained, "pinCodeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v7, "initWithItem:pinCodeManager:home:", v6, v8, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v10 = [HUPinCodeDetailsViewController alloc];
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "pinCodeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v10, "initWithItem:pinCodeManager:home:", v11, v6, *(_QWORD *)(a1 + 40));
  }

  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersLocksTitle"), CFSTR("HUUsersLocksTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeDetailsViewController setTitle:](v9, "setTitle:", v12);

  objc_msgSend(WeakRetained, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v9, 1);

}

uint64_t __59__HUEditUserViewController_presentPinDetailsViewController__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUEditUserViewController;
  -[HUItemTableViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v17, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, v10, v11, v12, v13);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__HUEditUserViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v14[3] = &unk_1E6F52988;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "na_each:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __88__HUEditUserViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleUpdatedItem:atIndexPath:", v3, v5);
}

- (id)presentDefaultAccountViewController
{
  HUMediaServiceDefaultAccountsTableViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUMediaServiceDefaultAccountsTableViewController *v9;
  void *v10;
  void *v11;

  v3 = [HUMediaServiceDefaultAccountsTableViewController alloc];
  -[HUEditUserViewController editUserItemManager](self, "editUserItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaServiceItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAccountsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUMediaServiceDefaultAccountsTableViewController initWithItem:home:](v3, "initWithItem:home:", v6, v8);

  -[HUEditUserViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUEditUserItemManager)editUserItemManager
{
  return self->_editUserItemManager;
}

- (HUPendingAccessoriesGridViewController)pendingAccessoriesViewController
{
  return self->_pendingAccessoriesViewController;
}

- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController
{
  return self->_userSettingsItemModuleController;
}

- (void)setUserSettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, a3);
}

- (HUMediaServiceSettingsItemModuleController)mediaServiceSettingsItemModuleController
{
  return self->_mediaServiceSettingsItemModuleController;
}

- (void)setMediaServiceSettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceSettingsItemModuleController, a3);
}

- (HUAboutResidentDeviceFooterView)aboutResidentDeviceFooterView
{
  return self->_aboutResidentDeviceFooterView;
}

- (void)setAboutResidentDeviceFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_aboutResidentDeviceFooterView, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_aboutResidentDeviceFooterView, 0);
  objc_storeStrong((id *)&self->_mediaServiceSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_pendingAccessoriesViewController, 0);
  objc_storeStrong((id *)&self->_editUserItemManager, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
