@implementation HUAccessorySettingsSiriOutputVoiceViewController

- (HUAccessorySettingsSiriOutputVoiceViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriOutputVoiceViewController.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriOutputVoiceViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriOutputVoiceViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HUAccessorySettingsSiriOutputVoiceItemManager *v12;
  void *v13;
  void *v14;
  id v15;
  HUAccessorySettingsSiriOutputVoiceItemManager *v16;
  uint64_t v17;
  HUAccessorySettingsSiriOutputVoiceViewController *v18;
  objc_super v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasOptedToHH2");

  if (v7)
  {
    objc_opt_class();
    objc_msgSend(v4, "homeKitSettingsVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      objc_msgSend(v10, "hf_siriLanguageOptionsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v4, "homeKitSettingsVendor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (v15)
      {
        objc_msgSend(v15, "hf_siriLanguageOptionsManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    v16 = [HUAccessorySettingsSiriOutputVoiceItemManager alloc];
    if (v11)
      v17 = -[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:siriLanguageOptionsManager:sourceItem:](v16, "initWithDelegate:siriLanguageOptionsManager:sourceItem:", self, v11, v4);
    else
      v17 = -[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:groupItem:](v16, "initWithDelegate:groupItem:", self, v4);
    v12 = (HUAccessorySettingsSiriOutputVoiceItemManager *)v17;

  }
  else
  {
    v12 = -[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:groupItem:]([HUAccessorySettingsSiriOutputVoiceItemManager alloc], "initWithDelegate:groupItem:", self, v4);
  }
  v20.receiver = self;
  v20.super_class = (Class)HUAccessorySettingsSiriOutputVoiceViewController;
  v18 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v20, sel_initWithItemManager_tableViewStyle_, v12, 1);

  return v18;
}

- (HUAccessorySettingsSiriOutputVoiceViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HUAccessorySettingsSiriOutputVoiceItemManager *v11;
  HUAccessorySettingsSiriOutputVoiceViewController *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  objc_msgSend(v6, "accessorySettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = -[HUAccessorySettingsSiriOutputVoiceItemManager initWithDelegate:siriLanguageOptionsManager:sourceItem:]([HUAccessorySettingsSiriOutputVoiceItemManager alloc], "initWithDelegate:siriLanguageOptionsManager:sourceItem:", self, v10, v7);
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsSiriOutputVoiceViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v14, sel_initWithItemManager_tableViewStyle_, v11, 1);

  return v12;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v6 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsSiriOutputVoiceViewController;
  v9 = a4;
  v10 = a3;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v17, sel_updateCell_forItem_indexPath_animated_, v10, v9, a5, v6);
  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration", v17.receiver, v17.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  objc_msgSend(v10, "setContentConfiguration:", v11);
  objc_msgSend(v9, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "BOOLValue"))
    v16 = 3;
  else
    v16 = 0;
  objc_msgSend(v10, "setAccessoryType:", v16);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUAccessorySettingsSiriOutputVoiceViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v13.receiver, v13.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSelectionWithOptionItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "addFailureBlock:", &__block_literal_global_112);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
}

void __86__HUAccessorySettingsSiriOutputVoiceViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "na_isCancelledError");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("Updating siri voice"));
  else
    objc_msgSend(v4, "handleError:", v2);

}

@end
