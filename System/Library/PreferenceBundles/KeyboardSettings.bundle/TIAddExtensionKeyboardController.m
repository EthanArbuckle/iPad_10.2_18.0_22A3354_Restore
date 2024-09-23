@implementation TIAddExtensionKeyboardController

+ (id)specifiersForExtensionInputMode:(id)a3 parentSpecifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "isExtensionInputMode"))
    return (id)MEMORY[0x24BDBD1A8];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend(a3, "safe__extendedDisplayName")));
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "extension"), "_extensionBundle");
  if (v7)
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", objc_msgSend((id)objc_msgSend(v7, "bundleURL"), "URLByAppendingPathComponent:", CFSTR("Settings.bundle")));
  else
    v8 = 0;
  objc_msgSend(a4, "setProperty:forKey:", v8, *MEMORY[0x24BE75878]);
  v9 = *MEMORY[0x24BE75870];
  if (!objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75870]))
    objc_msgSend(a4, "setProperty:forKey:", objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75AC0]), v9);
  v10 = objc_msgSend(v8, "pathForResource:ofType:", CFSTR("Root"), CFSTR("plist"));
  if (!v10)
    return (id)MEMORY[0x24BDBD1A8];
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v10);
  v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE75CE0]), "stringByDeletingPathExtension");
  v13 = (void *)objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE75CC8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v15 = (void *)MEMORY[0x24BDBD1A8];
  if (v14)
  {
    v16 = v14;
    v17 = 0;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v13);
        v20 = objc_msgSend(MEMORY[0x24BE75468], "specifiersFromDictionary:stringsTable:parentSpecifier:target:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v12, a4, 0);
        if (v20)
        {
          objc_msgSend(v6, "addObjectsFromArray:", v20);
          v17 = 1;
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
    if ((v17 & 1) != 0)
      return v6;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TIAddExtensionKeyboardController;
  -[TIAddExtensionKeyboardController dealloc](&v3, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[TIAddExtensionKeyboardController newSpecifiers](self, "newSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (void)setNetworkAccessSpecifierForKeyboardInputMode:(id)a3
{
  void *v5;
  _QWORD v6[5];

  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "extension"), "attributes"), "objectForKey:", CFSTR("RequestsOpenAccess")), "BOOLValue"))
  {
    -[PSAppListController setSystemPolicy:](self, "setSystemPolicy:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BE755E0]), "initWithBundleIdentifier:", objc_msgSend((id)objc_msgSend(a3, "containingBundle"), "bundleIdentifier")));
    v5 = (void *)-[PSSystemPolicyForApp specifiersForPolicyOptions:force:](-[PSAppListController systemPolicy](self, "systemPolicy"), "specifiersForPolicyOptions:force:", 0x20000, 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__TIAddExtensionKeyboardController_setNetworkAccessSpecifierForKeyboardInputMode___block_invoke;
    v6[3] = &unk_24E732A48;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  }
}

uint64_t __82__TIAddExtensionKeyboardController_setNetworkAccessSpecifierForKeyboardInputMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "target");
  if (result)
  {
    objc_msgSend(a2, "setTarget:", *(_QWORD *)(a1 + 32));
    result = objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessSpecifier:", a2);
    *a4 = 1;
  }
  return result;
}

- (id)newSpecifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v15;
  id obj;
  TIAddExtensionKeyboardController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = self;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", CFSTR("TIKBIdentifiersKey"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    LOBYTE(v6) = 0;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x24BE75AC0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v10, "displayName"), v17, sel_toggleInputMode_specifier_, sel_fetchInputModeEnabled_, 0, 6, 0);
        objc_msgSend(v11, "setProperty:forKey:", objc_msgSend(v10, "identifier"), v8);
        objc_msgSend(v3, "addObject:", v11);
        if ((v6 & 1) != 0)
          v6 = 1;
        else
          v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "extension"), "attributes"), "objectForKey:", CFSTR("RequestsOpenAccess")), "BOOLValue");
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  -[TIAddExtensionKeyboardController setModuleSpecifiers:](v17, "setModuleSpecifiers:", objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_9));
  v12 = -[NSArray count](-[TIAddExtensionKeyboardController moduleSpecifiers](v17, "moduleSpecifiers"), "count");
  v17->_didRequestOpenAccess = v6;
  if (!objc_msgSend(obj, "count")
    || -[TIAddExtensionKeyboardController behavesAsModalForAddSheet](v17, "behavesAsModalForAddSheet")
    || ((v6 ^ 1) & 1) != 0)
  {
    v13 = v15;
    if (v12 >= 2)
      goto LABEL_19;
  }
  else
  {
    -[TIAddExtensionKeyboardController setNetworkAccessSpecifierForKeyboardInputMode:](v17, "setNetworkAccessSpecifierForKeyboardInputMode:", objc_msgSend(obj, "firstObject"));
    v13 = v15;
    objc_msgSend(v15, "addObject:", -[TIAddExtensionKeyboardController networkAccessSpecifier](v17, "networkAccessSpecifier"));
    if (v12 >= 2)
    {
      objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", &stru_24E732B90));
LABEL_19:
      objc_msgSend(v13, "addObjectsFromArray:", -[TIAddExtensionKeyboardController moduleSpecifiers](v17, "moduleSpecifiers"));
    }
  }
  -[TIAddExtensionKeyboardController trackExtensionsContainedInApp](v17, "trackExtensionsContainedInApp");
  return v13;
}

uint64_t __49__TIAddExtensionKeyboardController_newSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "localizedStandardCompare:", objc_msgSend(a3, "name"));
}

- (void)trackExtensionsContainedInApp
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (TIStatisticShouldSample())
  {
    v3 = (void *)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", CFSTR("TIKBAllIdentifiersKey"));
    TIStatisticGetKey();
    objc_msgSend(v3, "count");
    TIStatisticScalarSetValue();
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v3);
          if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "specifiersForExtensionInputMode:parentSpecifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), -[TIAddExtensionKeyboardController specifier](self, "specifier")), "count"))
          {
            ++v6;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    TIStatisticGetKey();
    TIStatisticScalarSetValue();
  }
}

- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4
{
  int v7;
  int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  TIAddExtensionKeyboardController *v18;
  uint64_t v19;
  uint64_t v20;
  PSSystemPolicyForApp *v21;
  uint64_t v22;
  _QWORD v23[5];

  if (!objc_msgSend((id)-[PSSpecifier name](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "name"), "isEqualToString:", objc_msgSend(a4, "name")))
  {
    v19 = *MEMORY[0x24BE75D18];
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75D18]), "setValue:", a3);
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v19), "reloadWithSpecifier:animated:", a4, 1);
LABEL_12:
    v21 = -[PSAppListController systemPolicy](self, "systemPolicy");
    -[PSSystemPolicyForApp performSelector:withObject:withObject:](v21, "performSelector:withObject:withObject:", *(_QWORD *)((char *)a4 + (int)*MEMORY[0x24BE75760]), a3, a4);
    return;
  }
  v7 = objc_msgSend((id)-[PSSpecifier identifier](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier"));
  v8 = v7;
  v9 = self->_hasShownWarning || v7 == 0;
  if (v9 || !objc_msgSend(a3, "BOOLValue"))
  {
    v20 = *MEMORY[0x24BE75D18];
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75D18]), "setValue:", a3);
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v20), "reloadWithSpecifier:animated:", a4, 1);
    if (v8)
    {
      -[TIAddExtensionKeyboardController setNetworkPolicyValue:](self, "setNetworkPolicyValue:", a3);
      self->_didGrantOpenAccess = objc_msgSend(a3, "BOOLValue");
      return;
    }
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke;
  v23[3] = &unk_24E732780;
  v23[4] = self;
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_THIRD_PARTY_KEYBOARD_WARNING_TITLE"), &stru_24E732B90, CFSTR("Keyboard"));
  v12 = (void *)-[TIAddExtensionKeyboardController specifier](self, "specifier");
  v13 = objc_msgSend(v10, "stringWithFormat:", v11, objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE75D50]), v23[0], 3221225472, __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke, &unk_24E732780, self);
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_THIRD_PARTY_KEYBOARD_WARNING_MESSAGE"), &stru_24E732B90, CFSTR("Keyboard"));
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_THIRD_PARTY_KEYBOARD_WARNING_CANCEL"), &stru_24E732B90, CFSTR("Keyboard"));
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_THIRD_PARTY_KEYBOARD_WARNING_ACTION"), &stru_24E732B90, CFSTR("Keyboard"));
  -[TIAddExtensionKeyboardController setNetworkAccessAlertController:](self, "setNetworkAccessAlertController:", objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1));
  -[TIAddExtensionKeyboardController setNetworkAccessAlertActionDefault:](self, "setNetworkAccessAlertActionDefault:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v16, 0, v23));
  -[TIAddExtensionKeyboardController setNetworkAccessAlertActionCancel:](self, "setNetworkAccessAlertActionCancel:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v15, 1, v23));
  -[UIAlertController addAction:](-[TIAddExtensionKeyboardController networkAccessAlertController](self, "networkAccessAlertController"), "addAction:", -[TIAddExtensionKeyboardController networkAccessAlertActionDefault](self, "networkAccessAlertActionDefault"));
  -[UIAlertController addAction:](-[TIAddExtensionKeyboardController networkAccessAlertController](self, "networkAccessAlertController"), "addAction:", -[TIAddExtensionKeyboardController networkAccessAlertActionCancel](self, "networkAccessAlertActionCancel"));
  -[TIAddExtensionKeyboardController setSpecifierForWarning:](self, "setSpecifierForWarning:", a4);
  v17 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_didEnterBackground_, *MEMORY[0x24BDF75D8], 0);
  if (objc_msgSend((id)-[TIAddExtensionKeyboardController view](self, "view"), "window"))
    v18 = self;
  else
    v18 = (TIAddExtensionKeyboardController *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow"), "rootViewController");
  v22 = -[TIAddExtensionKeyboardController view](v18, "view");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "_viewControllerForFullScreenPresentationFromView:", v22), "presentViewController:animated:completion:", -[TIAddExtensionKeyboardController networkAccessAlertController](self, "networkAccessAlertController"), 1, 0);
}

uint64_t __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "specifierForWarning");
  if (result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDF75D8], 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1400) = objc_msgSend(*(id *)(a1 + 32), "networkAccessAlertActionDefault") == a2;
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyAccess:forSpecifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:"), objc_msgSend(*(id *)(a1 + 32), "specifierForWarning"));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "networkAccessAlertController"), "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "setSpecifierForWarning:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessAlertController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessAlertActionCancel:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessAlertActionDefault:", 0);
  }
  return result;
}

- (void)didEnterBackground:(id)a3
{
  void *v4;
  PSSpecifier *v5;

  if (-[TIAddExtensionKeyboardController specifierForWarning](self, "specifierForWarning", a3))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);
    -[UIAlertController dismissViewControllerAnimated:completion:](-[TIAddExtensionKeyboardController networkAccessAlertController](self, "networkAccessAlertController"), "dismissViewControllerAnimated:completion:", 0, 0);
    -[TIAddExtensionKeyboardController setSpecifierForWarning:](self, "setSpecifierForWarning:", 0);
    -[TIAddExtensionKeyboardController setNetworkAccessAlertController:](self, "setNetworkAccessAlertController:", 0);
    -[TIAddExtensionKeyboardController setNetworkAccessAlertActionCancel:](self, "setNetworkAccessAlertActionCancel:", 0);
    -[TIAddExtensionKeyboardController setNetworkAccessAlertActionDefault:](self, "setNetworkAccessAlertActionDefault:", 0);
  }
  v5 = -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier");
  objc_msgSend((id)-[PSSpecifier propertyForKey:](v5, "propertyForKey:", *MEMORY[0x24BE75D18]), "reloadWithSpecifier:animated:", -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), 1);
}

- (void)updateNetworkPolicyStateIfNecessaryForCell:(id)a3
{
  PSSpecifier *v5;

  v5 = -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier");
  if ((id)-[PSSpecifier propertyForKey:](v5, "propertyForKey:", *MEMORY[0x24BE75D18]) == a3)
    -[TIAddExtensionKeyboardController updateNetworkPolicyState](self, "updateNetworkPolicyState");
}

- (void)updateNetworkPolicyState
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t i;
  void *v12;
  PSSpecifier *v13;
  uint64_t v14;
  void *v15;
  CFBundleRef cf;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[TIAddExtensionKeyboardController behavesAsModalForAddSheet](self, "behavesAsModalForAddSheet"))
  {
    LOBYTE(v3) = 0;
    goto LABEL_16;
  }
  cf = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", CFSTR("TIKBAllIdentifiersKey")), "firstObject"), "containingBundle"), "bundleURL"));
  v4 = (void *)TCCAccessCopyInformationForBundle();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v3 = 0;
    v7 = *(_QWORD *)v18;
    v8 = (_QWORD *)MEMORY[0x24BEB3828];
    v9 = (_QWORD *)MEMORY[0x24BEB38A8];
    v10 = (_QWORD *)MEMORY[0x24BEB3818];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *v8), "isEqualToString:", *v9))
          v3 |= objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *v10), "BOOLValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
    if (!v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  LOBYTE(v3) = 0;
  if (v4)
LABEL_13:
    CFRelease(v4);
LABEL_14:
  if (cf)
    CFRelease(cf);
LABEL_16:
  v13 = -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier");
  v14 = *MEMORY[0x24BE75D18];
  v15 = (void *)-[PSSpecifier propertyForKey:](v13, "propertyForKey:", *MEMORY[0x24BE75D18]);
  objc_msgSend(v15, "setValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 & 1));
  objc_msgSend((id)-[PSSpecifier propertyForKey:](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "propertyForKey:", v14), "reloadWithSpecifier:animated:", -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), 1);
}

- (void)setNetworkPolicyValue:(id)a3
{
  void *v4;
  CFBundleRef v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  id v12;
  CFBundleRef v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", CFSTR("TIKBAllIdentifiersKey"));
  v5 = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "firstObject"), "containingBundle"), "bundleURL"));
  objc_msgSend(a3, "BOOLValue");
  TCCAccessSetForBundle();
  CFRelease(v5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = (void *)MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "extension"), "attributes"), "objectForKey:", CFSTR("RequestsOpenAccess")), "BOOLValue"))v12 = a3;
        else
          v12 = v9;
        v13 = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "extension"), "_extensionBundle"), "bundleURL"));
        objc_msgSend(v12, "BOOLValue");
        TCCAccessSetForBundle();
        CFRelease(v13);
        objc_msgSend((id)objc_msgSend(v11, "extension"), "_kill:", 3);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
}

- (id)fetchInputModeEnabled:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]), "controlValue");
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[TIAddExtensionKeyboardController updateNetworkPolicyStateIfNecessaryForCell:](self, "updateNetworkPolicyStateIfNecessaryForCell:", a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIAddExtensionKeyboardController;
  -[PSAppListController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (-[TIAddExtensionKeyboardController behavesAsModalForAddSheet](self, "behavesAsModalForAddSheet"))
  {
    v4 = (void *)-[TIAddExtensionKeyboardController navigationItem](self, "navigationItem");
    v5 = (void *)-[TIAddExtensionKeyboardController specifier](self, "specifier");
    objc_msgSend(v4, "setTitle:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D50]));
    objc_msgSend(v4, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped));
    objc_msgSend((id)objc_msgSend(v4, "rightBarButtonItem"), "setEnabled:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIAddExtensionKeyboardController;
  -[TIAddExtensionKeyboardController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TIAddExtensionKeyboardController updateDoneButton](self, "updateDoneButton");
}

- (id)selectedInputModes
{
  void *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (-[NSArray count](-[TIAddExtensionKeyboardController moduleSpecifiers](self, "moduleSpecifiers"), "count") > 1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = -[TIAddExtensionKeyboardController moduleSpecifiers](self, "moduleSpecifiers", 0);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = *MEMORY[0x24BE75D18];
      v10 = *MEMORY[0x24BE75AC0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyForKey:", v9), "controlValue"), "BOOLValue"))objc_msgSend(v3, "addObject:", objc_msgSend(v12, "propertyForKey:", v10));
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
  }
  else
  {
    v4 = -[NSArray firstObject](-[TIAddExtensionKeyboardController moduleSpecifiers](self, "moduleSpecifiers"), "firstObject");
    objc_msgSend(v3, "addObject:", objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]));
  }
  return v3;
}

- (void)addCheckedInputModes
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v4 = -[TIAddExtensionKeyboardController selectedInputModes](self, "selectedInputModes");
  if (objc_msgSend(v4, "count"))
  {
    +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));
    if (TIStatisticShouldSample())
    {
      if (self->_didRequestOpenAccess)
      {
        TIStatisticGetKey();
        TIStatisticScalarIncrement();
        if (self->_didGrantOpenAccess)
        {
          TIStatisticGetKey();
          TIStatisticScalarIncrement();
        }
      }
    }
  }
}

- (void)updateDoneButton
{
  if (-[TIAddExtensionKeyboardController behavesAsModalForAddSheet](self, "behavesAsModalForAddSheet"))
    objc_msgSend((id)objc_msgSend((id)-[TIAddExtensionKeyboardController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", objc_msgSend(-[TIAddExtensionKeyboardController selectedInputModes](self, "selectedInputModes"), "count") != 0);
}

- (void)cancelButtonTapped
{
  objc_msgSend((id)-[TIAddExtensionKeyboardController parentController](self, "parentController"), "dismiss");
}

- (void)doneButtonTapped
{
  -[TIAddExtensionKeyboardController addCheckedInputModes](self, "addCheckedInputModes");
  objc_msgSend((id)-[TIAddExtensionKeyboardController parentController](self, "parentController"), "dismissForDone");
}

- (BOOL)behavesAsModalForAddSheet
{
  return self->_behavesAsModalForAddSheet;
}

- (void)setBehavesAsModalForAddSheet:(BOOL)a3
{
  self->_behavesAsModalForAddSheet = a3;
}

- (PSSpecifier)networkAccessSpecifier
{
  return self->_networkAccessSpecifier;
}

- (void)setNetworkAccessSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1408);
}

- (NSArray)moduleSpecifiers
{
  return self->_moduleSpecifiers;
}

- (void)setModuleSpecifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1416);
}

- (PSSpecifier)specifierForWarning
{
  return self->_specifierForWarning;
}

- (void)setSpecifierForWarning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1424);
}

- (UIAlertController)networkAccessAlertController
{
  return self->_networkAccessAlertController;
}

- (void)setNetworkAccessAlertController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1432);
}

- (UIAlertAction)networkAccessAlertActionDefault
{
  return self->_networkAccessAlertActionDefault;
}

- (void)setNetworkAccessAlertActionDefault:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1440);
}

- (UIAlertAction)networkAccessAlertActionCancel
{
  return self->_networkAccessAlertActionCancel;
}

- (void)setNetworkAccessAlertActionCancel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1448);
}

@end
