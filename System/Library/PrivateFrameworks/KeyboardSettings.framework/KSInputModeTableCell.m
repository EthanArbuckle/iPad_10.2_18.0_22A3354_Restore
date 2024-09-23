@implementation KSInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (KSInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  KSInputModeTableCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KSInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[KSInputModeTableCell setInputMode:](v6, "setInputMode:", objc_msgSend(MEMORY[0x24BEBD6E8], "keyboardInputModeWithIdentifier:", objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75AC0])));
    -[KSInputModeTableCell updateLabels](v6, "updateLabels");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSInputModeTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)updateLabels
{
  objc_msgSend((id)-[KSInputModeTableCell textLabel](self, "textLabel"), "setText:", -[KSInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[KSInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[KSInputModeTableCell subtitle](self, "subtitle"));
  if (-[KSInputModeTableCell hasDownloadableAssets](self, "hasDownloadableAssets"))
    -[KSInputModeTableCell addDownloadIcon](self, "addDownloadIcon");
}

- (id)title
{
  int v3;
  UIKeyboardInputMode *v4;
  id v6;
  void *v7;

  v3 = -[UIKeyboardInputMode isExtensionInputMode](-[KSInputModeTableCell inputMode](self, "inputMode"), "isExtensionInputMode");
  v4 = -[KSInputModeTableCell inputMode](self, "inputMode");
  if (v3)
    return -[UIKeyboardInputMode safe__extendedDisplayName](v4, "safe__extendedDisplayName");
  -[UIKeyboardInputMode identifier](v4, "identifier");
  v6 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", -[UIKeyboardInputMode languageWithRegion](-[KSInputModeTableCell inputMode](self, "inputMode"), "languageWithRegion"));
  if (objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("kCFLocaleVariantCodeKey")), "length"))
  {
    v7 = (void *)TUIKeyboardTitle();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "length"))
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_LANGUAGE_%@_WITH_VARIANT_%@"), &stru_25107A038, CFSTR("Keyboard")), v6, v7);
  else
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
  void *v11;
  id v12;
  _QWORD v13[5];

  if (-[UIKeyboardInputMode isExtensionInputMode](-[KSInputModeTableCell inputMode](self, "inputMode"), "isExtensionInputMode"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"));
    return (id)objc_msgSend(v3, "displayNameForKey:value:", *MEMORY[0x24BDBCB20], -[UIKeyboardInputMode primaryLanguage](-[KSInputModeTableCell inputMode](self, "inputMode"), "primaryLanguage"));
  }
  else
  {
    v5 = -[UIKeyboardInputMode identifier](-[KSInputModeTableCell inputMode](self, "inputMode"), "identifier");
    NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
    v7 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", -[UIKeyboardInputMode languageWithRegion](-[KSInputModeTableCell inputMode](self, "inputMode"), "languageWithRegion"));
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
    if (objc_msgSend(v10, "length"))
      v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v10, &stru_25107A038, CFSTR("KeyboardLayouts"));
    else
      v11 = 0;
    if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0
      || (v12 = +[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"),
          v13[0] = MEMORY[0x24BDAC760],
          v13[1] = 3221225472,
          v13[2] = __32__KSInputModeTableCell_subtitle__block_invoke,
          v13[3] = &unk_251079A48,
          v13[4] = NormalizedIdentifier,
          (unint64_t)objc_msgSend((id)objc_msgSend(v12, "indexesOfObjectsPassingTest:", v13), "count") <= 1)
      && (objc_msgSend((id)objc_msgSend(+[KSKeyboardListController softwareLayoutsForBaseInputMode:](KSKeyboardListController, "softwareLayoutsForBaseInputMode:", NormalizedIdentifier), "firstObject"), "isEqualToString:", v10) & 1) != 0)
    {
      v11 = 0;
    }
    if (KSInputModeIsChineseShuangpin())
      v11 = (void *)KSGetCurrentShuangpinName();
    if (KSInputModeIsChineseWubi())
      v11 = (void *)KSGetCurrentWubiStandardName();
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "assetStatusForInputMode:", v5) == 2)
      return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ASSETS_DOWNLOADING_PROGRESS_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
    else
      return v11;
  }
}

uint64_t __32__KSInputModeTableCell_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetNormalizedIdentifier(), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("sw")), "length") != 0;
  return result;
}

- (BOOL)hasDownloadableAssets
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "assetStatusForInputMode:", -[UIKeyboardInputMode identifier](-[KSInputModeTableCell inputMode](self, "inputMode"), "identifier")) == 1;
}

- (void)addDownloadIcon
{
  void *v3;

  if (!-[KSInputModeTableCell accessoryView](self, "accessoryView"))
  {
    v3 = TIDownloadButton();
    objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_downloadButtonPressed_withEvent_, 64);
    -[KSInputModeTableCell setAccessoryView:](self, "setAccessoryView:", v3);
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager", a3, a4), "startDownloadingAssetsForInputMode:", -[UIKeyboardInputMode identifier](-[KSInputModeTableCell inputMode](self, "inputMode"), "identifier"));
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
