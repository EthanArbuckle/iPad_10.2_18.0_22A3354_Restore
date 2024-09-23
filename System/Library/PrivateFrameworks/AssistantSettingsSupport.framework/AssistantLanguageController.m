@implementation AssistantLanguageController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantLanguageBundle;
  if (!bundle_sAssistantLanguageBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantLanguageBundle;
    bundle_sAssistantLanguageBundle = v3;

    v2 = (void *)bundle_sAssistantLanguageBundle;
  }
  return v2;
}

- (AssistantLanguageController)init
{
  AssistantLanguageController *v2;
  uint64_t v3;
  NSMutableDictionary *multilingualLanguageSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssistantLanguageController;
  v2 = -[AssistantDetailListController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    multilingualLanguageSettings = v2->_multilingualLanguageSettings;
    v2->_multilingualLanguageSettings = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *v5;
  NSDate *startDate;
  void *v7;
  objc_super v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v5;

  v8.receiver = self;
  v8.super_class = (Class)AssistantLanguageController;
  -[AssistantDetailListController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_languageCodeDidChange_, *MEMORY[0x24BE08DF0], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AssistantLanguageController;
  -[AssistantDetailListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    -[AssistantLanguageController updateSelectionToCurrentAssistantLanguageAndScrollToVisible:](self, "updateSelectionToCurrentAssistantLanguageAndScrollToVisible:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  PSSpecifier *checkedSpecifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  if (!self->_punchingOutToDetail)
  {
    checkedSpecifier = self->super._checkedSpecifier;
    if (checkedSpecifier)
    {
      -[PSSpecifier values](checkedSpecifier, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[AssistantLanguageController parentController](self, "parentController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_multilingualLanguageSettings, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSelectedLanguageWantsMultilingualEnabled:", objc_msgSend(v9, "BOOLValue"));

      -[AssistantLanguageController specifier](self, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSetterWithValue:", v7);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AssistantLanguageController;
  -[AssistantLanguageController viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSDate *startDate;
  NSDate *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  startDate = self->_startDate;
  if (!startDate)
    startDate = (NSDate *)v5;
  v8 = startDate;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v9 = (void *)getCKKnowledgeStoreClass_softClass;
  v28 = getCKKnowledgeStoreClass_softClass;
  if (!getCKKnowledgeStoreClass_softClass)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __getCKKnowledgeStoreClass_block_invoke;
    v23 = &unk_24D33CD10;
    v24 = &v25;
    __getCKKnowledgeStoreClass_block_invoke((uint64_t)&v20);
    v9 = (void *)v26[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v25, 8);
  objc_msgSend(v10, "defaultSynchedKnowledgeStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v12 = (void *)getCKPermanentEventStoreClass_softClass;
  v28 = getCKPermanentEventStoreClass_softClass;
  if (!getCKPermanentEventStoreClass_softClass)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __getCKPermanentEventStoreClass_block_invoke;
    v23 = &unk_24D33CD10;
    v24 = &v25;
    __getCKPermanentEventStoreClass_block_invoke((uint64_t)&v20);
    v12 = (void *)v26[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v25, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithKnowledgeStore:", v11);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v15 = (void *)getCKEventClass_softClass;
  v28 = getCKEventClass_softClass;
  if (!getCKEventClass_softClass)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __getCKEventClass_block_invoke;
    v23 = &unk_24D33CD10;
    v24 = &v25;
    __getCKEventClass_block_invoke((uint64_t)&v20);
    v15 = (void *)v26[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v25, 8);
  v17 = (void *)objc_msgSend([v16 alloc], "initWithIdentifier:startDate:endDate:metadata:", CFSTR("SiriLanguageSettingsShown"), v8, v6, 0);
  objc_msgSend(v14, "recordEvent:completionHandler:", v17, &__block_literal_global_4);
  v19.receiver = self;
  v19.super_class = (Class)AssistantLanguageController;
  -[AssistantLanguageController viewDidDisappear:](&v19, sel_viewDidDisappear_, v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObserver:name:object:", self, *MEMORY[0x24BE08DF0], 0);

  self->_punchingOutToDetail = 0;
}

void __48__AssistantLanguageController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Unable to record language settings activity: %@"), a2);
}

- (void)setParentController:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *multilingualResponseLanguageVariants;
  objc_super v7;

  v4 = a3;
  if (self->super._supportsMultilingualResponses && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "multilingualResponseLanguageVariants");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    multilingualResponseLanguageVariants = self->_multilingualResponseLanguageVariants;
    self->_multilingualResponseLanguageVariants = v5;

  }
  v7.receiver = self;
  v7.super_class = (Class)AssistantLanguageController;
  -[AssistantLanguageController setParentController:](&v7, sel_setParentController_, v4);

}

- (id)specifiers
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    -[AssistantLanguageController _itemsFromParent](self, "_itemsFromParent");
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v4;

  }
  if (self->super._supportsMultilingualResponses
    && -[NSArray count](self->_multilingualResponseLanguageVariants, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_multilingualResponseLanguageVariants;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = *MEMORY[0x24BE759F8];
      v11 = *MEMORY[0x24BE75A18];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "specifierForID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setCellType:", 2);
            objc_msgSend(v14, "setDetailControllerClass:", objc_opt_class());
            objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), v10);
            objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v11);
            -[AssistantLanguageController updateDetailedTextLabelForSpecifier:](self, "updateDetailedTextLabelForSpecifier:", v14);
          }

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  -[AssistantLanguageController updateSelectionToCurrentAssistantLanguageAndScrollToVisible:](self, "updateSelectionToCurrentAssistantLanguageAndScrollToVisible:", 0, (_QWORD)v16);
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + v3);
}

- (void)reloadSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (self->super._supportsMultilingualResponses)
    -[AssistantLanguageController updateDetailedTextLabelForSpecifier:](self, "updateDetailedTextLabelForSpecifier:", v4);
  v5.receiver = self;
  v5.super_class = (Class)AssistantLanguageController;
  -[AssistantLanguageController reloadSpecifier:](&v5, sel_reloadSpecifier_, v4);

}

- (void)languageCodeDidChange:(id)a3
{
  -[AssistantLanguageController reloadSpecifiers](self, "reloadSpecifiers", a3);
  -[AssistantLanguageController _signalDidSelectVoice](self, "_signalDidSelectVoice");
}

- (void)_signalDidSelectVoice
{
  void (**v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __52__AssistantLanguageController__signalDidSelectVoice__block_invoke;
  v6 = &unk_24D33CBB8;
  objc_copyWeak(&v7, &location);
  v2 = (void (**)(_QWORD))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v3, v4, v5, v6))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__AssistantLanguageController__signalDidSelectVoice__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  AssistantSettingsSignalEmitter *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)WeakRetained[179];
    if (!v2)
    {
      v3 = objc_alloc_init(AssistantSettingsSignalEmitter);
      v4 = (void *)v5[179];
      v5[179] = v3;

      v2 = (void *)v5[179];
    }
    objc_msgSend(v2, "emitDidSelectVoiceSignal");
    WeakRetained = v5;
  }

}

- (id)_itemsFromParent
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *groupSpecifier;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;

  v3 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "values");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v23, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LIST_ITEMS_GROUP_SPECIFIER"));
  v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  groupSpecifier = self->super._groupSpecifier;
  self->super._groupSpecifier = v6;

  v22 = v5;
  objc_msgSend(v5, "addObject:", self->super._groupSpecifier);
  -[PSSpecifier setProperty:forKey:](self->super._groupSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v21 = v4;
  if (v4)
  {
    v8 = 0;
    v19 = *MEMORY[0x24BE75948];
    v20 = *MEMORY[0x24BE75AC8];
    do
    {
      objc_msgSend(v23, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "titleDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v9, 0);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v11, 0);
      v14 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "target");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v15, sel_setAssistantLanguage_forSpecifier_, 0, 0, 3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setIdentifier:", v9);
      objc_msgSend(v16, "setValues:titles:", v12, v13);
      if (self->super._supportsMultilingualResponses)
      {
        -[AssistantDetailListController transparentImage](self, "transparentImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setProperty:forKey:", v17, v20);

        objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), v19);
      }
      objc_msgSend(v22, "addObject:", v16);

      ++v8;
    }
    while (v21 != v8);
  }

  return v22;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PSSpecifier *v11;
  PSSpecifier *sideTrippedToDetailForSpecifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = -[AssistantLanguageController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v9), "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "cellType") == 3)
    {
      -[AssistantLanguageController listItemSelected:](self, "listItemSelected:", v7);
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)AssistantLanguageController;
      -[AssistantLanguageController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v9), "objectAtIndex:", -[AssistantLanguageController indexForIndexPath:](self, "indexForIndexPath:", v7));
      v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      sideTrippedToDetailForSpecifier = self->_sideTrippedToDetailForSpecifier;
      self->_sideTrippedToDetailForSpecifier = v11;

      self->_punchingOutToDetail = 1;
    }

  }
}

- (void)listItemSelected:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  PSSpecifier *v6;
  id obj;

  v4 = -[AssistantLanguageController indexForIndexPath:](self, "indexForIndexPath:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    obj = (id)v5;
    if (self->super._supportsMultilingualResponses)
    {
      v6 = self->super._previousSelectedSpecifier;
      if (v6)
      {
        -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0, v6);
        -[AssistantLanguageController reloadSpecifier:](self, "reloadSpecifier:", v6);
      }
      -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 1, obj);
      objc_storeStrong((id *)&self->super._previousSelectedSpecifier, obj);

    }
    else
    {
      -[PSSpecifier setProperty:forKey:](self->super._groupSpecifier, "setProperty:forKey:", v5, *MEMORY[0x24BE75C20]);
    }

  }
}

- (void)updateDetailedTextLabelForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *multilingualLanguageSettings;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "multilingualResponseEnabledForLanguage:", v5);

  if (!self->_sideTrippedToDetailForSpecifier || !objc_msgSend(v18, "isEqual:"))
  {
    if (!v7)
      goto LABEL_4;
LABEL_6:
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("MULTILINGUAL_DETAIL_MIXED_%@"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    goto LABEL_7;
  }
  if (-[AssistantLanguageController multilingualEnabledForLanguageCode:](self, "multilingualEnabledForLanguageCode:", v5))
  {
    goto LABEL_6;
  }
LABEL_4:
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v18, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("MULTILINGUAL_DETAIL_ENGLISH_ONLY_%@"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
LABEL_7:

  multilingualLanguageSettings = self->_multilingualLanguageSettings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](multilingualLanguageSettings, "setObject:forKey:", v15, v5);

  +[AssistantLanguageController bundle](AssistantLanguageController, "bundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v11, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && (objc_msgSend(v17, "isEqualToString:", v11) & 1) == 0)
    objc_msgSend(v18, "setProperty:forKey:", v17, *MEMORY[0x24BE75D28]);
  else
    objc_msgSend(v18, "removePropertyForKey:", *MEMORY[0x24BE75D28]);

}

- (void)updateSelectionToCurrentAssistantLanguageAndScrollToVisible:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v6;
  PSSpecifier *sideTrippedToDetailForSpecifier;
  PSSpecifier *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    v4 = a3;
    +[AssistantUtilities assistantLanguage](AssistantUtilities, "assistantLanguage");
    v6 = objc_claimAutoreleasedReturnValue();
    sideTrippedToDetailForSpecifier = self->_sideTrippedToDetailForSpecifier;
    v11 = (id)v6;
    if (sideTrippedToDetailForSpecifier)
    {
      v8 = sideTrippedToDetailForSpecifier;
    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "specifierForID:", v6);
      v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_11;
    }
    if (self->super._supportsMultilingualResponses)
    {
      if (self->super._previousSelectedSpecifier)
        -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0);
      objc_storeStrong((id *)&self->super._previousSelectedSpecifier, v8);
      -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 1, v8);
      -[AssistantLanguageController reloadSpecifier:](self, "reloadSpecifier:", v8);
      if (!v4)
        goto LABEL_11;
    }
    else
    {
      -[PSSpecifier setProperty:forKey:](self->super._groupSpecifier, "setProperty:forKey:", v8, *MEMORY[0x24BE75C20]);
      if (!v4)
        goto LABEL_11;
    }
    -[AssistantLanguageController table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantLanguageController indexPathForSpecifier:](self, "indexPathForSpecifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, 2, 1);

LABEL_11:
  }
}

- (BOOL)multilingualEnabledForLanguageCode:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKey:](self->_multilingualLanguageSettings, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setMultilingualEnabled:(BOOL)a3 forLanguageCode:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *multilingualLanguageSettings;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = objc_msgSend(v6, "length");
    v7 = v11;
    if (v8)
    {
      multilingualLanguageSettings = self->_multilingualLanguageSettings;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setValue:forKey:](multilingualLanguageSettings, "setValue:forKey:", v10, v11);

      v7 = v11;
    }
  }

}

- (NSArray)multilingualResponseLanguageVariants
{
  return self->_multilingualResponseLanguageVariants;
}

- (void)setMultilingualResponseLanguageVariants:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualResponseLanguageVariants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilingualResponseLanguageVariants, 0);
  objc_storeStrong((id *)&self->_sideTrippedToDetailForSpecifier, 0);
  objc_storeStrong((id *)&self->_multilingualLanguageSettings, 0);
  objc_storeStrong((id *)&self->_signalEmitter, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
