@implementation AssistantMultilingualDetailController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantMultilingualBundle;
  if (!bundle_sAssistantMultilingualBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantMultilingualBundle;
    bundle_sAssistantMultilingualBundle = v3;

    v2 = (void *)bundle_sAssistantMultilingualBundle;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AssistantMultilingualDetailController;
  -[AssistantDetailListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    -[AssistantMultilingualDetailController _syncSelectionToPrefs](self, "_syncSelectionToPrefs");
}

- (void)setParentController:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_languageController, a3);
  v6.receiver = self;
  v6.super_class = (Class)AssistantMultilingualDetailController;
  -[AssistantMultilingualDetailController setParentController:](&v6, sel_setParentController_, v5);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *headerSpecifier;
  PSSpecifier *v8;
  PSSpecifier *groupSpecifier;
  PSSpecifier *v10;
  PSSpecifier *preferEnglishOnlySpecifier;
  PSSpecifier *v12;
  PSSpecifier *preferMultilingualSpecifier;
  PSSpecifier *v14;
  void *v15;
  PSSpecifier *v16;
  void *v17;
  uint64_t v18;
  PSSpecifier *v19;
  void *v20;
  PSSpecifier *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  NSString *setterValue;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AssistantMultilingualDetailController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AssistantMultilingualDetail"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("MULTILINGUAL_DETAIL_HEADER_GROUP_ID"));
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    headerSpecifier = self->_headerSpecifier;
    self->_headerSpecifier = v6;

    -[AssistantMultilingualDetailController _addLinkAttributesToHeaderSpecifier](self, "_addLinkAttributesToHeaderSpecifier");
    objc_msgSend(v5, "specifierForID:", CFSTR("MULTILINGUAL_DETAIL_GROUP_ID"));
    v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    groupSpecifier = self->super._groupSpecifier;
    self->super._groupSpecifier = v8;

    objc_msgSend(v5, "specifierForID:", CFSTR("MULTILINGUAL_DETAIL_OPTION_ENGLISH_ONLY_ID"));
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferEnglishOnlySpecifier = self->_preferEnglishOnlySpecifier;
    self->_preferEnglishOnlySpecifier = v10;

    objc_msgSend(v5, "specifierForID:", CFSTR("MULTILINGUAL_DETAIL_OPTION_MIXED_ID"));
    v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferMultilingualSpecifier = self->_preferMultilingualSpecifier;
    self->_preferMultilingualSpecifier = v12;

    v14 = self->_preferEnglishOnlySpecifier;
    -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_OPTION_ENGLISH_ONLY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v14, "setName:", v15);

    v16 = self->_preferEnglishOnlySpecifier;
    -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_FOOTER_ENGLISH_ONLY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE75A68];
    -[PSSpecifier setProperty:forKey:](v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

    -[AssistantMultilingualDetailController reloadSpecifier:](self, "reloadSpecifier:", self->_preferEnglishOnlySpecifier);
    v19 = self->_preferMultilingualSpecifier;
    -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_OPTION_MIXED"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v19, "setName:", v20);

    v21 = self->_preferMultilingualSpecifier;
    -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_FOOTER_MIXED"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v21, "setProperty:forKey:", v22, v18);

    -[AssistantMultilingualDetailController reloadSpecifier:](self, "reloadSpecifier:", self->_preferMultilingualSpecifier);
    v23 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
    v24 = v5;

    -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0, self->_preferMultilingualSpecifier);
    -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0, self->_preferEnglishOnlySpecifier);
    -[AssistantMultilingualDetailController _syncSelectionToPrefs](self, "_syncSelectionToPrefs");
    -[AssistantMultilingualDetailController specifier](self, "specifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantMultilingualDetailController setTitle:](self, "setTitle:", v26);

    -[AssistantMultilingualDetailController specifier](self, "specifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "values");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    setterValue = self->_setterValue;
    self->_setterValue = v29;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)listItemSelected:(id)a3
{
  uint64_t v4;
  PSSpecifier *v5;
  PSSpecifier *v6;
  PSSpecifier *previousSelectedSpecifier;
  PSSpecifier *v8;

  v4 = -[AssistantMultilingualDetailController indexForIndexPath:](self, "indexForIndexPath:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v4);
    v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v6 = self->super._previousSelectedSpecifier;
    if (v6)
      -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 0, v6);
    -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 1, v5);
    -[AssistantMultilingualDetailController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", v5);
    previousSelectedSpecifier = self->super._previousSelectedSpecifier;
    self->super._previousSelectedSpecifier = v5;
    v8 = v5;

    -[AssistantLanguageController setMultilingualEnabled:forLanguageCode:](self->_languageController, "setMultilingualEnabled:forLanguageCode:", v8 == self->_preferMultilingualSpecifier, self->_setterValue);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AssistantMultilingualDetailController listItemSelected:](self, "listItemSelected:", v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)_syncSelectionToPrefs
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int *v6;
  PSSpecifier *v7;
  PSSpecifier *previousSelectedSpecifier;
  PSSpecifier *v9;
  id v10;

  -[AssistantMultilingualDetailController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[AssistantLanguageController multilingualEnabledForLanguageCode:](self->_languageController, "multilingualEnabledForLanguageCode:", v10);
  v6 = &OBJC_IVAR___AssistantMultilingualDetailController__preferEnglishOnlySpecifier;
  if (v5)
    v6 = &OBJC_IVAR___AssistantMultilingualDetailController__preferMultilingualSpecifier;
  v7 = (PSSpecifier *)*(id *)((char *)&self->super.super.super.super.super.super.isa + *v6);
  previousSelectedSpecifier = self->super._previousSelectedSpecifier;
  self->super._previousSelectedSpecifier = v7;
  v9 = v7;

  -[AssistantDetailListController setChecked:forSpecifier:](self, "setChecked:forSpecifier:", 1, v9);
  -[AssistantMultilingualDetailController reloadSpecifier:](self, "reloadSpecifier:", v9);
  -[AssistantMultilingualDetailController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", v9);

}

- (void)_refreshFooterForSpecifier:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x24BE75A68];
  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75A68]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](self->super._groupSpecifier, "setProperty:forKey:", v5, v4);
  -[AssistantMultilingualDetailController reloadSpecifier:](self, "reloadSpecifier:", self->super._groupSpecifier);

}

- (void)_addLinkAttributesToHeaderSpecifier
{
  void *v3;
  PSSpecifier *headerSpecifier;
  objc_class *v5;
  void *v6;
  PSSpecifier *v7;
  void *v8;
  PSSpecifier *v9;
  void *v10;
  id v11;
  NSRange v12;

  -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_HEADER"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_HEADER_LINK_TEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  headerSpecifier = self->_headerSpecifier;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](headerSpecifier, "setProperty:forKey:", v6, *MEMORY[0x24BE75A30]);

  -[PSSpecifier setProperty:forKey:](self->_headerSpecifier, "setProperty:forKey:", v11, *MEMORY[0x24BE75A68]);
  v7 = self->_headerSpecifier;
  v12.location = objc_msgSend(v11, "rangeOfString:", v3);
  NSStringFromRange(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A40]);

  v9 = self->_headerSpecifier;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75A50]);

  -[PSSpecifier setProperty:forKey:](self->_headerSpecifier, "setProperty:forKey:", CFSTR("_learnMoreTapped"), *MEMORY[0x24BE75A38]);
  -[AssistantMultilingualDetailController reloadSpecifier:](self, "reloadSpecifier:", self->_headerSpecifier);

}

- (void)_learnMoreTapped
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  -[AssistantMultilingualDetailController _languageSpecificLocalizedStringForKey:](self, "_languageSpecificLocalizedStringForKey:", CFSTR("MULTILINGUAL_DETAIL_HEADER_LINK_URL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    dispatch_get_global_queue(25, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__AssistantMultilingualDetailController__learnMoreTapped__block_invoke;
    block[3] = &unk_24D33CBE0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __57__AssistantMultilingualDetailController__learnMoreTapped__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (id)_languageSpecificLocalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[AssistantMultilingualDetailController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), v4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantMultilingualDetailController bundle](AssistantMultilingualDetailController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24D33E0B0, CFSTR("AssistantMultilingualDetail"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", v9))
  {
    +[AssistantMultilingualDetailController bundle](AssistantMultilingualDetailController, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantMultilingualDetail"));
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageController, 0);
  objc_storeStrong((id *)&self->_setterValue, 0);
  objc_storeStrong((id *)&self->_headerSpecifier, 0);
  objc_storeStrong((id *)&self->_preferMultilingualSpecifier, 0);
  objc_storeStrong((id *)&self->_preferEnglishOnlySpecifier, 0);
}

@end
