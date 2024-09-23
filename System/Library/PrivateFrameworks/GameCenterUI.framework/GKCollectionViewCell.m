@implementation GKCollectionViewCell

- (GKCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  GKCollectionViewCell *v7;
  GKCellSelectedBackgroundView *v8;
  void *v9;
  void *v10;
  void *v11;
  GKDetachedContentView *v12;
  GKDetachedContentView *v13;
  GKEditActionsView *v14;
  uint64_t v15;
  GKEditActionsView *editActionsView;
  GKStaticRenderContentView *v17;
  GKStaticRenderContentView *contentRenderView;
  UIView *staticContentView;
  GKDetachedContentView *v20;
  void *v21;
  void *v22;
  void *v23;
  GKStaticRenderContentView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)GKCollectionViewCell;
  v7 = -[GKFocusHighlightingCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[GKCellSelectedBackgroundView initWithFrame:]([GKCellSelectedBackgroundView alloc], "initWithFrame:", x, y, width, height);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedCellBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCellSelectedBackgroundView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[GKCollectionViewCell setSelectedBackgroundView:](v7, "setSelectedBackgroundView:", v8);
    -[GKCollectionViewCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [GKDetachedContentView alloc];
    objc_msgSend(v11, "bounds");
    v13 = -[GKDetachedContentView initWithFrame:](v12, "initWithFrame:");
    -[GKDetachedContentView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKDetachedContentView setBackgroundColor:](v13, "setBackgroundColor:", 0);
    -[GKDetachedContentView setOpaque:](v13, "setOpaque:", 0);
    v14 = [GKEditActionsView alloc];
    v15 = -[GKEditActionsView initWithFrame:cell:](v14, "initWithFrame:cell:", v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    editActionsView = v7->_editActionsView;
    v7->_editActionsView = (GKEditActionsView *)v15;

    -[GKEditActionsView setTranslatesAutoresizingMaskIntoConstraints:](v7->_editActionsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = objc_alloc_init(GKStaticRenderContentView);
    contentRenderView = v7->_contentRenderView;
    v7->_contentRenderView = v17;

    -[GKStaticRenderContentView setOpaque:](v7->_contentRenderView, "setOpaque:", 0);
    -[GKStaticRenderContentView setBackgroundColor:](v7->_contentRenderView, "setBackgroundColor:", 0);
    -[GKStaticRenderContentView setContentView:](v7->_contentRenderView, "setContentView:", v13);
    -[GKStaticRenderContentView setTranslatesAutoresizingMaskIntoConstraints:](v7->_contentRenderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKDetachedContentView setRenderView:](v13, "setRenderView:", v7->_contentRenderView);
    staticContentView = v7->_staticContentView;
    v7->_staticContentView = &v13->super;
    v20 = v13;

    -[GKCollectionViewCell contentView](v7, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v7->_contentRenderView);

    -[GKCollectionViewCell contentView](v7, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3718];
    v24 = v7->_contentRenderView;
    -[GKCollectionViewCell contentView](v7, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_gkConstraintsForView:withinView:insets:", v24, v25, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addConstraints:", v26);

    +[GKHairlineView hairlineViewForAlignment:](GKHairlineView, "hairlineViewForAlignment:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewCell setTopHairline:](v7, "setTopHairline:", v27);

    -[GKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v7->_topHairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKHairlineView setAlpha:](v7->_topHairline, "setAlpha:", 0.0);
    +[GKHairlineView hairlineViewForAlignment:](GKHairlineView, "hairlineViewForAlignment:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewCell setBottomHairline:](v7, "setBottomHairline:", v28);

    -[GKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v7->_bottomHairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKHairlineView setAlpha:](v7->_bottomHairline, "setAlpha:", 0.0);

    objc_msgSend(v11, "setClipsToBounds:", 1);
  }
  return v7;
}

+ (void)registerCellClassesWithCollectionView:(id)a3
{
  objc_msgSend(a3, "_gkRegisterCellClass:", a1);
}

- (void)_gkEnumerateSubviewsUsingBlock:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewCell;
  v4 = a3;
  -[GKCollectionViewCell _gkEnumerateSubviewsUsingBlock:](&v5, sel__gkEnumerateSubviewsUsingBlock_, v4);
  -[UIView _gkEnumerateSubviewsUsingBlock:](self->_staticContentView, "_gkEnumerateSubviewsUsingBlock:", v4, v5.receiver, v5.super_class);

}

- (id)popoverSourceView
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (CGRect)alignmentRectForText
{
  NSObject **v3;
  NSObject *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v3 = (NSObject **)MEMORY[0x1E0D25460];
  v4 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v5 = (id)GKOSLoggers();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewCell alignmentRectForText].cold.1(v4, a2);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (UIView)interactiveContentView
{
  return (UIView *)self->_contentRenderView;
}

- (double)contentViewOriginXWhileEditing
{
  double MinX;
  void *v4;
  double v5;
  double v6;
  CGRect v8;

  -[GKEditActionsView frame](self->_editActionsView, "frame");
  MinX = CGRectGetMinX(v8);
  -[GKCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = MinX - v5;

  return v6;
}

- (double)editActionsVisibleWidth
{
  double result;

  -[GKEditActionsView visibleWidth](self->_editActionsView, "visibleWidth");
  return result;
}

- (void)prepareHairlineConstraintsIfNeeded
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *hairlineConstraints;
  id v11;

  if (!self->_hairlineConstraints)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[GKCollectionViewCell contentView](self, "contentView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_topHairline, 7, 0, v11, 7, 1.0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v4);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_topHairline, 3, 0, v11, 3, 1.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_topHairline, 5, 0, v11, 5, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bottomHairline, 7, 0, v11, 7, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bottomHairline, 4, 0, v11, 4, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bottomHairline, 5, 0, v11, 5, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v9);

    hairlineConstraints = self->_hairlineConstraints;
    self->_hairlineConstraints = v3;

  }
}

- (void)prepareEditActionsConstraintsIfNeeded
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *editActionsConstraints;
  id v9;

  if (!self->_editActionsConstraints)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[GKCollectionViewCell contentView](self, "contentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_editActionsView, 10, 0, v9, 10, 1.0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v4);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_editActionsView, 2, 0, v9, 2, 1.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_editActionsView, 3, 0, v9, 3, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_editActionsView, 8, 0, v9, 8, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v7);

    editActionsConstraints = self->_editActionsConstraints;
    self->_editActionsConstraints = v3;

  }
}

- (void)setEditActionsVisibleWidth:(double)a3
{
  -[GKEditActionsView setVisibleWidth:](self->_editActionsView, "setVisibleWidth:", a3);
}

- (void)beginEditing
{
  void *v3;
  void *v4;

  -[GKCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_editActionsView);

  -[GKCollectionViewCell prepareEditActionsConstraintsIfNeeded](self, "prepareEditActionsConstraintsIfNeeded");
  -[GKCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", self->_editActionsConstraints);

  -[GKEditActionsView prepareActionButtons](self->_editActionsView, "prepareActionButtons");
  -[GKCollectionViewCell setShouldDisplaySwipeToEditAccessories:](self, "setShouldDisplaySwipeToEditAccessories:", 1);
}

- (void)finishEditing
{
  void *v3;

  -[GKCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", self->_editActionsConstraints);

  -[GKEditActionsView removeFromSuperview](self->_editActionsView, "removeFromSuperview");
  -[GKCollectionViewCell setShouldDisplaySwipeToEditAccessories:](self, "setShouldDisplaySwipeToEditAccessories:", 0);
}

- (void)animateOutSwipeToEditAccessories
{
  -[GKCollectionViewCell setShouldDisplaySwipeToEditAccessories:](self, "setShouldDisplaySwipeToEditAccessories:", 0);
}

- (void)setUserInteractionEnabledForEditing:(BOOL)a3
{
  -[GKEditActionsView setUserInteractionEnabled:](self->_editActionsView, "setUserInteractionEnabled:", a3);
}

- (BOOL)userInteractionEnabledForEditing
{
  return -[GKEditActionsView isUserInteractionEnabled](self->_editActionsView, "isUserInteractionEnabled");
}

- (BOOL)touchWithinEditActions:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGPoint v9;
  CGRect v10;

  objc_msgSend(a3, "locationInView:", self->_editActionsView);
  v5 = v4;
  v7 = v6;
  -[GKEditActionsView bounds](self->_editActionsView, "bounds");
  v9.x = v5;
  v9.y = v7;
  return CGRectContainsPoint(v10, v9);
}

- (CALayer)leftGradientMask
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
  CALayer *leftGradientMask;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  CGRect v21;
  CGRect v22;

  v20[3] = *MEMORY[0x1E0C80C00];
  -[GKCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  leftGradientMask = self->_leftGradientMask;
  if (!leftGradientMask
    || (-[CALayer frame](leftGradientMask, "frame"),
        v22.origin.x = v5,
        v22.origin.y = v7,
        v22.size.width = v9,
        v22.size.height = v11,
        !CGRectEqualToRect(v21, v22)))
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20[1] = objc_msgSend(v16, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20[2] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setColors:", v18);

    objc_msgSend(v13, "setLocations:", &unk_1E5A5EB18);
    objc_msgSend(v13, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v13, "setEndPoint:", 0.025, 0.5);
    -[GKCollectionViewCell setLeftGradientMask:](self, "setLeftGradientMask:", v13);

  }
  return self->_leftGradientMask;
}

- (void)applyGradientMaskIfNeeded
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = self->_shouldDisplaySwipeToEditAccessories && !self->_doesAbutLeftEdge;
  -[GKCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GKCollectionViewCell leftGradientMask](self, "leftGradientMask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMask:", v5);

  }
  else
  {
    objc_msgSend(v6, "setMask:", 0);
    -[GKCollectionViewCell setLeftGradientMask:](self, "setLeftGradientMask:", 0);
  }

}

- (void)setShouldDisplaySwipeToEditAccessories:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (self->_shouldDisplaySwipeToEditAccessories != a3)
  {
    self->_shouldDisplaySwipeToEditAccessories = a3;
    if (a3)
    {
      -[GKCollectionViewCell contentView](self, "contentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", self->_topHairline);
      objc_msgSend(v4, "addSubview:", self->_bottomHairline);
      -[GKCollectionViewCell prepareHairlineConstraintsIfNeeded](self, "prepareHairlineConstraintsIfNeeded");
      -[GKCollectionViewCell addConstraints:](self, "addConstraints:", self->_hairlineConstraints);

    }
    -[GKCollectionViewCell applyGradientMaskIfNeeded](self, "applyGradientMaskIfNeeded");
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke;
    v6[3] = &unk_1E59C4148;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke_2;
    v5[3] = &unk_1E59C4430;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v6, v5, 0.5);
  }
}

void __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke(uint64_t a1, double a2)
{
  _BYTE *v3;
  double v4;
  void *v5;
  _BYTE *v6;
  unint64_t v7;
  double v8;
  id v9;

  v3 = *(_BYTE **)(a1 + 32);
  LOBYTE(a2) = v3[696];
  v4 = (double)*(unint64_t *)&a2;
  objc_msgSend(v3, "topHairline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = *(_BYTE **)(a1 + 32);
  LOBYTE(v7) = v6[696];
  v8 = (double)v7;
  objc_msgSend(v6, "bottomHairline");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

}

uint64_t __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 696))
  {
    objc_msgSend((id)result, "removeConstraints:", *(_QWORD *)(result + 792));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "removeFromSuperview");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 776), "removeFromSuperview");
  }
  return result;
}

- (void)setDoesAbutLeftEdge:(BOOL)a3
{
  if (self->_doesAbutLeftEdge != a3)
  {
    self->_doesAbutLeftEdge = a3;
    -[GKCollectionViewCell applyGradientMaskIfNeeded](self, "applyGradientMaskIfNeeded");
  }
}

- (void)prepareForReuse
{
  id representedItem;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKCollectionViewCell;
  -[GKCollectionViewCell prepareForReuse](&v12, sel_prepareForReuse);
  -[GKCollectionViewCell resetEditingContentOrigin](self, "resetEditingContentOrigin");
  representedItem = self->_representedItem;
  self->_representedItem = 0;

  -[GKCollectionViewCell staticContentView](self, "staticContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[GKCollectionViewCell staticContentView](self, "staticContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", 0.0, v6, v8, v10);

}

- (void)layoutSubviews
{
  double contentOriginX;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  contentOriginX = self->_contentOriginX;
  -[GKCollectionViewCell bounds](self, "bounds");
  v5 = v4;
  -[GKCollectionViewCell bounds](self, "bounds");
  v7 = v6;
  -[GKCollectionViewCell bounds](self, "bounds");
  -[GKStaticRenderContentView setFrame:](self->_contentRenderView, "setFrame:", contentOriginX, v5, v7);
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewCell;
  -[GKCollectionViewCell layoutSubviews](&v8, sel_layoutSubviews);
  -[GKCollectionViewCell applyGradientMaskIfNeeded](self, "applyGradientMaskIfNeeded");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewCell;
  -[GKCollectionViewCell setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[GKStaticRenderContentView setNeedsDisplay](self->_contentRenderView, "setNeedsDisplay");
}

- (void)setRepresentedItem:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_representedItem != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_representedItem, a3);
    -[GKCollectionViewCell didUpdateModel](self, "didUpdateModel");
    -[GKCollectionViewCell setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKCollectionViewCell;
  -[GKCollectionViewCell updateConstraints](&v13, sel_updateConstraints);
  -[GKCollectionViewCell leadingMargin](self, "leadingMargin");
  v4 = v3;
  -[GKCollectionViewCell trailingMargin](self, "trailingMargin");
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0DC35B0];
  -[GKCollectionViewCell staticContentView](self, "staticContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkAdjustConstraintMargins:leading:trailing:", v9, v4, v6);

  v10 = (void *)MEMORY[0x1E0DC35B0];
  -[GKCollectionViewCell interactiveContentView](self, "interactiveContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gkAdjustConstraintMargins:leading:trailing:", v12, v4, v6);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewCell;
  -[GKCollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKCollectionViewCell setDoesAbutLeftEdge:](self, "setDoesAbutLeftEdge:", objc_msgSend(v5, "doesAbutLeftOfCollectionView"));
    objc_msgSend(v5, "leadingMargin");
    -[GKCollectionViewCell setLeadingMargin:](self, "setLeadingMargin:");
    objc_msgSend(v5, "trailingMargin");
    v7 = v6;

    -[GKCollectionViewCell setTrailingMargin:](self, "setTrailingMargin:", v7);
    -[GKCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)closeForDelete
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[UIView frame](self->_staticContentView, "frame");
  -[UIView setFrame:](self->_staticContentView, "setFrame:", v3 - v4);
  -[GKCollectionViewCell interactiveContentView](self, "interactiveContentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "setFrame:", v5 - v6);
  -[GKEditActionsView maskLayer](self->_editActionsView, "maskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[GKEditActionsView maskLayer](self->_editActionsView, "maskLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v9, v11, v13, 0.0);

  -[GKHairlineView frame](self->_bottomHairline, "frame");
  -[GKHairlineView setFrame:](self->_bottomHairline, "setFrame:");
  -[GKCollectionViewCell setAlpha:](self, "setAlpha:", 0.0);

}

- (void)setEditingContentOriginX:(double)a3
{
  GKStaticRenderContentView *contentRenderView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (self->_contentOriginX != a3)
  {
    self->_contentOriginX = a3;
    CGAffineTransformMakeTranslation(&v7, a3, 0.0);
    contentRenderView = self->_contentRenderView;
    v6 = v7;
    -[GKStaticRenderContentView setTransform:](contentRenderView, "setTransform:", &v6);
    -[GKCollectionViewCell setEditActionsVisibleWidth:](self, "setEditActionsVisibleWidth:", (double)((int)-a3 & ~((int)-a3 >> 31)));
  }
}

- (double)editingContentOriginX
{
  return self->_contentOriginX;
}

- (void)resetEditingContentOrigin
{
  -[GKCollectionViewCell setEditingContentOriginX:](self, "setEditingContentOriginX:", 0.0);
}

- (void)shutActionPaneAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E59C4148;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E59C4458;
    v12 = v6;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v9, v11, 0.2);

  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetEditingContentOrigin");
}

uint64_t __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)representedItem
{
  return self->_representedItem;
}

- (UIView)staticContentView
{
  return self->_staticContentView;
}

- (void)setStaticContentView:(id)a3
{
  objc_storeStrong((id *)&self->_staticContentView, a3);
}

- (NSArray)editActions
{
  return self->_editActions;
}

- (void)setEditActions:(id)a3
{
  objc_storeStrong((id *)&self->_editActions, a3);
}

- (GKEditActionsView)editActionsView
{
  return self->_editActionsView;
}

- (GKStaticRenderContentView)contentRenderView
{
  return self->_contentRenderView;
}

- (void)setContentRenderView:(id)a3
{
  objc_storeStrong((id *)&self->_contentRenderView, a3);
}

- (void)setLeftGradientMask:(id)a3
{
  objc_storeStrong((id *)&self->_leftGradientMask, a3);
}

- (BOOL)doesAbutLeftEdge
{
  return self->_doesAbutLeftEdge;
}

- (GKHairlineView)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
  objc_storeStrong((id *)&self->_topHairline, a3);
}

- (GKHairlineView)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
  objc_storeStrong((id *)&self->_bottomHairline, a3);
}

- (NSArray)editActionsConstraints
{
  return self->_editActionsConstraints;
}

- (void)setEditActionsConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_editActionsConstraints, a3);
}

- (NSArray)hairlineConstraints
{
  return self->_hairlineConstraints;
}

- (void)setHairlineConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineConstraints, a3);
}

- (NSLayoutConstraint)contentLeftConstraint
{
  return self->_contentLeftConstraint;
}

- (void)setContentLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLeftConstraint, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLeftConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineConstraints, 0);
  objc_storeStrong((id *)&self->_editActionsConstraints, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_leftGradientMask, 0);
  objc_storeStrong((id *)&self->_contentRenderView, 0);
  objc_storeStrong((id *)&self->_editActionsView, 0);
  objc_storeStrong((id *)&self->_editActions, 0);
  objc_storeStrong((id *)&self->_staticContentView, 0);
  objc_storeStrong(&self->_representedItem, 0);
}

- (void)alignmentRectForText
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = (id)objc_opt_class();
  v5 = v9;
  _os_log_debug_impl(&dword_1AB361000, v3, OS_LOG_TYPE_DEBUG, "base %@ invoked for %@", (uint8_t *)&v6, 0x16u);

}

@end
