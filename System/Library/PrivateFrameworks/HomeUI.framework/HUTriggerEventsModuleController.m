@implementation HUTriggerEventsModuleController

- (HUTriggerEventsModuleController)initWithModule:(id)a3
{
  HUTriggerEventsModuleController *v3;
  HUTriggerEventsModuleController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTriggerEventsModuleController;
  v3 = -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
  v4 = v3;
  if (v3)
    -[HUTriggerEventsModuleController setAllowsEditingEvents:](v3, "setAllowsEditingEvents:", 1);
  return v4;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEventButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEqual:", v6);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "setAdjustsTextColorWhenDisabled:", 0);
  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEventButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
      objc_msgSend(v10, "setAccessoryType:", 1);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "setIconForegroundColorFollowsTintColor:", 1);
      objc_msgSend(v8, "setIconDisplayStyle:", 1);
      objc_msgSend(v8, "setIconTintColorFollowsDisabledState:", 0);
      v9 = -[HUTriggerEventsModuleController allowsEditingEvents](self, "allowsEditingEvents")
        && !objc_msgSend(v8, "isDisabled");
      objc_msgSend(v8, "setAccessoryType:", v9);
    }

  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  HUEventCreationUIFlow *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEventButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v10))
  {
    v11 = _os_feature_enabled_impl();

    if (v11)
    {
      v12 = -[HUEventCreationUIFlow initWithTriggerBuilder:eventBuilderItem:]([HUEventCreationUIFlow alloc], "initWithTriggerBuilder:eventBuilderItem:", v8, 0);
      -[HUEventCreationUIFlow setModalInPresentation:](v12, "setModalInPresentation:", 1);
      -[HUEventUIFlow setDelegate:](v12, "setDelegate:", self);
      -[HUEventUIFlow setIsPresentedModally:](v12, "setIsPresentedModally:", 1);
      -[HUEventCreationUIFlow setupNavigationController](v12, "setupNavigationController");
      -[HUEventCreationUIFlow navigationController](v12, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[HUItemModuleController host](self, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "moduleController:presentViewControllerForRequest:", self, v14);
LABEL_11:

LABEL_14:
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    v17 = v4;
    v12 = -[HUEventUIFlow initWithTriggerBuilder:eventBuilderItem:]([HUEventUIFlow alloc], "initWithTriggerBuilder:eventBuilderItem:", v8, v17);

    -[HUEventUIFlow setDelegate:](v12, "setDelegate:", self);
    -[HUEventUIFlow setPresentationController:](v12, "setPresentationController:", self);
    -[HUEventUIFlow buildInitialViewController](v12, "buildInitialViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HUTriggerEventsModuleController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "eventsModuleController:pushViewController:", self, v14);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v4;
    -[HUTriggerEventsModuleController delegate](self, "delegate");
    v12 = (HUEventCreationUIFlow *)objc_claimAutoreleasedReturnValue();
    -[HUEventCreationUIFlow _showEditorForTriggerBuilderItem:](v12, "_showEditorForTriggerBuilderItem:", v14);
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  HUTriggerEventsModuleController *v16;
  id v17;
  uint8_t buf[4];
  HUTriggerEventsModuleController *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && _os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CEA4C0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUDeleteTitle"), CFSTR("HUDeleteTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __63__HUTriggerEventsModuleController_trailingSwipeActionsForItem___block_invoke;
    v15 = &unk_1E6F5D4A8;
    v16 = self;
    v17 = v4;
    objc_msgSend(v7, "contextualActionWithStyle:title:handler:", 1, v8, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v9, v12, v13, v14, v15, v16);
    objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __63__HUTriggerEventsModuleController_trailingSwipeActionsForItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteItem:completionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)eventFlowDidCancel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  v11 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v11;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController host](self, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "moduleController:dismissViewControllerForRequest:", self, v8);

  }
}

- (void)eventFlow:(id)a3 didFinishWithEventBuilderItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
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
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v7, "originalEventBuilderItem");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v15 = (void *)v13;
    objc_msgSend(v7, "originalEventBuilderItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 != v8)
    {
      objc_msgSend(v7, "originalEventBuilderItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventBuilders");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v14;
      v37[1] = 3221225472;
      v37[2] = __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke;
      v37[3] = &unk_1E6F5D4D0;
      v38 = v12;
      objc_msgSend(v18, "na_each:", v37);

    }
  }
  objc_msgSend(v8, "eventBuilders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke_2;
  v35[3] = &unk_1E6F5D4D0;
  v20 = v12;
  v36 = v20;
  objc_msgSend(v19, "na_each:", v35);

  objc_opt_class();
  v34 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v34;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "navigationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController host](self, "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "moduleController:dismissViewControllerForRequest:", self, v24);

    v27 = (void *)MEMORY[0x1E0D314C0];
    -[HUItemModuleController module](self, "module");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "itemProviders");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requestToReloadItemProviders:senderSelector:", v29, a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "itemUpdater");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v32, "performItemUpdateRequest:", v30);

  }
}

uint64_t __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEventBuilder:", a2);
}

uint64_t __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEventBuilder:", a2);
}

- (void)transitionToViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTriggerEventsModuleController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventsModuleController:pushViewController:", self, v4);

}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  objc_opt_class();
  v23 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v23;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v8, "eventBuilders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__HUTriggerEventsModuleController_deleteItem_completionHandler___block_invoke;
  v24[3] = &unk_1E6F5D4D0;
  v25 = v12;
  v14 = v12;
  objc_msgSend(v13, "na_each:", v24);

  -[HUTriggerEventsModuleController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HUTriggerEventsModuleController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "eventsModuleControllerDidUpdateTriggerBuilder:", self);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D314C0];
    -[HUItemModuleController module](self, "module");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemProviders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestToReloadItemProviders:senderSelector:", v19, a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemUpdater");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "performItemUpdateRequest:", v16);

  }
}

uint64_t __64__HUTriggerEventsModuleController_deleteItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEventBuilder:", a2);
}

- (HUTriggerEventsModuleControllerDelegate)delegate
{
  return (HUTriggerEventsModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsEditingEvents
{
  return self->_allowsEditingEvents;
}

- (void)setAllowsEditingEvents:(BOOL)a3
{
  self->_allowsEditingEvents = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
