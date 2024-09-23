@implementation HUPresenceUserPickerItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemTypeForItem:", v4);

  if (v6 > 2)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v7 = a4;
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "itemTypeForItem:", v7);

  switch(v9)
  {
    case 2:
      -[HUItemModuleController module](self, "module");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stateForUserItem:", v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v26;
      objc_msgSend(v7, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserName:", v14);

      objc_msgSend(v7, "latestResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDeviceName:", v16);

      objc_msgSend(v7, "latestResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUserHandle:", v18);

      objc_msgSend(v7, "latestResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setChecked:", objc_msgSend(v20, "BOOLValue"));

      objc_msgSend(v12, "setLocationUnavailable:", objc_msgSend(v11, "isLocationAvailable") ^ 1);
LABEL_10:

      break;
    case 1:
      v11 = v26;
      objc_msgSend(v7, "latestResults");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitleText:", v22);

      objc_msgSend(v7, "latestResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setChecked:", objc_msgSend(v24, "BOOLValue"));

      if (objc_msgSend(v11, "checked"))
        v25 = 4;
      else
        v25 = 0;
      objc_msgSend(v11, "setAccessoryType:", v25);
      goto LABEL_10;
    case 0:
      objc_msgSend(v26, "setHideIcon:", 1);
      break;
  }

}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemTypeForItem:", v4);

  return (v6 < 3) & (6u >> (v6 & 7));
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemTypeForItem:", v4);

  return v6 == 2;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HUPresenceUserPickerItemModuleController *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confirmationPromptForOptionItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUPresenceUserPickerItemModuleController _showAlertForConfirmationPrompt:](self, "_showAlertForConfirmationPrompt:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__HUPresenceUserPickerItemModuleController_didSelectItem___block_invoke;
  v13[3] = &unk_1E6F542A8;
  v14 = v7;
  v15 = self;
  v16 = v4;
  v9 = v4;
  v10 = v7;
  v11 = (id)objc_msgSend(v5, "addSuccessBlock:", v13);

  return 0;
}

void __58__HUPresenceUserPickerItemModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_msgSend(v3, "resetLocationToHomeOnConfirmation"))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "itemTypeForItem:", *(_QWORD *)(a1 + 48));

  if (v6 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectActivationOptionItem:", *(_QWORD *)(a1 + 48));
LABEL_11:

    goto LABEL_12;
  }
  if (v6 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "module");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stateForUserItem:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isSelected");
    objc_msgSend(*(id *)(a1 + 40), "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 48);
    if ((v9 & 1) != 0)
      objc_msgSend(v10, "deselectUserItem:", v12);
    else
      objc_msgSend(v10, "selectUserItem:", v12);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)accessoryButtonTappedForItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "itemTypeForItem:", v7);

  if (v5 == 1)
  {
    -[HUItemModuleController module](self, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleExpandedForActivationOptionItem:", v7);

  }
}

- (id)_showAlertForConfirmationPrompt:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = (objc_class *)MEMORY[0x1E0D519C0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(v5, "alertTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionContinue"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionContinue"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke;
  v30[3] = &unk_1E6F4C6E0;
  v14 = v6;
  v31 = v14;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionCancel"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertActionCancel"), 1);
  v17 = objc_claimAutoreleasedReturnValue();
  v25 = v13;
  v26 = 3221225472;
  v27 = __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke_2;
  v28 = &unk_1E6F4C6E0;
  v18 = v14;
  v29 = v18;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v19, v25, v26, v27, v28);

  -[HUPresenceUserPickerItemModuleController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[HUPresenceUserPickerItemModuleController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presenceUserPickerItemModuleController:presentViewController:", self, v10);

  }
  v22 = v29;
  v23 = v18;

  return v23;
}

uint64_t __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __76__HUPresenceUserPickerItemModuleController__showAlertForConfirmationPrompt___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (HUPresenceUserPickerItemModuleControllerDelegate)delegate
{
  return (HUPresenceUserPickerItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
