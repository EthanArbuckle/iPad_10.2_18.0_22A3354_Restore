@implementation KSAddKeyboardLanguageListController

- (KSAddKeyboardLanguageListController)init
{
  KSAddKeyboardLanguageListController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KSAddKeyboardLanguageListController;
  v2 = -[KSAddKeyboardLanguageListController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_willResume, *MEMORY[0x24BEBE008], 0);
  }
  return v2;
}

- (NSOperationQueue)searchQueue
{
  NSOperationQueue *result;
  NSOperationQueue *v4;

  result = self->_searchQueue;
  if (!result)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    self->_searchQueue = v4;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", 1);
    return self->_searchQueue;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)KSAddKeyboardLanguageListController;
  -[KSAddKeyboardLanguageListController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSAddKeyboardLanguageListController;
  -[KSAddKeyboardLanguageListController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
  objc_msgSend((id)-[KSAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setSearchController:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0));
  objc_msgSend((id)-[KSAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setHidesSearchBarWhenScrolling:", 0);
  objc_msgSend((id)objc_msgSend((id)-[KSAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "searchController"), "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[KSAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "searchController"), "searchBar"), "setDelegate:", self);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  -[KSAddKeyboardLanguageListController setSearchText:](self, "setSearchText:", a4);
  -[NSOperationQueue cancelAllOperations](-[KSAddKeyboardLanguageListController searchQueue](self, "searchQueue"), "cancelAllOperations");
  v5 = objc_alloc_init(MEMORY[0x24BDD1478]);
  objc_initWeak(&location, v5);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__KSAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke;
  v6[3] = &unk_251079F18;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "addExecutionBlock:", v6);
  -[NSOperationQueue addOperation:](-[KSAddKeyboardLanguageListController searchQueue](self, "searchQueue"), "addOperation:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__KSAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "generateSpecifiers");
  if ((objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "isCancelled") & 1) == 0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __63__KSAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke_2;
    v3[3] = &unk_2510799B0;
    v3[4] = *(_QWORD *)(a1 + 32);
    v3[5] = v2;
    dispatch_sync(MEMORY[0x24BDAC9B8], v3);
  }
}

uint64_t __63__KSAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSpecifiers:", *(_QWORD *)(a1 + 40));
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[NSOperationQueue cancelAllOperations](-[KSAddKeyboardLanguageListController searchQueue](self, "searchQueue", a3), "cancelAllOperations");
  -[KSAddKeyboardLanguageListController setSearchText:](self, "setSearchText:", 0);
  -[KSAddKeyboardLanguageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (BOOL)inputMode:(id)a3 matchesPredicate:(id)a4
{
  uint64_t LanguageWithRegion;
  BOOL v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  LanguageWithRegion = TIInputModeGetLanguageWithRegion();
  if ((objc_msgSend(a4, "evaluateWithObject:", LanguageWithRegion) & 1) != 0)
    return 1;
  v7 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", LanguageWithRegion);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v7);
  objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "localizedStringForLanguage:context:length:", LanguageWithRegion, 0, 2));
  objc_msgSend(v8, "addObject:", TUIKeyboardTitleInLanguage());
  objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", LanguageWithRegion), "localizedStringForLocaleIdentifier:", LanguageWithRegion));
  v9 = +[KSKeyboardListController supportedBaseInputModesForLanguage:](KSKeyboardListController, "supportedBaseInputModesForLanguage:", LanguageWithRegion);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "valueForKey:", CFSTR("kCFLocaleVariantCodeKey"));
        v13 = (void *)TUIKeyboardTitle();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v8, "addObject:", v13);
        v14 = (void *)TUIKeyboardTitleInLanguage();
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v8, "addObject:", v14);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    v17 = MEMORY[0x24BDAC760];
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v8);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (objc_msgSend(a4, "evaluateWithObject:", v19))
        {
          *((_BYTE *)v28 + 24) = 1;
          goto LABEL_25;
        }
        v20 = objc_msgSend(v19, "length");
        v22[0] = v17;
        v22[1] = 3221225472;
        v22[2] = __66__KSAddKeyboardLanguageListController_inputMode_matchesPredicate___block_invoke;
        v22[3] = &unk_251079F40;
        v22[4] = a4;
        v22[5] = &v27;
        objc_msgSend(v19, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 3, v22);
        if (*((_BYTE *)v28 + 24))
          goto LABEL_25;
      }
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_25:
  v6 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return v6;
}

uint64_t __66__KSAddKeyboardLanguageListController_inputMode_matchesPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  uint64_t v3;
  id result;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    result = -[KSAddKeyboardLanguageListController generateSpecifiers](self, "generateSpecifiers");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)generateSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t LanguageWithRegion;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id obj;
  KSAddKeyboardLanguageListController *val;
  _QWORD block[4];
  id v52;
  id location;
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "suggestedInputModesForPreferredLanguages");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v60 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isExtensionInputMode") & 1) == 0)
        {
          objc_msgSend(v9, "identifier");
          LanguageWithRegion = TIInputModeGetLanguageWithRegion();
          if ((objc_msgSend(v3, "containsObject:", LanguageWithRegion) & 1) == 0)
            objc_msgSend(v3, "addObject:", LanguageWithRegion);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v6);
  }
  v48 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v40 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  val = self;
  if (-[NSString length](-[KSAddKeyboardLanguageListController searchText](self, "searchText"), "length"))
    v11 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF beginswith[cd] %@"), -[KSAddKeyboardLanguageListController searchText](self, "searchText"));
  else
    v11 = 0;
  v58 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  obj = (id)UIKeyboardGetSupportedInputModes();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    v46 = *MEMORY[0x24BDBD1D0];
    v42 = *MEMORY[0x24BDBD298];
    v44 = *MEMORY[0x24BE75D50];
    v47 = *MEMORY[0x24BE75AC0];
    v43 = *MEMORY[0x24BE75948];
    v39 = *MEMORY[0x24BE758F8];
    v38 = *MEMORY[0x24BE758A8];
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        if ((!v11
           || -[KSAddKeyboardLanguageListController inputMode:matchesPredicate:](val, "inputMode:matchesPredicate:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j), v11))&& (!_os_feature_enabled_impl() || (TIUIInputModeIsMultilingualOnly() & 1) == 0))
        {
          v17 = (void *)objc_msgSend(MEMORY[0x24BEBD6E8], "keyboardInputModeWithIdentifier:", v16);
          if ((objc_msgSend(v17, "isExtensionInputMode") & 1) != 0
            || objc_msgSend(+[KSKeyboardListController availableInputModesForLanguage:](KSKeyboardListController, "availableInputModesForLanguage:", v16), "count"))
          {
            if (objc_msgSend(v17, "isExtensionInputMode"))
            {
              v18 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundlePath");
              if (!v18)
                continue;
              v19 = v18;
              v20 = objc_msgSend(v17, "identifier");
              v21 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundleIdentifier");
              v22 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "objectForInfoDictionaryKey:", v46);
              if (!v22)
                v22 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "objectForInfoDictionaryKey:", v42);
              v23 = (id)v22;
            }
            else
            {
              v20 = TIInputModeGetLanguageWithRegion();
              v23 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", v20);
              v19 = 0;
              v21 = v20;
            }
            if (!objc_msgSend(v48, "member:", v20))
            {
              objc_msgSend(v48, "addObject:", v20);
              if (!objc_msgSend(v17, "isExtensionInputMode")
                || (v24 = (id)objc_msgSend(v45, "objectForKey:", objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundlePath"))) == 0)
              {
                v24 = (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, val, 0, 0, 0, 3, 0);
                objc_msgSend(v24, "setControllerLoadAction:", sel_showAddSystemKeyboardSheet_);
                objc_msgSend(v24, "setProperty:forKey:", v23, v44);
                objc_msgSend(v24, "setProperty:forKey:", v21, v47);
                objc_msgSend(v24, "setProperty:forKey:", objc_opt_class(), v43);
              }
              if (objc_msgSend(v17, "isExtensionInputMode"))
              {
                v25 = (void *)objc_msgSend(v24, "propertyForKey:", CFSTR("TIKBAllIdentifiersKey"));
                if (!v25)
                {
                  v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  objc_msgSend(v24, "setProperty:forKey:", v25, CFSTR("TIKBAllIdentifiersKey"));
                }
                objc_msgSend(v25, "addObject:", v17);
                if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeInputModes"), "containsObject:", v17) & 1) == 0)
                {
                  v26 = (void *)objc_msgSend(v24, "propertyForKey:", CFSTR("TIKBIdentifiersKey"));
                  if (!v26)
                  {
                    v26 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    objc_msgSend(v24, "setProperty:forKey:", v26, CFSTR("TIKBIdentifiersKey"));
                  }
                  objc_msgSend(v26, "addObject:", v17);
                  objc_msgSend(v24, "setProperty:forKey:", v19, v39);
                  objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v38);
                  objc_msgSend(v24, "setControllerLoadAction:", sel_showAddExtensionKeyboardSheet_);
                  objc_msgSend(v45, "setObject:forKey:", v24, v19);
                }
              }
              else
              {
                if (objc_msgSend(v3, "containsObject:", objc_msgSend(v24, "propertyForKey:", v47)))
                  v27 = v40;
                else
                  v27 = v41;
                objc_msgSend(v27, "addObject:", v24);
              }
            }
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v13);
  }
  v28 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __57__KSAddKeyboardLanguageListController_generateSpecifiers__block_invoke;
  v54[3] = &unk_251079F68;
  v54[4] = v3;
  objc_msgSend(v40, "sortUsingComparator:", v54);
  objc_msgSend(v41, "sortUsingComparator:", &__block_literal_global_9);
  v29 = (void *)objc_msgSend((id)objc_msgSend(v45, "allValues"), "sortedArrayUsingSelector:", sel_titleCompare_);
  v30 = objc_msgSend(v40, "count");
  v31 = objc_msgSend(v29, "count");
  v32 = objc_msgSend(v41, "count");
  v33 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (v30)
    objc_msgSend(v33, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SUGGESTED_KEYBOARDS"), &stru_25107A038, CFSTR("Keyboard"))));
  objc_msgSend(v33, "addObjectsFromArray:", v40);
  if (v31)
  {
    v34 = objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("APP_KEYBOARDS"), &stru_25107A038, CFSTR("Keyboard")));
    objc_msgSend(v33, "addObject:", v34);
    -[KSAddKeyboardLanguageListController createAboutPrivacyControllerIfNeeded:](val, "createAboutPrivacyControllerIfNeeded:", v34);
  }
  else
  {
    objc_initWeak(&location, val);
    block[0] = v28;
    block[1] = 3221225472;
    block[2] = __57__KSAddKeyboardLanguageListController_generateSpecifiers__block_invoke_3;
    block[3] = &unk_251079FB0;
    objc_copyWeak(&v52, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v33, "addObjectsFromArray:", v29);
  if (v32)
  {
    v35 = objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DEVICE_KEYBOARDS"));
    v36 = objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v35, &stru_25107A038, CFSTR("Keyboard")));
  }
  else
  {
    v36 = objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  }
  objc_msgSend(v33, "addObject:", v36);
  objc_msgSend(v33, "addObjectsFromArray:", v41);
  return v33;
}

uint64_t __57__KSAddKeyboardLanguageListController_generateSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;

  v5 = *MEMORY[0x24BE75AC0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "propertyForKey:", *MEMORY[0x24BE75AC0])));
  return objc_msgSend(v6, "compare:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a3, "propertyForKey:", v5))));
}

uint64_t __57__KSAddKeyboardLanguageListController_generateSpecifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "titleCompare:");
}

uint64_t __57__KSAddKeyboardLanguageListController_generateSpecifiers__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "setAboutPrivacyController:", 0);
}

- (void)createAboutPrivacyControllerIfNeeded:(id)a3
{
  _QWORD block[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v5 = __76__KSAddKeyboardLanguageListController_createAboutPrivacyControllerIfNeeded___block_invoke;
  v6 = &unk_251079FD8;
  objc_copyWeak(&v8, &location);
  v7 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v5((uint64_t)block);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __76__KSAddKeyboardLanguageListController_createAboutPrivacyControllerIfNeeded___block_invoke(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 40));
  if (objc_msgSend(Weak, "aboutPrivacyController"))
    return objc_msgSend((id)objc_msgSend(Weak, "aboutPrivacyController"), "setSpecifier:", *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(Weak, "setAboutPrivacyController:", -[KSAboutKeyboardPrivacyController initWithGroupSpecifier:asHeader:inListController:]([KSAboutKeyboardPrivacyController alloc], "initWithGroupSpecifier:asHeader:inListController:", *(_QWORD *)(a1 + 32), 1, Weak));
}

- (void)handleSoleInputModeAddition:(id)a3
{
  void *v4;

  +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers"), "arrayByAddingObject:", a3));
  v4 = (void *)objc_msgSend((id)-[KSAddKeyboardLanguageListController parentController](self, "parentController"), "parentController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "setNewKeyboardsAdded:", 1);
    objc_msgSend(v4, "reloadSpecifiers");
  }
  objc_msgSend((id)-[KSAddKeyboardLanguageListController parentController](self, "parentController"), "dismiss");
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  -[KSAboutKeyboardPrivacyController addPrivacyLinkViewIfNecessaryToHeaderView:forSection:](-[KSAddKeyboardLanguageListController aboutPrivacyController](self, "aboutPrivacyController", a3), "addPrivacyLinkViewIfNecessaryToHeaderView:forSection:", a4, a5);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KSAddKeyboardLanguageListController;
  v6 = -[KSAddKeyboardLanguageListController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[KSAddKeyboardLanguageListController specifierAtIndex:](self, "specifierAtIndex:", -[KSAddKeyboardLanguageListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  objc_msgSend(v6, "setAccessibilityIdentifier:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]));
  return v6;
}

- (void)showAddSystemKeyboardSheet:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  KSAddKeyboardController *v11;

  v5 = objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v6 = +[KSKeyboardListController supportedInputModesForLanguage:](KSKeyboardListController, "supportedInputModesForLanguage:", v5);
  if ((!+[KSAddKeyboardController shouldShowAddKeyboardControllerForInputModes:](KSAddKeyboardController, "shouldShowAddKeyboardControllerForInputModes:", v6)|| objc_msgSend(v6, "count") == 1)&& (v7 = +[KSKeyboardListController availableInputModesForLanguage:](KSKeyboardListController, "availableInputModesForLanguage:", v5), v8 = objc_msgSend(v6, "count"), v8 == objc_msgSend(v7, "count"))&& (v9 = objc_msgSend(v7, "firstObject")) != 0)
  {
    v10 = v9;
    if (UIKeyboardGetDefaultHardwareKeyboardForInputMode())
      v10 = UIKeyboardInputModeWithNewHWLayout();
    -[KSAddKeyboardLanguageListController handleSoleInputModeAddition:](self, "handleSoleInputModeAddition:", v10);
  }
  else
  {
    v11 = objc_alloc_init(KSAddKeyboardController);
    -[KSAddKeyboardController setParentController:](v11, "setParentController:", self);
    -[KSAddKeyboardController setSpecifier:](v11, "setSpecifier:", a3);
    objc_msgSend(a3, "setTarget:", self);
    -[KSAddKeyboardLanguageListController showController:animate:](self, "showController:animate:", v11, 1);
  }
}

- (void)showAddExtensionKeyboardSheet:(id)a3
{
  KSAddExtensionKeyboardController *v5;

  v5 = objc_alloc_init(KSAddExtensionKeyboardController);
  -[KSAddExtensionKeyboardController setBehavesAsModalForAddSheet:](v5, "setBehavesAsModalForAddSheet:", 1);
  -[KSAddExtensionKeyboardController setParentController:](v5, "setParentController:", self);
  -[KSAddExtensionKeyboardController setSpecifier:](v5, "setSpecifier:", a3);
  objc_msgSend(a3, "setTarget:", self);
  if (objc_msgSend(-[KSAddExtensionKeyboardController specifiers](v5, "specifiers"), "count"))
    -[KSAddKeyboardLanguageListController showController:animate:](self, "showController:animate:", v5, 1);
  else
    -[KSAddKeyboardLanguageListController handleSoleInputModeAddition:](self, "handleSoleInputModeAddition:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", CFSTR("TIKBIdentifiersKey")), "firstObject"), "identifier"));
}

- (void)cancelButtonTapped
{
  objc_msgSend((id)-[KSAddKeyboardLanguageListController parentController](self, "parentController"), "dismiss");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSAddKeyboardLanguageListController;
  -[KSAddKeyboardLanguageListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[KSAddKeyboardLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ADD_NEW_KEYBOARD_SHORT"), &stru_25107A038, CFSTR("Keyboard")));
  objc_msgSend((id)-[KSAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped));
}

- (void)dismissForDone
{
  void *v3;

  if (!-[KSAddKeyboardLanguageListController returnSuggestedInputModes](self, "returnSuggestedInputModes")
    || (-[KSAddKeyboardLanguageListController parentController](self, "parentController"),
        (objc_opt_respondsToSelector() & 1) == 0))
  {
    v3 = (void *)objc_msgSend((id)-[KSAddKeyboardLanguageListController parentController](self, "parentController"), "parentController");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "setNewKeyboardsAdded:", 1);
      objc_msgSend(v3, "reloadSpecifiers");
    }
  }
  objc_msgSend((id)-[KSAddKeyboardLanguageListController parentController](self, "parentController"), "dismiss");
}

- (BOOL)returnSuggestedInputModes
{
  return self->_returnSuggestedInputModes;
}

- (void)setReturnSuggestedInputModes:(BOOL)a3
{
  self->_returnSuggestedInputModes = a3;
}

- (NSArray)suggestedInputModes
{
  return self->_suggestedInputModes;
}

- (KSAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1392);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1400);
}

- (void)setSearchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1408);
}

@end
