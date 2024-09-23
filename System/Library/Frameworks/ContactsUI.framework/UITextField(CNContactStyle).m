@implementation UITextField(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_cnui_contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(a1, "isEnabled"))
      objc_msgSend(v2, "textColor");
    else
      objc_msgSend(v2, "readOnlyTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTextColor:", v5);

  }
  if (objc_msgSend(v2, "keyboardAppearance"))
    objc_msgSend(a1, "setKeyboardAppearance:", objc_msgSend(v2, "keyboardAppearance"));
  if (!v3)
  {
    objc_msgSend(v2, "textColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v14 = 0.0;
      v15 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      objc_msgSend(a1, "textColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v15, v14, v13, v12 * 0.5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(a1, "placeholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v3)
  {
    v16 = *MEMORY[0x1E0DC1140];
    v17[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(a1, "placeholder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v8);
    objc_msgSend(a1, "setAttributedPlaceholder:", v11);

  }
}

@end
