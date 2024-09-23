@implementation SFCapsuleNavigationBar

- (void)_updatePageFormatButtonForNavigationBarItem:(id)a3 shouldResetDiscovery:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;

  v4 = a4;
  v30 = a3;
  v6 = -[_SFBarRegistrationToken pageFormatItemState](self->_registration, "pageFormatItemState");
  v7 = v6;
  if (v4)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFEFLL;
  }
  else if (!v30)
  {
    v13 = v6 | 0x10;
    goto LABEL_40;
  }
  v8 = -[_SFBarTheme tintStyle](self->_theme, "tintStyle");
  if (v8 && (v9 = v8, _SFIsPrivateTintStyle(v8)))
  {
    v10 = _SFIsDarkTintStyle(v9);
    v11 = 1024;
    if (v10)
      v11 = 0;
    v25 = v11;
  }
  else
  {
    v25 = 0;
  }
  v12 = v30;
  if ((v7 & 0x10) != 0)
  {
    v27 = 0;
    v28 = 0;
  }
  else
  {
    if (-[WBSContentAvailabilityDisplayController isDisplaying](self->_availabilityDisplayController, "isDisplaying"))
    {
      if ((-[WBSContentAvailabilityDisplayController currentOptions](self->_availabilityDisplayController, "currentOptions") & 0x20) != 0)
      {
        v27 = 0;
        v28 = 1;
      }
      else
      {
        v27 = ((unint64_t)-[WBSContentAvailabilityDisplayController currentOptions](self->_availabilityDisplayController, "currentOptions") >> 4) & 4;
        v28 = 0;
      }
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    v12 = v30;
  }
  v29 = v7 & 0xFFFFFFFFFFFF8090;
  if (objc_msgSend(v12, "showsSiriReaderPlayingIcon", v25))
    v14 = 2048;
  else
    v14 = 0;
  v15 = (objc_msgSend(v30, "contentOptions") & 0x1F) != 0;
  v16 = objc_msgSend(v30, "contentOptions");
  if (objc_msgSend(v30, "readerButtonSelected"))
    v17 = 2;
  else
    v17 = 0;
  if (objc_msgSend(v30, "showsTranslationIcon"))
    v18 = 8;
  else
    v18 = 0;
  if (objc_msgSend(v30, "menuButtonSelected"))
    v19 = 32;
  else
    v19 = 0;
  if (objc_msgSend(v30, "extensionsAreActive"))
    v20 = 256;
  else
    v20 = 0;
  if (objc_msgSend(v30, "needsExtensionBadge"))
    v21 = 512;
  else
    v21 = 0;
  v22 = objc_msgSend(v30, "mediaStateIcon") != 0;
  v23 = objc_msgSend(v30, "hasHiddenElements");
  v24 = 0x4000;
  if (!v23)
    v24 = 0;
  v13 = (v26 | v28 | v27 | v14 | v29) & 0xFFFFFFFFFFFFEFFFLL | (v15 << 13) | ((unint64_t)(v16 & 1) << 12) | v17 | v18 | v19 | v20 | v21 | (v22 << 6) | v24;
LABEL_40:
  -[_SFBarRegistrationToken setPageFormatItemState:](self->_registration, "setPageFormatItemState:", v13);

}

- (void)setSizeUpdater:(id)a3
{
  objc_storeWeak((id *)&self->_sizeUpdater, a3);
}

- (void)setButtonPointerStyleProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SFCapsuleNavigationBar _invalidateHeight](self, "_invalidateHeight");
  }
}

- (void)setHighlightObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (void)prepareForReuse
{
  -[SFCapsuleNavigationBar setItem:](self, "setItem:", 0);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)buttonPointerStyleProvider
{
  return self->_buttonPointerStyleProvider;
}

- (void)setUnclippedContainer:(id)a3
{
  objc_storeWeak((id *)&self->_unclippedContainer, a3);
}

- (void)setSelected:(BOOL)a3
{
  NSArray *leadingButtonConstraints;
  NSArray *trailingButtonConstraints;

  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_leadingButtonConstraints);
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_trailingButtonConstraints);
    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    -[SFCapsuleNavigationBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[SFCapsuleNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimized:(BOOL)a3
{
  id WeakRetained;
  NSArray *leadingButtonConstraints;
  NSArray *trailingButtonConstraints;
  NSArray *textVerticalAlignmentConstraints;
  _SFBarTheme *v9;
  _SFBarTheme *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _SFBarTheme *v16;

  if (self->_isMinimized != a3)
  {
    self->_isMinimized = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationBarMinimizationChanged");

    -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_leadingButtonConstraints);
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_trailingButtonConstraints);
    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_textVerticalAlignmentConstraints);
    textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
    self->_textVerticalAlignmentConstraints = 0;

    -[SFCapsuleNavigationBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[SFCapsuleNavigationBar setNeedsLayout](self, "setNeedsLayout");
    -[SFCapsuleNavigationBar _updateShowsProgressView](self, "_updateShowsProgressView");
    v16 = self->_theme;
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = v16;
      v10 = v9;
      if (a3)
        -[_SFBarTheme tabTitleTheme](v9, "tabTitleTheme");
      else
        -[_SFBarTheme titleTheme](v9, "titleTheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView setTheme:](self->_titleContainer, "setTheme:", v11);

      -[SFUnifiedTabBarItemTitleContainerView theme](self->_titleContainer, "theme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placeholderTextColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](self->_searchIndicatorView, "setTintColor:", v13);

    }
    -[SFCapsuleNavigationBar _updateLabelContents](self, "_updateLabelContents");
    -[SFCapsuleNavigationBar _updateButtonsTransform](self, "_updateButtonsTransform");
    -[SFCapsuleNavigationBarLabelLayoutInfo constraintForHorizontalAlignment](self->_titleLabelLayoutInfo, "constraintForHorizontalAlignment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 0);

    -[SFCapsuleNavigationBarLabelLayoutInfo setConstraintForHorizontalAlignment:](self->_titleLabelLayoutInfo, "setConstraintForHorizontalAlignment:", 0);
    -[SFCapsuleNavigationBarLabelLayoutInfo constraintForHorizontalAlignment](self->_availabilityLabelLayoutInfo, "constraintForHorizontalAlignment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 0);

    -[SFCapsuleNavigationBarLabelLayoutInfo setConstraintForHorizontalAlignment:](self->_availabilityLabelLayoutInfo, "setConstraintForHorizontalAlignment:", 0);
    -[SFCapsuleNavigationBar _updateShowsPrivateAnnotation](self, "_updateShowsPrivateAnnotation");

  }
}

- (void)setMinimizationPercent:(double)a3
{
  if (self->_minimizationPercent != a3)
  {
    self->_minimizationPercent = a3;
    -[SFCapsuleNavigationBar _updateButtonAlphaForMinimizedPercent:](self, "_updateButtonAlphaForMinimizedPercent:");
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)isMinimized
{
  return self->_isMinimized;
}

- (void)_createTrailingButtonConstraints
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  NSArray *trailingButtons;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  NSArray *v37;
  NSArray *trailingButtonConstraints;
  id v39;
  _QWORD v40[4];
  id v41;
  SFCapsuleNavigationBar *v42;
  double v43;
  uint64_t v44;
  double v45;
  BOOL v46;

  v3 = -[SFCapsuleNavigationBar _shouldHideButtons](self, "_shouldHideButtons");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 || !-[NSArray count](self->_trailingButtons, "count"))
  {
    -[SFCapsuleNavigationBar trailingAnchor](self, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_textVerticalAlignmentGuide, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar _titleToEdgeMargin](self, "_titleToEdgeMargin");
    objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v6);

  }
  if (-[NSArray count](self->_trailingButtons, "count"))
  {
    -[SFCapsuleNavigationBar _minimumEdgeMargin](self, "_minimumEdgeMargin");
    v8 = v7;
    v10 = v9;
    -[SFCapsuleNavigationBar _interButtonSpacing](self, "_interButtonSpacing");
    v12 = 0.7;
    if (!self->_isMinimized)
      v12 = 1.0;
    v13 = v11 * v12;
    trailingButtons = self->_trailingButtons;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __58__SFCapsuleNavigationBar__createTrailingButtonConstraints__block_invoke;
    v40[3] = &unk_1E21E2208;
    v15 = v39;
    v41 = v15;
    v42 = self;
    v46 = v3;
    v43 = v8;
    v44 = v10;
    v45 = v13;
    -[NSArray enumerateObjectsUsingBlock:](trailingButtons, "enumerateObjectsUsingBlock:", v40);
    -[NSArray firstObject](self->_trailingButtons, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar trailingAnchor](self, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:constant:", v18, -v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    -[SFCapsuleNavigationBar trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 18.0;
    if (self->_layoutStyle == 1)
      v22 = 22.0;
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1131413504;
    objc_msgSend(v23, "sf_withPriority:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v25);

    if (!v3)
    {
      -[UILayoutGuide trailingAnchor](self->_textVerticalAlignmentGuide, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](self->_trailingButtons, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SFCapsuleNavigationBar _shouldCenterButtonsBetweenEdgeAndTitle:](self, "_shouldCenterButtonsBetweenEdgeAndTitle:", self->_trailingButtons))
      {
        objc_msgSend(v27, "centerXAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = 1131413504;
        objc_msgSend(v29, "sf_withPriority:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v31);

        objc_msgSend(v27, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = v26;
        v35 = v8;
      }
      else
      {
        objc_msgSend(v27, "leadingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCapsuleNavigationBar _titleToButtonSpacing](self, "_titleToButtonSpacing");
        v32 = v33;
        v34 = v26;
      }
      objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v36);

    }
  }
  v37 = (NSArray *)objc_msgSend(v39, "copy");
  trailingButtonConstraints = self->_trailingButtonConstraints;
  self->_trailingButtonConstraints = v37;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_trailingButtonConstraints);
}

- (void)_updateLabelTypesAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  _BOOL8 v7;
  void *v8;
  SFCapsuleNavigationBarLabelLayoutInfo *v9;
  SFURLLabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFCapsuleNavigationBarLabelLayoutInfo *v16;
  uint64_t v17;
  SFCapsuleNavigationBarLabelLayoutInfo *v18;
  void *v19;
  char v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  void *v25;
  char v26;
  _BOOL8 v27;
  char v28;
  SFCapsuleNavigationBarLabelLayoutInfo *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  SFCapsuleNavigationBarLabelLayoutInfo *v39;
  SFCapsuleNavigationBarLabelLayoutInfo *v40;
  SFCapsuleNavigationBar *v41;
  id v42;
  _QWORD v43[4];
  SFCapsuleNavigationBarLabelLayoutInfo *v44;
  SFCapsuleNavigationBar *v45;
  char v46;
  _QWORD v47[5];
  SFCapsuleNavigationBarLabelLayoutInfo *v48;
  id v49;
  _QWORD aBlock[5];
  SFCapsuleNavigationBarLabelLayoutInfo *v51;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
  v6 = WeakRetained;
  v7 = 0;
  if (v3 && WeakRetained)
    v7 = !self->_isForSizing;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_availabilityLabelLayoutInfo;
  if (-[WBSContentAvailabilityDisplayController isDisplaying](self->_availabilityDisplayController, "isDisplaying"))
  {
    v10 = objc_alloc_init(SFURLLabel);
    v11 = (void *)MEMORY[0x1E0DC1350];
    -[SFCapsuleNavigationBar _labelTextStyle](self, "_labelTextStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontForTextStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setFont:](v10, "setFont:", v13);

    -[WBSContentAvailabilityDisplayController currentLabel](self->_availabilityDisplayController, "currentLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setText:](v10, "setText:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setTextColor:](v10, "setTextColor:", v15);

    v16 = -[SFCapsuleNavigationBarLabelLayoutInfo initWithView:]([SFCapsuleNavigationBarLabelLayoutInfo alloc], "initWithView:", v10);
    -[SFCapsuleNavigationBar _initializeLayoutInfo:forPrimaryLabel:addingConstraints:](self, "_initializeLayoutInfo:forPrimaryLabel:addingConstraints:", v16, 0, v8);

  }
  else
  {
    v16 = 0;
  }
  if ((WBSIsEqual() & 1) == 0)
  {
    v36 = v6;
    v37 = v8;
    objc_storeStrong((id *)&self->_availabilityLabelLayoutInfo, v16);
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke;
    aBlock[3] = &unk_1E21E2258;
    aBlock[4] = self;
    v18 = v16;
    v51 = v18;
    v19 = _Block_copy(aBlock);
    v20 = !v7;
    if (!v18)
      v20 = 1;
    v21 = v7;
    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
      objc_msgSend(v37, "removeAllObjects");
      -[SFCapsuleNavigationBar _updateLabelContentsAtIndexes:](self, "_updateLabelContentsAtIndexes:", 0);
      v22 = (void *)MEMORY[0x1E0DC3F10];
      v47[0] = v17;
      v47[1] = 3221225472;
      v47[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_2;
      v47[3] = &unk_1E21E2280;
      v47[4] = self;
      v48 = v18;
      v49 = v19;
      objc_msgSend(v22, "performWithoutAnimation:", v47);

    }
    v35 = v19;
    -[SFUnifiedTabBarItemTitleContainerView titleTextStyle](self->_titleContainer, "titleTextStyle");
    v23 = objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar _updateLabelContents](self, "_updateLabelContents");
    v24 = v21;
    v34 = (void *)v23;
    if (v21)
    {
      -[SFUnifiedTabBarItemTitleContainerView titleTextStyle](self->_titleContainer, "titleTextStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = WBSIsEqual();

      v8 = v37;
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
      v27 = v24;
      v6 = v36;
      if ((v26 & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        -[SFUnifiedTabBarItemTitleContainerView beginTitleTextStyleAnimation](self->_titleContainer, "beginTitleTextStyleAnimation");
        v28 = 1;
      }
      v17 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v8 = v37;
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
      v28 = 0;
      v27 = v24;
      v6 = v36;
    }
    v43[0] = v17;
    v43[1] = 3221225472;
    v43[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_3;
    v43[3] = &unk_1E21E22A8;
    v29 = v9;
    v46 = v28;
    v44 = v29;
    v45 = self;
    v30 = _Block_copy(v43);
    v31 = v17;
    v32 = v30;
    if (v6)
    {
      v38[0] = v31;
      v38[1] = 3221225472;
      v38[2] = __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_4;
      v38[3] = &unk_1E21E22D0;
      v39 = v29;
      v40 = v18;
      v33 = v35;
      v41 = self;
      v42 = v35;
      objc_msgSend(v6, "invalidateHeightForCapsuleContentView:animated:animations:completion:", self, v27, v38, v32);

    }
    else
    {
      (*((void (**)(void *))v30 + 2))(v30);
      v33 = v35;
    }

  }
}

- (void)_updateButtonAlphaForMinimizedPercent:(double)a3
{
  double v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = _SFInterpolate((double)(-[SFCapsuleNavigationBar _shouldHideButtonsForMinimized:](self, "_shouldHideButtonsForMinimized:", 0) ^ 1), (double)(-[SFCapsuleNavigationBar _shouldHideButtonsForMinimized:](self, "_shouldHideButtonsForMinimized:", 1) ^ 1), a3)* self->_nonKeyContentAlpha;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_leadingButtons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "setAlpha:", v4);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_trailingButtons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setAlpha:", v4, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (BOOL)_shouldHideButtonsForMinimized:(BOOL)a3
{
  return !self->_isSelected || a3;
}

- (void)_updateLabelContents
{
  -[SFCapsuleNavigationBar _updateLabelContentsAtIndexes:](self, "_updateLabelContentsAtIndexes:", 0);
}

- (BOOL)_shouldCenterButtonsBetweenEdgeAndTitle:(id)a3
{
  BOOL v4;
  void *v5;
  NSString *v6;

  if ((unint64_t)objc_msgSend(a3, "count") > 1)
    return 0;
  -[SFCapsuleNavigationBar traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) == NSOrderedAscending;
  return v4;
}

- (double)_titleToButtonSpacing
{
  void *v2;
  NSString *v3;
  double v4;

  -[SFCapsuleNavigationBar traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) == NSOrderedAscending)
    v4 = 20.0;
  else
    v4 = 10.0;

  return v4;
}

- (UIView)unclippedContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_unclippedContainer);
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  UILayoutGuide *textVerticalAlignmentGuide;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *textVerticalAlignmentConstraints;
  void (**v25)(void *, SFCapsuleNavigationBarLabelLayoutInfo *);
  _QWORD aBlock[5];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SFCapsuleNavigationBar;
  -[SFCapsuleNavigationBar updateConstraints](&v27, sel_updateConstraints);
  -[SFCapsuleNavigationBar layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_leadingButtonConstraints)
    -[SFCapsuleNavigationBar _createLeadingButtonConstraints](self, "_createLeadingButtonConstraints");
  if (!self->_trailingButtonConstraints)
    -[SFCapsuleNavigationBar _createTrailingButtonConstraints](self, "_createTrailingButtonConstraints");
  if (!self->_textVerticalAlignmentConstraints)
  {
    -[SFCapsuleNavigationBar _titleToEdgeMargin](self, "_titleToEdgeMargin");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_textVerticalAlignmentGuide, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    v10 = -[SFCapsuleNavigationBar _shouldCenterLabels](self, "_shouldCenterLabels");
    textVerticalAlignmentGuide = self->_textVerticalAlignmentGuide;
    if (v10)
    {
      -[UILayoutGuide centerXAnchor](textVerticalAlignmentGuide, "centerXAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleNavigationBar centerXAnchor](self, "centerXAnchor");
    }
    else
    {
      -[UILayoutGuide leadingAnchor](textVerticalAlignmentGuide, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleNavigationBar leadingAnchor](self, "leadingAnchor");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1112276992;
    objc_msgSend(v14, "sf_withPriority:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

    -[UILayoutGuide topAnchor](self->_textVerticalAlignmentGuide, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar topAnchor](self, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v18, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v19);

    -[UILayoutGuide bottomAnchor](self->_textVerticalAlignmentGuide, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar bottomAnchor](self, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:constant:", v21, -v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v22);

    v23 = (NSArray *)objc_msgSend(v6, "copy");
    textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
    self->_textVerticalAlignmentConstraints = v23;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_textVerticalAlignmentConstraints);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SFCapsuleNavigationBar_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E21E21B8;
  aBlock[4] = self;
  v25 = (void (**)(void *, SFCapsuleNavigationBarLabelLayoutInfo *))_Block_copy(aBlock);
  v25[2](v25, self->_titleLabelLayoutInfo);
  if (self->_availabilityLabelLayoutInfo)
    ((void (*)(void (**)(void *, SFCapsuleNavigationBarLabelLayoutInfo *)))v25[2])(v25);
  -[SFCapsuleNavigationBar updateAccessibilityIdentifier](self, "updateAccessibilityIdentifier");

}

- (CGPoint)_titleToEdgeMargin
{
  void *v3;
  NSString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t layoutStyle;
  CGPoint result;

  -[SFCapsuleNavigationBar traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = 8.0;
  v6 = 12.0;
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedAscending)
  {
    layoutStyle = self->_layoutStyle;
    v6 = 18.0;
    if (layoutStyle != 2)
    {
      if (layoutStyle == 1)
        v5 = 4.0;
      else
        v5 = 10.0;
    }
  }

  v7 = v6;
  v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)_shouldCenterLabels
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[SFUnifiedTabBarItemTitleContainerView title](self->_titleContainer, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = !self->_isMinimized && v4 == 0;
  return !v5;
}

void __58__SFCapsuleNavigationBar__createTrailingButtonConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v24 = v5;
  objc_msgSend(v5, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  if (!*(_BYTE *)(a1 + 72))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v24, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v12, *(double *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v24, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -*(double *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

  }
  v18 = v24;
  if (a3)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 704), "objectAtIndexedSubscript:", a3 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, *(double *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v23);

    v18 = v24;
  }

}

void __57__SFCapsuleNavigationBar__createLeadingButtonConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v23 = v5;
  objc_msgSend(v5, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  if (*(_BYTE *)(a1 + 72))
  {
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a3 || !*(_BYTE *)(a1 + 73))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v23, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v12, *(double *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v23, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -*(double *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

    if (a3)
    {
LABEL_7:
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v23, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 488), "objectAtIndexedSubscript:", a3 - 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, *(double *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v22);

    }
  }
LABEL_8:

}

- (void)updateAccessibilityIdentifier
{
  _BOOL4 isSelected;
  const __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  isSelected = self->_isSelected;
  v7 = CFSTR("isSelected");
  if (isSelected)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v6);

}

- (void)_createLeadingButtonConstraints
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char isKindOfClass;
  NSArray *leadingButtons;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
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
  double v37;
  void *v38;
  NSArray *v39;
  NSArray *leadingButtonConstraints;
  id v41;
  _QWORD v42[4];
  id v43;
  SFCapsuleNavigationBar *v44;
  double v45;
  uint64_t v46;
  double v47;
  BOOL v48;
  char v49;

  v3 = -[SFCapsuleNavigationBar _shouldHideButtons](self, "_shouldHideButtons");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 || !-[NSArray count](self->_leadingButtons, "count"))
  {
    -[UILayoutGuide leadingAnchor](self->_textVerticalAlignmentGuide, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar leadingAnchor](self, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar _titleToEdgeMargin](self, "_titleToEdgeMargin");
    objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v6);

  }
  if (-[NSArray count](self->_leadingButtons, "count"))
  {
    -[SFCapsuleNavigationBar _minimumEdgeMargin](self, "_minimumEdgeMargin");
    v8 = v7;
    v10 = v9;
    -[SFCapsuleNavigationBar _interButtonSpacing](self, "_interButtonSpacing");
    v12 = 0.7;
    if (!self->_isMinimized)
      v12 = 1.0;
    v13 = v11 * v12;
    -[NSArray firstObject](self->_leadingButtons, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    leadingButtons = self->_leadingButtons;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __57__SFCapsuleNavigationBar__createLeadingButtonConstraints__block_invoke;
    v42[3] = &unk_1E21E21E0;
    v17 = v41;
    v43 = v17;
    v44 = self;
    v48 = v3;
    v49 = isKindOfClass & 1;
    v45 = v8;
    v46 = v10;
    v47 = v13;
    -[NSArray enumerateObjectsUsingBlock:](leadingButtons, "enumerateObjectsUsingBlock:", v42);
    objc_msgSend(v14, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar leadingAnchor](self, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0.0;
    v21 = 0.0;
    if ((isKindOfClass & 1) == 0)
    {
      v21 = 18.0;
      if (self->_layoutStyle == 1)
        v21 = 22.0;
      v20 = v8;
    }
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1131413504;
    objc_msgSend(v22, "sf_withPriority:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v24);

    objc_msgSend(v14, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar leadingAnchor](self, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v26, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v27);

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v14, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleNavigationBar topAnchor](self, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v30);

      objc_msgSend(v14, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleNavigationBar bottomAnchor](self, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v33);

    }
    if (!v3)
    {
      -[NSArray lastObject](self->_leadingButtons, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_textVerticalAlignmentGuide, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 2.0;
      if ((isKindOfClass & 1) == 0)
        v37 = v8;
      objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v38);

    }
  }
  v39 = (NSArray *)objc_msgSend(v41, "copy");
  leadingButtonConstraints = self->_leadingButtonConstraints;
  self->_leadingButtonConstraints = v39;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_leadingButtonConstraints);
}

- (BOOL)_shouldHideButtons
{
  return -[SFCapsuleNavigationBar _shouldHideButtonsForMinimized:](self, "_shouldHideButtonsForMinimized:", self->_isMinimized);
}

- (void)setTrailingButtons:(id)a3
{
  NSArray *v4;
  NSArray *trailingButtons;
  NSArray *trailingButtonConstraints;
  id v7;

  v7 = a3;
  if (-[SFCapsuleNavigationBar _transitionFromButtons:toButtons:withConstraintsToDeactivate:](self, "_transitionFromButtons:toButtons:withConstraintsToDeactivate:", self->_trailingButtons))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    trailingButtons = self->_trailingButtons;
    self->_trailingButtons = v4;

    trailingButtonConstraints = self->_trailingButtonConstraints;
    self->_trailingButtonConstraints = 0;

    -[SFCapsuleNavigationBar _updateButtonsTransform](self, "_updateButtonsTransform");
  }

}

- (void)setLeadingButtons:(id)a3
{
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  NSArray *v8;
  NSArray *externalLeadingButtons;
  NSArray *leadingButtonConstraints;
  UIView *searchIndicatorView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  v21 = v4;
  if (v4)
    v5 = v4;
  v6 = v5;
  if (-[SFNavigationBarItem showsSearchIndicator](self->_item, "showsSearchIndicator") && !objc_msgSend(v21, "count"))
  {
    searchIndicatorView = self->_searchIndicatorView;
    if (!searchIndicatorView)
    {
      v12 = (void *)MEMORY[0x1E0DC3888];
      -[SFUnifiedTabBarItemTitleContainerView titleTextStyle](self->_titleContainer, "titleTextStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationWithTextStyle:scale:", v13, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v15);
      v17 = self->_searchIndicatorView;
      self->_searchIndicatorView = v16;

      -[SFUnifiedTabBarItemTitleContainerView theme](self->_titleContainer, "theme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "placeholderTextColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](self->_searchIndicatorView, "setTintColor:", v19);

      searchIndicatorView = self->_searchIndicatorView;
    }
    -[UIView arrayByAddingObject:](v6, "arrayByAddingObject:", searchIndicatorView);
    v20 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v6 = (UIView *)v20;
  }
  else
  {
    v7 = self->_searchIndicatorView;
    self->_searchIndicatorView = 0;
  }

  if (-[SFCapsuleNavigationBar _transitionFromButtons:toButtons:withConstraintsToDeactivate:](self, "_transitionFromButtons:toButtons:withConstraintsToDeactivate:", self->_leadingButtons, v6, self->_leadingButtonConstraints))
  {
    v8 = (NSArray *)objc_msgSend(v21, "copy");
    externalLeadingButtons = self->_externalLeadingButtons;
    self->_externalLeadingButtons = v8;

    objc_storeStrong((id *)&self->_leadingButtons, v6);
    leadingButtonConstraints = self->_leadingButtonConstraints;
    self->_leadingButtonConstraints = 0;

    -[SFUnifiedTabBarItemTitleContainerView setShowsSearchIcon:](self->_titleContainer, "setShowsSearchIcon:", -[SFCapsuleNavigationBar _showsSearchIconInTitleContainer](self, "_showsSearchIconInTitleContainer"));
    -[SFCapsuleNavigationBar _updateButtonsTransform](self, "_updateButtonsTransform");
  }

}

- (BOOL)_transitionFromButtons:(id)a3 toButtons:(id)a4 withConstraintsToDeactivate:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  id WeakRetained;
  id v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "isEqualToArray:", v9);
  v12 = v11;
  if ((v11 & 1) == 0)
  {
    v29 = v10;
    v30 = v11;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "removeFromSuperview", v29);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v15);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      v22 = *MEMORY[0x1E0DC48F8];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v24, "setMaximumContentSizeCategory:", v22, v29);
          LODWORD(v25) = 1132920832;
          objc_msgSend(v24, "setContentHuggingPriority:forAxis:", 0, v25);
          LODWORD(v26) = 1145077760;
          objc_msgSend(v24, "setContentCompressionResistancePriority:forAxis:", 0, v26);
          objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[SFCapsuleNavigationBar addSubview:](self, "addSubview:", v24);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    v10 = v29;
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v29);
    -[SFCapsuleNavigationBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
    objc_msgSend(WeakRetained, "invalidateHeightForCapsuleContentView:", self);

    v12 = v30;
  }

  return v12 ^ 1;
}

- (BOOL)_showsSearchIconInTitleContainer
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_externalLeadingButtons, "count");
  if (v3)
    LOBYTE(v3) = -[SFNavigationBarItem showsSearchIndicator](self->_item, "showsSearchIndicator");
  return v3;
}

- (CGPoint)_minimumEdgeMargin
{
  int64_t layoutStyle;
  double v3;
  double v4;
  double v5;
  void *v6;
  NSString *v7;
  double v8;
  double v9;
  CGPoint result;

  layoutStyle = self->_layoutStyle;
  v3 = 13.0;
  if (layoutStyle == 2)
    v4 = 9.0;
  else
    v4 = 13.0;
  if (layoutStyle == 2)
    v5 = 5.0;
  else
    v5 = 11.5;
  -[SFCapsuleNavigationBar traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedAscending)
    v3 = v5;
  else
    v4 = 12.0;

  v8 = v4;
  v9 = v3;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_interButtonSpacing
{
  void *v2;
  NSString *v3;
  double v4;

  -[SFCapsuleNavigationBar traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedAscending)
    v4 = 24.0;
  else
    v4 = 22.0;

  return v4;
}

- (void)_updateButtonsTransform
{
  __int128 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  memset(&v26, 0, sizeof(v26));
  if (self->_isMinimized)
  {
    CGAffineTransformMakeScale(&v26, 0.7, 0.7);
  }
  else
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v26.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v26.c = v3;
    *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_leadingButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v21 = v26;
        objc_msgSend(v9, "setTransform:", &v21);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_trailingButtons;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = v26;
        objc_msgSend(v15, "setTransform:", &v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v12);
  }

}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  SFCapsuleNavigationBar *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFCapsuleNavigationBar initWithFrame:layoutStyle:](self, "initWithFrame:layoutStyle:", objc_msgSend(v8, "preferredCapsuleLayoutStyle"), x, y, width, height);

  return v9;
}

- (id)initForSizingWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFCapsuleNavigationBar initForSizingWithFrame:layoutStyle:](self, "initForSizingWithFrame:layoutStyle:", objc_msgSend(v8, "preferredCapsuleLayoutStyle"), x, y, width, height);

  return v9;
}

- (id)initForSizingWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4
{
  SFCapsuleNavigationBar *v4;
  SFCapsuleNavigationBar *v5;
  SFCapsuleNavigationBar *v6;

  v4 = -[SFCapsuleNavigationBar initWithFrame:layoutStyle:](self, "initWithFrame:layoutStyle:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_isForSizing = 1;
    v6 = v4;
  }

  return v5;
}

- (SFCapsuleNavigationBar)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4
{
  SFCapsuleNavigationBar *v5;
  SFCapsuleNavigationBar *v6;
  _SFFluidProgressView *v7;
  uint64_t v8;
  _SFFluidProgressView *progressView;
  void *v10;
  uint64_t v11;
  NSArray *progressViewConstraints;
  SFUnifiedTabBarItemTitleContainerView *v13;
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  double v15;
  double v16;
  double v17;
  double v18;
  SFCapsuleNavigationBarLabelLayoutInfo *v19;
  SFCapsuleNavigationBarLabelLayoutInfo *titleLabelLayoutInfo;
  UILayoutGuide *v21;
  UILayoutGuide *textVerticalAlignmentGuide;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  PKScribbleInteraction *v41;
  PKScribbleInteraction *scribbleInteraction;
  void *v43;
  uint64_t v44;
  WBSContentAvailabilityDisplayController *availabilityDisplayController;
  void *v46;
  id v47;
  SFCapsuleNavigationBar *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  uint64_t v56;
  _QWORD v57[3];
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)SFCapsuleNavigationBar;
  v5 = -[SFCapsuleNavigationBar initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[SFCapsuleNavigationBar setInsetsLayoutMarginsFromSafeArea:](v5, "setInsetsLayoutMarginsFromSafeArea:", 0);
    v6->_layoutStyle = a4;
    v7 = [_SFFluidProgressView alloc];
    -[SFCapsuleNavigationBar bounds](v6, "bounds");
    v8 = -[_SFFluidProgressView initWithFrame:](v7, "initWithFrame:");
    progressView = v6->_progressView;
    v6->_progressView = (_SFFluidProgressView *)v8;

    -[_SFFluidProgressView setTranslatesAutoresizingMaskIntoConstraints:](v6->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFFluidProgressView setDelegate:](v6->_progressView, "setDelegate:", v6);
    -[_SFFluidProgressView layer](v6->_progressView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZPosition:", 1.0);

    -[SFCapsuleNavigationBar addSubview:](v6, "addSubview:", v6->_progressView);
    objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v6->_progressView, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    progressViewConstraints = v6->_progressViewConstraints;
    v6->_progressViewConstraints = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6->_progressViewConstraints);
    v13 = -[SFUnifiedTabBarItemTitleContainerView initWithAlignment:]([SFUnifiedTabBarItemTitleContainerView alloc], "initWithAlignment:", 1);
    titleContainer = v6->_titleContainer;
    v6->_titleContainer = v13;

    -[SFUnifiedTabBarItemTitleContainerView setTitleToSearchIconSpacing:](v6->_titleContainer, "setTitleToSearchIconSpacing:", 0.0);
    -[SFUnifiedTabBarItemTitleContainerView setCollapsed:](v6->_titleContainer, "setCollapsed:", 0);
    -[SFUnifiedTabBarItemTitleContainerView setUsesInsetFromLayoutMargins:](v6->_titleContainer, "setUsesInsetFromLayoutMargins:", 0);
    -[SFUnifiedTabBarItemTitleContainerView setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFUnifiedTabBarItemTitleContainerView setTitleTextStyle:](v6->_titleContainer, "setTitleTextStyle:", *MEMORY[0x1E0DC4A88]);
    -[SFUnifiedTabBarItemTitleContainerView setAnimateLockViewPosition:](v6->_titleContainer, "setAnimateLockViewPosition:", 1);
    -[SFUnifiedTabBarItemTitleContainerView setAccessibilityIdentifier:](v6->_titleContainer, "setAccessibilityIdentifier:", CFSTR("TabBarItemTitle"));
    LODWORD(v15) = 1131413504;
    -[SFUnifiedTabBarItemTitleContainerView setContentHuggingPriority:forAxis:](v6->_titleContainer, "setContentHuggingPriority:forAxis:", 0, v15);
    LODWORD(v16) = 1144586240;
    -[SFUnifiedTabBarItemTitleContainerView setContentCompressionResistancePriority:forAxis:](v6->_titleContainer, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1131413504;
    -[SFUnifiedTabBarItemTitleContainerView setContentHuggingPriority:forAxis:](v6->_titleContainer, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1144586240;
    -[SFUnifiedTabBarItemTitleContainerView setContentCompressionResistancePriority:forAxis:](v6->_titleContainer, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    -[SFCapsuleNavigationBar addSubview:](v6, "addSubview:", v6->_titleContainer);
    v19 = -[SFCapsuleNavigationBarLabelLayoutInfo initWithView:]([SFCapsuleNavigationBarLabelLayoutInfo alloc], "initWithView:", v6->_titleContainer);
    titleLabelLayoutInfo = v6->_titleLabelLayoutInfo;
    v6->_titleLabelLayoutInfo = v19;

    v21 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    textVerticalAlignmentGuide = v6->_textVerticalAlignmentGuide;
    v6->_textVerticalAlignmentGuide = v21;

    -[UILayoutGuide setIdentifier:](v6->_textVerticalAlignmentGuide, "setIdentifier:", CFSTR("SFCapsuleTextVerticalAlignmentGuide"));
    -[SFCapsuleNavigationBar addLayoutGuide:](v6, "addLayoutGuide:", v6->_textVerticalAlignmentGuide);
    v53 = (void *)MEMORY[0x1E0CB3718];
    -[UILayoutGuide widthAnchor](v6->_textVerticalAlignmentGuide, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1130758144;
    objc_msgSend(v24, "sf_withPriority:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v26;
    -[UILayoutGuide heightAnchor](v6->_textVerticalAlignmentGuide, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1130758144;
    objc_msgSend(v28, "sf_withPriority:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "activateConstraints:", v31);

    v50 = (void *)MEMORY[0x1E0CB3718];
    -[SFUnifiedTabBarItemTitleContainerView leadingAnchor](v6->_titleContainer, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v6->_textVerticalAlignmentGuide, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v51;
    -[SFUnifiedTabBarItemTitleContainerView trailingAnchor](v6->_titleContainer, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v6->_textVerticalAlignmentGuide, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v34;
    -[UILayoutGuide centerXAnchor](v6->_textVerticalAlignmentGuide, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar centerXAnchor](v6, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1132134400;
    objc_msgSend(v37, "sf_withPriority:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v40);

    v41 = (PKScribbleInteraction *)objc_alloc_init(MEMORY[0x1E0CD1210]);
    scribbleInteraction = v6->_scribbleInteraction;
    v6->_scribbleInteraction = v41;

    -[PKScribbleInteraction setDelegate:](v6->_scribbleInteraction, "setDelegate:", v6);
    -[SFCapsuleNavigationBar addInteraction:](v6, "addInteraction:", v6->_scribbleInteraction);
    v6->_nonKeyContentAlpha = 1.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleNavigationBar _initializeLayoutInfo:forPrimaryLabel:addingConstraints:](v6, "_initializeLayoutInfo:forPrimaryLabel:addingConstraints:", v6->_titleLabelLayoutInfo, 1, v43);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A870]), "initWithPresenter:", v6);
    availabilityDisplayController = v6->_availabilityDisplayController;
    v6->_availabilityDisplayController = (WBSContentAvailabilityDisplayController *)v44;

    v56 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id)-[SFCapsuleNavigationBar registerForTraitChanges:withTarget:action:](v6, "registerForTraitChanges:withTarget:action:", v46, v6, sel__invalidateHeight);

    v48 = v6;
  }

  return v6;
}

- (void)_updateSecurityAnnotation
{
  void *v3;

  -[SFCapsuleNavigationBar _labelTextStyle](self, "_labelTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView setTitleTextStyle:](self->_titleContainer, "setTitleTextStyle:", v3);

  -[SFUnifiedTabBarItemTitleContainerView setHasFocusedSensitiveInputField:](self->_titleContainer, "setHasFocusedSensitiveInputField:", -[SFNavigationBarItem hasFocusedSensitiveFieldOnCurrentPage](self->_item, "hasFocusedSensitiveFieldOnCurrentPage"));
  -[SFUnifiedTabBarItemTitleContainerView setSecurityAnnotation:](self->_titleContainer, "setSecurityAnnotation:", -[SFNavigationBarItem securityAnnotation](self->_item, "securityAnnotation"));
}

- (id)_horizontalAlignmentConstraintForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v4 = a3;
  if (-[SFCapsuleNavigationBar _shouldCenterLabels](self, "_shouldCenterLabels"))
  {
    objc_msgSend(v4, "centerXAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFCapsuleNavigationBar centerXAnchor](self, "centerXAnchor");
  }
  else
  {
    objc_msgSend(v4, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide leadingAnchor](self->_textVerticalAlignmentGuide, "leadingAnchor");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1112014848;
  objc_msgSend(v7, "sf_withPriority:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setTheme:(id)a3
{
  _SFBarTheme *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = self->_theme;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "titleTheme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView setTheme:](self->_titleContainer, "setTheme:", v6);

    }
    -[SFCapsuleNavigationBar traitOverrides](self, "traitOverrides");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNSIntegerValue:forTrait:", objc_msgSend(v8, "tintStyle"), objc_opt_class());

    -[SFCapsuleNavigationBar _updateShowsPrivateAnnotation](self, "_updateShowsPrivateAnnotation");
    -[SFCapsuleNavigationBar _updateProgressViewFillColor](self, "_updateProgressViewFillColor");
    -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", self->_item, 0);
  }

}

- (void)_updateShowsPrivateAnnotation
{
  uint64_t v3;

  if (self->_isMinimized)
    v3 = _SFIsPrivateTintStyle(-[_SFBarTheme tintStyle](self->_theme, "tintStyle"));
  else
    v3 = 0;
  -[SFUnifiedTabBarItemTitleContainerView setShowsPrivateAnnotation:](self->_titleContainer, "setShowsPrivateAnnotation:", v3);
}

- (void)_updateProgressViewFillColor
{
  _BOOL4 isMinimized;
  _SFBarTheme *theme;
  void *v5;
  _SFBarTheme *v6;
  int v7;
  void *v8;
  id v9;

  isMinimized = self->_isMinimized;
  theme = self->_theme;
  if (isMinimized)
    -[_SFBarTheme controlsTintColor](theme, "controlsTintColor");
  else
    -[_SFBarTheme platterProgressBarTintColor](theme, "platterProgressBarTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFluidProgressView setProgressBarFillColor:](self->_progressView, "setProgressBarFillColor:", v5);

  v6 = self->_theme;
  if (v6 && !self->_isMinimized && _SFIsPrivateTintStyle(-[_SFBarTheme tintStyle](v6, "tintStyle")))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C80]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  -[_SFFluidProgressView layer](self->_progressView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v9);

  if (v7)
}

- (void)navigationBarItemDidUpdateShowsExtensionsAvailability:(id)a3
{
  id v4;

  v4 = a3;
  -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 1);
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", v4, 0);

}

- (void)prepareForSizingNavigationBar:(id)a3
{
  void *v4;

  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setItem:](self, "setItem:", v4);

  -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 0);
}

- (SFNavigationBarItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  SFNavigationBarItem *v5;
  SFNavigationBarItem **p_item;
  SFNavigationBarItem *item;
  void *v8;
  _SFFluidProgressView *progressView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  SFNavigationBarItem *v16;

  v5 = (SFNavigationBarItem *)a3;
  p_item = &self->_item;
  item = self->_item;
  v16 = v5;
  if (item != v5)
  {
    -[SFNavigationBarItem removeObserver:](item, "removeObserver:", self);
    -[SFNavigationBarItem fluidProgressController](*p_item, "fluidProgressController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterObserver:", self->_progressView);

    objc_storeStrong((id *)&self->_item, a3);
    -[SFNavigationBarItem addObserver:](*p_item, "addObserver:", self);
    progressView = self->_progressView;
    -[SFNavigationBarItem fluidProgressStateSource](*p_item, "fluidProgressStateSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "progressState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFluidProgressView setProgressToCurrentPositionForState:](progressView, "setProgressToCurrentPositionForState:", v11);

    -[SFNavigationBarItem fluidProgressController](*p_item, "fluidProgressController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerObserver:", self->_progressView);

    -[SFNavigationBarItem text](v16, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemTitleContainerView setTitle:](self->_titleContainer, "setTitle:", v13);

    -[SFUnifiedTabBarItemTitleContainerView setShowsSearchIcon:](self->_titleContainer, "setShowsSearchIcon:", -[SFCapsuleNavigationBar _showsSearchIconInTitleContainer](self, "_showsSearchIconInTitleContainer"));
    -[SFCapsuleNavigationBar setLeadingButtons:](self, "setLeadingButtons:", self->_externalLeadingButtons);
    -[SFUnifiedTabBarItemTitleContainerView setShowsLockIcon:](self->_titleContainer, "setShowsLockIcon:", -[SFNavigationBarItem showsLockIcon](v16, "showsLockIcon"));
    -[SFCapsuleNavigationBar _updateSecurityAnnotation](self, "_updateSecurityAnnotation");
    -[WBSContentAvailabilityDisplayController resetDisplay](self->_availabilityDisplayController, "resetDisplay");
    -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 0);
    -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", v16, 0);
    -[SFCapsuleNavigationBar _updateTitleContainerAlpha](self, "_updateTitleContainerAlpha");
    -[SFCapsuleNavigationBar _updateShowsProgressView](self, "_updateShowsProgressView");
    -[_SFBarRegistrationToken updateBarAnimated:](self->_registration, "updateBarAnimated:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
    objc_msgSend(WeakRetained, "invalidateHeightForCapsuleContentView:", self);

    -[SFCapsuleNavigationBar navigationBarItemDidUpdateShowsExtensionsAvailability:](self, "navigationBarItemDidUpdateShowsExtensionsAvailability:", v16);
    -[SFCapsuleNavigationBar _updateEntityAnnotation](self, "_updateEntityAnnotation");
    -[SFNavigationBarItem overlayNarrowConfiguration](*p_item, "overlayNarrowConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[SFCapsuleNavigationBar navigationBarItemDidUpdateOverlayNarrowConfiguration:](self, "navigationBarItemDidUpdateOverlayNarrowConfiguration:", *p_item);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleNavigationBar;
  -[SFCapsuleNavigationBar layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_deferButtonAlphaUpdatesDuringLayout)
    -[SFCapsuleNavigationBar _updateButtonAlphaForMinimizedPercent:](self, "_updateButtonAlphaForMinimizedPercent:", self->_minimizationPercent);
  -[SFCapsuleNavigationBar _updateShowsProgressView](self, "_updateShowsProgressView");
  -[SFCapsuleNavigationBar _updatePlaceholderText](self, "_updatePlaceholderText");
}

- (void)_updatePlaceholderText
{
  void *v2;
  CGFloat Width;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  CGRect v16;

  v15[1] = *MEMORY[0x1E0C80C00];
  -[SFUnifiedTabBarItemTitleContainerView bounds](self->_titleContainer, "bounds");
  Width = CGRectGetWidth(v16);
  if (Width != self->_lastTitleContainerWidth)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v14 = *MEMORY[0x1E0DC1138];
    -[SFUnifiedTabBarItemTitleContainerView placeholderFont](self->_titleContainer, "placeholderFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0DC1350];
      -[SFUnifiedTabBarItemTitleContainerView titleTextStyle](self->_titleContainer, "titleTextStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredFontForTextStyle:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v10);

    if (!v7)
    {

    }
    objc_msgSend(v11, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
    if (v12 <= Width)
    {
      -[SFUnifiedTabBarItemTitleContainerView setPlaceholder:](self->_titleContainer, "setPlaceholder:", v5);
    }
    else
    {
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView setPlaceholder:](self->_titleContainer, "setPlaceholder:", v13);

    }
    self->_lastTitleContainerWidth = Width;

  }
}

- (void)_updateShowsProgressView
{
  _BOOL8 v3;

  v3 = !self->_isSelected
    || !-[_SFFluidProgressView isShowingProgress](self->_progressView, "isShowingProgress")
    || self->_minimizationPercent > 0.0;
  -[_SFFluidProgressView setHidden:](self->_progressView, "setHidden:", v3);
}

- (void)_updateTitleContainerAlpha
{
  double v3;

  v3 = 0.0;
  if (!self->_availabilityLabelLayoutInfo)
    v3 = (double)(-[SFCapsuleNavigationBar _hidesTitle](self, "_hidesTitle", 0.0) ^ 1);
  -[SFUnifiedTabBarItemTitleContainerView setAlpha:](self->_titleContainer, "setAlpha:", v3);
}

- (BOOL)_hidesTitle
{
  return self->_hidesTitle;
}

- (void)setIsMinimized:(BOOL)a3
{
  self->_isMinimized = a3;
}

- (PKScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
  objc_storeStrong((id *)&self->_registration, a3);
}

- (SFCapsuleNavigationBar)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleNavigationBar;
  return -[SFCapsuleNavigationBar initWithCoder:](&v4, sel_initWithCoder_, a3);
}

void __43__SFCapsuleNavigationBar_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "constraintForHorizontalAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v8, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_horizontalAlignmentConstraintForLabel:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstraintForHorizontalAlignment:", v6);

    objc_msgSend(v8, "constraintForHorizontalAlignment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

  }
}

- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4
{
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  BOOL v11;

  if (a3)
    v5 = 0.0;
  else
    v5 = 0.67;
  self->_deferButtonAlphaUpdatesDuringLayout = 1;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke;
  v10[3] = &unk_1E21E2230;
  v10[4] = self;
  v11 = a3;
  v7 = a4;
  objc_msgSend(v7, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, v5, 0.33);
  -[SFUnifiedTabBarItemTitleContainerView beginTitleTextStyleAnimation](self->_titleContainer, "beginTitleTextStyleAnimation");
  -[SFCapsuleNavigationBarLabelLayoutInfo view](self->_availabilityLabelLayoutInfo, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginTextSizeAnimation");

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke_2;
  v9[3] = &unk_1E21E2050;
  v9[4] = self;
  objc_msgSend(v7, "addCompletion:", v9);

}

uint64_t __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "_updateButtonAlphaForMinimizedPercent:", (double)*(unint64_t *)&a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 569) = 0;
  return result;
}

void __60__SFCapsuleNavigationBar_willChangeToMinimized_coordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "endTitleTextStyleAnimation");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTextSizeAnimation");

}

- (void)_invalidateHeight
{
  NSArray *leadingButtonConstraints;
  NSArray *trailingButtonConstraints;
  NSArray *textVerticalAlignmentConstraints;
  void *v6;
  void *v7;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_leadingButtonConstraints);
  leadingButtonConstraints = self->_leadingButtonConstraints;
  self->_leadingButtonConstraints = 0;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_trailingButtonConstraints);
  trailingButtonConstraints = self->_trailingButtonConstraints;
  self->_trailingButtonConstraints = 0;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_textVerticalAlignmentConstraints);
  textVerticalAlignmentConstraints = self->_textVerticalAlignmentConstraints;
  self->_textVerticalAlignmentConstraints = 0;

  -[SFCapsuleNavigationBarLabelLayoutInfo constraintForHorizontalAlignment](self->_titleLabelLayoutInfo, "constraintForHorizontalAlignment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[SFCapsuleNavigationBarLabelLayoutInfo setConstraintForHorizontalAlignment:](self->_titleLabelLayoutInfo, "setConstraintForHorizontalAlignment:", 0);
  -[SFCapsuleNavigationBarLabelLayoutInfo constraintForHorizontalAlignment](self->_availabilityLabelLayoutInfo, "constraintForHorizontalAlignment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  -[SFCapsuleNavigationBarLabelLayoutInfo setConstraintForHorizontalAlignment:](self->_availabilityLabelLayoutInfo, "setConstraintForHorizontalAlignment:", 0);
  -[SFCapsuleNavigationBar setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[SFCapsuleNavigationBar setNeedsLayout](self, "setNeedsLayout");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sizeUpdater);
  objc_msgSend(WeakRetained, "invalidateHeightForCapsuleContentView:", self);

  -[_SFBarRegistrationToken updateBarAnimated:](self->_registration, "updateBarAnimated:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  void (**highlightObserver)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCapsuleNavigationBar;
  -[SFCapsuleNavigationBar setHighlighted:](&v5, sel_setHighlighted_, a3);
  highlightObserver = (void (**)(void))self->_highlightObserver;
  if (highlightObserver)
    highlightObserver[2]();
}

- (CGRect)keyContentRect
{
  double v3;
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
  double v15;
  double v16;
  CGRect result;

  -[SFUnifiedTabBarItemTitleContainerView titleRect](self->_titleContainer, "titleRect");
  v4 = v3;
  v6 = v5;
  -[UIView ss_untransformedFrame](self->_titleContainer, "ss_untransformedFrame");
  v8 = v4 + v7;
  v10 = v6 + v9;
  -[SFUnifiedTabBarItemTitleContainerView urlSize](self->_titleContainer, "urlSize");
  v12 = v11;
  v14 = v13;
  v15 = v8;
  v16 = v10;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setKeyContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_keyContentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  p_keyContentTransform = &self->_keyContentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_keyContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_keyContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_keyContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_keyContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_keyContentTransform->tx = v9;
    *(_OWORD *)&p_keyContentTransform->a = v8;
    v10 = *(_OWORD *)&a3->c;
    v11[0] = *(_OWORD *)&a3->a;
    v11[1] = v10;
    v11[2] = *(_OWORD *)&a3->tx;
    -[SFUnifiedTabBarItemTitleContainerView setTransform:](self->_titleContainer, "setTransform:", v11);
  }
}

- (void)setNonKeyContentAlpha:(double)a3
{
  if (self->_nonKeyContentAlpha != a3)
  {
    self->_nonKeyContentAlpha = a3;
    -[SFCapsuleNavigationBar _updateButtonAlphaForMinimizedPercent:](self, "_updateButtonAlphaForMinimizedPercent:", self->_minimizationPercent);
  }
}

- (double)keyContentBaselineBottomInset
{
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  double v3;
  double result;

  titleContainer = self->_titleContainer;
  -[SFUnifiedTabBarItemTitleContainerView urlSize](titleContainer, "urlSize");
  -[SFUnifiedTabBarItemTitleContainerView urlBaselineToBottomBoundsDistanceForHeight:](titleContainer, "urlBaselineToBottomBoundsDistanceForHeight:", v3);
  return result;
}

- (double)keyContentCapHeightTopInset
{
  SFUnifiedTabBarItemTitleContainerView *titleContainer;
  double v3;
  double result;

  titleContainer = self->_titleContainer;
  -[SFUnifiedTabBarItemTitleContainerView urlSize](titleContainer, "urlSize");
  -[SFUnifiedTabBarItemTitleContainerView urlCapHeightToTopBoundsDistanceForHeight:](titleContainer, "urlCapHeightToTopBoundsDistanceForHeight:", v3);
  return result;
}

- (NSNumber)microphoneContentOriginX
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGRect v8;

  -[_SFBarRegistrationToken microphoneButton](self->_registration, "microphoneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isDescendantOfView:", self))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "frame");
    -[SFCapsuleNavigationBar convertRect:fromView:](self, "convertRect:fromView:", v4);
    objc_msgSend(v5, "numberWithDouble:", CGRectGetMinX(v8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setMicrophoneContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_microphoneContentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform t2;
  CGAffineTransform t1;

  p_microphoneContentTransform = &self->_microphoneContentTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_microphoneContentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_microphoneContentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_microphoneContentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_microphoneContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_microphoneContentTransform->tx = v9;
    *(_OWORD *)&p_microphoneContentTransform->a = v8;
    v10 = *(_OWORD *)&a3->c;
    v13 = *(_OWORD *)&a3->a;
    v14 = v10;
    v15 = *(_OWORD *)&a3->tx;
    -[_SFBarRegistrationToken microphoneButton](self->_registration, "microphoneButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    objc_msgSend(v11, "setTransform:", v12);

  }
}

- (CGSize)urlSize
{
  double v2;
  double v3;
  CGSize result;

  -[SFUnifiedTabBarItemTitleContainerView urlSize](self->_titleContainer, "urlSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)leadingButtons
{
  return self->_externalLeadingButtons;
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke(uint64_t a1)
{
  unsigned int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hidesTitle") ^ 1;
  if (*(_QWORD *)(a1 + 40))
    v2 = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", (double)v2);
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "endTitleTextStyleAnimation");
}

uint64_t __52__SFCapsuleNavigationBar__updateLabelTypesAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

- (void)_initializeLayoutInfo:(id)a3 forPrimaryLabel:(BOOL)a4 addingConstraints:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
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
  id v29;

  v29 = a3;
  v8 = a5;
  if (!a4)
  {
    objc_msgSend(v29, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("TabBarItemSubtitle"));
    objc_msgSend(v9, "setFadeOutEdge:", 1);
    LODWORD(v10) = 1131413504;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v10);
    LODWORD(v11) = 1144586240;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    -[SFCapsuleNavigationBar addSubview:](self, "addSubview:", v9);

  }
  objc_msgSend(v29, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_textVerticalAlignmentGuide, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v15);

  objc_msgSend(v12, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_textVerticalAlignmentGuide, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v18);

  -[SFCapsuleNavigationBar _horizontalAlignmentConstraintForLabel:](self, "_horizontalAlignmentConstraintForLabel:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstraintForHorizontalAlignment:", v19);

  objc_msgSend(v29, "constraintForHorizontalAlignment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v20);

  if (-[NSArray count](self->_leadingButtons, "count"))
  {
    objc_msgSend(v12, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray lastObject](self->_leadingButtons, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v24);

  }
  if (-[NSArray count](self->_trailingButtons, "count"))
  {
    objc_msgSend(v12, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_trailingButtons, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v28);

  }
}

- (id)_labelTextStyle
{
  id *v2;

  if (self->_isMinimized)
    v2 = (id *)MEMORY[0x1E0DC4A98];
  else
    v2 = (id *)MEMORY[0x1E0DC4A88];
  return *v2;
}

- (BOOL)_showsReaderAvailabilityText
{
  return -[SFNavigationBarItem showsReaderAvailabilityTextForStyle:](self->_item, "showsReaderAvailabilityTextForStyle:", 1);
}

- (BOOL)_showsTranslationAvailabilityText
{
  return -[SFNavigationBarItem showsTranslationAvailabilityTextForStyle:](self->_item, "showsTranslationAvailabilityTextForStyle:", 1);
}

- (void)_setHidesTitle:(BOOL)a3
{
  if (self->_hidesTitle != a3)
  {
    self->_hidesTitle = a3;
    -[SFCapsuleNavigationBar _updateTitleContainerAlpha](self, "_updateTitleContainerAlpha");
  }
}

- (void)navigationBarItemDidUpdateText:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView setTitle:](self->_titleContainer, "setTitle:", v4);

}

- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setShowsSearchIcon:](self->_titleContainer, "setShowsSearchIcon:", -[SFCapsuleNavigationBar _showsSearchIconInTitleContainer](self, "_showsSearchIconInTitleContainer", a3));
}

- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3
{
  -[SFUnifiedTabBarItemTitleContainerView setShowsLockIcon:](self->_titleContainer, "setShowsLockIcon:", objc_msgSend(a3, "showsLockIcon"));
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 1);
  -[SFCapsuleNavigationBar _updateSecurityAnnotation](self, "_updateSecurityAnnotation");
}

- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[WBSContentAvailabilityDisplayController resetDisplay](self->_availabilityDisplayController, "resetDisplay");
  -[WBSContentAvailabilityDisplayController updateToContentOptions:](self->_availabilityDisplayController, "updateToContentOptions:", objc_msgSend(v6, "contentOptions"));

}

- (void)navigationBarItemDidUpdateNeedsExtensionBadge:(id)a3
{
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", a3, 0);
}

- (void)navigationBarItemDidUpdateMediaStateIcon:(id)a3
{
  id v4;

  v4 = a3;
  -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 1);
  -[SFCapsuleNavigationBar _updateLabelContents](self, "_updateLabelContents");
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", v4, 0);

}

- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3
{
  -[SFCapsuleNavigationBar setNeedsLayout](self, "setNeedsLayout", a3);
  -[_SFBarRegistrationToken updateBarAnimated:](self->_registration, "updateBarAnimated:", 1);
}

- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3
{
  -[_SFBarRegistrationToken updateBarAnimated:](self->_registration, "updateBarAnimated:", 1);
}

- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3
{
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", a3, 0);
}

- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3
{
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", a3, 0);
}

- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3
{
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", a3, 0);
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", a3, 0);
}

- (void)navigationBarItemDidUpdateOverlayNarrowConfiguration:(id)a3
{
  uint64_t v4;
  SFURLFieldOverlayView *overlayView;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SFURLFieldOverlayView *v10;
  SFURLFieldOverlayView *v11;
  SFURLFieldOverlayView *v12;
  void *v13;
  SFURLFieldOverlayView *v14;
  id v15;

  objc_msgSend(a3, "overlayNarrowConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  overlayView = self->_overlayView;
  v15 = (id)v4;
  if (v4)
  {
    if (!overlayView)
      goto LABEL_5;
    -[SFURLFieldOverlayView configuration](overlayView, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    overlayView = self->_overlayView;
    if (v9)
    {
      -[SFURLFieldOverlayView setConfiguration:](overlayView, "setConfiguration:", v15);
    }
    else
    {
LABEL_5:
      -[SFURLFieldOverlayView dismissAndRemove](overlayView, "dismissAndRemove");
      v10 = [SFURLFieldOverlayView alloc];
      -[SFCapsuleNavigationBar bounds](self, "bounds");
      v11 = -[SFURLFieldOverlayView initWithFrame:configuration:](v10, "initWithFrame:configuration:", v15);
      v12 = self->_overlayView;
      self->_overlayView = v11;

      -[SFURLFieldOverlayView setAutoresizingMask:](self->_overlayView, "setAutoresizingMask:", 18);
      -[SFURLFieldOverlayView _setContinuousCornerRadius:](self->_overlayView, "_setContinuousCornerRadius:", 12.0);
      -[SFCapsuleNavigationBar addSubview:](self, "addSubview:", self->_overlayView);
      -[SFURLFieldOverlayView layer](self->_overlayView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setZPosition:", 1.79769313e308);

      -[SFURLFieldOverlayView present](self->_overlayView, "present");
    }
  }
  else
  {
    -[SFURLFieldOverlayView dismissAndRemove](overlayView, "dismissAndRemove");
    v14 = self->_overlayView;
    self->_overlayView = 0;

  }
}

- (void)navigationBarItemDidUpdateFluidProgressController:(id)a3
{
  id v4;

  objc_msgSend(a3, "fluidProgressController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self->_progressView);

}

- (void)navigationBarItem:(id)a3 didUpdateTabEntityWithUUID:(id)a4
{
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, a4);
  -[SFCapsuleNavigationBar _updateEntityAnnotation](self, "_updateEntityAnnotation");
}

- (void)_updateEntityAnnotation
{
  NSUUID *cachedUUIDForAnnotation;

  cachedUUIDForAnnotation = self->_cachedUUIDForAnnotation;
  if (cachedUUIDForAnnotation)
    -[UIView safari_annotateWithTabUUID:isActive:](self, "safari_annotateWithTabUUID:isActive:", cachedUUIDForAnnotation, self->_isSelected);
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  void (**v17)(_QWORD);
  void (**v18)(_QWORD);
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = a5;
  v17 = (void (**)(_QWORD))a7;
  v18 = (void (**)(_QWORD))a8;
  if (a6 == 11)
    v19 = 5;
  else
    v19 = a6;
  -[_SFBarRegistrationToken viewForBarItem:](self->_registration, "viewForBarItem:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(v20, "bounds");
    objc_msgSend(v22, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, 1, v27, v21, v17, v18, x, y, width, height, v23, v24, v25, v26);
  }
  else
  {
    if (v17)
      v17[2](v17);
    if (v18)
      v18[2](v18);
  }

}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  return (id)-[_SFBarRegistrationToken popoverSourceInfoForItem:](self->_registration, "popoverSourceInfoForItem:", a3);
}

- (UITextField)textField
{
  return 0;
}

- (NSArray)popoverPassthroughViews
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[SFCapsuleNavigationBar bounds](self, "bounds");
  -[SFCapsuleNavigationBar convertRect:toView:](self, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  return (_SFPopoverSourceInfo *)-[SFCapsuleNavigationBar popoverSourceInfoForBarItem:](self, "popoverSourceInfoForBarItem:", 13);
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  return 0;
}

- (BOOL)_scribbleInteractionIsEnabled:(id)a3
{
  return !self->_isMinimized;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  void *v4;
  char isKindOfClass;

  -[SFCapsuleNavigationBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  -[SFCapsuleNavigationBar _setHidesTitle:](self, "_setHidesTitle:", 1, a4);
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  -[SFCapsuleNavigationBar _setHidesTitle:](self, "_setHidesTitle:", 0, a4);
}

- (void)availabilityDisplayController:(id)a3 didUpdateWithState:(int64_t)a4
{
  id v6;
  int v7;
  SFNavigationBarItem *item;

  v6 = a3;
  -[SFCapsuleNavigationBar _updateLabelTypesAnimated:](self, "_updateLabelTypesAnimated:", 1);
  v7 = objc_msgSend(v6, "isDisplaying");

  if (v7)
    item = self->_item;
  else
    item = 0;
  -[SFCapsuleNavigationBar _updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:](self, "_updatePageFormatButtonForNavigationBarItem:shouldResetDiscovery:", item, a4 == 0);
}

- (id)availabilityDisplayController:(id)a3 determineBestLabelsForPresentation:(id)a4
{
  id v5;
  SFCapsuleNavigationBarLabelLayoutInfo *v6;
  SFURLLabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SFURLLabel *v13;
  SFCapsuleNavigationBarLabelLayoutInfo *v14;
  SFCapsuleNavigationBarLabelLayoutInfo *availabilityLabelLayoutInfo;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  SFCapsuleNavigationBarLabelLayoutInfo *v26;
  void *v27;
  _QWORD v28[4];
  SFURLLabel *v29;
  SFCapsuleNavigationBar *v30;
  SFCapsuleNavigationBarLabelLayoutInfo *v31;

  v5 = a4;
  v6 = self->_availabilityLabelLayoutInfo;
  v7 = objc_alloc_init(SFURLLabel);
  v8 = (void *)MEMORY[0x1E0DC1350];
  -[SFCapsuleNavigationBar _labelTextStyle](self, "_labelTextStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontForTextStyle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setFont:](v7, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setTextColor:](v7, "setTextColor:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__SFCapsuleNavigationBar_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke;
  v28[3] = &unk_1E21E22F8;
  v13 = v7;
  v29 = v13;
  v30 = self;
  v26 = v6;
  v27 = v12;
  v31 = v26;
  objc_msgSend(v12, "setHandler:", v28);
  v14 = -[SFCapsuleNavigationBarLabelLayoutInfo initWithView:]([SFCapsuleNavigationBarLabelLayoutInfo alloc], "initWithView:", v13);
  availabilityLabelLayoutInfo = self->_availabilityLabelLayoutInfo;
  self->_availabilityLabelLayoutInfo = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar _initializeLayoutInfo:forPrimaryLabel:addingConstraints:](self, "_initializeLayoutInfo:forPrimaryLabel:addingConstraints:", self->_availabilityLabelLayoutInfo, 0, v16);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  v17 = objc_msgSend(v5, "count");
  v18 = v17 - 1;
  if (v17 == 1)
  {
LABEL_9:
    objc_msgSend(v5, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      if (!v21)
        break;
      v22 = v21;
      v23 = 0;
      while (1)
      {
        objc_msgSend(v20, "textForOptionsAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFURLLabel setText:](v13, "setText:", v24);

        -[SFCapsuleNavigationBar setNeedsLayout](self, "setNeedsLayout");
        -[SFCapsuleNavigationBar layoutIfNeeded](self, "layoutIfNeeded");
        if (-[SFURLLabel needsMasking](v13, "needsMasking"))
          break;
        if (v22 == ++v23)
          goto LABEL_10;
      }

      if (++v19 == v18)
        goto LABEL_9;
    }
  }
LABEL_10:

  return v20;
}

void __91__SFCapsuleNavigationBar_availabilityDisplayController_determineBestLabelsForPresentation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 608), *(id *)(a1 + 48));
}

- (id)highlightObserver
{
  return self->_highlightObserver;
}

- (CGAffineTransform)keyContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].a;
  return self;
}

- (CGAffineTransform)microphoneContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[16].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[16].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[17].a;
  return self;
}

- (double)minimizationPercent
{
  return self->_minimizationPercent;
}

- (double)nonKeyContentAlpha
{
  return self->_nonKeyContentAlpha;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (SFCapsuleContentViewSizeUpdating)sizeUpdater
{
  return (SFCapsuleContentViewSizeUpdating *)objc_loadWeakRetained((id *)&self->_sizeUpdater);
}

- (NSArray)trailingButtons
{
  return self->_trailingButtons;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)showingTransientLabel
{
  return self->_showingTransientLabel;
}

- (_SFNavigationBarDelegateCommon)delegate
{
  return (_SFNavigationBarDelegateCommon *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingButtons, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_sizeUpdater);
  objc_destroyWeak((id *)&self->_unclippedContainer);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong(&self->_highlightObserver, 0);
  objc_storeStrong(&self->_buttonPointerStyleProvider, 0);
  objc_storeStrong((id *)&self->_cachedUUIDForAnnotation, 0);
  objc_storeStrong((id *)&self->_availabilityDisplayController, 0);
  objc_storeStrong((id *)&self->_availabilityLabelLayoutInfo, 0);
  objc_storeStrong((id *)&self->_titleLabelLayoutInfo, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_progressViewConstraints, 0);
  objc_storeStrong((id *)&self->_debugObservation, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_textVerticalAlignmentGuide, 0);
  objc_storeStrong((id *)&self->_textVerticalAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_buttonSpacingGuides, 0);
  objc_storeStrong((id *)&self->_trailingButtonConstraints, 0);
  objc_storeStrong((id *)&self->_leadingButtonConstraints, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_searchIndicatorView, 0);
  objc_storeStrong((id *)&self->_leadingButtons, 0);
  objc_storeStrong((id *)&self->_externalLeadingButtons, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
}

@end
