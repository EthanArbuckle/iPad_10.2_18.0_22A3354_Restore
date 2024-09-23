@implementation HUChildServiceItemModuleController

- (HUChildServiceItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUChildServiceItemModuleController *v9;
  HUChildServiceItemModuleController *v10;
  uint64_t v11;
  NSMapTable *identifyButtonMap;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUChildServiceItemModuleController;
  v9 = -[HUItemModuleController initWithModule:](&v14, sel_initWithModule_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_childServiceItemModule, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    identifyButtonMap = v10->_identifyButtonMap;
    v10->_identifyButtonMap = (NSMapTable *)v11;

  }
  return v10;
}

- (HUChildServiceItemModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUChildServiceItemModuleController.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUChildServiceItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (void)updateAllConfigurationDisabled
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_278);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke_2;
  v11[3] = &unk_1E6F4DAD8;
  v11[4] = self;
  v6 = objc_msgSend(v5, "na_all:", v11);

  if (v6 != -[HUChildServiceItemModuleController allConfigurationDisabled](self, "allConfigurationDisabled"))
  {
    self->_allConfigurationDisabled = v6;
    -[HUChildServiceItemModuleController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCellForItems:", v10);

  }
}

uint64_t __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

uint64_t __68__HUChildServiceItemModuleController_updateAllConfigurationDisabled__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "childServiceItemModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canToggleConfigurationStateForItem:", v3);

  return v5 ^ 1u;
}

- (Class)cellClassForItem:(id)a3
{
  void *v3;

  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editingMode");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;

  v38 = a3;
  v6 = a4;
  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "editingMode");

  if (v8 != 1)
  {
    objc_opt_class();
    v12 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v11 = v13;

    objc_msgSend(v11, "setDelegate:", self);
    objc_opt_class();
    v37 = v6;
    v14 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
    v36 = v14;

    objc_msgSend(v16, "accessories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_owningBridgeAccessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    objc_msgSend(v16, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_parentService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v25 = v23;
    if (v24 == v25)
    {

      v6 = v37;
    }
    else
    {
      v26 = v25;
      if (!v24)
      {

        v6 = v37;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v27 = objc_msgSend(v24, "isEqual:", v25);

      v6 = v37;
      if ((v27 & 1) == 0)
        goto LABEL_25;
    }
    objc_opt_class();
    objc_msgSend(v11, "accessoryView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v17;
    else
      v28 = 0;
    v29 = v28;

    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUChildServiceModuleIdentifyAccessoryViewTitle"), CFSTR("HUChildServiceModuleIdentifyAccessoryViewTitle"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:forState:", v30, 0);

      _HULocalizedStringWithDefaultValue(CFSTR("HUChildServiceModuleRunningAccessoryViewTitle"), CFSTR("HUChildServiceModuleRunningAccessoryViewTitle"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:forState:", v31, 2);

      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:", v32);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitleColor:forState:", v33, 2);

      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitleColor:forState:", v34, 0);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v35);

      objc_msgSend(v17, "sizeToFit");
      objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__identifyButtonPressed_forEvent_, 64);
      objc_msgSend(v11, "setAccessoryView:", v17);
    }
    -[HUChildServiceItemModuleController identifyButtonMap](self, "identifyButtonMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v36, v17);
    goto LABEL_24;
  }
  objc_opt_class();
  v9 = v38;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "setHideIcon:", 1);
  objc_msgSend(v11, "setAccessoryType:", 1);
LABEL_26:

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v7 = a4;
  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "editingMode");

  if (v9 == 1)
  {
    objc_opt_class();
    v10 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v7, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHideValue:", objc_msgSend(v14, "BOOLValue") ^ 1);

  }
  else
  {
    -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "editingMode");

    if (v16)
      goto LABEL_8;
    objc_opt_class();
    v17 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v12 = v18;

    if (-[HUChildServiceItemModuleController allConfigurationDisabled](self, "allConfigurationDisabled"))
    {
      objc_msgSend(v12, "setRemoveCheckmark:", 1);
    }
    else
    {
      -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "configurationStateForItem:", v7);

      -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "canToggleConfigurationStateForItem:", v7);

      objc_msgSend(v12, "setRemoveCheckmark:", 0);
      objc_msgSend(v12, "setAllowCheckmarkSelectionWhileDisabled:", v22);
      objc_msgSend(v12, "setDisableCheckmark:", v22 ^ 1);
      objc_msgSend(v12, "setChecked:", v20 != 2);
    }
  }

LABEL_8:
}

- (BOOL)canSelectItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "editingMode") == 1;

  return v4;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  objc_super v14;

  v4 = a3;
  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "editingMode") == 1)
  {
    -[HUChildServiceItemModuleController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[HUChildServiceItemModuleController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "childServiceEditorModuleController:didSelectItem:", self, v4);

      goto LABEL_6;
    }
  }
  else
  {

  }
  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "editingMode");

  if (!v11)
  {
    v12 = 1;
    goto LABEL_8;
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)HUChildServiceItemModuleController;
  v12 = -[HUItemModuleController didSelectItem:](&v14, sel_didSelectItem_, v4);
LABEL_8:

  return v12;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "editingMode") == 0;

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_opt_class();
  v11 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v11;
  else
    v6 = 0;
  v7 = v6;

  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceLikeBuilderInHome:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUChildServiceItemModuleController setActivelyEditingNameServiceBuilder:](self, "setActivelyEditingNameServiceBuilder:", v10);

}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  -[HUChildServiceItemModuleController activelyEditingNameServiceBuilder](self, "activelyEditingNameServiceBuilder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v6);

}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  v6 = a3;
  v7 = a4;
  -[HUChildServiceItemModuleController activelyEditingNameServiceBuilder](self, "activelyEditingNameServiceBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[HUChildServiceItemModuleController activelyEditingNameServiceBuilder](self, "activelyEditingNameServiceBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Service builder %@ is nil but we expect it shouldn't be"), v9);

  }
  v10 = v7;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC470))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "namingComponentForHomeKitObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUChildServiceItemModuleController defaultTextForTextField:item:](self, "defaultTextForTextField:item:", v6, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeKitSafeStringForString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v16);

  if ((v18 & 1) == 0)
    objc_msgSend(v6, "setText:", v16);
  if ((objc_msgSend(v16, "isEqualToString:", v14) & 1) == 0)
  {
    -[HUChildServiceItemModuleController activelyEditingNameServiceBuilder](self, "activelyEditingNameServiceBuilder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setName:", v16);

    -[HUChildServiceItemModuleController activelyEditingNameServiceBuilder](self, "activelyEditingNameServiceBuilder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "commitItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__HUChildServiceItemModuleController_textFieldDidEndEditing_item___block_invoke;
    v23[3] = &unk_1E6F4C610;
    v23[4] = self;
    v22 = (id)objc_msgSend(v21, "addCompletionBlock:", v23);

  }
}

uint64_t __66__HUChildServiceItemModuleController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D313A0];
    v5 = a3;
    objc_msgSend(v4, "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D309B0];
    v14 = *MEMORY[0x1E0D305A8];
    objc_msgSend(*(id *)(a1 + 32), "activelyEditingNameServiceBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("nil name");
    if (v9)
      v11 = (const __CFString *)v9;
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v5, v7, v12, 0, 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setActivelyEditingNameServiceBuilder:", 0);
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC470))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "namingComponentForHomeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textFieldDisplayText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC470))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "namingComponentForHomeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "placeholderText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_identifyButtonPressed:(id)a3 forEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  -[HUChildServiceItemModuleController identifyButtonMap](self, "identifyButtonMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnabled:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke;
  v14[3] = &unk_1E6F4E2D8;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "identifyWithCompletionHandler:", v14);

}

void __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke_2;
  v6[3] = &unk_1E6F4D988;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v3);

  }
}

uint64_t __70__HUChildServiceItemModuleController__identifyButtonPressed_forEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
}

- (void)checkmarkTappedInCell:(id)a3 forItem:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  -[HUChildServiceItemModuleController childServiceItemModule](self, "childServiceItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "toggleConfigurationStateForItem:", v7);

}

- (BOOL)allConfigurationDisabled
{
  return self->_allConfigurationDisabled;
}

- (HUChildServiceModuleControllerDelegate)delegate
{
  return (HUChildServiceModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUChildServiceEditorItemModule)childServiceItemModule
{
  return self->_childServiceItemModule;
}

- (void)setChildServiceItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_childServiceItemModule, a3);
}

- (HFServiceLikeBuilder)activelyEditingNameServiceBuilder
{
  return self->_activelyEditingNameServiceBuilder;
}

- (void)setActivelyEditingNameServiceBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_activelyEditingNameServiceBuilder, a3);
}

- (NSMapTable)identifyButtonMap
{
  return self->_identifyButtonMap;
}

- (void)setIdentifyButtonMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifyButtonMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyButtonMap, 0);
  objc_storeStrong((id *)&self->_activelyEditingNameServiceBuilder, 0);
  objc_storeStrong((id *)&self->_childServiceItemModule, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
