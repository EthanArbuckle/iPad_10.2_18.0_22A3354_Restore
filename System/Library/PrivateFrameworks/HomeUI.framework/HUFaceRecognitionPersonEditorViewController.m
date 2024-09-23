@implementation HUFaceRecognitionPersonEditorViewController

- (HUFaceRecognitionPersonEditorViewController)initWithPersonLikeItem:(id)a3
{
  id v4;
  HUFaceRecognitionPersonEditorItemManager *v5;
  void *v6;
  HUFaceRecognitionPersonEditorItemManager *v7;
  HUFaceRecognitionPersonEditorViewController *v8;
  HUFaceRecognitionPersonEditorViewController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v5 = [HUFaceRecognitionPersonEditorItemManager alloc];
  v6 = (void *)objc_msgSend(v4, "copy");
  v7 = -[HUFaceRecognitionPersonEditorItemManager initWithDelegate:sourceItem:](v5, "initWithDelegate:sourceItem:", self, v6);

  v15.receiver = self;
  v15.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_personItemManager, v7);
    objc_msgSend(v4, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;

    }
    else
    {
      objc_msgSend(v4, "person");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionPersonEditorViewControllerTitleUnknownPerson"), CFSTR("HUFaceRecognitionPersonEditorViewControllerTitleUnknownPerson"), 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[HUFaceRecognitionPersonEditorViewController setTitle:](v9, "setTitle:", v12);

    v9->_shouldUpdateDelegate = 0;
  }

  return v9;
}

- (HUFaceRecognitionPersonEditorViewController)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HUFaceRecognitionPersonEditorViewController *v13;

  v8 = (objc_class *)MEMORY[0x1E0D31620];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithPerson:fromPersonManager:home:", v11, v10, v9);

  v13 = -[HUFaceRecognitionPersonEditorViewController initWithPersonLikeItem:](self, "initWithPersonLikeItem:", v12);
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  -[HUItemTableViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  -[HUFaceRecognitionPersonEditorViewController delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[HUFaceRecognitionPersonEditorViewController shouldUpdateDelegate](self, "shouldUpdateDelegate");

    if (v6)
    {
      -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "personItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0D30918];
      v15[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateWithOptions:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__HUFaceRecognitionPersonEditorViewController_viewWillDisappear___block_invoke;
      v12[3] = &unk_1E6F5D840;
      v12[4] = self;
      v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

    }
  }
}

void __65__HUFaceRecognitionPersonEditorViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "personItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personEditorViewController:didUpdateItem:", v2, v4);

}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v5, "length") != 0;
  return (char)v2;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceCropItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nameItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v5)
    {
      -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hideNotificationsItem");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 != v5)
      {
        -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deleteItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v13))
        {
          -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addNameItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "isEqual:", v15);

        }
      }
    }
  }
  objc_opt_class();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;

  v24 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "setDelegate:", self);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v24, "setSelectionStyle:", 0);
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqual:", v12);

  if (v13)
  {
    objc_opt_class();
    v14 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    v17 = v16;
    v18 = 1;
LABEL_18:
    objc_msgSend(v17, "setDestructive:", v18);

    goto LABEL_19;
  }
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addNameItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v7, "isEqual:", v20);

  if (v21)
  {
    objc_opt_class();
    v22 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v16 = v23;

    v17 = v16;
    v18 = 0;
    goto LABEL_18;
  }
LABEL_19:

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v23, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    objc_opt_class();
    v14 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v11, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D28]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPlaceholder:", v18);

    objc_msgSend(v11, "latestResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)v9;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hideNotificationsItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v12)
  {

    goto LABEL_7;
  }
  v13 = (void *)v12;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "faceCropItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v15)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  v16 = v5;
LABEL_9:

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v24, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    -[HUFaceRecognitionPersonEditorViewController _deletePerson](self, "_deletePerson");
  }
  else
  {
    -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addNameItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "isEqual:", v14);

    if (v15)
    {
      -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sourceItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "latestResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
      {
        -[HUFaceRecognitionPersonEditorViewController _presentAddPersonViewController](self, "_presentAddPersonViewController");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v21, "openURL:", v22);

      }
    }
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  -[HUItemTableViewController itemManager:didUpdateResultsForSourceItem:](&v13, sel_itemManager_didUpdateResultsForSourceItem_, a3, v6);
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "Source item has determined it needs to hide: %@. Dismissing.", buf, 0xCu);
    }

    -[HUFaceRecognitionPersonEditorViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

  }
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
  int v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;

  v4 = a4;
  v6 = a3;
  -[HUFaceRecognitionPersonEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hideNotificationsItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {
    -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "personItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = !v4;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "personSettingsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "latestResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E18]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__HUFaceRecognitionPersonEditorViewController_switchCell_didTurnOn___block_invoke;
    v23[3] = &unk_1E6F5D868;
    v24 = v15;
    v26 = v4;
    v25 = v6;
    v27 = !v4;
    v22 = v15;
    objc_msgSend(v19, "updateClassificationNotificationsEnabled:forPersonWithUUID:completion:", v16, v21, v23);

  }
}

void __68__HUFaceRecognitionPersonEditorViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  _BYTE v8[22];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)v8 = 138412802;
      *(_QWORD *)&v8[4] = v5;
      if (v6)
        v7 = CFSTR("ON");
      else
        v7 = CFSTR("OFF");
      *(_WORD *)&v8[12] = 2112;
      *(_QWORD *)&v8[14] = v7;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Update for person %@ disable notification setting %@ failed with error %@", v8, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setOn:", *(_BYTE *)(a1 + 49) == 0, *(_OWORD *)v8);
  }

}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D319D0];
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sanitizeUserEnteredHomeKitName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length") || !v8)
  {
    if (objc_msgSend(v11, "length"))
    {
      -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "personItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "personManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "person");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_namePerson:name:", v15, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke;
      v21[3] = &unk_1E6F4D1B0;
      v22 = v4;
      v23 = v8;
      objc_msgSend(v16, "addFailureBlock:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v17;
      v20[1] = 3221225472;
      v20[2] = __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke_2;
      v20[3] = &unk_1E6F5D890;
      v20[4] = self;
      v19 = (id)objc_msgSend(v18, "addSuccessBlock:", v20);

    }
  }
  else
  {
    objc_msgSend(v4, "setText:", v8);
  }

}

void __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:", v4);

}

uint64_t __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateDelegate:", 1);
}

- (void)_deletePerson
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
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "personManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_removePersonWithUUID:", v8);
  }
  else
  {
    objc_msgSend(v4, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_removeFaceCropsWithUUIDs:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke;
  v15 = &unk_1E6F4F4D0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "addSuccessBlock:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_248, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

void __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (void)_presentAddPersonViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HUFaceRecognitionAddPersonViewController *v8;
  void *v9;
  void *v10;
  HUFaceRecognitionAddPersonViewController *v11;
  void *v12;
  id v13;
  id v14;

  objc_opt_class();
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v14 = v5;

  v6 = v14;
  if (v14)
  {
    objc_msgSend(v14, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [HUFaceRecognitionAddPersonViewController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUFaceRecognitionAddPersonViewController initWithSignificantEvent:home:](v8, "initWithSignificantEvent:home:", v7, v10);

    -[HUFaceRecognitionAddPersonViewController setDelegate:](v11, "setDelegate:", self);
    -[HUFaceRecognitionPersonEditorViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);

    v6 = v14;
  }

}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  HUFaceRecognitionPersonEditorViewController *v12;

  v5 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__HUFaceRecognitionPersonEditorViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
  v10[3] = &unk_1E6F55A28;
  v11 = v5;
  v12 = self;
  v7 = v5;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __117__HUFaceRecognitionPersonEditorViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HUFaceRecognitionAddPersonViewController *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HUFaceRecognitionAddPersonViewController *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "faceClassification");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "person");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (!v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "itemManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "home");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v17, "personManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "personManagerUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend(v14, "isEqual:", v19);

        if ((v17 & 1) != 0)
        {
          v20 = [HUFaceRecognitionAddPersonViewController alloc];
          v21 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "itemManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "home");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HUFaceRecognitionAddPersonViewController initWithSignificantEvent:home:](v20, "initWithSignificantEvent:home:", v21, v23);

          objc_msgSend(*(id *)(a1 + 40), "navigationController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hu_pushPreloadableViewController:animated:", v24, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          HFLogForCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v29 = *(_QWORD *)(a1 + 32);
            v30 = 138412546;
            v31 = v4;
            v32 = 2112;
            v33 = v29;
            _os_log_error_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_ERROR, "Face classification %@ for event %@ contains an unnamed person from the photo library; name must be added inside Photos",
              (uint8_t *)&v30,
              0x16u);
          }

          v27 = (void *)MEMORY[0x1E0D519C0];
          objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
          v24 = (HUFaceRecognitionAddPersonViewController *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "futureWithError:", v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_18;
      }
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v4, "person");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v4;
        v32 = 2112;
        v33 = v9;
        v34 = 2112;
        v35 = v10;
        _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Face classification %@ for event %@ already contains tagged person %@; add person settings not supported",
          (uint8_t *)&v30,
          0x20u);

      }
    }
    else
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v28 = *(void **)(a1 + 32);
        v30 = 138412290;
        v31 = v28;
        _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "No face classification for event %@; add person settings not supported",
          (uint8_t *)&v30,
          0xCu);
      }
    }

    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    return v15;
  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v30) = 0;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "No event provided; add person settings not supported",
      (uint8_t *)&v30,
      2u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addPersonViewControllerDidFinish:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[HUFaceRecognitionPersonEditorViewController setShouldUpdateDelegate:](self, "setShouldUpdateDelegate:", 1);
  -[HUFaceRecognitionPersonEditorViewController personItemManager](self, "personItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D30918];
  v12[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HUFaceRecognitionPersonEditorViewController_addPersonViewControllerDidFinish___block_invoke;
  v10[3] = &unk_1E6F5D8D8;
  v10[4] = self;
  v10[5] = a2;
  v9 = (id)objc_msgSend(v8, "addSuccessBlock:", v10);

}

void __80__HUFaceRecognitionPersonEditorViewController_addPersonViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "personItemManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

}

- (HUFaceRecognitionPersonEditorViewControllerDelegate)delegate
{
  return (HUFaceRecognitionPersonEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUFaceRecognitionPersonEditorItemManager)personItemManager
{
  return self->_personItemManager;
}

- (void)setPersonItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_personItemManager, a3);
}

- (BOOL)shouldUpdateDelegate
{
  return self->_shouldUpdateDelegate;
}

- (void)setShouldUpdateDelegate:(BOOL)a3
{
  self->_shouldUpdateDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItemManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
