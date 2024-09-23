@implementation CNToneKitPickerStyleProvider

- (BOOL)tonePickerUsesOpaqueBackground
{
  void *v2;
  char v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesOpaqueBackground");

  return v3;
}

- (int64_t)tonePickerTableViewSeparatorStyle
{
  void *v2;
  int64_t v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "separatorStyle");

  return v3;
}

- (UIColor)tonePickerCustomTableSeparatorColor
{
  void *v2;
  void *v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (int64_t)tonePickerCustomTableSeparatorBackdropOverlayBlendMode
{
  uint64_t (*v2)(uint64_t);
  void *v3;
  int64_t v4;

  v2 = (uint64_t (*)(uint64_t))softLinkTKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2(objc_msgSend(v3, "separatorBackdropOverlayBlendMode"));

  return v4;
}

- (UIFont)tonePickerCellTextFont
{
  return 0;
}

- (UIColor)tonePickerCellTextColor
{
  void *v2;
  void *v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  void *v2;
  void *v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)tonePickerCellBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIColor *)v6;
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  if (!a3)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "blurSupported");

  if (v6)
    objc_msgSend(v4, "_setDrawsAsBackdropOverlayWithBlendMode:", 3);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedCellBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  return v4;
}

- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  UIImageGetTableNext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageFlippedForRightToLeftLayoutDirection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
  UIImageGetTableNext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNToneKitPickerStyleProvider tonePickerCellTextColor](self, "tonePickerCellTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightedImage:", v11);

  return v7;
}

- (BOOL)wantsCustomTonePickerHeaderView
{
  return 1;
}

- (UIFont)tonePickerHeaderTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (UIColor)tonePickerHeaderTextColor
{
  void *v2;
  void *v3;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return 0;
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = *MEMORY[0x1E0DC51A8];
  v3 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3 + 6.0;

  v5 = 14.0;
  v6 = 15.0;
  v7 = 15.0;
  v8 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)tonePickerHeaderTextShouldBeUppercase
{
  return 1;
}

@end
