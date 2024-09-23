@implementation TIHardwareInputModeTableCell

+ (int64_t)cellStyle
{
  return 1;
}

- (id)subtitle
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[UIKeyboardInputMode isExtensionInputMode](-[TIInputModeTableCell inputMode](self, "inputMode"), "isExtensionInputMode"))
  {
    v15.receiver = self;
    v15.super_class = (Class)TIHardwareInputModeTableCell;
    return -[TIInputModeTableCell subtitle](&v15, sel_subtitle);
  }
  else
  {
    v4 = (void *)-[UIKeyboardInputMode identifier](-[TIInputModeTableCell inputMode](self, "inputMode"), "identifier");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = +[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes", 0, 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v12;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(v4, "isEqualToString:", TIInputModeGetNormalizedIdentifier()))
        {
          v8 = (void *)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKey:", CFSTR("hw"));
          if (objc_msgSend(v8, "length"))
            break;
        }
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          if (v7)
            goto LABEL_5;
          return +[TIKeyboardListController displayNameForHardwareLayout:inputMode:](TIKeyboardListController, "displayNameForHardwareLayout:inputMode:", v8, -[TIInputModeTableCell inputMode](self, "inputMode"));
        }
      }
    }
    else
    {
      v8 = 0;
    }
    return +[TIKeyboardListController displayNameForHardwareLayout:inputMode:](TIKeyboardListController, "displayNameForHardwareLayout:inputMode:", v8, -[TIInputModeTableCell inputMode](self, "inputMode"));
  }
}

@end
