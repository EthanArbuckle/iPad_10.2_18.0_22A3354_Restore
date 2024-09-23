@implementation HUAddRestrictedGuestTableViewController

- (HUAddRestrictedGuestTableViewController)initWithItem:(id)a3 home:(id)a4 inviteeAddresses:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUAddRestrictedGuestItemManager *v13;
  HUAddRestrictedGuestTableViewController *v14;
  HUAddRestrictedGuestTableViewController *v15;
  void *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestTableViewController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestTableViewController.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inviteeAddresses.count > 0"));

  }
  v12 = (void *)objc_msgSend(v9, "copy");
  v13 = -[HUAddRestrictedGuestItemManager initWithDelegate:sourceItem:home:inviteeAddresses:]([HUAddRestrictedGuestItemManager alloc], "initWithDelegate:sourceItem:home:inviteeAddresses:", self, v12, v10, v11);
  v20.receiver = self;
  v20.super_class = (Class)HUAddRestrictedGuestTableViewController;
  v14 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v20, sel_initWithItemManager_tableViewStyle_, v13, 1);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_restrictedGuestItemManager, v13);
    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v15, "setAutomaticallyUpdatesViewControllerTitle:", 0);
    v16 = (void *)objc_opt_new();
    -[HUAddRestrictedGuestTableViewController setAccessoriesToAllow:](v15, "setAccessoriesToAllow:", v16);

  }
  return v15;
}

- (HUAddRestrictedGuestTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItem_home_inviteeAddresses_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestTableViewController.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAddRestrictedGuestTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)sendInvites
{
  void *v3;
  id v4;

  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAddRestrictedGuestTableViewController accessoriesToAllow](self, "accessoriesToAllow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendInvitesWithAllowedAccessories:", v3);

}

- (id)rgHomeAccessSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAddRestrictedGuestTableViewController accessoriesToAllowToRG](self, "accessoriesToAllowToRG");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)accessoriesToAllowToRG
{
  void *v2;
  void *v3;

  -[HUAddRestrictedGuestTableViewController accessoriesToAllow](self, "accessoriesToAllow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScheduleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if ((v8 & 1) == 0)
  {
    -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transformedSecureAccessoryItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containsObject:", v5);

  }
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  objc_super v36;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUAddRestrictedGuestTableViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v36, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeScheduleItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v11);

  if (v15)
  {
    objc_opt_class();
    v16 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "setIconDisplayStyle:", 1);
    objc_msgSend(v18, "setDisableContinuousIconAnimation:", 1);
    HUDefaultSizeForIconSize();
    v20 = v19;
    v22 = v21;
    objc_msgSend(v18, "contentMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIconSize:", v20, v22);

    objc_msgSend(v18, "setAccessoryView:", 0);
    objc_msgSend(v18, "setAccessoryType:", 0);
    objc_msgSend(v18, "setValueColorFollowsTintColor:", 1);
LABEL_16:

    goto LABEL_17;
  }
  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "transformedSecureAccessoryItemProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "items");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", v11);

  if (v27)
  {
    objc_opt_class();
    v28 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v18 = v29;

    objc_msgSend(v18, "setDelegate:", self);
    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v11, "latestResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D10]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    if (v34)
    {
      objc_msgSend(v30, "imageProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTintColor:", v34);

    }
    objc_msgSend(v18, "setContentConfiguration:", v30);

    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
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

  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedSecureAccessoryItemProvider");
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
  void *v10;
  void *v11;
  HURestrictedGuestScheduleViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  HURestrictedGuestScheduleViewController *v16;
  void *v17;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUAddRestrictedGuestTableViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v19, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v19.receiver, v19.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeScheduleItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isEqual:", v11);

  if ((_DWORD)v7)
  {
    v12 = [HURestrictedGuestScheduleViewController alloc];
    -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScheduleItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "schedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HURestrictedGuestScheduleViewController initWithSchedule:delegate:](v12, "initWithSchedule:delegate:", v15, self);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v16);
    objc_msgSend(v17, "setModalPresentationStyle:", 2);
    v18 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v17, 1);

  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  int v24;
  HUAddRestrictedGuestTableViewController *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = self;
    v26 = 1024;
    v27 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", (uint8_t *)&v24, 0x12u);
  }

  -[HUAddRestrictedGuestTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "sourceItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  -[HUAddRestrictedGuestTableViewController accessoriesToAllow](self, "accessoriesToAllow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v18, "addObject:", v19);
  else
    objc_msgSend(v18, "removeObject:", v19);

  -[HUAddRestrictedGuestTableViewController accessoriesToAllow](self, "accessoriesToAllow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") != 0;
  -[HUAddRestrictedGuestTableViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setEnabled:", v21);

}

- (void)didUpdateInviteUserSchedule:(id)a3 schedule:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  HUAddRestrictedGuestTableViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeScheduleItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating new invite user schedule from [%@] to [%@]", (uint8_t *)&v13, 0x2Au);

  }
  -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](self, "restrictedGuestItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateAccessSchedule:", v6);

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HUAddRestrictedGuestItemManager)restrictedGuestItemManager
{
  return self->_restrictedGuestItemManager;
}

- (void)setRestrictedGuestItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedGuestItemManager, a3);
}

- (HUAddRestrictedGuestViewDelegate)delegate
{
  return (HUAddRestrictedGuestViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)accessoriesToAllow
{
  return self->_accessoriesToAllow;
}

- (void)setAccessoriesToAllow:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesToAllow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesToAllow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_restrictedGuestItemManager, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
