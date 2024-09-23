@implementation MFComposeFontSelectorButton

+ (id)buttonWithFont:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[MFComposeFontSelectorButton buttonWithType:](MFComposeFontSelectorButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentHorizontalAlignment:", 4);
  objc_msgSend(v4, "setContentVerticalAlignment:", 0);
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 4);

  objc_msgSend(v4, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v4, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBaselineAdjustment:", 1);

  objc_msgSend(v4, "setRepresentedFont:", v3);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BE0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:textStyle:scale:", CFSTR("chevron.forward"), *MEMORY[0x1E0DC4A88], 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v10, 0);

  return v4;
}

- (void)setRepresentedFont:(id)a3
{
  UIFont *v5;
  void *v6;
  void *v7;
  const __CTFont *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIFont *)a3;
  if (self->_representedFont != v5)
  {
    objc_storeStrong((id *)&self->_representedFont, a3);
    -[MFComposeFontSelectorButton titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    -[UIFont fontWithSize:](v5, "fontWithSize:");
    v8 = (const __CTFont *)objc_claimAutoreleasedReturnValue();

    if ((CTFontIsSystemUIFont() & 1) != 0 || CTFontIsTextStyleFont())
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FORMAT_DEFAULT_FONT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = (void *)CTFontCopyLocalizedName(v8, (CFStringRef)*MEMORY[0x1E0CA8308], 0);
    }
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v14 = *MEMORY[0x1E0DC1138];
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);

    -[MFComposeFontSelectorButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v13, 0);
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFComposeFontSelectorButton;
  -[MFComposeFontSelectorButton layoutSubviews](&v11, sel_layoutSubviews);
  v3 = -[MFComposeFontSelectorButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MFComposeFontSelectorButton frame](self, "frame");
  v5 = v4;
  -[MFComposeFontSelectorButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  if (v3 == 1)
  {
    -[MFComposeFontSelectorButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, 5.0, 0.0, v5 - (v7 + 5.0));

    -[MFComposeFontSelectorButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[MFComposeFontSelectorButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v9 + 10.0, 0.0, 5.0);
  }
  else
  {
    -[MFComposeFontSelectorButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v5 - (v7 + 5.0), 0.0, 5.0);

    -[MFComposeFontSelectorButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[MFComposeFontSelectorButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, v10 + 10.0);
  }

}

- (UIFont)representedFont
{
  return self->_representedFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedFont, 0);
}

@end
