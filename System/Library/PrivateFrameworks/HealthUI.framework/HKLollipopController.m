@implementation HKLollipopController

- (HKLollipopController)initWithAnnotationDataSource:(id)a3 parentView:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKLollipopController *v11;
  HKInteractiveChartAnnotationView *v12;
  HKInteractiveChartAnnotationView *annotationView;
  void *v14;
  id v15;
  uint64_t v16;
  UIView *fieldView;
  NSMutableArray *v18;
  NSMutableArray *extensionViews;
  NSArray *lastSelectionLocation;
  NSDate *lastFirstLollipopDate;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKLollipopController;
  v11 = -[HKLollipopController init](&v23, sel_init);
  if (v11)
  {
    v12 = -[HKInteractiveChartAnnotationView initWithContext:]([HKInteractiveChartAnnotationView alloc], "initWithContext:", 1);
    annotationView = v11->_annotationView;
    v11->_annotationView = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("LollipopContainer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationView setAccessibilityIdentifier:](v11->_annotationView, "setAccessibilityIdentifier:", v14);

    -[HKInteractiveChartAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](v11->_annotationView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[HKInteractiveChartAnnotationView setDataSource:](v11->_annotationView, "setDataSource:", v8);
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_parentView, a4);
    v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    fieldView = v11->_fieldView;
    v11->_fieldView = (UIView *)v16;

    -[UIView setPreservesSuperviewLayoutMargins:](v11->_fieldView, "setPreservesSuperviewLayoutMargins:", 1);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    extensionViews = v11->_extensionViews;
    v11->_extensionViews = v18;

    lastSelectionLocation = v11->_lastSelectionLocation;
    v11->_lastSelectionLocation = 0;

    lastFirstLollipopDate = v11->_lastFirstLollipopDate;
    v11->_lastFirstLollipopDate = 0;

    v11->_lastDismissTime = 0.0;
    *(_WORD *)&v11->_centerLollipopVertically = 0;
    -[UIView addSubview:](v11->_parentView, "addSubview:", v11->_fieldView);
    -[UIView addSubview:](v11->_fieldView, "addSubview:", v11->_annotationView);
    -[HKLollipopController setInvisibleAnimated:](v11, "setInvisibleAnimated:", 0);
  }

  return v11;
}

- (id)_lollipopFieldColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKLollipopController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lollipopFieldColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_lollipopAnnotationColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKLollipopController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lollipopAnnotationColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_lollipopExtensionColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKLollipopController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lollipopExtensionColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)_lollipopExtensionLength
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return -1.0;
  -[HKLollipopController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lollipopExtensionLength");
  v7 = v6;

  return v7;
}

- (double)_lollipopExtensionWidth
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 2.0;
  -[HKLollipopController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lollipopExtensionWidth");
  v7 = v6;

  return v7;
}

- (double)_backgroundViewCornerRadius
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;

  -[HKLollipopController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0.0;
  -[HKLollipopController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lollipopBackgroundViewCornerRadius");
  v7 = v6;

  return v7;
}

- (void)_setExtensionViewBackgrounds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKLollipopController extensionViews](self, "extensionViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[HKLollipopController _lollipopExtensionColor](self, "_lollipopExtensionColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)updateWithPointContexts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[HKLollipopController _selectionHasMoved:](self, "_selectionHasMoved:"))
  {
    -[HKLollipopController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController annotationView](self, "annotationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAnnotationDataSource:pointContexts:", v6, v11);

    -[HKLollipopController annotationView](self, "annotationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    -[HKLollipopController _lollipopAnnotationColor](self, "_lollipopAnnotationColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController annotationView](self, "annotationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[HKLollipopController _stickLocationsFromPointContexts:](self, "_stickLocationsFromPointContexts:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController _positionAnnotationViewWithStickLocations:](self, "_positionAnnotationViewWithStickLocations:", v10);
    -[HKLollipopController _rebuildExtensionsWithStickLocations:](self, "_rebuildExtensionsWithStickLocations:", v10);

  }
}

- (BOOL)_selectionHasMoved:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "selectedRangeXValues", (_QWORD)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  -[HKLollipopController lastSelectionLocation](self, "lastSelectionLocation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        -[HKLollipopController lastSelectionLocation](self, "lastSelectionLocation"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqual:", v5),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v16 = 0;
  }
  else
  {
    -[HKLollipopController setLastSelectionLocation:](self, "setLastSelectionLocation:", v5, (_QWORD)v21);
    objc_msgSend(v6, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedPointValueRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController setLastFirstLollipopDate:](self, "setLastFirstLollipopDate:", v19);

    v16 = 1;
  }

  return v16;
}

- (id)_stickLocationsFromPointContexts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 1.79769313e308;
    v8 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "selectedRangeXValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "minValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        if (v7 >= v14)
          v7 = v14;
        objc_msgSend(v10, "selectedRangeXValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "maxValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        if (v8 < v18)
          v8 = v18;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
    v8 = -1.79769313e308;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (vabdd_f64(v8, v7) >= 0.1)
  {
    v28[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (void)_positionAnnotationViewWithStickLocations:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKLollipopController fieldView](self, "fieldView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMargins");
  v39 = v6;

  -[HKLollipopController fieldView](self, "fieldView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v40 = v10;
  v12 = v11;

  -[HKLollipopController annotationView](self, "annotationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v15 = v14;
  v17 = v16;

  v18 = -[HKLollipopController centerLollipopVertically](self, "centerLollipopVertically");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    v23 = 1.79769313e308;
    v24 = -1.79769313e308;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v26, "doubleValue");
        v28 = v9 + v27;
        if (v23 >= v28)
          v23 = v28;
        objc_msgSend(v26, "doubleValue");
        v30 = v9 + v29;
        if (v24 < v30)
          v24 = v30;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 1.79769313e308;
    v24 = -1.79769313e308;
  }
  if (v17 >= v12)
    v17 = v12;
  v31 = v12 - v17 + -0.5;
  if (v18)
    v31 = (v12 - v17) * 0.5;
  v38 = v31;
  v32 = fmax(v39, 16.0);

  v33 = v24 - v23 + v32 * 2.0;
  if (v15 >= v33)
    v33 = v15;
  if (v33 >= v40 + v32 * -2.0)
    v34 = v40 + v32 * -2.0;
  else
    v34 = v33;
  v35 = (v24 + v23) * 0.5 + v34 * -0.5;
  if (v35 < v32 + v9)
    v35 = v32 + v9;
  if (v32 + v34 + v35 > v9 + v40)
    v35 = v9 + v40 - v32 - v34;
  v36 = v35 - v9;
  -[HKLollipopController annotationView](self, "annotationView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v36, v38, v34, v17);

}

- (void)_rebuildExtensionsWithStickLocations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  -[HKLollipopController extensionViews](self, "extensionViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[HKLollipopController extensionViews](self, "extensionViews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v12++), "removeFromSuperview");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v10);
    }

    -[HKLollipopController extensionViews](self, "extensionViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    if (objc_msgSend(v4, "count"))
    {
      v14 = 0;
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v15, v16, v17, v18);
        -[HKLollipopController parentView](self, "parentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", v19);

        -[HKLollipopController extensionViews](self, "extensionViews");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v19);

        ++v14;
      }
      while (v14 < objc_msgSend(v4, "count"));
    }
    -[HKLollipopController _setExtensionViewBackgrounds](self, "_setExtensionViewBackgrounds");
  }
  -[HKLollipopController _lollipopExtensionLength](self, "_lollipopExtensionLength");
  if (v22 >= 0.0)
  {
    v23 = v22;
    -[HKLollipopController fieldView](self, "fieldView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;

    -[HKLollipopController annotationView](self, "annotationView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v31 = v30;
    v33 = v32;

    if (objc_msgSend(v4, "count"))
    {
      v34 = 0;
      v35 = v33 + v26 + v31;
      v36 = v23 + v26 + v28 - v35;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = HKUIFloorToScreenScale(v38);
        -[HKLollipopController fieldView](self, "fieldView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "frame");
        v42 = v39 + v41;

        -[HKLollipopController _lollipopExtensionWidth](self, "_lollipopExtensionWidth");
        v44 = v43;
        v45 = v42 + v43 * -0.5;
        -[HKLollipopController extensionViews](self, "extensionViews");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", v34);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setFrame:", v45, v35, v44, v36);

        ++v34;
      }
      while (v34 < objc_msgSend(v4, "count"));
    }
  }

}

- (void)setVisibleWithRect:(CGRect)a3 pointContexts:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (!-[HKLollipopController isVisible](self, "isVisible"))
  {
    -[HKLollipopController setNoAnimationVisibility:](self, "setNoAnimationVisibility:", 1);
    -[HKLollipopController fieldView](self, "fieldView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", x, y, width, height);

    -[HKLollipopController _lollipopFieldColor](self, "_lollipopFieldColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController fieldView](self, "fieldView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[HKLollipopController _backgroundViewCornerRadius](self, "_backgroundViewCornerRadius");
    v16 = v15;
    -[HKLollipopController fieldView](self, "fieldView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v16);

    -[HKLollipopController updateWithPointContexts:](self, "updateWithPointContexts:", v11);
    -[HKLollipopController _lollipopAnnotationColor](self, "_lollipopAnnotationColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLollipopController annotationView](self, "annotationView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[HKLollipopController _setExtensionViewBackgrounds](self, "_setExtensionViewBackgrounds");
    -[HKLollipopController _bringViewsToFront](self, "_bringViewsToFront");
    -[HKLollipopController _setHidden:](self, "_setHidden:", 0);
    if (v5)
    {
      -[HKLollipopController _setAlpha:](self, "_setAlpha:", 0.0);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __66__HKLollipopController_setVisibleWithRect_pointContexts_animated___block_invoke;
      v21[3] = &unk_1E9C3F0D0;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v21, 0.12);
    }
  }

}

uint64_t __66__HKLollipopController_setVisibleWithRect_pointContexts_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAlpha:", 1.0);
}

- (void)setInvisibleAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = a3;
  if (-[HKLollipopController isVisible](self, "isVisible"))
  {
    -[HKLollipopController setLastDismissTime:](self, "setLastDismissTime:", CFAbsoluteTimeGetCurrent());
    -[HKLollipopController setNoAnimationVisibility:](self, "setNoAnimationVisibility:", 0);
    if (v3)
    {
      -[HKLollipopController _setAlpha:](self, "_setAlpha:", 1.0);
      v5[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __45__HKLollipopController_setInvisibleAnimated___block_invoke;
      v6[3] = &unk_1E9C3F0D0;
      v6[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __45__HKLollipopController_setInvisibleAnimated___block_invoke_2;
      v5[3] = &unk_1E9C42160;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v6, v5, 0.12);
    }
    else
    {
      -[HKLollipopController _setHidden:](self, "_setHidden:", 1);
    }
  }
}

uint64_t __45__HKLollipopController_setInvisibleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAlpha:", 0.0);
}

uint64_t __45__HKLollipopController_setInvisibleAnimated___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "noAnimationVisibility");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_setAlpha:", 1.0);
  else
    return objc_msgSend(v3, "_setHidden:", 1);
}

- (id)firstLollipopDateSinceDelta:(double)a3
{
  double Current;
  double v6;
  void *v7;

  if (-[HKLollipopController isVisible](self, "isVisible")
    || (Current = CFAbsoluteTimeGetCurrent(),
        -[HKLollipopController lastDismissTime](self, "lastDismissTime"),
        Current - v6 <= a3))
  {
    -[HKLollipopController lastFirstLollipopDate](self, "lastFirstLollipopDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)pointSelectionContextsHaveUserInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
    LOBYTE(v4) = v5 > 0;
  }

  return v4;
}

- (void)_bringViewsToFront
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKLollipopController parentView](self, "parentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLollipopController fieldView](self, "fieldView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKLollipopController extensionViews](self, "extensionViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[HKLollipopController parentView](self, "parentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bringSubviewToFront:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[HKLollipopController fieldView](self, "fieldView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HKLollipopController extensionViews](self, "extensionViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setHidden:", v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[HKLollipopController setLastSelectionLocation:](self, "setLastSelectionLocation:", 0);
}

- (void)_setAlpha:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HKLollipopController fieldView](self, "fieldView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HKLollipopController extensionViews](self, "extensionViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAlpha:", a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (HKInteractiveChartAnnotationView)annotationView
{
  return self->_annotationView;
}

- (HKLollipopDelegate)delegate
{
  return (HKLollipopDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)centerLollipopVertically
{
  return self->_centerLollipopVertically;
}

- (void)setCenterLollipopVertically:(BOOL)a3
{
  self->_centerLollipopVertically = a3;
}

- (UIView)parentView
{
  return self->_parentView;
}

- (void)setParentView:(id)a3
{
  objc_storeStrong((id *)&self->_parentView, a3);
}

- (UIView)fieldView
{
  return self->_fieldView;
}

- (void)setFieldView:(id)a3
{
  objc_storeStrong((id *)&self->_fieldView, a3);
}

- (NSMutableArray)extensionViews
{
  return self->_extensionViews;
}

- (void)setExtensionViews:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViews, a3);
}

- (NSArray)lastSelectionLocation
{
  return self->_lastSelectionLocation;
}

- (void)setLastSelectionLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)lastFirstLollipopDate
{
  return self->_lastFirstLollipopDate;
}

- (void)setLastFirstLollipopDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFirstLollipopDate, a3);
}

- (double)lastDismissTime
{
  return self->_lastDismissTime;
}

- (void)setLastDismissTime:(double)a3
{
  self->_lastDismissTime = a3;
}

- (BOOL)noAnimationVisibility
{
  return self->_noAnimationVisibility;
}

- (void)setNoAnimationVisibility:(BOOL)a3
{
  self->_noAnimationVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFirstLollipopDate, 0);
  objc_storeStrong((id *)&self->_lastSelectionLocation, 0);
  objc_storeStrong((id *)&self->_extensionViews, 0);
  objc_storeStrong((id *)&self->_fieldView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationView, 0);
}

@end
