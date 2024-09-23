@implementation HUAccessoryDiagnosticsViewController

- (HUAccessoryDiagnosticsViewController)initWithSourceItem:(id)a3
{
  id v4;
  HUAccessoryDiagnosticsItemManager *v5;
  HUAccessoryDiagnosticsViewController *v6;
  HUAccessoryDiagnosticsViewController *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[HUAccessoryDiagnosticsItemManager initWithDelegate:sourceItem:]([HUAccessoryDiagnosticsItemManager alloc], "initWithDelegate:sourceItem:", self, v4);

  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryDiagnosticsViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
  {
    -[HUAccessoryDiagnosticsViewController setAccessoryLogsItemManager:](v6, "setAccessoryLogsItemManager:", v5);
    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v7, "setAutomaticallyUpdatesViewControllerTitle:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsTitle"), CFSTR("HUAccessoryDiagnosticsTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDiagnosticsViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;

  v5 = a3;
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchManufacturerSnapshotButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v7) & 1) != 0)
    goto LABEL_4;
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchADKSnapshotButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v9) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchMatterSnapshotButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logCollectionFailedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "isEqual:", v16);

    if ((v17 & 1) == 0)
    {
      -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enableVerboseLoggingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", v7) & 1) == 0)
      {
        -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "enableAudioClipLoggingItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "isEqual:", v19);

        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
LABEL_5:
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v6 = a6;
  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryDiagnosticsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v13, sel_updateCell_forItem_indexPath_animated_, v10, a4, a5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setHideIcon:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShowSpinner:", objc_msgSend(v12, "collectionInProgress"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setDelegate:", self);
    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUAccessoryDiagnosticsViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v36, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v36.receiver, v36.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchManufacturerSnapshotButtonItem");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9 == (void *)v11)
    goto LABEL_9;
  v13 = (void *)v11;
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchADKSnapshotButtonItem");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v15)
  {

    v12 = v13;
LABEL_9:

    goto LABEL_10;
  }
  v16 = (void *)v15;
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchMatterSnapshotButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v18)
  {
    -[HUAccessoryDiagnosticsViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cellForRowAtIndexPath:", v6);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v21 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    -[HUAccessoryDiagnosticsViewController showShareSheetForItem:withAnchorView:](self, "showShareSheetForItem:withAnchorView:", v23, v20);
    goto LABEL_20;
  }
LABEL_10:
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v20 = v25;

  objc_msgSend(v20, "sourceAccessory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v26, "hf_isDirectlyReachable"))
  {
    objc_msgSend(v20, "sourceAccessory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "supportsCHIP") & 1) != 0)
    {
      objc_msgSend(v20, "sourceAccessory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isReachable");

      if (v29)
        goto LABEL_17;
    }
    else
    {

    }
    v30 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryUnreachableAlertTitle"), CFSTR("HUAccessoryUnreachableAlertTitle"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryUnreachableAlertMessage"), CFSTR("HUAccessoryUnreachableAlertMessage"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "alertControllerWithTitle:message:preferredStyle:", v31, v32, 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v35);

    -[HUAccessoryDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
LABEL_20:

    goto LABEL_21;
  }

LABEL_17:
  -[HUAccessoryDiagnosticsViewController generateNewLogs:](self, "generateNewLogs:", v9);
LABEL_21:

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  BOOL v30;
  id location;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enableVerboseLoggingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "setVerboseLoggingEnabled:", v4);

  }
  else
  {
    objc_msgSend(v11, "enableAudioClipLoggingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "isEqual:", v13);

    if (v14)
    {
      if (v4)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsAudioClipAlertTitle"), CFSTR("HUAccessoryDiagnosticsAudioClipAlertTitle"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsAudioClipAlertMessage"), CFSTR("HUAccessoryDiagnosticsAudioClipAlertMessage"), 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v17 = (void *)MEMORY[0x1E0CEA2E0];
        _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke;
        v28[3] = &unk_1E6F5E7F0;
        objc_copyWeak(&v29, &location);
        v30 = v4;
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAction:", v20);

        v21 = (void *)MEMORY[0x1E0CEA2E0];
        _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v19;
        v26[1] = 3221225472;
        v26[2] = __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke_2;
        v26[3] = &unk_1E6F4C6E0;
        v27 = v6;
        objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAction:", v23);

        -[HUAccessoryDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);

      }
      else
      {
        -[HUAccessoryDiagnosticsViewController accessoryLogsItemManager](self, "accessoryLogsItemManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAudioClipLoggingEnabled:", 0);

      }
    }
  }

}

void __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessoryLogsItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAudioClipLoggingEnabled:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", 0, 1);
}

- (void)showShareSheetForItem:(id)a3 withAnchorView:(id)a4
{
  id v6;
  id v7;
  HUSendDiagnosticsToManufacturerActivity *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEligibleForUpload"))
  {
    v8 = -[HUSendDiagnosticsToManufacturerActivity initWithDiagnosticItem:]([HUSendDiagnosticsToManufacturerActivity alloc], "initWithDiagnosticItem:", v6);
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  objc_msgSend(v6, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v12, v9);

  objc_msgSend(v13, "setCompletionWithItemsHandler:", &__block_literal_global_262);
  objc_msgSend(v13, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceView:", v7);

  objc_msgSend(v7, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v13, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  -[HUAccessoryDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

void __77__HUAccessoryDiagnosticsViewController_showShareSheetForItem_withAnchorView___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = v7;
    v12 = 1024;
    v13 = a3;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Finished export activity for activityType:%@ completed:%{BOOL}d with error:%@", (uint8_t *)&v10, 0x1Cu);
  }

}

- (void)generateNewLogs:(id)a3
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
  id v14;

  v4 = a3;
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v14 = v6;

  objc_msgSend(v14, "beginDiagnosticCollection:", v4);
  v7 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsAlertTitle"), CFSTR("HUAccessoryDiagnosticsAlertTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsAlertMessage"), CFSTR("HUAccessoryDiagnosticsAlertMessage"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v13);

  -[HUAccessoryDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (HUAccessoryDiagnosticsItemManager)accessoryLogsItemManager
{
  return (HUAccessoryDiagnosticsItemManager *)objc_loadWeakRetained((id *)&self->_accessoryLogsItemManager);
}

- (void)setAccessoryLogsItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryLogsItemManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryLogsItemManager);
}

@end
