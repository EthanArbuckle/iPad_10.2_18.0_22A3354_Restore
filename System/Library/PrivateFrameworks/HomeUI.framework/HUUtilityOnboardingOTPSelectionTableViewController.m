@implementation HUUtilityOnboardingOTPSelectionTableViewController

- (HUUtilityOnboardingOTPSelectionTableViewController)initWithItemManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUtilityOnboardingOTPSelectionTableViewController;
  return -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v4, sel_initWithItemManager_tableViewStyle_, a3, 1);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  HUUtilityOnboardingOTPSelectionTableViewController *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2080;
    v15 = "-[HUUtilityOnboardingOTPSelectionTableViewController cellClassForItem:indexPath:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s cell class for item %@ with index %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
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
  id v18;

  v18 = a3;
  v7 = a4;
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v18, "setAccessoryType:", 3);
    -[HUUtilityOnboardingOTPSelectionTableViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:didSelectOTPMethod:", self, v7);

  }
  objc_msgSend(v18, "setHideIcon:", 1);
  objc_msgSend(v7, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValueText:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("factor-type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Home.OnboardingView.Utility.OTP.%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", v16);

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  HUUtilityOnboardingOTPSelectionTableViewController *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HUUtilityOnboardingOTPSelectionTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        objc_msgSend(v6, "cellForRowAtIndexPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        objc_msgSend(v17, "setAccessoryType:", 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)HUUtilityOnboardingOTPSelectionTableViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v27, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_opt_class();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_msgSend(v20, "setAccessoryType:", 3);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayedItemAtIndexPath:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v22, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = self;
    v34 = 2112;
    v35 = v25;
    _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@: ROW OPTION User tapped item: %@", buf, 0x16u);

  }
  -[HUUtilityOnboardingOTPSelectionTableViewController delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tableView:didSelectOTPMethod:", self, v22);

}

- (OTPSelectionTableDelegate)delegate
{
  return (OTPSelectionTableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
