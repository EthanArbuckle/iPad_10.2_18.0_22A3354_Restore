@implementation UITextView(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_cnui_contactStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v5, "textColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTextColor:", v3);

  }
  if (objc_msgSend(v5, "keyboardAppearance"))
    objc_msgSend(a1, "setKeyboardAppearance:", objc_msgSend(v5, "keyboardAppearance"));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v4);

}

@end
