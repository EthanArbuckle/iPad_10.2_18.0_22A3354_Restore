@implementation TIInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TIInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  TIInputModeTableCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[TIInputModeTableCell setInputMode:](v6, "setInputMode:", objc_msgSend(MEMORY[0x24BDF6B40], "keyboardInputModeWithIdentifier:", objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75AC0])));
    -[TIInputModeTableCell updateLabels](v6, "updateLabels");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIInputModeTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)updateLabels
{
  objc_msgSend((id)-[TIInputModeTableCell textLabel](self, "textLabel"), "setText:", -[TIInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[TIInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[TIInputModeTableCell subtitle](self, "subtitle"));
  if (-[TIInputModeTableCell hasDownloadableAssets](self, "hasDownloadableAssets"))
    -[TIInputModeTableCell addDownloadIcon](self, "addDownloadIcon");
}

- (id)title
{
  int v3;
  UIKeyboardInputMode *v4;
  id v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[UIKeyboardInputMode isExtensionInputMode](-[TIInputModeTableCell inputMode](self, "inputMode"), "isExtensionInputMode");
  v4 = -[TIInputModeTableCell inputMode](self, "inputMode");
  if (v3)
    return -[UIKeyboardInputMode safe__extendedDisplayName](v4, "safe__extendedDisplayName");
  -[UIKeyboardInputMode identifier](v4, "identifier");
  if (objc_msgSend((id)TIInputModeGetSWLayout(), "isEqualToString:", CFSTR("Korean-With-QWERTY")))
  {
    v8[0] = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion());
    v8[1] = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", TIInputModeGetLanguageWithRegion());
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2), "componentsJoinedByString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("LIST_SEPARATOR_2"), &stru_24E732B90, CFSTR("Keyboard"))));
  }
  else
  {
    v6 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", -[UIKeyboardInputMode languageWithRegion](-[TIInputModeTableCell inputMode](self, "inputMode"), "languageWithRegion"));
    if (objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("kCFLocaleVariantCodeKey")), "length"))
    {
      v7 = (void *)TUIKeyboardTitle();
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v7, "length"))
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_LANGUAGE_%@_WITH_VARIANT_%@"), &stru_24E732B90, CFSTR("Keyboard")), v6, v7);
  }
  return v6;
}

- (id)subtitle
{
  void *v3;
  uint64_t v5;
  uint64_t NormalizedIdentifier;
  id v7;
  void *ComponentsFromIdentifier;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  if (-[UIKeyboardInputMode isExtensionInputMode](-[TIInputModeTableCell inputMode](self, "inputMode"), "isExtensionInputMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"));
    return (id)objc_msgSend(v3, "displayNameForKey:value:", *MEMORY[0x24BDBCB20], -[UIKeyboardInputMode primaryLanguage](-[TIInputModeTableCell inputMode](self, "inputMode"), "primaryLanguage"));
  }
  v5 = -[UIKeyboardInputMode identifier](-[TIInputModeTableCell inputMode](self, "inputMode"), "identifier");
  NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
  v7 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", -[UIKeyboardInputMode languageWithRegion](-[TIInputModeTableCell inputMode](self, "inputMode"), "languageWithRegion"));
  ComponentsFromIdentifier = (void *)TIInputModeGetComponentsFromIdentifier();
  if (objc_msgSend((id)objc_msgSend(ComponentsFromIdentifier, "objectForKey:", CFSTR("kCFLocaleVariantCodeKey")), "length"))
  {
    v9 = (void *)TUIKeyboardTitle();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(ComponentsFromIdentifier, "objectForKey:", CFSTR("sw"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Korean-With-QWERTY")))
  {
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("BILINGUAL_KEYBOARD_TITLE_SHORT"), &stru_24E732B90, CFSTR("Keyboard"));
  }
  else
  {
    if (objc_msgSend(v10, "length"))
      v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v10, &stru_24E732B90, CFSTR("KeyboardLayouts"));
    else
      v12 = 0;
    if ((objc_msgSend(v7, "isEqualToString:", v12) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", v12) & 1) != 0
      || (v13 = +[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes"),
          v14[0] = MEMORY[0x24BDAC760],
          v14[1] = 3221225472,
          v14[2] = __32__TIInputModeTableCell_subtitle__block_invoke,
          v14[3] = &unk_24E7324F8,
          v14[4] = NormalizedIdentifier,
          (unint64_t)objc_msgSend((id)objc_msgSend(v13, "indexesOfObjectsPassingTest:", v14), "count") <= 1)
      && (objc_msgSend((id)objc_msgSend(+[TIKeyboardListController softwareLayoutsForBaseInputMode:](TIKeyboardListController, "softwareLayoutsForBaseInputMode:", NormalizedIdentifier), "firstObject"), "isEqualToString:", v10) & 1) != 0)
    {
      v12 = 0;
    }
    if (TIInputModeIsChineseShuangpin())
      v12 = (void *)TIGetCurrentShuangpinName();
    if (!TIInputModeIsChineseWubi())
      goto LABEL_21;
    v11 = TIGetCurrentWubiStandardName();
  }
  v12 = (void *)v11;
LABEL_21:
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "assetStatusForInputMode:", v5) == 2)
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ASSETS_DOWNLOADING_PROGRESS_TITLE"), &stru_24E732B90, CFSTR("Keyboard"));
  else
    return v12;
}

uint64_t __32__TIInputModeTableCell_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetNormalizedIdentifier(), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw")), "length") != 0;
  return result;
}

- (BOOL)hasDownloadableAssets
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "assetStatusForInputMode:", -[UIKeyboardInputMode identifier](-[TIInputModeTableCell inputMode](self, "inputMode"), "identifier")) == 1;
}

- (void)addDownloadIcon
{
  void *v3;

  if (!-[TIInputModeTableCell accessoryView](self, "accessoryView"))
  {
    v3 = TIDownloadButton();
    objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_downloadButtonPressed_withEvent_, 64);
    -[TIInputModeTableCell setAccessoryView:](self, "setAccessoryView:", v3);
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager", a3, a4), "startDownloadingAssetsForInputMode:", -[UIKeyboardInputMode identifier](-[TIInputModeTableCell inputMode](self, "inputMode"), "identifier"));
}

- (UIKeyboardInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

@end
