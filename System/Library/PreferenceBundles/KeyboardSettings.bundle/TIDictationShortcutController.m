@implementation TIDictationShortcutController

- (id)specifiers
{
  uint64_t v2;
  id v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_SHORTCUT_EXPLANATION"), &stru_24E732B90, CFSTR("Dictation")));
    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    objc_msgSend(v3, "addObject:", v5);
    v6 = (void *)-[TIDictationShortcutController specifier](self, "specifier");
    objc_msgSend(v6, "setProperty:forKey:", &unk_24E73E348, *MEMORY[0x24BE759E0]);
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "valueForPreferenceKey:", CFSTR("HWKeyboardDictationShortcut"));
    if (v7)
    {
      v8 = v7;
      v9 = (void *)-[TIDictationShortcutController specifier](self, "specifier");
      v10 = *MEMORY[0x24BE75DA0];
      objc_msgSend(v9, "setProperty:forKey:", v8, *MEMORY[0x24BE75DA0]);
    }
    else
    {
      v10 = *MEMORY[0x24BE75DA0];
    }
    v11 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Control")), self, 0, 0, 0, 3, 0);
    v12 = *MEMORY[0x24BE75D50];
    objc_msgSend(v11, "setProperty:forKey:", CFSTR("control"), *MEMORY[0x24BE75D50]);
    objc_msgSend(v11, "setProperty:forKey:", &unk_24E73E348, v10);
    objc_msgSend(v3, "addObject:", v11);
    v13 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Command"), &stru_24E732B90, CFSTR("Keyboard")), self, 0, 0, 0, 3, 0);
    objc_msgSend(v13, "setProperty:forKey:", CFSTR("command"), v12);
    objc_msgSend(v13, "setProperty:forKey:", &unk_24E73E360, v10);
    objc_msgSend(v3, "addObject:", v13);
    v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("NO_SHORTCUT"), &stru_24E732B90, CFSTR("Keyboard")), self, 0, 0, 0, 3, 0);
    objc_msgSend(v14, "setProperty:forKey:", CFSTR("noshortcut"), v12);
    objc_msgSend(v14, "setProperty:forKey:", &unk_24E73E378, v10);
    objc_msgSend(v3, "addObject:", v14);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v3;
  }
  return v3;
}

+ (id)attributedTitleForDictationShortcutValue:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("noshortcut");
  v4 = CFSTR("NO_SHORTCUT");
  if (a3 == 1)
  {
    v4 = CFSTR("Command");
    v3 = CFSTR("command");
  }
  if (a3)
    v5 = v4;
  else
    v5 = CFSTR("Control");
  if (a3)
    v6 = v3;
  else
    v6 = CFSTR("control");
  return +[TIKeyboardListController attributedTitleForSymbolName:cellTitle:](TIKeyboardListController, "attributedTitleForSymbolName:cellTitle:", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v5, &stru_24E732B90, CFSTR("Keyboard")));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TIDictationShortcutController;
  v6 = -[TIDictationShortcutController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[TIDictationShortcutController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v8 = objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75D50]);
  if (v8)
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setAttributedText:", +[TIKeyboardListController attributedTitleForSymbolName:cellTitle:](TIKeyboardListController, "attributedTitleForSymbolName:cellTitle:", v8, objc_msgSend(v7, "name")));
  else
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setText:", objc_msgSend(v7, "name"));
  v9 = (void *)-[TIDictationShortcutController specifier](self, "specifier");
  v10 = *MEMORY[0x24BE75DA0];
  v11 = objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  if (!v11)
  {
    v12 = (void *)-[TIDictationShortcutController specifier](self, "specifier");
    v11 = objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE759E0]);
  }
  objc_msgSend(v6, "setChecked:", objc_msgSend((id)objc_msgSend(v7, "propertyForKey:", v10), "isEqualToNumber:", v11));
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (void *)-[TIDictationShortcutController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v8 = *MEMORY[0x24BE75DA0];
  v9 = objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  objc_msgSend((id)-[TIDictationShortcutController specifier](self, "specifier"), "setProperty:forKey:", v9, v8);
  -[TIDictationShortcutController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v9, -[TIDictationShortcutController specifier](self, "specifier"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "setValue:forPreferenceKey:", v9, CFSTR("HWKeyboardDictationShortcut"));
  -[TIDictationShortcutController reloadSpecifiers](self, "reloadSpecifiers");
  -[TIDictationShortcutController updatePreferenceForParent](self, "updatePreferenceForParent");
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void)updatePreferenceForParent
{
  void *v2;

  v2 = (void *)-[TIDictationShortcutController parentController](self, "parentController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setNeedsReloadSpecifiers:", 1);
}

@end
