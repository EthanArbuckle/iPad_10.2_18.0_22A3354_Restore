@implementation TIAddMultilingualLanguageListController

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIAddMultilingualLanguageListController;
  -[TIAddMultilingualLanguageListController viewDidLoad](&v4, sel_viewDidLoad);
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
  v7.super_class = (Class)TIAddMultilingualLanguageListController;
  -[TIAddMultilingualLanguageListController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DETAIL_ADD_LANGUAGE_TITLE"), &stru_24E732B90, CFSTR("Keyboard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAddMultilingualLanguageListController navigationItem](self, "navigationItem");
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
    v5 = -[TIAddMultilingualLanguageListController newSpecifiers](self, "newSpecifiers");
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
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledInputModeIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIGetAddableInputModesForMultilingualSet(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x24BE75AC0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        TIInputModeGetLanguageWithRegion();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 3, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forKey:", v12, v10);
        objc_msgSend(v15, "setButtonAction:", sel_addLanguage_);
        objc_msgSend(v3, "addObject:", v15);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_1);
  return v3;
}

uint64_t __56__TIAddMultilingualLanguageListController_newSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
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
    -[TIAddMultilingualLanguageListController parentController](self, "parentController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multilingualSet");
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
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = TIUICanAddInputModeToMultilingualSet(v4, v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enabledInputModeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    TIUIGetProposedMultilingualSetsForAddingInputMode(v4, v8);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v25;
      v23 = v8;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          TIUIProposedInputModeGetCurrent(v15, v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToArray:", v17);

          if (v18)
          {
            v8 = v23;
            TIUIGetInputModesByAddingProposedInputMode(v15, v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", v19);
            TIUIProposedInputModeGetMultilingualSet(v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIAddMultilingualLanguageListController setMultilingualSet:](self, "setMultilingualSet:", v20);

            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v8 = v23;
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

  }
  -[TIAddMultilingualLanguageListController reloadKeyboardSpecifiers](self, "reloadKeyboardSpecifiers");
  -[TIAddMultilingualLanguageListController navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "popViewControllerAnimated:", 1);

}

- (void)reloadKeyboardSpecifiers
{
  void *v3;
  id v4;

  -[TIAddMultilingualLanguageListController parentController](self, "parentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIAddMultilingualLanguageListController multilingualSet](self, "multilingualSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSoftwareLayoutSpecifiersWithMultilingualSet:", v3);

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
