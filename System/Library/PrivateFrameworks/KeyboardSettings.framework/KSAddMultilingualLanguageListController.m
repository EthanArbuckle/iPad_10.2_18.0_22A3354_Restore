@implementation KSAddMultilingualLanguageListController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSAddMultilingualLanguageListController;
  -[KSAddMultilingualLanguageListController viewDidLoad](&v4, sel_viewDidLoad);
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
  v7.super_class = (Class)KSAddMultilingualLanguageListController;
  -[KSAddMultilingualLanguageListController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_ADD_LANGUAGE_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KSAddMultilingualLanguageListController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = -[KSAddMultilingualLanguageListController newSpecifiers](self, "newSpecifiers");
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)newSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KSAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIGetAddableInputModesForMultilingualSet(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x24BE75AC0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        TIInputModeGetLanguageWithRegion();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 3, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setProperty:forKey:", v11, v9);
        objc_msgSend(v14, "setButtonAction:", sel_addLanguage_);
        objc_msgSend(v3, "addObject:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSArray)multilingualSet
{
  NSArray *multilingualSet;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  multilingualSet = self->_multilingualSet;
  if (!multilingualSet)
  {
    -[KSAddMultilingualLanguageListController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_multilingualSet;
    self->_multilingualSet = v5;

    multilingualSet = self->_multilingualSet;
  }
  return multilingualSet;
}

- (void)addLanguage:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[KSAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = TIUICanAddInputModeToMultilingualSet(v13, v4);

  if (v5)
  {
    -[KSAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIUIGetProposedMultilingualSetByAddingInputMode(v13, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enabledInputModeIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      TIUIGetInputModesByAddingProposedInputMode(v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v10);

    }
  }
  -[KSAddMultilingualLanguageListController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
  -[KSAddMultilingualLanguageListController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

}

- (void)reloadKeyboardSpecifiers
{
  id v2;

  -[KSAddMultilingualLanguageListController parentController](self, "parentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSoftwareLayoutSpecifiers");

}

- (void)setMultilingualSet:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilingualSet, 0);
}

@end
