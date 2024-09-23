@implementation ASTLockScreenSuggestionsGlobalController

- (ASTLockScreenSuggestionsGlobalController)initWithOnChangeCallback:(id)a3
{
  id v4;
  ASTLockScreenSuggestionsGlobalController *v5;
  void *v6;
  id onChangeCallback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASTLockScreenSuggestionsGlobalController;
  v5 = -[ASTLockScreenSuggestionsGlobalController init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    onChangeCallback = v5->_onChangeCallback;
    v5->_onChangeCallback = v6;

  }
  return v5;
}

- (id)specifier
{
  PSSpecifier *specifier;
  void *v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  uint64_t v9;

  specifier = self->_specifier;
  if (!specifier)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    +[AssistantController bundle](AssistantController, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_ALLOW_NOTIFICATIONS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setLockScreenSuggestionsEnabled_forSpecifier_, sel_isLockScreenSuggestionEnabled_, 0, 6, 0);
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v8 = self->_specifier;
    self->_specifier = v7;

    v9 = MEMORY[0x24BDBD1C8];
    -[PSSpecifier setProperty:forKey:](self->_specifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    -[PSSpecifier setProperty:forKey:](self->_specifier, "setProperty:forKey:", v9, *MEMORY[0x24BE75868]);
    specifier = self->_specifier;
  }
  return specifier;
}

- (id)isLockScreenSuggestionEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue") ^ 1;
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setLockScreenSuggestionsEnabled:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void (**onChangeCallback)(id, uint64_t);
  id v7;

  v7 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.lockscreen.shared"));
  objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v7, "BOOLValue") ^ 1, CFSTR("LockScreenSuggestionsDisabled"));

  onChangeCallback = (void (**)(id, uint64_t))self->_onChangeCallback;
  if (onChangeCallback)
    onChangeCallback[2](onChangeCallback, objc_msgSend(v7, "BOOLValue"));
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("Lockscreen"), objc_msgSend(v7, "BOOLValue"));
  notify_post("com.apple.duetexpertd.prefschanged");

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onChangeCallback, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
