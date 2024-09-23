@implementation KSKeyboardListController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setDisableFloatingKeyboardFilter:", 1);
  v5.receiver = self;
  v5.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController viewDidLoad](&v5, sel_viewDidLoad);
  v4 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "setEstimatedSectionFooterHeight:", 0.0);
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (KSKeyboardListController)init
{
  KSKeyboardListController *v2;
  PSSpecifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KSKeyboardListController;
  v2 = -[KSKeyboardListController init](&v5, sel_init);
  v2->_groupSeparator = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  if (objc_msgSend((id)objc_opt_class(), "showAddNewKeyboardButton"))
  {
    v3 = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_NEW_KEYBOARD"), &stru_25107A038, CFSTR("Keyboard")), v2, 0, 0, 0, 13, 0);
    v2->_addNewInputModeSpecifier = v3;
    -[PSSpecifier setProperty:forKey:](v3, "setProperty:forKey:", CFSTR("AddNewKeyboard"), *MEMORY[0x24BE75AC0]);
    -[PSSpecifier setButtonAction:](v2->_addNewInputModeSpecifier, "setButtonAction:", sel_addNewKeyboards_);
  }
  objc_msgSend((id)-[KSKeyboardListController navigationItem](v2, "navigationItem"), "setRightBarButtonItem:", -[KSKeyboardListController editButtonItem](v2, "editButtonItem"));
  objc_msgSend((id)objc_msgSend((id)-[KSKeyboardListController navigationItem](v2, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 0);
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setDisableFloatingKeyboardFilter:", 0);

  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController dealloc](&v4, sel_dealloc);
}

- (BOOL)allKeyboardsEnabled
{
  return self->_totalKeyboardsCount == self->_numberOfEnabledKeyboards;
}

- (void)updateEditButtonState
{
  void *v2;

  v2 = (void *)-[KSKeyboardListController parentController](self, "parentController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setNeedsReloadSpecifiers:", 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  BOOL deletingRow;
  uint64_t v8;
  void *v9;
  id *v10;
  id v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  objc_super v15;

  v4 = a4;
  v5 = a3;
  if (a3 && self->_numberOfEnabledKeyboards <= 1)
    -[KSKeyboardListController setEditing:animated:].cold.1();
  v15.receiver = self;
  v15.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController setEditing:animated:](&v15, sel_setEditing_animated_, a3, a4);
  if (!self->deletingRow)
    objc_msgSend((id)-[KSKeyboardListController navigationItem](self, "navigationItem"), "setHidesBackButton:animated:", v5, 1);
  deletingRow = self->deletingRow;
  if (v5)
  {
    v8 = (int)*MEMORY[0x24BE75700];
    if (!self->deletingRow)
    {
      v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __48__KSKeyboardListController_setEditing_animated___block_invoke;
      v14[3] = &unk_2510796F8;
      v14[4] = self;
      objc_msgSend(v9, "addEditingChangeHandler:", v14);
    }
    v10 = (id *)((char *)&self->super.super.super.super.super.isa + v8);
  }
  else
  {
    v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
    v11 = *v10;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__KSKeyboardListController_setEditing_animated___block_invoke_2;
    v12[3] = &unk_251079A20;
    v12[4] = self;
    v13 = deletingRow;
    objc_msgSend(v11, "addEditingChangeHandler:", v12);
  }
  objc_msgSend(*v10, "setEditing:animated:", v5, v4);
}

_QWORD *__48__KSKeyboardListController_setEditing_animated___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[175])
  {
    objc_msgSend(result, "removeSpecifier:animated:", result[174], 1);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "removeSpecifier:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1400), 1);
  }
  return result;
}

uint64_t __48__KSKeyboardListController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  char v3;
  _QWORD *v4;
  _BOOL8 v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "allKeyboardsEnabled") & 1) == 0 && !*(_BYTE *)(a1 + 40))
  {
    v2 = *(_QWORD **)(a1 + 32);
    if (v2[175])
    {
      objc_msgSend(v2, "addSpecifier:animated:", v2[174], 1);
      objc_msgSend(*(id *)(a1 + 32), "addSpecifier:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1400), 1);
    }
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "isEditing");
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (v3 & 1) != 0 || v4[178] > 1uLL;
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v5);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v8;

  if (objc_msgSend(a4, "section"))
    return 0;
  v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "specifier");
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  return (objc_msgSend((id)TIInputModeGetNormalizedIdentifier(), "isEqualToString:", CFSTR("emoji")) & 1) != 0
      || self->_numberOfEnabledKeyboards - self->_emojiEnabled > 1;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->deletingRow = 1;
  -[KSKeyboardListController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if (-[KSKeyboardListController isEditing](self, "isEditing", a3, a4) && self->deletingRow)
    -[KSKeyboardListController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  self->deletingRow = 0;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = objc_msgSend(a4, "row", a3) + 1;
  v8 = objc_msgSend(a5, "row") + 1;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = (int)*MEMORY[0x24BE756E0];
  objc_msgSend(v9, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.isa + v10));
  v11 = (void *)objc_msgSend(v9, "objectAtIndex:", v7);
  v12 = v11;
  objc_msgSend(v9, "removeObject:", v11);
  objc_msgSend(v9, "insertObject:atIndex:", v11, v8);

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v9;
  -[KSKeyboardListController _writeKeyboards](self, "_writeKeyboards");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  return objc_msgSend(v4, "accessoryType") || objc_msgSend(v4, "type") == 13;
}

- (id)specifierForInputMode:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend((id)objc_msgSend(v5, "availableSoftwareLayoutsForBaseInputMode:", TIInputModeGetNormalizedIdentifier()), "count")|| (KSInputModeIsChineseShuangpin() & 1) != 0|| KSInputModeIsChineseWubi())
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, objc_opt_class(), 2, 0);
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 3, 0);
  }
  v7 = v6;
  objc_msgSend(v6, "setProperty:forKey:", a3, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v7;
}

- (id)specifierForMultilingualInputModes:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, objc_opt_class(), 2, 0);
  v5 = objc_msgSend(a3, "firstObject");
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v4, "setProperty:forKey:", a3, *MEMORY[0x24BE75DA0]);
  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v4;
}

- (id)specifierForExtensionInputMode:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  KSAddExtensionKeyboardController *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 3, 0);
  objc_msgSend(v5, "setProperty:forKey:", a3, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v6 = (void *)objc_msgSend(MEMORY[0x24BEBD6E8], "keyboardInputModeWithIdentifier:", a3);
  v24[0] = v6;
  objc_msgSend(v5, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1), CFSTR("TIKBIdentifiersKey"));
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "extensionInputModes");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "containingBundle"), "bundlePath"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "containingBundle"), "bundlePath")))objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  objc_msgSend(v5, "setProperty:forKey:", v7, CFSTR("TIKBAllIdentifiersKey"));
  v14 = (void *)objc_msgSend(v6, "containingBundle");
  v15 = objc_msgSend(v14, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1D0]);
  if (!v15)
  {
    v16 = (void *)objc_msgSend(v6, "containingBundle");
    v15 = objc_msgSend(v16, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD298]);
  }
  objc_msgSend(v5, "setProperty:forKey:", v15, *MEMORY[0x24BE75D50]);
  v17 = objc_alloc_init(KSAddExtensionKeyboardController);
  -[KSAddExtensionKeyboardController setParentController:](v17, "setParentController:", self);
  -[KSAddExtensionKeyboardController setSpecifier:](v17, "setSpecifier:", v5);
  objc_msgSend(v5, "setTarget:", self);
  if (objc_msgSend(-[KSAddExtensionKeyboardController specifiers](v17, "specifiers"), "count"))
  {
    objc_msgSend(v5, "setDetailControllerClass:", objc_opt_class());
    objc_msgSend(v5, "setCellType:", 2);
  }
  return v5;
}

- (void)reloadSpecifiers
{
  _BOOL8 v3;
  objc_super v4;

  if (self->_newKeyboardsAdded)
  {
    -[KSKeyboardListController updateEditButtonState](self, "updateEditButtonState");
    self->_newKeyboardsAdded = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController reloadSpecifiers](&v4, sel_reloadSpecifiers);
  v3 = (-[KSKeyboardListController isEditing](self, "isEditing") & 1) != 0 || self->_numberOfEnabledKeyboards > 1;
  objc_msgSend((id)objc_msgSend((id)-[KSKeyboardListController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v3);
}

- (id)specifiers
{
  id v3;
  NSMutableArray *keyboardsArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  id MultilingualSetFromInputModes;
  void *NormalizedIdentifier;
  id v14;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v21)
    return v21;
  v17 = (int)*MEMORY[0x24BE756E0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[KSKeyboardListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARDS_SHORT"), &stru_25107A038, CFSTR("Keyboard")));
  v21 = v3;
  v16 = objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  objc_msgSend(v3, "addObject:");
  keyboardsArray = self->_keyboardsArray;
  if (keyboardsArray)

  self->_keyboardsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->_emojiEnabled = 0;
  self->_numberOfEnabledKeyboards = 0;
  self->_totalKeyboardsCount = objc_msgSend((id)UIKeyboardGetSupportedInputModes(), "count");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "_clearAllExtensionsIfNeeded");
  obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v5 = 0;
  if (_os_feature_enabled_impl())
    v5 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
  {
    v18 = 0;
    goto LABEL_30;
  }
  v7 = v6;
  v19 = (void *)v5;
  v18 = 0;
  v8 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      if (_os_feature_enabled_impl()
        && (v11 = TIUIGetMultilingualIDFromInputMode(), objc_msgSend(v11, "length")))
      {
        if ((objc_msgSend(v19, "containsObject:", v11) & 1) != 0)
          continue;
        objc_msgSend(v19, "addObject:", v11);
        MultilingualSetFromInputModes = TIUIInputModeGetMultilingualSetFromInputModes(v10, obj);
      }
      else
      {
        MultilingualSetFromInputModes = 0;
      }
      -[NSMutableArray addObject:](self->_keyboardsArray, "addObject:", v10);
      NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "identifierIsValidSystemInputMode:", NormalizedIdentifier))
      {
        if (_os_feature_enabled_impl()
          && (unint64_t)objc_msgSend(MultilingualSetFromInputModes, "count") >= 2)
        {
          v14 = -[KSKeyboardListController specifierForMultilingualInputModes:](self, "specifierForMultilingualInputModes:", MultilingualSetFromInputModes);
        }
        else
        {
          v14 = -[KSKeyboardListController specifierForInputMode:](self, "specifierForInputMode:", v10);
        }
        objc_msgSend(v21, "addObject:", v14);
        if (objc_msgSend(NormalizedIdentifier, "isEqualToString:", CFSTR("emoji")))
          self->_emojiEnabled = 1;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x24BEBD6E8], "keyboardInputModeWithIdentifier:", v10))
          continue;
        objc_msgSend(v21, "addObject:", -[KSKeyboardListController specifierForExtensionInputMode:](self, "specifierForExtensionInputMode:", v10));
        v18 = 1;
      }
      ++self->_numberOfEnabledKeyboards;
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v7);
LABEL_30:
  if ((self->deletingRow || (-[KSKeyboardListController isEditing](self, "isEditing") & 1) == 0)
    && !-[KSKeyboardListController allKeyboardsEnabled](self, "allKeyboardsEnabled")
    && self->_addNewInputModeSpecifier)
  {
    objc_msgSend(v21, "addObject:", self->_groupSeparator);
    objc_msgSend(v21, "addObject:", self->_addNewInputModeSpecifier);
  }
  if ((v18 & 1) != 0)
  {
    if (-[KSKeyboardListController aboutPrivacyController](self, "aboutPrivacyController"))
      -[KSAboutKeyboardPrivacyController setSpecifier:](-[KSKeyboardListController aboutPrivacyController](self, "aboutPrivacyController"), "setSpecifier:", v16);
    else
      -[KSKeyboardListController setAboutPrivacyController:](self, "setAboutPrivacyController:", -[KSAboutKeyboardPrivacyController initWithGroupSpecifier:asHeader:inListController:]([KSAboutKeyboardPrivacyController alloc], "initWithGroupSpecifier:asHeader:inListController:", v16, 0, self));
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa + v17) = (Class)v21;
  return v21;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  -[KSAboutKeyboardPrivacyController addPrivacyLinkViewIfNecessaryToHeaderView:forSection:](-[KSKeyboardListController aboutPrivacyController](self, "aboutPrivacyController", a3), "addPrivacyLinkViewIfNecessaryToHeaderView:forSection:", a4, a5);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KSKeyboardListController;
  v6 = -[KSKeyboardListController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[KSKeyboardListController specifierAtIndex:](self, "specifierAtIndex:", -[KSKeyboardListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  objc_msgSend(v6, "setAccessibilityIdentifier:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]));
  return v6;
}

- (void)addNewKeyboards:(id)a3
{
  KSAddKeyboardLanguageListSetupController *v5;

  v5 = objc_alloc_init(KSAddKeyboardLanguageListSetupController);
  -[PSSetupController setParentController:](v5, "setParentController:", self);
  -[PSRootController setSpecifier:](v5, "setSpecifier:", a3);
  objc_msgSend(a3, "setTarget:", self);
  -[KSKeyboardListController showController:](self, "showController:", v5);
}

- (void)_writeKeyboards
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  id MultilingualSet;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = *MEMORY[0x24BE75AC0];
    v8 = 0x256FD9000uLL;
    v9 = "TextInputCore";
    v10 = "multilingual_keyboard";
    do
    {
      v11 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "propertyForKey:", v7, v20);
        if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *(int *)(v8 + 548)), "containsObject:", v12))
        {
          if (_os_feature_enabled_impl())
          {
            v13 = v7;
            v14 = v6;
            v15 = v8;
            v16 = v3;
            v17 = v10;
            v18 = v9;
            MultilingualSet = TIUIInputModeGetMultilingualSet(v12);
            if ((unint64_t)objc_msgSend(MultilingualSet, "count") < 2)
              objc_msgSend(v21, "addObject:", v12);
            else
              objc_msgSend(v21, "addObjectsFromArray:", MultilingualSet);
            v9 = v18;
            v10 = v17;
            v3 = v16;
            v8 = v15;
            v6 = v14;
            v7 = v13;
            v5 = v20;
          }
          else
          {
            objc_msgSend(v21, "addObject:", v12);
          }
        }
        ++v11;
      }
      while (v5 != v11);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
  objc_msgSend((id)objc_opt_class(), "setInputModes:", v21);
  if (-[KSKeyboardListController allKeyboardsEnabled](self, "allKeyboardsEnabled"))
  {
    if (self->_addNewInputModeSpecifier)
    {
      -[KSKeyboardListController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_groupSeparator, 1);
      -[KSKeyboardListController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_addNewInputModeSpecifier, 1);
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;

  if (a4 == 1)
  {
    v6 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", objc_msgSend(a5, "row", a3) + 1);
    -[KSKeyboardListController removeInputModeWithIdentifier:](self, "removeInputModeWithIdentifier:", objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75AC0]));
    -[KSKeyboardListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
    -[KSKeyboardListController updateEditButtonState](self, "updateEditButtonState");
    if (-[KSKeyboardListController isEditing](self, "isEditing") && self->_numberOfEnabledKeyboards == 1)
      -[KSKeyboardListController setEditing:animated:](self, "setEditing:animated:", 0, 1);
    else
      -[KSKeyboardListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)removeInputModeWithIdentifier:(id)a3
{
  uint64_t NormalizedIdentifier;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[NSMutableArray removeObject:](self->_keyboardsArray, "removeObject:");
    --self->_numberOfEnabledKeyboards;
    -[KSKeyboardListController _writeKeyboards](self, "_writeKeyboards");
    NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
    if (NormalizedIdentifier)
    {
      v5 = NormalizedIdentifier;
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v7 = *MEMORY[0x24BEB5098];
      v8 = (id)objc_msgSend((id)objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x24BEB5098]), "mutableCopy");
      if (v8)
      {
        v9 = v8;
        v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v9);
              v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKey:", v15);
              if (objc_msgSend((id)TIInputModeGetNormalizedIdentifier(), "isEqualToString:", v5))
                objc_msgSend(v10, "addObject:", v15);
            }
            v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v12);
        }
        objc_msgSend(v9, "removeObjectsForKeys:", v10);
        if (objc_msgSend(v9, "count"))
          v16 = v9;
        else
          v16 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "setValue:forPreferenceKey:", v16, v7);
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[KSKeyboardListController reloadSpecifiers](self, "reloadSpecifiers");
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager");
  objc_msgSend(v4, "addListener:", self);
  objc_msgSend(v4, "startMonitoringAssetUpdateStatusForInputModes:", UIKeyboardGetActiveInputModes());
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "removeListener:", self);
  v5.receiver = self;
  v5.super_class = (Class)KSKeyboardListController;
  -[KSKeyboardListController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

+ (unint64_t)count
{
  if (_os_feature_enabled_impl())
    return TIUIGetCountOfUserVisibleInputModes();
  else
    return objc_msgSend((id)objc_msgSend(a1, "inputModes"), "count");
}

+ (id)inputModes
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
}

+ (void)setInputModes:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEBD6E0], "sharedInstance");
  objc_msgSend(v4, "saveInputModesPreference:", a3);
  objc_msgSend(v4, "setShouldUpdateCacheOnInputModesChange:", 1);
}

+ (id)supportedBaseInputModesForLanguage:(id)a3
{
  void *v4;
  _QWORD v6[5];

  if (!a3)
    +[KSKeyboardListController supportedBaseInputModesForLanguage:].cold.1();
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "_clearAllExtensions");
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController"), "supportedInputModeIdentifiers");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__KSKeyboardListController_supportedBaseInputModesForLanguage___block_invoke;
  v6[3] = &unk_251079A48;
  v6[4] = a3;
  return (id)objc_msgSend(v4, "objectsAtIndexes:", objc_msgSend(v4, "indexesOfObjectsPassingTest:", v6));
}

uint64_t __63__KSKeyboardListController_supportedBaseInputModesForLanguage___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)TIInputModeGetLanguageWithRegion(), "isEqualToString:", *(_QWORD *)(a1 + 32));
}

+ (id)softwareLayoutsForBaseInputMode:(id)a3
{
  void *SupportedSoftwareKeyboardsForInputMode;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  SupportedSoftwareKeyboardsForInputMode = (void *)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode();
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ja_JP-Kana")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("ja_JP")))
  {
    v5 = objc_msgSend(SupportedSoftwareKeyboardsForInputMode, "firstObject");
    if (!v5)
      +[KSKeyboardListController softwareLayoutsForBaseInputMode:].cold.1();
    v7[0] = v5;
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  }
  if (!KSInputModeIsChineseShuangpin())
    return SupportedSoftwareKeyboardsForInputMode;
  return KSFilteredLayoutsByCurrentShuangpinType(SupportedSoftwareKeyboardsForInputMode);
}

+ (id)supportedInputModesForLanguage:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __CFString *v13;
  uint64_t IdentifierFromComponents;
  id obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = a1;
  obj = (id)objc_msgSend(a1, "supportedBaseInputModesForLanguage:", a3);
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = (void *)objc_msgSend(v18, "softwareLayoutsForBaseInputMode:", v7);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v8);
              v13 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("Kana")))
                v13 = CFSTR("Kana");
              objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy"), "setObject:forKey:", v13, CFSTR("sw"));
              IdentifierFromComponents = UIKeyboardInputModeGetIdentifierFromComponents();
              if ((objc_msgSend(v5, "containsObject:", IdentifierFromComponents) & 1) == 0)
                objc_msgSend(v5, "addObject:", IdentifierFromComponents);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v10);
        }
        v6 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }
  return v5;
}

+ (id)availableInputModesForLanguage:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v6 = (id)objc_msgSend((id)objc_msgSend(a1, "supportedInputModesForLanguage:", a3), "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (!_os_feature_enabled_impl()
          || (unint64_t)objc_msgSend(TIUIInputModeGetMultilingualSet(v11), "count") <= 1)
        {
          v12 = (id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy");
          objc_msgSend(v12, "removeObjectForKey:", CFSTR("hw"));
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("sw")), "hasPrefix:", CFSTR("Kana")))objc_msgSend(v12, "setObject:forKey:", CFSTR("Kana"), CFSTR("sw"));
          objc_msgSend(v6, "removeObject:", UIKeyboardInputModeGetIdentifierFromComponents());
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v6;
}

+ (id)availableSoftwareLayoutsForBaseInputMode:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (id)objc_msgSend((id)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode(), "mutableCopy");
  if (KSInputModeIsChineseShuangpin())
    v4 = (id)objc_msgSend(KSFilteredLayoutsByCurrentShuangpinType(v4), "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v5 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes", 0, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(a3, "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
        {
          v10 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
          if (objc_msgSend(a3, "hasPrefix:", CFSTR("ja_JP"))
            && (objc_msgSend(v10, "_containsSubstring:", CFSTR("Kana")) & 1) != 0)
          {
            objc_msgSend(v4, "removeAllObjects");
            return v4;
          }
          objc_msgSend(v4, "removeObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  return v4;
}

+ (id)keyboardDisplayNameForIdentifier:(id)a3
{
  return (id)TUIKeyboardDisplayNameFromIdentifier();
}

+ (id)displayNameForHardwareLayout:(id)a3 inputMode:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Automatic")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Automatic"), &stru_25107A038, CFSTR("KeyboardLayouts"));
    v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "hardwareLayoutToUseForInputMode:", a4);
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle;
  if (displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle
    || (v8 = (void *)objc_msgSend((id)MEMORY[0x24267F244](), "stringByAppendingPathComponent:", CFSTR("System/Library/KeyboardLayouts/USBKeyboardLayouts.bundle")), v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", objc_msgSend(v8, "stringByResolvingSymlinksInPath")), (displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle = (uint64_t)v7) != 0)|| (NSLog(CFSTR("%s: Error: could not locate bundle at '%@'"), "+[KSKeyboardListController displayNameForHardwareLayout:inputMode:]", v8), (v7 = (id)displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle) != 0))
  {
    v5 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", v5, 0, CFSTR("InfoPlist"));
    if (v6)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("%@ — %@"), &stru_25107A038, CFSTR("Automatic - <Resolved Keyboard Layout Name>")), v6, v5);
  }
  else if (v6)
  {
    return v6;
  }
  return v5;
}

+ (id)attributedTitleForSymbolName:(id)a3 cellTitle:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDD1688]);
  if (a3)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "attributedStringForSymbolName:", a3);
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"), "userInterfaceLayoutDirection") == 1)
        objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\u200F")));
      objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\t⁨")));
      objc_msgSend(v6, "appendAttributedString:", v8);
      objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("⁩\t")));
    }
  }
  objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", a4));
  v9 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle"), "mutableCopy");
  v10 = objc_alloc(MEMORY[0x24BEBB510]);
  v11 = MEMORY[0x24BDBD1B8];
  v15[0] = (id)objc_msgSend(v10, "initWithTextAlignment:location:options:", 4, MEMORY[0x24BDBD1B8], 0.0);
  v15[1] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBB510]), "initWithTextAlignment:location:options:", 1, v11, 10.0);
  v15[2] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBB510]), "initWithTextAlignment:location:options:", 4, v11, 28.0);
  objc_msgSend(v9, "setTabStops:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3));
  v13 = *MEMORY[0x24BEBB3A8];
  v14 = v9;
  objc_msgSend(v6, "addAttributes:range:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), 0, objc_msgSend(v6, "length"));
  return v6;
}

+ (id)attributedStringForSymbolName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", a3);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", a3), "imageWithRenderingMode:", 2);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
  objc_msgSend(v7, "setImage:", v6);
  if (objc_msgSend(v7, "image"))
    return (id)objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v7);
  return v4;
}

+ (BOOL)showAddNewKeyboardButton
{
  return 1;
}

- (NSMutableArray)keyboardsArray
{
  return self->_keyboardsArray;
}

- (BOOL)newKeyboardsAdded
{
  return self->_newKeyboardsAdded;
}

- (void)setNewKeyboardsAdded:(BOOL)a3
{
  self->_newKeyboardsAdded = a3;
}

- (KSAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1440);
}

- (void)setEditing:animated:.cold.1()
{
  __assert_rtn("-[KSKeyboardListController setEditing:animated:]", "KSKeyboardListController.m", 193, "_numberOfEnabledKeyboards > 1");
}

+ (void)supportedBaseInputModesForLanguage:.cold.1()
{
  __assert_rtn("+[KSKeyboardListController supportedBaseInputModesForLanguage:]", "KSKeyboardListController.m", 601, "languageIdentifier != nil");
}

+ (void)softwareLayoutsForBaseInputMode:.cold.1()
{
  __assert_rtn("+[KSKeyboardListController softwareLayoutsForBaseInputMode:]", "KSKeyboardListController.m", 624, "keyboardLayout != nil");
}

@end
