@implementation HKMedicalIDEditorMultilineStringCell

- (HKMedicalIDEditorMultilineStringCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorMultilineStringCell *v4;
  UILabel *v5;
  UILabel *labelLabel;
  void *v7;
  UITextView *v8;
  UITextView *textView;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *placeholderLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  v4 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelLabel = v4->_labelLabel;
    v4->_labelLabel = v5;

    HKHealthKeyColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_labelLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](v4->_labelLabel, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v4->_labelLabel, "setNumberOfLines:", 0);
    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v4->_textView;
    v4->_textView = v8;

    -[UITextView setDelegate:](v4->_textView, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v10);

    -[UITextView setContentInset:](v4->_textView, "setContentInset:", -5.0, 0.0, -5.0, 0.0);
    -[UITextView setTextAlignment:](v4->_textView, "setTextAlignment:", 4);
    -[UITextView setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v4->_textView, "setTextColor:", v11);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    placeholderLabel = v4->_placeholderLabel;
    v4->_placeholderLabel = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_placeholderLabel, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v4->_placeholderLabel, "setTextAlignment:", 4);
    -[HKMedicalIDEditorMultilineStringCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_labelLabel);

    -[HKMedicalIDEditorMultilineStringCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_textView);

    -[HKMedicalIDEditorMultilineStringCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_placeholderLabel);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__labelTapped_);
    -[UILabel addGestureRecognizer:](v4->_labelLabel, "addGestureRecognizer:", v18);
    -[UILabel setUserInteractionEnabled:](v4->_labelLabel, "setUserInteractionEnabled:", 1);
    -[HKMedicalIDEditorMultilineStringCell setAccessoryType:](v4, "setAccessoryType:", 0);
    -[HKMedicalIDEditorMultilineStringCell _contentSizeCategoryDidChange:](v4, "_contentSizeCategoryDidChange:", 0);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextView setDelegate:](self->_textView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  -[HKMedicalIDEditorCell dealloc](&v3, sel_dealloc);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  -[HKMedicalIDEditorCell _contentSizeCategoryDidChange:](&v7, sel__contentSizeCategoryDidChange_, a3);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_labelLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_textView, "setFont:", v5);

  -[UITextView font](self->_textView, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_placeholderLabel, "setFont:", v6);

}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  -[HKMedicalIDEditorMultilineStringCell layoutSubviews](&v34, sel_layoutSubviews);
  v3 = -[UIView hk_isLeftToRight](self, "hk_isLeftToRight");
  -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
  v5 = v4;
  -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
  v6 = 0.0;
  if (v7 > 0.0)
  {
    -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
    v9 = v8;
    -[HKMedicalIDEditorMultilineStringCell separatorInset](self, "separatorInset");
    v6 = v9 + v10 + -16.0;
  }
  v11 = v5 + 9.0;
  if (v3)
  {
    v12 = v6 + 16.0;
    -[HKMedicalIDEditorMultilineStringCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14 - (v6 + 16.0) - 14.0;
  }
  else
  {
    -[HKMedicalIDEditorMultilineStringCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v15 = v17 - (v6 + 16.0) - 14.0;

    -[HKMedicalIDEditorMultilineStringCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v12 = v18 - v15 + -16.0 - v6;
  }

  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v15, 100000.0);
  v20 = v19;
  v35.origin.x = v12;
  v35.origin.y = v11;
  v35.size.width = v15;
  v35.size.height = v20;
  MaxY = CGRectGetMaxY(v35);
  if (v3)
  {
    v22 = v12 + -5.0;
  }
  else
  {
    v36.origin.x = v12;
    v36.origin.y = v11;
    v36.size.width = v15;
    v36.size.height = v20;
    v22 = CGRectGetMaxX(v36) - (v15 + 10.0) + 5.0;
  }
  v33 = v22;
  v23 = MaxY + -4.0;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v15 + 10.0, 100000.0, *(_QWORD *)&v11);
  v25 = v24;
  -[UITextView font](self->_textView, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lineHeight");
  v28 = v27 + 20.0;

  if (v25 < v28)
    v25 = v28;
  -[UILabel font](self->_placeholderLabel, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineHeight");
  v31 = v30;

  HKUIRectIntegralToScreenScale(v12, v32, v15, v20);
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  HKUIRectIntegralToScreenScale(v33, v23, v15 + 10.0, v25);
  -[UITextView setFrame:](self->_textView, "setFrame:");
  HKUIRectIntegralToScreenScale(v12, v23 + 8.0, v15, v31);
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  UITextView *textView;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;

  width = a3.width;
  -[UITextView frame](self->_textView, "frame", a3.width, a3.height);
  v6 = v5;
  textView = self->_textView;
  -[UITextView bounds](textView, "bounds");
  -[UITextView sizeThatFits:](textView, "sizeThatFits:", CGRectGetWidth(v17), 100000.0);
  v9 = v8;
  -[UITextView font](self->_textView, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11 + 20.0;

  if (v9 >= v12)
    v13 = v9;
  else
    v13 = v12;
  v14 = v6 + v13 + 23.0;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (double)estimatedHeightWithWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v27;

  -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
  v5 = 16.0;
  if (v6 > 0.0)
  {
    -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
    v8 = v7;
    -[HKMedicalIDEditorMultilineStringCell separatorInset](self, "separatorInset");
    v5 = v8 + v9 + -16.0 + 16.0;
  }
  -[HKMedicalIDEditorMultilineStringCell textViewExtraMargins](self, "textViewExtraMargins");
  v11 = v10 + 9.0;
  v12 = a3 - v5 - 14.0;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v12, 100000.0);
  v27.size.height = v13;
  v14 = v5 + -5.0;
  v27.origin.x = v5;
  v27.origin.y = v11;
  v27.size.width = v12;
  v15 = CGRectGetMaxY(v27) + -4.0;
  v16 = v12 + 10.0;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v16, 100000.0);
  v18 = v17;
  -[UITextView font](self->_textView, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lineHeight");
  v21 = v20 + 20.0;

  if (v18 >= v21)
    v22 = v18;
  else
    v22 = v21;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  return CGRectGetMaxY(*(CGRect *)(&v22 - 3)) + 23.0;
}

+ (BOOL)showsLabelAndValue
{
  return 0;
}

- (void)setLabel:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_labelLabel, "setText:", v4);

}

- (id)label
{
  return -[UILabel text](self->_labelLabel, "text");
}

- (void)setStringValue:(id)a3
{
  UITextView *textView;
  id v5;
  uint64_t v6;

  textView = self->_textView;
  v5 = a3;
  -[UITextView setText:](textView, "setText:", v5);
  v6 = objc_msgSend(v5, "length");

  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", v6 != 0);
}

- (NSString)stringValue
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setPlaceholder:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_placeholderLabel, "setText:", v4);

}

- (NSString)placeholder
{
  return -[UILabel text](self->_placeholderLabel, "text");
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (CGRect)_cursorRectForTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxX;
  double MaxY;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat Width;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForPosition:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v4, "bounds");
  MaxX = CGRectGetMaxX(v29);
  if (MaxX < v8)
    v8 = MaxX;
  objc_msgSend(v4, "bounds");
  MaxY = CGRectGetMaxY(v30);
  if (MaxY < v10)
    v10 = MaxY;
  objc_msgSend(v4, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.width = v18;
  v31.size.height = v20;
  Width = CGRectGetWidth(v31);
  -[UITextView font](self->_textView, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointSize");
  v24 = v23;

  v25 = v8;
  v26 = v10;
  v27 = Width;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)textViewDidChangeSelection:(id)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmpty");

  if (v5)
  {
    -[HKMedicalIDEditorMultilineStringCell _cursorRectForTextView:](self, "_cursorRectForTextView:", v15);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
    objc_msgSend(WeakRetained, "medicalIDEditorCellDidChangeSelection:keepRectVisible:inView:", self, v15, v7, v9, v11, v13);

  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  -[HKMedicalIDEditorCell beginEditing](&v8, sel_beginEditing);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HKMedicalIDEditorMultilineStringCell_textViewDidBeginEditing___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __64__HKMedicalIDEditorMultilineStringCell_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_cursorRectForTextView:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(WeakRetained, "medicalIDEditorCellDidBeginEditing:keepRectVisible:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, v5, v7, v9);

}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  id v15;
  CGRect v16;

  v15 = a3;
  -[HKMedicalIDEditorMultilineStringCell setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(v15, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(v4, "length") != 0);

  objc_msgSend(v15, "bounds");
  objc_msgSend(v15, "sizeThatFits:", CGRectGetWidth(v16), 100000.0);
  if (self->_lastSeenTextViewContentHeight != v5)
  {
    self->_lastSeenTextViewContentHeight = v5;
    -[HKMedicalIDEditorMultilineStringCell _cursorRectForTextView:](self, "_cursorRectForTextView:", v15);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
    objc_msgSend(WeakRetained, "medicalIDEditorCell:didChangeHeight:keepRectVisible:inView:", self, v15, self->_lastSeenTextViewContentHeight, v7, v9, v11, v13);

  }
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorMultilineStringCell setStringValue:](self, "setStringValue:", v4);

  -[HKMedicalIDEditorCell valueDidChange](self, "valueDidChange");
}

- (void)_labelTapped:(id)a3
{
  -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder", a3);
}

- (void)commitEditing
{
  -[UITextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (UITextView)textView
{
  return self->_textView;
}

- (HKMedicalIDEditorCellHeightChangeDelegate)heightChangeDelegate
{
  return (HKMedicalIDEditorCellHeightChangeDelegate *)objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
}

- (void)setHeightChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_heightChangeDelegate, a3);
}

- (UIEdgeInsets)textViewExtraMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textViewExtraMargins.top;
  left = self->_textViewExtraMargins.left;
  bottom = self->_textViewExtraMargins.bottom;
  right = self->_textViewExtraMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextViewExtraMargins:(UIEdgeInsets)a3
{
  self->_textViewExtraMargins = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heightChangeDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end
