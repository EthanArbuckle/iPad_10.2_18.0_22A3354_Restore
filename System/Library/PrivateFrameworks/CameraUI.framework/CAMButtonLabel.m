@implementation CAMButtonLabel

- (CAMButtonLabel)initWithFrame:(CGRect)a3
{
  CAMButtonLabel *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMButtonLabel;
  v3 = -[CAMButtonLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[CAMButtonLabel bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->__label;
    v3->__label = (UILabel *)v5;

    v7 = v3->__label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    v9 = v3->__label;
    +[CAMFont cameraFontForContentSize:](CAMFont, "cameraFontForContentSize:", *MEMORY[0x1E0DC4918]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = v3->__label;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setTextAlignment:](v3->__label, "setTextAlignment:", 0);
    -[CAMButtonLabel addSubview:](v3, "addSubview:", v3->__label);
  }
  return v3;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](text, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_text;
      self->_text = v7;

      -[CAMButtonLabel _updateAttributedText](self, "_updateAttributedText");
      -[CAMButtonLabel _updateInternalContentSize](self, "_updateInternalContentSize");
      v4 = v9;
    }
  }

}

- (void)_updateAttributedText
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[CAMButtonLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UILabel font](self->__label, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v4, "leading");
    objc_msgSend(v5, "setLineSpacing:");
    v6 = *MEMORY[0x1E0DC1178];
    v19[0] = *MEMORY[0x1E0DC1138];
    v19[1] = v6;
    v20[0] = v4;
    v20[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[CAMButtonLabel text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v7);

    if (-[CAMButtonLabel wantsLegibilityShadow](self, "wantsLegibilityShadow"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC1298]);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShadowColor:", v12);

      objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);
      objc_msgSend(v11, "setShadowBlurRadius:", 3.0);
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1198], v11, 0, objc_msgSend(v10, "length"));

    }
    +[CAMFormattingManager sharedManager](CAMFormattingManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "wantsCustomKerning");

    if (v14)
    {
      +[CAMFont cameraKerningForFont:](CAMFont, "cameraKerningForFont:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0DC1150];
      v18 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAttributes:range:", v16, 0, objc_msgSend(v10, "length"));

    }
    -[UILabel setAttributedText:](self->__label, "setAttributedText:", v10);

  }
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)wantsLegibilityShadow
{
  return self->_wantsLegibilityShadow;
}

- (void)_updateInternalContentSize
{
  CGSize *p_contentSize;
  double v4;
  double v5;

  p_contentSize = &self->_contentSize;
  -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  p_contentSize->width = v4;
  p_contentSize->height = v5;
  -[UILabel setFrame:](self->__label, "setFrame:", 0.0, 0.0, v4, v5);
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->__label, "setTextAlignment:", a3);
}

- (void)setWantsLegibilityShadow:(BOOL)a3
{
  if (self->_wantsLegibilityShadow != a3)
  {
    self->_wantsLegibilityShadow = a3;
    -[CAMButtonLabel _updateAttributedText](self, "_updateAttributedText");
  }
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->__label, "setTextColor:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->__label, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->__label, "textColor");
}

- (id)highlightedTextColor
{
  return -[UILabel highlightedTextColor](self->__label, "highlightedTextColor");
}

- (void)setHighlightedTextColor:(id)a3
{
  -[UILabel setHighlightedTextColor:](self->__label, "setHighlightedTextColor:", a3);
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->__label, "textAlignment");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMButtonLabel traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7 && (objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
  {
    +[CAMFont cameraFontForContentSize:](CAMFont, "cameraFontForContentSize:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->__label, "setFont:", v6);
    -[CAMButtonLabel _updateInternalContentSize](self, "_updateInternalContentSize");
    -[CAMButtonLabel _updateAttributedText](self, "_updateAttributedText");
    -[UILabel invalidateIntrinsicContentSize](self->__label, "invalidateIntrinsicContentSize");
    -[CAMButtonLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CAMButtonLabel setNeedsLayout](self, "setNeedsLayout");

  }
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UILabel)_label
{
  return self->__label;
}

@end
