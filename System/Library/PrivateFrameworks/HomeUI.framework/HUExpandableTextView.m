@implementation HUExpandableTextView

- (HUExpandableTextView)initWithFrame:(CGRect)a3
{
  HUExpandableTextView *v3;
  HUExpandableTextView *v4;
  id v5;
  uint64_t v6;
  UITextView *textView;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HUExpandableTextView;
  v3 = -[HUExpandableTextView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfLines = 2;
    v3->_expanded = 1;
    v3->_fitsWithinLineLimit = 0;
    v3->_languageDirection = 1;
    v5 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    -[UITextView setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v4->_textView, "setEditable:", 0);
    -[UITextView textContainer](v4->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

    -[UITextView textContainer](v4->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    v10 = *MEMORY[0x1E0CEB4B0];
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], v11, v12, v13);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", v10, v11, v12, v13);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v14);

    -[UITextView setDataDetectorTypes:](v4->_textView, "setDataDetectorTypes:", 7);
    -[UITextView setTextAlignment:](v4->_textView, "setTextAlignment:", 4);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[UITextView setContentCompressionResistancePriority:forAxis:](v4->_textView, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    LODWORD(v16) = 1132068864;
    -[UITextView setContentHuggingPriority:forAxis:](v4->_textView, "setContentHuggingPriority:forAxis:", 1, v16);
    -[HUExpandableTextView addSubview:](v4, "addSubview:", v4->_textView);
    v17 = (void *)objc_opt_new();
    -[UITextView topAnchor](v4->_textView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView topAnchor](v4, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    -[UITextView bottomAnchor](v4->_textView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView bottomAnchor](v4, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v23);

    -[UITextView leadingAnchor](v4->_textView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView leadingAnchor](v4, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v26);

    -[UITextView trailingAnchor](v4->_textView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView trailingAnchor](v4, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v29);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unint64_t v8;
  UIButton *moreButton;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  -[HUExpandableTextView moreButtonLayoutConstraints](self, "moreButtonLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[UIButton frame](self->_moreButton, "frame");
    -[UIButton setFrame:](self->_moreButton, "setFrame:");
    -[UIButton widthAnchor](self->_moreButton, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_moreButton, "frame");
    objc_msgSend(v5, "constraintEqualToConstant:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v8 = -[HUExpandableTextView languageDirection](self, "languageDirection");
    moreButton = self->_moreButton;
    if (v8 == 1)
    {
      -[UIButton leftAnchor](moreButton, "leftAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUExpandableTextView rightAnchor](self, "rightAnchor");
    }
    else
    {
      -[UIButton rightAnchor](moreButton, "rightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUExpandableTextView leftAnchor](self, "leftAnchor");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton frame](self->_moreButton, "frame");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[UIButton firstBaselineAnchor](self->_moreButton, "firstBaselineAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastBaselineAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUExpandableTextView setMoreButtonLayoutConstraints:](self, "setMoreButtonLayoutConstraints:", v4);

  }
  v18.receiver = self;
  v18.super_class = (Class)HUExpandableTextView;
  -[HUExpandableTextView updateConstraints](&v18, sel_updateConstraints);
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HUExpandableTextView;
  -[HUExpandableTextView layoutSubviews](&v29, sel_layoutSubviews);
  -[HUExpandableTextView moreButton](self, "moreButton");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HUExpandableTextView isExpanded](self, "isExpanded");

    if (!v5)
    {
      -[HUExpandableTextView textView](self, "textView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMaximumNumberOfLines:", 0);

      -[HUExpandableTextView textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUExpandableTextView bounds](self, "bounds");
      objc_msgSend(v8, "sizeThatFits:", v9, 3.40282347e38);
      v11 = v10;

      v12 = -[HUExpandableTextView numberOfLines](self, "numberOfLines");
      -[HUExpandableTextView textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaximumNumberOfLines:", v12);

      -[HUExpandableTextView textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUExpandableTextView bounds](self, "bounds");
      objc_msgSend(v15, "sizeThatFits:", v16, 3.40282347e38);
      v18 = v17;

      if (!-[HUExpandableTextView alwaysShowMoreButtonUnlessExpanded](self, "alwaysShowMoreButtonUnlessExpanded"))
      {
        v19 = v18;
        v20 = v11;
        if (vabdd_f64(ceilf(v20), ceilf(v19)) < 2.22044605e-16)
        {
          -[HUExpandableTextView setFitsWithinLineLimit:](self, "setFitsWithinLineLimit:", 1);
          -[HUExpandableTextView textView](self, "textView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "textContainer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setMaximumNumberOfLines:", 0);

          -[HUExpandableTextView moreButton](self, "moreButton");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v25 = 1;
LABEL_9:
          objc_msgSend(v23, "setHidden:", v25);

          return;
        }
      }
      if (-[HUExpandableTextView alwaysShowMoreButtonUnlessExpanded](self, "alwaysShowMoreButtonUnlessExpanded")
        || -[HUExpandableTextView fitsWithinLineLimit](self, "fitsWithinLineLimit"))
      {
        -[HUExpandableTextView setFitsWithinLineLimit:](self, "setFitsWithinLineLimit:", 0);
        v26 = -[HUExpandableTextView numberOfLines](self, "numberOfLines");
        -[HUExpandableTextView textView](self, "textView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "textContainer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setMaximumNumberOfLines:", v26);

        -[HUExpandableTextView moreButton](self, "moreButton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = 0;
        goto LABEL_9;
      }
    }
  }
}

- (void)_resetMoreButtonLayoutConstraints
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUExpandableTextView moreButtonLayoutConstraints](self, "moreButtonLayoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUExpandableTextView setMoreButtonLayoutConstraints:](self, "setMoreButtonLayoutConstraints:", 0);
  -[HUExpandableTextView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setMoreButton:(id)a3
{
  UIButton *v5;
  UIButton **p_moreButton;
  UIButton *moreButton;
  UIButton *v8;

  v5 = (UIButton *)a3;
  p_moreButton = &self->_moreButton;
  moreButton = self->_moreButton;
  if (moreButton != v5)
  {
    v8 = v5;
    -[UIButton removeTarget:action:forControlEvents:](moreButton, "removeTarget:action:forControlEvents:", self, sel_moreButtonTapped_, 64);
    -[UIButton removeFromSuperview](*p_moreButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_moreButton, a3);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](*p_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUExpandableTextView addSubview:](self, "addSubview:", *p_moreButton);
    -[UIButton addTarget:action:forControlEvents:](*p_moreButton, "addTarget:action:forControlEvents:", self, sel_moreButtonTapped_, 64);
    -[HUExpandableTextView setExpanded:](self, "setExpanded:", 0);
    -[HUExpandableTextView _resetMoreButtonLayoutConstraints](self, "_resetMoreButtonLayoutConstraints");
    v5 = v8;
  }

}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 expanded;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  expanded = self->_expanded;
  self->_expanded = a3;
  if (a3)
  {
    -[HUExpandableTextView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", 0);

    -[HUExpandableTextView moreButton](self, "moreButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    if (!expanded)
    {
      -[HUExpandableTextView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[HUExpandableTextView delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "expandableTextViewDidExpand:", self);
LABEL_8:

      }
    }
  }
  else
  {
    v11 = -[HUExpandableTextView numberOfLines](self, "numberOfLines");
    -[HUExpandableTextView textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaximumNumberOfLines:", v11);

    -[HUExpandableTextView moreButton](self, "moreButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 0);

    if (expanded)
    {
      -[HUExpandableTextView delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[HUExpandableTextView delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "expandableTextViewDidCollapse:", self);
        goto LABEL_8;
      }
    }
  }
  -[HUExpandableTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)moreButtonTapped:(id)a3
{
  -[HUExpandableTextView setExpanded:](self, "setExpanded:", 1);
}

- (void)_updateLanguageDirection
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  CFRange v15;

  -[HUExpandableTextView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUExpandableTextView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HUExpandableTextView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15.length = objc_msgSend(v8, "length");
    v15.location = 0;
    v9 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v6, v15);

    -[HUExpandableTextView setLanguageDirection:](self, "setLanguageDirection:", objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v9));
  }
  else
  {
    -[HUExpandableTextView setLanguageDirection:](self, "setLanguageDirection:", 1);
  }
  objc_opt_class();
  -[HUExpandableTextView moreButton](self, "moreButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = -[HUExpandableTextView languageDirection](self, "languageDirection") == 2;
  -[HUExpandableTextView textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", 2 * v13);

  objc_msgSend(v12, "setShouldFadeRightToLeft:", v13);
  -[HUExpandableTextView _resetMoreButtonLayoutConstraints](self, "_resetMoreButtonLayoutConstraints");
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HFStringGenerator *stringGenerator;
  id v12;

  v12 = a3;
  -[HUExpandableTextView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqualToString:", v5);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v12)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[HUExpandableTextView textAttributes](self, "textAttributes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", v12, v4);
    }
    else
    {
      v9 = 0;
    }
    -[HUExpandableTextView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v9);

    if (v12)
    {

    }
    stringGenerator = self->_stringGenerator;
    self->_stringGenerator = 0;

    -[HUExpandableTextView _updateLanguageDirection](self, "_updateLanguageDirection");
    -[HUExpandableTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v7 = v12;
  }

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[HUExpandableTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  HFStringGenerator *stringGenerator;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUExpandableTextView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v12, "mutableCopy");
    -[HUExpandableTextView textAttributes](self, "textAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttributes:range:", v9, 0, objc_msgSend(v8, "length"));

    -[HUExpandableTextView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v8);

    stringGenerator = self->_stringGenerator;
    self->_stringGenerator = 0;

    -[HUExpandableTextView _updateLanguageDirection](self, "_updateLanguageDirection");
    -[HUExpandableTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  }
}

- (NSAttributedString)attributedText
{
  void *v2;
  void *v3;

  -[HUExpandableTextView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setStringGenerator:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_stringGenerator) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stringGenerator, v3);
    if (v7)
    {
      -[HUExpandableTextView textAttributes](self, "textAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithAttributes:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[HUExpandableTextView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v5);

    if (v7)
    {

    }
    -[HUExpandableTextView _updateLanguageDirection](self, "_updateLanguageDirection");
    -[HUExpandableTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)setNumberOfLines:(unint64_t)a3
{
  void *v5;
  void *v6;

  self->_numberOfLines = a3;
  if (!-[HUExpandableTextView isExpanded](self, "isExpanded"))
  {
    -[HUExpandableTextView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", a3);

    -[HUExpandableTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (double)heightForWidth:(double)a3
{
  void *v4;
  double v5;
  float v6;
  double v7;

  -[HUExpandableTextView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  v6 = v5;
  v7 = ceilf(v6);

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = *MEMORY[0x1E0CEBDE0];
  -[HUExpandableTextView bounds](self, "bounds");
  -[HUExpandableTextView heightForWidth:](self, "heightForWidth:", v4);
  v6 = v5;
  v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (HFStringGenerator)stringGenerator
{
  return self->_stringGenerator;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (BOOL)alwaysShowMoreButtonUnlessExpanded
{
  return self->_alwaysShowMoreButtonUnlessExpanded;
}

- (void)setAlwaysShowMoreButtonUnlessExpanded:(BOOL)a3
{
  self->_alwaysShowMoreButtonUnlessExpanded = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (HUExpandableTextViewDelegate)delegate
{
  return (HUExpandableTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)fitsWithinLineLimit
{
  return self->_fitsWithinLineLimit;
}

- (void)setFitsWithinLineLimit:(BOOL)a3
{
  self->_fitsWithinLineLimit = a3;
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (NSArray)moreButtonLayoutConstraints
{
  return self->_moreButtonLayoutConstraints;
}

- (void)setMoreButtonLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonLayoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_stringGenerator, 0);
}

@end
