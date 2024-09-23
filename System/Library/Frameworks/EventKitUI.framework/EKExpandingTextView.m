@implementation EKExpandingTextView

- (EKExpandingTextView)initWithFrame:(CGRect)a3
{
  EKExpandingTextView *v3;
  EKExpandingTextView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UILabel *placeholderLabel;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKExpandingTextView;
  v3 = -[EKExpandingTextView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[EKExpandingTextView textLayoutManager](v3, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLimitsLayoutForSuspiciousContents:", 1);

    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    placeholderLabel = v4->_placeholderLabel;
    v4->_placeholderLabel = (UILabel *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_placeholderLabel, "setTextColor:", v9);

    -[EKExpandingTextView addSubview:](v4, "addSubview:", v4->_placeholderLabel);
    -[EKExpandingTextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    -[EKExpandingTextView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    v4->_allowEnclosingViewScroll = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel__updatePlaceholder, *MEMORY[0x1E0DC55A0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC55A0], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView dealloc](&v4, sel_dealloc);
}

- (void)setPlaceholder:(id)a3
{
  -[UILabel setText:](self->_placeholderLabel, "setText:", a3);
}

- (NSString)placeholder
{
  return -[UILabel text](self->_placeholderLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView layoutSubviews](&v14, sel_layoutSubviews);
  -[EKExpandingTextView visibleTextRect](self, "visibleTextRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[EKExpandingTextView textAlignment](self, "textAlignment"))
    v4 = v4 + 10.0;
  -[EKExpandingTextView font](self, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pointSize");
  *(float *)&v12 = v12 * 0.5;
  v13 = roundf(*(float *)&v12);

  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v4, v6 + v13, v8 + -10.0, v10 - v13);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  BOOL v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[EKExpandingTextView isFirstResponder](self, "isFirstResponder") && !objc_msgSend(v7, "type"))
  {
    -[EKExpandingTextView bounds](self, "bounds");
    v14 = CGRectInset(v13, 0.0, -20.0);
    v12.x = x;
    v12.y = y;
    v8 = CGRectContainsPoint(v14, v12);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)EKExpandingTextView;
    v8 = -[EKExpandingTextView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }
  v9 = v8;

  return v9;
}

- (void)_updatePlaceholder
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", -[EKExpandingTextView hasText](self, "hasText"));
}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[EKExpandingTextView _updatePlaceholder](self, "_updatePlaceholder");
}

- (void)setFont:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  v4 = a3;
  -[EKExpandingTextView setFont:](&v5, sel_setFont_, v4);
  -[UILabel setFont:](self->_placeholderLabel, "setFont:", v4, v5.receiver, v5.super_class);

}

- (void)setTextAlignment:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView setTextAlignment:](&v5, sel_setTextAlignment_);
  -[UILabel setTextAlignment:](self->_placeholderLabel, "setTextAlignment:", a3);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  v4 = a3;
  -[EKExpandingTextView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[UILabel setBackgroundColor:](self->_placeholderLabel, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  -[EKExpandingTextView contentSize](self, "contentSize");
  v7 = v6;
  v17.receiver = self;
  v17.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView setContentSize:](&v17, sel_setContentSize_, width, height);
  -[EKExpandingTextView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[EKExpandingTextView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "textViewShouldSignalContentSizeChange:", self);

    if (v11)
    {
      v12 = vabdd_f64(v7, height);
      -[EKExpandingTextView font](self, "font");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lineHeight");
      v15 = v14;

      if (v12 > v15)
      {
        -[EKExpandingTextView delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "textViewDidChangeContentHeight:", self);

      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double height;
  float v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView intrinsicContentSize](&v14, sel_intrinsicContentSize);
  v5 = v4;
  v6 = v3;
  height = self->_previousIntrinsicContentSize.height;
  if (v5 != self->_previousIntrinsicContentSize.width || v3 != height)
  {
    v9 = height;
    v10 = v3;
    if (vabds_f32(v9, v10) >= 0.00000011921)
    {
      -[EKExpandingTextView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "textViewDidChangeContentHeight:", self);

    }
    self->_previousIntrinsicContentSize.width = v5;
    self->_previousIntrinsicContentSize.height = v6;
  }
  v12 = v5;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)EKExpandingTextView;
  -[EKExpandingTextView sizeThatFits:](&v18, sel_sizeThatFits_);
  if (v6 > width)
  {
    v17.receiver = self;
    v17.super_class = (Class)EKExpandingTextView;
    -[EKExpandingTextView sizeThatFits:](&v17, sel_sizeThatFits_, width + -5.0, height);
  }
  v8 = v6;
  v9 = v7;
  v10 = self->_previousSizeThatFits.height;
  if (v8 != self->_previousSizeThatFits.width || v7 != v10)
  {
    v12 = v10;
    v13 = v7;
    if (vabds_f32(v12, v13) >= 0.00000011921)
    {
      -[EKExpandingTextView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "textViewDidChangeContentHeight:", self);

    }
    self->_previousSizeThatFits.width = v8;
    self->_previousSizeThatFits.height = v9;
  }
  v15 = v8;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_shouldScrollEnclosingScrollView
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (sel_toggleItalics_ == a3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)EKExpandingTextView;
  return -[EKExpandingTextView canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
}

@end
