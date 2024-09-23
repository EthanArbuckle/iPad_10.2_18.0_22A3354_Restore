@implementation PKPaletteKeyboardUtilities

+ (id)textInputResponderForEditing
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3958], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_responderForEditing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)textInputUndoManagerForEditing
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "textInputResponderForEditing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)textInputReturnKeyTypeForEditing
{
  void *v2;
  void *v3;
  int64_t v4;
  char v5;
  void *v6;
  char v7;

  objc_msgSend(a1, "textInputResponderForEditing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputUtilities textInputTraitsFromTextInput:](PKTextInputUtilities, "textInputTraitsFromTextInput:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "keyboardType") == 10)
  {
    v4 = 6;
  }
  else
  {
    v5 = objc_opt_respondsToSelector();
    v6 = v3;
    if ((v5 & 1) != 0 || (v7 = objc_opt_respondsToSelector(), v6 = v2, (v7 & 1) != 0))
      v4 = objc_msgSend(v6, "returnKeyType");
    else
      v4 = 0;
  }

  return v4;
}

+ (BOOL)isReturnKeyEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnKeyEnabled");

  return v3;
}

+ (void)performReturn
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performReturn");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textInputResponderForEditing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PKPaletteKeyboardUtilitiesDidPerformReturnNotification"), v4);

}

+ (id)combinedMenuFromKeyboardMenu:(id)a3 withLanguageMenu:(id)a4
{
  void *v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v4 = 0;
  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0DC39D0];
    v12[0] = a3;
    v12[1] = a4;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a4;
    v9 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuWithChildren:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
