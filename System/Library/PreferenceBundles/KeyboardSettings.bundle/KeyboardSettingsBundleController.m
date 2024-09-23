@implementation KeyboardSettingsBundleController

- (id)keyboardsValue:(id)a3
{
  unint64_t v3;

  v3 = +[TIKeyboardListController count](TIKeyboardListController, "count", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_COUNT"), &stru_24E732B90, CFSTR("Keyboard")), objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3), 1));
}

- (id)specifiersWithSpecifier:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  PSSpecifier *specifier;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  PSSpecifier *v16;
  uint64_t v17;

  if (self->_specifier)
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_specifier);
  v5 = *MEMORY[0x24BE75AC0];
  if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]), "isEqualToString:", CFSTR("General")))
  {
    v6 = (void *)MEMORY[0x24BE75590];
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyboard"), &stru_24E732B90, CFSTR("Keyboard"));
    specifier = (PSSpecifier *)(id)objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, 0, 0, 0, objc_opt_class(), 1, 0);
    self->_specifier = specifier;
    v9 = CFSTR("Keyboard");
LABEL_10:
    -[PSSpecifier setProperty:forKey:](specifier, "setProperty:forKey:", v9, v5);
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_specifier);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", v5), "isEqualToString:", CFSTR("Keyboard")))
  {
    v10 = (void *)MEMORY[0x24BE75590];
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARDS"), &stru_24E732B90, CFSTR("Keyboard"));
    specifier = (PSSpecifier *)(id)objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_keyboardsValue_, objc_opt_class(), 2, 0);
    self->_specifier = specifier;
LABEL_9:
    v9 = CFSTR("KEYBOARDS");
    goto LABEL_10;
  }
  v12 = *MEMORY[0x24BE75870];
  v13 = objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75870]);
  if (objc_msgSend(+[TIKeyboardExtensionController keyboardsForBundleID:](TIKeyboardExtensionController, "keyboardsForBundleID:", v13), "count"))
  {
    v14 = (void *)MEMORY[0x24BE75590];
    v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARDS"), &stru_24E732B90, CFSTR("Keyboard"));
    v16 = (PSSpecifier *)(id)objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    self->_specifier = v16;
    -[PSSpecifier setProperty:forKey:](v16, "setProperty:forKey:", v13, v12);
    v17 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("KeyboardSettings"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
    specifier = self->_specifier;
    if (v17)
    {
      -[PSSpecifier setProperty:forKey:](specifier, "setProperty:forKey:", v17, *MEMORY[0x24BE75AC8]);
      specifier = self->_specifier;
    }
    goto LABEL_9;
  }
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KeyboardSettingsBundleController;
  -[KeyboardSettingsBundleController dealloc](&v3, sel_dealloc);
}

@end
