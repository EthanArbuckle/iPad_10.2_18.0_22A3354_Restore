@implementation UITextAccessibilityNSObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityCopy
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_copy_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "copy:", 0);
  }
  else
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    objc_msgSend(v2, "copyOperation");

  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityScanText
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_captureTextFromCamera_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "captureTextFromCamera:", 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityCut
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_cut_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "cut:", 0);
  }
  else
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    objc_msgSend(v2, "cutOperation");

  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySelect
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_select_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "select:", 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityDelete
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_delete_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "delete:", 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityReplace
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "_promptForReplace:", 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityPaste
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_paste_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "paste:", 0);
  }
  else
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    objc_msgSend(v2, "pasteOperation");

  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityDefine
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_lookup_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "performSelector:withObject:", sel_lookup_, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityShare
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__share_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "performSelector:withObject:", sel__share_, 0);
  }
  objc_storeStrong(location, 0);
}

- (uint64_t)_accessibilityFontTraitEnabled:(void *)a3 enabledValue:
{
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  id location;
  id v30;
  char v31;

  v30 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v28 = 0;
  objc_storeStrong(&v28, a3);
  if (v30)
  {
    v26 = (id)objc_msgSend(v30, "_accessibilityTextViewTextOperationResponder");
    v25 = 0;
    if ((objc_msgSend(v26, "_accessibilityIsWebDocumentView") & 1) != 0)
    {
      v3 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("_webView"));
      v4 = v25;
      v25 = v3;

      v14 = (id)objc_msgSend(v25, "typingStyle");
      v7 = (id)objc_msgSend(v14, "getPropertyValue:", location);
      v31 = objc_msgSend(v7, "isEqualToString:", v28) & 1;

      v27 = 1;
      objc_storeStrong(&v14, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = 0;
        objc_opt_class();
        v12 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("attributedText"));
        v22 = (id)__UIAccessibilityCastAsClass();

        v21 = v22;
        objc_storeStrong(&v22, 0);
        v24 = v21;
        v5 = objc_alloc(MEMORY[0x24BDFEA60]);
        v20 = (id)objc_msgSend(v5, "initWithStringOrAttributedString:", v24);
        v19 = (id)objc_msgSend(v20, "coalescedFontAttributes");
        v17 = 0;
        objc_opt_class();
        v11 = (id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BEBB360]);
        v16 = (id)__UIAccessibilityCastAsClass();

        v15 = v16;
        objc_storeStrong(&v16, 0);
        v18 = v15;
        if ((objc_msgSend(v28, "isEqualToString:", CFSTR("bold")) & 1) != 0)
        {
          v10 = (id)objc_msgSend(v18, "fontDescriptor");
          v31 = (objc_msgSend(v10, "symbolicTraits") & 2) == 2;

          v27 = 1;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("italic")) & 1) != 0)
        {
          v9 = (id)objc_msgSend(v18, "fontDescriptor");
          v31 = (objc_msgSend(v9, "symbolicTraits") & 1) == 1;

          v27 = 1;
        }
        else
        {
          if ((objc_msgSend(v28, "isEqualToString:", CFSTR("underline")) & 1) != 0)
          {
            v8 = (id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BEBB440]);
            v31 = (int)objc_msgSend(v8, "intValue") > 0;

          }
          else
          {
            v31 = 0;
          }
          v27 = 1;
        }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v24, 0);
      }
      else
      {
        v31 = 0;
        v27 = 1;
      }
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v31 = 0;
    v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&location, 0);
  return v31 & 1;
}

- (void)_accessibilityPostStyleOptionStatus:(uint64_t)a1
{
  id argument;
  int v3;
  id location;
  uint64_t v5;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    argument = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location);
    objc_msgSend(argument, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC18]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
    objc_storeStrong(&argument, 0);
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_accessibilityBold
{
  id v2;
  char v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8[2];
  UITextAccessibilityNSObjectAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8[0], "canPerformAction:withSender:", sel_toggleBoldface_, 0) & 1) != 0)
  {
    objc_msgSend(v8[0], "performSelector:withObject:", sel_toggleBoldface_, 0);
    v5 = 0;
    v3 = 0;
    if ((-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, CFSTR("font-weight"), CFSTR("bold")) & 1) != 0)
    {
      v6 = accessibilityLocalizedString(CFSTR("bold.enabled"));
      v5 = 1;
      v2 = v6;
    }
    else
    {
      v4 = accessibilityLocalizedString(CFSTR("bold.disabled"));
      v3 = 1;
      v2 = v4;
    }
    v7 = v2;
    if ((v3 & 1) != 0)

    if ((v5 & 1) != 0)
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilityItalic
{
  id v2;
  char v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8[2];
  UITextAccessibilityNSObjectAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8[0], "canPerformAction:withSender:", sel_toggleItalics_, 0) & 1) != 0)
  {
    objc_msgSend(v8[0], "performSelector:withObject:", sel_toggleItalics_, 0);
    v5 = 0;
    v3 = 0;
    if ((-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, CFSTR("font-style"), CFSTR("italic")) & 1) != 0)
    {
      v6 = accessibilityLocalizedString(CFSTR("italic.enabled"));
      v5 = 1;
      v2 = v6;
    }
    else
    {
      v4 = accessibilityLocalizedString(CFSTR("italic.disabled"));
      v3 = 1;
      v2 = v4;
    }
    v7 = v2;
    if ((v3 & 1) != 0)

    if ((v5 & 1) != 0)
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilitySpeakSentence
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__accessibilitySpeakSentence_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "performSelector:withObject:", sel__accessibilitySpeakSentence_, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySpeakSpellOut
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__accessibilitySpeakSpellOut_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "performSelector:withObject:", sel__accessibilitySpeakSpellOut_, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySpeak
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__accessibilitySpeak_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "performSelector:withObject:", sel__accessibilitySpeak_, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityUnderline
{
  id v2;
  char v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8[2];
  UITextAccessibilityNSObjectAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8[0], "canPerformAction:withSender:", sel_toggleUnderline_, 0) & 1) != 0)
  {
    objc_msgSend(v8[0], "performSelector:withObject:", sel_toggleUnderline_, 0);
    v5 = 0;
    v3 = 0;
    if ((-[UITextAccessibilityNSObjectAccessibility _accessibilityFontTraitEnabled:enabledValue:](v9, CFSTR("-webkit-text-decorations-in-effect"), CFSTR("underline")) & 1) != 0)
    {
      v6 = accessibilityLocalizedString(CFSTR("underline.enabled"));
      v5 = 1;
      v2 = v6;
    }
    else
    {
      v4 = accessibilityLocalizedString(CFSTR("underline.disabled"));
      v3 = 1;
      v2 = v4;
    }
    v7 = v2;
    if ((v3 & 1) != 0)

    if ((v5 & 1) != 0)
    -[UITextAccessibilityNSObjectAccessibility _accessibilityPostStyleOptionStatus:]((uint64_t)v9, v7);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)_accessibilitySelectAll
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel_selectAll_, 0) & 1) != 0)
  {
    objc_msgSend(location[0], "selectAll:", 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityMoveUp
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__moveUp_withHistory_, 0) & 1) != 0)
  {
    AXPerformSafeBlock();
  }
  objc_storeStrong(location, 0);
}

void __64__UITextAccessibilityNSObjectAccessibility__accessibilityMoveUp__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  objc_msgSend(v0, "performTextOperationActionSelector:", NSSelectorFromString(CFSTR("moveUp:")));

}

- (void)_accessibilityMoveDown
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(location[0], "canPerformAction:withSender:", sel__moveDown_withHistory_, 0) & 1) != 0)
  {
    AXPerformSafeBlock();
  }
  objc_storeStrong(location, 0);
}

void __66__UITextAccessibilityNSObjectAccessibility__accessibilityMoveDown__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  objc_msgSend(v0, "performTextOperationActionSelector:", NSSelectorFromString(CFSTR("moveDown:")));

}

- (void)_accessibilityUndo
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(location[0], "undoManager");
    objc_msgSend(v2, "undo");

  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityRedo
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextAccessibilityNSObjectAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(location[0], "undoManager");
    objc_msgSend(v2, "redo");

  }
  objc_storeStrong(location, 0);
}

@end
