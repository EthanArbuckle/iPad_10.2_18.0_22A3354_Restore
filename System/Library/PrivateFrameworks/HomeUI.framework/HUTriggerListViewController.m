@implementation HUTriggerListViewController

- (HUTriggerListViewController)init
{
  HUTriggerListItemManager *v3;
  HUTriggerListViewController *v4;
  HUTriggerListViewController *v5;
  void *v6;
  objc_super v8;

  v3 = -[HFItemManager initWithDelegate:]([HUTriggerListItemManager alloc], "initWithDelegate:", self);
  v8.receiver = self;
  v8.super_class = (Class)HUTriggerListViewController;
  v4 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v8, sel_initWithItemManager_tableViewStyle_, v3, 2);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_triggerItemManager, v3);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTabAutomationTitle"), CFSTR("HUTabAutomationTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerListViewController setTitle:](v5, "setTitle:", v6);

    -[HUTriggerListViewController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
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
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[HUTriggerListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerListViewController setLayoutOptions:](self, "setLayoutOptions:", v6);

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      -[HUTriggerListViewController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNavigationBarHidden:", 1);
    }
    else
    {
      +[HUNavigationBarButton addButtonWithOwner:](HUNavigationBarButton, "addButtonWithOwner:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerListViewController setNavigationAddButton:](self, "setNavigationAddButton:", v8);

      -[HUTriggerListViewController navigationAddButton](self, "navigationAddButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerListViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRightBarButtonItems:", v9);

    }
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrefersLargeTitles:", 1);

    -[HUTriggerListViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setUseInlineBackgroundHeightWhenLarge:", 1);

  }
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerListViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      -[HUTriggerListViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNavigationBarHidden:", 1);
    }
    else
    {
      +[HUNavigationBarButton addButtonWithOwner:](HUNavigationBarButton, "addButtonWithOwner:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerListViewController setNavigationAddButton:](self, "setNavigationAddButton:", v5);

      -[HUTriggerListViewController navigationAddButton](self, "navigationAddButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerListViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItems:", v6);

    }
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrefersLargeTitles:", 1);

    -[HUTriggerListViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setUseInlineBackgroundHeightWhenLarge:", 1);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v12;
  _QWORD v13[5];

  -[HUTriggerListViewController layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewSize");
  v5 = v4;
  v7 = v6;
  -[HUTriggerListViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v11 = v7 == v10 && v5 == v9;

  if (!-[HUTriggerListViewController isTransitioningSizes](self, "isTransitioningSizes") && !v11)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__HUTriggerListViewController_viewWillLayoutSubviews__block_invoke;
    v13[3] = &unk_1E6F4D988;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
  }
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
}

void __53__HUTriggerListViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLayoutOptions:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[7];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerListViewController;
  v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[HUTriggerListViewController setIsTransitioningSizes:](self, "setIsTransitioningSizes:", 1);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6F5D3F0;
  v9[4] = self;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E6F4CB78;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

void __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLayoutOptions:", v2);

}

uint64_t __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsTransitioningSizes:", 0);
}

- (void)showAddTriggerView
{
  -[HUTriggerListViewController _addTrigger:](self, "_addTrigger:", 0);
}

- (void)_addTrigger:(id)a3
{
  void *v4;
  id v5;
  HUTriggerTypePickerViewController *v6;

  -[HUTriggerListViewController setEditorPresentationMode:](self, "setEditorPresentationMode:", 1);
  v6 = -[HUTriggerTypePickerViewController initWithActionSetBuilder:delegate:]([HUTriggerTypePickerViewController alloc], "initWithActionSetBuilder:delegate:", 0, self);
  -[HUTriggerTypePickerViewController setShowSuggestedAutomations:](v6, "setShowSuggestedAutomations:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v6);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  v5 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v4, 1);

}

- (void)_showSummaryForTriggerItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HUTriggerBuilderContext *v10;
  void *v11;
  HUTriggerSummaryViewController *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v15, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("nil parameter"));
    if (v6)
    {
LABEL_3:
      if (v7)
        goto LABEL_4;
LABEL_12:
      NSLog(CFSTR("nil parameter"));
      if (v9)
        goto LABEL_5;
LABEL_13:
      NSLog(CFSTR("nil parameter"));
      goto LABEL_16;
    }
  }
  NSLog(CFSTR("Could not determine trigger type for triggerItem: %@"), v15);
  if (!v7)
    goto LABEL_12;
LABEL_4:
  if (!v9)
    goto LABEL_13;
LABEL_5:
  if (v15 && v6 && v7)
  {
    v10 = objc_alloc_init(HUTriggerBuilderContext);
    -[HUTriggerBuilderContext setFiltersEmptyActionSets:](v10, "setFiltersEmptyActionSets:", 1);
    objc_msgSend(MEMORY[0x1E0D31938], "triggerBuilderForTrigger:inHome:context:", v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:]([HUTriggerSummaryViewController alloc], "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v11, 1, 1, self);
      -[HUTriggerListViewController setEditorPresentationMode:](self, "setEditorPresentationMode:", 1);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v12);
      objc_msgSend(v13, "setModalPresentationStyle:", 2);
      v14 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v13, 1);

    }
    else
    {
      NSLog(CFSTR("Could not create trigger builder for trigger: %@"), v7);
    }

  }
LABEL_16:

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v3;
  id v4;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTriggerListViewController;
  v3 = a3;
  v4 = -[HUItemTableViewController automaticDisablingReasonsForItem:](&v7, sel_automaticDisablingReasonsForItem_, v3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  else
    return (unint64_t)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_exclamationMarkImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDescriptionIcon:", v9);

    objc_msgSend(v7, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue") != 0;

    objc_msgSend(v8, "setAccessoryType:", v12);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v14;
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setButtonColorFollowsTintColor:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  objc_super v27;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    objc_msgSend(v11, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E88]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v13, "setHideDescriptionIcon:", v16 ^ 1u);
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_opt_class();
    v18 = v10;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v13 = v18;
      if (v19)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

    }
    v13 = 0;
LABEL_11:

    objc_msgSend(v13, "setDelegate:", self);
    -[HUTriggerListViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLayoutOptions:", v25);

    -[HUTriggerListViewController tableView](self, "tableView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRespectLayoutMargins:", objc_msgSend(v26, "_sectionContentInsetFollowsLayoutMargins") ^ 1);

    goto LABEL_12;
  }
LABEL_13:
  v27.receiver = self;
  v27.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v27, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  int v4;

  v4 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") ^ 1;
  if (a3)
    LOBYTE(v4) = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    return 1;
  else
    return v4;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  int v4;

  v4 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") ^ 1;
  if (a3)
    LOBYTE(v4) = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    return 1;
  else
    return v4;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  v5 = !objc_msgSend(v4, "section") || objc_msgSend(v4, "section") == 1 || objc_msgSend(v4, "section") == 3;

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController tableView:heightForHeaderInSection:](&v14, sel_tableView_heightForHeaderInSection_, a3);
  if (a4 != 2)
    return v6;
  -[HUTriggerListViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = HUViewSizeSubclassForViewSize(v8, v9);

  v15[0] = &unk_1E7041B00;
  v15[1] = &unk_1E7041B18;
  v16[0] = &unk_1E70438F8;
  v16[1] = &unk_1E7043908;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HUConstantFloatForViewSizeSubclass(v10, v11);

  return v12;
}

- (void)coloredButtonCellPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HUTriggerListViewController *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2080;
    v14 = "-[HUTriggerListViewController coloredButtonCellPressed:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped \"Create New Automation\", (uint8_t *)&v11, 0x16u);
  }

  -[HUTriggerListViewController _addTrigger:](self, "_addTrigger:", 0);
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "addTriggerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31170], "sendGeneralButtonTapEventWithButtonTitle:sourceViewController:", v10, self);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue") != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUTriggerListViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v10.receiver, v10.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[HUTriggerListViewController _showSummaryForTriggerItem:](self, "_showSummaryForTriggerItem:", v9);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  HUTriggerListViewController *v18;
  id v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HUItemTableViewController itemManager](self, "itemManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "home"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CEA4C0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUDeleteTitle"), CFSTR("HUDeleteTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke;
    v17 = &unk_1E6F5D4A8;
    v18 = self;
    v19 = v4;
    objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v10, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", v11, v14, v15, v16, v17, v18);
    objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_deleteItem:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke_2;
  v9[3] = &unk_1E6F5D998;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

uint64_t __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D313A0];
    v5 = a3;
    objc_msgSend(v4, "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:", v5);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  unint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = -[HUTriggerListViewController editorPresentationMode](self, "editorPresentationMode");
  if (v5 == 2)
  {
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popToViewController:animated:", self, 1);
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    if (!objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad")
      || (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    {
      -[HUTriggerListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_11;
    }
    objc_msgSend(v8, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_10:

    goto LABEL_11;
  }
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) == 0)
    NSLog(CFSTR("editorPresentationMode was not set before presenting trigger editor: %@"), v8);
LABEL_11:
  -[HUTriggerListViewController setEditorPresentationMode:](self, "setEditorPresentationMode:", 0);

}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
  -[HUTriggerListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)learnMoreLinkTapped:(id)a3
{
  void *v4;
  HUAboutResidentDeviceViewController *v5;

  v5 = -[HUAboutResidentDeviceViewController initWithStyle:]([HUAboutResidentDeviceViewController alloc], "initWithStyle:", 1);
  -[HUAboutResidentDeviceViewController setDelegate:](v5, "setDelegate:", self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[HUTriggerListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)homeForNavigationBarButton:(id)a3
{
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roomForNavigationBarButton:(id)a3
{
  return 0;
}

- (id)addActionDelegateForNavigationBarButton:(id)a3
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
  void *v13;

  -[HUTriggerListViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "splitViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_10:
      v13 = 0;
      return v13;
    }
    -[HUTriggerListViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "splitViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2E7E60))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v12)
    goto LABEL_10;
  objc_msgSend(v12, "dashboardNavigator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_deleteItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    NSLog(CFSTR("No trigger to delete"));
    goto LABEL_8;
  }
  if (!v7)
  {
LABEL_8:
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:description:", 30, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__HUTriggerListViewController__deleteItem___block_invoke;
  v15[3] = &unk_1E6F4D600;
  v15[4] = self;
  v16 = v8;
  objc_msgSend(v10, "futureWithBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

void __43__HUTriggerListViewController__deleteItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HUTriggerListViewController__deleteItem___block_invoke_2;
  v9[3] = &unk_1E6F56310;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v8 = v3;
  objc_msgSend(v5, "removeTrigger:completionHandler:", v12, v9);

}

void __43__HUTriggerListViewController__deleteItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  id v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __43__HUTriggerListViewController__deleteItem___block_invoke_3;
    v8 = &unk_1E6F4F418;
    v4 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v4;
    objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", &v5, 0);

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult", v5, v6, v7, v8, v9);
  }
}

void __43__HUTriggerListViewController__deleteItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didRemoveTrigger:", v4, *(_QWORD *)(a1 + 40));

  }
}

- (HUNavigationBarButton)navigationAddButton
{
  return self->_navigationAddButton;
}

- (void)setNavigationAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAddButton, a3);
}

- (HUTriggerListItemManager)triggerItemManager
{
  return self->_triggerItemManager;
}

- (unint64_t)editorPresentationMode
{
  return self->_editorPresentationMode;
}

- (void)setEditorPresentationMode:(unint64_t)a3
{
  self->_editorPresentationMode = a3;
}

- (BOOL)isTransitioningSizes
{
  return self->_isTransitioningSizes;
}

- (void)setIsTransitioningSizes:(BOOL)a3
{
  self->_isTransitioningSizes = a3;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_triggerItemManager, 0);
  objc_storeStrong((id *)&self->_navigationAddButton, 0);
}

@end
