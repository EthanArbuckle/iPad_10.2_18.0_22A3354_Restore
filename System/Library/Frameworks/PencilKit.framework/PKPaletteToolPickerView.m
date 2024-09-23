@implementation PKPaletteToolPickerView

- (PKPaletteToolPickerView)init
{
  return -[PKPaletteToolPickerView initWithToolViews:](self, "initWithToolViews:", MEMORY[0x1E0C9AA60]);
}

- (PKPaletteToolPickerView)initWithToolViews:(id)a3
{
  id v4;
  PKPaletteToolPickerView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSHashTable *presentedViewControllers;
  uint64_t v11;
  NSMutableArray *mutableToolViews;
  PKPaletteToolPickerClippingView *v13;
  PKPaletteToolPickerClippingView *clippingView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  PKPaletteToolPickerClippingView *v33;
  PKPaletteToolPickerClippingView *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPaletteToolPickerView;
  v5 = -[PKPaletteToolPickerView init](&v46, sel_init);
  if (v5)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 64);
    else
      v8 = 0;
    objc_storeStrong((id *)&v5->_drawingPaletteStatistics, v8);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    presentedViewControllers = v5->_presentedViewControllers;
    v5->_presentedViewControllers = (NSHashTable *)v9;

    v5->_scalingFactor = 1.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    mutableToolViews = v5->_mutableToolViews;
    v5->_mutableToolViews = (NSMutableArray *)v11;

    v5->_interItemToolsSpacing = 0.0;
    v5->_unselectedToolsVisible = 1;
    v13 = objc_alloc_init(PKPaletteToolPickerClippingView);
    clippingView = v5->_clippingView;
    v5->_clippingView = v13;

    -[PKPaletteToolPickerClippingView setTranslatesAutoresizingMaskIntoConstraints:](v5->_clippingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteToolPickerView addSubview:](v5, "addSubview:", v5->_clippingView);
    -[PKPaletteToolPickerClippingView topAnchor](v5->_clippingView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView topAnchor](v5, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView setClippingViewTopConstraint:](v5, "setClippingViewTopConstraint:", v17);

    -[PKPaletteToolPickerClippingView leadingAnchor](v5->_clippingView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView leadingAnchor](v5, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView setClippingViewLeadingConstraint:](v5, "setClippingViewLeadingConstraint:", v20);

    -[PKPaletteToolPickerClippingView bottomAnchor](v5->_clippingView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView bottomAnchor](v5, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView setClippingViewBottomConstraint:](v5, "setClippingViewBottomConstraint:", v23);

    -[PKPaletteToolPickerClippingView trailingAnchor](v5->_clippingView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView trailingAnchor](v5, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView setClippingViewTrailingConstraint:](v5, "setClippingViewTrailingConstraint:", v26);

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteToolPickerView clippingViewTopConstraint](v5, "clippingViewTopConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v28;
    -[PKPaletteToolPickerView clippingViewLeadingConstraint](v5, "clippingViewLeadingConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v29;
    -[PKPaletteToolPickerView clippingViewBottomConstraint](v5, "clippingViewBottomConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v30;
    -[PKPaletteToolPickerView clippingViewTrailingConstraint](v5, "clippingViewTrailingConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v32);

    v33 = v5->_clippingView;
    if (v33)
      v33 = (PKPaletteToolPickerClippingView *)v33->_contentView;
    v34 = v33;
    -[PKPaletteToolPickerView _installScrollViewInView:](v5, "_installScrollViewInView:", v34);

    -[PKPaletteToolPickerView _installStackViewInScrollView:](v5, "_installStackViewInScrollView:", v5->_scrollView);
    -[PKPaletteToolPickerView scrollView](v5, "scrollView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:forKeyPath:options:context:", v5, CFSTR("bounds"), 1, PKPaletteToolPickerScrollViewObserverContext);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v36 = v4;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v43 != v39)
            objc_enumerationMutation(v36);
          -[PKPaletteToolPickerView _addToolView:updateUI:](v5, "_addToolView:updateUI:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), 0, (_QWORD)v42);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v38);
    }

    -[PKPaletteToolPickerView _updateUI](v5, "_updateUI");
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), PKPaletteToolPickerScrollViewObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteToolPickerView;
  -[PKPaletteToolPickerView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)PKPaletteToolPickerScrollViewObserverContext != a6)
    goto LABEL_6;
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v11)
  {

LABEL_6:
    v15.receiver = self;
    v15.super_class = (Class)PKPaletteToolPickerView;
    -[PKPaletteToolPickerView observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_7;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("bounds"));

  if (!v14)
    goto LABEL_6;
  -[PKPaletteToolPickerView updateClippingViewEdgesVisibility](self, "updateClippingViewEdgesVisibility");
LABEL_7:

}

- (NSArray)toolViews
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableToolViews, "copy");
}

- (id)_firstInkingTool
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableArray indexOfObjectPassingTest:](self->_mutableToolViews, "indexOfObjectPassingTest:", &__block_literal_global_93);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_mutableToolViews, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t __43__PKPaletteToolPickerView__firstInkingTool__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "tool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInkingTool"))
  {
    objc_msgSend(v2, "tool");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHandwritingTool") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_installScrollViewInView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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
  void *v22;
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
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3C28];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PKPaletteToolPickerView setScrollView:](self, "setScrollView:", v6);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPagingEnabled:", 0);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 0);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v12);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewTopConstraint:](self, "setScrollViewTopConstraint:", v16);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewLeadingConstraint:](self, "setScrollViewLeadingConstraint:", v20);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewBottomConstraint:](self, "setScrollViewBottomConstraint:", v24);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewTrailingConstraint:](self, "setScrollViewTrailingConstraint:", v28);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewCenterXConstraint:](self, "setScrollViewCenterXConstraint:", v32);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewCenterYConstraint:](self, "setScrollViewCenterYConstraint:", v36);

  v37 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v39;
  -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v40;
  -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v42);

}

- (void)_installStackViewInScrollView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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
  void *v22;
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
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3CA8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PKPaletteToolPickerView setStackView:](self, "setStackView:", v6);

  -[PKPaletteToolPickerView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteToolPickerView stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAxis:", 0);

  -[PKPaletteToolPickerView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v9);

  v35 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v39;
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v34;
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v13;
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v18);

  -[PKPaletteToolPickerView stackView](self, "stackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setStackViewCompactHeightConstraint:](self, "setStackViewCompactHeightConstraint:", v23);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewWidthConstraint:](self, "setScrollViewWidthConstraint:", v28);

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setScrollViewHeightConstraint:](self, "setScrollViewHeightConstraint:", v33);

}

- (void)addToolView:(id)a3
{
  -[PKPaletteToolPickerView _addToolView:updateUI:](self, "_addToolView:updateUI:", a3, 1);
}

- (void)_addToolView:(id)a3 updateUI:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *mutableToolViews;
  id v7;

  v4 = a4;
  mutableToolViews = self->_mutableToolViews;
  v7 = a3;
  -[PKPaletteToolPickerView _insertToolView:atIndex:updateUI:](self, "_insertToolView:atIndex:updateUI:", v7, -[NSMutableArray count](mutableToolViews, "count"), v4);

}

- (void)removeToolView:(id)a3
{
  -[PKPaletteToolPickerView removeToolView:updateUI:](self, "removeToolView:updateUI:", a3, 1);
}

- (void)removeToolView:(id)a3 updateUI:(BOOL)a4
{
  _BOOL4 v4;
  PKPaletteToolView *v6;
  void *v7;
  PKPaletteToolView *v8;

  v4 = a4;
  v6 = (PKPaletteToolView *)a3;
  v8 = v6;
  if (self->_selectedToolView == v6)
  {
    self->_selectedToolView = 0;

    v6 = v8;
  }
  if (self->_lastSelectedToolView == v6)
  {
    self->_lastSelectedToolView = 0;

    v6 = v8;
  }
  -[NSMutableArray removeObject:](self->_mutableToolViews, "removeObject:", v6);
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeArrangedSubview:", v8);

  -[PKPaletteToolView removeFromSuperview](v8, "removeFromSuperview");
  if (v4)
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");

}

- (void)insertToolView:(id)a3 atIndex:(unint64_t)a4
{
  -[PKPaletteToolPickerView _insertToolView:atIndex:updateUI:](self, "_insertToolView:atIndex:updateUI:", a3, a4, 1);
}

- (void)_insertToolView:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5
{
  _BOOL4 v5;
  NSMutableArray *mutableToolViews;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  mutableToolViews = self->_mutableToolViews;
  v9 = a3;
  -[NSMutableArray insertObject:atIndex:](mutableToolViews, "insertObject:atIndex:", v9, a4);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertArrangedSubview:atIndex:", v9, a4);

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__toolTapGestureRecognizer_);
  objc_msgSend(v9, "addGestureRecognizer:");

  if (v5)
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");

}

- (BOOL)hasToolViewWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *mutableToolViews;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  mutableToolViews = self->_mutableToolViews;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKPaletteToolPickerView_hasToolViewWithIdentifier___block_invoke;
  v8[3] = &unk_1E777DD60;
  v9 = v4;
  v6 = v4;
  LOBYTE(mutableToolViews) = -[NSMutableArray indexOfObjectPassingTest:](mutableToolViews, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)mutableToolViews;
}

uint64_t __53__PKPaletteToolPickerView_hasToolViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "tool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)removeToolViewsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPaletteToolPickerView *v9;

  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_mutableToolViews, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKPaletteToolPickerView_removeToolViewsWithIdentifier___block_invoke;
  v7[3] = &unk_1E777DD88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __57__PKPaletteToolPickerView_removeToolViewsWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "tool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "removeToolView:", v6);

}

- (void)setUnselectedToolsVisible:(BOOL)a3
{
  if (self->_unselectedToolsVisible != a3)
  {
    self->_unselectedToolsVisible = a3;
    -[PKPaletteToolPickerView _updateToolViewVisibilityLayingOutIfNeeded:](self, "_updateToolViewVisibilityLayingOutIfNeeded:", 1);
  }
}

- (void)_updateToolViewVisibilityLayingOutIfNeeded:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke;
  v3[3] = &unk_1E777A028;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "indexOfSelectedTool");
  objc_msgSend(*(id *)(a1 + 32), "toolViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke_2;
  v4[3] = &unk_1E777DDB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL8 v3;

  v3 = *(_QWORD *)(a1 + 40) != a3 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) == 0;
  return objc_msgSend(a2, "setHidden:", v3);
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setInterItemToolsSpacing:(double)a3
{
  if (vabdd_f64(self->_interItemToolsSpacing, a3) >= 0.00999999978)
  {
    self->_interItemToolsSpacing = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)_toolTapGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  PKPaletteToolPickerView *v23;
  _QWORD v24[4];
  id v25;
  PKPaletteToolPickerView *v26;
  _QWORD v27[4];
  id v28;
  PKPaletteToolPickerView *v29;
  _QWORD v30[4];
  id v31;
  PKPaletteToolPickerView *v32;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 1)
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke;
    v30[3] = &unk_1E7777C20;
    v31 = v5;
    v32 = self;
    objc_msgSend(v6, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v30, 0, 0.35, 0.0, 0.65, 0.0);
    v7 = v31;
LABEL_3:

    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isHighlighted"))
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_2;
    v27[3] = &unk_1E7777C20;
    v28 = v5;
    v29 = self;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v27, 0, 0.35, 0.0, 0.65, 0.0);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v5, "tool");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRulerTool");

    objc_msgSend(v5, "tool");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isHandwritingTool");

    if (v12 && (objc_msgSend(v5, "isSelected") & 1) == 0)
    {
      -[PKPaletteToolPickerView drawingPaletteStatistics](self, "drawingPaletteStatistics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordHandwritingToolSelected");

    }
    -[PKPaletteToolPickerView selectedToolView](self, "selectedToolView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v5)
      v15 = v10;
    else
      v15 = 1;

    if ((v15 & 1) == 0)
    {
      -[PKPaletteToolPickerView _showToolAttributesPopoverFromRect:inView:](self, "_showToolAttributesPopoverFromRect:inView:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      goto LABEL_18;
    }
    if (!v10)
    {
      -[PKPaletteToolPickerView _setSelectedToolView:animated:showToolTip:notifyDelegate:](self, "_setSelectedToolView:animated:showToolTip:notifyDelegate:", v5, 1, 0, 1);
      goto LABEL_18;
    }
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_3;
    v24[3] = &unk_1E7777C20;
    v25 = v5;
    v26 = self;
    v18 = v16;
    v19 = 3221225472;
    v20 = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_4;
    v21 = &unk_1E777D930;
    v22 = v25;
    v23 = self;
    +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v24, &v18);
    -[PKPaletteToolPickerView delegate](self, "delegate", v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "toolPickerDidToggleRulerTool:", self);

    v7 = v25;
    goto LABEL_3;
  }
LABEL_18:

}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelected:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_5;
  v4[3] = &unk_1E7777C20;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v4, 0);

}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (unint64_t)indexOfSelectedTool
{
  return -[NSMutableArray indexOfObject:](self->_mutableToolViews, "indexOfObject:", self->_selectedToolView);
}

- (void)selectToolViewAtIndex:(unint64_t)a3
{
  id v4;

  -[NSMutableArray objectAtIndex:](self->_mutableToolViews, "objectAtIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView _setSelectedToolView:animated:showToolTip:notifyDelegate:](self, "_setSelectedToolView:animated:showToolTip:notifyDelegate:", v4, 0, 0, 0);

}

- (void)_setSelectedToolView:(id)a3 animated:(BOOL)a4 showToolTip:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  PKPaletteToolView *v10;
  id *p_selectedToolView;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  PKPaletteToolView *v20;
  NSObject *v21;
  PKPaletteToolView *lastSelectedToolView;
  void *v23;
  void *v24;
  PKScrollViewDelegateEventsHandler *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  NSObject *v33;
  PKPaletteToolView *v34;
  NSObject *v35;
  PKPaletteToolView *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  PKPaletteToolView **p_lastSelectedToolView;
  _BOOL4 v41;
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  PKPaletteToolView *v52;
  uint64_t v53;

  v41 = a6;
  v6 = a5;
  v7 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = (PKPaletteToolView *)a3;
  p_selectedToolView = (id *)&self->_selectedToolView;
  if (self->_selectedToolView != v10)
  {
    if (!-[PKPaletteToolPickerView _canSelectToolView:](self, "_canSelectToolView:", v10))
    {
      v18 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v10;
        _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Can't select tool: %@", buf, 0xCu);
      }

      v19 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (PKPaletteToolView *)*p_selectedToolView;
        *(_DWORD *)buf = 138412290;
        v52 = v20;
        _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Currently selected tool is: %@", buf, 0xCu);
      }

      v21 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        lastSelectedToolView = self->_lastSelectedToolView;
        *(_DWORD *)buf = 138412290;
        v52 = lastSelectedToolView;
        _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "Last selected tool is: %@", buf, 0xCu);
      }
      goto LABEL_34;
    }
    p_lastSelectedToolView = &self->_lastSelectedToolView;
    objc_storeStrong((id *)&self->_lastSelectedToolView, *p_selectedToolView);
    v49 = 0u;
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    v39 = 416;
    v12 = self->_mutableToolViews;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v47;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v15++), "setSelected:", 0, v39);
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v13);
    }

    objc_storeStrong((id *)&self->_selectedToolView, a3);
    objc_msgSend(*p_selectedToolView, "setSelected:", 1);
    -[PKPaletteToolPickerView _updateToolViewVisibilityLayingOutIfNeeded:](self, "_updateToolViewVisibilityLayingOutIfNeeded:", 0);
    -[PKPaletteToolPickerView scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_selectedToolView, "frame");
    v17 = objc_msgSend(v16, "_isRectFullyVisible:");

    if (((!v7 | v17) & 1) != 0)
    {
      if (((v7 | v17) & 1) == 0)
        -[PKPaletteToolPickerView scrollSelectedToolViewToVisibleAnimated:](self, "scrollSelectedToolViewToVisibleAnimated:", 0);
    }
    else
    {
      -[PKPaletteToolPickerView scrollView](self, "scrollView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPickerView setLastScrollViewDelegateBeforeScrollingToolToVisible:](self, "setLastScrollViewDelegateBeforeScrollingToolToVisible:", v24);

      v25 = objc_alloc_init(PKScrollViewDelegateEventsHandler);
      -[PKPaletteToolPickerView setScrollViewDelegateEventsHandler:](self, "setScrollViewDelegateEventsHandler:", v25);

      -[PKPaletteToolPickerView scrollViewDelegateEventsHandler](self, "scrollViewDelegateEventsHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPickerView scrollView](self, "scrollView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:", v26);

      objc_initWeak((id *)buf, self);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __84__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate___block_invoke;
      v43[3] = &unk_1E777DDD8;
      objc_copyWeak(&v44, (id *)buf);
      v45 = v6;
      -[PKPaletteToolPickerView scrollViewDelegateEventsHandler](self, "scrollViewDelegateEventsHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setScrollViewDidEndScrollingAnimationHandler:", v43);

      -[PKPaletteToolPickerView scrollSelectedToolViewToVisibleAnimated:](self, "scrollSelectedToolViewToVisibleAnimated:", 1);
      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
    if ((v6 & v17) == 1)
    {
      -[PKPaletteToolPickerView tooltipPresentationHandle](self, "tooltipPresentationHandle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == 0;

      if (!v30)
      {
        v31 = *p_selectedToolView;
        -[PKPaletteToolPickerView tooltipPresentationHandle](self, "tooltipPresentationHandle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "showTooltip:", v32);

      }
    }
    if (v7)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __84__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate___block_invoke_2;
      v42[3] = &unk_1E7778020;
      v42[4] = self;
      +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v42, 0);
    }
    v33 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (PKPaletteToolView *)*p_selectedToolView;
      *(_DWORD *)buf = 138412290;
      v52 = v34;
      _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, "Did select tool: %@", buf, 0xCu);
    }

    v35 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *p_lastSelectedToolView;
      *(_DWORD *)buf = 138412290;
      v52 = v36;
      _os_log_impl(&dword_1BE213000, v35, OS_LOG_TYPE_DEFAULT, "Last selected tool is: %@", buf, 0xCu);
    }

    if (v41)
    {
      v37 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v39), "indexOfObject:", *p_selectedToolView);
      -[PKPaletteToolPickerView delegate](self, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "toolPicker:didSelectTool:atIndex:", self, *p_selectedToolView, v37);

    }
    if (*p_lastSelectedToolView == *p_selectedToolView)
    {
      v21 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BE213000, v21, OS_LOG_TYPE_FAULT, "_lastSelectedToolView == _selectedToolView", buf, 2u);
      }
LABEL_34:

    }
  }

}

void __84__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lastScrollViewDelegateBeforeScrollingToolToVisible");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(WeakRetained, "setLastScrollViewDelegateBeforeScrollingToolToVisible:", 0);
  objc_msgSend(WeakRetained, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "selectedToolView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = objc_msgSend(v4, "_isRectFullyVisible:");

  if (*(_BYTE *)(a1 + 40))
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "tooltipPresentationHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(WeakRetained, "selectedToolView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "tooltipPresentationHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "showTooltip:", v9);

      }
    }
  }

}

uint64_t __84__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_canSelectToolView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGenerationTool") & 1) != 0)
  {
    +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "presentGreymatterAvailabilityAlertControllerInWindow:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "tool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isRulerTool") & 1) != 0)
    v9 = 0;
  else
    v9 = -[NSMutableArray containsObject:](self->_mutableToolViews, "containsObject:", v4);

LABEL_9:
  return v9;
}

- (unint64_t)_selectedToolsCount
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_mutableToolViews, "indexesOfObjectsPassingTest:", &__block_literal_global_26_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

uint64_t __46__PKPaletteToolPickerView__selectedToolsCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "tool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRulerTool") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "isSelected");

  return v4;
}

- (id)_eraserToolView
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableArray indexOfObjectPassingTest:](self->_mutableToolViews, "indexOfObjectPassingTest:", &__block_literal_global_27_0);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_mutableToolViews, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t __42__PKPaletteToolPickerView__eraserToolView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "tool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isErasingTool");

  return v3;
}

- (void)_showToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  CGRect v62;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PKPaletteToolPickerView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "palettePopoverPresentingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_30;
  -[PKPaletteToolView attributeViewController](self->_selectedToolView, "attributeViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView setToolAttributesPopover:](self, "setToolAttributesPopover:", v12);

  -[PKPaletteToolView tool](self->_selectedToolView, "tool");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToolIdentifier:", v14);

  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_30;
  v17 = (void *)v16;
  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_8:
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setModalPresentationStyle:", 7);

    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "popoverPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    if (v9)
    {
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      v24 = !CGRectIsNull(v62);
    }
    else
    {
      v24 = 0;
    }
    v25 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
    v26 = -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation");
    v27 = -[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize");
    v28 = -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation");
    if (v24)
      v29 = 0;
    else
      v29 = 2;
    if (!v24 && !v27)
    {
      if (v28 == -1)
        v30 = PKUIPopoverPermittedArrowDirectionsForEdge(v25);
      else
        v30 = PKUIPopoverPermittedArrowDirectionsForCorner(v26);
      v29 = v30;
    }
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "popoverPresentationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPermittedArrowDirections:", v29);

    if (v24)
    {
      -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "popoverPresentationController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSourceRect:", x, y, width, height);

      v35 = v9;
    }
    else
    {
      -[PKPaletteToolPickerView sourceRectForPopoverPresentationForTool:](self, "sourceRectForPopoverPresentationForTool:", self->_selectedToolView);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "popoverPresentationController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setSourceRect:", v37, v39, v41, v43);

      -[PKPaletteToolPickerView sourceViewForPopoverPresentationForTool:](self, "sourceViewForPopoverPresentationForTool:", self->_selectedToolView);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "popoverPresentationController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setSourceView:", v35);

    if (!v24)
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "popoverPresentationController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_setShouldDisableInteractionDuringTransitions:", 0);

    -[PKPaletteToolPickerView delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "palettePopoverPassthroughViews");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "popoverPresentationController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setPassthroughViews:", v51);

    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "popoverPresentationController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_setIgnoresKeyboardNotifications:", 1);

    -[PKPaletteToolPickerView updatePopoverUI](self, "updatePopoverUI");
    objc_msgSend(v11, "presentedViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      -[PKPaletteToolPickerView presentedViewControllers](self, "presentedViewControllers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "removeAllObjects");

    }
    if (-[PKPaletteToolPickerView _canPresentToolAttributesPopover](self, "_canPresentToolAttributesPopover"))
    {
      -[PKPaletteToolPickerView presentedViewControllers](self, "presentedViewControllers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v59);

      -[PKPaletteToolPickerView tooltipPresentationHandle](self, "tooltipPresentationHandle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "hideFloatingLabel");

      -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __69__PKPaletteToolPickerView__showToolAttributesPopoverFromRect_inView___block_invoke;
      v61[3] = &unk_1E7778020;
      v61[4] = self;
      objc_msgSend(v11, "presentViewController:animated:completion:", v17, 1, v61);
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v19 = v18;
  if (objc_msgSend(v18, "isBeingPresented"))
  {

LABEL_29:
    goto LABEL_30;
  }
  v20 = objc_msgSend(v19, "isBeingDismissed");

  if ((v20 & 1) == 0)
    goto LABEL_8;
LABEL_30:

}

void __69__PKPaletteToolPickerView__showToolAttributesPopoverFromRect_inView___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "toolAttributesPopover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v2);

}

- (BOOL)_canPresentToolAttributesPopover
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isBeingPresented") & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[PKPaletteToolPickerView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "shouldPalettePresentPopover"))
      {
        -[PKPaletteToolPickerView presentedViewControllers](self, "presentedViewControllers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "containsObject:", v8) ^ 1;

      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)sourceRectForPopoverPresentationForTool:(id)a3
{
  id v4;
  void *WeakRetained;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  v4 = a3;
  if (-[PKPaletteToolPickerView cornerLocation](self, "cornerLocation") == -1)
  {
    -[PKPaletteToolPickerView scrollView](self, "scrollView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PKPaletteToolPickerView stackView](self, "stackView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertRect:fromView:", v22, v15, v17, v19, v21);
    v7 = v23;
    v9 = v24;
    v11 = v25;
    v13 = v26;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "toolPickerViewSourceRectForPopoverPresentation:fromCorner:", self, -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation"));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }

  v27 = -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation");
  -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation");
  if (v27 == -1)
    v28 = -5.0;
  else
    v28 = 0.0;
  v37.origin.x = v7;
  v37.origin.y = v9;
  v37.size.width = v11;
  v37.size.height = v13;
  v38 = CGRectInset(v37, v28, -5.0);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;

  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)sourceViewForPopoverPresentationForTool:(id)a3
{
  id WeakRetained;
  void *v5;

  if (-[PKPaletteToolPickerView cornerLocation](self, "cornerLocation", a3) == -1)
  {
    -[PKPaletteToolPickerView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "toolPickerViewSourceViewForPopoverPresentation:fromCorner:", self, -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)updatePopoverUI
{
  void *v3;
  id v4;

  -[PKPaletteToolPickerView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePalettePopover:", v3);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteToolPickerView;
  -[PKPaletteToolPickerView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[PKPaletteToolPickerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteToolPickerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = v8 != objc_msgSend(v4, "horizontalSizeClass");

  }
  else
  {
    v9 = 1;
  }

  -[PKPaletteToolPickerView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");
  v12 = objc_msgSend(v4, "userInterfaceStyle");

  if (v9 || v11 != v12)
  {
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
    -[PKPaletteToolPickerView updatePopoverUI](self, "updatePopoverUI");
    if (v9)
    {
      -[PKPaletteToolPickerView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toolPickerViewDidChangeTraitCollectionSizeClass:", self);

    }
  }

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *mutableToolViews;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableArray *v45;
  NSMutableArray *toolsWidthConstraints;
  NSMutableArray *v47;
  NSMutableArray *toolsHeightConstraints;
  NSMutableArray *v49;
  NSMutableArray *toolsWidthCompactConstraints;
  NSMutableArray *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unint64_t v83;
  BOOL v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void (**v106)(_QWORD);
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  unint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _QWORD *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  unint64_t v136;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  _QWORD aBlock[5];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[5];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[5];
  _QWORD v165[4];
  _QWORD v166[4];
  _QWORD v167[5];
  _QWORD v168[9];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPaletteToolPickerView _stackViewAxis](self, "_stackViewAxis");
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", v3);

  -[PKPaletteToolPickerView interItemToolsSpacing](self, "interItemToolsSpacing");
  v6 = v5;
  -[PKPaletteToolPickerView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpacing:", v6);

  v8 = -[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled");
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollEnabled:", v8);

  v10 = -[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled");
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 544);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v14, "setClipsToBounds:", v10);

  -[PKPaletteToolPickerView scalingFactor](self, "scalingFactor");
  v16 = v15;
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScalingFactor:", v16);

  -[PKPaletteToolPickerView clippingViewTopConstraint](self, "clippingViewTopConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", 0.0);

  -[PKPaletteToolPickerView clippingViewBottomConstraint](self, "clippingViewBottomConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", 0.0);

  -[PKPaletteToolPickerView clippingViewLeadingConstraint](self, "clippingViewLeadingConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", 0.0);

  -[PKPaletteToolPickerView clippingViewTrailingConstraint](self, "clippingViewTrailingConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", 0.0);

  -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setConstant:", 0.0);

  -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConstant:", 0.0);

  -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", 0.0);

  -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConstant:", 0.0);

  if (-[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize"))
  {
    mutableToolViews = self->_mutableToolViews;
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke;
    v164[3] = &unk_1E777DE20;
    v164[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](mutableToolViews, "enumerateObjectsUsingBlock:", v164);
  }
  else
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v27 = self->_mutableToolViews;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v161;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v161 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
          -[PKPaletteToolPickerView scalingFactor](self, "scalingFactor");
          objc_msgSend(v32, "setScalingFactor:");
        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
      }
      while (v29);
    }

  }
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v33 = self->_mutableToolViews;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v157;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v157 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
        objc_msgSend(v38, "setEdgeLocation:", -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation"));
        objc_msgSend(v38, "setColorUserInterfaceStyle:", -[PKPaletteToolPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
    }
    while (v35);
  }

  v39 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView toolsHeightConstraints](self, "toolsHeightConstraints");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "deactivateConstraints:", v40);

  v41 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView toolsWidthConstraints](self, "toolsWidthConstraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "deactivateConstraints:", v42);

  v43 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView toolsWidthCompactConstraints](self, "toolsWidthCompactConstraints");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "deactivateConstraints:", v44);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  toolsWidthConstraints = self->_toolsWidthConstraints;
  self->_toolsWidthConstraints = v45;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  toolsHeightConstraints = self->_toolsHeightConstraints;
  self->_toolsHeightConstraints = v47;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  toolsWidthCompactConstraints = self->_toolsWidthCompactConstraints;
  self->_toolsWidthCompactConstraints = v49;

  if (-[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize"))
  {
    v51 = self->_mutableToolViews;
    v155[0] = MEMORY[0x1E0C809B0];
    v155[1] = 3221225472;
    v155[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke_2;
    v155[3] = &unk_1E777DE20;
    v155[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v51, "enumerateObjectsUsingBlock:", v155);
  }
  else
  {
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v52 = self->_mutableToolViews;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v152;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v152 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
          -[PKPaletteToolPickerView toolsWidthConstraints](self, "toolsWidthConstraints");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "widthAnchor");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaletteToolPickerView widthAnchor](self, "widthAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "constraintEqualToAnchor:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v61);

          -[PKPaletteToolPickerView toolsHeightConstraints](self, "toolsHeightConstraints");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "heightAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaletteToolPickerView heightAnchor](self, "heightAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "constraintEqualToAnchor:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v65);

        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
      }
      while (v54);
    }

  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  -[PKPaletteToolPickerView toolsWidthConstraints](self, "toolsWidthConstraints");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView toolsHeightConstraints](self, "toolsHeightConstraints");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
  if (v69)
  {
    v71 = v69;
    v72 = *(_QWORD *)v148;
    do
    {
      for (m = 0; m != v71; ++m)
      {
        if (*(_QWORD *)v148 != v72)
          objc_enumerationMutation(v68);
        LODWORD(v70) = 1148829696;
        objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * m), "setPriority:", v70);
      }
      v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
    }
    while (v71);
  }

  v144 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView stackViewCompactHeightConstraint](self, "stackViewCompactHeightConstraint");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v168[0] = v145;
  -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v168[1] = v74;
  -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v168[2] = v75;
  -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v168[3] = v76;
  -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v168[4] = v77;
  -[PKPaletteToolPickerView scrollViewCenterXConstraint](self, "scrollViewCenterXConstraint");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v168[5] = v78;
  -[PKPaletteToolPickerView scrollViewCenterYConstraint](self, "scrollViewCenterYConstraint");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v168[6] = v79;
  -[PKPaletteToolPickerView scrollViewWidthConstraint](self, "scrollViewWidthConstraint");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v168[7] = v80;
  -[PKPaletteToolPickerView scrollViewHeightConstraint](self, "scrollViewHeightConstraint");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v168[8] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 9);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "deactivateConstraints:", v82);

  if (-[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled"))
  {
    v83 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
    v84 = v83 == 2 || v83 == 8;
    v85 = 0.0;
    if (v84)
      v86 = 0.0;
    else
      v86 = 4.0;
    if (v84)
      v87 = 4.0;
    else
      v87 = 0.0;
    v88 = 0.0;
  }
  else
  {
    v85 = *MEMORY[0x1E0DC49E8];
    v88 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v87 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v86 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setContentInset:", v85, v88, v87, v86);

  -[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize");
  -[PKPaletteToolPickerView scalingFactor](self, "scalingFactor");
  v91 = v90 * 0.0;
  if (!-[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize"))
  {
    -[PKPaletteToolPickerView stackView](self, "stackView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v109 = v108;
    v111 = v110;

    if (PKIsVisionDevice())
    {
      if (PKIsVisionDevice())
        v112 = 534.0;
      else
        v112 = 372.0;
    }
    else
    {
      v112 = 394.0;
    }
    -[PKPaletteToolPickerView scalingFactor](self, "scalingFactor");
    v114 = v112 * v113;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke_3;
    aBlock[3] = &unk_1E7778020;
    aBlock[4] = self;
    v106 = (void (**)(_QWORD))_Block_copy(aBlock);
    v115 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
    if (v115 == 8 || v115 == 2)
    {
      v116 = (void *)MEMORY[0x1E0CB3718];
      -[PKPaletteToolPickerView toolsWidthConstraints](self, "toolsWidthConstraints");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "activateConstraints:", v117);

      -[PKPaletteToolPickerView clippingViewTopConstraint](self, "clippingViewTopConstraint");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setConstant:", -v91);

      -[PKPaletteToolPickerView clippingViewBottomConstraint](self, "clippingViewBottomConstraint");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setConstant:", v91);

      -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setConstant:", v91);

      -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setConstant:", -v91);

      if (v111 < v114)
      {
        v122 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolPickerView scrollViewCenterYConstraint](self, "scrollViewCenterYConstraint");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v166[0] = v123;
        -[PKPaletteToolPickerView scrollViewHeightConstraint](self, "scrollViewHeightConstraint");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v166[1] = v124;
        -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v166[2] = v125;
        -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v166[3] = v126;
        v127 = (void *)MEMORY[0x1E0C99D20];
        v128 = v166;
LABEL_65:
        objc_msgSend(v127, "arrayWithObjects:count:", v128, 4);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "activateConstraints:", v135);

        goto LABEL_67;
      }
    }
    else
    {
      v129 = (void *)MEMORY[0x1E0CB3718];
      -[PKPaletteToolPickerView toolsHeightConstraints](self, "toolsHeightConstraints");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "activateConstraints:", v130);

      -[PKPaletteToolPickerView clippingViewLeadingConstraint](self, "clippingViewLeadingConstraint");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "setConstant:", -v91);

      -[PKPaletteToolPickerView clippingViewTrailingConstraint](self, "clippingViewTrailingConstraint");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setConstant:", v91);

      -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setConstant:", v91);

      -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setConstant:", -v91);

      if (v109 < v114)
      {
        v122 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteToolPickerView scrollViewCenterXConstraint](self, "scrollViewCenterXConstraint");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v165[0] = v123;
        -[PKPaletteToolPickerView scrollViewWidthConstraint](self, "scrollViewWidthConstraint");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v165[1] = v124;
        -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v165[2] = v125;
        -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v165[3] = v126;
        v127 = (void *)MEMORY[0x1E0C99D20];
        v128 = v165;
        goto LABEL_65;
      }
    }
    v106[2](v106);
    goto LABEL_67;
  }
  v92 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPickerView toolsWidthCompactConstraints](self, "toolsWidthCompactConstraints");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView scrollViewTopConstraint](self, "scrollViewTopConstraint");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v94;
  -[PKPaletteToolPickerView scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v167[1] = v95;
  -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v167[2] = v96;
  -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v167[3] = v97;
  -[PKPaletteToolPickerView stackViewCompactHeightConstraint](self, "stackViewCompactHeightConstraint");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v167[4] = v98;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 5);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "arrayByAddingObjectsFromArray:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "activateConstraints:", v100);

  -[PKPaletteToolPickerView clippingViewLeadingConstraint](self, "clippingViewLeadingConstraint");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setConstant:", -v91);

  -[PKPaletteToolPickerView clippingViewTrailingConstraint](self, "clippingViewTrailingConstraint");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setConstant:", v91);

  -[PKPaletteToolPickerView scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setConstant:", v91);

  -[PKPaletteToolPickerView scrollViewTrailingConstraint](self, "scrollViewTrailingConstraint");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setConstant:", -v91);

  if (-[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled"))
    v105 = 6.0;
  else
    v105 = 0.0;
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v106 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setContentInset:", 0.0, 0.0, 0.0, v105);
LABEL_67:

  v136 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
  v138 = v136 == 2 || v136 == 8;
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v139 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v139;
  if (v139 && *(_QWORD *)(v139 + 552) != v138)
  {
    *(_QWORD *)(v139 + 552) = v138;
    -[PKPaletteToolPickerClippingView _updateUI](v139);
  }

  v141 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation") == 8;
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v142 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v142;
  if (v142 && *(unsigned __int8 *)(v142 + 528) != v141)
  {
    *(_BYTE *)(v142 + 528) = v141;
    -[PKPaletteToolPickerClippingView _updateUI](v142);
  }

  -[PKPaletteToolPickerView updateClippingViewEdgesVisibility](self, "updateClippingViewEdgesVisibility");
}

void __36__PKPaletteToolPickerView__updateUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "intrinsicContentSize");
  v6 = v5;
  objc_msgSend(v10, "scalingFactor");
  v8 = v6 / v7;
  objc_msgSend(*(id *)(a1 + 32), "_widthForToolAtIndex:isCompactSize:", a3, 1);
  objc_msgSend(v10, "setScalingFactor:", v9 / v8);

}

void __36__PKPaletteToolPickerView__updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_widthForToolAtIndex:isCompactSize:", a3, 1);
  v8 = v7;
  objc_msgSend(v6, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "constraintEqualToConstant:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "toolsWidthCompactConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

void __36__PKPaletteToolPickerView__updateUI__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "scrollViewTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(*(id *)(a1 + 32), "scrollViewBottomConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(*(id *)(a1 + 32), "scrollViewLeadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(*(id *)(a1 + 32), "scrollViewTrailingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConstraints:", v7);

}

- (void)updateClippingViewEdgesVisibility
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  _BOOL4 v19;
  int v20;
  _BYTE *v21;
  _BYTE *v22;

  v3 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
  if (v3 == 2 || v3 == 8)
  {
    -[PKPaletteToolPickerView scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
  }
  else
  {
    -[PKPaletteToolPickerView scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v7;
  }

  v8 = -[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled");
  v9 = v6 > 10.0 && v8;
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && *(unsigned __int8 *)(v10 + 529) != v9)
  {
    *(_BYTE *)(v10 + 529) = v9;
    -[PKPaletteToolPickerClippingView _updateUI](v10);
  }

  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pk_maximumContentOffset");
  v14 = v13;
  v16 = v15;

  v17 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
  if (v17 == 8 || v17 == 2)
    v14 = v16;
  v19 = -[PKPaletteToolPickerView isScrollingEnabled](self, "isScrollingEnabled");
  v20 = v6 < v14 + -10.0 && v19;
  -[PKPaletteToolPickerView clippingView](self, "clippingView");
  v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v21 && v21[530] != v20)
  {
    v21[530] = v20;
    v22 = v21;
    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)v21);
    v21 = v22;
  }

}

- (BOOL)_useCompactSize
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteToolPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (int64_t)_stackViewAxis
{
  unint64_t v4;

  if (-[PKPaletteToolPickerView _useCompactSize](self, "_useCompactSize"))
    return 0;
  v4 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation");
  return v4 == 2 || v4 == 8;
}

- (double)_widthForToolAtIndex:(unint64_t)a3 isCompactSize:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;

  v4 = a4;
  -[PKPaletteToolPickerView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolPickerView:widthForToolAtIndex:isCompactSize:", self, a3, v4);
  v9 = v8;

  return v9;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (BOOL)canToggleSelectedToolAndEraser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  if ((unint64_t)-[NSMutableArray count](self->_mutableToolViews, "count") >= 2)
  {
    -[PKPaletteToolPickerView selectedToolView](self, "selectedToolView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tool");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isErasingTool"))
    {

    }
    else
    {
      -[PKPaletteToolPickerView _eraserToolView](self, "_eraserToolView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        return 1;
    }
    -[PKPaletteToolPickerView selectedToolView](self, "selectedToolView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isErasingTool") & 1) != 0)
    {
      -[PKPaletteToolView tool](self->_lastSelectedToolView, "tool");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isErasingTool");

      if (!v9)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (void)toggleSelectedToolAndEraserAnimated:(BOOL)a3
{
  _BOOL8 v3;
  PKPaletteToolView *v5;
  PKPaletteToolPickerView *v6;
  PKPaletteToolView *lastSelectedToolView;
  NSObject *v8;
  NSMutableArray *mutableToolViews;
  uint64_t v10;
  PKPaletteToolView *v11;
  PKPaletteToolView *v12;
  PKPaletteToolView *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v3 = a3;
  if (-[PKPaletteToolPickerView canToggleSelectedToolAndEraser](self, "canToggleSelectedToolAndEraser"))
  {
    -[PKPaletteToolPickerView _eraserToolView](self, "_eraserToolView");
    v13 = (PKPaletteToolView *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPickerView selectedToolView](self, "selectedToolView");
    v5 = (PKPaletteToolView *)objc_claimAutoreleasedReturnValue();

    if (v5 == v13)
    {
      lastSelectedToolView = self->_lastSelectedToolView;
      if (!lastSelectedToolView)
      {
        mutableToolViews = self->_mutableToolViews;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __63__PKPaletteToolPickerView_toggleSelectedToolAndEraserAnimated___block_invoke;
        v14[3] = &unk_1E777DD60;
        v14[4] = self;
        v10 = -[NSMutableArray indexOfObjectPassingTest:](mutableToolViews, "indexOfObjectPassingTest:", v14);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableArray objectAtIndex:](self->_mutableToolViews, "objectAtIndex:", v10);
          v11 = (PKPaletteToolView *)objc_claimAutoreleasedReturnValue();
          v12 = self->_lastSelectedToolView;
          self->_lastSelectedToolView = v11;

        }
        lastSelectedToolView = self->_lastSelectedToolView;
      }
      v6 = self;
    }
    else
    {
      v6 = self;
      lastSelectedToolView = v13;
    }
    -[PKPaletteToolPickerView _setSelectedToolView:animated:showToolTip:notifyDelegate:](v6, "_setSelectedToolView:animated:showToolTip:notifyDelegate:", lastSelectedToolView, v3, 1, 1);
    -[PKPaletteToolPickerView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);

  }
  else
  {
    v8 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Can't toggle between last selected tool and eraser.", buf, 2u);
    }

  }
}

uint64_t __63__PKPaletteToolPickerView_toggleSelectedToolAndEraserAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 464) == v3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "tool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isInkingTool") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "tool");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isHandwritingTool");

    }
  }

  return v6;
}

- (BOOL)canToggleSelectedToolAndLastSelectedTool
{
  return (unint64_t)-[NSMutableArray count](self->_mutableToolViews, "count") > 1;
}

- (void)toggleSelectedToolAndLastSelectedToolAnimated:(BOOL)a3
{
  _BOOL8 v3;
  PKPaletteToolView *lastSelectedToolView;
  NSMutableArray *mutableToolViews;
  uint64_t v7;
  PKPaletteToolView *v8;
  PKPaletteToolView *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v3 = a3;
  if (-[PKPaletteToolPickerView canToggleSelectedToolAndLastSelectedTool](self, "canToggleSelectedToolAndLastSelectedTool"))
  {
    lastSelectedToolView = self->_lastSelectedToolView;
    if (!lastSelectedToolView)
    {
      mutableToolViews = self->_mutableToolViews;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __73__PKPaletteToolPickerView_toggleSelectedToolAndLastSelectedToolAnimated___block_invoke;
      v11[3] = &unk_1E777DD60;
      v11[4] = self;
      v7 = -[NSMutableArray indexOfObjectPassingTest:](mutableToolViews, "indexOfObjectPassingTest:", v11);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray objectAtIndex:](self->_mutableToolViews, "objectAtIndex:", v7);
        v8 = (PKPaletteToolView *)objc_claimAutoreleasedReturnValue();
        v9 = self->_lastSelectedToolView;
        self->_lastSelectedToolView = v8;

      }
      lastSelectedToolView = self->_lastSelectedToolView;
    }
    -[PKPaletteToolPickerView _setSelectedToolView:animated:showToolTip:notifyDelegate:](self, "_setSelectedToolView:animated:showToolTip:notifyDelegate:", lastSelectedToolView, v3, 1, 1);
    -[PKPaletteToolPickerView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
  }
  else
  {
    v10 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Can't toggle between last selected tool and currently selected tool.", buf, 2u);
    }

  }
}

BOOL __73__PKPaletteToolPickerView_toggleSelectedToolAndLastSelectedToolAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) != a2;
}

- (void)toggleSelectedToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  -[PKPaletteToolPickerView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "palettePopoverPresentingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_3;
  v12 = (void *)v11;
  objc_msgSend(v10, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView toolAttributesPopover](self, "toolAttributesPopover");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
    -[PKPaletteToolPickerView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
  else
LABEL_3:
    -[PKPaletteToolPickerView _showToolAttributesPopoverFromRect:inView:](self, "_showToolAttributesPopoverFromRect:inView:", v15, x, y, width, height);

}

- (BOOL)_isAllToolsColorUserInterfaceStyleEqualsTo:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_mutableToolViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = -[PKPaletteToolPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle", (_QWORD)v13);
        v8 &= v11 == objc_msgSend(v10, "colorUserInterfaceStyle");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_isAllToolsEdgeLocationEqualsTo:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_mutableToolViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation", (_QWORD)v13);
        v8 &= v11 == objc_msgSend(v10, "edgeLocation");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)reloadToolViewsWithDataSource:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  v4 = (void *)-[NSMutableArray copy](self->_mutableToolViews, "copy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PKPaletteToolPickerView_reloadToolViewsWithDataSource___block_invoke;
  v10[3] = &unk_1E777DE20;
  v10[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  v5 = objc_msgSend(v9, "numberOfToolsInToolPickerView:", self);
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v9, "toolPickerView:viewForToolAtIndex:", self, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPickerView _addToolView:updateUI:](self, "_addToolView:updateUI:", v8, 0);

    }
  }
  -[PKPaletteToolPickerView _updateUI](self, "_updateUI");

}

uint64_t __57__PKPaletteToolPickerView_reloadToolViewsWithDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeToolView:updateUI:", a2, 0);
}

- (void)setScrollingEnabled:(BOOL)a3
{
  if (self->_scrollingEnabled != a3)
  {
    self->_scrollingEnabled = a3;
    -[PKPaletteToolPickerView _updateUI](self, "_updateUI");
  }
}

- (void)scrollSelectedToolViewToVisibleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PKPaletteToolPickerView scrollView](self, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPickerView selectedToolView](self, "selectedToolView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  objc_msgSend(v6, "scrollRectToVisible:animated:", v3);

}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteToolPickerViewDelegate)delegate
{
  return (PKPaletteToolPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaletteToolView)selectedToolView
{
  return self->_selectedToolView;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (double)interItemToolsSpacing
{
  return self->_interItemToolsSpacing;
}

- (BOOL)unselectedToolsVisible
{
  return self->_unselectedToolsVisible;
}

- (BOOL)isScrollingEnabled
{
  return self->_scrollingEnabled;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle
{
  return self->_tooltipPresentationHandle;
}

- (void)setTooltipPresentationHandle:(id)a3
{
  objc_storeStrong((id *)&self->_tooltipPresentationHandle, a3);
}

- (PKDrawingPaletteStatistics)drawingPaletteStatistics
{
  return self->_drawingPaletteStatistics;
}

- (void)setDrawingPaletteStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, a3);
}

- (PKPaletteToolPickerClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (NSLayoutConstraint)scrollViewTopConstraint
{
  return self->_scrollViewTopConstraint;
}

- (void)setScrollViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewTopConstraint, a3);
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, a3);
}

- (NSLayoutConstraint)scrollViewLeadingConstraint
{
  return self->_scrollViewLeadingConstraint;
}

- (void)setScrollViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (void)setScrollViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)scrollViewCenterXConstraint
{
  return self->_scrollViewCenterXConstraint;
}

- (void)setScrollViewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewCenterXConstraint, a3);
}

- (NSLayoutConstraint)scrollViewCenterYConstraint
{
  return self->_scrollViewCenterYConstraint;
}

- (void)setScrollViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewCenterYConstraint, a3);
}

- (NSLayoutConstraint)scrollViewWidthConstraint
{
  return self->_scrollViewWidthConstraint;
}

- (void)setScrollViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewWidthConstraint, a3);
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)stackViewCompactHeightConstraint
{
  return self->_stackViewCompactHeightConstraint;
}

- (void)setStackViewCompactHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewCompactHeightConstraint, a3);
}

- (NSLayoutConstraint)clippingViewTopConstraint
{
  return self->_clippingViewTopConstraint;
}

- (void)setClippingViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clippingViewTopConstraint, a3);
}

- (NSLayoutConstraint)clippingViewBottomConstraint
{
  return self->_clippingViewBottomConstraint;
}

- (void)setClippingViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clippingViewBottomConstraint, a3);
}

- (NSLayoutConstraint)clippingViewLeadingConstraint
{
  return self->_clippingViewLeadingConstraint;
}

- (void)setClippingViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clippingViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)clippingViewTrailingConstraint
{
  return self->_clippingViewTrailingConstraint;
}

- (void)setClippingViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clippingViewTrailingConstraint, a3);
}

- (NSMutableArray)toolsWidthConstraints
{
  return self->_toolsWidthConstraints;
}

- (void)setToolsWidthConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_toolsWidthConstraints, a3);
}

- (NSMutableArray)toolsHeightConstraints
{
  return self->_toolsHeightConstraints;
}

- (void)setToolsHeightConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_toolsHeightConstraints, a3);
}

- (NSMutableArray)toolsWidthCompactConstraints
{
  return self->_toolsWidthCompactConstraints;
}

- (void)setToolsWidthCompactConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_toolsWidthCompactConstraints, a3);
}

- (PKPaletteToolView)lastSelectedToolView
{
  return self->_lastSelectedToolView;
}

- (void)setLastSelectedToolView:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedToolView, a3);
}

- (PKPaletteAttributeViewController)toolAttributesPopover
{
  return self->_toolAttributesPopover;
}

- (void)setToolAttributesPopover:(id)a3
{
  objc_storeStrong((id *)&self->_toolAttributesPopover, a3);
}

- (NSHashTable)presentedViewControllers
{
  return self->_presentedViewControllers;
}

- (void)setPresentedViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewControllers, a3);
}

- (UIScrollViewDelegate)lastScrollViewDelegateBeforeScrollingToolToVisible
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_lastScrollViewDelegateBeforeScrollingToolToVisible);
}

- (void)setLastScrollViewDelegateBeforeScrollingToolToVisible:(id)a3
{
  objc_storeWeak((id *)&self->_lastScrollViewDelegateBeforeScrollingToolToVisible, a3);
}

- (PKScrollViewDelegateEventsHandler)scrollViewDelegateEventsHandler
{
  return self->_scrollViewDelegateEventsHandler;
}

- (void)setScrollViewDelegateEventsHandler:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewDelegateEventsHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewDelegateEventsHandler, 0);
  objc_destroyWeak((id *)&self->_lastScrollViewDelegateBeforeScrollingToolToVisible);
  objc_storeStrong((id *)&self->_presentedViewControllers, 0);
  objc_storeStrong((id *)&self->_toolAttributesPopover, 0);
  objc_storeStrong((id *)&self->_lastSelectedToolView, 0);
  objc_storeStrong((id *)&self->_toolsWidthCompactConstraints, 0);
  objc_storeStrong((id *)&self->_toolsHeightConstraints, 0);
  objc_storeStrong((id *)&self->_toolsWidthConstraints, 0);
  objc_storeStrong((id *)&self->_clippingViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);
  objc_storeStrong((id *)&self->_tooltipPresentationHandle, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_selectedToolView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutableToolViews, 0);
}

@end
