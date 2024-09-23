@implementation ICAudioBarView

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[ICAudioBarView _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __60__ICAudioBarView_ICAccessibility_iOS__accessibilityElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "accessibilityFrame");
  v7 = v6;
  objc_msgSend(v5, "accessibilityFrame");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "accessibilityFrame");
    v11 = v10;
    objc_msgSend(v5, "accessibilityFrame");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Audio playback bar"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (ICAudioBarView)initWithFrame:(CGRect)a3
{
  ICAudioBarView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ICAudioBarView;
  v3 = -[ICAudioBarView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_resolvedColorForNoteEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioBarView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[ICAudioBarView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0DC3520], "ic_plainButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", CFSTR("xmark.circle.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseForegroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIc_preferredContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    -[ICAudioBarView setDoneButton:](v3, "setDoneButton:", v9);
    -[ICAudioBarView addSubview:](v3, "addSubview:", v9);
    -[ICAudioBarView setupConstraints](v3, "setupConstraints");
    -[ICAudioBarView updateLayoutMargins](v3, "updateLayoutMargins");
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioBarView setBorderLayer:](v3, "setBorderLayer:", v10);
    -[ICAudioBarView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v10);

    v16[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)-[ICAudioBarView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v12, sel_updateLayoutMargins);

  }
  return v3;
}

- (void)setHeight:(double)a3
{
  id v4;

  -[ICAudioBarView heightConstraint](self, "heightConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)height
{
  void *v2;
  double v3;
  double v4;

  -[ICAudioBarView heightConstraint](self, "heightConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICAudioBarView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 1.0, 45.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarView setHeightConstraint:](self, "setHeightConstraint:", v3);

  -[ICAudioBarView heightConstraint](self, "heightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarView addConstraint:](self, "addConstraint:", v4);

  -[ICAudioBarView doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[ICAudioBarView doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 6, 0, self, 18, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarView addConstraint:](self, "addConstraint:", v8);

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[ICAudioBarView doneButton](self, "doneButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 10, 0, self, 10, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioBarView addConstraint:](self, "addConstraint:", v10);

}

- (void)updateLayoutMargins
{
  void *v3;

  -[ICAudioBarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") != 2)
    objc_msgSend(MEMORY[0x1E0D641E0], "isLargerCompactHorizontalWidthDevice");

  -[ICAudioBarView directionalLayoutMargins](self, "directionalLayoutMargins");
  -[ICAudioBarView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:");
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)ICAudioBarView;
  -[ICAudioBarView layoutSubviews](&v17, sel_layoutSubviews);
  -[ICAudioBarView bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[ICAudioBarView oldWidth](self, "oldWidth");
  if (Width != v4)
    -[ICAudioBarView updateLayoutMargins](self, "updateLayoutMargins");
  -[ICAudioBarView ic_hairlineWidth](self, "ic_hairlineWidth");
  v6 = v5;
  -[ICAudioBarView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;
  v11 = v10;

  -[ICAudioBarView bounds](self, "bounds");
  v12 = CGRectGetMaxY(v19) - v6;
  -[ICAudioBarView borderLayer](self, "borderLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v9, v12, v11, v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[ICAudioBarView borderLayer](self, "borderLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[ICAudioBarView setOldWidth:](self, "setOldWidth:", Width);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (double)oldWidth
{
  return self->_oldWidth;
}

- (void)setOldWidth:(double)a3
{
  self->_oldWidth = a3;
}

- (CALayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_borderLayer, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end
