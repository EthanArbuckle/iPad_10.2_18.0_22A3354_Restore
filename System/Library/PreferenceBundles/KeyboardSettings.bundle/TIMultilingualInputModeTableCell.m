@implementation TIMultilingualInputModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TIMultilingualInputModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  TIMultilingualInputModeTableCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIMultilingualInputModeTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6)
  {
    -[TIMultilingualInputModeTableCell setInputModes:](v6, "setInputModes:", objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75DA0]));
    -[TIMultilingualInputModeTableCell updateLabels](v6, "updateLabels");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIMultilingualInputModeTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)updateLabels
{
  objc_msgSend((id)-[TIMultilingualInputModeTableCell textLabel](self, "textLabel"), "setText:", -[TIMultilingualInputModeTableCell title](self, "title"));
  objc_msgSend((id)-[TIMultilingualInputModeTableCell detailTextLabel](self, "detailTextLabel"), "setText:", -[TIMultilingualInputModeTableCell subtitle](self, "subtitle"));
  if (-[TIMultilingualInputModeTableCell hasDownloadableAssets](self, "hasDownloadableAssets"))
    -[TIMultilingualInputModeTableCell addDownloadIcon](self, "addDownloadIcon");
}

- (id)title
{
  return TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(-[TIMultilingualInputModeTableCell inputModes](self, "inputModes"));
}

- (id)subtitle
{
  uint64_t LanguageCount;
  void *v3;
  const __CFString *v4;

  LanguageCount = TIUIMultilingualSetGetLanguageCount(-[TIMultilingualInputModeTableCell inputModes](self, "inputModes"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (LanguageCount == 2)
    v4 = CFSTR("BILINGUAL_KEYBOARD_TITLE_SHORT");
  else
    v4 = CFSTR("MULTILINGUAL_KEYBOARD_TITLE_SHORT");
  return (id)objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24E732B90, CFSTR("Keyboard"));
}

- (BOOL)hasDownloadableAssets
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TIMultilingualInputModeTableCell inputModes](self, "inputModes", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "assetStatusForInputMode:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
      if (v3 == 1)
        break;
      if (v4 == ++v6)
      {
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        return v3;
      }
    }
  }
  return v3;
}

- (void)addDownloadIcon
{
  void *v3;

  if (!-[TIMultilingualInputModeTableCell accessoryView](self, "accessoryView"))
  {
    v3 = TIDownloadButton();
    objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_downloadButtonPressed_withEvent_, 64);
    -[TIMultilingualInputModeTableCell setAccessoryView:](self, "setAccessoryView:", v3);
  }
}

- (void)downloadButtonPressed:(id)a3 withEvent:(id)a4
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[TIMultilingualInputModeTableCell inputModes](self, "inputModes", a3, a4, 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4D48], "sharedManager"), "startDownloadingAssetsForInputMode:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (NSArray)inputModes
{
  return self->_inputModes;
}

- (void)setInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

@end
