@implementation ASTLockScreenSuggestionsDetailListController

- (ASTLockScreenSuggestionsDetailListController)init
{
  ASTLockScreenSuggestionsDetailListController *v2;
  void *v3;
  void *v4;
  ASTLockScreenSuggestionsGlobalController *v5;
  uint64_t v6;
  ASTLockScreenSuggestionsGlobalController *globalController;
  uint64_t v8;
  PSSpecifier *globalSpecifier;
  uint64_t v10;
  ASTLockScreenSuggestionSpecifier *lockScreenSpecifier;
  uint64_t v12;
  PSSpecifier *perAppGroup;
  uint64_t v14;
  NSArray *perAppSpecifiers;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ASTLockScreenSuggestionsDetailListController;
  v2 = -[ASTLockScreenSuggestionsDetailListController init](&v23, sel_init);
  if (v2)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_SUGGESTIONS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTLockScreenSuggestionsDetailListController setTitle:](v2, "setTitle:", v4);

    objc_initWeak(&location, v2);
    v5 = [ASTLockScreenSuggestionsGlobalController alloc];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __52__ASTLockScreenSuggestionsDetailListController_init__block_invoke;
    v20 = &unk_24D33D228;
    objc_copyWeak(&v21, &location);
    v6 = -[ASTLockScreenSuggestionsGlobalController initWithOnChangeCallback:](v5, "initWithOnChangeCallback:", &v17);
    globalController = v2->_globalController;
    v2->_globalController = (ASTLockScreenSuggestionsGlobalController *)v6;

    -[ASTLockScreenSuggestionsGlobalController specifier](v2->_globalController, "specifier", v17, v18, v19, v20);
    v8 = objc_claimAutoreleasedReturnValue();
    globalSpecifier = v2->_globalSpecifier;
    v2->_globalSpecifier = (PSSpecifier *)v8;

    v10 = objc_opt_new();
    lockScreenSpecifier = v2->_lockScreenSpecifier;
    v2->_lockScreenSpecifier = (ASTLockScreenSuggestionSpecifier *)v10;

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    perAppGroup = v2->_perAppGroup;
    v2->_perAppGroup = (PSSpecifier *)v12;

    -[ASTLockScreenSuggestionSpecifier specifiers](v2->_lockScreenSpecifier, "specifiers");
    v14 = objc_claimAutoreleasedReturnValue();
    perAppSpecifiers = v2->_perAppSpecifiers;
    v2->_perAppSpecifiers = (NSArray *)v14;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __52__ASTLockScreenSuggestionsDetailListController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleGlobalToggleChangeWithEnabled:", a2);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v3, "addObject:", self->_globalSpecifier);
  -[ASTLockScreenSuggestionsGlobalController isLockScreenSuggestionEnabled:](self->_globalController, "isLockScreenSuggestionEnabled:", self->_globalSpecifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v3, "addObject:", self->_perAppGroup);
    objc_msgSend(v3, "addObjectsFromArray:", self->_perAppSpecifiers);
  }
  v7 = (int)*MEMORY[0x24BE756E0];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v3;
  v9 = v3;

  v10 = *(id *)((char *)&self->super.super.super.super.super.isa + v7);
  return v10;
}

- (void)_handleGlobalToggleChangeWithEnabled:(BOOL)a3
{
  if (a3)
  {
    -[ASTLockScreenSuggestionsDetailListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", self->_perAppGroup, self->_globalSpecifier, 1);
    -[ASTLockScreenSuggestionsDetailListController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", self->_perAppSpecifiers, self->_perAppGroup, 1);
  }
  else
  {
    -[ASTLockScreenSuggestionsDetailListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_perAppSpecifiers, 1);
    -[ASTLockScreenSuggestionsDetailListController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_perAppGroup, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSpecifier, 0);
  objc_storeStrong((id *)&self->_globalController, 0);
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_perAppGroup, 0);
  objc_storeStrong((id *)&self->_lockScreenSpecifier, 0);
}

@end
