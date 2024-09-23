@implementation UILabel(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "_cnui_contactStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v7, "textColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTextColor:", v3);

  }
  objc_msgSend(v7, "highlightedTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "highlightedTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setHighlightedTextColor:", v5);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v6);

}

- (void)_cnui_applyContactStylePlaceholder
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "_cnui_contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "textColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v7 = 0.0;
      v8 = 0.0;
      v5 = 0.0;
      v6 = 0.0;
      objc_msgSend(a1, "textColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v8, v7, v6, v5 * 0.5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(a1, "setTextColor:", v3);

}

@end
