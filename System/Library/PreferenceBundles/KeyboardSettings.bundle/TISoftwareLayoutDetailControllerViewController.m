@implementation TISoftwareLayoutDetailControllerViewController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TISoftwareLayoutDetailControllerViewController;
  -[TISoftwareLayoutDetailControllerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TISoftwareLayoutDetailControllerViewController;
  -[TISoftwareLayoutDetailControllerViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)updateTitle
{
  id v3;

  if (-[NSArray count](-[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet"), "count") < 2)
  {
    -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
    v3 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion());
  }
  else
  {
    v3 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(-[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet"));
  }
  objc_msgSend((id)-[TISoftwareLayoutDetailControllerViewController navigationItem](self, "navigationItem"), "setTitle:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TISoftwareLayoutDetailControllerViewController;
  -[TISoftwareLayoutDetailControllerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TISoftwareLayoutDetailControllerViewController updateTitle](self, "updateTitle");
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[TISoftwareLayoutDetailControllerViewController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)newSpecifiers
{
  NSArray *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *MultilingualSetFromInputModesWithPreferredLanguages;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *MultilingualSet;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  void *v53;
  uint64_t v54;
  _BOOL4 v55;
  NSArray *v56;
  int v57;
  void *NormalizedIdentifier;
  void *v59;
  id obj;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
  if (TIInputModeIsChineseShuangpin())
    return -[TISoftwareLayoutDetailControllerViewController newSpecifiersForChineseShuangpin](self, "newSpecifiersForChineseShuangpin");
  if (TIInputModeIsChineseWubi())
    return -[TISoftwareLayoutDetailControllerViewController newSpecifiersForChineseWubi](self, "newSpecifiersForChineseWubi");
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  v63 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
  v3 = -[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet");
  if (_os_feature_enabled_impl())
    v4 = -[NSArray count](v3, "count") > 1;
  else
    v4 = 0;
  v5 = (void *)MEMORY[0x24BDBCEE0];
  TIInputModeGetNormalizedIdentifier();
  obj = (id)objc_msgSend(v5, "orderedSetWithArray:", UIKeyboardGetSupportedSoftwareKeyboardsForInputMode());
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count") + 1);
  v6 = objc_msgSend(TIUIGetAddableInputModesForMultilingualSet(v3), "count");
  if (v6)
    v7 = 1;
  else
    v7 = v4;
  -[TISoftwareLayoutDetailControllerViewController setShowingLanguagesSection:](self, "setShowingLanguagesSection:", v7);
  v8 = 0x24BDD1000uLL;
  v57 = v7;
  if ((_DWORD)v7 == 1)
  {
    if ((TIUIMultilingualSetContainsTransliterationInputModes(v3) & 1) == 0)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v81 != v11)
              objc_enumerationMutation(v3);
            TIInputModeGetNormalizedIdentifier();
            objc_msgSend(obj, "addObjectsFromArray:", UIKeyboardGetSupportedSoftwareKeyboardsForInputMode());
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        }
        while (v10);
      }
    }
    v13 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_LANGUAGES_TITLE"), &stru_24E732B90, CFSTR("Keyboard")));
    v55 = v4;
    v54 = v6;
    if (v4)
    {
      v14 = -[NSArray count](v3, "count");
      v15 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      if (v6 || v14 != 2)
        v16 = CFSTR("MULTILINGUAL_DETAIL_FOOTER_3");
      else
        v16 = CFSTR("MULTILINGUAL_DETAIL_FOOTER_2");
    }
    else
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = CFSTR("MULTILINGUAL_DETAIL_FOOTER_1");
    }
    v17 = objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24E732B90, CFSTR("Keyboard"));
    objc_msgSend(v13, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);
    objc_msgSend(v62, "addObject:", v13);
    -[NSArray firstObject](v3, "firstObject");
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    MultilingualSetFromInputModesWithPreferredLanguages = (void *)TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
    v76 = 0u;
    v77 = 0u;
    v56 = v3;
    if (!objc_msgSend(MultilingualSetFromInputModesWithPreferredLanguages, "count"))
      MultilingualSetFromInputModesWithPreferredLanguages = v3;
    v78 = 0uLL;
    v79 = 0uLL;
    v19 = objc_msgSend(MultilingualSetFromInputModesWithPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v77;
      v22 = *MEMORY[0x24BE75AC0];
      v23 = *MEMORY[0x24BE75DA0];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v77 != v21)
            objc_enumerationMutation(MultilingualSetFromInputModesWithPreferredLanguages);
          v25 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
          if ((TIInputModeIsMultilingualOnly() & 1) == 0)
          {
            v26 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion()), 0, 0, 0, 0, 3, 0);
            objc_msgSend(v26, "setProperty:forKey:", v25, v22);
            objc_msgSend(v26, "setProperty:forKey:", CFSTR("language"), v23);
            objc_msgSend(v62, "addObject:", v26);
          }
        }
        v20 = objc_msgSend(MultilingualSetFromInputModesWithPreferredLanguages, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      }
      while (v20);
    }
    v8 = 0x24BDD1000uLL;
    v3 = v56;
    v4 = v55;
    if (v54)
    {
      v27 = (void *)MEMORY[0x24BE75590];
      v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_ADD_LANGUAGE"), &stru_24E732B90, CFSTR("Keyboard"));
      v29 = (void *)objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, 0, objc_opt_class(), 2, 0);
      objc_msgSend(v29, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v62, "addObject:", v29);
    }
  }
  if (v4)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BDF6B40], "multilingualSetsFromInputModeIdentifiers:", +[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v73 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "identifier");
          MultilingualSet = (void *)TIInputModeGetMultilingualSet();
          if (TIUIGetMultlingualSetsAreEqual(v3, MultilingualSet))
          {
            objc_msgSend(MultilingualSet, "firstObject");
            v36 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
            if ((objc_msgSend(v36, "isEqualToString:", v63) & 1) == 0)
              objc_msgSend(obj, "removeObject:", v36);
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      }
      while (v32);
    }
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v37 = +[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes");
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v69;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v69 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m);
          if (!_os_feature_enabled_impl()
            || (unint64_t)objc_msgSend(TIUIInputModeGetMultilingualSet(v42), "count") <= 1)
          {
            if (objc_msgSend(NormalizedIdentifier, "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
            {
              v43 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
              if ((objc_msgSend(v43, "isEqualToString:", v63) & 1) == 0)
                objc_msgSend(obj, "removeObject:", v43);
            }
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
      }
      while (v39);
    }
  }
  if (v57)
    v44 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_LAYOUTS_TITLE"), &stru_24E732B90, CFSTR("Keyboard")));
  else
    v44 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", 0);
  v45 = v44;
  objc_msgSend(v44, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v59 = v45;
  objc_msgSend(v62, "addObject:", v45);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v65;
    v49 = *MEMORY[0x24BE75AC0];
    v50 = *MEMORY[0x24BE75C20];
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v65 != v48)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * n);
        if (!objc_msgSend(v52, "isEqualToString:", CFSTR("Korean-With-QWERTY"))
          || _os_feature_enabled_impl())
        {
          v53 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(*(id *)(v8 + 1160), "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v52, &stru_24E732B90, CFSTR("KeyboardLayouts")), self, 0, 0, 0, 3, 0);
          objc_msgSend(v53, "setProperty:forKey:", v52, v49);
          if (objc_msgSend(v63, "isEqualToString:", v52))
            objc_msgSend(v59, "setProperty:forKey:", v53, v50);
          objc_msgSend(v62, "addObject:", v53);
          v8 = 0x24BDD1000;
        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
    }
    while (v47);
  }
  return v62;
}

- (id)newSpecifiersForChineseShuangpin
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = TIGetShuangpinTypes();
  v4 = TIGetCurrentShuangpinType();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", 0);
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v17 = v6;
  objc_msgSend(v5, "addObject:", v6);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x24BE75AC0];
    v16 = *MEMORY[0x24BE75C20];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "integerValue");
        v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", TIGetShuangpinNameFromType(v13), self, 0, 0, 0, 3, 0);
        objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "stringValue"), v10);
        if (v4 == v13)
          objc_msgSend(v17, "setProperty:forKey:", v14, v16);
        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)newSpecifiersForChineseWubi
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = TIGetWubiStandards();
  v4 = TIGetCurrentWubiStandard();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  v6 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", 0);
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v17 = v6;
  objc_msgSend(v5, "addObject:", v6);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x24BE75AC0];
    v16 = *MEMORY[0x24BE75C20];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "integerValue");
        v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", TIGetWubiStandardName(v13), self, 0, 0, 0, 3, 0);
        objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "stringValue"), v10);
        if (v4 == v13)
          objc_msgSend(v17, "setProperty:forKey:", v14, v16);
        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "specifier");
  return objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]), "isEqual:", CFSTR("language")) ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int IsChineseWubi;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TISoftwareLayoutDetailControllerViewController;
  -[TISoftwareLayoutDetailControllerViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_);
  v7 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (v7)
  {
    v8 = (void *)v7;
    -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
    if (TIInputModeIsChineseShuangpin())
    {
      v9 = (void *)objc_msgSend(v8, "specifier");
      v10 = (void *)objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      if (v11)
        -[TISoftwareLayoutDetailControllerViewController setShuangpinType:](self, "setShuangpinType:", v11);
    }
    else
    {
      -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
      IsChineseWubi = TIInputModeIsChineseWubi();
      v13 = (void *)objc_msgSend(v8, "specifier");
      v14 = (void *)objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v15 = v14;
      if (IsChineseWubi)
      {
        if (v14)
          -[TISoftwareLayoutDetailControllerViewController setWubiStandard:](self, "setWubiStandard:", objc_msgSend(v14, "integerValue"));
      }
      else if (objc_msgSend(v14, "length"))
      {
        -[TISoftwareLayoutDetailControllerViewController setSoftwareLayout:](self, "setSoftwareLayout:", v15);
      }
    }
  }
}

- (NSString)inputMode
{
  NSString *result;
  void *v4;

  result = self->_inputMode;
  if (!result)
  {
    v4 = (void *)-[TISoftwareLayoutDetailControllerViewController specifier](self, "specifier");
    result = (NSString *)objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]), "copy");
    self->_inputMode = result;
  }
  return result;
}

- (NSArray)multilingualSet
{
  NSArray *result;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  result = self->_multilingualSet;
  if (!result)
  {
    v4 = (void *)-[TISoftwareLayoutDetailControllerViewController specifier](self, "specifier");
    v5 = (void *)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    if (!v5)
    {
      v6[0] = -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    }
    result = v5;
    self->_multilingualSet = result;
  }
  return result;
}

- (void)setSoftwareLayout:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *MultilingualID;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t IdentifierFromComponents;

  v5 = (id)objc_msgSend(+[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes"), "mutableCopy");
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "indexOfObject:", -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      if (_os_feature_enabled_impl()
        && -[NSArray count](-[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet"), "count") >= 2)
      {
        -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
        MultilingualID = (void *)TIInputModeGetMultilingualID();
        if (!objc_msgSend(MultilingualID, "length") || !objc_msgSend(v5, "count"))
          return;
        v9 = 0;
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
          if (objc_msgSend((id)TIInputModeGetMultilingualID(), "isEqualToString:", MultilingualID))
          {
            if (v10 == 0x7FFFFFFFFFFFFFFFLL)
              v10 = v9;
            objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
            TIInputModeGetNormalizedIdentifier();
            if (objc_msgSend((id)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode(), "containsObject:", a3))
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
              v11 = UIKeyboardInputModeWithNewSWLayout();
              if (v9 == v10)
              {
                objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v9, v11);
                goto LABEL_23;
              }
              if (v9 > v10)
                break;
            }
          }
          if (++v9 >= objc_msgSend(v5, "count"))
            return;
        }
        objc_msgSend(v5, "removeObjectAtIndex:", v9);
        objc_msgSend(v5, "insertObject:atIndex:", v11, v10);
LABEL_23:
        -[TISoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", v11);
        -[TISoftwareLayoutDetailControllerViewController setMultilingualSet:](self, "setMultilingualSet:", TIInputModeGetMultilingualSetFromInputModes());
      }
      else
      {
        -[TISoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
        v12 = (id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy");
        v13 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("sw"));
        if (v13 && (objc_msgSend(v13, "isEqualToString:", a3) & 1) != 0)
          return;
        objc_msgSend(v12, "setObject:forKey:", a3, CFSTR("sw"));
        IdentifierFromComponents = UIKeyboardInputModeGetIdentifierFromComponents();
        objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v7, IdentifierFromComponents);
        -[TISoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", IdentifierFromComponents);
      }
      +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", v5);
    }
  }
}

- (void)setShuangpinType:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5100]);
  TIUpdateShuangpinSWLayout();
  -[TISoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
}

- (void)setWubiStandard:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  objc_msgSend(v5, "setValue:forPreferenceKey:", v6, *MEMORY[0x24BEB5238]);
  -[TISoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
}

- (void)removeInputModeInMultilingualSet:(id)a3
{
  void *v4;
  void *NormalizedIdentifier;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = a3;
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  obj = TIUIGetPairedInputModesForInputMode(NormalizedIdentifier);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = -[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet");
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
              if (objc_msgSend((id)TIInputModeGetNormalizedIdentifier(), "isEqualToString:", v10))
                objc_msgSend(v4, "addObject:", v16);
              ++v15;
            }
            while (v13 != v15);
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v13);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }
  v17 = (void *)-[NSArray mutableCopy](-[TISoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet"), "mutableCopy");
  objc_msgSend(v17, "removeObject:", v19);
  objc_msgSend(v17, "removeObjectsInArray:", v4);
  -[TISoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", objc_msgSend(v17, "firstObject"));
  -[TISoftwareLayoutDetailControllerViewController setMultilingualSet:](self, "setMultilingualSet:", v17);
  v18 = (void *)objc_msgSend(+[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes"), "mutableCopy");
  objc_msgSend(v18, "removeObject:", v19);
  objc_msgSend(v18, "removeObjectsInArray:", v4);
  +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", v18);
  -[TISoftwareLayoutDetailControllerViewController reloadSpecifiers](self, "reloadSpecifiers");
  -[TISoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
  -[TISoftwareLayoutDetailControllerViewController updateTitle](self, "updateTitle");
}

- (void)reloadKeyboardSpecifiers
{
  void *v2;

  v2 = (void *)objc_msgSend((id)-[TISoftwareLayoutDetailControllerViewController parentController](self, "parentController"), "parentController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setNeedsReloadSpecifiers:", 1);
}

- (void)reloadSoftwareLayoutSpecifiersWithMultilingualSet:(id)a3
{
  -[TISoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", objc_msgSend(a3, "firstObject"));
  -[TISoftwareLayoutDetailControllerViewController setMultilingualSet:](self, "setMultilingualSet:", a3);
  -[TISoftwareLayoutDetailControllerViewController reloadSpecifiers](self, "reloadSpecifiers");
  -[TISoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  int64_t result;
  void *v7;

  result = 0;
  if (-[TISoftwareLayoutDetailControllerViewController showingLanguagesSection](self, "showingLanguagesSection", a3))
  {
    if (!objc_msgSend(a4, "section") && objc_msgSend(a4, "row") >= 1)
    {
      v7 = (void *)objc_msgSend(-[TISoftwareLayoutDetailControllerViewController specifiers](self, "specifiers"), "objectAtIndex:", objc_msgSend(a4, "row") + 1);
      if ((objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75DA0]), "isEqual:", CFSTR("language")) & 1) != 0)
        return 1;
    }
  }
  return result;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  uint64_t v8;

  if (a4 == 1
    && -[TISoftwareLayoutDetailControllerViewController showingLanguagesSection](self, "showingLanguagesSection", a3)
    && !objc_msgSend(a5, "section")
    && objc_msgSend(a5, "row") >= 1)
  {
    v7 = (void *)objc_msgSend(-[TISoftwareLayoutDetailControllerViewController specifiers](self, "specifiers"), "objectAtIndex:", objc_msgSend(a5, "row") + 1);
    if (objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75DA0]), "isEqual:", CFSTR("language")))
    {
      v8 = objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      -[TISoftwareLayoutDetailControllerViewController removeSpecifier:animated:](self, "removeSpecifier:animated:", v7, 1);
      -[TISoftwareLayoutDetailControllerViewController removeInputModeInMultilingualSet:](self, "removeInputModeInMultilingualSet:", v8);
    }
  }
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (void)setMultilingualSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1392);
}

- (BOOL)showingLanguagesSection
{
  return self->_showingLanguagesSection;
}

- (void)setShowingLanguagesSection:(BOOL)a3
{
  self->_showingLanguagesSection = a3;
}

@end
