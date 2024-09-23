@implementation CAMExpandingControl

- (CAMExpandingControl)initWithFrame:(CGRect)a3
{
  CAMExpandingControl *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *menuButtons;
  uint64_t v7;
  UILongPressGestureRecognizer *longPress;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CAMExpandingControl;
  v3 = -[CAMExpandingControl initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl setTintColor:](v3, "setTintColor:", v4);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    menuButtons = v3->__menuButtons;
    v3->__menuButtons = (NSMutableArray *)v5;

    v3->_orientation = 1;
    v3->_longPressEnabled = 1;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__handleLongPress_);
    longPress = v3->__longPress;
    v3->__longPress = (UILongPressGestureRecognizer *)v7;

    -[UILongPressGestureRecognizer setDelegate:](v3->__longPress, "setDelegate:", v3);
    -[CAMExpandingControl addGestureRecognizer:](v3, "addGestureRecognizer:", v3->__longPress);
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[CAMExpandingControl registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v9, &__block_literal_global_23);

  }
  return v3;
}

void __37__CAMExpandingControl_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateTitleViewAnimated:", 0);
  objc_msgSend(v2, "setNeedsLayout");
  if (objc_msgSend(v2, "isExpanded"))
    objc_msgSend(v2, "_updateMenuButtonsAnimated:", 0);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMExpandingControl _titleView](self, "_titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  CEKRectWithSize();
  objc_msgSend(v2, "frameForAlignmentRect:");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t i;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[5];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;

  v98 = *MEMORY[0x1E0C80C00];
  -[CAMExpandingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CAMExpandingControl traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v81 = v8;

  -[CAMExpandingControl _titleView](self, "_titleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _expandedBackground](self, "_expandedBackground");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _expandedTitleBackground](self, "_expandedTitleBackground");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CAMExpandingControl isExpanded](self, "isExpanded");
  if (v12)
    -[CAMExpandingControl expansionInsets](self, "expansionInsets");
  UIRectInset();
  -[CAMExpandingControl intrinsicContentSize](self, "intrinsicContentSize");
  CEKSizeScale();
  UISizeRoundToScale();
  v14 = v13;
  v16 = fmin(v15, v6);
  v17 = -[CAMExpandingControl titleStyle](self, "titleStyle");
  if (v17 == 1)
  {
    v16 = v6;
    v18 = v4;
  }
  else
  {
    v18 = v14;
  }
  if (v18 < v16)
    v18 = v16;
  if (v10)
  {
    v19 = v18;
    UIRectCenteredYInRect();
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(v10, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", fmin(v16, 34.0) * 0.5);

    v18 = v19;
  }
  if (v9)
  {
    CEKRectWithSize();
    v78 = v22;
    v79 = v21;
    v76 = v24;
    v77 = v23;
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v11, "setBounds:", v79, v78, v77, v76, v81);
    UIRectGetCenter();
    objc_msgSend(v11, "setCenter:");
    objc_msgSend(v11, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCornerRadius:", v16 * 0.5);

    objc_msgSend(v9, "intrinsicContentSize");
    CEKSizeCeilToScale();
    CEKSizeMax();
    CEKRectWithSize();
    objc_msgSend(v9, "setBounds:");
    objc_msgSend(v9, "bounds");
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    objc_msgSend(v9, "setCenter:", v81);
  }
  -[CAMExpandingControl _menuButtons](self, "_menuButtons", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl menu](self, "menu");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v28 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9)
    {
      if (v17 == 1)
      {
        -[CAMExpandingControl _selectedMenuItem](self, "_selectedMenuItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "indexOfObject:", v29);

        v28 = 0x7FFFFFFFFFFFFFFFLL;
        if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = (void *)objc_msgSend(v26, "mutableCopy");
          objc_msgSend(v31, "setObject:atIndexedSubscript:", v9, v30);

          v28 = v30;
          v26 = v31;
        }
      }
    }
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __37__CAMExpandingControl_layoutSubviews__block_invoke;
    v94[3] = &__block_descriptor_40_e44_B32__0__CAMExpandingControlMenuItem_8Q16_B24l;
    v94[4] = v28;
    objc_msgSend(v27, "indexesOfObjectsPassingTest:", v94);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
    {
      v33 = (void *)objc_msgSend(v26, "mutableCopy");
      objc_msgSend(v33, "removeObjectsAtIndexes:", v32);

      v26 = v33;
    }
    objc_msgSend(v9, "frame");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    objc_msgSend(v10, "frame");
    v99.origin.x = v35;
    v99.origin.y = v37;
    v99.size.width = v39;
    v99.size.height = v41;
    CGRectGetMaxX(v99);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v42 = v26;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
    v75 = v11;
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v91;
      v46 = 0.0;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v91 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "intrinsicContentSize");
          v46 = v46 + v48;
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      }
      while (v44);
    }

    objc_msgSend(v42, "count");
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v54 = v42;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v87 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend(v59, "intrinsicContentSize");
          CEKSizeCeilToScale();
          CEKSizeMax();
          CEKRectWithSize();
          v61 = v60;
          v63 = v62;
          v65 = v64;
          v80 = v66;
          UIRectCenteredYInRectScale();
          v68 = v67;
          v70 = v69;
          v72 = v71;
          UIRoundToScale();
          v74 = v73;
          UIRectGetCenter();
          objc_msgSend(v59, "setCenter:", v81);
          objc_msgSend(v59, "setBounds:", v61, v63, v65, v80);
          v100.origin.x = v74;
          v100.origin.y = v68;
          v100.size.width = v70;
          v100.size.height = v72;
          CGRectGetMaxX(v100);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      }
      while (v56);
    }

    v11 = v75;
  }
  else
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v32 = v26;
    v49 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v83 != v51)
            objc_enumerationMutation(v32);
          v53 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
          objc_msgSend(v53, "intrinsicContentSize");
          CEKSizeCeilToScale();
          CEKRectWithSize();
          objc_msgSend(v53, "setBounds:");
          UIRectCenteredIntegralRectScale();
          UIRectGetCenter();
          objc_msgSend(v53, "setCenter:", v81);
        }
        v50 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      }
      while (v50);
    }
    v54 = v32;
  }

}

BOOL __37__CAMExpandingControl_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hidden"))
    v6 = *(_QWORD *)(a1 + 32) != a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[CAMExpandingControl isExpanded](self, "isExpanded"))
  {
    -[CAMExpandingControl _expandedBackground](self, "_expandedBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMExpandingControl;
    v9 = -[CAMExpandingControl pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  CAMExpandingControl *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMExpandingControl;
  -[CAMExpandingControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMExpandingControl isExpanded](self, "isExpanded"))
  {
    v6 = -[CAMExpandingControl titleStyle](self, "titleStyle") != 1;
    if (!v5)
      return v5;
  }
  else
  {
    v6 = 1;
    if (!v5)
      return v5;
  }
  -[CAMExpandingControl _titleView](self, "_titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v7)
    v6 = 0;

  if (v6)
  {
    v8 = self;

    v5 = v8;
  }
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[CAMExpandingControl isHighlighted](self, "isHighlighted");
  v10.receiver = self;
  v10.super_class = (Class)CAMExpandingControl;
  -[CAMExpandingControl setHighlighted:](&v10, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMExpandingControl _updateExpandedBackgroundsAnimated:](self, "_updateExpandedBackgroundsAnimated:", 1);
    if (!-[CAMExpandingControl isExpanded](self, "isExpanded") || !v3)
    {
      -[CAMExpandingControl _titleView](self, "_titleView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper setLayer:highlighted:inverted:animated:layoutStyle:](CAMAnimationHelper, "setLayer:highlighted:inverted:animated:layoutStyle:", v7, v3, 1, 1, 4);

      -[CAMExpandingControl _expandedTitleBackground](self, "_expandedTitleBackground");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper setLayer:highlighted:inverted:animated:layoutStyle:](CAMAnimationHelper, "setLayer:highlighted:inverted:animated:layoutStyle:", v9, v3, 1, 1, 4);

    }
  }
}

- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  CAMExpandingControl *v30;
  const char *v31;
  id v32;
  id obj;
  char v34;
  uint64_t v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[CAMExpandingControl isExpanded](self, "isExpanded");
  if (!v9)
    goto LABEL_25;
  if (!v10)
    goto LABEL_25;
  objc_msgSend(v9, "touchesForView:", self);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_25;
  v12 = (void *)v11;
  -[CAMExpandingControl _menuButtons](self, "_menuButtons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[CAMExpandingControl _titleView](self, "_titleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CAMExpandingControl _titleView](self, "_titleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v18)
  {

    goto LABEL_26;
  }
  v19 = v18;
  v30 = self;
  v31 = a3;
  v32 = v8;
  obj = v17;
  v34 = 0;
  v35 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v42 != v35)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v22 = v14;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v23)
      {
        v24 = v23;
        v25 = v14;
        v26 = *(_QWORD *)v38;
        while (2)
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_msgSend(v21, "locationInView:", v28, v30, v31, v32);
            objc_msgSend(v28, "hitTest:withEvent:", v9);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              v34 = 1;
              goto LABEL_21;
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v24)
            continue;
          break;
        }
LABEL_21:
        v14 = v25;
      }

    }
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  }
  while (v19);

  a3 = v31;
  v8 = v32;
  self = v30;
  if ((v34 & 1) != 0)
  {
LABEL_25:
    v36.receiver = self;
    v36.super_class = (Class)CAMExpandingControl;
    -[CAMExpandingControl sendAction:to:forEvent:](&v36, sel_sendAction_to_forEvent_, a3, v8, v9, v30, v31, v32);
  }
LABEL_26:

}

- (void)setBackgroundMaterial:(unint64_t)a3
{
  if (self->_backgroundMaterial != a3)
  {
    self->_backgroundMaterial = a3;
    -[CAMExpandingControl _updateExpandedBackgroundsAnimated:](self, "_updateExpandedBackgroundsAnimated:", 0);
  }
}

- (void)setTitleStyle:(int64_t)a3
{
  if (self->_titleStyle != a3)
  {
    self->_titleStyle = a3;
    -[CAMExpandingControl _updateTitleViewAnimated:](self, "_updateTitleViewAnimated:", 0);
    -[CAMExpandingControl _updateExpandedBackgroundsAnimated:](self, "_updateExpandedBackgroundsAnimated:", 0);
    -[CAMExpandingControl _setNeedsUpdateMenuButtonsAnimated:](self, "_setNeedsUpdateMenuButtonsAnimated:", 0);
    -[CAMExpandingControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsContentShadows:(BOOL)a3
{
  if (self->_showsContentShadows != a3)
  {
    self->_showsContentShadows = a3;
    -[CAMExpandingControl _updateTitleViewAnimated:](self, "_updateTitleViewAnimated:", 0);
    -[CAMExpandingControl _setNeedsUpdateMenuButtonsAnimated:](self, "_setNeedsUpdateMenuButtonsAnimated:", 0);
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[CAMExpandingControl setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (self->_expanded != a3)
  {
    v4 = a4;
    v5 = a3;
    if (a4)
    {
      if (a3)
        -[CAMExpandingControl _updateMenuButtonsIfNeededAnimated:](self, "_updateMenuButtonsIfNeededAnimated:", 0);
      -[CAMExpandingControl _updateExpandedBackgroundsAnimated:](self, "_updateExpandedBackgroundsAnimated:", 0);
      -[CAMExpandingControl layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMExpandingControl delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expandingControl:willChangeExpanded:animated:", self, v5, 1);

      self->_expanded = v5;
      -[CAMExpandingControl setNeedsLayout](self, "setNeedsLayout");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__CAMExpandingControl_setExpanded_animated___block_invoke;
      v10[3] = &unk_1EA328868;
      v10[4] = self;
      -[CAMExpandingControl _animateExpandedWithAnimations:](self, "_animateExpandedWithAnimations:", v10);
    }
    else
    {
      -[CAMExpandingControl delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "expandingControl:willChangeExpanded:animated:", self, v5, 0);

      self->_expanded = v5;
      -[CAMExpandingControl setNeedsLayout](self, "setNeedsLayout");
    }
    -[CAMExpandingControl _updateMenuButtonsAnimated:](self, "_updateMenuButtonsAnimated:", v4);
    -[CAMExpandingControl _updateExpandedBackgroundsAnimated:](self, "_updateExpandedBackgroundsAnimated:", v4);
    -[CAMExpandingControl _updateTitleViewAnimated:](self, "_updateTitleViewAnimated:", v4);
    -[CAMExpandingControl delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expandingControl:didChangeExpanded:animated:", self, v5, v4);

  }
}

uint64_t __44__CAMExpandingControl_setExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_animateExpandedWithAnimations:(id)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = -[CAMExpandingControl expansionAnimation](self, "expansionAnimation");
  v5 = 0.5;
  if (v4 == 1)
    v5 = 0.7;
  v6 = 1.0;
  if (v4 == 1)
    v7 = 0.7;
  else
    v7 = 1.0;
  if (v4 == 1)
    v6 = 2.0;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v8, 0, v5, 0.0, v7, v6);

}

- (void)_updateExpandedBackgroundsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  double v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  CAMExpandingControl *v22;
  id v23;
  BOOL v24;
  BOOL v25;

  v3 = a3;
  -[CAMExpandingControl _expandedBackground](self, "_expandedBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _expandedTitleBackground](self, "_expandedTitleBackground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMExpandingControl isExpanded](self, "isExpanded");
  v8 = -[CAMExpandingControl backgroundMaterial](self, "backgroundMaterial");
  if (v8 == 1)
  {
    v9 = (void *)MEMORY[0x1E0DC3658];
    v11 = 0.0;
    v10 = 0.5;
  }
  else
  {
    if (v8)
    {
      v12 = 0;
      if (v5)
        goto LABEL_6;
LABEL_8:
      -[CAMExpandingControl _createBackgroundWithColor:](self, "_createBackgroundWithColor:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMExpandingControl set_expandedBackground:](self, "set_expandedBackground:", v5);
      -[CAMExpandingControl insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0DC3658];
    v10 = 0.11;
    v11 = 1.0;
  }
  objc_msgSend(v9, "colorWithWhite:alpha:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(v5, "setBackgroundColor:", v12);
LABEL_9:
  v13 = -[CAMExpandingControl _wantsTitleBackground](self, "_wantsTitleBackground");
  v14 = v13;
  if (!v6 && v13)
  {
    -[CAMExpandingControl _createBackgroundWithColor:](self, "_createBackgroundWithColor:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl _setTitleBackground:](self, "_setTitleBackground:", v6);
    -[CAMExpandingControl insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v5);
  }
  if (v3)
    v15 = 0.5;
  else
    v15 = 0.0;
  if (v3 && !v7)
  {
    if (-[CAMExpandingControl isHighlighted](self, "isHighlighted"))
      v15 = 0.5;
    else
      v15 = 0.25;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__CAMExpandingControl__updateExpandedBackgroundsAnimated___block_invoke;
  v19[3] = &unk_1EA32C2F0;
  v24 = v7;
  v20 = v5;
  v21 = v6;
  v25 = v14;
  v22 = self;
  v23 = v12;
  v16 = v12;
  v17 = v6;
  v18 = v5;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v19, 0, v15, 1.0, 1.0);

}

void __58__CAMExpandingControl__updateExpandedBackgroundsAnimated___block_invoke(uint64_t a1, double a2)
{
  double v3;
  int v4;
  id v5;

  LOBYTE(a2) = *(_BYTE *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
  if (*(_BYTE *)(a1 + 64) || (v4 = objc_msgSend(*(id *)(a1 + 48), "isHighlighted"), v3 = 0.0, v4))
  {
    LOBYTE(v3) = *(_BYTE *)(a1 + 65);
    v3 = (double)*(unint64_t *)&v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v3);
  if ((objc_msgSend(*(id *)(a1 + 48), "isExpanded") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setBackgroundColor:", *(_QWORD *)(a1 + 56));
  }
}

- (BOOL)_wantsTitleBackground
{
  CAMExpandingControl *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  -[CAMExpandingControl _selectedMenuItem](self, "_selectedMenuItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "titleBorder");

  LOBYTE(v2) = (v5 | -[CAMExpandingControl titleStyle](v2, "titleStyle")) == 0;
  return (char)v2;
}

- (id)_createBackgroundWithColor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0DC3F10];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  return v5;
}

- (void)_updateTitleViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _CAMExpandingControlButton *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  id v27;

  v3 = a3;
  -[CAMExpandingControl _selectedMenuItem](self, "_selectedMenuItem");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _titleView](self, "_titleView");
  v5 = (_CAMExpandingControlButton *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMExpandingControl isExpanded](self, "isExpanded");
  objc_opt_class();
  v26 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "titleText");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v27, "titleImage");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v7 = 0;
  }
  if (v7 | v8 && !v5)
  {
    v5 = objc_alloc_init(_CAMExpandingControlButton);
    -[CAMExpandingControl addSubview:](self, "addSubview:", v5);
    -[CAMExpandingControl _setTitleView:](self, "_setTitleView:", v5);
  }
  if (v7)
  {
    -[_CAMExpandingControlButton setTitleText:](v5, "setTitleText:", v7);
    -[_CAMExpandingControlButton setTitleImage:](v5, "setTitleImage:", 0);
  }
  else if (v8)
  {
    -[_CAMExpandingControlButton setTitleImage:](v5, "setTitleImage:", v8);
    -[_CAMExpandingControlButton setTitleText:](v5, "setTitleText:", 0);
  }
  -[_CAMExpandingControlButton setAlpha:](v5, "setAlpha:", 1.0);
  objc_msgSend(v27, "_configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tintsTitle");

  objc_msgSend(v27, "_configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "slashesTitle");

  v13 = -[CAMExpandingControl _wantsTitleBackground](self, "_wantsTitleBackground");
  objc_msgSend(v27, "_configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "titleBorder");

  -[_CAMExpandingControlButton setSlashed:animated:](v5, "setSlashed:animated:", v12, v3);
  -[_CAMExpandingControlButton setBorder:](v5, "setBorder:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CAMExpandingControl titleStyle](self, "titleStyle");
  if (v17 == 1)
  {
    if (((-[CAMExpandingControl isExpanded](self, "isExpanded") | v10) & 1) != 0)
      -[CAMExpandingControl tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CAMExpandingControlButton setTintColor:](v5, "setTintColor:", v19);
  }
  else
  {
    if (v17)
      goto LABEL_27;
    if (v26 && v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v10)
        goto LABEL_27;
      -[CAMExpandingControl tintColor](self, "tintColor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;
    v16 = (void *)v18;
  }

LABEL_27:
  -[_CAMExpandingControlButton setTintColor:](v5, "setTintColor:", v16);
  -[_CAMExpandingControlButton setOrientation:animated:](v5, "setOrientation:animated:", -[CAMExpandingControl orientation](self, "orientation"), v3);
  v20 = *MEMORY[0x1E0C9D820];
  v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[_CAMExpandingControlButton layer](v5, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowOffset:", v20, v21);

  if (-[CAMExpandingControl showsContentShadows](self, "showsContentShadows"))
    v23 = 0.2;
  else
    v23 = 0.0;
  -[_CAMExpandingControlButton layer](v5, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = v23;
  objc_msgSend(v24, "setShadowOpacity:", v25);

}

- (void)setSelectedState:(id)a3
{
  -[CAMExpandingControl setSelectedState:animated:](self, "setSelectedState:animated:", a3, 0);
}

- (void)setSelectedState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[CAMExpandingControl selectedState](self, "selectedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToValue:", v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedState, a3);
    -[CAMExpandingControl _updateSelectedMenuItemAnimated:](self, "_updateSelectedMenuItemAnimated:", v4);
  }

}

- (void)setMenu:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_menu) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    -[CAMExpandingControl _updateSelectedMenuItemAnimated:](self, "_updateSelectedMenuItemAnimated:", 0);
    -[CAMExpandingControl _setNeedsUpdateMenuButtonsAnimated:](self, "_setNeedsUpdateMenuButtonsAnimated:", 0);
  }

}

- (void)_updateSelectedMenuItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  -[CAMExpandingControl selectedState](self, "selectedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CAMExpandingControl__updateSelectedMenuItemAnimated___block_invoke;
  v10[3] = &unk_1EA32C318;
  v9 = v5;
  v11 = v9;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl _setSelectedMenuItem:](self, "_setSelectedMenuItem:", v8);
    -[CAMExpandingControl _updateTitleViewAnimated:](self, "_updateTitleViewAnimated:", v3);
    -[CAMExpandingControl _setNeedsUpdateMenuButtonsAnimated:](self, "_setNeedsUpdateMenuButtonsAnimated:", v3);
    -[CAMExpandingControl setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __55__CAMExpandingControl__updateSelectedMenuItemAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToValue:", v3);

  return v4;
}

- (void)_setNeedsUpdateMenuButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->__needsUpdateMenuButtons = 1;
  if (-[CAMExpandingControl isExpanded](self, "isExpanded"))
    -[CAMExpandingControl _updateMenuButtonsIfNeededAnimated:](self, "_updateMenuButtonsIfNeededAnimated:", v3);
}

- (void)_updateMenuButtonsIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CAMExpandingControl _needsUpdateMenuButtons](self, "_needsUpdateMenuButtons"))
  {
    self->__needsUpdateMenuButtons = 0;
    -[CAMExpandingControl _updateMenuButtonsAnimated:](self, "_updateMenuButtonsAnimated:", v3);
  }
}

- (void)_updateMenuButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  CAMExpandingControl *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  -[CAMExpandingControl _menuButtons](self, "_menuButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMExpandingControl isExpanded](self, "isExpanded");
  while (1)
  {
    v8 = objc_msgSend(v5, "count");
    if (v8 >= objc_msgSend(v6, "count"))
      break;
    -[CAMExpandingControl _createMenuButton](self, "_createMenuButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl addSubview:](self, "addSubview:", v9);
    objc_msgSend(v5, "addObject:", v9);

  }
  while (1)
  {
    v11 = objc_msgSend(v5, "count");
    if (v11 <= objc_msgSend(v6, "count"))
      break;
    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    objc_msgSend(v5, "removeLastObject");
  }
  v12 = -[CAMExpandingControl orientation](self, "orientation");
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  CAMOrientationTransform(v12, (uint64_t)&v36);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke;
  v23[3] = &unk_1EA32C340;
  v13 = v6;
  v24 = v13;
  v25 = self;
  v30 = v7;
  v31 = v3;
  v26 = &v32;
  v27 = v36;
  v28 = v37;
  v29 = v38;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v23);
  if (*((_BYTE *)v33 + 24))
    v14 = v12;
  else
    v14 = 1;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v39, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "setOrientation:animated:", v14, v3, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v39, 16);
    }
    while (v16);
  }

  _Block_object_dispose(&v32, 8);
}

void __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  BOOL v17;
  double v18;
  BOOL v19;
  char v20;
  double v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  BOOL v30;
  double v31;
  double v32;
  void *v33;
  float v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, double);
  void *v40;
  id v41;
  char v42;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_selectedMenuItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v10);

    if (objc_msgSend(*(id *)(a1 + 40), "titleStyle") != 1)
    {
      objc_msgSend(v6, "selectedSubtitle");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v8);

    if (objc_msgSend(*(id *)(a1 + 40), "titleStyle") != 1)
    {
      objc_msgSend(v6, "subtitle");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v12 = (void *)v9;
      v11 = 0;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "titleText");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "titleImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
LABEL_14:
  objc_msgSend(v5, "setTitleText:", v12);
  objc_msgSend(v5, "setTitleImage:", v11);
  v13 = objc_msgSend(*(id *)(a1 + 40), "titleStyle");
  objc_msgSend(v6, "_configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hidden");

  v16 = *(unsigned __int8 *)(a1 + 104);
  v17 = *(_BYTE *)(a1 + 104) == 0;
  v18 = 0.5;
  if (!*(_BYTE *)(a1 + 104))
    v18 = 0.25;
  v19 = v13 == 1 && v6 == v7;
  if (v19)
    v17 = 1;
  v20 = (v17 | v15) ^ 1;
  v19 = *(_BYTE *)(a1 + 105) == 0;
  v38 = 3221225472;
  v37 = MEMORY[0x1E0C809B0];
  v39 = __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke_2;
  v40 = &unk_1EA328908;
  if (v19)
    v21 = 0.0;
  else
    v21 = v18;
  v22 = 2 * v16;
  v41 = v5;
  v42 = v20;
  v23 = v5;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v22, &v37, 0, v21, 1.0, 1.0);
  objc_msgSend(v23, "bounds", v37, v38, v39, v40);
  v26 = fabs(v24 * *(double *)(a1 + 80) + *(double *)(a1 + 64) * v25);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = v26 <= v28 && *(_BYTE *)(v27 + 24) != 0;
  *(_BYTE *)(v27 + 24) = v30;
  v31 = *MEMORY[0x1E0C9D820];
  v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v23, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setShadowOffset:", v31, v32);

  if (objc_msgSend(*(id *)(a1 + 40), "showsContentShadows"))
    v34 = 0.2;
  else
    v34 = 0.0;
  objc_msgSend(v23, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v36 = v34;
  objc_msgSend(v35, "setShadowOpacity:", v36);

}

uint64_t __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke_2(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

- (void)_handleMenuButtonReleased:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CAMExpandingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  -[CAMExpandingControl _menuButtons](self, "_menuButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CAMExpandingControl menu](self, "menu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl setSelectedState:](self, "setSelectedState:", v9);

    -[CAMExpandingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)_createMenuButton
{
  _CAMExpandingControlButton *v3;
  _OWORD v5[3];
  _OWORD v6[3];

  v3 = objc_alloc_init(_CAMExpandingControlButton);
  -[_CAMExpandingControlButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__handleMenuButtonReleased_, 64);
  -[_CAMExpandingControlButton setAlpha:](v3, "setAlpha:", (double)-[CAMExpandingControl isExpanded](self, "isExpanded"));
  if (-[CAMExpandingControl orientation](self, "orientation") == 2)
  {
    CAMOrientationTransform(-[CAMExpandingControl orientation](self, "orientation"), (uint64_t)v6);
    v5[0] = v6[0];
    v5[1] = v6[1];
    v5[2] = v6[2];
    -[_CAMExpandingControlButton setTransform:](v3, "setTransform:", v5);
  }
  return v3;
}

- (void)_handleLongPress:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
    -[CAMExpandingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  -[CAMExpandingControl _longPress](self, "_longPress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    if (-[CAMExpandingControl isExpanded](self, "isExpanded"))
    {

    }
    else
    {
      v7 = -[CAMExpandingControl isLongPressEnabled](self, "isLongPressEnabled");

      if (v7)
        goto LABEL_3;
    }
    v6 = 0;
    goto LABEL_8;
  }

LABEL_3:
  v6 = 1;
LABEL_8:

  return v6;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMExpandingControl setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMExpandingControl _updateTitleViewAnimated:](self, "_updateTitleViewAnimated:", a4);
    -[CAMExpandingControl _setNeedsUpdateMenuButtonsAnimated:](self, "_setNeedsUpdateMenuButtonsAnimated:", v4);
  }
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[CAMExpandingControl isExpanded](self, "isExpanded"))
    -[CAMExpandingControl _buttonForHUDManager:](self, "_buttonForHUDManager:", v4);
  else
    -[CAMExpandingControl _titleView](self, "_titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _hudItemForButton:](self, "_hudItemForButton:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  CAMExpandingControl *v4;
  CAMExpandingControl *v5;
  CAMExpandingControl *v6;

  -[CAMExpandingControl _buttonForHUDManager:](self, "_buttonForHUDManager:", a3);
  v6 = (CAMExpandingControl *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _titleView](self, "_titleView");
  v4 = (CAMExpandingControl *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
    v5 = self;
  -[CAMExpandingControl sendActionsForControlEvents:](v5, "sendActionsForControlEvents:", 64);

}

- (id)_buttonForHUDManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMExpandingControl _menuButtons](self, "_menuButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl _titleView](self, "_titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "locationOfAccessibilityGestureInView:", v12, (_QWORD)v15);
        objc_msgSend(v12, "hitTest:withEvent:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_hudItemForButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  _CAMExpandingControlButton *v19;
  _CAMExpandingControlButton *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  if (v4)
  {
    -[CAMExpandingControl _menuButtons](self, "_menuButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CAMExpandingControl _selectedMenuItem](self, "_selectedMenuItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CAMExpandingControl menu](self, "menu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "_configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC1358];
    v12 = *MEMORY[0x1E0DC4A88];
    -[CAMExpandingControl traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    v16 = v15;

    -[CAMExpandingControl _titleView](self, "_titleView");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "axHUDSymbolName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (v17 == v4)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v4, "titleText");
        v19 = (_CAMExpandingControlButton *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "axHUDSymbolConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v23, "configurationByApplyingConfiguration:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "systemImageNamed:withConfiguration:", v18, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_alloc(MEMORY[0x1E0DC3418]);
      v8 = (void *)objc_msgSend(v28, "initWithTitle:image:imageInsets:scaleImage:", v19, v27, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

    }
    else
    {
      v20 = [_CAMExpandingControlButton alloc];
      objc_msgSend(v4, "bounds");
      CEKRectWithSize();
      v19 = -[_CAMExpandingControlButton initWithFrame:](v20, "initWithFrame:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_imageWithConfiguration:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CAMExpandingControlButton setTitleImage:](v19, "setTitleImage:", v22);

      }
      else
      {
        objc_msgSend(v4, "titleText");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CAMExpandingControlButton setTitleText:font:](v19, "setTitleText:font:", v29, v30);

        objc_msgSend(v4, "titleImage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CAMExpandingControlButton setTitleImage:](v19, "setTitleImage:", v21);
      }

      -[_CAMExpandingControlButton setSlashed:](v19, "setSlashed:", objc_msgSend(v4, "isSlashed"));
      -[_CAMExpandingControlButton setBorder:](v19, "setBorder:", 0);
      -[_CAMExpandingControlButton setSlashSize:](v19, "setSlashSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CAMExpandingControlButton setTintColor:](v19, "setTintColor:", v31);

      -[_CAMExpandingControlButton traitOverrides](v19, "traitOverrides");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLegibilityWeight:", 1);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3418]), "initWithCustomView:", v19);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlStatusType
{
  return self->_controlStatusType;
}

- (void)setControlStatusType:(unint64_t)a3
{
  self->_controlStatusType = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CAMExpandingControlDelegate)delegate
{
  return (CAMExpandingControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)titleStyle
{
  return self->_titleStyle;
}

- (unint64_t)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (BOOL)showsContentShadows
{
  return self->_showsContentShadows;
}

- (int64_t)expansionAnimation
{
  return self->_expansionAnimation;
}

- (void)setExpansionAnimation:(int64_t)a3
{
  self->_expansionAnimation = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (_CAMExpandingControlButton)_titleView
{
  return self->__titleView;
}

- (void)_setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->__titleView, a3);
}

- (UIView)_expandedTitleBackground
{
  return self->__expandedTitleBackground;
}

- (void)_setTitleBackground:(id)a3
{
  objc_storeStrong((id *)&self->__expandedTitleBackground, a3);
}

- (CAMExpandingControlMenuItem)_selectedMenuItem
{
  return self->__selectedMenuItem;
}

- (void)_setSelectedMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->__selectedMenuItem, a3);
}

- (NSMutableArray)_menuButtons
{
  return self->__menuButtons;
}

- (BOOL)_needsUpdateMenuButtons
{
  return self->__needsUpdateMenuButtons;
}

- (UIView)_expandedBackground
{
  return self->__expandedBackground;
}

- (void)set_expandedBackground:(id)a3
{
  objc_storeStrong((id *)&self->__expandedBackground, a3);
}

- (UILongPressGestureRecognizer)_longPress
{
  return self->__longPress;
}

- (UIEdgeInsets)expansionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expansionInsets.top;
  left = self->_expansionInsets.left;
  bottom = self->_expansionInsets.bottom;
  right = self->_expansionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  self->_expansionInsets = a3;
}

- (NSArray)menu
{
  return self->_menu;
}

- (NSValue)selectedState
{
  return self->_selectedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedState, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->__longPress, 0);
  objc_storeStrong((id *)&self->__expandedBackground, 0);
  objc_storeStrong((id *)&self->__menuButtons, 0);
  objc_storeStrong((id *)&self->__selectedMenuItem, 0);
  objc_storeStrong((id *)&self->__expandedTitleBackground, 0);
  objc_storeStrong((id *)&self->__titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
