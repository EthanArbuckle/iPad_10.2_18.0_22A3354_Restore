@implementation KSSoftwareLayoutDetailControllerViewController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  -[KSSoftwareLayoutDetailControllerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  -[KSSoftwareLayoutDetailControllerViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  -[KSSoftwareLayoutDetailControllerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v4 = (void *)-[KSSoftwareLayoutDetailControllerViewController specifier](self, "specifier");
  v5 = (void *)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  if (v5)
    objc_msgSend((id)-[KSSoftwareLayoutDetailControllerViewController navigationItem](self, "navigationItem"), "setTitle:", objc_msgSend((id)objc_msgSend(v5, "titleLabel"), "text"));
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[KSSoftwareLayoutDetailControllerViewController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)newSpecifiers
{
  void *NormalizedIdentifier;
  NSArray *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  id obj;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
  if (KSInputModeIsChineseShuangpin())
    return -[KSSoftwareLayoutDetailControllerViewController newSpecifiersForChineseShuangpin](self, "newSpecifiersForChineseShuangpin");
  if (KSInputModeIsChineseWubi())
    return -[KSSoftwareLayoutDetailControllerViewController newSpecifiersForChineseWubi](self, "newSpecifiersForChineseWubi");
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  v43 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
  v4 = -[KSSoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet");
  if (_os_feature_enabled_impl())
    v5 = -[NSArray count](v4, "count") > 1;
  else
    v5 = 0;
  TIInputModeGetNormalizedIdentifier();
  obj = (id)objc_msgSend((id)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode(), "mutableCopy");
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(obj, "count") + 1);
  if (v5)
  {
    v6 = TIUICanAddToMultilingualSet(v4);
    v7 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_LANGUAGES_TITLE"), &stru_25107A038, CFSTR("Keyboard")));
    v38 = v6;
    if (-[NSArray count](v4, "count") != 2)
      v6 = 1;
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (v6)
      v9 = CFSTR("MULTILINGUAL_DETAIL_FOOTER_3");
    else
      v9 = CFSTR("MULTILINGUAL_DETAIL_FOOTER_2");
    v10 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_25107A038, CFSTR("Keyboard"));
    objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);
    objc_msgSend(v42, "addObject:", v7);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v53;
      v14 = *MEMORY[0x24BE75AC0];
      v15 = *MEMORY[0x24BE75DA0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v4);
          v17 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((TIUIInputModeIsMultilingualOnly() & 1) == 0)
          {
            v18 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion()), 0, 0, 0, 0, 3, 0);
            objc_msgSend(v18, "setProperty:forKey:", v17, v14);
            objc_msgSend(v18, "setProperty:forKey:", CFSTR("language"), v15);
            objc_msgSend(v42, "addObject:", v18);
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v12);
    }
    if (v38)
    {
      v19 = (void *)MEMORY[0x24BE75590];
      v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_ADD_LANGUAGE"), &stru_25107A038, CFSTR("Keyboard"));
      v21 = (void *)objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, objc_opt_class(), 2, 0);
      objc_msgSend(v21, "setProperty:forKey:", v4, *MEMORY[0x24BE75DA0]);
      objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v42, "addObject:", v21);
    }
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        if (objc_msgSend(NormalizedIdentifier, "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
        {
          v27 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw"));
          if ((objc_msgSend(v27, "isEqualToString:", v43) & 1) == 0)
            objc_msgSend(obj, "removeObject:", v27);
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v24);
  }
  if (v5)
    v28 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", 0, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_LAYOUTS_TITLE"), &stru_25107A038, CFSTR("Keyboard")));
  else
    v28 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", 0);
  v29 = v28;
  objc_msgSend(v28, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v39 = v29;
  objc_msgSend(v42, "addObject:", v29);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    v33 = *MEMORY[0x24BE75AC0];
    v34 = *MEMORY[0x24BE75C20];
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        if (!objc_msgSend(v36, "isEqualToString:", CFSTR("Korean-With-QWERTY"))
          || _os_feature_enabled_impl())
        {
          v37 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v36, &stru_25107A038, CFSTR("KeyboardLayouts")), self, 0, 0, 0, 3, 0);
          objc_msgSend(v37, "setProperty:forKey:", v36, v33);
          if (objc_msgSend(v43, "isEqualToString:", v36))
            objc_msgSend(v39, "setProperty:forKey:", v37, v34);
          objc_msgSend(v42, "addObject:", v37);
        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v31);
  }
  return v42;
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
  v3 = KSGetShuangpinTypes();
  v4 = KSGetCurrentShuangpinType();
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
        v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", KSGetShuangpinNameFromType(v13), self, 0, 0, 0, 3, 0);
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
  v3 = KSGetWubiStandards();
  v4 = KSGetCurrentWubiStandard();
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
        v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", KSGetWubiStandardName(v13), self, 0, 0, 0, 3, 0);
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
  v16.super_class = (Class)KSSoftwareLayoutDetailControllerViewController;
  -[KSSoftwareLayoutDetailControllerViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_);
  v7 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (v7)
  {
    v8 = (void *)v7;
    -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
    if (KSInputModeIsChineseShuangpin())
    {
      v9 = (void *)objc_msgSend(v8, "specifier");
      v10 = (void *)objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      if (v11)
        -[KSSoftwareLayoutDetailControllerViewController setShuangpinType:](self, "setShuangpinType:", v11);
    }
    else
    {
      -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
      IsChineseWubi = KSInputModeIsChineseWubi();
      v13 = (void *)objc_msgSend(v8, "specifier");
      v14 = (void *)objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75AC0]);
      v15 = v14;
      if (IsChineseWubi)
      {
        if (v14)
          -[KSSoftwareLayoutDetailControllerViewController setWubiStandard:](self, "setWubiStandard:", objc_msgSend(v14, "integerValue"));
      }
      else if (objc_msgSend(v14, "length"))
      {
        -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:](self, "setSoftwareLayout:", v15);
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
    v4 = (void *)-[KSSoftwareLayoutDetailControllerViewController specifier](self, "specifier");
    result = (NSString *)objc_msgSend((id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]), "copy");
    self->_inputMode = result;
  }
  return result;
}

- (NSArray)multilingualSet
{
  NSArray *result;
  void *v4;

  result = self->_multilingualSet;
  if (!result)
  {
    v4 = (void *)-[KSSoftwareLayoutDetailControllerViewController specifier](self, "specifier");
    result = (NSArray *)(id)objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    self->_multilingualSet = result;
  }
  return result;
}

- (void)setSoftwareLayout:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t IdentifierFromComponents;

  v5 = (id)objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  if (!objc_msgSend(v5, "count"))
    -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:].cold.1();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "indexOfObject:", -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:].cold.2();
    v7 = v6;
    -[KSSoftwareLayoutDetailControllerViewController inputMode](self, "inputMode");
    v8 = (id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy");
    v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("sw"));
    if (!v9 || (objc_msgSend(v9, "isEqualToString:", a3) & 1) == 0)
    {
      objc_msgSend(v8, "setObject:forKey:", a3, CFSTR("sw"));
      IdentifierFromComponents = UIKeyboardInputModeGetIdentifierFromComponents();
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v7, IdentifierFromComponents);
      -[KSSoftwareLayoutDetailControllerViewController setInputMode:](self, "setInputMode:", IdentifierFromComponents);
      +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v5);
    }
  }
}

- (void)setShuangpinType:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5100]);
  KSUpdateShuangpinSWLayout();
  -[KSSoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
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
  -[KSSoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
}

- (void)reloadKeyboardSpecifiers
{
  void *v2;

  v2 = (void *)objc_msgSend((id)-[KSSoftwareLayoutDetailControllerViewController parentController](self, "parentController"), "parentController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setNeedsReloadSpecifiers:", 1);
}

- (void)reloadSoftwareLayoutSpecifiers
{
  -[KSSoftwareLayoutDetailControllerViewController setMultilingualSet:](self, "setMultilingualSet:", TIUIInputModeGetMultilingualSet((uint64_t)-[NSArray firstObject](-[KSSoftwareLayoutDetailControllerViewController multilingualSet](self, "multilingualSet"), "firstObject")));
  -[KSSoftwareLayoutDetailControllerViewController reloadSpecifiers](self, "reloadSpecifiers");
  -[KSSoftwareLayoutDetailControllerViewController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (void)setMultilingualSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (void)setSoftwareLayout:.cold.1()
{
  __assert_rtn("-[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]", "KSSoftwareLayoutDetailControllerViewController.m", 275, "newInputModes.count > 0");
}

- (void)setSoftwareLayout:.cold.2()
{
  __assert_rtn("-[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:]", "KSSoftwareLayoutDetailControllerViewController.m", 279, "indexOfInputMode != NSNotFound");
}

@end
