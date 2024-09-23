@implementation HUTriggerTypePickerViewController

- (HUTriggerTypePickerViewController)initWithActionSetBuilder:(id)a3 delegate:(id)a4
{
  return -[HUTriggerTypePickerViewController initWithActionSetBuilder:anonymousActionBuilders:delegate:](self, "initWithActionSetBuilder:anonymousActionBuilders:delegate:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (HUTriggerTypePickerViewController)initWithActionSetBuilder:(id)a3 anonymousActionBuilders:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUTriggerTypePickerItemManager *v12;
  HUTriggerTypePickerViewController *v13;
  HUTriggerTypePickerViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[HFItemManager initWithDelegate:]([HUTriggerTypePickerItemManager alloc], "initWithDelegate:", self);
  v21.receiver = self;
  v21.super_class = (Class)HUTriggerTypePickerViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v21, sel_initWithItemManager_tableViewStyle_, v12, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v14->_actionSetBuilder, a3);
    objc_storeStrong((id *)&v14->_anonymousActionBuilders, a4);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTypePickerTitle"), CFSTR("HUTriggerTypePickerTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerTypePickerViewController setTitle:](v14, "setTitle:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v14, sel__cancel_);
    -[HUTriggerTypePickerViewController navigationItem](v14, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLeftBarButtonItem:", v16);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerTypePickerViewController navigationItem](v14, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackButtonTitle:", v18);

  }
  return v14;
}

- (void)setShowSuggestedAutomations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSuggestedAutomations:", v3);

}

- (BOOL)showSuggestedAutomations
{
  void *v2;
  char v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSuggestedAutomations");

  return v3;
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUTriggerTypePickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HURecommendedTriggerItemModuleController *v7;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedAutomationsModule");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = -[HUItemModuleController initWithModule:]([HURecommendedTriggerItemModuleController alloc], "initWithModule:", v4);
    -[HURecommendedTriggerItemModuleController setDelegate:](v7, "setDelegate:", self);
    -[HURecommendedTriggerItemModuleController setAnalyticsPresentationContext:](v7, "setAnalyticsPresentationContext:", CFSTR("trigger-type-picker"));
    objc_storeWeak((id *)&self->_recommendationModuleController, v7);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return (Class)(id)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    v16 = v10;
    objc_msgSend(v16, "setDisabled:", v15);
    objc_msgSend(v16, "setAccessoryType:", v15 ^ 1);
    if ((_DWORD)v15)
      v17 = 0.200000003;
    else
      v17 = 1.0;
    objc_msgSend(v16, "setIconAlpha:", v17);
    objc_msgSend(v16, "setTextAlpha:", v17);
    objc_msgSend(v16, "setIconDisplayStyle:", 1);

  }
  v18.receiver = self;
  v18.super_class = (Class)HUTriggerTypePickerViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v18, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUTriggerTypePickerViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v17.receiver, v17.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
  {
    -[HUTriggerTypePickerViewController _createTriggerEditorForItem:](self, "_createTriggerEditorForItem:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "setModalInPresentation:", 1);
      -[HUTriggerTypePickerViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "hu_pushPreloadableViewController:animated:", v14, 1);

    }
  }

}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HUTriggerTypePickerViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerEditor:didFinishWithTriggerBuilder:", v7, v6);

}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[HUTriggerTypePickerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUTriggerTypePickerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "triggerEditor:shouldCommitTriggerBuilder:", v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestedAutomationsModule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suggestionItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "containsItem:", v16);

    if (!v17)
      goto LABEL_5;
    -[HUTriggerTypePickerViewController recommendationModuleController](self, "recommendationModuleController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "suggestionItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didCommitTriggerBuilderForItem:withError:", v19, v9);

  }
LABEL_5:
  -[HUTriggerTypePickerViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[HUTriggerTypePickerViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "triggerEditor:didCommitTriggerBuilder:withError:", v23, v8, v9);

  }
}

- (void)recommendedTriggerModuleController:(id)a3 didSelectToOpenTriggerBuilder:(id)a4
{
  id v5;
  HUTriggerActionFlow *v6;
  void *v7;
  HUTriggerBuilderContext *v8;
  void *v9;
  void *v10;
  void *v11;
  HUTriggerSummaryViewController *v12;
  void *v13;
  id v14;
  id v15;

  v5 = a4;
  v6 = -[HUTriggerActionFlow initWithFlowState:]([HUTriggerActionFlow alloc], "initWithFlowState:", 0);
  -[HUTriggerActionFlow getNextState](v6, "getNextState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(HUTriggerBuilderContext);
  objc_msgSend(v5, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerBuilderContext setShowTriggerDeleteButton:](v8, "setShowTriggerDeleteButton:", v9 != 0);

  objc_msgSend(v5, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerBuilderContext setSuggestionItem:](v8, "setSuggestionItem:", v11);

  objc_msgSend(v5, "triggerBuilderWithContext:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v12 = -[HUTriggerSummaryViewController initWithTriggerBuilder:flow:delegate:]([HUTriggerSummaryViewController alloc], "initWithTriggerBuilder:flow:delegate:", v15, v7, self);
  -[HUTriggerSummaryViewController setModalInPresentation:](v12, "setModalInPresentation:", 1);
  -[HUTriggerTypePickerViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);

}

- (void)recommendedTriggerModuleControllerDidSelectShowMore:(id)a3
{
  HUSimpleItemModuleTableViewController *v4;
  HUSimpleItemModuleTableViewController *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v4 = [HUSimpleItemModuleTableViewController alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__HUTriggerTypePickerViewController_recommendedTriggerModuleControllerDidSelectShowMore___block_invoke_2;
  v9[3] = &unk_1E6F57F50;
  v9[4] = self;
  v5 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](v4, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 1, &__block_literal_global_200, v9);
  -[HUSimpleItemModuleTableViewController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HURecommendedAutomationsSectionTitle"), CFSTR("HURecommendedAutomationsSectionTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSimpleItemModuleTableViewController setTitle:](v5, "setTitle:", v6);

  -[HUTriggerTypePickerViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "hu_pushPreloadableViewController:animated:", v5, 1);

}

id __89__HUTriggerTypePickerViewController_recommendedTriggerModuleControllerDidSelectShowMore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HURecommendedTriggerItemModule *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  v6 = -[HURecommendedTriggerItemModule initWithItemUpdater:home:]([HURecommendedTriggerItemModule alloc], "initWithItemUpdater:home:", v4, v5);

  -[HURecommendedTriggerItemModule setMaximumNumberOfShownRecommendations:](v6, "setMaximumNumberOfShownRecommendations:", 0x7FFFFFFFFFFFFFFFLL);
  -[HURecommendedTriggerItemModule setHideSectionHeaderTitle:](v6, "setHideSectionHeaderTitle:", 1);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HURecommendedTriggerItemModuleController *__89__HUTriggerTypePickerViewController_recommendedTriggerModuleControllerDidSelectShowMore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HURecommendedTriggerItemModuleController *v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = -[HUItemModuleController initWithModule:]([HURecommendedTriggerItemModuleController alloc], "initWithModule:", v6);
    -[HURecommendedTriggerItemModuleController setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_createTriggerEditorForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HULocationTriggerEditorSummaryViewController *v21;
  void *v22;
  uint64_t v23;
  HUTimerTriggerEditorViewController *v24;
  HUTimerTriggerEditorViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  HUAccessoryEventPickerViewController *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  HUAccessoryEventPickerViewController *v48;
  void *v49;
  HUTriggerSummaryViewController *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerTriggerItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v25 = [HUTimerTriggerEditorViewController alloc];
    -[HUTriggerTypePickerViewController _createTriggerBuilderOfClass:](self, "_createTriggerBuilderOfClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerTypePickerViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HUTimerTriggerEditorViewController initWithTimerTriggerBuilder:mode:delegate:](v25, "initWithTimerTriggerBuilder:mode:delegate:", v26, 0, v27);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leavingLocationTriggerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v8;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrivingAtLocationTriggerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v4);

    if (v12)
    {
      -[HUTriggerTypePickerViewController _createTriggerBuilderOfClass:](self, "_createTriggerBuilderOfClass:", objc_opt_class());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leavingLocationTriggerItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 == v4)
        v16 = 2;
      else
        v16 = 1;

      -[HUItemTableViewController itemManager](self, "itemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HULocationTriggerEditorSummaryViewController defaultLocationEventBuilderForHome:eventType:](HULocationTriggerEditorSummaryViewController, "defaultLocationEventBuilderForHome:eventType:", v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationInterface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocationEventBuilder:", v19);

      v21 = [HULocationTriggerEditorSummaryViewController alloc];
      -[HUTriggerTypePickerViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HULocationTriggerEditorSummaryViewController initWithTriggerBuilder:mode:delegate:](v21, "initWithTriggerBuilder:mode:delegate:", v13, 0, v22);
      goto LABEL_7;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "characteristicTriggerItem");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29 == v4)
    {
      -[HUTriggerTypePickerViewController _createTriggerBuilderOfClass:](self, "_createTriggerBuilderOfClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerTypePickerViewController anonymousActionBuilders](self, "anonymousActionBuilders");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = __65__HUTriggerTypePickerViewController__createTriggerEditorForItem___block_invoke;
      v55 = &unk_1E6F5A7E8;
      v56 = v34;
      v13 = v34;
      objc_msgSend(v35, "na_each:", &v52);

      objc_msgSend(v13, "eventBuilders", v52, v53, v54, v55);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "na_map:", &__block_literal_global_82_1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_alloc(MEMORY[0x1E0D312B0]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v38, "initWithEventBuilders:", v39);

      v41 = [HUAccessoryEventPickerViewController alloc];
      -[HUTriggerTypePickerViewController delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HUAccessoryEventPickerViewController initWithEventBuilderItem:triggerBuilder:mode:source:delegate:](v41, "initWithEventBuilderItem:triggerBuilder:mode:source:delegate:", v40, v13, 0, 1, v42);

      goto LABEL_15;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "alarmTriggerItem");
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (v31 == v4)
    {
      -[HUTriggerTypePickerViewController _createTriggerBuilderOfClass:](self, "_createTriggerBuilderOfClass:", objc_opt_class());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "eventBuilders");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "na_map:", &__block_literal_global_87_1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_alloc(MEMORY[0x1E0D312B0]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v45, "initWithEventBuilders:", v46);

      v48 = [HUAccessoryEventPickerViewController alloc];
      -[HUTriggerTypePickerViewController delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HUAccessoryEventPickerViewController initWithEventBuilderItem:triggerBuilder:mode:source:delegate:](v48, "initWithEventBuilderItem:triggerBuilder:mode:source:delegate:", v47, v13, 0, 0, v49);

      goto LABEL_15;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "customAutomationItem");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    if (v33 == v4)
    {
      -[HUTriggerTypePickerViewController _createTriggerBuilderOfClass:](self, "_createTriggerBuilderOfClass:", objc_opt_class());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setName:", CFSTR("Custom Automation"));
      v51 = [HUTriggerSummaryViewController alloc];
      -[HUTriggerTypePickerViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:](v51, "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v13, 0, 0, v22);
LABEL_7:
      v24 = (HUTimerTriggerEditorViewController *)v23;

LABEL_15:
      goto LABEL_16;
    }
    v24 = 0;
  }
LABEL_16:

  return v24;
}

void __65__HUTriggerTypePickerViewController__createTriggerEditorForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerActionSets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnonymousActionBuilder:", v3);

}

id __65__HUTriggerTypePickerViewController__createTriggerEditorForItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id __65__HUTriggerTypePickerViewController__createTriggerEditorForItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_createTriggerBuilderOfClass:(Class)a3
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
  _QWORD v15[4];
  id v16;

  v4 = [a3 alloc];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(v4, "initWithHome:context:", v6, v7);

  -[HUTriggerTypePickerViewController actionSetBuilder](self, "actionSetBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "triggerActionSets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerTypePickerViewController actionSetBuilder](self, "actionSetBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addActionSetBuilder:", v11);

  }
  -[HUTriggerTypePickerViewController anonymousActionBuilders](self, "anonymousActionBuilders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUTriggerTypePickerViewController anonymousActionBuilders](self, "anonymousActionBuilders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__HUTriggerTypePickerViewController__createTriggerBuilderOfClass___block_invoke;
    v15[3] = &unk_1E6F5A7E8;
    v16 = v8;
    objc_msgSend(v13, "na_each:", v15);

  }
  return v8;
}

void __66__HUTriggerTypePickerViewController__createTriggerBuilderOfClass___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerActionSets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnonymousActionBuilder:", v3);

}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetBuilder, a3);
}

- (NSArray)anonymousActionBuilders
{
  return self->_anonymousActionBuilders;
}

- (void)setAnonymousActionBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousActionBuilders, a3);
}

- (HURecommendedTriggerItemModuleController)recommendationModuleController
{
  return (HURecommendedTriggerItemModuleController *)objc_loadWeakRetained((id *)&self->_recommendationModuleController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recommendationModuleController);
  objc_storeStrong((id *)&self->_anonymousActionBuilders, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
