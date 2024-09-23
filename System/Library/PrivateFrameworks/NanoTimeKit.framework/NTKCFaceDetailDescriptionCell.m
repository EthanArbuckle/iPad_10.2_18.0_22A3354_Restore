@implementation NTKCFaceDetailDescriptionCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailDescriptionCell)init
{
  NTKCFaceDetailDescriptionCell *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailDescriptionCell;
  v2 = -[NTKCDetailTableViewCell init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[NTKCFaceDetailDescriptionCell setTextView:](v2, "setTextView:", v3);

    BPSDetailTextColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v2->_textView, "setTextColor:", v4);

    -[UITextView setBackgroundColor:](v2->_textView, "setBackgroundColor:", 0);
    -[UITextView setScrollEnabled:](v2->_textView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v2->_textView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v2->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setSelectable:](v2->_textView, "setSelectable:", 1);
    -[UITextView textContainer](v2->_textView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", 4);

    -[UITextView textContainer](v2->_textView, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](v2->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    NTKCActionColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTintColor:](v2->_textView, "setTintColor:", v7);

    -[UITextView setDelegate:](v2->_textView, "setDelegate:", v2);
    -[UITextView setClipsToBounds:](v2->_textView, "setClipsToBounds:", 0);
    -[NTKCFaceDetailDescriptionCell contentView](v2, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v2->_textView);

    -[NTKCFaceDetailDescriptionCell _fontSizeDidChange](v2, "_fontSizeDidChange");
  }
  return v2;
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setText:(id)a3
{
  -[UITextView setText:](self->_textView, "setText:", a3);
  -[NTKCFaceDetailDescriptionCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSAttributedString)attributedText
{
  return -[UITextView attributedText](self->_textView, "attributedText");
}

- (void)setAttributedText:(id)a3
{
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", a3);
  -[NTKCFaceDetailDescriptionCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)rowHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[NTKCFaceDetailDescriptionCell layoutIfNeeded](self, "layoutIfNeeded");
  -[UITextView font](self->_textView, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 13.5);
  v5 = v4;
  -[UITextView bounds](self->_textView, "bounds");
  v6 = v5 + CGRectGetHeight(v10);
  objc_msgSend(v3, "_scaledValueForValue:", 21.5);
  v8 = v6 + v7;

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)NTKCFaceDetailDescriptionCell;
  -[NTKCDetailTableViewCell layoutSubviews](&v22, sel_layoutSubviews);
  -[NTKCFaceDetailDescriptionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  -[NTKCFaceDetailDescriptionCell separatorInset](self, "separatorInset");
  v14 = Width + v13 * -2.0;
  -[UITextView frame](self->_textView, "frame");
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, 1.79769313e308);
  v16 = v15;
  -[NTKCFaceDetailDescriptionCell separatorInset](self, "separatorInset");
  v18 = v17;
  -[UITextView font](self->_textView, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_scaledValueForValue:", 13.5);
  v21 = v20;

  -[UITextView setFrame:](self->_textView, "setFrame:", v18, v21, v14, v16);
}

- (id)_fontDescriptor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_fontSizeDidChange
{
  void *v3;
  id v4;

  -[NTKCFaceDetailDescriptionCell _fontDescriptor](self, "_fontDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v3);
  -[NTKCFaceDetailDescriptionCell setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
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
}

@end
