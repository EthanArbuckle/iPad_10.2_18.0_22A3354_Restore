@implementation HUCharacteristicTriggerEventViewController

- (HUCharacteristicTriggerEventViewController)initWithCharacteristicEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  HUCharacteristicTriggerEventItemManager *v13;
  HUCharacteristicTriggerEventViewController *v14;
  HUCharacteristicTriggerEventViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  char **v21;
  char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[HUCharacteristicTriggerEventItemManager initWithTriggerBuilder:eventBuilderItem:delegate:]([HUCharacteristicTriggerEventItemManager alloc], "initWithTriggerBuilder:eventBuilderItem:delegate:", v11, v10, self);
  v28.receiver = self;
  v28.super_class = (Class)HUCharacteristicTriggerEventViewController;
  v14 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v28, sel_initWithItemManager_tableViewStyle_, v13, 1);
  v15 = v14;
  if (v14)
  {
    -[HUCharacteristicTriggerEventViewController setEventBuilderItem:](v14, "setEventBuilderItem:", v10);
    -[HUCharacteristicTriggerEventViewController setTriggerBuilder:](v15, "setTriggerBuilder:", v11);
    -[HUCharacteristicTriggerEventViewController setMode:](v15, "setMode:", a5);
    -[HUCharacteristicTriggerEventViewController setDelegate:](v15, "setDelegate:", v12);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerEventOptionTitle"), CFSTR("HUCharacteristicTriggerEventOptionTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerEventViewController setTitle:](v15, "setTitle:", v16);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerEventViewController navigationItem](v15, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackButtonTitle:", v17);

    if (!a5)
    {
      objc_msgSend(v11, "triggerActionSets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasActions");
      v21 = &selRef__showSummary_;
      if (!v20)
        v21 = &selRef__showActionEditor_;
      v22 = *v21;

      v23 = objc_alloc(MEMORY[0x1E0CEA380]);
      _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorNextButton"), CFSTR("HUTimerTriggerEditorNextButton"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithTitle:style:target:action:", v24, 2, v15, v22);
      -[HUCharacteristicTriggerEventViewController navigationItem](v15, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setRightBarButtonItem:", v25);

      -[HUCharacteristicTriggerEventViewController _validateNextButton](v15, "_validateNextButton");
    }
  }

  return v15;
}

- (void)setSelectedEventOptionItem:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_selectedEventOptionItem) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedEventOptionItem, a3);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveOptionItem:", v6);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicTriggerEventViewController;
  -[HUItemTableViewController viewWillAppear:](&v22, sel_viewWillAppear_, a3);
  -[HUCharacteristicTriggerEventViewController eventBuilderItem](self, "eventBuilderItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUCharacteristicTriggerEventItemManager serviceVendorItemForEventBuilderItem:inHome:](HUCharacteristicTriggerEventItemManager, "serviceVendorItemForEventBuilderItem:inHome:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceVendingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setServiceVendingItem:", v8);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetItemProvidersAndModules");

    -[HUItemTableViewController itemManager](self, "itemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    -[HUCharacteristicTriggerEventViewController setSelectedEventOptionItem:](self, "setSelectedEventOptionItem:", 0);
  }
  -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allDisplayedItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke;
    v21[3] = &unk_1E6F51390;
    v21[4] = self;
    objc_msgSend(v20, "na_each:", v21);

  }
}

void __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[5];
  id v31;

  v3 = a2;
  objc_opt_class();
  v29 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v29;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_10;
  objc_msgSend(v5, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_8;
  }
  objc_msgSend(v5, "triggerValueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_8:
    objc_msgSend(v5, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke_2;
    v30[3] = &unk_1E6F59258;
    v30[4] = *(_QWORD *)(a1 + 32);
    v31 = v5;
    v9 = objc_msgSend(v8, "na_any:", v30);

    if ((v9 & 1) != 0)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "setSelectedEventOptionItem:", v5);
      objc_msgSend(*(id *)(a1 + 32), "_validateNextButton");
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v5, "thresholdValueRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventBuilders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v15, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "thresholdRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_thresholdValueForRange:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {

        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x1E0CBA4D0];
      objc_msgSend(v5, "characteristics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "thresholdValueRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v20, v21, v18);

      v23 = (void *)MEMORY[0x1E0CBA4D0];
      v24 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v15, "characteristic");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithObject:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "thresholdRange");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v23, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v26, v27, v18);

      objc_msgSend(v5, "setThresholdValue:", v18);
      if (v22 != v28)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventBuilderItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "representativeTriggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "wouldFireForCharacteristic:value:", v4, v6);

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicTriggerEventViewController;
  -[HUItemTableViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[HUCharacteristicTriggerEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUCharacteristicTriggerEventViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

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

  -[HUCharacteristicTriggerEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder", a3);
  v4 = [HUTriggerActionPickerViewController alloc];
  -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUCharacteristicTriggerEventViewController mode](self, "mode");
  -[HUCharacteristicTriggerEventViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:mode:delegate:](v4, "initWithTriggerBuilder:mode:delegate:", v5, v6, v7);

  -[HUCharacteristicTriggerEventViewController navigationController](self, "navigationController");
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

  -[HUCharacteristicTriggerEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder", a3);
  v4 = [HUTriggerSummaryViewController alloc];
  -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUCharacteristicTriggerEventViewController mode](self, "mode");
  -[HUCharacteristicTriggerEventViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:](v4, "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v5, v6, 0, v7);

  -[HUCharacteristicTriggerEventViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUTriggerConditionEditorItemModuleController *v5;
  HUTriggerConditionEditorItemModuleController *conditionModuleController;

  v4 = a3;
  v5 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:]([HUTriggerConditionEditorItemModuleController alloc], "initWithModule:delegate:", v4, self);

  conditionModuleController = self->_conditionModuleController;
  self->_conditionModuleController = v5;

  return self->_conditionModuleController;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceNameItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_7:
    v15 = (void *)objc_opt_class();
  }
  else
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainCharacteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "characteristicType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "containsObject:", v12);

    if (v13)
    {
      objc_msgSend(v9, "childItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)objc_opt_class();
      }
      else
      {
        objc_msgSend(v9, "thresholdValueRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_opt_class();

      }
    }
    else
    {
      v15 = (void *)objc_opt_class();
    }

  }
  v16 = v15;

  return v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id *v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;

  v43 = a3;
  v8 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceNameItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_opt_class();
    v13 = v43;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v13;
      if (v14)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

    }
    v15 = 0;
LABEL_9:

    objc_msgSend(v15, "setIconDisplayStyle:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentMetrics:", v18);

    objc_msgSend(v15, "setDisableContinuousIconAnimation:", 1);
    objc_msgSend(v15, "setAccessoryType:", -[HUCharacteristicTriggerEventViewController mode](self, "mode") == 1);
LABEL_53:

    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v19 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v15 = v20;

    objc_msgSend(v15, "childItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

      goto LABEL_16;
    }
    objc_msgSend(v15, "thresholdValueRange");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
LABEL_16:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_opt_class();
        v23 = v43;
        if (v23)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
          v25 = v23;
          if (v24)
            goto LABEL_24;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v22, objc_opt_class());

        }
        v25 = 0;
LABEL_24:

        objc_msgSend(v25, "setHideDescription:", 1);
        objc_msgSend(v25, "setHideIcon:", 1);
LABEL_52:

        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_53;
      v29 = objc_opt_class();
      v30 = v43;
      if (v30)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v25 = v30;
        if (v31)
          goto LABEL_35;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v29, objc_opt_class());

      }
      v25 = 0;
LABEL_35:

      objc_msgSend(v25, "setHideIcon:", 1);
      objc_msgSend(v25, "setValueColorFollowsTintColor:", 1);
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTintColor:", v34);
LABEL_51:

      goto LABEL_52;
    }
    v36 = objc_opt_class();
    v37 = v43;
    if (v37)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v25 = v37;
      if (v38)
        goto LABEL_44;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v36, objc_opt_class());

    }
    v25 = 0;
LABEL_44:

    objc_msgSend(v25, "setDelegate:", self);
    objc_msgSend(v25, "setItem:", v15);
    -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "thresholdValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __74__HUCharacteristicTriggerEventViewController_setupCell_forItem_indexPath___block_invoke;
      v44[3] = &unk_1E6F56A88;
      v5 = &v45;
      v45 = v15;
      objc_msgSend(v34, "na_firstObjectPassingTest:", v44);
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v15, "setThresholdValue:", v42);
    if (v42)
      objc_msgSend(v25, "setSelectedIndex:animated:", objc_msgSend(MEMORY[0x1E0CBA458], "hf_indexOfSortedValues:closestToValue:", v34, v42), 0);

    if (!v41)
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[HUListContentConfigurationUtilities instructionsConfigurationForItem:](HUListContentConfigurationUtilities, "instructionsConfigurationForItem:", v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setContentConfiguration:", v15);
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setBackgroundConfiguration:", v28);

    goto LABEL_53;
  }
LABEL_54:

}

uint64_t __74__HUCharacteristicTriggerEventViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isValidThresholdValue:", a2);
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  _BOOL8 v30;
  objc_super v31;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v10;
      objc_msgSend(v13, "item");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        v16 = 3;
      else
        v16 = 0;
      objc_msgSend(v13, "setAccessoryType:", v16);

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v17 = v11;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v14 = v18;

      objc_opt_class();
      v19 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      objc_msgSend(v21, "setItem:", v14);
      -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "thresholdValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CBA458];
        objc_msgSend(v14, "thresholdValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "hf_indexOfSortedValues:closestToValue:", v22, v25);

        objc_msgSend(v21, "setSelectedIndex:animated:", v26, 0);
      }

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      objc_msgSend(v14, "item");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27 == v28;
      v30 = v27 != v28;

      objc_msgSend(v14, "setHideValue:", v30);
      objc_msgSend(v14, "setChecked:", v29);
LABEL_19:

    }
  }
  v31.receiver = self;
  v31.super_class = (Class)HUCharacteristicTriggerEventViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v31, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicTriggerEventViewController;
  -[HUItemTableViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUCharacteristicTriggerEventViewController _validateNextButton](self, "_validateNextButton");
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUCharacteristicTriggerEventSectionIdentifierInstructions"));

  return v6;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUCharacteristicTriggerEventSectionIdentifierInstructions"));

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instructionsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v11)
  {
    v14 = 0;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceNameItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v13)
    {
      v14 = -[HUCharacteristicTriggerEventViewController mode](self, "mode") == 1;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)HUCharacteristicTriggerEventViewController;
      v14 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v16, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
    }
  }

  return v14;
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
  int v13;
  void *v14;
  unint64_t v15;
  HUAccessoryEventPickerViewController *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  HUAccessoryEventPickerViewController *v21;
  void *v22;
  id v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUCharacteristicTriggerEventViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v24, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceNameItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqual:", v12);

    if (v13)
    {
      -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[HUCharacteristicTriggerServicePickerViewController sourceForTriggerBuilder:](HUCharacteristicTriggerServicePickerViewController, "sourceForTriggerBuilder:", v14);

      v16 = [HUAccessoryEventPickerViewController alloc];
      -[HUCharacteristicTriggerEventViewController eventBuilderItem](self, "eventBuilderItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HUCharacteristicTriggerEventViewController mode](self, "mode");
      -[HUCharacteristicTriggerEventViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HUAccessoryEventPickerViewController initWithEventBuilderItem:triggerBuilder:mode:source:delegate:](v16, "initWithEventBuilderItem:triggerBuilder:mode:source:delegate:", v17, v18, v19, v15, v20);

      -[HUCharacteristicTriggerEventViewController navigationController](self, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v21, 1);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        -[HUCharacteristicTriggerEventViewController setSelectedEventOptionItem:](self, "setSelectedEventOptionItem:", v9);
        -[HUCharacteristicTriggerEventViewController _updateVisibleCellCheckmarks](self, "_updateVisibleCellCheckmarks");
      }
    }
  }

}

- (id)visibleTriggerValuesForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EF8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v3, "visibleTriggerValues");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)_updateVisibleCellCheckmarks
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;
  __objc2_class **v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __objc2_class **v18;
  void *v19;
  __objc2_class **v20;
  _BOOL8 v21;
  _BOOL8 v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HUCharacteristicTriggerEventViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    v7 = off_1E6F3D000;
    v8 = off_1E6F3C000;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "item");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v11, "item");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v14 == v15;
            v16 = v5;
            v17 = v6;
            v18 = v7;
            v19 = v3;
            v20 = v8;
            v21 = v14 != v15;

            v22 = v21;
            v8 = v20;
            v3 = v19;
            v7 = v18;
            v6 = v17;
            v5 = v16;
            objc_msgSend(v11, "setHideValue:", v22);
            objc_msgSend(v11, "setChecked:", v30);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v23 = v10;
          objc_msgSend(v23, "item");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v25 = objc_opt_isKindOfClass();

          if ((v25 & 1) != 0)
          {
            objc_msgSend(v23, "item");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 == v27)
              v28 = 3;
            else
              v28 = 0;
            objc_msgSend(v23, "setAccessoryType:", v28);

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }

  -[HUCharacteristicTriggerEventViewController _validateNextButton](self, "_validateNextButton");
}

- (BOOL)_canContinue
{
  void *v2;
  BOOL v3;

  -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_canCommitTriggerBuilder
{
  _BOOL4 v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = -[HUCharacteristicTriggerEventViewController _canContinue](self, "_canContinue");
  if (v3)
  {
    -[HUCharacteristicTriggerEventViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[HUCharacteristicTriggerEventViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "triggerEditor:shouldCommitTriggerBuilder:", self, v7);

      LOBYTE(v3) = v8;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)_commitTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 41);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUCharacteristicTriggerEventViewController _canCommitTriggerBuilder](self, "_canCommitTriggerBuilder"))
  {
    -[HUCharacteristicTriggerEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
    -[HUCharacteristicTriggerEventViewController triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commitItem");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (void)_validateNextButton
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[HUCharacteristicTriggerEventViewController _canContinue](self, "_canContinue");
  -[HUCharacteristicTriggerEventViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_updateTriggerBuilder
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];

  -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristics");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerValueRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thresholdValueRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "triggerValueRangeByApplyingThreshold");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    if (v8)
      v13 = v8;
    else
      v13 = v12;
    if (v6)
      v14 = v6;
    else
      v14 = v13;
    v15 = v14;
    v16 = v13;
    -[HUCharacteristicTriggerEventViewController eventBuilderItem](self, "eventBuilderItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCharacteristics:triggerValue:", v22, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "deletions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke;
    v24[3] = &unk_1E6F51CF0;
    v24[4] = self;
    objc_msgSend(v19, "na_each:", v24);

    objc_msgSend(v18, "additions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke_2;
    v23[3] = &unk_1E6F51CF0;
    v23[4] = self;
    objc_msgSend(v21, "na_each:", v23);

  }
}

void __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventBuilder:", v3);

}

void __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventBuilder:", v3);

}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4;

  v4 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
  -[HUCharacteristicTriggerEventViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfValuesForPickerViewCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)pickerViewCell:(id)a3 canSelectValueAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "isValidThresholdValue:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 > a4)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v9, "localizedListDescriptionForThresholdValue:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v14, "initWithString:", v15);

      if ((objc_msgSend(v9, "isValidThresholdValue:", v13) & 1) == 0)
      {
        v16 = *MEMORY[0x1E0CEA0A0];
        objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v12, "length"));

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
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
  id v19;

  v7 = a3;
  objc_opt_class();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v19 = v9;

  v10 = v19;
  if (v19)
  {
    -[HUCharacteristicTriggerEventViewController visibleTriggerValuesForItem:](self, "visibleTriggerValuesForItem:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setThresholdValue:", v12);

    -[HUCharacteristicTriggerEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[HUCharacteristicTriggerEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_setWithSafeObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v14, "updateResultsForItems:senderSelector:", v17, a2);

    v10 = v19;
  }

}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilderItem, a3);
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HUCharacteristicEventOptionItem)selectedEventOptionItem
{
  return self->_selectedEventOptionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEventOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end
