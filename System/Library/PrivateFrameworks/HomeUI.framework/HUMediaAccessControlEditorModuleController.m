@implementation HUMediaAccessControlEditorModuleController

- (HUMediaAccessControlEditorModuleController)initWithModule:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaAccessControlEditorModuleController;
  return -[HUItemModuleController initWithModule:](&v4, sel_initWithModule_, a3);
}

- (id)updateAccessControlDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAccessControlDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HUMediaAccessControlEditorModuleController_updateAccessControlDescriptor___block_invoke;
  v10[3] = &unk_1E6F52C20;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "addCompletionBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __76__HUMediaAccessControlEditorModuleController_updateAccessControlDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessControlEditorModuleController:didUpdateAccessControl:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessControlEditorItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passwordEnableItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v4)
  {
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessControlEditorItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passwordItem");

  }
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessControlEditorItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passwordItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    objc_opt_class();
    v10 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "valueTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessControlPasswordPlaceholder"), CFSTR("HUMediaAccessControlPasswordPlaceholder"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPlaceholder:", v14);

    objc_msgSend(v12, "valueTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutocorrectionType:", 1);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v7 = a4;
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessControlEditorItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passwordItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    objc_opt_class();
    v21 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v19 = v22;

    objc_msgSend(v7, "latestResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30120]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueTextField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v26);

    goto LABEL_13;
  }
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessControlEditorItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "passwordEnableItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v7)
  {
    objc_opt_class();
    v28 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v19 = v29;

    objc_msgSend(v7, "latestResults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D30120]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOn:", objc_msgSend(v31, "BOOLValue"));

    objc_msgSend(v19, "setDelegate:", self);
LABEL_13:
    objc_msgSend(v19, "setSelectionStyle:", 0);
    goto LABEL_15;
  }
  objc_msgSend(v7, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v7, "latestResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v18, "BOOLValue");

  if ((_DWORD)v16)
  {
    objc_msgSend(v32, "setAccessoryType:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

  }
  else
  {
    objc_msgSend(v32, "setAccessoryType:", 0);
    objc_msgSend(v32, "textLabel");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", 0);
  }
LABEL_15:

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessControlEditorItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passwordItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v4)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessControlEditorItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passwordEnableItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v4)
  {
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessControlEditorItemProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessControlItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v4);

    if (v15)
    {
      -[HUItemModuleController module](self, "module");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessControlEditorItemProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessControlItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "indexOfObject:", v4);

      -[HUItemModuleController module](self, "module");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hf_accessControlDescriptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0D314F8];
      v23 = objc_msgSend(v5, "accessRequiresPassword");
      objc_msgSend(v5, "accessPassword");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "descriptorWithAccess:requiresPassword:password:", v19, v23, v24);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[HUMediaAccessControlEditorModuleController updateAccessControlDescriptor:](self, "updateAccessControlDescriptor:", v6);
LABEL_6:

    }
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CBA528];
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v7, "isValidMediaPassword:error:", v8, &v24);
    v9 = v24;

    v10 = v9 == 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v9, *MEMORY[0x1E0D309C8], 0, 0, 0);
    }
    else
    {
      -[HUItemModuleController module](self, "module");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_accessControlDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0D314F8];
      v18 = objc_msgSend(v11, "access");
      v19 = objc_msgSend(v11, "accessRequiresPassword");
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "descriptorWithAccess:requiresPassword:password:", v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[HUMediaAccessControlEditorModuleController updateAccessControlDescriptor:](self, "updateAccessControlDescriptor:", v21);
      objc_msgSend(v4, "endEditing:", 1);

    }
  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_accessControlDescriptor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "accessPassword");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v14);

    v10 = 1;
    objc_msgSend(v4, "endEditing:", 1);
  }

  return v10;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a4;
  v6 = a3;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_accessControlDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accessPassword");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CBA528], "generateMediaPasswordWithError:", &v25);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logError:operationDescription:", v11, CFSTR("API failed to generate a random 6 digit password"));

      v10 = CFSTR("000000");
    }

  }
  objc_msgSend(MEMORY[0x1E0D314F8], "descriptorWithAccess:requiresPassword:password:", objc_msgSend(v9, "access"), v4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUMediaAccessControlEditorModuleController updateAccessControlDescriptor:](self, "updateAccessControlDescriptor:", v13);
  objc_opt_class();
  -[HUMediaAccessControlEditorModuleController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_opt_class();
    objc_msgSend(v6, "item");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x1E0D31170];
    objc_msgSend(v6, "item");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v24, v4, v22, v17);

  }
}

- (HUMediaAccessControlEditorModuleControllerDelegate)delegate
{
  return (HUMediaAccessControlEditorModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
