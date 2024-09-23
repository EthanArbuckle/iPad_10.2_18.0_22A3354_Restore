@implementation HULocationTriggerEditorSummaryViewController

+ (id)defaultLocationEventBuilderForHome:(id)a3 eventType:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CBA780], "hf_presenceDisableReasonsForHome:", v5))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D314E8]);
    +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultCircularRegionForCoordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRegion:", v8);

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D31690]);
    objc_msgSend(v6, "setLocationEventType:", a4);
    objc_msgSend(MEMORY[0x1E0D31778], "allUsersCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsers:", v9);

    objc_msgSend(v6, "setActivationGranularity:", 0);
  }

  return v6;
}

- (HULocationTriggerEditorSummaryViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_mode_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationTriggerEditorSummaryViewController.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationTriggerEditorSummaryViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HULocationTriggerEditorSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HULocationTriggerEditorSummaryItemManager *v11;
  HULocationTriggerEditorSummaryViewController *v12;
  HULocationTriggerEditorSummaryViewController *v13;
  HUTriggerConditionEditorItemModuleController *v14;
  void *v15;
  uint64_t v16;
  HUTriggerConditionEditorItemModuleController *conditionEditorModuleController;
  HUPresenceUserPickerItemModuleController *v18;
  void *v19;
  uint64_t v20;
  HUPresenceUserPickerItemModuleController *userPickerModuleController;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v11 = -[HULocationTriggerEditorSummaryItemManager initWithDelegate:triggerBuilder:]([HULocationTriggerEditorSummaryItemManager alloc], "initWithDelegate:triggerBuilder:", self, v9);
  v23.receiver = self;
  v23.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v23, sel_initWithItemManager_tableViewStyle_, v11, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_triggerBuilder, a3);
    v13->_mode = a4;
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14 = [HUTriggerConditionEditorItemModuleController alloc];
    -[HULocationTriggerEditorSummaryItemManager conditionEditorModule](v11, "conditionEditorModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:](v14, "initWithModule:delegate:", v15, v13);
    conditionEditorModuleController = v13->_conditionEditorModuleController;
    v13->_conditionEditorModuleController = (HUTriggerConditionEditorItemModuleController *)v16;

    v18 = [HUPresenceUserPickerItemModuleController alloc];
    -[HULocationTriggerEditorSummaryItemManager userPickerModule](v11, "userPickerModule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HUItemModuleController initWithModule:](v18, "initWithModule:", v19);
    userPickerModuleController = v13->_userPickerModuleController;
    v13->_userPickerModuleController = (HUPresenceUserPickerItemModuleController *)v20;

    -[HUPresenceUserPickerItemModuleController setDelegate:](v13->_userPickerModuleController, "setDelegate:", v13);
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char **v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  -[HUItemTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerEditorSummaryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonTitle:", v3);

  if (!-[HULocationTriggerEditorSummaryViewController mode](self, "mode"))
  {
    -[HULocationTriggerEditorSummaryViewController triggerBuilder](self, "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasActions");
    v8 = &selRef__showSummary_;
    if (!v7)
      v8 = &selRef__showActionEditor_;
    v9 = *v8;

    v10 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorNextButton"), CFSTR("HUTimerTriggerEditorNextButton"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 2, self, v9);
    -[HULocationTriggerEditorSummaryViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HULocationTriggerEditorSummaryViewController conditionEditorModuleController](self, "conditionEditorModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[HULocationTriggerEditorSummaryViewController userPickerModuleController](self, "userPickerModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInstructionsItem:", v5);

  if ((v7 & 1) != 0
    || (-[HUItemTableViewController itemManager](self, "itemManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "locationItem"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v5))
  {
    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v13, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v10, "isInstructionsItem:", v9);

  if ((_DWORD)self)
  {
    +[HUListContentConfigurationUtilities instructionsConfigurationForItem:](HUListContentConfigurationUtilities, "instructionsConfigurationForItem:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentConfiguration:", v11);
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundConfiguration:", v12);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  objc_super v15;

  v6 = a6;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v15, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v15.receiver, v15.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    v14 = v10;
    objc_msgSend(v14, "setHideIcon:", 1);
    objc_msgSend(v14, "setValueColorFollowsTintColor:", 1);

  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HULocationTriggerEditorSummaryItemManager usersHeaderSectionID](HULocationTriggerEditorSummaryItemManager, "usersHeaderSectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  +[HULocationTriggerEditorSummaryItemManager usersListSectionID](HULocationTriggerEditorSummaryItemManager, "usersListSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "containsObject:", v5);

  return a3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HULocationTriggerRegionEditorViewController *v15;
  void *v16;
  void *v17;
  HULocationTriggerRegionEditorViewController *v18;
  void *v19;
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v21, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v12)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationEventRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [HULocationTriggerRegionEditorViewController alloc];
      -[HUItemTableViewController itemManager](self, "itemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HULocationTriggerRegionEditorViewController initWithRegion:home:delegate:](v15, "initWithRegion:home:delegate:", v14, v17, self);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v18);
      objc_msgSend(v19, "setModalPresentationStyle:", 2);
      objc_msgSend(v19, "setModalInPresentation:", 1);
      v20 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v19, 1);

    }
  }

}

- (void)_showActionEditor:(id)a3
{
  HUTriggerActionPickerViewController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  HUTriggerActionPickerViewController *v10;

  v4 = [HUTriggerActionPickerViewController alloc];
  -[HULocationTriggerEditorSummaryViewController triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HULocationTriggerEditorSummaryViewController mode](self, "mode");
  -[HULocationTriggerEditorSummaryViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:mode:delegate:](v4, "initWithTriggerBuilder:mode:delegate:", v5, v6, v7);

  -[HULocationTriggerEditorSummaryViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

}

- (void)_showSummary:(id)a3
{
  HUTriggerSummaryViewController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  HUTriggerSummaryViewController *v10;

  v4 = [HUTriggerSummaryViewController alloc];
  -[HULocationTriggerEditorSummaryViewController triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HULocationTriggerEditorSummaryViewController mode](self, "mode");
  -[HULocationTriggerEditorSummaryViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:](v4, "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v5, v6, 0, v7);

  -[HULocationTriggerEditorSummaryViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4;

  v4 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
  -[HULocationTriggerEditorSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)regionEditor:(id)a3 didFinishWithRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canAddRegionToTriggerBuilder");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v6, "showLocationRegionInvalidAlert");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HULocationTriggerEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke;
  v14[3] = &unk_1E6F4D188;
  v14[4] = self;
  v15 = v7;
  v12 = v7;
  v13 = (id)objc_msgSend(v8, "addSuccessBlock:", v14);

}

uint64_t __81__HULocationTriggerEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLocationEventWithRegion:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)regionEditorDidCancel:(id)a3
{
  -[HULocationTriggerEditorSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationEventRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v5, objc_msgSend(v7, "eventType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateLocationEventWithRegion:", v9);

}

- (void)presenceUserPickerItemModuleController:(id)a3 presentViewController:(id)a4
{
  -[HULocationTriggerEditorSummaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  HULocationTriggerEditorSummaryViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "openURL:", v7);

  return 0;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HUPresenceUserPickerItemModuleController)userPickerModuleController
{
  return self->_userPickerModuleController;
}

- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController
{
  return self->_conditionEditorModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionEditorModuleController, 0);
  objc_storeStrong((id *)&self->_userPickerModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
