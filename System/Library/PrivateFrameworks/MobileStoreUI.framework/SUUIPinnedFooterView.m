@implementation SUUIPinnedFooterView

- (SUUIPinnedFooterView)initWithFrame:(CGRect)a3
{
  SUUIPinnedFooterView *v3;
  SUUIPinnedFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIPinnedFooterView;
  v3 = -[SUUIPinnedFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUUIPinnedFooterView _initializeTextView](v3, "_initializeTextView");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  -[SUUIPinnedFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SUUIPinnedFooterView horizontalPadding](self, "horizontalPadding");
  v8 = v4 + v7 * -2.0;
  -[SUUIPinnedFooterView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  v11 = v10;
  v13 = v12;

  -[SUUIPinnedFooterView horizontalPadding](self, "horizontalPadding");
  v15 = v14;
  -[SUUIPinnedFooterView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v15, v6 + -10.0 - v13, v11, v13);

  v17.receiver = self;
  v17.super_class = (Class)SUUIPinnedFooterView;
  -[SUUIPinnedFooterView layoutSubviews](&v17, sel_layoutSubviews);
}

- (void)setAttributedText:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v6 = (NSAttributedString *)a3;
  if (self->_attributedText != v6)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    -[SUUIPinnedFooterView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v6);

    -[SUUIPinnedFooterView _configureTextViewTextStyling](self, "_configureTextViewTextStyling");
  }

}

- (void)_configureTextViewTextStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SUUIPinnedFooterView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  -[SUUIPinnedFooterView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  -[SUUIPinnedFooterView textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)_initializeTextView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  -[SUUIPinnedFooterView setTextView:](self, "setTextView:", v3);

  -[SUUIPinnedFooterView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataDetectorTypes:", 2);

  -[SUUIPinnedFooterView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[SUUIPinnedFooterView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditable:", 0);

  -[SUUIPinnedFooterView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextContainerInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));

  -[SUUIPinnedFooterView _configureTextViewTextStyling](self, "_configureTextViewTextStyling");
  -[SUUIPinnedFooterView contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIPinnedFooterView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
