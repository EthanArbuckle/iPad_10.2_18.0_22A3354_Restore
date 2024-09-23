@implementation TIAddKeyboardController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardController;
  -[TIAddKeyboardController viewDidLoad](&v4, sel_viewDidLoad);
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
  v7.super_class = (Class)TIAddKeyboardController;
  -[TIAddKeyboardController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  v4 = (void *)-[TIAddKeyboardController navigationItem](self, "navigationItem");
  v5 = (void *)-[TIAddKeyboardController specifier](self, "specifier");
  objc_msgSend(v4, "setTitle:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D50]));
  objc_msgSend(v4, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped));
  objc_msgSend((id)objc_msgSend(v4, "rightBarButtonItem"), "setEnabled:", 0);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_doneButtonTapped, *MEMORY[0x24BDF75D8], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardController;
  -[TIAddKeyboardController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TIAddKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)TIAddKeyboardController;
  -[TIAddKeyboardController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[TIAddKeyboardController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

+ (BOOL)shouldAddInputMode:(id)a3 toEnabledInputModes:(id)a4
{
  return !objc_msgSend((id)TIInputModeGetLanguageWithRegion(), "isEqualToString:", CFSTR("ja_JP"))
      || !objc_msgSend((id)TIInputModeGetVariant(), "hasPrefix:", CFSTR("Kana"))
      || objc_msgSend((id)objc_msgSend(a4, "indexesOfObjectsPassingTest:", &__block_literal_global_3), "count") == 0;
}

uint64_t __66__TIAddKeyboardController_shouldAddInputMode_toEnabledInputModes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
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
            if (objc_msgSend(TIUIGetProposedMultilingualSetsForAddingInputMode(NormalizedIdentifier, (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers")), "count"))
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

- (void)setSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)TIAddKeyboardController;
  -[TIAddKeyboardController setSpecifier:](&v17, sel_setSpecifier_, a3);
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE75AC0]);
  if (_os_feature_enabled_impl())
  {
    v7 = +[TIKeyboardListController supportedBaseInputModesForLanguage:](TIKeyboardListController, "supportedBaseInputModesForLanguage:", v6);
    if (_os_feature_enabled_impl())
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v5, "addObjectsFromArray:", TIUIGetProposedMultilingualSetsForAddingInputMode(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v11++), v4));
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v9);
      }
    }
  }
  if (_os_feature_enabled_impl())
    v12 = -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier:enabledInputModes:](self, "koreanEnglishBilingualInputModeIdentifier:enabledInputModes:", v6, v4);
  else
    v12 = 0;
  -[TIAddKeyboardController setProposedMultilingualInputModes:](self, "setProposedMultilingualInputModes:", v5);
  -[TIAddKeyboardController setKoreanEnglishBilingualInputModeIdentifier:](self, "setKoreanEnglishBilingualInputModeIdentifier:", v12);
}

- (id)newSpecifiers
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[TIAddKeyboardController supportsMultilingual](self, "supportsMultilingual")
    && (objc_msgSend(v3, "addObjectsFromArray:", -[TIAddKeyboardController keyboardTypeSpecifiers](self, "keyboardTypeSpecifiers")), !-[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption")))
  {
    if (-[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes"), "count") < 2)return v3;
    v4 = -[TIAddKeyboardController multilingualSpecifiers](self, "multilingualSpecifiers");
  }
  else
  {
    v4 = -[TIAddKeyboardController monolingualSpecifiers](self, "monolingualSpecifiers");
  }
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  return v3;
}

- (id)keyboardTypeSpecifiers
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id MultilingualSet;
  id v13;
  void *Current;
  id v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, &stru_24E732B90);
  objc_msgSend(v3, "addObject:", v4);
  if (-[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier"))
  {
    if (!-[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption"))
    {
      v5 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", CFSTR("ko_KR"));
      objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_FOOTER"), &stru_24E732B90, CFSTR("Keyboard")), v5), *MEMORY[0x24BE75A68]);
    }
    v6 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", CFSTR("en"));
    v7 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_TITLE_WITH_LANGUAGE"), &stru_24E732B90, CFSTR("Keyboard")), v6), self, 0, 0, 0, 3, 0);
    objc_msgSend(v7, "setButtonAction:", sel_enableMultilingualKeyboards_);
    v8 = -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier");
    v9 = *MEMORY[0x24BE75AC0];
    goto LABEL_10;
  }
  if (-[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes"), "count") > 1)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_TITLE"), &stru_24E732B90, CFSTR("Keyboard")), self, 0, 0, 0, 3, 0);
    objc_msgSend(v7, "setButtonAction:", sel_enableMultilingualKeyboards_);
    v9 = *MEMORY[0x24BE75AC0];
    v8 = CFSTR("Multilingual");
LABEL_10:
    objc_msgSend(v7, "setProperty:forKey:", v8, v9);
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    goto LABEL_11;
  }
  v10 = -[NSArray firstObject](-[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes"), "firstObject");
  if (!-[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption"))
  {
    MultilingualSet = TIUIProposedInputModeGetMultilingualSet(v10);
    v13 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(MultilingualSet, 0);
    objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_FOOTER"), &stru_24E732B90, CFSTR("Keyboard")), v13), *MEMORY[0x24BE75A68]);
  }
  Current = (void *)TIUIProposedInputModeGetCurrent(v10, v11);
  v15 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(Current, 0);
  v7 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_ADD_TITLE_WITH_LANGUAGE"), &stru_24E732B90, CFSTR("Keyboard")), v15), self, 0, 0, 0, 3, 0);
  objc_msgSend(v7, "setButtonAction:", sel_enableMultilingualKeyboards_);
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75DA0]);
  v9 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v7, "setProperty:forKey:", CFSTR("Multilingual"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v7, "setUserInfo:", &unk_24E73E498);
LABEL_11:
  objc_msgSend(v3, "addObject:", v7);
  v16 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_MONOLINGUAL_KEYBOARD_TITLE"), &stru_24E732B90, CFSTR("Keyboard")), self, 0, 0, 0, 3, 0);
  objc_msgSend(v16, "setButtonAction:", sel_enableMonolingualKeyboards_);
  objc_msgSend(v16, "setProperty:forKey:", CFSTR("Monolingual"), v9);
  objc_msgSend(v3, "addObject:", v16);
  return v3;
}

- (id)multilingualSpecifiers
{
  TIAddKeyboardController *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *Current;
  void *v14;
  NSArray *obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_TITLE"), &stru_24E732B90, CFSTR("Keyboard")), self, 0, 0, 0, 0, 0));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self;
  obj = -[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x24BE75AC0];
    v9 = *MEMORY[0x24BE75DA0];
    v10 = *MEMORY[0x24BE75868];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        Current = (void *)TIUIProposedInputModeGetCurrent(v12, v5);
        v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(Current, 0), v3, 0, 0, 0, 3, 0);
        objc_msgSend(v14, "setButtonAction:", sel_toggleMultilingualInputMode_);
        objc_msgSend(v14, "setProperty:forKey:", CFSTR("Multilingual"), v8);
        objc_msgSend(v14, "setProperty:forKey:", v12, v9);
        objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v10);
        objc_msgSend(v14, "setUserInfo:", &unk_24E73E4C0);
        objc_msgSend(v17, "addObject:", v14);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  return v17;
}

- (id)monolingualSpecifiers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t DefaultHardwareKeyboardForInputMode;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TIAddKeyboardController *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = *MEMORY[0x24BE75AC0];
  obj = +[TIKeyboardListController supportedBaseInputModesForLanguage:](TIKeyboardListController, "supportedBaseInputModesForLanguage:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:"));
  if (-[TIAddKeyboardController supportsMultilingual](self, "supportsMultilingual"))
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MONOLINGUAL_KEYBOARD_TITLE"), &stru_24E732B90, CFSTR("Keyboard"));
  else
    v3 = 0;
  objc_msgSend(v27, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v3, self, 0, 0, 0, 0, 0));
  v29 = objc_msgSend(obj, "count");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v41;
    v4 = *MEMORY[0x24BDBCB68];
    v25 = *MEMORY[0x24BE75A18];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(obj);
        v32 = +[TIKeyboardListController softwareLayoutsForBaseInputMode:](TIKeyboardListController, "softwareLayoutsForBaseInputMode:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v5));
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers");
        v6 = (void *)UIKeyboardInputModesMatchingMode();
        v24 = v5;
        v33 = v6;
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "firstObject");
          DefaultHardwareKeyboardForInputMode = objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("hw"));
        }
        else
        {
          DefaultHardwareKeyboardForInputMode = UIKeyboardGetDefaultHardwareKeyboardForInputMode();
        }
        v31 = DefaultHardwareKeyboardForInputMode;
        if (objc_msgSend(v32, "count"))
        {
          v28 = objc_msgSend(v32, "count");
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v35)
          {
            v34 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v37 != v34)
                  objc_enumerationMutation(v32);
                v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Korean-With-QWERTY")) & 1) == 0)
                {
                  objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "valueForKey:", v4);
                  v10 = (void *)TUIKeyboardTitle();
                  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v9, &stru_24E732B90, CFSTR("KeyboardLayouts"));
                  v12 = objc_msgSend(v10, "length");
                  if (v12)
                    v13 = (uint64_t)v10;
                  else
                    v13 = v11;
                  if (v12 && v29 >= 2 && v28 >= 2)
                  {
                    v30 = (void *)MEMORY[0x24BDD17C8];
                    v14 = self;
                    v15 = (void *)MEMORY[0x24BDD1488];
                    v16 = objc_opt_class();
                    v17 = v15;
                    self = v14;
                    v13 = objc_msgSend(v30, "stringWithFormat:", objc_msgSend((id)objc_msgSend(v17, "bundleForClass:", v16), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_VARIANT_%@_WITH_LAYOUT_%@"), &stru_24E732B90, CFSTR("Keyboard")), v10, v11);
                  }
                  v18 = UIKeyboardInputModeWithNewSWLayout();
                  if (v31)
                    v18 = UIKeyboardInputModeWithNewHWLayout();
                  if (objc_msgSend((id)objc_opt_class(), "shouldAddInputMode:toEnabledInputModes:", v18, v33))
                  {
                    v19 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 3, 0);
                    objc_msgSend(v19, "setButtonAction:", sel_toggleInputMode_);
                    objc_msgSend(v19, "setProperty:forKey:", v18, v26);
                    if (objc_msgSend(v33, "containsObject:", v18))
                      objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v25);
                    objc_msgSend(v27, "addObject:", v19);
                  }
                }
              }
              v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v35);
          }
        }
        v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v23);
  }
  return v27;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIAddKeyboardController;
  v6 = -[TIAddKeyboardController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[TIAddKeyboardController specifierAtIndex:](self, "specifierAtIndex:", -[TIAddKeyboardController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v8 = (void *)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  objc_msgSend(v6, "setAccessibilityIdentifier:", v8);
  if (objc_msgSend(v6, "isUserInteractionEnabled"))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Multilingual"))
      || -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier")&& objc_msgSend(v8, "isEqualToString:", -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier")))
    {
      v9 = -[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption") ^ 1;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Monolingual")))
        return v6;
      v9 = -[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption");
    }
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(v6, "setChecked:", v9);
  return v6;
}

- (id)koreanEnglishBilingualInputModeIdentifier:(id)a3 enabledInputModes:(id)a4
{
  uint64_t i;
  uint64_t v6;
  uint64_t DefaultHardwareKeyboardForInputMode;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = +[TIKeyboardListController supportedBaseInputModesForLanguage:](TIKeyboardListController, "supportedBaseInputModesForLanguage:", a3);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v16)
    return 0;
  v17 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      if (!objc_msgSend(a4, "count")
        || (objc_msgSend(a4, "firstObject"),
            (DefaultHardwareKeyboardForInputMode = objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("hw"))) == 0))
      {
        DefaultHardwareKeyboardForInputMode = UIKeyboardGetDefaultHardwareKeyboardForInputMode();
      }
      v8 = +[TIKeyboardListController softwareLayoutsForBaseInputMode:](TIKeyboardListController, "softwareLayoutsForBaseInputMode:", v6);
      if (objc_msgSend(v8, "count"))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
LABEL_12:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "isEqualToString:", CFSTR("Korean-With-QWERTY")))
            {
              v13 = (void *)UIKeyboardInputModeWithNewSWLayout();
              if (DefaultHardwareKeyboardForInputMode)
                v13 = (void *)UIKeyboardInputModeWithNewHWLayout();
              if (!objc_msgSend(a4, "containsObject:", v13))
                return v13;
            }
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v10)
                goto LABEL_12;
              break;
            }
          }
        }
      }
    }
    v13 = 0;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
      continue;
    return v13;
  }
}

- (BOOL)supportsMultilingual
{
  return -[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes"), "count")|| -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier") != 0;
}

- (void)addCheckedInputModes
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
  void *v14;
  id v15;
  TIAddKeyboardController *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  v3 = -[TIAddKeyboardController specifiers](self, "specifiers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x24BE75D18];
    v8 = *MEMORY[0x24BE75AC0];
    v13 = *MEMORY[0x24BE75DA0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "propertyForKey:", v7, v13);
        v12 = (void *)objc_msgSend(v10, "propertyForKey:", v8);
        if ((!objc_msgSend(v12, "isEqualToString:", CFSTR("Multilingual"))
           || -[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](v16, "proposedMultilingualInputModes"), "count") <= 1)&& (objc_msgSend(v12, "isEqualToString:", CFSTR("Monolingual")) & 1) == 0&& objc_msgSend(v11, "isChecked"))
        {
          if (_os_feature_enabled_impl()
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "userInfo"), "objectForKeyedSubscript:", CFSTR("multilingual")), "BOOLValue"))
          {
            v15 = TIUIGetInputModesByAddingProposedInputMode((void *)objc_msgSend(v10, "propertyForKey:", v13), v15);
          }
          else if ((objc_msgSend(v15, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v14, "addObject:", v12);
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v14));
}

- (void)updateDoneButton
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = -[TIAddKeyboardController specifiers](self, "specifiers");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x24BE75AC0];
    v7 = *MEMORY[0x24BE75D18];
    v8 = *MEMORY[0x24BE75A18];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "propertyForKey:", v6);
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Monolingual")) & 1) == 0
          && (!objc_msgSend(v11, "isEqualToString:", CFSTR("Multilingual"))
           || -[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](self, "proposedMultilingualInputModes"), "count") <= 1))
        {
          v12 = (void *)objc_msgSend(v10, "propertyForKey:", v7);
          v13 = (void *)objc_msgSend(v10, "propertyForKey:", v8);
          if (objc_msgSend(v12, "isChecked"))
          {
            if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) != 0)
            {
              v14 = 1;
              goto LABEL_16;
            }
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_16:
  objc_msgSend((id)objc_msgSend((id)-[TIAddKeyboardController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v14);
}

- (void)enableMultilingualKeyboards:(id)a3
{
  -[TIAddKeyboardController setShowsMonolingualOption:](self, "setShowsMonolingualOption:", 0);
  -[TIAddKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
  -[TIAddKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (void)enableMonolingualKeyboards:(id)a3
{
  -[TIAddKeyboardController setShowsMonolingualOption:](self, "setShowsMonolingualOption:", 1);
  -[TIAddKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
  -[TIAddKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (void)toggleInputMode:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  objc_msgSend(v4, "setChecked:", objc_msgSend(v4, "isChecked") ^ 1);
  -[TIAddKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (void)toggleMultilingualInputMode:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[TIAddKeyboardController specifiers](self, "specifiers", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = *MEMORY[0x24BE75D18];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "propertyForKey:", v9);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "userInfo"), "objectForKeyedSubscript:", CFSTR("multilingual")), "BOOLValue"))objc_msgSend(v12, "setChecked:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  -[TIAddKeyboardController toggleInputMode:](self, "toggleInputMode:", a3);
}

- (void)cancelButtonTapped
{
  objc_msgSend((id)-[TIAddKeyboardController navigationController](self, "navigationController"), "popViewControllerAnimated:", 1);
}

- (void)doneButtonTapped
{
  -[TIAddKeyboardController addCheckedInputModes](self, "addCheckedInputModes");
  objc_msgSend((id)-[TIAddKeyboardController parentController](self, "parentController"), "dismissForDone");
}

- (NSString)koreanEnglishBilingualInputModeIdentifier
{
  return self->_koreanEnglishBilingualInputModeIdentifier;
}

- (void)setKoreanEnglishBilingualInputModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (BOOL)showsMonolingualOption
{
  return self->_showsMonolingualOption;
}

- (void)setShowsMonolingualOption:(BOOL)a3
{
  self->_showsMonolingualOption = a3;
}

- (NSArray)proposedMultilingualInputModes
{
  return self->_proposedMultilingualInputModes;
}

- (void)setProposedMultilingualInputModes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1392);
}

@end
