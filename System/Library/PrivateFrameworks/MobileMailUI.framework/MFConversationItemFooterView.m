@implementation MFConversationItemFooterView

- (MFConversationItemFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MFConversationItemFooterView *v7;
  MFConversationItemFooterView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIButton *seeMoreButton;
  uint64_t v18;
  UIButton *revealActionsButton;
  UIButton *v20;
  void *v21;
  uint64_t v22;
  UIButton *undoSendButton;
  void *v24;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)MFConversationItemFooterView;
  v7 = -[MFConversationItemFooterView initWithFrame:](&v26, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[MFConversationItemFooterView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B70]);
    -[MFConversationItemFooterView setInsetsLayoutMarginsFromSafeArea:](v8, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewFooterBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConversationItemFooterView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3998]), "initWithDelegate:", 0);
    -[MFConversationItemFooterView addInteraction:](v8, "addInteraction:", v10);
    -[MFConversationItemFooterView layer](v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    v12 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1100);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithEffect:", v13);

    objc_msgSend(v14, "setFrame:", x, y, width, height);
    objc_msgSend(v14, "setClipsToBounds:", 1);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFConversationItemFooterView setBackgroundView:](v8, "setBackgroundView:", v14);
    -[MFConversationItemFooterView backgroundView](v8, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

    -[MFConversationItemFooterView addSubview:](v8, "addSubview:", v14);
    -[MFConversationItemFooterView _updateBackgroundView](v8, "_updateBackgroundView");
    -[MFConversationItemFooterView _seeMoreButton](v8, "_seeMoreButton");
    v16 = objc_claimAutoreleasedReturnValue();
    seeMoreButton = v8->_seeMoreButton;
    v8->_seeMoreButton = (UIButton *)v16;

    -[MFConversationItemFooterView addSubview:](v8, "addSubview:", v8->_seeMoreButton);
    -[UIButton sizeToFit](v8->_seeMoreButton, "sizeToFit");
    -[MFConversationItemFooterView _updateSeeMoreButton](v8, "_updateSeeMoreButton");
    objc_msgSend(MEMORY[0x1E0DC3518], "mf_revealActionsButtonWithAccessibilityIdentifier:", *MEMORY[0x1E0D46B78]);
    v18 = objc_claimAutoreleasedReturnValue();
    revealActionsButton = v8->_revealActionsButton;
    v8->_revealActionsButton = (UIButton *)v18;

    v20 = v8->_revealActionsButton;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v8);
    -[UIButton addInteraction:](v20, "addInteraction:", v21);

    -[MFConversationItemFooterView addSubview:](v8, "addSubview:", v8->_revealActionsButton);
    if (_os_feature_enabled_impl())
    {
      -[MFConversationItemFooterView _undoSendButton](v8, "_undoSendButton");
      v22 = objc_claimAutoreleasedReturnValue();
      undoSendButton = v8->_undoSendButton;
      v8->_undoSendButton = (UIButton *)v22;

      -[MFConversationItemFooterView addSubview:](v8, "addSubview:", v8->_undoSendButton);
      -[UIButton sizeToFit](v8->_undoSendButton, "sizeToFit");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v8, sel__fontMetricCacheDidInvalidate_, *MEMORY[0x1E0CC67D0], 0);

    -[MFConversationItemFooterView _updateButtons](v8, "_updateButtons");
    -[MFConversationItemFooterView setNeedsLayout](v8, "setNeedsLayout");

  }
  return v8;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left + -7.0, a3.bottom, a3.right + -7.0);
}

- (ConversationSearchOverlayView)findOverlayView
{
  ConversationSearchOverlayView *findOverlayView;
  ConversationSearchOverlayView *v4;
  ConversationSearchOverlayView *v5;
  ConversationSearchOverlayView *v6;

  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    v4 = [ConversationSearchOverlayView alloc];
    -[MFConversationItemFooterView bounds](self, "bounds");
    v5 = -[ConversationSearchOverlayView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    -[MFConversationItemFooterView addSubview:](self, "addSubview:", self->_findOverlayView);
    findOverlayView = self->_findOverlayView;
  }
  return findOverlayView;
}

- (void)_updateBackgroundView
{
  _BOOL8 v3;
  id v4;

  v3 = -[MFConversationItemFooterView shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
  -[MFConversationItemFooterView backgroundView](self, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (id)_seeMoreButton
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -1102263091;
  objc_msgSend(v2, "setCharge:", v3);
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTextColorFollowsTintColor:", 1);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 4);

  objc_msgSend((id)objc_opt_class(), "prefixFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SEE_MORE"), &stru_1E9A04480, CFSTR("Main"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v9, 0);

  objc_msgSend(v2, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B80]);
  return v2;
}

- (id)_undoSendButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTouchInsets:", -20.0, -20.0, 20.0, 20.0);
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  objc_msgSend((id)objc_opt_class(), "prefixFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNDO_SEND_BUTTON_TITLE"), &stru_1E9A04480, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v8, 0);

  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B88]);
  objc_msgSend(v3, "setHidden:", 1);

  return v3;
}

- (void)_updateSeeMoreButton
{
  MFConversationItemFooterView *v3;
  _BOOL8 v4;
  int v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  id v9;

  if (-[MFConversationItemFooterView isSemiExpanded](self, "isSemiExpanded"))
  {
    v3 = self;
    v4 = 0;
LABEL_11:
    -[MFConversationItemFooterView setSeeMoreButtonHidden:](v3, "setSeeMoreButtonHidden:", v4);
    return;
  }
  v5 = _os_feature_enabled_impl();
  v6 = -[MFConversationItemFooterView messageContainsBlockQuotes](self, "messageContainsBlockQuotes");
  if (!v5)
  {
    v4 = !v6 || -[MFConversationItemFooterView blockquotesAreExpanded](self, "blockquotesAreExpanded");
    v3 = self;
    goto LABEL_11;
  }
  if (v6 && !-[MFConversationItemFooterView blockquotesAreExpanded](self, "blockquotesAreExpanded"))
  {
    -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isHidden") ^ 1;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 1;
  }
  -[MFConversationItemFooterView setSeeMoreButtonHidden:](self, "setSeeMoreButtonHidden:", v8);
  if (v7)

}

- (void)setSeeMoreButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isSeeMoreButtonHidden
{
  void *v2;
  char v3;

  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (BOOL)isRevealActionsButtonHidden
{
  void *v2;
  char v3;

  -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setUndoSendButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

    v8 = v3 ^ 1;
    -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

    -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", v8);

    -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isUndoSendButtonHidden
{
  void *v2;
  char v3;

  -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setSeeMoreButtonAlpha:(double)a3
{
  id v4;

  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (double)seeMoreButtonAlpha
{
  void *v2;
  double v3;
  double v4;

  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setMessageContainsBlockQuotes:(BOOL)a3
{
  self->_messageContainsBlockQuotes = a3;
  -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");
}

- (void)setBlockquotesAreExpanded:(BOOL)a3
{
  self->_blockquotesAreExpanded = a3;
  -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");
}

- (double)seeMoreButtonHeight
{
  void *v2;
  double Height;
  CGRect v5;

  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Height = CGRectGetHeight(v5);

  return Height;
}

- (void)setIsSemiExpanded:(BOOL)a3
{
  if (self->_isSemiExpanded != a3)
  {
    self->_isSemiExpanded = a3;
    -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");
  }
}

- (void)setDisplayMetrics:(id)a3
{
  MFMessageDisplayMetrics **p_displayMetrics;
  int v6;
  int v7;
  id v8;

  p_displayMetrics = &self->_displayMetrics;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", *p_displayMetrics) & 1) == 0)
  {
    v6 = -[MFMessageDisplayMetrics usePhoneLandscapeSymbolConfiguration](*p_displayMetrics, "usePhoneLandscapeSymbolConfiguration");
    v7 = objc_msgSend(v8, "usePhoneLandscapeSymbolConfiguration");
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    if (v6 != v7)
      -[MFConversationItemFooterView _updateButtons](self, "_updateButtons");
    -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)addTarget:(id)a3 action:(SEL)a4 toButton:(int64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  switch(a5)
  {
    case 2:
      -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", v9, a4, 64);
      goto LABEL_7;
    case 1:
      -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", v9, a4, 64);
      goto LABEL_7;
    case 0:
      -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", v9, a4, 64);
LABEL_7:

      break;
  }

}

- (void)showAttributionWithSenderName:(id)a3
{
  id v4;

  v4 = a3;
  -[MFConversationItemFooterView setSenderName:](self, "setSenderName:");
  -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");

}

- (void)hideAttribution
{
  id v3;

  -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");
  -[MFConversationItemFooterView setSenderName:](self, "setSenderName:", 0);
  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedTitle:forState:", 0, 0);

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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView layoutSubviews](&v30, sel_layoutSubviews);
  -[MFConversationItemFooterView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[MFConversationItemFooterView displayMetrics](self, "displayMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "estimatedFooterViewHeight");
  v11 = v10;

  -[MFConversationItemFooterView setFrame:](self, "setFrame:", v4, v6, v8, v11);
  -[MFConversationItemFooterView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MFConversationItemFooterView backgroundView](self, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[MFConversationItemFooterView layoutActionButtonWithBounds:](self, "layoutActionButtonWithBounds:", v13, v15, v17, v19);
  -[MFConversationItemFooterView layoutSeeMoreButton](self, "layoutSeeMoreButton");
  if (_os_feature_enabled_impl())
    -[MFConversationItemFooterView layoutUndoSendButton](self, "layoutUndoSendButton");
  -[MFConversationItemFooterView currentYOffset](self, "currentYOffset");
  -[MFConversationItemFooterView moveOriginYByOffset:](self, "moveOriginYByOffset:");
  if (self->_findOverlayView)
  {
    -[MFConversationItemFooterView bounds](self, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[MFConversationItemFooterView findOverlayView](self, "findOverlayView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  }
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  void *v8;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[MFConversationItemFooterView bounds](self, "bounds", a4);
  v10.x = x;
  v10.y = y;
  if (CGRectContainsPoint(v12, v10))
    return 1;
  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v11.x = x;
  v11.y = y;
  v7 = CGRectContainsPoint(v13, v11);

  return v7;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFConversationItemFooterView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v16 = CGRectGetHeight(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v17 = v16 - CGRectGetHeight(v21);
  if (v17 < 0.0)
    v17 = -v17;
  if (v17 >= 2.22044605e-16)
  {
    -[MFConversationItemFooterView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "footerViewDidChangeHeight:", self);

  }
}

- (void)layoutSeeMoreButton
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  id v20;
  MFConversationItemFooterView *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double Width;
  double v27;
  double v28;
  double MaxX;
  double MinX;
  double v31;
  CGFloat v32;
  double x;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat rect;
  _QWORD v39[4];
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    -[MFConversationItemFooterView bounds](self, "bounds");
    if (v4 != 0.0)
    {
      objc_msgSend(v3, "frame");
      rect = v5;
      v7 = v6;
      v9 = v8;
      -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      -[MFConversationItemFooterView displayMetrics](self, "displayMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "footerViewTopToBaseline");
      v20 = v3;
      v21 = self;
      objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __calculateYForSeeMoreButton_block_invoke;
      v39[3] = &unk_1E9A03318;
      v23 = v20;
      v40 = v23;
      objc_msgSend(v22, "cachedFloat:forKey:", v39, CFSTR("footerView.seeMoreButton.labelBaselineFromTop"));

      UIRoundToViewScale();
      v25 = v24;

      if (-[MFConversationItemFooterView effectiveUserInterfaceLayoutDirection](v21, "effectiveUserInterfaceLayoutDirection") == 1)
      {
        v36 = v12;
        v37 = v18;
        -[MFConversationItemFooterView layoutMargins](v21, "layoutMargins");
        -[MFConversationItemFooterView bounds](v21, "bounds");
        CGRectGetWidth(v41);
        v42.origin.x = v7;
        v42.origin.y = v25;
        v42.size.width = rect;
        v42.size.height = v9;
        CGRectGetWidth(v42);
        -[MFConversationItemFooterView bounds](v21, "bounds");
        Width = CGRectGetWidth(v43);
        -[MFConversationItemFooterView layoutMargins](v21, "layoutMargins");
        v28 = v27;
        v44.origin.x = v36;
        v44.size.height = v37;
        v44.origin.y = v14;
        v44.size.width = v16;
        MaxX = CGRectGetMaxX(v44);
        MinX = Width - v28;
      }
      else
      {
        -[MFConversationItemFooterView layoutMargins](v21, "layoutMargins");
        v32 = v31;
        v45.origin.x = v12;
        v45.origin.y = v14;
        v45.size.width = v16;
        v45.size.height = v18;
        MinX = CGRectGetMinX(v45);
        v46.origin.x = v32;
        v46.origin.y = v25;
        v46.size.width = rect;
        v46.size.height = v9;
        MaxX = CGRectGetMinX(v46);
      }
      UIRoundToViewScale();
      x = v47.origin.x;
      v47.origin.y = v25;
      v47.size.width = rect;
      v47.size.height = v9;
      v34 = CGRectGetWidth(v47);
      if (v34 >= MinX - (MaxX + 10.0))
        v35 = MinX - (MaxX + 10.0);
      else
        v35 = v34;
      objc_msgSend(v23, "setFrame:", x, v25, v35, v9);
      v48.origin.x = x;
      v48.origin.y = v25;
      v48.size.width = v35;
      v48.size.height = v9;
      -[MFConversationItemFooterView setDefaultSeeMoreButtonOriginY:](v21, "setDefaultSeeMoreButtonOriginY:", CGRectGetMinY(v48));
    }
  }

}

- (void)layoutUndoSendButton
{
  void *v3;
  double v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    -[MFConversationItemFooterView bounds](self, "bounds");
    if (v4 != 0.0
      && -[UIButton isHidden](self->_seeMoreButton, "isHidden")
      && -[UIButton isHidden](self->_revealActionsButton, "isHidden"))
    {
      objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v5 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v3, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConversationItemFooterView leadingAnchor](self, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      objc_msgSend(v3, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConversationItemFooterView centerXAnchor](self, "centerXAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v15;
      objc_msgSend(v3, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConversationItemFooterView topAnchor](self, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v6;
      objc_msgSend(v3, "centerYAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConversationItemFooterView centerYAnchor](self, "centerYAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v9;
      objc_msgSend(v3, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFConversationItemFooterView trailingAnchor](self, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[4] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activateConstraints:", v13);

    }
  }

}

- (BOOL)shouldHideStickyFooterView
{
  void *v2;
  char v3;

  -[MFConversationItemFooterView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mf_hasCompactDimension");

  return v3;
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MFConversationItemFooterView displayMetrics](self, "displayMetrics", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasCompactLayout"))
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory)
      v7 = 2;
    else
      v7 = 1;
  }
  else
  {

    v7 = 1;
  }
  -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", v7);

  if (_os_feature_enabled_impl())
  {
    -[MFConversationItemFooterView undoSendButton](self, "undoSendButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", v7);

  }
  -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");
}

+ (UIFont)prefixFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_3, CFSTR("conversationItemFooterView.prefixFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

uint64_t __42__MFConversationItemFooterView_prefixFont__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
}

+ (UIFont)nameFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPreferredFontForStyle:", *MEMORY[0x1E0DC4AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)layoutActionButtonWithBounds:(CGRect)a3
{
  CGFloat width;
  CGFloat x;
  void *v6;
  void *v7;
  int v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  MFConversationItemFooterView *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  MFConversationItemFooterView *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double y;
  double height;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  y = a3.origin.y;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConversationItemFooterView displayMetrics](self, "displayMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MFConversationItemFooterView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  objc_msgSend(v6, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v6;
  v16 = self;
  if (*(double *)&calculatePadding_imageWidth == 0.0)
  {
    objc_msgSend(v15, "imageView", *(double *)&calculatePadding_imageWidth);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    calculatePadding_imageWidth = v18;

  }
  v40.origin.x = v10;
  v40.origin.y = v12;
  v40.size.width = 51.0;
  v40.size.height = v14;
  CGRectGetWidth(v40);
  UIRoundToViewScale();

  objc_msgSend(v7, "footerViewTrailingButtonOrigin");
  v20 = v19;
  -[MFConversationItemFooterView traitCollection](v16, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "horizontalSizeClass");

  if (v22 != 1 || v20 == 2.22507386e-308)
  {
    -[MFConversationItemFooterView layoutMargins](v16, "layoutMargins");
    if (!v8)
    {
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.height = height;
      v41.size.width = width;
      CGRectGetWidth(v41);
      v42.origin.x = v10;
      v42.origin.y = v12;
      v42.size.width = 51.0;
      v42.size.height = v14;
      CGRectGetWidth(v42);
    }
  }
  UIRoundToViewScale();
  v24 = v23;
  objc_msgSend(v7, "footerViewTopToBaseline");
  v39 = v15;
  v25 = v16;
  if (*(double *)&calculateFrameForActionButtonImageView_imageHeight == 0.0)
  {
    objc_msgSend(v39, "sizeToFit", *(double *)&calculateFrameForActionButtonImageView_imageHeight);
    objc_msgSend(v39, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    calculateFrameForActionButtonImageView_imageHeight = CGRectGetHeight(v43);

    objc_msgSend(v39, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "image");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "baselineOffsetFromBottom");
    calculateFrameForActionButtonImageView_imageBaselineOffset = v29;

  }
  UIRoundToViewScale();
  v31 = v30;
  v32 = *(double *)&calculateFrameForActionButtonImageView_imageHeight;

  v33 = -v31;
  if (v31 + v32 - (y + height) > -v31)
    v33 = v31 + v32 - (y + height);
  v34 = v24 + 0.0;
  v35 = v31 + v33;
  v36 = v32 - (v33 + v33);
  objc_msgSend(v39, "setFrame:", v34, v35, 51.0, v36);
  v44.origin.x = v34;
  v44.origin.y = v35;
  v44.size.width = 51.0;
  v44.size.height = v36;
  -[MFConversationItemFooterView setDefaultRevealActionButtonOriginY:](v25, "setDefaultRevealActionButtonOriginY:", CGRectGetMinY(v44));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFConversationItemFooterView;
  -[MFConversationItemFooterView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[MFConversationItemFooterView _updateButtons](self, "_updateButtons");
  -[MFConversationItemFooterView _updateBackgroundView](self, "_updateBackgroundView");
  -[MFConversationItemFooterView _updateSeeMoreButton](self, "_updateSeeMoreButton");
  -[MFConversationItemFooterView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateButtons
{
  BOOL v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = -[MFConversationItemFooterView shouldHideStickyFooterView](self, "shouldHideStickyFooterView");
  v4 = 0.0;
  if (!v3)
    -[MFConversationItemFooterView currentYOffset](self, "currentYOffset", 0.0);
  -[MFConversationItemFooterView setCurrentYOffset:](self, "setCurrentYOffset:", v4);
  -[MFConversationItemFooterView displayMetrics](self, "displayMetrics");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "usePhoneLandscapeSymbolConfiguration"))
    v5 = 17;
  else
    v5 = 16;

  -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

}

- (void)moveOriginYByOffset:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double MinY;
  double v9;
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
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  CGRect v29;

  -[MFConversationItemFooterView setCurrentYOffset:](self, "setCurrentYOffset:");
  UIRoundToViewScale();
  v5 = v4;
  -[MFConversationItemFooterView defaultRevealActionButtonOriginY](self, "defaultRevealActionButtonOriginY");
  v7 = v6;
  -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  MinY = CGRectGetMinY(v29);
  v9 = v5 + v7;

  if (v9 != MinY)
  {
    -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v11, v9, v13, v15);

    -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[MFConversationItemFooterView defaultSeeMoreButtonOriginY](self, "defaultSeeMoreButtonOriginY");
    v23 = v5 + v22;
    -[MFConversationItemFooterView seeMoreButton](self, "seeMoreButton");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v17, v23, v19, v21);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  if (-[MFConversationItemFooterView allowsPointerSnapping](self, "allowsPointerSnapping"))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;

  -[MFConversationItemFooterView revealActionsButton](self, "revealActionsButton", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mf_revealActionButtonPointerStyleInView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addConversationSearchOverlay
{
  id v3;
  id v4;

  -[MFConversationItemFooterView findOverlayView](self, "findOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MFConversationItemFooterView bringSubviewToFront:](self, "bringSubviewToFront:");

  -[MFConversationItemFooterView findOverlayView](self, "findOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "show");

}

- (void)removeConversationSearchOverlay
{
  id v3;
  id v4;

  -[MFConversationItemFooterView findOverlayView](self, "findOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hide");

  -[MFConversationItemFooterView findOverlayView](self, "findOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFConversationItemFooterView sendSubviewToBack:](self, "sendSubviewToBack:");

}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (BOOL)messageContainsBlockQuotes
{
  return self->_messageContainsBlockQuotes;
}

- (BOOL)blockquotesAreExpanded
{
  return self->_blockquotesAreExpanded;
}

- (BOOL)isSemiExpanded
{
  return self->_isSemiExpanded;
}

- (UIButton)revealActionsButton
{
  return self->_revealActionsButton;
}

- (void)setRevealActionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_revealActionsButton, a3);
}

- (MFMessageFooterViewDelegate)delegate
{
  return (MFMessageFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (BOOL)allowsPointerSnapping
{
  return self->_allowsPointerSnapping;
}

- (void)setAllowsPointerSnapping:(BOOL)a3
{
  self->_allowsPointerSnapping = a3;
}

- (double)defaultRevealActionButtonOriginY
{
  return self->_defaultRevealActionButtonOriginY;
}

- (void)setDefaultRevealActionButtonOriginY:(double)a3
{
  self->_defaultRevealActionButtonOriginY = a3;
}

- (double)defaultSeeMoreButtonOriginY
{
  return self->_defaultSeeMoreButtonOriginY;
}

- (void)setDefaultSeeMoreButtonOriginY:(double)a3
{
  self->_defaultSeeMoreButtonOriginY = a3;
}

- (double)defaultUndoSendButtonOriginY
{
  return self->_defaultUndoSendButtonOriginY;
}

- (void)setDefaultUndoSendButtonOriginY:(double)a3
{
  self->_defaultUndoSendButtonOriginY = a3;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (double)currentYOffset
{
  return self->_currentYOffset;
}

- (void)setCurrentYOffset:(double)a3
{
  self->_currentYOffset = a3;
}

- (void)setFindOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_findOverlayView, a3);
}

- (UIButton)seeMoreButton
{
  return self->_seeMoreButton;
}

- (void)setSeeMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreButton, a3);
}

- (UIButton)undoSendButton
{
  return self->_undoSendButton;
}

- (void)setUndoSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_undoSendButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSendButton, 0);
  objc_storeStrong((id *)&self->_seeMoreButton, 0);
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_revealActionsButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
