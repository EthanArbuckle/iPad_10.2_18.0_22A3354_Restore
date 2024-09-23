@implementation MFMessageHeaderViewBlock

- (MFMessageHeaderViewBlock)initWithFrame:(CGRect)a3
{
  MFMessageHeaderViewBlock *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFMessageHeaderViewBlock;
  v3 = -[MFMessageHeaderViewBlock initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    v3->_usingLargeTextLayout = IsAccessibilityCategory;
    -[MFMessageHeaderViewBlock setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFMessageHeaderViewBlock setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    -[MFMessageHeaderViewBlock setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewExpandedCellBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[MFMessageHeaderViewBlock createPrimaryViews](v3, "createPrimaryViews");
    -[MFMessageHeaderViewBlock initializePrimaryLayoutConstraints](v3, "initializePrimaryLayoutConstraints");
    -[MFMessageHeaderViewBlock setSeparatorDrawsFlushWithLeadingEdge:](v3, "setSeparatorDrawsFlushWithLeadingEdge:", 0);
    -[MFMessageHeaderViewBlock setSeparatorDrawsFlushWithTrailingEdge:](v3, "setSeparatorDrawsFlushWithTrailingEdge:", 1);
  }
  return v3;
}

- (void)createPrimaryViews
{
  SeparatorLayer *v3;
  SeparatorLayer *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = [SeparatorLayer alloc];
  v4 = -[SeparatorLayer initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MFMessageHeaderViewBlock setSeparator:](self, "setSeparator:");

  -[MFMessageHeaderViewBlock separator](self, "separator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MFMessageHeaderViewBlock separator](self, "separator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock addSubview:](self, "addSubview:");

  v7 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[MFMessageHeaderViewBlock setTrailingAccessoryViewLayoutGuide:](self, "setTrailingAccessoryViewLayoutGuide:");

  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock addLayoutGuide:](self, "addLayoutGuide:");

}

- (void)initializePrimaryLayoutConstraints
{
  void *v3;
  void *v4;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageDisplayMetrics avatarDiameter](MFMessageDisplayMetrics, "avatarDiameter");
  objc_msgSend(v4, "constraintEqualToConstant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock setTrailingAccessoryViewLayoutGuideWidth:](self, "setTrailingAccessoryViewLayoutGuideWidth:", v5);

  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock setTrailingAccessoryViewLayoutGuideTrailing:](self, "setTrailingAccessoryViewLayoutGuideTrailing:", v9);

  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuideWidth](self, "trailingAccessoryViewLayoutGuideWidth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v20;
  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock heightAnchor](self, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuideTrailing](self, "trailingAccessoryViewLayoutGuideTrailing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  -[MFMessageHeaderViewBlock bottomAnchor](self, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock separator](self, "separator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MFMessageHeaderViewBlock;
  -[MFMessageHeaderViewBlock updateConstraints](&v15, sel_updateConstraints);
  -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarDiameterForCurrentContentSize");
  v5 = v4;
  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuideWidth](self, "trailingAccessoryViewLayoutGuideWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[MFMessageHeaderViewBlock directionalLayoutMargins](self, "directionalLayoutMargins");
  v8 = v7;
  -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "prefersFlushSeparator");

  if ((_DWORD)v6)
  {
    -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minHorizontalSpacing");
    v12 = v11;

    if (v12 >= v8 + -10.0)
      v8 = v12;
    else
      v8 = v8 + -10.0;
  }
  -[MFMessageHeaderViewBlock trailingAccessoryViewLayoutGuideTrailing](self, "trailingAccessoryViewLayoutGuideTrailing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", -v8);

  -[MFMessageHeaderViewBlock separator](self, "separator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock bringSubviewToFront:](self, "bringSubviewToFront:", v14);

}

- (void)setDisplayMetrics:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMessageHeaderViewBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSString *v5;
  _BOOL8 IsAccessibilityCategory;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMessageHeaderViewBlock;
  -[MFMessageHeaderViewBlock traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  -[MFMessageHeaderViewBlock setUsingLargeTextLayout:](self, "setUsingLargeTextLayout:", IsAccessibilityCategory);
}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_separatorIsHidden = a3;
  -[MFMessageHeaderViewBlock separator](self, "separator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  int v3;
  void *v5;
  int separatorDrawsFlushWithLeadingEdge;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[MFMessageHeaderViewBlock separatorLeading](self, "separatorLeading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (separatorDrawsFlushWithLeadingEdge = self->_separatorDrawsFlushWithLeadingEdge,
        v5,
        separatorDrawsFlushWithLeadingEdge != v3))
  {
    -[MFMessageHeaderViewBlock separatorLeading](self, "separatorLeading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[MFMessageHeaderViewBlock separator](self, "separator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[MFMessageHeaderViewBlock leadingAnchor](self, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -7.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageHeaderViewBlock setSeparatorLeading:](self, "setSeparatorLeading:", v11);
    }
    else
    {
      -[MFMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -7.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageHeaderViewBlock setSeparatorLeading:](self, "setSeparatorLeading:", v12);

    }
    -[MFMessageHeaderViewBlock separatorLeading](self, "separatorLeading");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

  }
  self->_separatorDrawsFlushWithLeadingEdge = v3;
  -[MFMessageHeaderViewBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3
{
  int v3;
  void *v5;
  int separatorDrawsFlushWithTrailingEdge;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[MFMessageHeaderViewBlock separatorTrailing](self, "separatorTrailing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (separatorDrawsFlushWithTrailingEdge = self->_separatorDrawsFlushWithTrailingEdge,
        v5,
        separatorDrawsFlushWithTrailingEdge != v3))
  {
    -[MFMessageHeaderViewBlock separatorTrailing](self, "separatorTrailing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[MFMessageHeaderViewBlock separator](self, "separator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[MFMessageHeaderViewBlock trailingAnchor](self, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageHeaderViewBlock setSeparatorTrailing:](self, "setSeparatorTrailing:", v11);
    }
    else
    {
      -[MFMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 7.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageHeaderViewBlock setSeparatorTrailing:](self, "setSeparatorTrailing:", v12);

    }
    -[MFMessageHeaderViewBlock separatorTrailing](self, "separatorTrailing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

  }
  self->_separatorDrawsFlushWithTrailingEdge = v3;
  -[MFMessageHeaderViewBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)prepareForReuse
{
  -[MFMessageHeaderViewBlock setViewModel:](self, "setViewModel:", 0);
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  -[MFMessageHeaderViewBlock observableCancelable](self, "observableCancelable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[MFMessageHeaderViewBlock setViewModel:](self, "setViewModel:", v4);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "modelObservable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __57__MFMessageHeaderViewBlock_displayMessageUsingViewModel___block_invoke;
  v11 = &unk_1E9A03D48;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "subscribeWithResultBlock:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderViewBlock setObservableCancelable:](self, "setObservableCancelable:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__MFMessageHeaderViewBlock_displayMessageUsingViewModel___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setViewModel:", v3);

}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (SeparatorLayer)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (UILayoutGuide)trailingAccessoryViewLayoutGuide
{
  return self->_trailingAccessoryViewLayoutGuide;
}

- (void)setTrailingAccessoryViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuide, a3);
}

- (BOOL)separatorIsHidden
{
  return self->_separatorIsHidden;
}

- (BOOL)separatorDrawsFlushWithLeadingEdge
{
  return self->_separatorDrawsFlushWithLeadingEdge;
}

- (BOOL)separatorDrawsFlushWithTrailingEdge
{
  return self->_separatorDrawsFlushWithTrailingEdge;
}

- (BOOL)usingLargeTextLayout
{
  return self->_usingLargeTextLayout;
}

- (void)setUsingLargeTextLayout:(BOOL)a3
{
  self->_usingLargeTextLayout = a3;
}

- (BOOL)interactivelyResizing
{
  return self->_interactivelyResizing;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  self->_interactivelyResizing = a3;
}

- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideWidth
{
  return self->_trailingAccessoryViewLayoutGuideWidth;
}

- (void)setTrailingAccessoryViewLayoutGuideWidth:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideWidth, a3);
}

- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideTrailing
{
  return self->_trailingAccessoryViewLayoutGuideTrailing;
}

- (void)setTrailingAccessoryViewLayoutGuideTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideTrailing, a3);
}

- (NSLayoutConstraint)separatorLeading
{
  return self->_separatorLeading;
}

- (void)setSeparatorLeading:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLeading, a3);
}

- (NSLayoutConstraint)separatorTrailing
{
  return self->_separatorTrailing;
}

- (void)setSeparatorTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_separatorTrailing, a3);
}

- (EFCancelable)observableCancelable
{
  return self->_observableCancelable;
}

- (void)setObservableCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_observableCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableCancelable, 0);
  objc_storeStrong((id *)&self->_separatorTrailing, 0);
  objc_storeStrong((id *)&self->_separatorLeading, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideTrailing, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideWidth, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
