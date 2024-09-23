@implementation SUUIGiftTextTableViewCell

- (SUUIGiftTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIGiftTextTableViewCell *v4;
  SUUIGiftTextTableViewCell *v5;
  void *v6;
  UIView *v7;
  UIView *bottomBorderView;
  UIView *v9;
  void *v10;
  UIView *v11;
  UIView *topBorderView;
  UIView *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SUUIGiftTextTableViewCell;
  v4 = -[SUUIGiftTextTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUIGiftTextTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomBorderView = v5->_bottomBorderView;
    v5->_bottomBorderView = v7;

    v9 = v5->_bottomBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    objc_msgSend(v6, "addSubview:", v5->_bottomBorderView);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topBorderView = v5->_topBorderView;
    v5->_topBorderView = v11;

    v13 = v5->_topBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    objc_msgSend(v6, "addSubview:", v5->_topBorderView);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_leftToRight = objc_msgSend(v15, "userInterfaceLayoutDirection") == 0;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextView setDelegate:](self->_textView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftTextTableViewCell;
  -[SUUIGiftTextTableViewCell dealloc](&v3, sel_dealloc);
}

+ (id)newTextView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v2, "setAlwaysBounceVertical:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v4);

  return v2;
}

- (NSString)label
{
  return -[UILabel text](self->_label, "text");
}

- (NSString)placeholder
{
  return -[UILabel text](self->_placeholderLabel, "text");
}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIGiftTextTableViewCell label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    label = self->_label;
    if (v15)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_label;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_label;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      -[UILabel sizeToFit](self->_label, "sizeToFit");
      -[SUUIGiftTextTableViewCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_label);
    }
    else
    {
      -[UILabel removeFromSuperview](label, "removeFromSuperview");
      v14 = self->_label;
      self->_label = 0;
    }

    -[SUUIGiftTextTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPlaceholder:(id)a3
{
  id v4;
  UILabel *placeholderLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIGiftTextTableViewCell placeholder](self, "placeholder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v15)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "placeholderTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setText:](placeholderLabel, "setText:");
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
      -[SUUIGiftTextTableViewCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_placeholderLabel);
    }
    else
    {
      -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
      v14 = self->_placeholderLabel;
      self->_placeholderLabel = 0;
    }

    -[SUUIGiftTextTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextView:(id)a3
{
  UITextView *v5;
  UITextView **p_textView;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  SUUIGiftTextTableViewCell *v11;
  UILabel *placeholderLabel;
  void *v13;
  UITextView *v14;

  v5 = (UITextView *)a3;
  p_textView = &self->_textView;
  textView = self->_textView;
  v14 = v5;
  if (textView != v5)
  {
    if (-[UITextView isDescendantOfView:](textView, "isDescendantOfView:", self))
      -[UITextView removeFromSuperview](*p_textView, "removeFromSuperview");
    -[UITextView setDelegate:](*p_textView, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_textView, a3);
    v5 = *p_textView;
  }
  if (v5)
  {
    -[UITextView superview](v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftTextTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      -[SUUIGiftTextTableViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:belowSubview:", *p_textView, self->_bottomBorderView);

    }
  }
  -[UITextView delegate](*p_textView, "delegate");
  v11 = (SUUIGiftTextTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v11 != self)
    -[UITextView setDelegate:](*p_textView, "setDelegate:", self);
  placeholderLabel = self->_placeholderLabel;
  -[UITextView text](*p_textView, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](placeholderLabel, "setHidden:", objc_msgSend(v13, "length") != 0);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
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
  double v15;
  _BOOL4 v16;
  UILabel *label;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  UILabel *placeholderLabel;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat MaxY;
  UITextView *textView;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  objc_super v56;
  _QWORD v57[2];
  CGRect v58;
  CGRect v59;

  v57[1] = *MEMORY[0x24BDAC8D0];
  v56.receiver = self;
  v56.super_class = (Class)SUUIGiftTextTableViewCell;
  -[SUUIGiftTextTableViewCell layoutSubviews](&v56, sel_layoutSubviews);
  -[SUUIGiftTextTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel frame](self->_label, "frame");
  v13 = v12;
  v15 = v14;
  v16 = -[SUUIGiftTextTableViewCell leftToRight](self, "leftToRight");
  label = self->_label;
  v55 = v11;
  v52 = v7;
  if (v16)
  {
    v18 = 12.0;
    v19 = 15.0;
    v20 = v13;
    v21 = v15;
    v22 = 15.0;
    v23 = 12.0;
  }
  else
  {
    v23 = 12.0;
    v22 = 15.0;
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, 12.0, v13, v15, v5, v7, v9, v11);
  }
  -[UILabel setFrame:](label, "setFrame:", v19, v18, v20, v21);
  -[UILabel frame](self->_placeholderLabel, "frame");
  v25 = v24;
  v58.origin.x = v22;
  v53 = v23;
  v58.origin.y = v23;
  v58.size.width = v13;
  v58.size.height = v15;
  v26 = CGRectGetMaxX(v58) + 5.0;
  v27 = v9;
  v54 = v9 + -15.0;
  v28 = v9 + -15.0 - v26;
  v29 = -[SUUIGiftTextTableViewCell leftToRight](self, "leftToRight");
  placeholderLabel = self->_placeholderLabel;
  v31 = 12.0;
  if (!v29)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v26, 12.0, v28, v25, v5, v52, v27);
    v26 = v32;
    v28 = v33;
    v25 = v34;
  }
  -[UILabel setFrame:](placeholderLabel, "setFrame:", v26, v31, v28, v25);
  -[UITextView frame](self->_textView, "frame");
  v59.origin.x = v22;
  v59.origin.y = v53;
  v59.size.width = v13;
  v59.size.height = v15;
  MaxY = CGRectGetMaxY(v59);
  -[UITextView setFrame:](self->_textView, "setFrame:", 10.0, MaxY + 3.0, v27 + -20.0, v55 + -10.0 - (MaxY + 3.0));
  textView = self->_textView;
  -[UILabel superview](self->_label, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView convertRect:fromView:](textView, "convertRect:fromView:", v37, v22, v53, v13, v15);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", v39, v41, v43, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self->_textView, "textContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setExclusionPaths:", v48);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "scale");
  v51 = 1.0 / v50;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v55 - v51, v27, v51);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 15.0, 0.0, v54, v51);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  if (self->_maximumCharacterCount < 1)
    return 1;
  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (unint64_t)objc_msgSend(v11, "length") <= self->_maximumCharacterCount;
  return v12;
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", 1);
}

- (void)textViewDidEndEditing:(id)a3
{
  UILabel *placeholderLabel;
  id v4;

  placeholderLabel = self->_placeholderLabel;
  -[UITextView text](self->_textView, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](placeholderLabel, "setHidden:", objc_msgSend(v4, "length") != 0);

}

- (int64_t)maximumCharacterCount
{
  return self->_maximumCharacterCount;
}

- (void)setMaximumCharacterCount:(int64_t)a3
{
  self->_maximumCharacterCount = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end
