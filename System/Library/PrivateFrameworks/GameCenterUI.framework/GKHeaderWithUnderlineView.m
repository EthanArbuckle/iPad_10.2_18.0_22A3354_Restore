@implementation GKHeaderWithUnderlineView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceWhenContainedInInstancesOfClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "phoneMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "setMetrics:", v6);
}

+ (id)macMetrics
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "numberWithDouble:", 1.0 / v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = CFSTR("gutter");
  v8[1] = CFSTR("rightGutter");
  v9[0] = &unk_1E5A5E178;
  v9[1] = &unk_1E5A5E190;
  v8[2] = CFSTR("labelSpacing");
  v8[3] = CFSTR("hairline");
  v9[2] = &unk_1E5A5E1A8;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)padMetrics
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "numberWithDouble:", 1.0 / v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = CFSTR("gutter");
  v8[1] = CFSTR("rightGutter");
  v9[0] = &unk_1E5A5E1C0;
  v9[1] = &unk_1E5A5E190;
  v8[2] = CFSTR("labelSpacing");
  v8[3] = CFSTR("hairline");
  v9[2] = &unk_1E5A5E1A8;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)phoneMetrics
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "numberWithDouble:", 1.0 / v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = CFSTR("gutter");
  v8[1] = CFSTR("rightGutter");
  v9[0] = &unk_1E5A5E190;
  v9[1] = &unk_1E5A5E190;
  v8[2] = CFSTR("labelSpacing");
  v8[3] = CFSTR("hairline");
  v9[2] = &unk_1E5A5E1A8;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GKHeaderWithUnderlineView)initWithFrame:(CGRect)a3
{
  GKHeaderWithUnderlineView *v3;
  GKHeaderWithUnderlineView *v4;
  void *v5;
  void *v6;
  GKHairlineView *v7;
  UIView *underlineView;
  UIImageView *v9;
  UIImageView *shadowView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  UIView *pinnedBackdropView;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)GKHeaderWithUnderlineView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[GKHeaderWithUnderlineView setOpaque:](v3, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatingHeaderViewBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKHeaderWithUnderlineView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    if (-[GKHeaderWithUnderlineView drawsUnderline](v4, "drawsUnderline"))
    {
      v7 = objc_alloc_init(GKHairlineView);
      underlineView = v4->_underlineView;
      v4->_underlineView = &v7->super;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_underlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[GKHeaderWithUnderlineView addSubview:](v4, "addSubview:", v4->_underlineView);
    }
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    shadowView = v4->_shadowView;
    v4->_shadowView = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_shadowView, "setBackgroundColor:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_shadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setOpaque:](v4->_shadowView, "setOpaque:", 0);
    -[UIImageView setAlpha:](v4->_shadowView, "setAlpha:", 0.0);
    -[GKHeaderWithUnderlineView addSubview:](v4, "addSubview:", v4->_shadowView);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == (void *)1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68]))
    {
      objc_msgSend((id)objc_opt_class(), "padMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      v15 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "phoneMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = 0;
    }
    objc_storeStrong((id *)&v4->_metrics, v14);
    if (!v15)
      v12 = v13;

    objc_msgSend(MEMORY[0x1E0DC3F10], "_gkStandardBackdropView");
    v16 = objc_claimAutoreleasedReturnValue();
    pinnedBackdropView = v4->_pinnedBackdropView;
    v4->_pinnedBackdropView = (UIView *)v16;

    -[UIView setAlpha:](v4->_pinnedBackdropView, "setAlpha:", 0.0);
    -[GKHeaderWithUnderlineView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_pinnedBackdropView, 0);
  }
  return v4;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKHeaderWithUnderlineView;
  -[GKHeaderWithUnderlineView updateConstraints](&v3, sel_updateConstraints);
  if (!self->_didSetupConstraints)
  {
    -[GKHeaderWithUnderlineView establishConstraints](self, "establishConstraints");
    self->_didSetupConstraints = 1;
  }
}

- (void)establishConstraints
{
  void *v3;
  NSMutableDictionary *metrics;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *shadowView;
  float v17;
  void *v18;
  id v19;

  if (-[GKHeaderWithUnderlineView drawsUnderline](self, "drawsUnderline"))
  {
    v3 = (void *)MEMORY[0x1E0CB3718];
    metrics = self->_metrics;
    _NSDictionaryOfVariableBindings(CFSTR("_underlineView"), self->_underlineView, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_underlineView(hairline)]|"), 0, metrics, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKHeaderWithUnderlineView addConstraints:](self, "addConstraints:", v6);

    -[GKHeaderWithUnderlineView updateGutterConstraints](self, "updateGutterConstraints");
  }
  v7 = (void *)MEMORY[0x1E0CB3718];
  v8 = self->_metrics;
  _NSDictionaryOfVariableBindings(CFSTR("_shadowView"), self->_shadowView, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_shadowView]|"), 0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKHeaderWithUnderlineView addConstraints:](self, "addConstraints:", v10);

  v11 = (void *)MEMORY[0x1E0CB3718];
  v12 = self->_metrics;
  _NSDictionaryOfVariableBindings(CFSTR("_shadowView"), self->_shadowView, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_shadowView(hairline)]"), 0, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKHeaderWithUnderlineView addConstraints:](self, "addConstraints:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  shadowView = self->_shadowView;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", CFSTR("hairline"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", shadowView, 3, 0, self, 4, 1.0, (float)-v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKHeaderWithUnderlineView addConstraint:](self, "addConstraint:", v18);

}

- (void)setUnderlineHasRightMargin:(BOOL)a3
{
  if (self->_underlineHasRightMargin != a3)
  {
    self->_underlineHasRightMargin = a3;
    -[GKHeaderWithUnderlineView updateGutterConstraints](self, "updateGutterConstraints");
  }
}

- (void)updateGutterConstraints
{
  _BOOL4 underlineHasRightMargin;
  void *v4;
  NSMutableDictionary *metrics;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  if (-[GKHeaderWithUnderlineView drawsUnderline](self, "drawsUnderline"))
  {
    if (self->_gutterConstraints)
      -[GKHeaderWithUnderlineView removeConstraints:](self, "removeConstraints:");
    underlineHasRightMargin = self->_underlineHasRightMargin;
    v4 = (void *)MEMORY[0x1E0CB3718];
    metrics = self->_metrics;
    _NSDictionaryOfVariableBindings(CFSTR("_underlineView"), self->_underlineView, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (underlineHasRightMargin)
    {
      objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(gutter)-[_underlineView]-(gutter)-|"), 0, metrics, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKHeaderWithUnderlineView setGutterConstraints:](self, "setGutterConstraints:", v7);

      -[NSArray firstObject](self->_gutterConstraints, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](self->_gutterConstraints, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionReusableView _gkSetLeadingGuideConstraint:trailingGuideConstraint:](self, "_gkSetLeadingGuideConstraint:trailingGuideConstraint:", v8, v9);

    }
    else
    {
      objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(gutter)-[_underlineView]|"), 0, metrics, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKHeaderWithUnderlineView setGutterConstraints:](self, "setGutterConstraints:", v10);

      -[NSArray firstObject](self->_gutterConstraints, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionReusableView _gkSetLeadingGuideConstraint:trailingGuideConstraint:](self, "_gkSetLeadingGuideConstraint:trailingGuideConstraint:", v8, 0);
    }

    -[GKHeaderWithUnderlineView leadingMargin](self, "leadingMargin");
    v12 = v11;
    -[GKHeaderWithUnderlineView trailingMargin](self, "trailingMargin");
    if (v12 > 0.0 || v13 > 0.0)
      objc_msgSend(MEMORY[0x1E0DC35B0], "_gkAdjustConstraintMargins:leading:trailing:", self->_gutterConstraints, v12, v13);
    -[GKHeaderWithUnderlineView addConstraints:](self, "addConstraints:", self->_gutterConstraints);
  }
}

- (BOOL)drawsUnderline
{
  return 1;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)GKHeaderWithUnderlineView;
  -[GKHeaderWithUnderlineView applyLayoutAttributes:](&v37, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKHeaderWithUnderlineView setIsPinned:](self, "setIsPinned:", objc_msgSend(v5, "isPinned"));
    if (self->_isPinned)
    {
      objc_msgSend(v5, "frame");
      v7 = v6;
      -[GKHeaderWithUnderlineView superview](self, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v9 = 0.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "bounds");
        v11 = v10;
        objc_msgSend(v8, "contentInset");
        v13 = v11 + v12;
        v14 = 0.0;
        if (v7 < v13)
          v14 = (double)((int)(v13 - v7) & ~((int)(v13 - v7) >> 31));
        objc_msgSend(v8, "collectionViewLayout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "laidOutContentSize");
        v17 = v16;
        objc_msgSend(v8, "contentSize");
        v19 = v17 - v18;
        if (v18 <= v17)
          v19 = -0.0;
        v9 = v14 + v19;

      }
      -[GKHeaderWithUnderlineView bounds](self, "bounds");
      v21 = v20;
      v23 = v22;
      -[UIView frame](self->_pinnedBackdropView, "frame");
      v25 = v24;
      v27 = v26;
      -[UIView frame](self->_pinnedBackdropView, "frame");
      v39.origin.x = v28;
      v39.origin.y = v29;
      v39.size.width = v30;
      v39.size.height = v31;
      v38.origin.x = v25;
      v38.origin.y = v9 + v21;
      v38.size.width = v27;
      v38.size.height = v23 - v9;
      if (!CGRectEqualToRect(v38, v39))
        -[UIView setFrame:](self->_pinnedBackdropView, "setFrame:", v25, v9 + v21, v27, v23 - v9);

    }
    if (-[GKHeaderWithUnderlineView drawsUnderline](self, "drawsUnderline"))
    {
      objc_msgSend(v5, "leadingMargin");
      v33 = v32;
      objc_msgSend(v5, "trailingMargin");
      v35 = v34;
      -[GKHeaderWithUnderlineView setLeadingMargin:](self, "setLeadingMargin:", v33);
      -[GKHeaderWithUnderlineView setTrailingMargin:](self, "setTrailingMargin:", v35);
      -[GKHeaderWithUnderlineView gutterConstraints](self, "gutterConstraints");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(MEMORY[0x1E0DC35B0], "_gkAdjustConstraintMargins:leading:trailing:", v36, v33, v35);

    }
  }

}

- (void)setIsPinned:(BOOL)a3
{
  _BOOL4 v3;
  GKHeaderWithUnderlineView *v5;
  uint64_t v6;
  void *v7;
  GKHeaderWithUnderlineView *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;

  if (self->_isPinned != a3)
  {
    v3 = a3;
    self->_isPinned = a3;
    if (!a3)
      goto LABEL_16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v5 = self;
    objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
    }
    else
    {
      do
      {
        v8 = v5;
        -[GKHeaderWithUnderlineView superview](v5, "superview");
        v5 = (GKHeaderWithUnderlineView *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v5);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = 1;
        else
          v10 = v5 == 0;
      }
      while (!v10);
      v7 = (void *)v9;
      if (!v9)
        goto LABEL_15;
    }
    objc_msgSend(v7, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = self->_pinnedBackdropView;
      objc_msgSend(v11, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_backdropViewLayerGroupName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setGroupName:](v12, "setGroupName:", v14);

    }
LABEL_15:

LABEL_16:
    -[UIView setAlpha:](self->_pinnedBackdropView, "setAlpha:", (double)v3);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__GKHeaderWithUnderlineView_setIsPinned___block_invoke;
    v15[3] = &unk_1E59C5278;
    v15[4] = self;
    v16 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v15, 0.3);
  }
}

uint64_t __41__GKHeaderWithUnderlineView_setIsPinned___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pinningStateChangedTo:", *(unsigned __int8 *)(a1 + 40));
}

- (void)pinningStateChangedTo:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (double)a3;
  -[UIImageView setAlpha:](self->_shadowView, "setAlpha:", (double)a3);
  -[UIView setAlpha:](self->_underlineView, "setAlpha:", (double)!v3);
  -[UIView setAlpha:](self->_pinnedBackdropView, "setAlpha:", v5);
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v3)
    objc_msgSend(v6, "pinnedHeaderViewBackgroundColor");
  else
    objc_msgSend(v6, "floatingHeaderViewBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKHeaderWithUnderlineView setBackgroundColor:](self, "setBackgroundColor:", v7);

}

- (BOOL)allowsVibrancy
{
  return self->_isPinned;
}

- (UIView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
  objc_storeStrong((id *)&self->_underlineView, a3);
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (BOOL)underlineHasRightMargin
{
  return self->_underlineHasRightMargin;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (NSArray)gutterConstraints
{
  return self->_gutterConstraints;
}

- (void)setGutterConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_gutterConstraints, a3);
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (UIView)pinnedBackdropView
{
  return self->_pinnedBackdropView;
}

- (void)setPinnedBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedBackdropView, a3);
}

- (BOOL)didSetupConstraints
{
  return self->_didSetupConstraints;
}

- (void)setDidSetupConstraints:(BOOL)a3
{
  self->_didSetupConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBackdropView, 0);
  objc_storeStrong((id *)&self->_gutterConstraints, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_underlineView, 0);
}

@end
