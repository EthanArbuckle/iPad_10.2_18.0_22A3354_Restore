@implementation SFDialogTextView

- (SFDialogTextView)initWithFrame:(CGRect)a3
{
  SFDialogTextView *v3;
  SFDialogTextView *v4;
  NSString *message;
  UITextView *v6;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CAGradientLayer *topGradient;
  uint64_t v21;
  CAGradientLayer *bottomGradient;
  SFDialogTextView *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SFDialogTextView;
  v3 = -[SFDialogTextView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    message = v3->_message;
    v3->_message = (NSString *)&stru_1E21FE780;

    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v4->_textView;
    v4->_textView = v6;

    -[UITextView setAdjustsFontForContentSizeCategory:](v4->_textView, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setAlwaysBounceVertical:](v4->_textView, "setAlwaysBounceVertical:", 0);
    -[UITextView setAlwaysBounceHorizontal:](v4->_textView, "setAlwaysBounceHorizontal:", 0);
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", 0);
    -[UITextView setEditable:](v4->_textView, "setEditable:", 0);
    -[UITextView setKeyboardDismissMode:](v4->_textView, "setKeyboardDismissMode:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v4->_textView, "setTextColor:", v8);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setTextAlignment:](v4->_textView, "setTextAlignment:", 4);
    -[SFDialogTextView _updateFontStyling](v4, "_updateFontStyling");
    -[SFDialogTextView addSubview:](v4, "addSubview:", v4->_textView);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView centerXAnchor](v4->_textView, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextView centerXAnchor](v4, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    -[UITextView centerYAnchor](v4->_textView, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextView centerYAnchor](v4, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v10;
    -[UITextView widthAnchor](v4->_textView, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextView widthAnchor](v4, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v13;
    -[UITextView heightAnchor](v4->_textView, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDialogTextView heightAnchor](v4, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v17);

    -[SFDialogTextView layer](v4, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    newGradientLayer(0);
    v19 = objc_claimAutoreleasedReturnValue();
    topGradient = v4->_topGradient;
    v4->_topGradient = (CAGradientLayer *)v19;

    objc_msgSend(v18, "addSublayer:", v4->_topGradient);
    newGradientLayer(1);
    v21 = objc_claimAutoreleasedReturnValue();
    bottomGradient = v4->_bottomGradient;
    v4->_bottomGradient = (CAGradientLayer *)v21;

    objc_msgSend(v18, "addSublayer:", v4->_bottomGradient);
    v23 = v4;

  }
  return v4;
}

- (SFDialogTextView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFDialogTextView;
  return -[SFDialogTextView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (CGSize)intrinsicContentSize
{
  double preferredMaxLayoutWidth;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  if (preferredMaxLayoutWidth <= 0.0)
    preferredMaxLayoutWidth = 1.79769313e308;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", preferredMaxLayoutWidth);
  v4 = ceil(v3);
  v6 = ceil(v5);
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23.receiver = self;
  v23.super_class = (Class)SFDialogTextView;
  -[SFDialogTextView layoutSubviews](&v23, sel_layoutSubviews);
  -[SFDialogTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFDialogTextView contentInsets](self, "contentInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  gradientLayerColors(0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_topGradient, "setColors:", v20);

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[CAGradientLayer setFrame:](self->_topGradient, "setFrame:", v14, 0.0, CGRectGetWidth(v24) - v14 - v18, v12);
  gradientLayerColors(1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_bottomGradient, "setColors:", v21);

  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v22 = CGRectGetHeight(v25) - v16;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[CAGradientLayer setFrame:](self->_bottomGradient, "setFrame:", v14, v22, CGRectGetWidth(v26) - v14 - v18, v16);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v19);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
  }
  -[SFDialogTextView _updateTextContainerInset](self, "_updateTextContainerInset");
  -[SFDialogTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SFDialogTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextContainerInset
{
  id v3;

  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  -[UITextView textContainer](self->_textView, "textContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineFragmentPadding:", 0.0);

}

- (void)_updateText
{
  void *v3;
  void *v4;
  NSParagraphStyle *v5;
  NSParagraphStyle *titleParagraphStyle;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  UIFont *titleFont;
  uint64_t v12;
  NSParagraphStyle *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSString *v19;
  UIFont *messageFontWithTitle;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *message;
  UITextView *textView;
  char *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_title, "length") && !-[NSString length](self->_message, "length"))
  {
    -[UITextView setFont:](self->_textView, "setFont:", self->_messageFont);
    textView = self->_textView;
    message = &stru_1E21FE780;
    goto LABEL_13;
  }
  if (-[NSString length](self->_title, "length") && !-[NSString length](self->_message, "length"))
  {
    -[UITextView setFont:](self->_textView, "setFont:", self->_titleFont);
    -[UITextView setText:](self->_textView, "setText:", self->_title);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_textView, "setTextColor:");

    return;
  }
  if (!-[NSString length](self->_title, "length") && -[NSString length](self->_message, "length"))
  {
    -[UITextView setFont:](self->_textView, "setFont:", self->_messageFont);
    message = (const __CFString *)self->_message;
    textView = self->_textView;
LABEL_13:
    -[UITextView setText:](textView, "setText:", message);
    return;
  }
  -[UITextView setFont:](self->_textView, "setFont:", self->_messageFont, 448);
  if (!self->_titleParagraphStyle)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setParagraphSpacing:", 8.0);
    v5 = (NSParagraphStyle *)objc_msgSend(v4, "copy");
    titleParagraphStyle = self->_titleParagraphStyle;
    self->_titleParagraphStyle = v5;

  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[NSString stringByAppendingString:](self->_title, "stringByAppendingString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  v12 = *MEMORY[0x1E0DC1178];
  v30[0] = *MEMORY[0x1E0DC1138];
  v10 = v30[0];
  v30[1] = v12;
  v13 = self->_titleParagraphStyle;
  v32[0] = titleFont;
  v32[1] = v13;
  v31 = *MEMORY[0x1E0DC1140];
  v14 = v31;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v30, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v16);
  objc_msgSend(v7, "appendAttributedString:", v17);

  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19 = self->_message;
  messageFontWithTitle = self->_messageFontWithTitle;
  v28[1] = v14;
  v29[0] = messageFontWithTitle;
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v22);
  objc_msgSend(v7, "appendAttributedString:", v23);

  objc_msgSend(*(id *)&v26[(_QWORD)self], "setAttributedText:", v7);
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *title;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  title = self->_title;
  if (title != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](title, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_title, a3);
      -[SFDialogTextView _updateText](self, "_updateText");
      -[SFDialogTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      v5 = v8;
    }
  }

}

- (void)setMessage:(id)a3
{
  NSString *v5;
  NSString *message;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  message = self->_message;
  if (message != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](message, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_message, a3);
      -[SFDialogTextView _updateText](self, "_updateText");
      -[SFDialogTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      v5 = v8;
    }
  }

}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_preferredMaxLayoutWidth = a3;
    -[SFDialogTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_updateFontStyling
{
  uint64_t v3;
  UIFont *v4;
  UIFont *messageFont;
  UIFont *v6;
  UIFont *messageFontWithTitle;
  UIFont *v8;
  UIFont *titleFont;

  v3 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  messageFont = self->_messageFont;
  self->_messageFont = v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  messageFontWithTitle = self->_messageFontWithTitle;
  self->_messageFontWithTitle = v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v8;

  -[SFDialogTextView _updateText](self, "_updateText");
}

- (void)flashScrollIndicators
{
  -[UITextView flashScrollIndicators](self->_textView, "flashScrollIndicators");
}

- (NSString)message
{
  return self->_message;
}

- (UIFont)messageFont
{
  return self->_messageFont;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFont, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bottomGradient, 0);
  objc_storeStrong((id *)&self->_topGradient, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleParagraphStyle, 0);
  objc_storeStrong((id *)&self->_messageFontWithTitle, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
