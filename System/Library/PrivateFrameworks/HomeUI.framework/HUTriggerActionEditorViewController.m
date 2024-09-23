@implementation HUTriggerActionEditorViewController

+ (id)createTriggerActionEditorViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HUForwardingTriggerActionBuilderDelegate *v15;
  HUTriggerActionFlow *v16;
  HUTriggerActionEditorViewController *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = (void *)MEMORY[0x1E0D31430];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideHome:", v10);

  v12 = (void *)MEMORY[0x1E0D31658];
  v13 = (void *)objc_opt_new();
  objc_msgSend(v12, "createPlaceholderTriggerForHome:withTriggerActionSetBuilder:context:", v10, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HUForwardingTriggerActionBuilderDelegate initWithTriggerActionBuilderEditorDelegate:]([HUForwardingTriggerActionBuilderDelegate alloc], "initWithTriggerActionBuilderEditorDelegate:", v8);
  v16 = -[HUTriggerActionFlow initWithFlowState:]([HUTriggerActionFlow alloc], "initWithFlowState:", 4);
  v17 = -[HUTriggerActionEditorViewController initWithTriggerBuilder:flow:delegate:]([HUTriggerActionEditorViewController alloc], "initWithTriggerBuilder:flow:delegate:", v14, v16, 0);
  -[HUTriggerActionEditorViewController setForwardingTriggerActionBuilderDelegate:](v17, "setForwardingTriggerActionBuilderDelegate:", v15);
  -[HUTriggerActionEditorViewController forwardingTriggerActionBuilderDelegate](v17, "forwardingTriggerActionBuilderDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF28A740))
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;
  -[HUTriggerActionEditorViewController setDelegate:](v17, "setDelegate:", v20);

  return v17;
}

- (HUTriggerActionEditorViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_mode_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerActionEditorViewController.m"), 81, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerActionEditorViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  HUTriggerActionFlow *v10;
  HUTriggerActionEditorViewController *v11;

  v8 = a5;
  v9 = a3;
  v10 = -[HUTriggerActionFlow initWithEditorMode:]([HUTriggerActionFlow alloc], "initWithEditorMode:", a4);
  v11 = -[HUTriggerActionEditorViewController initWithTriggerBuilder:flow:delegate:](self, "initWithTriggerBuilder:flow:delegate:", v9, v10, v8);

  return v11;
}

- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUTriggerActionEditorContentViewController *v11;
  void *v12;
  HUTriggerActionEditorContentViewController *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  HUTriggerActionEditorItemManager *v20;
  HUTriggerActionEditorViewController *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [HUTriggerActionEditorContentViewController alloc];
  -[HUTriggerActionEditorViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUTriggerActionEditorContentViewController initWithTriggerBuilder:flow:effectiveNavigationItem:delegate:](v11, "initWithTriggerBuilder:flow:effectiveNavigationItem:delegate:", v8, v9, v12, v10);

  v14 = 1;
  -[HUTriggerActionEditorViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_opt_class();
  v15 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "locationInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isCustomLocationTrigger");

    v14 = v19 ^ 1;
  }
  v20 = -[HUTriggerActionEditorItemManager initWithDelegate:showShortcutItem:]([HUTriggerActionEditorItemManager alloc], "initWithDelegate:showShortcutItem:", self, v14 & ~objc_msgSend(v9, "isStandalone"));
  -[HUServiceGridViewController setContentMargins:](v13, "setContentMargins:", 1);
  +[HUTriggerUtilities preloadShortcutHomeManager](HUTriggerUtilities, "preloadShortcutHomeManager");
  v23.receiver = self;
  v23.super_class = (Class)HUTriggerActionEditorViewController;
  v21 = -[HUInstructionsTableViewController initWithItemManager:instructionsItem:contentViewController:](&v23, sel_initWithItemManager_instructionsItem_contentViewController_, v20, 0, v13);

  return v21;
}

- (void)viewDidLoad
{
  void *v3;
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
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUTriggerActionEditorViewController;
  -[HUInstructionsTableViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[HUTriggerActionEditorViewController triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerContextAwareTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUTriggerActionEditorViewController setTitle:](self, "setTitle:", v5);
  }
  else
  {
    -[HUTriggerActionEditorViewController triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "naturalLanguageNameOfType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerActionEditorViewController setTitle:](self, "setTitle:", v7);

  }
  -[HUTriggerActionEditorViewController triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionEditorInstructionsDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorInstructionsDescription"), CFSTR("HUTriggerActionEditorInstructionsDescription"), 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[HUTriggerActionEditorViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPrompt:", v13);

}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  objc_super v11;

  v6 = a6;
  v10 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerActionEditorViewController;
  -[HUInstructionsTableViewController updateCell:forItem:indexPath:animated:](&v11, sel_updateCell_forItem_indexPath_animated_, v10, a4, a5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "removeMargins");

}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "addShortcutItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v14)
  {
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);
    -[HUTriggerActionEditorViewController _showShortcutsEditorIfPossible](self, "_showShortcutsEditorIfPossible");
  }
  else if (objc_msgSend((id)+[HUTriggerActionEditorViewController superclass](HUTriggerActionEditorViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTriggerActionEditorViewController;
    -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  }

}

- (void)_showShortcutsEditorIfPossible
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CBA848];
  -[HUTriggerActionEditorViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isSupportedForHome:", v5);

  if ((_DWORD)v3)
    -[HUTriggerActionEditorViewController _showShortcutsEditor](self, "_showShortcutsEditor");
  else
    -[HUTriggerActionEditorViewController _informUserShortcutsAreNotSupportedInThisHome](self, "_informUserShortcutsAreNotSupportedInThisHome");
}

- (void)_informUserShortcutsAreNotSupportedInThisHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertSoftwareUpdateRequired"), CFSTR("HUAlertSoftwareUpdateRequired"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerUnsupportedAutomationOnHomeHub"), CFSTR("HUTriggerUnsupportedAutomationOnHomeHub"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[HUTriggerActionEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)_showShortcutsEditor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[HUTriggerActionEditorViewController actionEditorContentViewController](self, "actionEditorContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerBuilderFutureWithLatestUIChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke;
  v10[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v11, &location);
  v6 = (id)objc_msgSend(v4, "addFailureBlock:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_3;
  v8[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v9, &location);
  v7 = (id)objc_msgSend(v4, "addSuccessBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_2;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showShortcutsEditor");
}

void __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerBuilder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultActionsForShortcut");

  v3 = objc_alloc(MEMORY[0x1E0DDA0F0]);
  objc_msgSend(WeakRetained, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithHomeWorkflow:actionSetBuilder:home:", 0, v5, v7);

  objc_msgSend(v8, "setDelegate:", WeakRetained);
  objc_msgSend(WeakRetained, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (HUTriggerActionEditorContentViewController)actionEditorContentViewController
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUInstructionsTableViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HUTriggerActionEditorContentViewController *)v5;
}

- (HFTriggerBuilder)triggerBuilder
{
  void *v2;
  void *v3;

  -[HUTriggerActionEditorViewController actionEditorContentViewController](self, "actionEditorContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFTriggerBuilder *)v3;
}

- (HUTriggerEditorDelegate)delegate
{
  void *v2;
  void *v3;

  -[HUTriggerActionEditorViewController actionEditorContentViewController](self, "actionEditorContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUTriggerEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTriggerActionEditorViewController actionEditorContentViewController](self, "actionEditorContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate
{
  return self->_forwardingTriggerActionBuilderDelegate;
}

- (void)setForwardingTriggerActionBuilderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_forwardingTriggerActionBuilderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingTriggerActionBuilderDelegate, 0);
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[HUTriggerActionEditorViewController triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerActionSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHomeWorkflow:", v6);

  -[HUTriggerActionEditorViewController actionEditorContentViewController](self, "actionEditorContentViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "goToSummaryScreen");

}

@end
