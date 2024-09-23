@implementation PKDrawingPaletteInputAssistantView

- (PKDrawingPaletteInputAssistantView)initWithFrame:(CGRect)a3
{
  PKDrawingPaletteInputAssistantView *v3;
  PKDrawingPaletteInputAssistantView *v4;
  uint64_t v5;
  NSHashTable *viewStateObservers;
  UIStackView *v7;
  UIStackView *contentStackView;
  PKPaletteButtonGroupView *v9;
  PKPaletteButtonGroupView *topOrTrailingGroupView;
  PKPaletteButtonGroupView *v11;
  PKPaletteButtonGroupView *bottomOrLeadingGroupView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKDrawingPaletteInputAssistantView;
  v3 = -[PKDrawingPaletteInputAssistantView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    viewStateObservers = v4->_viewStateObservers;
    v4->_viewStateObservers = (NSHashTable *)v5;

    v7 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v7;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v4->_contentStackView, "setAlignment:", 1);
    -[PKDrawingPaletteInputAssistantView addSubview:](v4, "addSubview:", v4->_contentStackView);
    v9 = objc_alloc_init(PKPaletteButtonGroupView);
    topOrTrailingGroupView = v4->_topOrTrailingGroupView;
    v4->_topOrTrailingGroupView = v9;

    -[PKPaletteButtonGroupView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topOrTrailingGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_contentStackView, "addArrangedSubview:", v4->_topOrTrailingGroupView);
    v11 = objc_alloc_init(PKPaletteButtonGroupView);
    bottomOrLeadingGroupView = v4->_bottomOrLeadingGroupView;
    v4->_bottomOrLeadingGroupView = v11;

    -[PKPaletteButtonGroupView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bottomOrLeadingGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_contentStackView, "addArrangedSubview:", v4->_bottomOrLeadingGroupView);
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView centerXAnchor](v4->_contentStackView, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView centerXAnchor](v4, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    -[UIStackView centerYAnchor](v4->_contentStackView, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView centerYAnchor](v4, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v20);

    -[PKDrawingPaletteInputAssistantView _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  unint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  if (-[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"))
  {
    -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10 = -[PKDrawingPaletteInputAssistantView _useThreeButtonLayout](self, "_useThreeButtonLayout");
    v11 = -[PKDrawingPaletteInputAssistantView edgeLocation](self, "edgeLocation");
    if (v10)
    {
      v12 = v11 == 2 || v11 == 8;
      if (v12)
        v13 = 132.0;
      else
        v13 = 84.0;
      if (v12)
        v14 = 84.0;
      else
        v14 = 132.0;
      -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
      v16 = v14 * v15;
      v9 = v13 * v15;
    }
    else
    {
      -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
      v16 = v17 * 84.0;
      -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
      v9 = v18 * 84.0;
    }
    v8 = v16;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)addViewStateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDrawingPaletteInputAssistantView viewStateObservers](self, "viewStateObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeViewStateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDrawingPaletteInputAssistantView viewStateObservers](self, "viewStateObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_notifyViewStateDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKDrawingPaletteInputAssistantView viewStateObservers](self, "viewStateObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "paletteInputAssistantViewDidChangeViewState:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)hasInputAssistantItems
{
  void *v3;
  BOOL v4;

  -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count")
    || -[PKDrawingPaletteInputAssistantView shouldShowKeyboardButton](self, "shouldShowKeyboardButton")
    || -[PKDrawingPaletteInputAssistantView shouldShowReturnKeyButton](self, "shouldShowReturnKeyButton");

  return v4;
}

- (void)setButtons:(id)a3
{
  NSArray *v4;
  NSArray *buttons;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  buttons = self->_buttons;
  if (buttons != v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = buttons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "removeIntrinsicContentSizeObserver:", self);
          objc_msgSend(v11, "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v12 = (NSArray *)-[NSArray copy](v4, "copy");
    v13 = self->_buttons;
    self->_buttons = v12;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_buttons;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          objc_msgSend(v19, "removeFromSuperview", (_QWORD)v20);
          objc_msgSend(v19, "addIntrinsicContentSizeObserver:", self);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }

}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }
}

- (void)setShouldShowKeyboardButton:(BOOL)a3
{
  if (self->_shouldShowKeyboardButton != a3)
  {
    self->_shouldShowKeyboardButton = a3;
    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }
}

- (void)setShouldShowReturnKeyButton:(BOOL)a3
{
  if (self->_shouldShowReturnKeyButton != a3)
  {
    self->_shouldShowReturnKeyButton = a3;
    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }
}

- (void)setEnableKeyboardButtons:(BOOL)a3
{
  if (self->_enableKeyboardButtons != a3)
  {
    self->_enableKeyboardButtons = a3;
    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _QWORD v23[5];

  if (-[PKDrawingPaletteInputAssistantView shouldShowKeyboardButton](self, "shouldShowKeyboardButton")
    && (-[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    +[PKPaletteButton keyboardButton](PKPaletteButton, "keyboardButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView setKeyboardButton:](self, "setKeyboardButton:", v6);

    -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIntrinsicContentSizeObserver:", self);

  }
  else if (!-[PKDrawingPaletteInputAssistantView shouldShowKeyboardButton](self, "shouldShowKeyboardButton"))
  {
    -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[PKDrawingPaletteInputAssistantView setKeyboardButton:](self, "setKeyboardButton:", 0);
    }
  }
  -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout");
    -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUseCompactLayout:", v9);

    v11 = -[PKDrawingPaletteInputAssistantView enableKeyboardButtons](self, "enableKeyboardButtons");
    -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnableKeyboardToggle:", v11);

  }
  if (-[PKDrawingPaletteInputAssistantView shouldShowReturnKeyButton](self, "shouldShowReturnKeyButton")
    && (-[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    +[PKPaletteButton returnKeyButton](PKPaletteButton, "returnKeyButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView setReturnKeyButton:](self, "setReturnKeyButton:", v16);

    -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addIntrinsicContentSizeObserver:", self);

  }
  else if (!-[PKDrawingPaletteInputAssistantView shouldShowReturnKeyButton](self, "shouldShowReturnKeyButton"))
  {
    -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      -[PKDrawingPaletteInputAssistantView setReturnKeyButton:](self, "setReturnKeyButton:", 0);
    }
  }
  -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout");
    -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUseCompactLayout:", v19);

    v21 = -[PKDrawingPaletteInputAssistantView enableKeyboardButtons](self, "enableKeyboardButtons");
    -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEnabled:", v21);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__PKDrawingPaletteInputAssistantView__updateUI__block_invoke;
  v23[3] = &unk_1E7778020;
  v23[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v23);
  -[PKDrawingPaletteInputAssistantView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

uint64_t __47__PKDrawingPaletteInputAssistantView__updateUI__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContentViewSpacing");
  objc_msgSend(*(id *)(a1 + 32), "_updateGroupViewContents");
  objc_msgSend(*(id *)(a1 + 32), "_updateContentOrientation");
  objc_msgSend(*(id *)(a1 + 32), "_updateContentScalingFactor");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_useThreeButtonLayout
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (!v5
    || -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout")
    || !-[PKDrawingPaletteInputAssistantView shouldShowKeyboardButton](self, "shouldShowKeyboardButton")
    || !-[PKDrawingPaletteInputAssistantView shouldShowReturnKeyButton](self, "shouldShowReturnKeyButton"))
  {
    return 0;
  }
  -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 1;

  return v7;
}

- (void)_updateGroupViewContents
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  double v24;
  double v25;
  unint64_t v26;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void **v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[8];
  _QWORD v110[9];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v102;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v102 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v9++), "setUseCompactLayout:", -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
      }
      while (v7);
    }

    -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllButtons");

    -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllButtons");

    -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView _topOrTrailingGroupViewButtons](self, "_topOrTrailingGroupViewButtons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButtonsFromArray:", v15);

    if (-[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"))
    {
      -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addButtonsFromArray:", v17);
    }
    else
    {
      if (-[PKDrawingPaletteInputAssistantView _useThreeButtonLayout](self, "_useThreeButtonLayout"))
      {
        -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeAllButtons");

        -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingPaletteInputAssistantView addSubview:](self, "addSubview:", v19);

        -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingPaletteInputAssistantView addSubview:](self, "addSubview:", v21);

        -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "removeFromSuperview");
        -[PKDrawingPaletteInputAssistantView addSubview:](self, "addSubview:", v16);
        objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
        v25 = v24 * 12.0;
        v26 = -[PKDrawingPaletteInputAssistantView edgeLocation](self, "edgeLocation");
        if (v26 == 8 || v26 == 2)
        {
          v75 = (void *)MEMORY[0x1E0CB3718];
          -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "topAnchor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView topAnchor](self, "topAnchor");
          v74 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:", v74);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v110[0] = v100;
          -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "centerXAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerXAnchor](self, "centerXAnchor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v27;
          objc_msgSend(v27, "constraintEqualToAnchor:", v97);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v110[1] = v96;
          -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "bottomAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "topAnchor");
          v94 = v28;
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "constraintEqualToAnchor:constant:", -v25);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v110[2] = v91;
          objc_msgSend(v16, "leadingAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView leadingAnchor](self, "leadingAnchor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v29;
          objc_msgSend(v29, "constraintEqualToAnchor:", v89);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v110[3] = v88;
          objc_msgSend(v16, "trailingAnchor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerXAnchor](self, "centerXAnchor");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v30;
          objc_msgSend(v30, "constraintEqualToAnchor:constant:", v86, -(v25 * 0.5));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v110[4] = v85;
          objc_msgSend(v16, "bottomAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView bottomAnchor](self, "bottomAnchor");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v31;
          objc_msgSend(v31, "constraintEqualToAnchor:", v83);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v110[5] = v82;
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "leadingAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerXAnchor](self, "centerXAnchor");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v32;
          objc_msgSend(v32, "constraintEqualToAnchor:constant:", v79, v25 * 0.5);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v110[6] = v78;
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "trailingAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView trailingAnchor](self, "trailingAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "constraintEqualToAnchor:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v110[7] = v36;
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "bottomAnchor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView bottomAnchor](self, "bottomAnchor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "constraintEqualToAnchor:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v110[8] = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 9);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "activateConstraints:", v41);

          v42 = v73;
          v43 = v76;

          v44 = (void *)v74;
        }
        else
        {
          v77 = (void *)MEMORY[0x1E0CB3718];
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "topAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView topAnchor](self, "topAnchor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:", v44);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v109[0] = v100;
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "bottomAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerYAnchor](self, "centerYAnchor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v47;
          objc_msgSend(v47, "constraintEqualToAnchor:constant:", v97, -(v25 * 0.5));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v109[1] = v96;
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "trailingAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView trailingAnchor](self, "trailingAnchor");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = v48;
          objc_msgSend(v48, "constraintEqualToAnchor:", v93);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v109[2] = v92;
          objc_msgSend(v16, "topAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerYAnchor](self, "centerYAnchor");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v49;
          objc_msgSend(v49, "constraintEqualToAnchor:constant:", v90, v25 * 0.5);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v109[3] = v89;
          objc_msgSend(v16, "trailingAnchor");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView trailingAnchor](self, "trailingAnchor");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v50;
          objc_msgSend(v50, "constraintEqualToAnchor:", v87);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v109[4] = v86;
          objc_msgSend(v16, "bottomAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView bottomAnchor](self, "bottomAnchor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v51;
          objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v84);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v109[5] = v83;
          -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "trailingAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "leadingAnchor");
          v81 = v52;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "constraintEqualToAnchor:constant:", -v25);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v109[6] = v78;
          -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "centerYAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView centerYAnchor](self, "centerYAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "constraintEqualToAnchor:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v109[7] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "activateConstraints:", v37);
        }

        goto LABEL_26;
      }
      switch(v4)
      {
        case 1:
          -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addButtonsFromArray:", v46);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeAllButtons");
          goto LABEL_26;
        case 2:
          -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addButtonsFromArray:", v56);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v57;
          v58 = (void *)MEMORY[0x1E0C99D20];
          v59 = &v107;
          goto LABEL_23;
        case 3:
          -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "subarrayWithRange:", 0, 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addButtonsFromArray:", v62);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v57;
          v58 = (void *)MEMORY[0x1E0C99D20];
          v59 = &v106;
          goto LABEL_23;
        case 4:
          -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "subarrayWithRange:", 0, 2);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addButtonsFromArray:", v65);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "subarrayWithRange:", 2, 2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addButtonsFromArray:", v57);
          goto LABEL_24;
        default:
          -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "subarrayWithRange:", 0, 2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addButtonsFromArray:", v68);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "subarrayWithRange:", 2, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addButtonsFromArray:", v71);

          -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDrawingPaletteInputAssistantView buttons](self, "buttons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v57;
          v58 = (void *)MEMORY[0x1E0C99D20];
          v59 = &v105;
LABEL_23:
          objc_msgSend(v58, "arrayWithObjects:count:", v59, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addButtonsFromArray:", v72);

LABEL_24:
          break;
      }
    }

LABEL_26:
  }
}

- (id)_topOrTrailingGroupViewButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"))
  {
    if (-[PKDrawingPaletteInputAssistantView shouldShowKeyboardButton](self, "shouldShowKeyboardButton"))
    {
      -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);

      }
    }
    if (-[PKDrawingPaletteInputAssistantView shouldShowReturnKeyButton](self, "shouldShowReturnKeyButton"))
    {
      -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v7);

      }
    }
  }
  return v3;
}

- (void)_updateContentOrientation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeArrangedSubview:", v10);

        objc_msgSend(v10, "removeFromSuperview");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

  v12 = -[PKDrawingPaletteInputAssistantView _contentStackViewAlignment](self, "_contentStackViewAlignment");
  -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", v12);

  LODWORD(v13) = -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout");
  -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!(_DWORD)v13)
  {
    objc_msgSend(v14, "setAxis:", 1);

    -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addArrangedSubview:", v29);

    -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v14, "setAxis:", 0);

  -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAxis:", 0);

  -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAxis:", 0);

  -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "buttons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addArrangedSubview:", v22);

  }
  -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "buttons");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v30 = (void *)v27;
    objc_msgSend(v26, "addArrangedSubview:", v27);

  }
}

- (void)_updateContentScalingFactor
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
  v4 = v3;
  -[PKDrawingPaletteInputAssistantView topOrTrailingGroupView](self, "topOrTrailingGroupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScalingFactor:", v4);

  -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
  v7 = v6;
  -[PKDrawingPaletteInputAssistantView bottomOrLeadingGroupView](self, "bottomOrLeadingGroupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScalingFactor:", v7);

  -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
  v10 = v9;
  -[PKDrawingPaletteInputAssistantView returnKeyButton](self, "returnKeyButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScalingFactor:", v10);

  -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
  v13 = v12;
  -[PKDrawingPaletteInputAssistantView keyboardButton](self, "keyboardButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScalingFactor:", v13);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PKDrawingPaletteInputAssistantView buttons](self, "buttons", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19);
        -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
        objc_msgSend(v20, "setScalingFactor:");
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (void)_updateContentViewSpacing
{
  double v3;
  double v4;
  id v5;

  -[PKDrawingPaletteInputAssistantView _contentStackViewSpacing](self, "_contentStackViewSpacing");
  v4 = v3;
  -[PKDrawingPaletteInputAssistantView contentStackView](self, "contentStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpacing:", v4);

}

- (int64_t)_contentStackViewAlignment
{
  if (-[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"))
    return 3;
  else
    return 1;
}

- (double)_contentStackViewSpacing
{
  void *v3;
  unint64_t v4;
  double result;
  double v6;

  if (-[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout")
    || (-[PKDrawingPaletteInputAssistantView buttons](self, "buttons"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        result = 0.0,
        v4 >= 2))
  {
    -[PKDrawingPaletteInputAssistantView scalingFactor](self, "scalingFactor");
    return v6 * 12.0;
  }
  return result;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKDrawingPaletteInputAssistantView _updateContentOrientation](self, "_updateContentOrientation");
    -[PKDrawingPaletteInputAssistantView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKDrawingPaletteInputAssistantView _updateUI](self, "_updateUI");
    -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange");
  }
}

- (void)buttonDidChangeIntrinsicContentSize:(id)a3
{
  -[PKDrawingPaletteInputAssistantView _notifyViewStateDidChange](self, "_notifyViewStateDidChange", a3);
  -[PKDrawingPaletteInputAssistantView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (BOOL)shouldShowKeyboardButton
{
  return self->_shouldShowKeyboardButton;
}

- (BOOL)shouldShowReturnKeyButton
{
  return self->_shouldShowReturnKeyButton;
}

- (BOOL)enableKeyboardButtons
{
  return self->_enableKeyboardButtons;
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardButton, a3);
}

- (PKPaletteButton)returnKeyButton
{
  return self->_returnKeyButton;
}

- (void)setReturnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyButton, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (PKPaletteButtonGroupView)topOrTrailingGroupView
{
  return self->_topOrTrailingGroupView;
}

- (void)setTopOrTrailingGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_topOrTrailingGroupView, a3);
}

- (PKPaletteButtonGroupView)bottomOrLeadingGroupView
{
  return self->_bottomOrLeadingGroupView;
}

- (void)setBottomOrLeadingGroupView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomOrLeadingGroupView, a3);
}

- (NSHashTable)viewStateObservers
{
  return self->_viewStateObservers;
}

- (void)setViewStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_viewStateObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStateObservers, 0);
  objc_storeStrong((id *)&self->_bottomOrLeadingGroupView, 0);
  objc_storeStrong((id *)&self->_topOrTrailingGroupView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
