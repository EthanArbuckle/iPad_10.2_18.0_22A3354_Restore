@implementation HUAccessorySettingsItemModuleController

- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6;
  HUAccessorySettingsItemModuleController *v7;
  HUAccessorySettingsItemModuleController *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUAccessorySettingsItemModuleController;
  v7 = -[HUItemModuleController initWithModule:](&v12, sel_initWithModule_, a3);
  v8 = v7;
  if (v7)
  {
    -[HUAccessorySettingsItemModuleController setDelegate:](v7, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySettingsItemModuleController setCellToItemMap:](v8, "setCellToItemMap:", v9);

    v10 = (void *)objc_opt_new();
    -[HUAccessorySettingsItemModuleController setRegisteredButtonFutures:](v8, "setRegisteredButtonFutures:", v10);

  }
  return v8;
}

- (HUAccessorySettingsItemModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsItemModuleController.m"), 55, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30150]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedIntegerValue");

  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;

  v6 = a3;
  v7 = a4;
  -[HUAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  objc_msgSend(v6, "setAccessoryType:", 0);
  objc_opt_class();
  v32 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v32;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "setHideIcon:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30150]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    switch(v13)
    {
      case -1:
        break;
      case 0:
        v17 = (_QWORD *)MEMORY[0x1E0D306F8];
        goto LABEL_12;
      case 2:
        objc_opt_class();
        v18 = v32;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v16 = v19;

        objc_msgSend(v16, "setContinuous:", 0);
        goto LABEL_21;
      case 3:
      case 4:
        v14 = v32;
        if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF299EB0))
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v16, "setStepperCellDelegate:", self);
        goto LABEL_22;
      case 5:
        objc_opt_class();
        v20 = v32;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v16 = v21;

LABEL_21:
        objc_msgSend(v16, "setDelegate:", self);
LABEL_22:

        break;
      case 6:
        objc_opt_class();
        v22 = v32;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        objc_msgSend(v24, "textField");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 0;
        goto LABEL_31;
      case 7:
        objc_opt_class();
        v28 = v32;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v24 = v29;

        objc_msgSend(v24, "textField");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 1;
LABEL_31:
        objc_msgSend(v25, "setSecureTextEntry:", v27);

        goto LABEL_36;
      case 9:
        objc_opt_class();
        v30 = v32;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v24 = v31;

        objc_msgSend(v24, "setTextAlignment:", 4);
LABEL_36:

        break;
      default:
        v17 = (_QWORD *)MEMORY[0x1E0D30770];
LABEL_12:
        -[HUAccessorySettingsItemModuleController _setupCellAccessoryType:forItem:withKey:](self, "_setupCellAccessoryType:forItem:withKey:", v32, v7, *v17);
        break;
    }
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  char v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  int v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;

  v70 = a3;
  v7 = a4;
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30150]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v7, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAccessibilityIdentifier:", v12);

  objc_opt_class();
  v13 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v15, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30188]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v18 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_opt_class();
    v21 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    switch(v10)
    {
      case 2:
        objc_opt_class();
        v42 = v70;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v43 = v42;
        else
          v43 = 0;
        v27 = v43;

        objc_msgSend(v15, "latestResults");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0D30168]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "floatValue");
        objc_msgSend(v27, "setMinimumValue:", v46);

        objc_msgSend(v15, "latestResults");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D30160]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "floatValue");
        objc_msgSend(v27, "setMaximumValue:", v49);

        objc_msgSend(v20, "floatValue");
        objc_msgSend(v27, "setValue:", v50);
        objc_msgSend(v27, "setShowValue:", 0);
        objc_msgSend(v13, "latestResults");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D30180]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("MaximumValueTrackingImage"));
        v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("MinimumValueTrackingImage"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAccessorySettingsItemModuleController _setupSliderCell:forMinKey:maxKey:](self, "_setupSliderCell:forMinKey:maxKey:", v27, v54, v53);

        goto LABEL_37;
      case 3:
      case 4:
        v24 = v70;
        v25 = &unk_1EF299EB0;
        if (objc_msgSend(v24, "conformsToProtocol:", v25))
          v26 = v24;
        else
          v26 = 0;
        v27 = v26;

        objc_msgSend(v15, "latestResults");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D30168]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMinimumValue:", v29);

        objc_msgSend(v15, "latestResults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D30160]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMaximumValue:", v31);

        objc_msgSend(v15, "latestResults");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30170]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setStepValue:", v33);

        if (v20)
          v34 = v20;
        else
          v34 = &unk_1E7041278;
        objc_msgSend(v27, "setStepperValue:", v34, v70);
        goto LABEL_38;
      case 6:
      case 7:
        objc_opt_class();
        v39 = v70;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v40 = v39;
        else
          v40 = 0;
        v27 = v40;

        objc_msgSend(v27, "textField");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setText:", v23);

        goto LABEL_38;
      case 8:
        v53 = v70;
        objc_msgSend(v13, "latestResults");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0D30DA0]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "BOOLValue"))
          v55 = 3;
        else
          v55 = 0;
        objc_msgSend(v53, "setAccessoryType:", v55, v70);
LABEL_37:

LABEL_38:
        break;
      default:
        break;
    }
    -[HUAccessorySettingsItemModuleController delegate](self, "delegate", v70);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_opt_respondsToSelector();

    if ((v57 & 1) != 0)
    {
      objc_opt_class();
      v58 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;
      v60 = v59;

      -[HUAccessorySettingsItemModuleController delegate](self, "delegate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "moduleController:shouldDisableItem:", self, v60);

      v63 = v70;
      v64 = &unk_1EF253320;
      if (objc_msgSend(v63, "conformsToProtocol:", v64))
        v65 = v63;
      else
        v65 = 0;
      v66 = v65;

      if (v62)
        objc_msgSend(v66, "setDisabled:", 1);

    }
    goto LABEL_58;
  }
  if (v10 == 9)
  {
    objc_opt_class();
    v35 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;
    v21 = v36;

    objc_msgSend(v13, "latestResults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B10]);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
      v38 = objc_msgSend(v20, "isFinished") ^ 1;
    else
      v38 = 0;
    objc_opt_class();
    objc_msgSend(v21, "accessoryView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v68 = v67;
    else
      v68 = 0;
    v23 = v68;

    if (v38)
    {
      if (v23)
      {
        v69 = v67;

        objc_msgSend(v21, "setDisabled:", 1);
        objc_msgSend(v69, "startAnimating");
        -[HUAccessorySettingsItemModuleController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v20, v13);
        v23 = v69;
      }
      else
      {
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke;
        v71[3] = &unk_1E6F56CA0;
        v21 = v21;
        v72 = v21;
        __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke((uint64_t)v71);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDisabled:", 1);
        objc_msgSend(v23, "startAnimating");
        -[HUAccessorySettingsItemModuleController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v20, v13);

      }
    }
    else
    {
      objc_msgSend(v21, "setDisabled:", 0);
      objc_msgSend(v23, "stopAnimating");
    }
LABEL_58:

  }
}

id __71__HUAccessorySettingsItemModuleController_updateCell_forItem_animated___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", v2);
  return v2;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30150]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_opt_class();
  v8 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
    v11 = v7 == 0;
  else
    v11 = 0;
  if (v11)
  {
    -[HUAccessorySettingsItemModuleController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[HUAccessorySettingsItemModuleController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "moduleController:presentGroup:", self, v10);

    }
    v15 = 1;
  }
  else
  {
    if (v7 == 9)
    {
      -[HUAccessorySettingsItemModuleController _handleButtonPress:](self, "_handleButtonPress:", v8);
    }
    else
    {
      objc_opt_class();
      v16 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      if (v18)
        -[HUAccessorySettingsItemModuleController _selectOptionItem:](self, "_selectOptionItem:", v16);

    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)canSelectItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (void)_selectOptionItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsItemModuleController.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("optionItem"));

  }
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateItem:withValue:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HUAccessorySettingsItemModuleController__selectOptionItem___block_invoke;
  v12[3] = &unk_1E6F4C610;
  v13 = v5;
  v9 = v5;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

}

void __61__HUAccessorySettingsItemModuleController__selectOptionItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(Option Item) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v10, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(Option Item) Updated %@ to '%@'", (uint8_t *)&v10, 0x16u);
    goto LABEL_6;
  }

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  HUAccessorySettingsItemModuleController *v23;
  BOOL v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  -[HUAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("OFF");
    *(_DWORD *)buf = 138412802;
    v26 = v6;
    v27 = 2112;
    if (v4)
      v12 = CFSTR("ON");
    v28 = v10;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' value changing to '%@'", buf, 0x20u);
  }

  -[HUAccessorySettingsItemModuleController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[HUAccessorySettingsItemModuleController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v20 = &unk_1E6F555F8;
    v21 = v6;
    v24 = v4;
    v22 = v10;
    v23 = self;
    objc_msgSend(v15, "moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:", self, v22, v4, &v17);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4, v17, v18, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsItemModuleController _updateSwitchSettingItem:withValue:](self, "_updateSwitchSettingItem:withValue:", v10, v16);

}

void __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check before changing...", buf, 0x16u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_289;
    v16[3] = &unk_1E6F58980;
    v8 = *(id *)(a1 + 40);
    v19 = *(_BYTE *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 48);
    v17 = v8;
    v18 = v9;
    v10 = (id)objc_msgSend(v3, "addSuccessBlock:", v16);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_299;
    v12[3] = &unk_1E6F53170;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 56);
    v11 = (id)objc_msgSend(v3, "addFailureBlock:", v12);

  }
}

void __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_289(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(v3, "BOOLValue"))
      v6 = CFSTR("passed");
    else
      v6 = CFSTR("failed");
    v7 = objc_msgSend(v3, "BOOLValue");
    v8 = CFSTR("NOT CHANGING");
    v9 = *(unsigned __int8 *)(a1 + 48);
    if (v7)
      v8 = CFSTR("CHANGING");
    v10 = CFSTR("ON");
    v15 = 138413058;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    if (!v9)
      v10 = CFSTR("OFF");
    v20 = v8;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", (uint8_t *)&v15, 0x2Au);
  }

  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 40), "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "updateItem:withValue:", v12, v13);

  }
}

uint64_t __64__HUAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_299(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)_updateSwitchSettingItem:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateItem:withValue:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HUAccessorySettingsItemModuleController__updateSwitchSettingItem_withValue___block_invoke;
  v13[3] = &unk_1E6F589A8;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __78__HUAccessorySettingsItemModuleController__updateSwitchSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
      v10 = CFSTR("OFF");
      v16 = 138412802;
      v17 = v8;
      v18 = 2112;
      if (v9)
        v10 = CFSTR("ON");
      v19 = v10;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "(Switch) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    v13 = CFSTR("OFF");
    if (v12)
      v13 = CFSTR("ON");
    v16 = 138412546;
    v17 = v11;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(Switch) Updated %@ to '%@'", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject moduleController:settingUpdatedForItem:](v7, "moduleController:settingUpdatedForItem:", WeakRetained, *(_QWORD *)(a1 + 32));
LABEL_12:

  }
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  long double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  -[HUAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v10, "setting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimumValue");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  objc_msgSend(v13, "maximumValue");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    goto LABEL_14;
  }
  v18 = (void *)v17;
  objc_msgSend(v13, "stepValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_14:
    v29 = v14;
    goto LABEL_15;
  }
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "minimumValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;
  objc_msgSend(v13, "maximumValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  objc_msgSend(v13, "stepValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  objc_msgSend(v20, "numberWithDouble:", HUClampWithStep(v23, v26, v28, a4));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v38 = a4;
    v39 = 2112;
    v40 = v29;
    _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "(Slider) Clamping value '%f' to '%@'", buf, 0x16u);
  }

LABEL_15:
  -[HUItemModuleController module](self, "module");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateItem:withValue:", v10, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __83__HUAccessorySettingsItemModuleController_sliderValueTableViewCell_didChangeValue___block_invoke;
  v35[3] = &unk_1E6F4C610;
  v36 = v10;
  v33 = v10;
  v34 = (id)objc_msgSend(v32, "addCompletionBlock:", v35);

}

void __83__HUAccessorySettingsItemModuleController_sliderValueTableViewCell_didChangeValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "(Slider) Failed to update %@ to '%@' with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(Slider) Updated %@ to '%@'", (uint8_t *)&v11, 0x16u);
  }

}

- (void)stepperCell:(id)a3 steppedToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  -[HUAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateItem:withValue:", v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__HUAccessorySettingsItemModuleController_stepperCell_steppedToValue___block_invoke;
  v17[3] = &unk_1E6F4C0D8;
  v18 = v11;
  v19 = v6;
  v14 = v6;
  v15 = v11;
  v16 = (id)objc_msgSend(v13, "addCompletionBlock:", v17);

}

void __70__HUAccessorySettingsItemModuleController_stepperCell_steppedToValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(Stepper) Failed to update  %@ to '%@' with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(Stepper) Updated %@ to '%@'", (uint8_t *)&v11, 0x16u);
  }

}

- (void)_setupSliderCell:(id)a3 forMinKey:(id)a4 maxKey:(id)a5
{
  unint64_t v7;
  unint64_t v8;
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

  v18 = a3;
  v7 = (unint64_t)a4;
  v8 = (unint64_t)a5;
  if (v18 && v7 | v8)
  {
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
LABEL_5:
        v12 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageNamed:inBundle:", v7, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_flatImageWithColor:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMinimumValueImage:", v16);

        objc_msgSend(v11, "_flatImageWithColor:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMaximumValueImage:", v17);

        goto LABEL_9;
      }
    }
    else
    {
      v11 = 0;
      if (v7)
        goto LABEL_5;
    }
    v14 = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_handleButtonPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  HUAccessorySettingsItemModuleController *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30190]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D30700]);

  if (v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[HUAccessorySettingsItemModuleController _handleButtonPress:]";
      v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%s(%@)initiating 'Export Analytics'", buf, 0x16u);
    }

    -[HUItemModuleController module](self, "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeKitSettingsVendor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_settingsAdapterManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adapterIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "adapterForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = &unk_1EF348030;
    if (objc_msgSend(v14, "conformsToProtocol:", v15))
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    if (!v17)
      NSLog(CFSTR("Adapter doesn't exist; you're a failure."));
    objc_msgSend(v17, "handleButtonPressForEntity:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke;
    v32 = &unk_1E6F54D78;
    objc_copyWeak(&v34, (id *)buf);
    v19 = v17;
    v33 = v19;
    v20 = (id)objc_msgSend(v18, "flatMap:", &v29);
    -[HUAccessorySettingsItemModuleController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v18, v4, v29, v30, v31, v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "homeKitSettingsVendor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_settingsAdapterManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adapterIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adapterForIdentifier:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EF348030))
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (!v27)
      NSLog(CFSTR("Adapter doesn't exist; you're a failure."));
    objc_msgSend(v27, "handleButtonPressForEntity:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySettingsItemModuleController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v28, v4);

  }
}

id __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request completed with results: %@", buf, 0xCu);
  }

  v9 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  HFLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithActivityItems:applicationActivities:", v11, 0);

  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleController:requestPresentViewController:animated:", WeakRetained, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_324;
  v19[3] = &unk_1E6F589D0;
  v20 = v12;
  v21 = *(id *)(a1 + 32);
  v22 = v7;
  v15 = v7;
  v16 = v12;
  objc_msgSend(v14, "addCompletionBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_324(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_2;
  v3[3] = &unk_1E6F4C638;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v3);

}

void __62__HUAccessorySettingsItemModuleController__handleButtonPress___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D319D0], "deviceAirDropIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet has generated AirPlayId (%@) making 'airdrop sysdiagnose' request...", (uint8_t *)&v8, 0xCu);
    }

    objc_opt_class();
    v4 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    v7 = (id)-[NSObject airDropSysdiagnose:](v6, "airDropSysdiagnose:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    NSLog(CFSTR("AirDrop Identifier is nil after presentation dance!"));
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Share Sheet failed to generate AirPlayID", (uint8_t *)&v8, 2u);
    }
  }

}

- (void)_registerButtonActionHandler:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id from;
  _QWORD aBlock[4];
  id v25;
  id v26[2];
  id location;

  v7 = a3;
  v8 = a4;
  -[HUAccessorySettingsItemModuleController registeredButtonFutures](self, "registeredButtonFutures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke;
    aBlock[3] = &unk_1E6F56CC8;
    objc_copyWeak(v26, &location);
    v25 = v8;
    v26[1] = (id)a2;
    v12 = _Block_copy(aBlock);
    objc_initWeak(&from, v7);
    v16 = v11;
    v17 = 3221225472;
    v18 = __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke_2;
    v19 = &unk_1E6F56CF0;
    objc_copyWeak(&v21, &location);
    v13 = v12;
    v20 = v13;
    objc_copyWeak(&v22, &from);
    v14 = (id)objc_msgSend(v7, "addCompletionBlock:", &v16);
    -[HUAccessorySettingsItemModuleController registeredButtonFutures](self, "registeredButtonFutures", v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v7);

    v13[2](v13);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }

}

void __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToUpdateItems:senderSelector:", v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "performItemUpdateRequest:", v6);

}

void __77__HUAccessorySettingsItemModuleController__registerButtonActionHandler_item___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "registeredButtonFutures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "removeObject:", v7);

}

- (void)_setupCellAccessoryType:(id)a3 forItem:(id)a4 withKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  v12 = 1;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    objc_msgSend(v7, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30148]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v8);

    if ((v11 & 1) != 0)
      v12 = 0;
  }
  objc_msgSend(v13, "setAccessoryType:", v12);

}

- (HUAccessorySettingsItemModuleControllerDelegate)delegate
{
  return (HUAccessorySettingsItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellToItemMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)registeredButtonFutures
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegisteredButtonFutures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredButtonFutures, 0);
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
