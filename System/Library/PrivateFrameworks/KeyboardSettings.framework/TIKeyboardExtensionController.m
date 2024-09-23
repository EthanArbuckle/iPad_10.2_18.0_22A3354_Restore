@implementation TIKeyboardExtensionController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardExtensionController;
  -[TIKeyboardExtensionController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardExtensionController;
  -[TIKeyboardExtensionController dealloc](&v3, sel_dealloc);
}

- (id)isKeyboardEnabled:(id)a3
{
  id v4;

  v4 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes");
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "containsObject:", objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0])));
}

- (void)setKeyboardEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v6 = objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v7 = (id)objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  v8 = objc_msgSend(v7, "count");
  if (objc_msgSend(a3, "BOOLValue"))
  {
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
      objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(v7, "removeObject:", v6);
  }
  if (v8 != objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions");
    if (objc_msgSend(v7, "count"))
      v10 = v7;
    else
      v10 = 0;
    objc_msgSend(v9, "saveInputModes:", v10);
  }
  if (-[KSAddExtensionKeyboardController networkAccessSpecifier](-[TIKeyboardExtensionController addExtensionKeyboardController](self, "addExtensionKeyboardController"), "networkAccessSpecifier"))
  {
    v11 = (void *)objc_msgSend((id)-[TIKeyboardExtensionController specifier](self, "specifier"), "propertyForKey:", CFSTR("TIKBIdentifiersKey"));
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__TIKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke;
    v18[3] = &unk_251079B70;
    v18[4] = v7;
    v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v18);
    v14 = (int)*MEMORY[0x24BE756E0];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v14);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __62__TIKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke_2;
    v17[3] = &unk_251079B98;
    v17[4] = self;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v17);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL || v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL && v16 != 0x7FFFFFFFFFFFFFFFLL)
        -[TIKeyboardExtensionController removeSpecifier:animated:](self, "removeSpecifier:animated:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v14), "objectAtIndexedSubscript:", v16), 1);
    }
    else
    {
      -[TIKeyboardExtensionController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", -[KSAddExtensionKeyboardController networkAccessSpecifier](-[TIKeyboardExtensionController addExtensionKeyboardController](self, "addExtensionKeyboardController", 0x7FFFFFFFFFFFFFFFLL), "networkAccessSpecifier"), -[TIKeyboardExtensionController lastInputModeSpecifier](self, "lastInputModeSpecifier"), 1);
      -[KSAddExtensionKeyboardController updateNetworkPolicyState](-[TIKeyboardExtensionController addExtensionKeyboardController](self, "addExtensionKeyboardController"), "updateNetworkPolicyState");
    }
  }
}

uint64_t __62__TIKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(a2, "identifier"));
}

uint64_t __62__TIKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "addExtensionKeyboardController"), "networkAccessSpecifier"), "name"));
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  id obj;
  uint64_t v22;
  TIKeyboardExtensionController *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v24)
  {
    v20 = (int)*MEMORY[0x24BE756E0];
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TIKeyboardExtensionController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARDS_SHORT"), &stru_25107A038, CFSTR("Keyboard")));
    v24 = v3;
    v22 = objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    objc_msgSend(v3, "addObject:");
    v4 = (void *)objc_opt_class();
    v23 = self;
    v5 = (void *)-[TIKeyboardExtensionController specifier](self, "specifier");
    v6 = (void *)objc_msgSend(v4, "keyboardsForBundleID:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75870]));
    v7 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v26;
      v12 = *MEMORY[0x24BE75AC0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v14, "displayName"), v23, sel_setKeyboardEnabled_specifier_, sel_isKeyboardEnabled_, 0, 6, 0);
          objc_msgSend(v15, "setProperty:forKey:", objc_msgSend(v14, "identifier"), v12);
          objc_msgSend(v15, "setProperty:forKey:", v22, CFSTR("GroupHeader"));
          objc_msgSend(v24, "addObject:", v15);
          v10 |= objc_msgSend(v7, "containsObject:", objc_msgSend(v14, "identifier"));
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    -[TIKeyboardExtensionController setLastInputModeSpecifier:](v23, "setLastInputModeSpecifier:", objc_msgSend(v24, "lastObject"));
    v16 = (void *)objc_msgSend(obj, "firstObject");
    objc_msgSend((id)-[TIKeyboardExtensionController specifier](v23, "specifier"), "setProperty:forKey:", obj, CFSTR("TIKBIdentifiersKey"));
    objc_msgSend((id)-[TIKeyboardExtensionController specifier](v23, "specifier"), "setProperty:forKey:", obj, CFSTR("TIKBAllIdentifiersKey"));
    v17 = (void *)-[TIKeyboardExtensionController specifier](v23, "specifier");
    v18 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", objc_msgSend(v16, "identifier"));
    objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75D50]);
    -[TIKeyboardExtensionController setAddExtensionKeyboardController:](v23, "setAddExtensionKeyboardController:", objc_alloc_init(KSAddExtensionKeyboardController));
    -[KSAddExtensionKeyboardController setSpecifier:](-[TIKeyboardExtensionController addExtensionKeyboardController](v23, "addExtensionKeyboardController"), "setSpecifier:", -[TIKeyboardExtensionController specifier](v23, "specifier"));
    -[KSAddExtensionKeyboardController setNetworkAccessSpecifierForKeyboardInputMode:](-[TIKeyboardExtensionController addExtensionKeyboardController](v23, "addExtensionKeyboardController"), "setNetworkAccessSpecifierForKeyboardInputMode:", v16);
    if ((v10 & 1) != 0
      && -[KSAddExtensionKeyboardController networkAccessSpecifier](-[TIKeyboardExtensionController addExtensionKeyboardController](v23, "addExtensionKeyboardController"), "networkAccessSpecifier"))
    {
      objc_msgSend(v24, "addObject:", -[KSAddExtensionKeyboardController networkAccessSpecifier](-[TIKeyboardExtensionController addExtensionKeyboardController](v23, "addExtensionKeyboardController"), "networkAccessSpecifier"));
    }
    if (-[TIKeyboardExtensionController aboutPrivacyController](v23, "aboutPrivacyController"))
      -[KSAboutKeyboardPrivacyController setSpecifier:](-[TIKeyboardExtensionController aboutPrivacyController](v23, "aboutPrivacyController"), "setSpecifier:", v22);
    else
      -[TIKeyboardExtensionController setAboutPrivacyController:](v23, "setAboutPrivacyController:", -[KSAboutKeyboardPrivacyController initWithGroupSpecifier:asHeader:inListController:]([KSAboutKeyboardPrivacyController alloc], "initWithGroupSpecifier:asHeader:inListController:", v22, 0, v23));
    objc_msgSend(v24, "addObjectsFromArray:", +[KSAddExtensionKeyboardController specifiersForExtensionInputMode:parentSpecifier:](KSAddExtensionKeyboardController, "specifiersForExtensionInputMode:parentSpecifier:", objc_msgSend(obj, "firstObject"), -[TIKeyboardExtensionController specifier](v23, "specifier")));
    *(Class *)((char *)&v23->super.super.super.super.super.isa + v20) = (Class)v24;
  }
  return v24;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  -[KSAddExtensionKeyboardController updateNetworkPolicyState](-[TIKeyboardExtensionController addExtensionKeyboardController](self, "addExtensionKeyboardController", a3), "updateNetworkPolicyState");
  -[KSAboutKeyboardPrivacyController addPrivacyLinkViewIfNecessaryToHeaderView:forSection:](-[TIKeyboardExtensionController aboutPrivacyController](self, "aboutPrivacyController"), "addPrivacyLinkViewIfNecessaryToHeaderView:forSection:", a4, a5);
}

+ (id)keyboardsForBundleID:(id)a3
{
  void *v4;
  void *v5;
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
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController", 0), "extensionInputModes");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(v10, "containingBundle"), "bundleIdentifier")))objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (KSAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1376);
}

- (KSAddExtensionKeyboardController)addExtensionKeyboardController
{
  return self->_addExtensionKeyboardController;
}

- (void)setAddExtensionKeyboardController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (PSSpecifier)lastInputModeSpecifier
{
  return self->_lastInputModeSpecifier;
}

- (void)setLastInputModeSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1392);
}

@end
