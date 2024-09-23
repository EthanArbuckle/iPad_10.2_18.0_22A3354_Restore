@implementation HUQuickControlSegmentedControl

- (HUQuickControlSegmentedControl)initWithSegments:(id)a3
{
  id v4;
  HUQuickControlSegmentedControl *v5;
  uint64_t v6;
  NSArray *segments;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[4];
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HUQuickControlSegmentedControl;
  v5 = -[HUQuickControlSegmentedControl init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    segments = v5->_segments;
    v5->_segments = (NSArray *)v6;

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke;
    v26[3] = &unk_1E6F52438;
    v26[4] = v27;
    objc_msgSend(v4, "na_map:", v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControl setSegmentViews:](v5, "setSegmentViews:", v8);

    -[HUQuickControlSegmentedControl _updateSegmentViewsForUILayoutDirection](v5, "_updateSegmentViewsForUILayoutDirection");
    v9 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[HUQuickControlSegmentedControl segmentViews](v5, "segmentViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);
    -[HUQuickControlSegmentedControl setSegmentStackView:](v5, "setSegmentStackView:", v11);

    -[HUQuickControlSegmentedControl segmentStackView](v5, "segmentStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlSegmentedControl segmentStackView](v5, "segmentStackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAxis:", 0);

    -[HUQuickControlSegmentedControl segmentStackView](v5, "segmentStackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDistribution:", 1);

    -[HUQuickControlSegmentedControl segmentStackView](v5, "segmentStackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControl addSubview:](v5, "addSubview:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v5, sel__handleGesture_);
    -[HUQuickControlSegmentedControl setGestureRecognizer:](v5, "setGestureRecognizer:", v16);

    -[HUQuickControlSegmentedControl gestureRecognizer](v5, "gestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMinimumPressDuration:", 0.0);

    -[HUQuickControlSegmentedControl gestureRecognizer](v5, "gestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControl addGestureRecognizer:](v5, "addGestureRecognizer:", v18);

    +[HUQuickControlSegmentedControlSegment borderInset](HUQuickControlSegmentedControlSegment, "borderInset");
    v20 = v19;
    -[HUQuickControlSegmentedControl layer](v5, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", v20);

    +[HUQuickControlSegmentedControlSegment selectedColor](HUQuickControlSegmentedControlSegment, "selectedColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "CGColor");
    -[HUQuickControlSegmentedControl layer](v5, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBorderColor:", v23);

    -[HUQuickControlSegmentedControl setClipsToBounds:](v5, "setClipsToBounds:", 1);
    -[HUQuickControlSegmentedControl _setupConstraints](v5, "_setupConstraints");
    _Block_object_dispose(v27, 8);
  }

  return v5;
}

HUQuickControlSegmentedControlSegment *__51__HUQuickControlSegmentedControl_initWithSegments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  HUQuickControlSegmentedControlSegment *v5;
  _QWORD aBlock[5];

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke_2;
  aBlock[3] = &unk_1E6F4C868;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  v5 = objc_alloc_init(HUQuickControlSegmentedControlSegment);
  -[HUQuickControlSegmentedControlSegment setTitle:](v5, "setTitle:", v3);
  -[HUQuickControlSegmentedControlSegment setTag:](v5, "setTag:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (v4)
    v4[2](v4);

  return v5;
}

uint64_t __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)setSelectedSegmentIndex:(id)a3
{
  id v5;
  NSNumber *selectedSegmentIndex;
  id v7;

  v5 = a3;
  if (self->_selectedSegmentIndex)
    selectedSegmentIndex = self->_selectedSegmentIndex;
  else
    selectedSegmentIndex = (NSNumber *)&unk_1E7040A38;
  v7 = v5;
  if ((-[NSNumber isEqual:](selectedSegmentIndex, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedSegmentIndex, a3);
    -[HUQuickControlSegmentedControl _updateSegmentSelectionStateAnimated:](self, "_updateSegmentSelectionStateAnimated:", 0);
  }

}

- (void)_handleGesture:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void (**selectedSegmentIndex)(_QWORD, _QWORD);
  void *v19;
  NSNumber *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "locationInView:", self);
  -[HUQuickControlSegmentedControl hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "tag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v21, "state");
  v10 = v8;
  if ((unint64_t)(v9 - 1) < 2)
    goto LABEL_21;
  if (v9 == 4)
  {
LABEL_20:
    v10 = 0;
LABEL_21:
    -[HUQuickControlSegmentedControl setTrackingSegmentIndex:](self, "setTrackingSegmentIndex:", v10);
    -[HUQuickControlSegmentedControl _updateSegmentSelectionStateAnimated:](self, "_updateSegmentSelectionStateAnimated:", 1);
    goto LABEL_22;
  }
  if (v9 == 3)
  {
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      -[HUQuickControlSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex", v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    -[HUQuickControlSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

      v20 = v12;
      selectedSegmentIndex = (void (**)(_QWORD, _QWORD))self->_selectedSegmentIndex;
      self->_selectedSegmentIndex = v20;
    }
    else
    {
      v14 = (void *)v13;
      -[HUQuickControlSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "isEqual:", v15);

      objc_storeStrong((id *)&self->_selectedSegmentIndex, v12);
      if ((v16 & 1) != 0)
        goto LABEL_19;
      -[HUQuickControlSegmentedControl selectionChangeHandler](self, "selectionChangeHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_19;
      -[HUQuickControlSegmentedControl selectionChangeHandler](self, "selectionChangeHandler");
      selectedSegmentIndex = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HUQuickControlSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))selectedSegmentIndex)[2](selectedSegmentIndex, v19);

    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_22:

}

- (void)_updateSegmentSelectionStateAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.15;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke;
  v4[3] = &unk_1E6F4D988;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, v3);
}

void __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "segmentViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke_2;
  v3[3] = &unk_1E6F52460;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedSegmentIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", objc_msgSend(v7, "isEqual:", v8));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trackingSegmentIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(v10, "isEqual:", v9));

}

- (void)_updateSegmentViewsForUILayoutDirection
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = -[HUQuickControlSegmentedControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (!-[HUQuickControlSegmentedControl preferVerticalLayout](self, "preferVerticalLayout"))
  {
    v4 = v3 == 1;
    -[HUQuickControlSegmentedControl segmentViews](self, "segmentViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke;
    v6[3] = &unk_1E6F524B0;
    v7 = v4;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

void __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  _QWORD v7[6];

  v6 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "segments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v5, "count") + ~a3;

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2;
  v7[3] = &unk_1E6F52488;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a3;
  objc_msgSend(v6, "setRoundedCorners:", __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2((uint64_t)v7));

}

uint64_t __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
    return 5;
  objc_msgSend(*(id *)(a1 + 32), "segments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") - 1;

  if (v1 == v3)
    return 10;
  else
    return 0;
}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  double v5;
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
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControl layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderWidth");
  v5 = v4;

  -[HUQuickControlSegmentedControl segmentStackView](self, "segmentStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControl centerXAnchor](self, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v9);

  -[HUQuickControlSegmentedControl segmentStackView](self, "segmentStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControl centerYAnchor](self, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v13);

  -[HUQuickControlSegmentedControl segmentStackView](self, "segmentStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControl widthAnchor](self, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5 * -2.0;
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v18);

  -[HUQuickControlSegmentedControl segmentStackView](self, "segmentStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControl heightAnchor](self, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSegmentedControl;
  -[HUQuickControlSegmentedControl traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUQuickControlSegmentedControl _updateSegmentViewsForUILayoutDirection](self, "_updateSegmentViewsForUILayoutDirection");
}

- (BOOL)preferVerticalLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  double v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HUQuickControlSegmentedControl segmentViews](self, "segmentViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = *MEMORY[0x1E0CEB980];
    v8 = *(double *)(MEMORY[0x1E0CEB980] + 8);
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "systemLayoutSizeFittingSize:", v7, v8);
        v9 = v9 + v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v9 = 0.0;
  }

  -[HUQuickControlSegmentedControl superview](self, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = v9 > CGRectGetWidth(v21);

  return v13;
}

- (void)ensureCorrectHeaderViewOrientation
{
  _BOOL4 v3;
  _BOOL8 v4;
  id v5;

  -[HUQuickControlSegmentedControl segmentStackView](self, "segmentStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HUQuickControlSegmentedControl preferVerticalLayout](self, "preferVerticalLayout");
  v4 = !v3;
  objc_msgSend(v5, "setAxis:", v3);
  objc_msgSend(v5, "setDistribution:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSegmentedControl;
  -[HUQuickControlSegmentedControl layoutSubviews](&v6, sel_layoutSubviews);
  -[HUQuickControlSegmentedControl ensureCorrectHeaderViewOrientation](self, "ensureCorrectHeaderViewOrientation");
  -[HUQuickControlSegmentedControl bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[HUQuickControlSegmentedControl layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlSegmentedControl bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, 0.0, -10.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[HUQuickControlSegmentedControl pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[HUQuickControlSegmentedControl segmentViews](self, "segmentViews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v15, "center");
          UIDistanceBetweenPoints();
          if (v16 < v13)
          {
            v17 = v16;
            v18 = v15;

            v13 = v17;
            v11 = v18;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasCenteredContent
{
  return 1;
}

- (id)selectionChangeHandler
{
  return self->_selectionChangeHandler;
}

- (void)setSelectionChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSNumber)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (UIStackView)segmentStackView
{
  return self->_segmentStackView;
}

- (void)setSegmentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_segmentStackView, a3);
}

- (NSArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
  objc_storeStrong((id *)&self->_segmentViews, a3);
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (NSNumber)trackingSegmentIndex
{
  return self->_trackingSegmentIndex;
}

- (void)setTrackingSegmentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_trackingSegmentIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingSegmentIndex, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_segmentStackView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_selectedSegmentIndex, 0);
  objc_storeStrong(&self->_selectionChangeHandler, 0);
}

@end
