@implementation HUNameItemModuleController

- (HUNameItemModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  HUNameItemModuleController *v8;
  HUNameItemModuleController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNameItemModuleController;
  v8 = -[HUItemModuleController initWithModule:](&v13, sel_initWithModule_, v6);
  v9 = v8;
  if (v8)
  {
    -[HUNameItemModuleController setNameModule:](v8, "setNameModule:", v6);
    objc_msgSend(v6, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "namingComponentForHomeKitObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameItemModuleController setNamingComponent:](v9, "setNamingComponent:", v11);

    -[HUItemModuleController setHost:](v9, "setHost:", v7);
    -[HUNameItemModuleController setNameFieldHasClearButton:](v9, "setNameFieldHasClearButton:", 0);
    -[HUNameItemModuleController setShowIcon:](v9, "setShowIcon:", 1);
    -[HUNameItemModuleController setShouldUseAccessoryName:](v9, "setShouldUseAccessoryName:", 0);
  }

  return v9;
}

- (void)setShouldUseAccessoryName:(BOOL)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUNameItemModuleController nameModule](self, "nameModule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sourceItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D31588], "namingComponentFromAccessory:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNameItemModuleController setNamingComponent:](self, "setNamingComponent:", v12);

    }
  }
  self->_shouldUseAccessoryName = a3;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameAndIconItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HUNameItemModuleController showIcon](self, "showIcon");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUNameItemModuleController;
  v5 = a4;
  v6 = a3;
  -[HUItemModuleController configureCell:forItem:](&v10, sel_configureCell_forItem_, v6, v5);
  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

  objc_msgSend(v6, "setContentConfiguration:", v7);
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_opt_class();
    v6 = v17;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v6;
      if (v7)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

    }
    v8 = 0;
LABEL_9:

    objc_msgSend(v8, "setDelegate:", self);
    +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridSceneCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextFieldFont:", v12);

    v13 = -[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing");
    objc_msgSend(v8, "iconButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSelected:", v13);

    v15 = -[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing");
    objc_msgSend(v8, "iconButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInteractionEnabled:", v15);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v15;
    v7 = -[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing");
    objc_msgSend(v6, "iconButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", v7);

    v9 = -[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing");
    objc_msgSend(v6, "iconButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    objc_opt_class();
    v11 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v6 = v12;

  }
  if (-[HUNameItemModuleController nameFieldHasClearButton](self, "nameFieldHasClearButton"))
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v6, "textField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setClearButtonMode:", v13);
LABEL_12:

}

- (BOOL)supportsCustomIconEditing
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;

  -[HUNameItemModuleController nameModule](self, "nameModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF347D30))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && (objc_opt_respondsToSelector() & 1) != 0
    && (!_os_feature_enabled_impl()
     || (objc_msgSend(v5, "home"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"),
         v6,
         (v7 & 1) == 0)))
  {
    objc_msgSend(v5, "availableIconDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)objc_msgSend(v9, "count") > 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  void *v4;
  void *v5;

  -[HUNameItemModuleController namingComponent](self, "namingComponent", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  void *v4;
  void *v5;

  -[HUNameItemModuleController namingComponent](self, "namingComponent", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFieldDisplayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HUNameItemModuleController *v11;

  v5 = a3;
  -[HUNameItemModuleController prepareForCommit](self, "prepareForCommit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HUNameItemModuleController_textFieldDidEndEditing_item___block_invoke;
  v9[3] = &unk_1E6F4C0D8;
  v10 = v5;
  v11 = self;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

void __58__HUNameItemModuleController_textFieldDidEndEditing_item___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "_builderName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setText:", v2);

}

- (void)cancelNameEdit
{
  void *v3;
  void *v4;
  id v5;

  -[HUNameItemModuleController nameModule](self, "nameModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameAndIconItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resignFirstResponder");
}

- (id)prepareForCommit
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  -[HUNameItemModuleController _cleanupTextFieldSetBuilderName](self, "_cleanupTextFieldSetBuilderName");
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItemBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF347D30))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[HUNameItemModuleController _builderName](self, "_builderName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nameAndIconItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sourceItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Builder for item '%@' is nil! Aborting commit..."), v20);

LABEL_9:
    objc_msgSend(v5, "finishWithNoResult");
    goto LABEL_10;
  }
  if (!v10)
    goto LABEL_9;
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameItemModuleController namingComponent](self, "namingComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqualToString:", v16);

  if (v17)
    goto LABEL_9;
  objc_msgSend(v9, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__HUNameItemModuleController_prepareForCommit__block_invoke;
  v22[3] = &unk_1E6F4C128;
  v23 = v5;
  v24 = v10;
  objc_msgSend(v4, "checkName:inHome:withValidationOptions:completionHandler:", v24, v18, 5, v22);

LABEL_10:
  return v5;
}

void __46__HUNameItemModuleController_prepareForCommit__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HUNameItemModuleController_prepareForCommit__block_invoke_2;
  v8[3] = &unk_1E6F4C100;
  v12 = a2;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __46__HUNameItemModuleController_prepareForCommit__block_invoke_2(uint64_t a1)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D30A20];
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *MEMORY[0x1E0D305A8];
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleError:operationType:options:retryBlock:cancelBlock:", v6, v4, v7, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_cleanupTextFieldSetBuilderName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUNameItemModuleController nameModule](self, "nameModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameAndIconItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HUNameItemModuleController namingComponent](self, "namingComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitSafeStringForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v7);
  -[HUNameItemModuleController _setBuilderName:](self, "_setBuilderName:", v7);

}

- (void)_setBuilderName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItemBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v12 = v7;

  if (-[HUNameItemModuleController shouldUseAccessoryName](self, "shouldUseAccessoryName") && v12)
  {
    objc_msgSend(v12, "setAccessoryName:", v4);
    objc_msgSend(v12, "setName:", v4);
  }
  else
  {
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceItemBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF347D30))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "setName:", v4);
  }

}

- (id)_builderName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItemBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (-[HUNameItemModuleController shouldUseAccessoryName](self, "shouldUseAccessoryName") && v6)
  {
    objc_msgSend(v6, "accessoryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceItemBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF347D30))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)nameAndIconEditorCellDidTapIcon:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HUIconPickerViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if (-[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing", a3))
  {
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceItemBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
    {
      -[HUNameItemModuleController nameModule](self, "nameModule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sourceItemBuilder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Service-like builder %@ that supports custom icon editing must respond to availableIconDescriptors!"), v8);

    }
    -[HUNameItemModuleController nameModule](self, "nameModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceItemBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF347D30))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "availableIconDescriptors");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HUIconPickerViewController initWithIconDescriptors:selectedIconDescriptor:delegate:]([HUIconPickerViewController alloc], "initWithIconDescriptors:selectedIconDescriptor:delegate:", v19, v13, self);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v14);
    objc_msgSend(v15, "setModalPresentationStyle:", 2);
    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController host](self, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "moduleController:presentViewControllerForRequest:", self, v16);

  }
}

- (void)iconPickerDidCancel:(id)a3
{
  void *v4;
  id v5;
  id v6;

  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "moduleController:dismissViewControllerForRequest:", self, v6);

}

- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[6];

  v7 = a4;
  v8 = a3;
  if (!-[HUNameItemModuleController supportsCustomIconEditing](self, "supportsCustomIconEditing"))
    NSLog(CFSTR("Updating icons is not supported for this item."));
  -[HUNameItemModuleController nameModule](self, "nameModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceItemBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF347D30))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setIconDescriptor:", v7);
  objc_msgSend(v12, "commitItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__HUNameItemModuleController_iconPicker_didPickIconDescriptor___block_invoke;
  v18[3] = &unk_1E6F4C150;
  v18[4] = self;
  v18[5] = a2;
  v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v18);

  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController host](self, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "moduleController:dismissViewControllerForRequest:", self, v15);

}

void __63__HUNameItemModuleController_iconPicker_didPickIconDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "nameModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v10 = v4;

  if (v10)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "nameModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameAndIconItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "updateResultsForItems:senderSelector:", v8, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "nameModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemUpdater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Somehow we don't have an item manager %@"), v7);
  }

}

- (BOOL)nameFieldHasClearButton
{
  return self->_nameFieldHasClearButton;
}

- (void)setNameFieldHasClearButton:(BOOL)a3
{
  self->_nameFieldHasClearButton = a3;
}

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (BOOL)shouldUseAccessoryName
{
  return self->_shouldUseAccessoryName;
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
  objc_storeStrong((id *)&self->_nameModule, a3);
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
  objc_storeStrong((id *)&self->_namingComponent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_nameModule, 0);
}

@end
