@implementation HUFaceRecognitionLibraryListViewController

- (HUFaceRecognitionLibraryListViewController)initWithHome:(id)a3
{
  id v4;
  HUFaceRecognitionLibraryListItemManager *v5;
  HUFaceRecognitionLibraryListViewController *v6;
  HUFaceRecognitionLibraryListViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUFaceRecognitionLibraryListItemManager initWithHome:delegate:]([HUFaceRecognitionLibraryListItemManager alloc], "initWithHome:delegate:", v4, 0);
  v21.receiver = self;
  v21.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v21, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listItemManager, v5);
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionViewControllerTitle"), CFSTR("HUFaceRecognitionViewControllerTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionLibraryListViewController setTitle:](v7, "setTitle:", v8);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "hf_allCameraProfiles", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "clipManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObservationForCameraClipManager:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (HUFaceRecognitionLibraryListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionLibraryListViewController.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionLibraryListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  -[HUItemTableViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstFastUpdateFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HUFaceRecognitionLibraryListViewController_viewDidAppear___block_invoke;
  v7[3] = &unk_1E6F52828;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

void __60__HUFaceRecognitionLibraryListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "listItemManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRecentsLimit:", -1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  -[HUItemTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAnalyticsEvent");

}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v15[3] = &unk_1E6F4E968;
  v18 = a5;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  HUFaceRecognitionKnownToHomeViewController *v2;
  void *v3;
  void *v4;
  HUFaceRecognitionKnownToHomeViewController *v5;
  void *v6;
  void *v7;
  HUFaceRecognitionKnownToHomeViewController *v8;
  void *v9;
  _QWORD v11[4];
  HUFaceRecognitionKnownToHomeViewController *v12;
  id v13;
  id v14;

  v2 = [HUFaceRecognitionKnownToHomeViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUFaceRecognitionKnownToHomeViewController initWithHome:](v2, "initWithHome:", v4);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2;
  v11[3] = &unk_1E6F55A78;
  v12 = v5;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFaceRecognitionPersonSettingsForPerson:personManager:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HUFaceRecognitionPersonEditorViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HUFaceRecognitionPersonEditorViewController *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  HUFaceRecognitionPersonEditorViewController *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "faceClassification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      v8 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      v11 = objc_alloc(MEMORY[0x1E0D313D0]);
      -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithSignificantEvent:home:", v10, v13);

      v15 = -[HUFaceRecognitionPersonEditorViewController initWithPersonLikeItem:]([HUFaceRecognitionPersonEditorViewController alloc], "initWithPersonLikeItem:", v14);
      -[HUFaceRecognitionPersonEditorViewController setDelegate:](v15, "setDelegate:", self);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "personManager");
      v30 = v7;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUFaceRecognitionLibraryListViewController navigationController](self, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hu_pushPreloadableViewController:animated:", v15, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __116__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
      v31[3] = &unk_1E6F5FA68;
      v32 = v19;
      v33 = v10;
      v34 = v15;
      v35 = v8;
      v22 = v15;
      v23 = v10;
      v24 = v19;
      objc_msgSend(v21, "flatMap:", v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v30;
    }
    else
    {
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v6;
        _os_log_error_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_ERROR, "No face classification for event %@; add person settings not supported",
          buf,
          0xCu);
      }

      v28 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "futureWithError:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    HFLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "No event provided; add person settings not supported",
        buf,
        2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

id __116__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personManagerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v4);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 48), "presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:animated:", *(_QWORD *)(a1 + 56), 1);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = objc_msgSend(a4, "section");
  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "knownToHomeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionLibrariesSection"));

    if (v7 != v12)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionSettingSwitchSection"));

      if (v7 != v14)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionRecentVisitorsSectionIdentifier"));

      }
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "setDelegate:", self);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v57.receiver = self;
  v57.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v57, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);
  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "knownToHomeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "isEqual:", v14);

  if (v15)
  {
    objc_opt_class();
    v16 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "setHideIcon:", 1);
    objc_msgSend(v11, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C98]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v16, "setAccessoryType:", v21 ^ 1u);
    if (v21)
      v22 = 0;
    else
      v22 = 3;
    objc_msgSend(v16, "setSelectionStyle:", v22);
LABEL_29:

    goto LABEL_30;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionLibrariesSection"));
  v25 = objc_msgSend(v12, "section");

  if (v24 == v25)
  {
    objc_opt_class();
    v26 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v18 = v27;

    -[HUItemTableViewController itemManager](self, "itemManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentUser");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "user");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    objc_msgSend(v10, "setAccessoryType:", v32);
    objc_msgSend(v10, "setUserInteractionEnabled:", v32);
    objc_opt_class();
    v33 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;

    if (v35)
      objc_msgSend(v35, "setHideIcon:", 1);

    goto LABEL_29;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionRecentVisitorsSectionIdentifier"));
  v38 = objc_msgSend(v12, "section");

  if (v37 == v38)
  {
    objc_opt_class();
    v39 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v18 = v40;

    objc_msgSend(v18, "setAvatarSize:", 44.0);
    objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latestResults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v41, "setText:", v43);
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonNameCellUnknownPerson"), CFSTR("HUFaceRecognitionPersonNameCellUnknownPerson"), 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v44);

    }
    objc_msgSend(v11, "latestResults");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setSecondaryText:", v46);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "secondaryTextProperties");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setColor:", v47);

    objc_msgSend(v11, "latestResults");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x1E0D30A90];
    objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A90]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v11, "latestResults");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setImage:", v53);

      objc_msgSend(v41, "imageProperties");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setCornerRadius:", 22.0);

      objc_msgSend(v41, "imageProperties");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setMaximumSize:", 44.0, 44.0);

      objc_msgSend(v41, "imageProperties");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setReservedLayoutSize:", 44.0, 44.0);

    }
    objc_msgSend(v39, "setContentConfiguration:", v41);
    objc_msgSend(v39, "setAccessoryType:", 1);

    goto LABEL_29;
  }
LABEL_30:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  HUFaceRecognitionKnownToHomeViewController *v15;
  void *v16;
  void *v17;
  HUFaceRecognitionPersonEditorViewController *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  HUFaceRecognitionUserPhotosLibrarySettingsViewController *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;

  v6 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v40, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "knownToHomeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    objc_msgSend(v8, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C98]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) == 0)
    {
      v15 = [HUFaceRecognitionKnownToHomeViewController alloc];
      -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HUFaceRecognitionKnownToHomeViewController initWithHome:](v15, "initWithHome:", v17);

LABEL_15:
      -[HUFaceRecognitionLibraryListViewController navigationController](self, "navigationController");
      v30 = (HUFaceRecognitionUserPhotosLibrarySettingsViewController *)objc_claimAutoreleasedReturnValue();
      v39 = (id)-[HUFaceRecognitionUserPhotosLibrarySettingsViewController hu_pushPreloadableViewController:animated:](v30, "hu_pushPreloadableViewController:animated:", v18, 1);
      goto LABEL_16;
    }
  }
  else
  {
    v19 = objc_msgSend(v6, "section");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionLibrariesSection"));

    if (v19 == v21)
    {
      objc_opt_class();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayedItemAtIndexPath:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v18 = v24;

      -[HUFaceRecognitionPersonEditorViewController user](v18, "user");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentUser");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v25, "isEqual:", v28);

      if (!v29)
        goto LABEL_17;
      v30 = -[HUFaceRecognitionUserPhotosLibrarySettingsViewController initWithUserPhotosLibraryItem:]([HUFaceRecognitionUserPhotosLibrarySettingsViewController alloc], "initWithUserPhotosLibraryItem:", v18);
      -[HUFaceRecognitionLibraryListViewController navigationController](self, "navigationController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (id)objc_msgSend(v31, "hu_pushPreloadableViewController:animated:", v30, 1);

LABEL_16:
LABEL_17:

      goto LABEL_18;
    }
    v33 = objc_msgSend(v6, "section");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionRecentVisitorsSectionIdentifier"));

    if (v33 == v35)
    {
      v36 = v8;
      if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EF347D90))
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      v18 = -[HUFaceRecognitionPersonEditorViewController initWithPersonLikeItem:]([HUFaceRecognitionPersonEditorViewController alloc], "initWithPersonLikeItem:", v38);
      -[HUFaceRecognitionPersonEditorViewController setDelegate:](v18, "setDelegate:", self);
      goto LABEL_15;
    }
  }
LABEL_18:

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v35;
  _QWORD v36[4];
  id v37;
  HUFaceRecognitionLibraryListViewController *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  HUFaceRecognitionLibraryListViewController *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  HUFaceRecognitionLibraryListViewController *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    v49 = 2112;
    v50 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "section");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionRecentVisitorsSectionIdentifier"));

  if (v8 == v10)
  {
    objc_opt_class();
    v11 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v11, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cameraProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clipManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      HULocalizedStringWithFormat(CFSTR("HUFaceRecognitionModuleDisassociatePersonSwipeActionFormat"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CEA4C0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke;
      v41[3] = &unk_1E6F5FAE0;
      v42 = v13;
      v43 = v17;
      v44 = self;
      objc_msgSend(v25, "contextualActionWithStyle:title:handler:", 1, v24, v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v42;
    }
    else
    {
      objc_msgSend(v11, "latestResults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E18]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "latestResults");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A88]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 || objc_msgSend(v28, "count"))
      {
        v35 = (void *)MEMORY[0x1E0CEA4C0];
        _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionModuleHideEventSwipeActionFormat"), CFSTR("HUFaceRecognitionModuleHideEventSwipeActionFormat"), 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_108;
        v36[3] = &unk_1E6F5FB30;
        v37 = v13;
        v38 = self;
        v39 = v11;
        v40 = v17;
        objc_msgSend(v35, "contextualActionWithStyle:title:handler:", 1, v32, v36);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
        v27 = (void *)MEMORY[0x1E0C9AA60];
      }
    }

    objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Marking event %@ as a misclassification", buf, 0xCu);

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_96;
  v13[3] = &unk_1E6F5FAB8;
  v14 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v15 = v10;
  v16 = v11;
  v17 = v5;
  v12 = v5;
  objc_msgSend(v8, "handleFaceMisclassificationForSignificantEvent:completion:", v9, v13);

}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to handle misclassification for significant event %@ (error: %@)", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_98;
    v14 = &unk_1E6F5FA90;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v6, "dispatchCameraObserverMessage:sender:", &v11, 0);

    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "event", v11, v12, v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Successfully marked event %@ misclassified", buf, 0xCu);

    }
    v5 = v15;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "listItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAnalyticsEvent");

}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_98(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipManager:didUpdateSignificantEvents:", v4, v6);

  }
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_108(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Hiding event %@", buf, 0xCu);

  }
  objc_msgSend(a1[5], "listItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_removePersonWithUUID:", v14);
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A88]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_removeFaceCropsWithUUIDs:", v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_109;
  v20[3] = &unk_1E6F5FB08;
  v21 = a1[4];
  v16 = a1[7];
  v17 = a1[5];
  v22 = v16;
  v23 = v17;
  v24 = v5;
  v18 = v5;
  v19 = (id)objc_msgSend(v15, "addCompletionBlock:", v20);

}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_109(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to handle removal/hiding for event %@ (error: %@)", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_110;
    v12[3] = &unk_1E6F5FA90;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v7, "dispatchCameraObserverMessage:sender:", v12, 0);

    v6 = v13;
  }

  (*(void (**)(_QWORD, BOOL, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4 != 0, v8, v9);
  objc_msgSend(*(id *)(a1 + 48), "listItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendAnalyticsEvent");

}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_110(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipManager:didUpdateSignificantEvents:", v4, v6);

  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  id *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  void (**v45)(void *, uint64_t);
  _QWORD v46[4];
  void (**v47)(void *, uint64_t);
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v50;
  id v51[2];
  id location[2];

  v4 = a4;
  v7 = a3;
  objc_initWeak(location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke;
  aBlock[3] = &unk_1E6F5FB58;
  objc_copyWeak(v51, location);
  v51[1] = (id)a2;
  v9 = v7;
  v50 = v9;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v4)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_allCameraProfilesWithSmartMotionRecordingEnabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v10[2](v10, 1);
      goto LABEL_9;
    }
    HFLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "No camera profiles meet requirements to enable face recognition.", buf, 2u);
    }

    v27 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertTitle"), CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertTitle"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertDescription"), CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertDescription"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v28, v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertActionDismiss"), CFSTR("HUFaceRecognitionItemModuleControllerEnableRequirementAlertActionDismiss"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v8;
    v46[1] = 3221225472;
    v46[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_123;
    v46[3] = &unk_1E6F55070;
    v47 = v10;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 0, v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v32);

    -[HUFaceRecognitionLibraryListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    v25 = (id *)&v47;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertTitle"), CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertDescription"), CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertDescription"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertActionDisable"), CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertActionDisable"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v8;
    v44[1] = 3221225472;
    v44[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2_131;
    v44[3] = &unk_1E6F55070;
    v45 = v10;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 2, v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v21);

    v22 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertActionCancel"), CFSTR("HUFaceRecognitionItemModuleControllerConfirmationAlertActionCancel"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v8;
    v42[1] = 3221225472;
    v42[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3_134;
    v42[3] = &unk_1E6F4C6E0;
    v43 = v9;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v24);

    -[HUFaceRecognitionLibraryListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    v25 = (id *)&v45;

  }
LABEL_9:
  -[HUFaceRecognitionLibraryListViewController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "indexPathForCell:", v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "displayedItemAtIndexPath:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "latestResults");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0D30D20];
  objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0D30D20]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v36, "latestResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D31170], "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v36, v4, v41, self);

  objc_destroyWeak(v51);
  objc_destroyWeak(location);

}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  char v14;
  _QWORD v15[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_setFaceRecognitionEnabled:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2;
  v15[3] = &unk_1E6F4C150;
  v9 = *(_QWORD *)(a1 + 48);
  v15[4] = WeakRetained;
  v15[5] = v9;
  objc_msgSend(v7, "addSuccessBlock:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3;
  v12[3] = &unk_1E6F52A58;
  v14 = a2;
  v13 = *(id *)(a1 + 32);
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", v12);

}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "listItemManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error setting face recognition to %d: %@", (uint8_t *)v6, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2_131(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3_134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", 1, 1);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
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
  int v26;
  HUFaceRecognitionLibraryListViewController *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v26, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "hf_faceRecognitionPrivacyURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D651A8]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreTitle"), CFSTR("HUFaceRecognitionLearnMoreTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:detailText:symbolName:contentLayout:", v12, 0, 0, 2);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreUseSectionTitle"), CFSTR("HUFaceRecognitionLearnMoreUseSectionTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreUseSectionBody"), CFSTR("HUFaceRecognitionLearnMoreUseSectionBody"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSectionWithHeader:content:", v14, v15);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMorePhotoSectionTitle"), CFSTR("HUFaceRecognitionLearnMorePhotoSectionTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMorePhotoSectionBody"), CFSTR("HUFaceRecognitionLearnMorePhotoSectionBody"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSectionWithHeader:content:", v16, v17);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreVisibilitySectionBody"), CFSTR("HUFaceRecognitionLearnMoreVisibilitySectionBody"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSectionWithHeader:content:", 0, v18);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreAnalysisSectionTitle"), CFSTR("HUFaceRecognitionLearnMoreAnalysisSectionTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLearnMoreAnalysisSectionBody"), CFSTR("HUFaceRecognitionLearnMoreAnalysisSectionBody"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSectionWithHeader:content:", v19, v20);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:forState:", v22, 0);

    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_dismissTextViewController, 64);
    objc_msgSend(v13, "buttonTray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addButton:", v21);

    -[HUFaceRecognitionLibraryListViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentViewController:animated:completion:", v13, 1, 0);

  }
  return 0;
}

- (void)dismissTextViewController
{
  id v2;

  -[HUFaceRecognitionLibraryListViewController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2544A8))
    v6 = v14;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchingItemForHomeKitObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "updateResultsForItems:senderSelector:", v12, a2);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUFaceRecognitionLibraryListViewController listItemManager](self, "listItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "hf_allCameraProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "clipManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObservationForCameraClipManager:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  -[HUFaceRecognitionLibraryListViewController dealloc](&v12, sel_dealloc);
}

- (HUFaceRecognitionLibraryListItemManager)listItemManager
{
  return self->_listItemManager;
}

- (void)setListItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_listItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItemManager, 0);
}

@end
