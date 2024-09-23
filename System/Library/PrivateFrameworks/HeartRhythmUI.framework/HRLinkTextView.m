@implementation HRLinkTextView

- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5
{
  return -[HRLinkTextView initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:](self, "initWithLinkRange:URLIdentifier:delegate:userInterfaceStyleChanged:", a3.location, a3.length, a4, a5, 0);
}

- (HRLinkTextView)initWithLinkRange:(_NSRange)a3 URLIdentifier:(int64_t)a4 delegate:(id)a5 userInterfaceStyleChanged:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  HRLinkTextView *v13;
  HRLinkTextView *v14;
  uint64_t v15;
  id userInterfaceStyleChanged;
  objc_super v18;

  length = a3.length;
  location = a3.location;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HRLinkTextView;
  v13 = -[HRLinkTextView init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_linkRange.location = location;
    v13->_linkRange.length = length;
    v13->_URLIdentifier = a4;
    objc_storeWeak((id *)&v13->_delegate, v11);
    v15 = MEMORY[0x2199E20AC](v12);
    userInterfaceStyleChanged = v14->_userInterfaceStyleChanged;
    v14->_userInterfaceStyleChanged = (id)v15;

    -[HRLinkTextView _setUpUI](v14, "_setUpUI");
    -[HRLinkTextView _setUpConstraints](v14, "_setUpConstraints");
  }

  return v14;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HRLinkTextView;
  -[HRLinkTextView layoutSubviews](&v3, sel_layoutSubviews);
  -[HRLinkTextView _updateCurrentUserInterfaceStyleIfNeeded](self, "_updateCurrentUserInterfaceStyleIfNeeded");
}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(id, HRLinkTextView *, uint64_t);

  -[HRLinkTextView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (-[HRLinkTextView currentUserInterfaceStyle](self, "currentUserInterfaceStyle") != v4)
  {
    -[HRLinkTextView setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", v4);
    -[HRLinkTextView userInterfaceStyleChanged](self, "userInterfaceStyleChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HRLinkTextView userInterfaceStyleChanged](self, "userInterfaceStyleChanged");
      v6 = (void (**)(id, HRLinkTextView *, uint64_t))objc_claimAutoreleasedReturnValue();
      v6[2](v6, self, v4);

    }
  }
}

- (void)linkTextViewTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  -[HRLinkTextView linkRange](self, "linkRange", a3);
  if (v4)
  {
    -[HRLinkTextView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutManager");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    -[HRLinkTextView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HRLinkTextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRLinkTextView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v34, "usedRectForTextContainer:", v7);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[HRLinkTextView textView](self, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;

    v27 = objc_msgSend(v34, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v7, 0, v11 - -(v15 - (v24 - v19) * 0.5), v13 - -(v17 - (v26 - v21) * 0.5));
    v28 = -[HRLinkTextView linkRange](self, "linkRange");
    if (v27 >= v28 && v27 - v28 < v29)
    {
      -[HRLinkTextView delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HRLinkTextView linkRange](self, "linkRange");
      objc_msgSend(v31, "linkTextView:didTapOnLinkInRange:", self, v32, v33);

    }
  }
}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;

  -[HRLinkTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  -[HRLinkTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setUpUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc_init(MEMORY[0x24BDF6EF8]);
  -[HRLinkTextView setTextView:](self, "setTextView:", v3);

  -[HRLinkTextView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  -[HRLinkTextView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[HRLinkTextView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectable:", 0);

  -[HRLinkTextView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditable:", 0);

  v8 = *MEMORY[0x24BDF7718];
  v9 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[HRLinkTextView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextContainerInset:", v8, v9, v10, v11);

  -[HRLinkTextView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRLinkTextView textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[HRLinkTextView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRLinkTextView addSubview:](self, "addSubview:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_linkTextViewTapped_);
  -[HRLinkTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v17);

  -[HRLinkTextView textView](self, "textView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[HRLinkTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addGestureRecognizer:", v18);

}

- (void)_setUpConstraints
{
  id v3;

  -[HRLinkTextView textView](self, "textView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignConstraintsWithView:", self);

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (int64_t)URLIdentifier
{
  return self->_URLIdentifier;
}

- (void)setURLIdentifier:(int64_t)a3
{
  self->_URLIdentifier = a3;
}

- (_NSRange)linkRange
{
  _NSRange *p_linkRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_linkRange = &self->_linkRange;
  location = self->_linkRange.location;
  length = p_linkRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (HRLinkTextViewDelegate)delegate
{
  return (HRLinkTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (id)userInterfaceStyleChanged
{
  return self->_userInterfaceStyleChanged;
}

- (void)setUserInterfaceStyleChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInterfaceStyleChanged, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
