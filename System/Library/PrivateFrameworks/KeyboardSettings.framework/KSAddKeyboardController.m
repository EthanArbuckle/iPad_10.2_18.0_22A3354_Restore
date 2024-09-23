@implementation KSAddKeyboardController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSAddKeyboardController;
  -[KSAddKeyboardController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KSAddKeyboardController;
  -[KSAddKeyboardController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  v4 = (void *)-[KSAddKeyboardController navigationItem](self, "navigationItem");
  v5 = (void *)-[KSAddKeyboardController specifier](self, "specifier");
  objc_msgSend(v4, "setTitle:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D50]));
  objc_msgSend(v4, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped));
  objc_msgSend((id)objc_msgSend(v4, "rightBarButtonItem"), "setEnabled:", 0);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_doneButtonTapped, *MEMORY[0x24BEBE010], 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)KSAddKeyboardController;
  -[KSAddKeyboardController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[KSAddKeyboardController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

+ (BOOL)shouldAddInputMode:(id)a3 toEnabledInputModes:(id)a4
{
  return !objc_msgSend((id)TIInputModeGetLanguageWithRegion(), "isEqualToString:", CFSTR("ja_JP"))
      || !objc_msgSend((id)TIInputModeGetVariant(), "hasPrefix:", CFSTR("Kana"))
      || objc_msgSend((id)objc_msgSend(a4, "indexesOfObjectsPassingTest:", &__block_literal_global_7), "count") == 0;
}

uint64_t __66__KSAddKeyboardController_shouldAddInputMode_toEnabledInputModes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetLanguageWithRegion(), "isEqualToString:", CFSTR("ja_JP"));
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)TIInputModeGetVariant(), "hasPrefix:", CFSTR("Kana"));
    if ((_DWORD)result)
    {
      result = 1;
      *a4 = 1;
    }
  }
  return result;
}

+ (BOOL)shouldShowAddKeyboardControllerForInputModes:(id)a3
{
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *NormalizedIdentifier;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = _os_feature_enabled_impl();
  objc_msgSend(a3, "firstObject");
  v5 = TIGetAddKeyboardUsesPickerForInputMode();
  LOBYTE(v6) = v4 | v5;
  if (v4)
  {
    if ((v5 & 1) == 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(a3);
            NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
            if (objc_msgSend(TIUIGetProposedMultilingualSetsForAddingInputMode(NormalizedIdentifier, (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers")), "count"))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          LOBYTE(v6) = 0;
          if (v7)
            continue;
          break;
        }
      }
    }
  }
  return v6;
}

- (id)newSpecifiers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id MultilingualSet;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t DefaultHardwareKeyboardForInputMode;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  KSAddKeyboardController *v47;
  id v48;
  id obj;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = *MEMORY[0x24BE75AC0];
  v3 = +[KSKeyboardListController supportedBaseInputModesForLanguage:](KSKeyboardListController, "supportedBaseInputModesForLanguage:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:"));
  v47 = self;
  if (_os_feature_enabled_impl()
    && (v64 = 0u,
        v65 = 0u,
        v62 = 0u,
        v63 = 0u,
        (v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v68, 16)) != 0))
  {
    v5 = v4;
    v6 = *(_QWORD *)v63;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v6)
        objc_enumerationMutation(v3);
      v8 = TIUIGetProposedMultilingualSetsForAddingInputMode(*(void **)(*((_QWORD *)&v62 + 1) + 8 * v7), (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers"));
      if (objc_msgSend(v8, "count"))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        v9 = 0;
        if (v5)
          goto LABEL_4;
        goto LABEL_17;
      }
    }
    v10 = (void *)objc_msgSend(v8, "firstObject");
    if (!v10)
      goto LABEL_16;
    v11 = v10;
    MultilingualSet = TIUIProposedInputModeGetMultilingualSet(v10);
    if (!objc_msgSend(MultilingualSet, "count"))
      -[KSAddKeyboardController newSpecifiers].cold.1();
    if (objc_msgSend(MultilingualSet, "count"))
    {
      v13 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(MultilingualSet);
      v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_TITLE"), &stru_25107A038, CFSTR("Keyboard")));
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = (void *)MEMORY[0x24BDD1488];
      v17 = objc_opt_class();
      v18 = v16;
      self = v47;
      v19 = objc_msgSend(v15, "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(v18, "bundleForClass:", v17), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_FOOTER"), &stru_25107A038, CFSTR("Keyboard")), v13);
      objc_msgSend(v14, "setProperty:forKey:", v19, *MEMORY[0x24BE75A68]);
      objc_msgSend(v48, "addObject:", v14);
      v20 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, v47, 0, 0, 0, 3, 0);
      objc_msgSend(v20, "setButtonAction:", sel_toggleInputMode_);
      objc_msgSend(v20, "setProperty:forKey:", CFSTR("Multilingual"), v46);
      objc_msgSend(v20, "setProperty:forKey:", v11, *MEMORY[0x24BE75DA0]);
      objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v48, "addObject:", v20);
    }
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MONOLINGUAL_KEYBOARD_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
  }
  else
  {
LABEL_16:
    v9 = 0;
  }
LABEL_17:
  objc_msgSend(v48, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 0, 0));
  v51 = objc_msgSend(v3, "count");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v43 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v59;
    v42 = v3;
    v52 = *MEMORY[0x24BDBCB68];
    v45 = *MEMORY[0x24BE75A18];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v59 != v41)
          objc_enumerationMutation(v3);
        obj = +[KSKeyboardListController softwareLayoutsForBaseInputMode:](KSKeyboardListController, "softwareLayoutsForBaseInputMode:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v21));
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
        v22 = (void *)UIKeyboardInputModesMatchingMode();
        v53 = v22;
        v44 = v21;
        if (objc_msgSend(v22, "count"))
        {
          objc_msgSend(v22, "firstObject");
          DefaultHardwareKeyboardForInputMode = objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("hw"));
        }
        else
        {
          DefaultHardwareKeyboardForInputMode = UIKeyboardGetDefaultHardwareKeyboardForInputMode();
        }
        v24 = DefaultHardwareKeyboardForInputMode;
        if (objc_msgSend(obj, "count"))
        {
          v50 = objc_msgSend(obj, "count");
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v55 != v27)
                  objc_enumerationMutation(obj);
                v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                if (!objc_msgSend(v29, "isEqualToString:", CFSTR("Korean-With-QWERTY"))
                  || _os_feature_enabled_impl())
                {
                  objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "valueForKey:", v52);
                  v30 = (void *)TUIKeyboardTitle();
                  v31 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v29, &stru_25107A038, CFSTR("KeyboardLayouts"));
                  v32 = objc_msgSend(v30, "length");
                  if (v32)
                    v33 = (uint64_t)v30;
                  else
                    v33 = v31;
                  if (v32 && v51 >= 2 && v50 >= 2)
                  {
                    v34 = (void *)MEMORY[0x24BDD17C8];
                    v35 = (void *)MEMORY[0x24BDD1488];
                    v36 = objc_opt_class();
                    v37 = v35;
                    self = v47;
                    v33 = objc_msgSend(v34, "stringWithFormat:", objc_msgSend((id)objc_msgSend(v37, "bundleForClass:", v36), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_VARIANT_%@_WITH_LAYOUT_%@"), &stru_25107A038, CFSTR("Keyboard")), v30, v31);
                  }
                  v38 = UIKeyboardInputModeWithNewSWLayout();
                  if (v24)
                    v38 = UIKeyboardInputModeWithNewHWLayout();
                  if (objc_msgSend((id)objc_opt_class(), "shouldAddInputMode:toEnabledInputModes:", v38, v53))
                  {
                    v39 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, 0, 0, 0, 3, 0);
                    objc_msgSend(v39, "setButtonAction:", sel_toggleInputMode_);
                    objc_msgSend(v39, "setProperty:forKey:", v38, v46);
                    if (objc_msgSend(v53, "containsObject:", v38))
                      objc_msgSend(v39, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v45);
                    objc_msgSend(v48, "addObject:", v39);
                  }
                }
              }
              v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            }
            while (v26);
          }
        }
        v21 = v44 + 1;
        v3 = v42;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v43);
  }
  return v48;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KSAddKeyboardController;
  v6 = -[KSAddKeyboardController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[KSAddKeyboardController specifierAtIndex:](self, "specifierAtIndex:", -[KSAddKeyboardController indexForIndexPath:](self, "indexForIndexPath:", a4));
  objc_msgSend(v6, "setAccessibilityIdentifier:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]));
  if ((objc_msgSend(v6, "isUserInteractionEnabled") & 1) == 0)
    objc_msgSend(v6, "setChecked:", 1);
  return v6;
}

- (void)addCheckedInputModes
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = -[KSAddKeyboardController specifiers](self, "specifiers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x24BE75D18];
    v9 = *MEMORY[0x24BE75AC0];
    v14 = *MEMORY[0x24BE75DA0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "propertyForKey:", v8, v14);
        v13 = (void *)objc_msgSend(v11, "propertyForKey:", v9);
        if (objc_msgSend(v12, "isChecked"))
        {
          if (_os_feature_enabled_impl()
            && objc_msgSend(v13, "isEqualToString:", CFSTR("Multilingual")))
          {
            v3 = TIUIGetInputModesByAddingProposedInputMode((void *)objc_msgSend(v11, "propertyForKey:", v14), v3);
          }
          else if ((objc_msgSend(v3, "containsObject:", v13) & 1) == 0)
          {
            objc_msgSend(v15, "addObject:", v13);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15));
}

- (void)updateDoneButton
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = -[KSAddKeyboardController specifiers](self, "specifiers", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BE75D18];
    v8 = *MEMORY[0x24BE75A18];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "propertyForKey:", v7);
        v12 = (void *)objc_msgSend(v10, "propertyForKey:", v8);
        if (objc_msgSend(v11, "isChecked") && (!v12 || (objc_msgSend(v12, "BOOLValue") & 1) != 0))
        {
          v13 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:
  objc_msgSend((id)objc_msgSend((id)-[KSAddKeyboardController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v13);
}

- (void)toggleInputMode:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  objc_msgSend(v4, "setChecked:", objc_msgSend(v4, "isChecked") ^ 1);
  -[KSAddKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (void)cancelButtonTapped
{
  objc_msgSend((id)-[KSAddKeyboardController navigationController](self, "navigationController"), "popViewControllerAnimated:", 1);
}

- (void)doneButtonTapped
{
  -[KSAddKeyboardController addCheckedInputModes](self, "addCheckedInputModes");
  objc_msgSend((id)-[KSAddKeyboardController parentController](self, "parentController"), "dismissForDone");
}

- (void)newSpecifiers
{
  __assert_rtn("-[KSAddKeyboardController newSpecifiers]", "KSAddKeyboardController.m", 129, "proposedMultilingualSet.count > 0");
}

@end
