@implementation EKEventDetailTextCell

- (EKEventDetailTextCell)initWithEvent:(id)a3 editable:(BOOL)a4 title:(id)a5 textFromEventBlock:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  EKEventDetailTextCell *v13;
  EKEventDetailTextCell *v14;
  void *v15;
  id textFromEventBlock;
  void *v17;
  objc_super v19;

  v8 = a4;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EKEventDetailTextCell;
  v13 = -[EKEventDetailCell initWithEvent:editable:](&v19, sel_initWithEvent_editable_, a3, v8);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a5);
    v15 = _Block_copy(v12);
    textFromEventBlock = v14->_textFromEventBlock;
    v14->_textFromEventBlock = v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EventDetails-%@"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTextCell setAccessibilityIdentifier:](v14, "setAccessibilityIdentifier:", v17);

  }
  return v14;
}

- (BOOL)update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;

  (*((void (**)(void))self->_textFromEventBlock + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length") || !CUIKShouldDisplayNotes())
  {
    -[EKEventDetailTextCell _textView](self, "_textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", 0);
    v16 = 0;
LABEL_8:

    goto LABEL_9;
  }
  -[EKEventDetailTextCell _textView](self, "_textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[EKEventDetailTextCell _textView](self, "_textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

  }
  -[EKEventDetailTextCell _textView](self, "_textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v5);

  if ((v15 & 1) == 0)
  {
    -[EKEventDetailTextCell _textView](self, "_textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v5);
    v16 = 1;
    goto LABEL_8;
  }
  v16 = v10 ^ 1;
LABEL_9:

  return v16;
}

- (id)_createNewTextView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v2, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLimitsLayoutForSuspiciousContents:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v4);

  objc_msgSend(v2, "setEditable:", 0);
  objc_msgSend(v2, "setDataDetectorTypes:", -1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v5);

  objc_msgSend(v2, "setScrollEnabled:", 0);
  objc_msgSend(v2, "setTextContainerInset:", 4.0, 0.0, 8.0, 0.0);
  objc_msgSend(v2, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  return v2;
}

- (id)_textView
{
  UITextView *textView;
  UITextView *v4;
  UITextView *v5;
  void *v6;

  textView = self->_textView;
  if (!textView)
  {
    -[EKEventDetailTextCell _createNewTextView](self, "_createNewTextView");
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textView;
    self->_textView = v4;

    -[EKEventDetailTextCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_textView);

    textView = self->_textView;
  }
  return textView;
}

- (id)_sizingTextView
{
  UITextView *sizingTextView;
  UITextView *v4;
  UITextView *v5;

  sizingTextView = self->_sizingTextView;
  if (!sizingTextView)
  {
    -[EKEventDetailTextCell _createNewTextView](self, "_createNewTextView");
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sizingTextView;
    self->_sizingTextView = v4;

    sizingTextView = self->_sizingTextView;
  }
  return sizingTextView;
}

- (id)_headerView
{
  EKEventDetailTextCellHeader *headerView;
  EKEventDetailTextCellHeader *v4;
  EKEventDetailTextCellHeader *v5;
  void *v6;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[EKEventDetailTextCellHeader initWithTitle:]([EKEventDetailTextCellHeader alloc], "initWithTitle:", self->_title);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[EKEventDetailTextCellHeader setDelegate:](self->_headerView, "setDelegate:", self);
    -[EKEventDetailTextCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_headerView);

    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setIsTruncatingText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 isTruncatingText;
  id v10;

  if (self->_isTruncatingText != a3)
  {
    v3 = a3;
    self->_isTruncatingText = a3;
    -[EKEventDetailTextCell _textView](self, "_textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
      v8 = 4;
    else
      v8 = 0;
    objc_msgSend(v6, "setLineBreakMode:", v8);

    isTruncatingText = self->_isTruncatingText;
    -[EKEventDetailTextCell _headerView](self, "_headerView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowsShowMoreLabel:", isTruncatingText);

  }
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTextCell;
  -[EKUITableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[EKEventDetailTextCell bounds](self, "bounds");
  -[EKEventDetailTextCell _layoutForWidth:](self, "_layoutForWidth:", v3);
}

- (double)_layoutForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned __int8 v35;
  CGRect v36;
  CGRect v37;

  -[EKEventDetailTextCell update](self, "update");
  v35 = 0;
  -[EKEventDetailTextCell _sizeForTextViewGivenWidth:outTruncatingText:](self, "_sizeForTextViewGivenWidth:outTruncatingText:", &v35, a3);
  v6 = v5;
  v8 = v7;
  -[EKEventDetailTextCell setIsTruncatingText:](self, "setIsTruncatingText:", v35);
  -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
  v10 = v9;
  -[EKEventDetailTextCell layoutMargins](self, "layoutMargins");
  v12 = a3 - v11;
  -[EKEventDetailTextCell layoutMargins](self, "layoutMargins");
  v14 = v12 - v13;
  -[EKEventDetailTextCell _headerView](self, "_headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", v14, 9999.0);
  v17 = v16;

  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[EKEventDetailTextCell safeAreaInsets](self, "safeAreaInsets");
    v21 = a3 - v20;
    -[EKEventDetailTextCell safeAreaInsets](self, "safeAreaInsets");
    v23 = v21 - v22;
    v36.origin.x = v18;
    v36.origin.y = v19;
    v36.size.width = v14;
    v36.size.height = v17;
    v24 = v23 - CGRectGetWidth(v36);
    -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
    v10 = v24 - v25;
  }
  -[EKEventDetailTextCellHeader setFrame:](self->_headerView, "setFrame:", v10, 11.0, v14, v17);
  v37.origin.y = 11.0;
  v37.origin.x = v10;
  v37.size.width = v14;
  v37.size.height = v17;
  Height = CGRectGetHeight(v37);
  -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
  v28 = v27;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    -[EKEventDetailTextCell safeAreaInsets](self, "safeAreaInsets");
    v30 = a3 - v29;
    -[EKEventDetailTextCell safeAreaInsets](self, "safeAreaInsets");
    v32 = v30 - v31 - v6;
    -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
    v28 = v32 - v33;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v28, Height + 11.0, v6, v8);
  return v8 + Height + 11.0;
}

- (CGSize)_sizeForTextViewGivenWidth:(double)a3 outTruncatingText:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  -[EKEventDetailTextCell _sizingTextView](self, "_sizingTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTextCell _textView](self, "_textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

  -[EKEventDetailTextCell _sizingTextView](self, "_sizingTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTextCell _textView](self, "_textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  -[EKEventDetailTextCell _sizingTextView](self, "_sizingTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTextCell layoutMargins](self, "layoutMargins");
  v15 = a3 - v14;
  -[EKEventDetailTextCell layoutMargins](self, "layoutMargins");
  objc_msgSend(v13, "sizeThatFits:", v15 - v16, 9999.0);
  v18 = v17;
  v20 = v19;

  v21 = v20 + -8.0;
  v22 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lineHeight");
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "descender");
  v28 = v27 + v25 * 10.0;

  if (v20 + -8.0 > v28)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "descender");
    v20 = v33 + v31 * 10.0;

  }
  if (a4)
    *a4 = v21 > v28;
  v34 = v18;
  v35 = v20;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKEventDetailTextCell;
  -[EKEventDetailCell layoutForWidth:position:](&v15, sel_layoutForWidth_position_, *(_QWORD *)&a4);
  -[EKEventDetailTextCell _layoutForWidth:](self, "_layoutForWidth:", a3);
  v7 = v6;
  -[EKEventDetailTextCell frame](self, "frame");
  v9 = v8;
  v11 = v10;
  if (self->_isTruncatingText)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descender");
    v14 = CalCeilToScreenScale(v7 + v13);

  }
  else
  {
    v14 = CalCeilToScreenScale(v7);
  }
  -[EKEventDetailTextCell setFrame:](self, "setFrame:", v9, v11, a3, v14);
}

- (void)cellHeaderTapped
{
  id v2;

  -[EKEventDetailTextCell delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestShowCellDetail");

}

- (BOOL)isTruncatingText
{
  return self->_isTruncatingText;
}

- (EKEventDetailTextCellDelegate)delegate
{
  return (EKEventDetailTextCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_sizingTextView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_textFromEventBlock, 0);
}

@end
