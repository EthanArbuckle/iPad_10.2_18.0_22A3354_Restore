@implementation SLSheetTextComposeView

- (SLSheetTextComposeView)initWithFrame:(CGRect)a3
{
  SLSheetTextComposeView *v3;
  SLSheetTextComposeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLSheetTextComposeView;
  v3 = -[SLSheetTextComposeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SLSheetTextComposeView _assembleView](v3, "_assembleView");
  return v4;
}

- (void)_assembleView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *placeholderLabel;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  id v22;

  -[SLSheetTextComposeView setClipsToBounds:](self, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetTextComposeView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[SLSheetTextComposeView setOpaque:](self, "setOpaque:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
  -[SLSheetTextComposeView setTextView:](self, "setTextView:", v4);

  -[SLSheetTextComposeView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 0);

  -[SLSheetTextComposeView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetTextComposeView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[SLSheetTextComposeView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaque:", 0);

  -[SLSheetTextComposeView textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentMode:", 3);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetTextComposeView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[SLSheetTextComposeView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounces:", 1);

  -[SLSheetTextComposeView textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysBounceVertical:", 1);

  v15 = (UILabel *)objc_opt_new();
  placeholderLabel = self->_placeholderLabel;
  self->_placeholderLabel = v15;

  -[UILabel setNumberOfLines:](self->_placeholderLabel, "setNumberOfLines:", 0);
  v17 = self->_placeholderLabel;
  -[SLSheetTextComposeView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v17, "setFont:", v19);

  v20 = self->_placeholderLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "placeholderTextColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v20, "setTextColor:", v21);

  -[SLSheetTextComposeView addSubview:](self, "addSubview:", self->_placeholderLabel);
  -[SLSheetTextComposeView textView](self, "textView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[SLSheetTextComposeView addSubview:](self, "addSubview:", v22);

}

- (void)setTextRightInset:(double)a3
{
  self->_textRightInset = a3;
  -[SLSheetTextComposeView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[SLSheetTextComposeView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[SLSheetTextComposeView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)layoutSubviews
{
  int v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double MaxX;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  UILabel *placeholderLabel;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = -[SLSheetTextComposeView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[SLSheetTextComposeView textRightInset](self, "textRightInset");
  v5 = -v4;
  -[SLSheetTextComposeView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, v5);

  -[SLSheetTextComposeView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SLSheetTextComposeView textRightInset](self, "textRightInset");
  v16 = v12 - v15;
  if (v3)
  {
    -[SLSheetTextComposeView textRightInset](self, "textRightInset");
    v8 = v8 + v17;
  }
  -[SLSheetTextComposeView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v8, v10, v16, v14);

  if ((v3 & 1) != 0)
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v16;
    v25.size.height = v14;
    MaxX = CGRectGetMaxX(v25);
    -[UILabel frame](self->_placeholderLabel, "frame");
    v8 = MaxX - v20;
    v21 = -5.0;
  }
  else
  {
    v21 = 5.0;
  }
  -[UILabel frame](self->_placeholderLabel, "frame");
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v16, 1.79769313e308);
  v26.size.width = v22;
  v26.size.height = v23;
  placeholderLabel = self->_placeholderLabel;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v27 = CGRectOffset(v26, v21, 8.0);
  -[UILabel setFrame:](placeholderLabel, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
}

- (void)restoreKeyboard
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsCandidatesInline:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *placeholderLabel;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SLSheetTextComposeView;
  v4 = a3;
  -[SLSheetTextComposeView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[SLSheetTextComposeView traitCollection](self, "traitCollection", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetTextComposeView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    placeholderLabel = self->_placeholderLabel;
    -[SLSheetTextComposeView textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](placeholderLabel, "setFont:", v12);

    -[SLSheetTextComposeView setNeedsLayout](self, "setNeedsLayout");
    -[SLSheetTextComposeView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderLabel, a3);
}

- (double)textRightInset
{
  return self->_textRightInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
