@implementation GKSectionHeaderView

+ (id)padMetrics
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GKSectionHeaderView;
  objc_msgSendSuper2(&v5, sel_padMetrics);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addEntriesFromDictionary:", &unk_1E5A5EC88);
  return v3;
}

+ (id)phoneMetrics
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GKSectionHeaderView;
  objc_msgSendSuper2(&v5, sel_phoneMetrics);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addEntriesFromDictionary:", &unk_1E5A5ECB0);
  return v3;
}

- (GKSectionHeaderView)initWithFrame:(CGRect)a3
{
  GKSectionHeaderView *v3;
  GKLabel *v4;
  uint64_t v5;
  GKLabel *leftLabel;
  uint64_t v7;
  uint64_t v8;
  GKButton *rightButton;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *backgroundView;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)GKSectionHeaderView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKLabel alloc];
    -[GKSectionHeaderView bounds](v3, "bounds");
    v5 = -[GKLabel initWithFrame:](v4, "initWithFrame:");
    leftLabel = v3->_leftLabel;
    v3->_leftLabel = (GKLabel *)v5;

    v7 = 1;
    +[GKButton buttonWithType:](GKButton, "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    rightButton = v3->_rightButton;
    v3->_rightButton = (GKButton *)v8;

    -[GKLabel setBackgroundColor:](v3->_leftLabel, "setBackgroundColor:", 0);
    -[GKLabel setOpaque:](v3->_leftLabel, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1)
    {
      if (*MEMORY[0x1E0D253F8])
        v12 = *MEMORY[0x1E0D25B68] == 0;
      else
        v12 = 0;
      v7 = v12;
    }
    -[GKLabel setShouldInhibitReplay:](v3->_leftLabel, "setShouldInhibitReplay:", v7);
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionHeader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKLabel applyTextStyle:](v3->_leftLabel, "applyTextStyle:", v14);
    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_leftLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[GKButton setContentHuggingPriority:forAxis:](v3->_rightButton, "setContentHuggingPriority:forAxis:", 1, v15);
    LODWORD(v16) = 1132068864;
    -[GKButton setContentCompressionResistancePriority:forAxis:](v3->_rightButton, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[GKButton setBackgroundColor:](v3->_rightButton, "setBackgroundColor:", 0);
    -[GKButton setOpaque:](v3->_rightButton, "setOpaque:", 0);
    -[GKButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_rightButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKButton setEnabled:](v3->_rightButton, "setEnabled:", 0);
    -[GKButton applyTextStyle:](v3->_rightButton, "applyTextStyle:", v14);
    -[GKButton addTarget:action:forControlEvents:](v3->_rightButton, "addTarget:action:forControlEvents:", v3, sel_rightButtonTouched_, 64);
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.200000003);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v19);

    -[UIView setClipsToBounds:](v3->_backgroundView, "setClipsToBounds:", 1);
    -[UIView setHidden:](v3->_backgroundView, "setHidden:", 1);
    -[UIView layer](v3->_backgroundView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaskedCorners:", 3);

    -[UIView layer](v3->_backgroundView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", 10.0);

    v22 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v3->_backgroundView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerCurve:", v22);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKSectionHeaderView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[UIView bottomAnchor](v3->_backgroundView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView superview](v3->_backgroundView, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIView leftAnchor](v3->_backgroundView, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView superview](v3->_backgroundView, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UIView rightAnchor](v3->_backgroundView, "rightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView superview](v3->_backgroundView, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "rightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIView heightAnchor](v3->_backgroundView, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scaledValueForValue:", 30.0);
    objc_msgSend(v36, "constraintEqualToConstant:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSectionHeaderView setBackgroundViewHeightConstraint:](v3, "setBackgroundViewHeightConstraint:", v38);

    -[GKSectionHeaderView backgroundViewHeightConstraint](v3, "backgroundViewHeightConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[GKSectionHeaderView addSubview:](v3, "addSubview:", v3->_leftLabel);
    -[GKSectionHeaderView addSubview:](v3, "addSubview:", v3->_rightButton);

  }
  return v3;
}

- (void)updateGutterConstraints
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
  uint64_t v13;
  double v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)GKSectionHeaderView;
  -[GKHeaderWithUnderlineView updateGutterConstraints](&v22, sel_updateGutterConstraints);
  -[GKHeaderWithUnderlineView metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("_leftLabel, _rightButton"), self->_leftLabel, self->_rightButton, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(gutter)-[_leftLabel]-(>=labelSpacing)-[_rightButton]-(rightGutter)-|"), 0, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKSectionHeaderView leftLabel](self, "leftLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView leftLabel](self, "leftLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 15.0;
  if (v13 == 1 && (*MEMORY[0x1E0D25B68] || *MEMORY[0x1E0D253F8] == 0))
    v14 = 25.0;
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[GKHeaderWithUnderlineView leadingMargin](self, "leadingMargin");
  v18 = v17;
  -[GKHeaderWithUnderlineView trailingMargin](self, "trailingMargin");
  if (v18 > 0.0 || v19 > 0.0)
    objc_msgSend(MEMORY[0x1E0DC35B0], "_gkAdjustConstraintMargins:leading:trailing:", v6, v18, v19);
  -[GKSectionHeaderView addConstraints:](self, "addConstraints:", v6);
  -[GKHeaderWithUnderlineView gutterConstraints](self, "gutterConstraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKHeaderWithUnderlineView setGutterConstraints:](self, "setGutterConstraints:", v21);

}

- (void)establishConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKSectionHeaderView;
  -[GKHeaderWithUnderlineView establishConstraints](&v8, sel_establishConstraints);
  -[GKHeaderWithUnderlineView underlineView](self, "underlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView leftLabel](self, "leftLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView rightButton](self, "rightButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:leading:fontTextStyle:", v3, 3, 0, v4, 11, *MEMORY[0x1E0DC4B10], 1.0, 8.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 11, 0, v4, 11, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView addConstraint:](self, "addConstraint:", v6);
  -[GKSectionHeaderView addConstraint:](self, "addConstraint:", v7);

}

- (void)setLeftText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[GKLabel setText:](self->_leftLabel, "setText:", a3);
  -[GKSectionHeaderView backgroundViewHeightConstraint](self, "backgroundViewHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[UIView heightAnchor](self->_backgroundView, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledValueForValue:", 30.0);
  objc_msgSend(v5, "constraintEqualToConstant:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView setBackgroundViewHeightConstraint:](self, "setBackgroundViewHeightConstraint:", v7);

  -[GKSectionHeaderView backgroundViewHeightConstraint](self, "backgroundViewHeightConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[GKSectionHeaderView backgroundView](self, "backgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (NSString)leftText
{
  return (NSString *)-[GKLabel text](self->_leftLabel, "text");
}

- (void)setRightText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  GKButton *rightButton;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionHeader");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[GKButton applyTextStyle:](self->_rightButton, "applyTextStyle:", v10);
  rightButton = self->_rightButton;
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emphasizedTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKButton setTitleColor:forState:](rightButton, "setTitleColor:forState:", v9, 0);

  -[GKButton setTitle:forState:](self->_rightButton, "setTitle:forState:", v5, 0);
  -[GKSectionHeaderView updateLabel](self, "updateLabel");

}

- (NSString)rightText
{
  return (NSString *)-[GKButton titleForState:](self->_rightButton, "titleForState:", -[GKButton state](self->_rightButton, "state"));
}

- (CGRect)rightButtonFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[GKButton frame](self->_rightButton, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t maxRange;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKSectionHeaderView;
  -[GKHeaderWithUnderlineView applyLayoutAttributes:](&v12, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSectionHeaderView setSectionIndex:](self, "setSectionIndex:", objc_msgSend(v5, "section"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = v6;
    if (self->_manualItemCount)
    {
      if (self->_maxRange
        && (v8 = objc_msgSend(v6, "currentTotalItemCount"), v8 >= objc_msgSend(v7, "maxTotalItemCount")))
      {
        maxRange = self->_maxRange;
      }
      else
      {
        v9 = objc_msgSend(v7, "currentVisibleItemCount");
        v10 = objc_msgSend(v7, "currentTotalItemCount");
        if (v9 >= v10)
          maxRange = v10;
        else
          maxRange = v9;
      }
      -[GKSectionHeaderView setItemCount:](self, "setItemCount:", maxRange);
    }
    else
    {
      self->_itemCount = objc_msgSend(v6, "currentTotalItemCount");
    }
    self->_maxItemCount = objc_msgSend(v7, "maxTotalItemCount");
    self->_allSectionItemsVisible = objc_msgSend(v7, "allSectionItemsVisible");
    -[GKSectionHeaderView updateLabel](self, "updateLabel");

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSectionHeaderView;
  -[GKSectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  self->_manualItemCount = 0;
  self->_itemCountFormatter = 0;
  self->_maxRange = 0;
  -[GKSectionHeaderView setRightText:](self, "setRightText:", 0);
}

- (void)setItemCount:(int64_t)a3
{
  self->_itemCount = a3;
  -[GKSectionHeaderView updateLabel](self, "updateLabel");
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxItemCount = a3;
  -[GKSectionHeaderView updateLabel](self, "updateLabel");
}

- (void)updateLabel
{
  void (*itemCountFormatter)(int64_t, SEL);
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
  uint64_t v16;
  _BOOL8 v17;
  _BOOL8 v18;
  void *v19;
  id v20;

  itemCountFormatter = (void (*)(int64_t, SEL))self->_itemCountFormatter;
  if (itemCountFormatter)
  {
    itemCountFormatter(self->_itemCount, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSectionHeaderView setLeftText:](self, "setLeftText:", v4);

  }
  if (self->_showAllAction && (!self->_allSectionItemsVisible || self->_itemCount < self->_maxItemCount))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSectionHeaderView maxItemCount](self, "maxItemCount");
    GKFormattedStringWithGroupingFromInteger();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKSectionHeaderView setRightText:](self, "setRightText:", v9);
    -[GKSectionHeaderView rightButton](self, "rightButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleColor:forState:", 0, 0);

    -[GKSectionHeaderView rightButton](self, "rightButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionHeader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buttonTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyTextStyle:", v14);

LABEL_10:
    goto LABEL_11;
  }
  if (self->_rightTarget && self->_rightAction)
  {
    -[GKSectionHeaderView rightButton](self, "rightButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemInteractionColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitleColor:forState:", v12, 0);
    goto LABEL_10;
  }
LABEL_11:
  -[GKSectionHeaderView rightText](self, "rightText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  v17 = v16 == 0;
  v18 = v16 != 0;

  -[GKSectionHeaderView rightButton](self, "rightButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEnabled:", v18);

  -[GKSectionHeaderView rightButton](self, "rightButton");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v17);

}

- (void)setItemCountFormatter:(void *)a3
{
  if (self->_itemCountFormatter != a3)
  {
    self->_itemCountFormatter = a3;
    -[GKSectionHeaderView updateLabel](self, "updateLabel");
  }
}

- (void)setShowAllAction:(SEL)a3
{
  if (self->_showAllAction != a3)
  {
    self->_showAllAction = a3;
    -[GKSectionHeaderView updateLabel](self, "updateLabel");
  }
}

- (void)rightButtonTouched:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id rightTarget;
  SEL rightAction;
  id v9;

  v4 = a3;
  if (self->_showAllAction)
  {
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_gkTargetForAction:viaResponder:", self->_showAllAction, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, self->_showAllAction, self->_sectionIndex);
LABEL_6:
    v4 = v9;
    goto LABEL_7;
  }
  rightTarget = self->_rightTarget;
  if (rightTarget)
  {
    rightAction = self->_rightAction;
    if (rightAction)
    {
      v9 = v4;
      objc_msgSend(rightTarget, "_gkPerformSelector:withObject:", rightAction, self);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (GKLabel)leftLabel
{
  return self->_leftLabel;
}

- (void)setLeftLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leftLabel, a3);
}

- (SEL)showAllAction
{
  return self->_showAllAction;
}

- (id)rightTarget
{
  return self->_rightTarget;
}

- (void)setRightTarget:(id)a3
{
  self->_rightTarget = a3;
}

- (SEL)rightAction
{
  return self->_rightAction;
}

- (void)setRightAction:(SEL)a3
{
  self->_rightAction = a3;
}

- (void)itemCountFormatter
{
  return self->_itemCountFormatter;
}

- (BOOL)manualItemCount
{
  return self->_manualItemCount;
}

- (void)setManualItemCount:(BOOL)a3
{
  self->_manualItemCount = a3;
}

- (int64_t)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(int64_t)a3
{
  self->_maxRange = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (GKButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (int64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (BOOL)allSectionItemsVisible
{
  return self->_allSectionItemsVisible;
}

- (void)setAllSectionItemsVisible:(BOOL)a3
{
  self->_allSectionItemsVisible = a3;
}

- (NSLayoutConstraint)backgroundViewHeightConstraint
{
  return self->_backgroundViewHeightConstraint;
}

- (void)setBackgroundViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end
