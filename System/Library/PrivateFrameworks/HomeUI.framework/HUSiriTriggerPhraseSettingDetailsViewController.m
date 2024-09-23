@implementation HUSiriTriggerPhraseSettingDetailsViewController

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessorySettingItem:(id)a3
{
  id v4;
  HUSiriTriggerPhraseSettingDetailsItemManager *v5;
  void *v6;
  HUSiriTriggerPhraseSettingDetailsViewController *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[HUSiriTriggerPhraseSettingDetailsItemManager initWithSourceItem:delegate:]([HUSiriTriggerPhraseSettingDetailsItemManager alloc], "initWithSourceItem:delegate:", v4, self);

  -[HUSiriTriggerPhraseSettingDetailsViewController setSiriSettingsDetailsItemManager:](self, "setSiriSettingsDetailsItemManager:", v5);
  -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v6, 1);

  if (v7)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriTriggerPhraseSelectionDetails_Title"), CFSTR("HUSiriTriggerPhraseSelectionDetails_Title"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriTriggerPhraseSettingDetailsViewController setTitle:](v7, "setTitle:", v8);

    -[HUSiriTriggerPhraseSettingDetailsViewController _commonInit](v7, "_commonInit");
  }
  return v7;
}

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithHome:(id)a3 delegate:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  HUSiriTriggerPhraseSettingDetailsItemManager *v10;
  void *v11;
  HUSiriTriggerPhraseSettingDetailsViewController *v12;
  objc_super v14;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D31418];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithHome:", v8);

  v10 = -[HUSiriTriggerPhraseSettingDetailsItemManager initWithSourceItem:delegate:]([HUSiriTriggerPhraseSettingDetailsItemManager alloc], "initWithSourceItem:delegate:", v9, self);
  -[HUSiriTriggerPhraseSettingDetailsViewController setSiriSettingsDetailsItemManager:](self, "setSiriSettingsDetailsItemManager:", v10);

  -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v14, sel_initWithItemManager_tableViewStyle_, v11, 1);

  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v6);
    -[HUSiriTriggerPhraseSettingDetailsViewController _commonInit](v12, "_commonInit");
  }

  return v12;
}

- (void)_commonInit
{
  id v3;

  self->_selectedSiriTriggerPhraseIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_inProgressTriggerPhraseUpdateIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](self, "setAutomaticallyUpdatesViewControllerTitle:", 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriTriggerPhraseSelectionDetails_Title"), CFSTR("HUSiriTriggerPhraseSelectionDetails_Title"), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSiriTriggerPhraseSettingDetailsViewController setTitle:](self, "setTitle:", v3);

}

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessoryGroupItem:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSiriTriggerPhraseSettingDetailsViewController.m"), 76, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSiriTriggerPhraseSettingDetailsViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  v30 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v30;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  v13 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v13, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D30DA0];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue") ? 3 : 0;
    objc_msgSend(v30, "setAccessoryType:", v19);

    objc_msgSend(v13, "latestResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
      -[HUSiriTriggerPhraseSettingDetailsViewController setSelectedSiriTriggerPhraseIndex:](self, "setSelectedSiriTriggerPhraseIndex:", objc_msgSend(v10, "row"));
  }
  if (v12)
    objc_msgSend(v12, "setDelegate:", self);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "titleForSection:", objc_msgSend(v10, "section"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3940];
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6F60E80);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.SectionHeader-%@"), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityIdentifier:", v29);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  v12 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v15, sel_updateCell_forItem_indexPath_animated_, v10, v12, v11, v6);
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
  {
    v13 = objc_msgSend(v11, "row", v15.receiver, v15.super_class);
    if (v13 == -[HUSiriTriggerPhraseSettingDetailsViewController inProgressTriggerPhraseUpdateIndex](self, "inProgressTriggerPhraseUpdateIndex"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v14, "startAnimating");
      objc_msgSend(v10, "setAccessoryView:", v14);

    }
    else
    {
      objc_msgSend(v10, "setAccessoryView:", 0);
    }
  }

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HUSiriTriggerPhraseSettingDetailsViewController *v23;
  BOOL v24;

  v4 = a4;
  v6 = a3;
  -[HUSiriTriggerPhraseSettingDetailsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "sourceItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = &unk_1EF2AC1D8;
  if (objc_msgSend(v14, "conformsToProtocol:", v15))
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke;
  v20[3] = &unk_1E6F555F8;
  v21 = v6;
  v22 = v17;
  v24 = v4;
  v23 = self;
  v18 = v17;
  v19 = v6;
  -[HUSiriTriggerPhraseSettingDetailsViewController _preflightCheckToAllowSwitchingSiriTriggerForMediaItem:changingToOn:withCompletion:](self, "_preflightCheckToAllowSwitchingSiriTriggerForMediaItem:changingToOn:withCompletion:", v18, v4, v20);

}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check for Allow HS before changing...", buf, 0x16u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_79;
    v16[3] = &unk_1E6F555D0;
    v17 = *(id *)(a1 + 40);
    v20 = *(_BYTE *)(a1 + 56);
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v18 = v8;
    v19 = v9;
    v10 = (id)objc_msgSend(v3, "addSuccessBlock:", v16);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_2;
    v12[3] = &unk_1E6F53170;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 56);
    v11 = (id)objc_msgSend(v3, "addFailureBlock:", v12);

  }
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(v3, "BOOLValue"))
      v6 = CFSTR("passed");
    else
      v6 = CFSTR("failed");
    v7 = objc_msgSend(v3, "BOOLValue");
    v8 = CFSTR("NOT CHANGING");
    v9 = *(unsigned __int8 *)(a1 + 56);
    if (v7)
      v8 = CFSTR("CHANGING");
    v10 = CFSTR("ON");
    *(_DWORD *)buf = 138413058;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    if (!v9)
      v10 = CFSTR("OFF");
    v24 = v8;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", buf, 0x2Au);
  }

  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSiriDisabled:", *(_BYTE *)(a1 + 56) == 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_92;
    v16[3] = &unk_1E6F52A58;
    v17 = *(id *)(a1 + 40);
    v18 = *(_BYTE *)(a1 + 56);
    v13 = (id)objc_msgSend(v11, "addFailureBlock:", v16);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_94;
    v15[3] = &unk_1E6F4E2B0;
    v15[4] = *(_QWORD *)(a1 + 48);
    v14 = (id)objc_msgSend(v11, "addSuccessBlock:", v15);

  }
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 40) == 0);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Allow Hey Siri Setting FAILED to update with value %{BOOL}d. Reverting UI state.", (uint8_t *)v6, 8u);
  }

}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_94(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didUpdateSiriTriggerPhraseSetting");

    }
  }
}

uint64_t __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  v8 = -[HUSiriTriggerPhraseSettingDetailsViewController selectedSiriTriggerPhraseIndex](self, "selectedSiriTriggerPhraseIndex");
  if (v8 != objc_msgSend(v7, "row"))
  {
    -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateSiriTriggerPhrase:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSiriTriggerPhraseSettingDetailsViewController setInProgressTriggerPhraseUpdateIndex:](self, "setInProgressTriggerPhraseUpdateIndex:", objc_msgSend(v7, "row"));
    -[HUSiriTriggerPhraseSettingDetailsViewController setSelectedSiriTriggerPhraseIndex:](self, "setSelectedSiriTriggerPhraseIndex:", objc_msgSend(v7, "row"));
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[HUSiriTriggerPhraseSettingDetailsViewController tableView:didSelectRowAtIndexPath:]";
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s User Tapped [%@]", buf, 0x16u);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__HUSiriTriggerPhraseSettingDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_1E6F4C610;
    v16[4] = self;
    v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v16);

  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

void __85__HUSiriTriggerPhraseSettingDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearSpinner");
  if (!a3 && objc_msgSend(v5, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "_updateFooterText");

}

- (void)_preflightCheckToAllowSwitchingSiriTriggerForMediaItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HUSiriTriggerPhraseSettingDetailsViewController *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v6 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isSiriEndpointAccessory") && v6)
  {
    objc_msgSend(v8, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "hf_siriEndpointProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentAssistant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v13;
      v47 = 1024;
      v48 = objc_msgSend(v13, "isSiriAssistant");
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "currentAssistant = %@, currentAssistant.isSiriAssistant = %{BOOL}d", buf, 0x12u);
    }

    if (v13 && (objc_msgSend(v13, "isSiriAssistant") & 1) == 0)
    {
      v40 = self;
      HFLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v13;
        _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      objc_msgSend(v13, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertTitle"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertMessage"), CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15, v39, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle"), CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle"), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke;
      v43[3] = &unk_1E6F55070;
      v34 = v9;
      v44 = v34;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v43);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addAction:", v35);

      v36 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke_2;
      v41[3] = &unk_1E6F55070;
      v42 = v34;
      objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, v41);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addAction:", v38);

      -[HUSiriTriggerPhraseSettingDetailsViewController presentViewController:animated:completion:](v40, "presentViewController:animated:completion:", v31, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }

}

void __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 37);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

- (void)_clearSpinner
{
  -[HUSiriTriggerPhraseSettingDetailsViewController setInProgressTriggerPhraseUpdateIndex:](self, "setInProgressTriggerPhraseUpdateIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)_updateFooterText
{
  void *v3;
  id v4;

  -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recalculateVisibilityAndSortAllItems");

  -[HUSiriTriggerPhraseSettingDetailsViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)setInProgressTriggerPhraseUpdateIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  int64_t inProgressTriggerPhraseUpdateIndex;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];

  if (self->_inProgressTriggerPhraseUpdateIndex != a3)
  {
    v17 = (id)objc_opt_new();
    -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayedItemsInSection:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    inProgressTriggerPhraseUpdateIndex = self->_inProgressTriggerPhraseUpdateIndex;
    if (inProgressTriggerPhraseUpdateIndex != 0x7FFFFFFFFFFFFFFFLL && inProgressTriggerPhraseUpdateIndex < v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v10);

    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v7 > a3)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v11);

    }
    self->_inProgressTriggerPhraseUpdateIndex = a3;
    if (objc_msgSend(v17, "count"))
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "diffableDataSourceDisabled");

      if (v13)
      {
        -[HUSiriTriggerPhraseSettingDetailsViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v17, 5);

      }
      else
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __89__HUSiriTriggerPhraseSettingDetailsViewController_setInProgressTriggerPhraseUpdateIndex___block_invoke;
        v18[3] = &unk_1E6F52650;
        v18[4] = self;
        objc_msgSend(v17, "na_map:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSiriTriggerPhraseSettingDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reloadUIRepresentationForItems:withAnimation:", v15, 0);

      }
    }

  }
}

id __89__HUSiriTriggerPhraseSettingDetailsViewController_setInProgressTriggerPhraseUpdateIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUSiriTriggerPhraseSettingDetailsItemManager)siriSettingsDetailsItemManager
{
  return self->_siriSettingsDetailsItemManager;
}

- (void)setSiriSettingsDetailsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, a3);
}

- (HUSiriTriggerPhraseSettingDelegate)delegate
{
  return (HUSiriTriggerPhraseSettingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)selectedSiriTriggerPhraseIndex
{
  return self->_selectedSiriTriggerPhraseIndex;
}

- (void)setSelectedSiriTriggerPhraseIndex:(int64_t)a3
{
  self->_selectedSiriTriggerPhraseIndex = a3;
}

- (int64_t)inProgressTriggerPhraseUpdateIndex
{
  return self->_inProgressTriggerPhraseUpdateIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, 0);
}

@end
