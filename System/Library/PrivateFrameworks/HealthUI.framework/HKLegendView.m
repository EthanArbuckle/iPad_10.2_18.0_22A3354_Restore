@implementation HKLegendView

- (HKLegendView)initWithEdgeInsets:(UIEdgeInsets)a3 opaqueBackground:(BOOL)a4
{
  _BOOL4 v4;
  double right;
  double bottom;
  double left;
  double top;
  void *v10;
  HKLegendView *v11;
  id v12;
  uint64_t v13;
  UIStackView *mainStack;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *leftEntryViews;
  NSMutableArray *v18;
  NSMutableArray *rightEntryViews;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *leadingConstraint;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *trailingConstraint;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *topConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *bottomConstraint;
  NSMutableArray *v36;
  NSMutableArray *extensionViews;
  UIColor *lollipopColor;
  void *v39;
  UIView *v40;
  UIView *topDividerView;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v54;

  v4 = a4;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v54.receiver = self;
  v54.super_class = (Class)HKLegendView;
  v11 = -[HKBorderLineView initWithFrame:](&v54, sel_initWithFrame_);

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v13 = objc_msgSend(v12, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
    mainStack = v11->_mainStack;
    v11->_mainStack = (UIStackView *)v13;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v11->_mainStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKLegendView addSubview:](v11, "addSubview:", v11->_mainStack);
    -[UIStackView setAlignment:](v11->_mainStack, "setAlignment:", 3);
    -[UIStackView setDistribution:](v11->_mainStack, "setDistribution:", 0);
    -[UIStackView setSpacing:](v11->_mainStack, "setSpacing:", 10.0);
    -[UIStackView setAxis:](v11->_mainStack, "setAxis:", 0);
    -[UIStackView layer](v11->_mainStack, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setZPosition:", 2.0);

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leftEntryViews = v11->_leftEntryViews;
    v11->_leftEntryViews = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rightEntryViews = v11->_rightEntryViews;
    v11->_rightEntryViews = v18;

    -[HKLegendView _rebuildStackStructure](v11, "_rebuildStackStructure");
    -[UIStackView leadingAnchor](v11->_mainStack, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView leadingAnchor](v11, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 0.0);
    v22 = objc_claimAutoreleasedReturnValue();
    leadingConstraint = v11->_leadingConstraint;
    v11->_leadingConstraint = (NSLayoutConstraint *)v22;

    -[NSLayoutConstraint setActive:](v11->_leadingConstraint, "setActive:", 1);
    -[UIStackView trailingAnchor](v11->_mainStack, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView trailingAnchor](v11, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
    v26 = objc_claimAutoreleasedReturnValue();
    trailingConstraint = v11->_trailingConstraint;
    v11->_trailingConstraint = (NSLayoutConstraint *)v26;

    -[NSLayoutConstraint setActive:](v11->_trailingConstraint, "setActive:", 1);
    -[UIStackView topAnchor](v11->_mainStack, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView topAnchor](v11, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 0.0);
    v30 = objc_claimAutoreleasedReturnValue();
    topConstraint = v11->_topConstraint;
    v11->_topConstraint = (NSLayoutConstraint *)v30;

    -[NSLayoutConstraint setActive:](v11->_topConstraint, "setActive:", 1);
    -[UIStackView bottomAnchor](v11->_mainStack, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView bottomAnchor](v11, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 0.0);
    v34 = objc_claimAutoreleasedReturnValue();
    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = (NSLayoutConstraint *)v34;

    -[NSLayoutConstraint setActive:](v11->_bottomConstraint, "setActive:", 1);
    -[HKLegendView setEdgeInsets:](v11, "setEdgeInsets:", top, left, bottom, right);
    -[HKLegendView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    extensionViews = v11->_extensionViews;
    v11->_extensionViews = v36;

    lollipopColor = v11->_lollipopColor;
    v11->_lollipopColor = 0;

    v11->_opaqueBackground = v4;
    if (v4)
    {
      -[HKLegendView setOpaque:](v11, "setOpaque:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKLegendView setBackgroundColor:](v11, "setBackgroundColor:", v39);

    }
    else
    {
      -[HKLegendView setOpaque:](v11, "setOpaque:", 0);
    }
    v40 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topDividerView = v11->_topDividerView;
    v11->_topDividerView = v40;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_topDividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKLegendView addSubview:](v11, "addSubview:", v11->_topDividerView);
    -[UIView topAnchor](v11->_topDividerView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView topAnchor](v11, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UIView heightAnchor](v11->_topDividerView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", HKUIOnePixel());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    -[UIView leftAnchor](v11->_topDividerView, "leftAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView leftAnchor](v11, "leftAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    -[UIView rightAnchor](v11->_topDividerView, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLegendView rightAnchor](v11, "rightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UIView setHidden:](v11->_topDividerView, "setHidden:", 1);
  }
  return v11;
}

- (void)setLeftEntries:(id)a3 rightEntries:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = objc_msgSend(v10, "count");
  if (v8 == -[NSArray count](self->_leftEntries, "count")
    && (v9 = objc_msgSend(v7, "count"), v9 == -[NSArray count](self->_rightEntries, "count")))
  {
    -[HKLegendView _updateLegendLeftEntries:rightEntries:](self, "_updateLegendLeftEntries:rightEntries:", v10, v7);
  }
  else
  {
    objc_storeStrong((id *)&self->_leftEntries, a3);
    objc_storeStrong((id *)&self->_rightEntries, a4);
    -[HKLegendView _rebuildStackStructure](self, "_rebuildStackStructure");
  }

}

- (void)_rebuildStackStructure
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _HKLegendEntryView *v14;
  void *v15;
  double v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  _HKLegendEntryView *v23;
  _HKLegendEntryView *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UIStackView arrangedSubviews](self->_mainStack, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[UIStackView removeArrangedSubview:](self->_mainStack, "removeArrangedSubview:", v8);
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_leftEntryViews, "removeAllObjects");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_leftEntries;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = -[_HKLegendEntryView initWithLegendEntry:]([_HKLegendEntryView alloc], "initWithLegendEntry:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        -[NSMutableArray addObject:](self->_leftEntryViews, "addObject:", v14);
        -[UIStackView addArrangedSubview:](self->_mainStack, "addArrangedSubview:", v14);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  LODWORD(v16) = 1132068864;
  objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);
  -[UIStackView addArrangedSubview:](self->_mainStack, "addArrangedSubview:", v15);
  -[NSMutableArray removeAllObjects](self->_rightEntryViews, "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = self->_rightEntries;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k);
        v23 = [_HKLegendEntryView alloc];
        v24 = -[_HKLegendEntryView initWithLegendEntry:](v23, "initWithLegendEntry:", v22, (_QWORD)v25);
        -[NSMutableArray addObject:](self->_rightEntryViews, "addObject:", v24);
        -[UIStackView addArrangedSubview:](self->_mainStack, "addArrangedSubview:", v24);

      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v19);
  }

}

- (void)_updateLegendLeftEntries:(id)a3 rightEntries:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v13, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_leftEntryViews, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLegendEntry:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v13, "count"));
  }
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_rightEntryViews, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLegendEntry:", v11);

      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
  }

}

- (void)setTopBorderColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_topBorderColor, "isEqual:") & 1) == 0)
  {
    -[UIView setBackgroundColor:](self->_topDividerView, "setBackgroundColor:", v5);
    objc_storeStrong((id *)&self->_topBorderColor, a3);
    -[UIView setHidden:](self->_topDividerView, "setHidden:", v5 == 0);
  }

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  top = a3.top;
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", a3.left);
    -[NSLayoutConstraint setConstant:](self->_trailingConstraint, "setConstant:", -right);
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", top);
    -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -bottom);
  }
}

+ (UIEdgeInsets)modifiedInsetsForOpaqueLegend:(BOOL)a3 originalInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v4 = 0.0;
  if (!a3)
    v4 = 4.0;
  v5 = v4 + a4.left;
  v6 = a4.right + 4.0;
  v7 = 8.0;
  if (!a3)
    v7 = 4.0;
  v8 = v7 + a4.top;
  v9 = v4 + a4.bottom;
  +[HKLegendView horizontalOffsetWithOpaque:](HKLegendView, "horizontalOffsetWithOpaque:");
  v11 = v5 - v10;
  v12 = v8;
  v13 = v9;
  v14 = v6;
  result.right = v14;
  result.bottom = v13;
  result.left = v11;
  result.top = v12;
  return result;
}

+ (double)horizontalOffsetWithOpaque:(BOOL)a3
{
  return 0.0;
}

- (void)hideLollipops
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HKLegendView extensionViews](self, "extensionViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setHidden:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

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
  uint64_t i;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  double Height;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  -[HKLegendView extensionViews](self, "extensionViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HKLegendView extensionViews](self, "extensionViews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "removeFromSuperview");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

    -[HKLegendView extensionViews](self, "extensionViews");
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
        -[HKLegendView lollipopColor](self, "lollipopColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v19, "setBackgroundColor:", v20);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBackgroundColor:", v21);

        }
        objc_msgSend(v19, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setZPosition:", 1.0);

        -[HKLegendView addSubview:](self, "addSubview:", v19);
        -[HKLegendView extensionViews](self, "extensionViews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v19);

        ++v14;
      }
      while (v14 < objc_msgSend(v4, "count"));
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = HKUIFloorToScreenScale(v26);

      -[HKLegendView frame](self, "frame");
      Height = CGRectGetHeight(v37);
      -[HKLegendView extensionViews](self, "extensionViews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "setFrame:", v27 + -1.0, 0.0, 2.0, Height);
      objc_msgSend(v30, "setHidden:", 0);

      ++v24;
    }
    while (v24 < objc_msgSend(v4, "count"));
  }

}

- (NSArray)leftEntries
{
  return self->_leftEntries;
}

- (NSArray)rightEntries
{
  return self->_rightEntries;
}

- (UIColor)topBorderColor
{
  return self->_topBorderColor;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)opaqueBackground
{
  return self->_opaqueBackground;
}

- (void)setOpaqueBackground:(BOOL)a3
{
  self->_opaqueBackground = a3;
}

- (UIColor)lollipopColor
{
  return self->_lollipopColor;
}

- (void)setLollipopColor:(id)a3
{
  objc_storeStrong((id *)&self->_lollipopColor, a3);
}

- (NSMutableArray)extensionViews
{
  return self->_extensionViews;
}

- (void)setExtensionViews:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViews, 0);
  objc_storeStrong((id *)&self->_lollipopColor, 0);
  objc_storeStrong((id *)&self->_topBorderColor, 0);
  objc_storeStrong((id *)&self->_rightEntries, 0);
  objc_storeStrong((id *)&self->_leftEntries, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_rightEntryViews, 0);
  objc_storeStrong((id *)&self->_leftEntryViews, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
}

@end
