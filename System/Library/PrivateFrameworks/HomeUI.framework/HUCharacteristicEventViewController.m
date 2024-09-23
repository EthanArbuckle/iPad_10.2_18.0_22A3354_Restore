@implementation HUCharacteristicEventViewController

- (HUCharacteristicEventViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4
{
  id v6;
  id v7;
  HUCharacteristicEventItemManager *v8;
  HUCharacteristicEventViewController *v9;
  HUTriggerConditionEditorItemModuleController *v10;
  void *v11;
  uint64_t v12;
  HUTriggerConditionEditorItemModuleController *conditionModuleController;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[HUCharacteristicEventItemManager initWithTriggerBuilder:eventBuilderItem:delegate:]([HUCharacteristicEventItemManager alloc], "initWithTriggerBuilder:eventBuilderItem:delegate:", v7, v6, self);
  v18.receiver = self;
  v18.super_class = (Class)HUCharacteristicEventViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v18, sel_initWithItemManager_tableViewStyle_, v8, 1);
  if (v9)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v10 = [HUTriggerConditionEditorItemModuleController alloc];
      -[HUCharacteristicEventItemManager conditionModule](v8, "conditionModule");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:](v10, "initWithModule:delegate:", v11, v9);
      conditionModuleController = v9->_conditionModuleController;
      v9->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v12;

    }
    -[HUCharacteristicEventViewController setEventBuilderItem:](v9, "setEventBuilderItem:", v6);
    -[HUCharacteristicEventViewController setTriggerBuilder:](v9, "setTriggerBuilder:", v7);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicEventOptionTitle"), CFSTR("HUCharacteristicEventOptionTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicEventViewController setTitle:](v9, "setTitle:", v14);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicEventViewController navigationItem](v9, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackButtonTitle:", v15);

  }
  return v9;
}

- (HUCharacteristicEventViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HUCharacteristicEventViewController *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBuilderItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUCharacteristicEventViewController initWithEventBuilderItem:triggerBuilder:](self, "initWithEventBuilderItem:triggerBuilder:", v8, v9);

  if (v10)
  {
    -[HUCharacteristicEventViewController setFlow:](v10, "setFlow:", v6);
    -[HUCharacteristicEventViewController setStepIdentifier:](v10, "setStepIdentifier:", v7);
  }

  return v10;
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

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUCharacteristicEventViewController conditionModuleController](self, "conditionModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[HUCharacteristicEventViewController flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowDoneButtonForStep:", v4);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = sel__doneButtonPressed_;
LABEL_5:
    v12 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, v8);
    -[HUCharacteristicEventViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    goto LABEL_6;
  }
  -[HUCharacteristicEventViewController flow](self, "flow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventViewController stepIdentifier](self, "stepIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "shouldShowNextButtonForStep:", v10);

  if (v11)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorNextButton"), CFSTR("HUTimerTriggerEditorNextButton"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = sel__nextButtonPressed_;
    goto LABEL_5;
  }
LABEL_6:
  -[HUCharacteristicEventViewController _validateNextButton](self, "_validateNextButton");
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
  v22.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController viewWillAppear:](&v22, sel_viewWillAppear_, a3);
  -[HUCharacteristicEventViewController eventBuilderItem](self, "eventBuilderItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUCharacteristicEventItemManager serviceVendorItemForEventBuilderItem:inHome:](HUCharacteristicEventItemManager, "serviceVendorItemForEventBuilderItem:inHome:", v5, v7);
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

    -[HUCharacteristicEventViewController setSelectedEventOptionItem:](self, "setSelectedEventOptionItem:", 0);
  }
  -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allDisplayedItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke;
    v21[3] = &unk_1E6F51390;
    v21[4] = self;
    objc_msgSend(v20, "na_each:", v21);

  }
}

void __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[5];
  id v23;

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
    objc_msgSend(v6, "triggerValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v6, "triggerValueRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v6, "thresholdValueRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_10;
        v16 = 0;
        v17 = &v16;
        v18 = 0x3032000000;
        v19 = __Block_byref_object_copy__31;
        v20 = __Block_byref_object_dispose__31;
        v21 = 0;
        objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventBuilders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_22;
        v15[3] = &unk_1E6F5D900;
        v15[4] = &v16;
        v14 = objc_msgSend(v13, "na_any:", v15);

        if (!v14)
        {
          _Block_object_dispose(&v16, 8);

          goto LABEL_10;
        }
        objc_msgSend(v6, "setThresholdValue:", v17[5]);
        _Block_object_dispose(&v16, 8);

        goto LABEL_9;
      }
    }
    objc_msgSend(v6, "characteristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_2;
    v22[3] = &unk_1E6F59258;
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v6;
    v10 = objc_msgSend(v9, "na_any:", v22);

    if ((v10 & 1) != 0)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "setSelectedEventOptionItem:", v6);
      objc_msgSend(*(id *)(a1 + 32), "_validateNextButton");
    }
  }
LABEL_10:

}

uint64_t __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
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

BOOL __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v4, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thresholdRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_thresholdValueForRange:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
  return v12;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[HUCharacteristicEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
}

- (void)_nextButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[HUCharacteristicEventViewController flow](self, "flow", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didFinishStepWithIdentifier:", self, v4);

}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  id v5;

  -[HUCharacteristicEventViewController flow](self, "flow", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didFinishStepWithIdentifier:", self, v4);

}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
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
  objc_class *v12;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceNameItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_6:
    v11 = (void *)objc_opt_class();
  }
  else
  {
    v9 = v5;
    objc_msgSend(v9, "childItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_opt_class();
    }
    else
    {
      objc_msgSend(v9, "thresholdValueRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_class();

    }
  }
  v12 = v11;

  return v12;
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
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;

  v40 = a3;
  v8 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceNameItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_opt_class();
    v13 = v40;
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
    -[HUCharacteristicEventViewController flow](self, "flow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "characteristicEditorAllowChangingCharacteristic:", self);

    objc_msgSend(v15, "setAccessoryType:", v20);
    if (v20)
      v21 = 3;
    else
      v21 = 0;
    objc_msgSend(v15, "setSelectionStyle:", v21);
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v22 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v15 = v23;

    objc_msgSend(v15, "childItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

      goto LABEL_19;
    }
    objc_msgSend(v15, "thresholdValueRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
LABEL_19:
      v25 = objc_opt_class();
      v26 = v40;
      if (v26)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = v26;
        else
          v27 = 0;
        v28 = v26;
        if (v27)
          goto LABEL_26;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v25, objc_opt_class());

      }
      v28 = 0;
LABEL_26:

      objc_msgSend(v28, "setHideDescription:", 1);
      objc_msgSend(v28, "setHideIcon:", 1);
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    v32 = objc_opt_class();
    v33 = v40;
    if (v33)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v28 = v33;
      if (v34)
        goto LABEL_35;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v32, objc_opt_class());

    }
    v28 = 0;
LABEL_35:

    objc_msgSend(v28, "setDelegate:", self);
    objc_msgSend(v28, "setItem:", v15);
    objc_msgSend(v15, "validTriggerValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "thresholdValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __67__HUCharacteristicEventViewController_setupCell_forItem_indexPath___block_invoke;
      v41[3] = &unk_1E6F56A88;
      v5 = &v42;
      v42 = v15;
      objc_msgSend(v36, "na_firstObjectPassingTest:", v41);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v15, "setThresholdValue:", v39);
    if (v39)
      objc_msgSend(v28, "setSelectedIndex:animated:", objc_msgSend(MEMORY[0x1E0CBA458], "hf_indexOfSortedValues:closestToValue:", v36, v39), 0);

    if (!v38)
    goto LABEL_43;
  }
LABEL_45:

}

uint64_t __67__HUCharacteristicEventViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, uint64_t a2)
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_super v25;

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
      -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        v16 = 3;
      else
        v16 = 0;
      objc_msgSend(v13, "setAccessoryType:", v16);

LABEL_16:
      goto LABEL_17;
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
      v15 = v20;

      objc_msgSend(v15, "setItem:", v14);
      objc_msgSend(v14, "thresholdValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v14, "validTriggerValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "thresholdValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "indexOfObject:", v23);

        objc_msgSend(v15, "setSelectedIndex:animated:", v24, 0);
      }
      goto LABEL_16;
    }
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v25, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUCharacteristicEventViewController _validateNextButton](self, "_validateNextButton");
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
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUCharacteristicEventSectionIdentifierInstructions"));

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
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUCharacteristicEventSectionIdentifierInstructions"));

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
  void *v15;
  objc_super v17;

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
      -[HUCharacteristicEventViewController flow](self, "flow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v15, "characteristicEditorAllowChangingCharacteristic:", self);

    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HUCharacteristicEventViewController;
      v14 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v17, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
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
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUCharacteristicEventViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
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
      -[HUCharacteristicEventViewController flow](self, "flow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "characteristicEditorDidSelectToChangeCharacteristic:", self);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        -[HUCharacteristicEventViewController setSelectedEventOptionItem:](self, "setSelectedEventOptionItem:", v9);
        -[HUCharacteristicEventViewController _updateVisibleCellCheckmarks](self, "_updateVisibleCellCheckmarks");
      }
    }
  }

}

- (void)_updateVisibleCellCheckmarks
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUCharacteristicEventViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "item");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "item");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 == v14)
              v15 = 3;
            else
              v15 = 0;
            objc_msgSend(v10, "setAccessoryType:", v15);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[HUCharacteristicEventViewController _validateNextButton](self, "_validateNextButton");
}

- (BOOL)_canContinue
{
  void *v2;
  BOOL v3;

  -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

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

  if (-[HUCharacteristicEventViewController _canCommitTriggerBuilder](self, "_canCommitTriggerBuilder"))
  {
    -[HUCharacteristicEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
    -[HUCharacteristicEventViewController triggerBuilder](self, "triggerBuilder");
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

  v3 = -[HUCharacteristicEventViewController _canContinue](self, "_canContinue");
  -[HUCharacteristicEventViewController navigationItem](self, "navigationItem");
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
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];

  -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristics");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerValueRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thresholdValueRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
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
    v14 = v13;
    -[HUCharacteristicEventViewController eventBuilderItem](self, "eventBuilderItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v6)
      v17 = v6;
    else
      v17 = v14;
    objc_msgSend(v15, "setCharacteristics:triggerValue:", v27, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventViewController flow](self, "flow");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_14;
    v20 = (void *)v19;
    -[HUCharacteristicEventViewController flow](self, "flow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicEventViewController stepIdentifier](self, "stepIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "shouldSaveEventBuildersToTriggerBuilderForStep:", v22);

    if (v23)
    {
LABEL_14:
      objc_msgSend(v18, "deletions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke;
      v29[3] = &unk_1E6F51CF0;
      v29[4] = self;
      objc_msgSend(v24, "na_each:", v29);

      objc_msgSend(v18, "additions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v25;
      v28[1] = 3221225472;
      v28[2] = __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke_2;
      v28[3] = &unk_1E6F51CF0;
      v28[4] = self;
      objc_msgSend(v26, "na_each:", v28);

    }
  }
}

void __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke(uint64_t a1, void *a2)
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

void __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
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
  -[HUCharacteristicEventViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfValuesForPickerViewCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "validTriggerValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)pickerViewCell:(id)a3 canSelectValueAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  objc_opt_class();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "validTriggerValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v8, "isValidThresholdValue:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a3;
  objc_opt_class();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "validTriggerValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v8, "localizedListDescriptionForThresholdValue:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:", v12);

    if ((objc_msgSend(v8, "isValidThresholdValue:", v10) & 1) == 0)
    {
      v14 = *MEMORY[0x1E0CEA0A0];
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v13, "length"));

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v13 = v8;

  v9 = v13;
  if (v13)
  {
    objc_msgSend(v13, "validTriggerValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventViewController selectedEventOptionItem](self, "selectedEventOptionItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setThresholdValue:", v11);

    -[HUCharacteristicEventViewController _updateTriggerBuilder](self, "_updateTriggerBuilder");
    v9 = v13;
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

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HUCharacteristicEventOptionItem)selectedEventOptionItem
{
  return self->_selectedEventOptionItem;
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_selectedEventOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end
