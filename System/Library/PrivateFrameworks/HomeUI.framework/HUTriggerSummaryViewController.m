@implementation HUTriggerSummaryViewController

+ (id)createTriggerSummaryViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HUForwardingTriggerActionBuilderDelegate *v18;
  HUTriggerActionFlow *v19;
  HUTriggerSummaryViewController *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = (void *)MEMORY[0x1E0D31430];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideHome:", v10);

  v12 = objc_alloc(MEMORY[0x1E0D31930]);
  objc_msgSend(v9, "allActionSets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithActionSets:inHome:filterEmptyActionSets:", v13, v10, 1);
  v15 = (void *)MEMORY[0x1E0D31658];
  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "createPlaceholderTriggerForHome:withTriggerActionSetBuilder:context:", v10, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HUForwardingTriggerActionBuilderDelegate initWithTriggerActionBuilderEditorDelegate:]([HUForwardingTriggerActionBuilderDelegate alloc], "initWithTriggerActionBuilderEditorDelegate:", v8);
  v19 = -[HUTriggerActionFlow initWithFlowState:]([HUTriggerActionFlow alloc], "initWithFlowState:", 7);
  v20 = -[HUTriggerSummaryViewController initWithTriggerBuilder:flow:delegate:]([HUTriggerSummaryViewController alloc], "initWithTriggerBuilder:flow:delegate:", v17, v19, 0);
  -[HUTriggerSummaryViewController setForwardingTriggerActionBuilderDelegate:](v20, "setForwardingTriggerActionBuilderDelegate:", v18);
  -[HUTriggerSummaryViewController forwardingTriggerActionBuilderDelegate](v20, "forwardingTriggerActionBuilderDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF28A740))
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;
  -[HUTriggerSummaryViewController setDelegate:](v20, "setDelegate:", v23);

  return v20;
}

- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  HUTriggerActionFlow *v11;
  uint64_t v12;
  HUTriggerActionFlow *v13;
  HUTriggerSummaryViewController *v14;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = [HUTriggerActionFlow alloc];
  if (v6)
    v12 = 3;
  else
    v12 = 1;
  v13 = -[HUTriggerActionFlow initWithFlowState:](v11, "initWithFlowState:", v12);
  v14 = -[HUTriggerSummaryViewController initWithTriggerBuilder:flow:delegate:](self, "initWithTriggerBuilder:flow:delegate:", v10, v13, v9);

  return v14;
}

- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HUTriggerSummaryItemManager *v14;
  HUTriggerSummaryViewController *v15;
  HUTriggerSummaryViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(MEMORY[0x1E0D313C8], "isShortcuts"))
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOverrideHome:", v13);

  }
  v14 = -[HUTriggerSummaryItemManager initWithTriggerBuilder:flow:delegate:]([HUTriggerSummaryItemManager alloc], "initWithTriggerBuilder:flow:delegate:", v9, v10, self);
  v35.receiver = self;
  v35.super_class = (Class)HUTriggerSummaryViewController;
  v15 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v35, sel_initWithItemManager_tableViewStyle_, v14, 1);
  v16 = v15;
  if (v15)
  {
    -[HUTriggerSummaryViewController setTriggerBuilder:](v15, "setTriggerBuilder:", v9);
    -[HUTriggerSummaryViewController setDelegate:](v16, "setDelegate:", v11);
    -[HUTriggerSummaryViewController setFlow:](v16, "setFlow:", v10);
    objc_msgSend(v9, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v9, "naturalLanguageNameOfType:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setName:", v18);

      objc_msgSend(v9, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("HUTriggerSummaryViewController.m"), 117, CFSTR("Could not generate name for triggerBuilder: %@"), v9);

      }
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryViewController navigationItem](v16, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackButtonTitle:", v20);

    if (objc_msgSend(v10, "isSingleFlow"))
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v16, sel__cancel_);
      -[HUTriggerSummaryViewController navigationItem](v16, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLeftBarButtonItem:", v22);

    }
    if (objc_msgSend(v10, "isLastState"))
    {
      objc_msgSend(v9, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doneButtonTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_alloc(MEMORY[0x1E0CEA380]);
      v27 = v26;
      if (v25)
      {
        objc_msgSend(v9, "context");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doneButtonTitle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithTitle:style:target:action:", v29, 2, v16, sel__done_);

      }
      else
      {
        v30 = (void *)objc_msgSend(v26, "initWithBarButtonSystemItem:target:action:", 0, v16, sel__done_);
      }
      -[HUTriggerSummaryViewController navigationItem](v16, "navigationItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setRightBarButtonItem:", v30);

    }
    -[HUTriggerSummaryViewController setModalInPresentation:](v16, "setModalInPresentation:", 1);
    -[HUTriggerSummaryViewController setIsEditingExistingTrigger:](v16, "setIsEditingExistingTrigger:", objc_msgSend(v10, "flowState") == 3);
    +[HUTriggerUtilities preloadShortcutHomeManager](HUTriggerUtilities, "preloadShortcutHomeManager");
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addHomeObserver:", v16);

  }
  return v16;
}

- (NSSet)prioritizedAccessories
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prioritizedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setPrioritizedAccessories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrioritizedAccessories:", v4);

}

- (NSString)savedName
{
  void *v2;
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTriggerSummaryViewController;
  -[HUItemTableViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[HUTriggerSummaryViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerCurrentDisplayedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController setTitle:](self, "setTitle:", v5);

  if (-[HUTriggerSummaryViewController detailEditorChangedTrigger](self, "detailEditorChangedTrigger"))
  {
    -[HUTriggerSummaryViewController setDetailEditorChangedTrigger:](self, "setDetailEditorChangedTrigger:", 0);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerBuilderDidChange");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[HUTriggerSummaryViewController flow](self, "flow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "flowState");

  if (v6 == 5)
  {
    -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerActionSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHomeWorkflow:", 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerSummaryViewController;
  -[HUItemTableViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, v3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTriggerSummaryViewController;
  -[HUTriggerSummaryViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, a3, a4);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHomeObserver:", self);

}

- (id)commitChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HUTriggerSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertToHomeWorkflowActionSetIfNeeded");

  if (-[HUTriggerSummaryViewController _canCommitTriggerBuilder](self, "_canCommitTriggerBuilder"))
  {
    -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "showTriggerEnableSwitch");

    if ((v8 & 1) == 0)
    {
      -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", 1);

    }
    -[HUTriggerSummaryViewController _commitTriggerBuilder](self, "_commitTriggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUTriggerSummaryViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triggerEditor:didFinishWithTriggerBuilder:", self, v12);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)_done:(id)a3
{
  id v3;

  v3 = -[HUTriggerSummaryViewController commitChanges](self, "commitChanges", a3);
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUTriggerSummaryViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

}

- (void)_showShortcutEditorForTriggerBuilderItem:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(a3, "triggerBuilder");
  v5 = objc_claimAutoreleasedReturnValue();
  v16 = (id)v5;
  if (!a3)
  {
    NSLog(CFSTR("nil parameter"));
    if (v16)
      goto LABEL_3;
LABEL_5:
    NSLog(CFSTR("No trigger builder"));
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeWorkflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0DDA0F0]);
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithHomeWorkflow:actionSetBuilder:home:", v8, 0, v11);

  objc_msgSend(v12, "setDelegate:", self);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v12);
  objc_msgSend(v13, "setModalInPresentation:", 1);
  objc_msgSend(v13, "setModalPresentationStyle:", 2);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelShortcutEditor_);
  objc_msgSend(v12, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLeftBarButtonItem:", v14);

  -[HUTriggerSummaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)_cancelShortcutEditor:(id)a3
{
  -[HUTriggerSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_testTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_characteristicValueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allActionBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_map:", &__block_literal_global_39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__HUTriggerSummaryViewController__testTrigger__block_invoke_2;
  v17[3] = &unk_1E6F4F3F0;
  v18 = v8;
  v19 = v5;
  v12 = v5;
  v13 = v8;
  objc_msgSend(v10, "addSuccessBlock:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __46__HUTriggerSummaryViewController__testTrigger__block_invoke_5;
  v16[3] = &unk_1E6F4E2D8;
  v16[4] = self;
  v15 = (id)objc_msgSend(v14, "addFailureBlock:", v16);

}

uint64_t __46__HUTriggerSummaryViewController__testTrigger__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performValidation");
}

void __46__HUTriggerSummaryViewController__testTrigger__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_219);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_221);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "beginTransactionWithReason:", CFSTR("HUTriggerSummaryTransactionReasonTestTrigger"));
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "executeActions:", v4);

    objc_msgSend(*(id *)(a1 + 40), "commitTransactionWithReason:", CFSTR("HUTriggerSummaryTransactionReasonTestTrigger"));
  }

}

uint64_t __46__HUTriggerSummaryViewController__testTrigger__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __46__HUTriggerSummaryViewController__testTrigger__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

void __46__HUTriggerSummaryViewController__testTrigger__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30A58];
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_errorWithOperationType:failedItemName:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "handleError:", v8);
}

- (void)_addAction:(id)a3
{
  void *v4;
  void *v5;
  HUTriggerActionPickerViewController *v6;
  void *v7;
  HUTriggerActionPickerViewController *v8;
  void *v9;
  id v10;
  id v11;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentFlow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUTriggerActionFlow selectFlowForState:](HUTriggerActionFlow, "selectFlowForState:", objc_msgSend(v5, "flowState"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [HUTriggerActionPickerViewController alloc];
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:flow:delegate:](v6, "initWithTriggerBuilder:flow:delegate:", v7, v11, self);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v9, 1);

}

- (void)_deleteTrigger:(id)a3 indexPath:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "deleteConfirmationAlertTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteConfirmationAlertMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v12, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v11, "deleteInstructionDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke;
    v21[3] = &unk_1E6F4F440;
    objc_copyWeak(&v23, &location);
    v22 = v9;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v17);

    v18 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryDeleteTriggerCancelButtonTitle"), CFSTR("HUTriggerSummaryDeleteTriggerCancelButtonTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, &__block_literal_global_237);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v20);

    -[HUTriggerSummaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  else
  {
    NSLog(CFSTR("No trigger to delete"));
  }

}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_2;
  v6[3] = &unk_1E6F4C0D8;
  v6[4] = WeakRetained;
  v7 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerEditor:didFinishWithTriggerBuilder:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_3;
  v5[3] = &unk_1E6F4F418;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v5, 0);

}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_3(uint64_t a1, void *a2)
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

- (void)_setTriggerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerBuilderDidChange");

}

- (void)_removeActionsInServiceActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke;
  v21[3] = &unk_1E6F4F4A8;
  v21[4] = self;
  objc_msgSend(v7, "na_map:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "triggerActionSets");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeAnonymousActionBuilder:", v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

}

id __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anonymousActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke_2;
  v11[3] = &unk_1E6F4EFD8;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
}

- (id)itemTableHeaderMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HUPriorityMessageDefaultAttributedStringAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  objc_class *v25;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_10;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "testTriggerItem");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if ((id)v10 == v5)
  {
LABEL_9:

    goto LABEL_10;
  }
  v12 = (void *)v10;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createActionButtonItem");
  v14 = objc_claimAutoreleasedReturnValue();
  if ((id)v14 == v5)
  {

    v11 = v12;
    goto LABEL_9;
  }
  v15 = (void *)v14;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteTriggerItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 != v5)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "durationModule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "durationSummaryItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 != v5)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "durationModule");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "durationPickerItem");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23 != v5)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "namingRowItem");

      }
    }
  }
LABEL_10:
  v25 = (objc_class *)(id)objc_opt_class();

  return v25;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "namingRowItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if (v10)
    {
      objc_opt_class();
      v11 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      objc_msgSend(v13, "setDelegate:", self);
      objc_msgSend(v13, "setDisabled:", 0);
      objc_msgSend(v13, "textField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setClearButtonMode:", 3);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      objc_msgSend(v15, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNumberOfLines:", 0);
    }

    goto LABEL_11;
  }
  objc_msgSend(v15, "setDelegate:", self);
LABEL_11:

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v3;
  id v4;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTriggerSummaryViewController;
  v3 = a3;
  v4 = -[HUItemTableViewController automaticDisablingReasonsForItem:](&v7, sel_automaticDisablingReasonsForItem_, v3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  else
    return (unint64_t)v4;
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
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUTriggerSummaryViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v36, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unsupportedItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v11);

  if (v15)
  {
    v16 = v10;
    objc_msgSend(v16, "setAccessoryType:", 0);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_exclamationMarkImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDescriptionIcon:", v17);

    objc_msgSend(v16, "setHideDescriptionIcon:", 0);
    objc_msgSend(v16, "setHideIcon:", 0);
    objc_msgSend(v16, "setIconForegroundColorFollowsTintColor:", 1);
    objc_msgSend(v16, "setIconDisplayStyle:", 3);
    objc_msgSend(v16, "setDisabled:", 1);
LABEL_3:

    goto LABEL_4;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enableItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v11, "isEqual:", v19);

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      NSLog(CFSTR("Wrong cell class"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v10;
      objc_msgSend(v21, "setDelegate:", self);
      objc_msgSend(v11, "latestResults");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setOn:", objc_msgSend(v22, "integerValue") == 2);

      goto LABEL_3;
    }
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deleteTriggerItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "isEqual:", v24);

    if (!v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v10;
        objc_msgSend(v16, "setAccessoryType:", 0);
        objc_msgSend(v16, "setIconForegroundColorFollowsTintColor:", 0);
        objc_msgSend(v16, "setIconForegroundColor:", 0);
        objc_msgSend(v16, "setIconTintColorFollowsDisabledState:", 1);
      }
      else
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "namingRowItem");
        v27 = (id)objc_claimAutoreleasedReturnValue();

        if (v27 != v11)
          goto LABEL_4;
        v16 = v10;
        objc_msgSend(v16, "setHideIconButton:", 1);
        objc_msgSend(v16, "textField");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setClearButtonMode:", 3);

        objc_msgSend(v11, "latestResults");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D28]);
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "textField");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPlaceholder:", v30);

        objc_msgSend(v16, "textField");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = objc_msgSend(v32, "isFirstResponder");

        if ((v30 & 1) == 0)
        {
          objc_msgSend(v11, "latestResults");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "textField");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setText:", v34);

        }
      }
      goto LABEL_3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      NSLog(CFSTR("Wrong cell class"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setDestructive:", 1);
  }
LABEL_4:

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  HUTriggerEventsModuleController *v8;
  __objc2_class *v9;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = -[HUTriggerEventsModuleController initWithModule:]([HUTriggerEventsModuleController alloc], "initWithModule:", v4);
    -[HUTriggerEventsModuleController setDelegate:](v8, "setDelegate:", self);
    -[HUTriggerEventsModuleController setAllowsEditingEvents:](v8, "setAllowsEditingEvents:", -[HUTriggerSummaryViewController isEditingExistingTrigger](self, "isEditingExistingTrigger"));
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = HUTriggerDurationModuleController;
LABEL_9:
    v8 = (HUTriggerEventsModuleController *)objc_msgSend([v9 alloc], "initWithModule:", v4);
    -[HUTriggerEventsModuleController setDelegate:](v8, "setDelegate:", self);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[HUItemModuleController initWithModule:]([HUTriggerActionSetsModuleController alloc], "initWithModule:", v4);
    -[HUTriggerEventsModuleController setDelegate:](v8, "setDelegate:", self);
    -[HUTriggerSummaryViewController setActionSetsModuleController:](self, "setActionSetsModuleController:", v8);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = HUTriggerMediaModuleController;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:]([HUTriggerConditionEditorItemModuleController alloc], "initWithModule:delegate:", v4, self);
    -[HUTriggerSummaryViewController setConditionEditorModuleController:](self, "setConditionEditorModuleController:", v8);
  }
  else
  {
    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerSummaryViewController;
  v7 = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v14, sel_shouldHideSeparatorsForCell_indexPath_, a3, v6);
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "section");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == objc_msgSend(v10, "actionSetsSection"))
    {
      v8 = 1;
    }
    else
    {
      v11 = objc_msgSend(v6, "section");
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11 == objc_msgSend(v12, "serviceActionsSection");

    }
  }

  return v7 | v8;
}

- (id)childViewControllersToPreload
{
  void *v2;
  void *v3;

  -[HUTriggerSummaryViewController actionSetsModuleController](self, "actionSetsModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childViewControllersToPreload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTriggerSummaryViewController;
  -[HUItemTableViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUTriggerSummaryViewController _updateTableHeaderConfiguration](self, "_updateTableHeaderConfiguration");
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUTriggerSummaryViewController;
  v8 = a4;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v13, sel_itemManager_didUpdateResultsForItem_atIndexPath_, a3, v8, a5);
  -[HUItemTableViewController itemManager](self, "itemManager", v13.receiver, v13.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "durationModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "durationSummaryItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
    -[HUTriggerSummaryViewController _updateDurationModuleDynamicFooterView](self, "_updateDurationModuleDynamicFooterView");
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUTriggerSummaryViewController;
  v10 = a4;
  -[HUItemTableViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v15, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, v10, a5, a6);
  -[HUItemTableViewController itemManager](self, "itemManager", v15.receiver, v15.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "durationModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "durationSummaryItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "containsObject:", v13);

  if (v14)
    -[HUTriggerSummaryViewController _updateDurationModuleDynamicFooterView](self, "_updateDurationModuleDynamicFooterView");
}

- (void)_updateDurationModuleDynamicFooterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTriggerDurationItemModuleSection"));

  -[HUTriggerSummaryViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerViewForSection:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerTitleForSection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v11, "contentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "setText:", v7);
  objc_msgSend(v11, "setContentConfiguration:", v10);

}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namingRowItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namingRowItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUTriggerSummaryViewController setEditingName:](self, "setEditingName:", a3, a4, a5);
  -[HUTriggerSummaryViewController editingName](self, "editingName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[HUTriggerSummaryViewController editingName](self, "editingName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryViewController setTitle:](self, "setTitle:", v6);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerSummaryViewController setTitle:](self, "setTitle:", v8);

  }
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSectionForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "headerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    objc_msgSend(v5, "headerSecondaryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryText:", v8);

    objc_msgSend(v6, "directionalLayoutMargins");
    objc_msgSend(v6, "setDirectionalLayoutMargins:");
  }

  return v6;
}

- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerTitleForSection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "groupedFooterConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUTriggerSummaryViewController;
  v6 = a4;
  v7 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v22, sel_tableView_shouldHighlightRowAtIndexPath_, a3, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v22.receiver, v22.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[HUTriggerSummaryViewController isEditingExistingTrigger](self, "isEditingExistingTrigger");
    goto LABEL_12;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "testTriggerItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v11)
  {

LABEL_10:
    goto LABEL_11;
  }
  v12 = (void *)v11;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createActionButtonItem");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v14)
  {

    goto LABEL_10;
  }
  v15 = (void *)v14;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteTriggerItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v17)
  {
LABEL_11:
    v7 = 1;
    goto LABEL_12;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mediaModule");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mediaRowItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v20)
    v7 = 1;
LABEL_12:

  return v7;
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
  void *v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUTriggerSummaryViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v16.receiver, v16.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[HUTriggerSummaryViewController isEditingExistingTrigger](self, "isEditingExistingTrigger"))
  {
    -[HUTriggerSummaryViewController _showShortcutEditorForTriggerBuilderItem:](self, "_showShortcutEditorForTriggerBuilderItem:", v9);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testTriggerItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v11)
    {
      -[HUTriggerSummaryViewController _testTrigger](self, "_testTrigger");
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createActionButtonItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v13)
      {
        -[HUTriggerSummaryViewController _addAction:](self, "_addAction:", 0);
      }
      else
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deleteTriggerItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v15)
          -[HUTriggerSummaryViewController _deleteTrigger:indexPath:](self, "_deleteTrigger:indexPath:", v9, v6);
      }
    }
  }

}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShortcutOwned");

  if (v6)
  {
    -[HUTriggerSummaryViewController view](self, "view");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    -[HUTriggerSummaryViewController actionSetsModuleController](self, "actionSetsModuleController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadActions");

    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "triggerBuilderDidChange");

    -[HUTriggerSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  -[HUTriggerSummaryViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
    -[HUTriggerSummaryViewController _setTriggerEnabled:](self, "_setTriggerEnabled:", v4);
  v13 = (void *)MEMORY[0x1E0D31170];
  objc_msgSend(v9, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v9, v4, v15, self);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v13;
  HUTriggerSummaryViewController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v13, 0x16u);
  }

  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "openURL:", v8);

  }
  return 0;
}

- (void)actionSetsModuleController:(id)a3 didUpdateTriggerBuilder:(id)a4
{
  id v4;

  -[HUItemTableViewController itemManager](self, "itemManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerBuilderDidChange");

}

- (void)durationModuleController:(id)a3 requestsScrollToItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUTriggerSummaryViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 3, 1);

  }
  else
  {
    NSLog(CFSTR("Could not find index path for picker after turning it on"));
  }

}

- (void)eventsModuleController:(id)a3 pushViewController:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  -[HUTriggerSummaryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);

}

- (void)eventsModuleControllerDidUpdateTriggerBuilder:(id)a3
{
  id v3;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerBuilderDidChange");

}

- (void)_showEditorForTriggerBuilderItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HUTimerTriggerEditorViewController *v8;
  id v9;
  HUTimerTriggerEditorViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  HUCharacteristicTriggerEventViewController *v21;
  HUEventUIFlow *v22;
  HULocationEventEditorSummaryViewController *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v28 = a3;
  objc_opt_class();
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v28, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (v7)
      goto LABEL_6;
  }
  else
  {
    NSLog(CFSTR("nil parameter"));
    if (v7)
      goto LABEL_6;
  }
  NSLog(CFSTR("No trigger builder"));
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [HUTimerTriggerEditorViewController alloc];
    -[HUTriggerSummaryViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[HUTimerTriggerEditorViewController initWithTimerTriggerBuilder:mode:delegate:](v8, "initWithTimerTriggerBuilder:mode:delegate:", v7, 1, v9);
    goto LABEL_23;
  }
  if (!v6)
  {
LABEL_25:
    NSLog(CFSTR("Could not create trigger editor for item: %@"), v28);
    goto LABEL_26;
  }
  objc_opt_class();
  objc_msgSend(v6, "eventBuilders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v9 = v13;

  objc_msgSend(v6, "eventBuilders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF347FD0))
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v9)
  {
    v18 = objc_alloc(MEMORY[0x1E0D312B0]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithEventBuilders:", v19);

    v21 = [HUCharacteristicTriggerEventViewController alloc];
    -[HUTriggerSummaryViewController delegate](self, "delegate");
    v22 = (HUEventUIFlow *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUCharacteristicTriggerEventViewController initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:](v21, "initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:", v20, v6, 1, v22);
  }
  else
  {
    if (!v17)
    {
      v10 = 0;
      goto LABEL_22;
    }
    v24 = objc_alloc(MEMORY[0x1E0D314D8]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v24, "initWithEventBuilders:", v25);

    v22 = -[HUEventUIFlow initWithTriggerBuilder:eventBuilderItem:]([HUEventUIFlow alloc], "initWithTriggerBuilder:eventBuilderItem:", v6, v20);
    v23 = -[HULocationEventEditorSummaryViewController initWithFlow:stepIdentifier:]([HULocationEventEditorSummaryViewController alloc], "initWithFlow:stepIdentifier:", v22, CFSTR("locationEventEditor"));
  }
  v10 = (HUTimerTriggerEditorViewController *)v23;

LABEL_22:
LABEL_23:

  if (!v10)
    goto LABEL_25;
  -[HUTriggerSummaryViewController navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "hu_pushPreloadableViewController:animated:", v10, 1);

  -[HUTriggerSummaryViewController setDetailEditorChangedTrigger:](self, "setDetailEditorChangedTrigger:", 1);
LABEL_26:

}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4;

  v4 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
  -[HUTriggerSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mediaModuleController:(id)a3 pushViewController:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  -[HUTriggerSummaryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);

}

- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "containingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaModule");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaRowItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v11, "updateResultsForItems:senderSelector:", v16, a2);

    }
  }

}

- (void)textFieldDidFinishEditing:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController setEditingName:](self, "setEditingName:", v5);

  -[HUTriggerSummaryViewController _updateTriggerBuilderName](self, "_updateTriggerBuilderName");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObjects:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "updateResultsForItems:senderSelector:", v10, a2);

  -[HUTriggerSummaryViewController setEditingName:](self, "setEditingName:", 0);
}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[HUTriggerSummaryViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

  }
}

- (void)_updateTriggerBuilderName
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = (void *)MEMORY[0x1E0D319D0];
  -[HUTriggerSummaryViewController editingName](self, "editingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizeUserEnteredHomeKitName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController setEditingName:](self, "setEditingName:", v6);

  -[HUTriggerSummaryViewController editingName](self, "editingName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[HUTriggerSummaryViewController editingName](self, "editingName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        v10))
  {
    -[HUTriggerSummaryViewController editingName](self, "editingName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "triggerBuilder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", v12);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "triggerBuilder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNameIsConfigured:", 1);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "namingRowItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v17, "updateResultsForItems:senderSelector:", v21, a2);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "triggerBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNameIsConfigured:", 0);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "triggerBuilderDidChange");
  }

  -[HUItemTableViewController itemManager](self, "itemManager");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "triggerCurrentDisplayedName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController setTitle:](self, "setTitle:", v25);

}

- (void)_updateTableHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_opt_class();
  -[HUItemTableViewController itemTableHeaderView](self, "itemTableHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v13 = v4;

  if (v13)
  {
    objc_msgSend(v13, "messageTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allDisplayedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enableItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    objc_msgSend(v13, "setIncludeBottomSpacing:", v10);
    -[HUTriggerSummaryViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    -[HUTriggerSummaryViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

  }
}

- (BOOL)_canCommitTriggerBuilder
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (!v5)
    return 0;
  -[HUTriggerSummaryViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 1;
  -[HUTriggerSummaryViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "triggerEditor:shouldCommitTriggerBuilder:", self, v9);

  return v10;
}

- (id)_commitTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  -[HUTriggerSummaryViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[HUTriggerSummaryViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  objc_msgSend(v5, "startAnimating");
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commitItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke;
  v20[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v22, &location);
  v11 = v4;
  v21 = v11;
  v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v20);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_2;
  v18[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v19, &location);
  v13 = (id)objc_msgSend(v9, "addFailureBlock:", v18);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_4;
  v16[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v17, &location);
  v14 = (id)objc_msgSend(v9, "addSuccessBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v9;
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "triggerEditor:didCommitTriggerBuilder:withError:", WeakRetained, v10, v13);

  }
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  objc_msgSend(WeakRetained, "_sendNameAssignedEvent:error:", v5, v13);
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
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
  v6[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_3;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_done:", 0);
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@ succeeded commiting! Delegate is %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(WeakRetained, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "triggerEditor:didFinishWithTriggerBuilder:", WeakRetained, v11);

  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ didn't respond to didFinishWithTriggerBuilder so automatically dismissing", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_sendNameAssignedEvent:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D302B8]);

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D302C0]);

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D302C0]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUTriggerSummaryViewController isEditingExistingTrigger](self, "isEditingExistingTrigger"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D302C8]);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "nameIsConfigured"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D302D0]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 24, v6);
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[HUTriggerSummaryViewController triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerActionSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToHomeWorkflowActionSet:", v6);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerBuilderDidChange");

  -[HUTriggerSummaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate
{
  return self->_forwardingTriggerActionBuilderDelegate;
}

- (void)setForwardingTriggerActionBuilderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_forwardingTriggerActionBuilderDelegate, a3);
}

- (BOOL)isEditingExistingTrigger
{
  return self->_isEditingExistingTrigger;
}

- (void)setIsEditingExistingTrigger:(BOOL)a3
{
  self->_isEditingExistingTrigger = a3;
}

- (NSString)editingName
{
  return self->_editingName;
}

- (void)setEditingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (BOOL)detailEditorChangedTrigger
{
  return self->_detailEditorChangedTrigger;
}

- (void)setDetailEditorChangedTrigger:(BOOL)a3
{
  self->_detailEditorChangedTrigger = a3;
}

- (HUTriggerActionSetsModuleController)actionSetsModuleController
{
  return self->_actionSetsModuleController;
}

- (void)setActionSetsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetsModuleController, a3);
}

- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController
{
  return self->_conditionEditorModuleController;
}

- (void)setConditionEditorModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_conditionEditorModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionEditorModuleController, 0);
  objc_storeStrong((id *)&self->_actionSetsModuleController, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_editingName, 0);
  objc_storeStrong((id *)&self->_forwardingTriggerActionBuilderDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
