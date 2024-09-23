@implementation UIResponder(UITextAccessibilityUtilities)

- (uint64_t)_accessibilityHasTextOperations
{
  id v3;
  BOOL v4;
  BOOL v5;
  id location;
  int v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  char v12;

  v11 = a1;
  v10 = a2;
  if ((AXIgnoresTextOperations() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v9 = 0;
    v5 = 1;
    if (AXRequestingClient() != 3)
      v5 = AXRequestingClient() == 4;
    v9 = v5;
    v8 = (id)objc_msgSend(v11, "_accessibilityTextViewTextOperationResponder");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ((objc_msgSend(v8, "canPerformAction:withSender:", sel_copy_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel_select_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel_captureTextFromCamera_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel_cut_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel_selectAll_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel__define_, 0) & 1) != 0
       || (objc_msgSend(v8, "canPerformAction:withSender:", sel__share_, 0) & 1) != 0
       || v9 && (objc_msgSend(v8, "canPerformAction:withSender:", sel_paste_, 0) & 1) != 0
       || !v9 && (objc_opt_respondsToSelector() & 1) != 0))
    {
      v12 = 1;
      v7 = 1;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && (-[UIResponder _accessibilitySupportsRichTextEditing](v11) & 1) != 0
           && ((objc_msgSend(v8, "canPerformAction:withSender:", sel_toggleItalics_, 0) & 1) != 0
            || (objc_msgSend(v8, "canPerformAction:withSender:", sel_toggleBoldface_, 0) & 1) != 0
            || (objc_msgSend(v8, "canPerformAction:withSender:", sel_toggleUnderline_, 0) & 1) != 0))
    {
      v12 = 1;
      v7 = 1;
    }
    else
    {
      v3 = (id)objc_msgSend(v8, "accessibilityMenuActions");
      v4 = objc_msgSend(v3, "count") == 0;

      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ((location = (id)objc_msgSend(v8, "undoManager"),
               (objc_msgSend(location, "canUndo") & 1) == 0)
           && (objc_msgSend(location, "canRedo") & 1) == 0
            ? (v7 = 0)
            : (v12 = 1, v7 = 1),
              objc_storeStrong(&location, 0),
              !v7))
        {
          v12 = 0;
          v7 = 1;
        }
      }
      else
      {
        v12 = 1;
        v7 = 1;
      }
    }
    objc_storeStrong(&v8, 0);
  }
  return v12 & 1;
}

- (id)_accessibilityTextOperations
{
  id v2;
  id v3;
  id location;
  char v6;
  id v7;
  id v8;
  int v9;
  id v10[2];
  void *v11;
  id v12;

  v11 = a1;
  v10[1] = a2;
  v10[0] = (id)objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (v2 = (id)objc_msgSend(v10[0], "_accessibilityTextViewTextOperationResponder"),
        v3 = v10[0],
        v10[0] = v2,
        v3,
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_msgSend(v10[0], "accessibilityMenuActions");
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v7);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_captureTextFromCamera_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF078]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_copy_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF018]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_select_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF080]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_cut_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF020]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_paste_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF060]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_delete_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF038]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__promptForReplace_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF070]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel_selectAll_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF088]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__define_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF030]);
    if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__share_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF090]);
    v6 = -[UIResponder _accessibilitySupportsRichTextEditing](v11) & 1;
    if (v6 && (objc_msgSend(v10[0], "canPerformAction:withSender:", sel_toggleItalics_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF048]);
    if ((v6 & 1) != 0 && (objc_msgSend(v10[0], "canPerformAction:withSender:", sel_toggleBoldface_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF010]);
    if ((v6 & 1) != 0 && (objc_msgSend(v10[0], "canPerformAction:withSender:", sel_toggleUnderline_, 0) & 1) != 0)
      objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF0B0]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      location = (id)objc_msgSend(v10[0], "undoManager");
      if ((objc_msgSend(location, "canUndo") & 1) != 0)
        objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF0B8]);
      if ((objc_msgSend(location, "canRedo") & 1) != 0)
        objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF068]);
      objc_storeStrong(&location, 0);
    }
    if (_AXSQuickSpeakEnabled())
    {
      if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__accessibilitySpeak_, 0) & 1) != 0
        || (objc_msgSend(v10[0], "canPerformAction:withSender:", sel__accessibilitySpeakLanguageSelection_, 0) & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF098]);
      }
      else if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__accessibilitySpeakSentence_, 0) & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF0A0]);
      }
      else if ((objc_msgSend(v10[0], "canPerformAction:withSender:", sel__accessibilitySpeakSpellOut_, 0) & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", *MEMORY[0x24BDFF0A8]);
      }
    }
    v12 = v8;
    v9 = 1;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v12 = 0;
    v9 = 1;
  }
  objc_storeStrong(v10, 0);
  return v12;
}

- (uint64_t)_accessibilityBeginUndoableTextInsertion
{
  char v3;
  id location;
  id v5;
  char v6;
  uint64_t v7;
  void *v8;

  v8 = a1;
  v7 = a2;
  v6 = 0;
  v5 = (id)objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    location = (id)objc_msgSend(v5, "undoManager");
    NSClassFromString(CFSTR("_UITextUndoManager"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(location, "beginUndoGrouping");
      v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  v3 = v6;
  objc_storeStrong(&v5, 0);
  return v3 & 1;
}

- (uint64_t)_accessibilityEndUndoableTextInsertion
{
  char v3;
  id location;
  id v5;
  char v6;
  uint64_t v7;
  void *v8;

  v8 = a1;
  v7 = a2;
  v6 = 0;
  v5 = (id)objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    location = (id)objc_msgSend(v5, "undoManager");
    NSClassFromString(CFSTR("_UITextUndoManager"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(location, "endUndoGrouping");
      v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  v3 = v6;
  objc_storeStrong(&v5, 0);
  return v3 & 1;
}

@end
