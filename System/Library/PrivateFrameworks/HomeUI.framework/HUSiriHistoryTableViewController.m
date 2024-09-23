@implementation HUSiriHistoryTableViewController

- (HUSiriHistoryTableViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  HUSiriHistoryItemManager *v5;
  HUSiriHistoryTableViewController *v6;
  HUSiriHistoryTableViewController *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[HUSiriHistoryItemManager initWithDelegate:groupItem:]([HUSiriHistoryItemManager alloc], "initWithDelegate:groupItem:", self, v4);

  v9.receiver = self;
  v9.super_class = (Class)HUSiriHistoryTableViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v9, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_siriHistoryItemManager, v5);

  return v7;
}

- (HUSiriHistoryTableViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  void *v5;
  HUSiriHistoryItemManager *v6;
  HUSiriHistoryTableViewController *v7;
  HUSiriHistoryTableViewController *v8;
  objc_super v10;

  v5 = (void *)objc_msgSend(a3, "copy");
  v6 = -[HUSiriHistoryItemManager initWithDelegate:accessorySettingItem:]([HUSiriHistoryItemManager alloc], "initWithDelegate:accessorySettingItem:", self, v5);
  v10.receiver = self;
  v10.super_class = (Class)HUSiriHistoryTableViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v6, 1);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_siriHistoryItemManager, v6);

  return v8;
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUSiriHistoryTableViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v18, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  v12 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "setDestructive:", 1, v18.receiver, v18.super_class);
  objc_msgSend(v11, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HUItemTableSectionHeaderFooterView *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedFooterTitleForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerReuseIdentifier"));
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("footerReuseIdentifier"));
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textDragInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    -[HUItemTableSectionHeaderFooterView setType:](v9, "setType:", 1);
    -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v8);
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUSiriHistoryTableViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v13, sel_tableView_viewForFooterInSection_, v6, a4);
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  HUSiriHistoryTableViewController *v13;
  HUSiriHistoryTableViewController *v14;
  void *v15;
  int v17;
  HUSiriHistoryTableViewController *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31970], "aboutImproveSiriAndDictationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[HUSiriHistoryTableViewController navigationController](self, "navigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (HUSiriHistoryTableViewController *)v11;
    else
      v13 = self;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651F0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPresentingViewController:", v14);

    objc_msgSend(v15, "present");
  }

  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[5];
  id v25;
  _QWORD v26[4];
  id v27;
  HUSiriHistoryTableViewController *v28;
  id v29;
  objc_super v30;

  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HUSiriHistoryTableViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v30, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_opt_class();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  -[HUSiriHistoryTableViewController siriHistoryItemManager](self, "siriHistoryItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didSelectItemAtIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v13, v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v26[3] = &unk_1E6F526A0;
    v27 = v10;
    v28 = self;
    v29 = v6;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v22);

    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
    block[3] = &unk_1E6F4C638;
    block[4] = self;
    v25 = v15;
    v23 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "setShowSpinner:", 1);
  objc_msgSend(*(id *)(a1 + 40), "siriHistoryItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateItemAtIndexPath:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v7[3] = &unk_1E6F4C0D8;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v6 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

  }
}

void __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  block[3] = &unk_1E6F4E020;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "setShowSpinner:", 0);
  v2 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertDismiss"), CFSTR("HUAlertDismiss"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  objc_msgSend(a1[6], "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __70__HUSiriHistoryTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (HUSiriHistoryItemManager)siriHistoryItemManager
{
  return self->_siriHistoryItemManager;
}

- (void)setSiriHistoryItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriHistoryItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriHistoryItemManager, 0);
}

@end
