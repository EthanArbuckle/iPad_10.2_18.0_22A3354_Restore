@implementation HKDisplayTypeSectionedContextView

- (HKDisplayTypeSectionedContextView)initWithStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  HKDisplayTypeSectionedContextView *v8;
  HKDisplayTypeSectionedContextView *v9;
  int64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *collectionViewLayoutCache;
  uint64_t v13;
  UICollectionViewLayout *collectionViewLayout;
  uint64_t v15;
  UICollectionView *collectionView;
  void *v17;
  UICollectionView *v18;
  uint64_t v19;
  void *v20;
  UICollectionView *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  UICollectionView *v25;
  uint64_t v26;
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
  uint64_t v37;
  NSLayoutConstraint *collectionViewHeightConstraint;
  uint64_t v39;
  NSIndexPath *lastSelectedIndex;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int64_t v49;
  objc_super v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HKDisplayTypeSectionedContextView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[HKDisplayTypeSectionedContextView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v10 = a3;
    v49 = a3;
    v8->_bottomInsetsEnabled = 0;
    v8->_horizontalInsetsEnabled = 0;
    v8->_topInsetsWithNoHeaderEnabled = 1;
    v8->_contentViewTopInset = 0.0;
    v8->_sizingCellEstimatedHeight = -1.0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    collectionViewLayoutCache = v9->_collectionViewLayoutCache;
    v9->_collectionViewLayoutCache = v11;

    -[HKDisplayTypeSectionedContextView _buildCollectionViewLayoutWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:](v9, "_buildCollectionViewLayoutWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:", v9->_bottomInsetsEnabled, v9->_horizontalInsetsEnabled, v9->_topInsetsWithNoHeaderEnabled);
    v13 = objc_claimAutoreleasedReturnValue();
    collectionViewLayout = v9->_collectionViewLayout;
    v9->_collectionViewLayout = (UICollectionViewLayout *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v9->_collectionViewLayout, v4, v5, v6, v7);
    collectionView = v9->_collectionView;
    v9->_collectionView = (UICollectionView *)v15;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v9->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v9->_collectionView, "setBackgroundColor:", v17);

    -[UICollectionView setDelegate:](v9->_collectionView, "setDelegate:", v9);
    -[UICollectionView setDataSource:](v9->_collectionView, "setDataSource:", v9);
    -[UICollectionView setAllowsSelection:](v9->_collectionView, "setAllowsSelection:", 1);
    -[UICollectionView setAllowsMultipleSelection:](v9->_collectionView, "setAllowsMultipleSelection:", 1);
    -[UICollectionView setScrollEnabled:](v9->_collectionView, "setScrollEnabled:", v10 == 3);
    -[UICollectionView setAlwaysBounceVertical:](v9->_collectionView, "setAlwaysBounceVertical:", 1);
    -[HKDisplayTypeSectionedContextView addSubview:](v9, "addSubview:", v9->_collectionView);
    v18 = v9->_collectionView;
    v19 = objc_opt_class();
    +[HKDisplayTypeContextVerticalCollectionViewCell reuseIdentifier](HKDisplayTypeContextVerticalCollectionViewCell, "reuseIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v18, "registerClass:forCellWithReuseIdentifier:", v19, v20);

    v21 = v9->_collectionView;
    v22 = objc_opt_class();
    v23 = *MEMORY[0x1E0DC48A8];
    +[_HKDisplayTypeSectionedHeaderView reuseIdentifier](_HKDisplayTypeSectionedHeaderView, "reuseIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v21, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v22, v23, v24);

    v25 = v9->_collectionView;
    v26 = objc_opt_class();
    +[_HKDisplayTypeSectionedHeaderWithButtonView reuseIdentifier](_HKDisplayTypeSectionedHeaderWithButtonView, "reuseIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v25, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v26, v23, v27);

    v43 = (void *)MEMORY[0x1E0CB3718];
    -[UICollectionView leadingAnchor](v9->_collectionView, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView leadingAnchor](v9, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v46;
    -[UICollectionView trailingAnchor](v9->_collectionView, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView trailingAnchor](v9, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v28;
    -[UICollectionView topAnchor](v9->_collectionView, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView topAnchor](v9, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v31;
    -[UICollectionView bottomAnchor](v9->_collectionView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView bottomAnchor](v9, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v35);

    if (v49 != 3)
    {
      -[UICollectionView heightAnchor](v9->_collectionView, "heightAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToConstant:", 48.0);
      v37 = objc_claimAutoreleasedReturnValue();
      collectionViewHeightConstraint = v9->_collectionViewHeightConstraint;
      v9->_collectionViewHeightConstraint = (NSLayoutConstraint *)v37;

      -[NSLayoutConstraint setActive:](v9->_collectionViewHeightConstraint, "setActive:", 1);
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -1);
    v39 = objc_claimAutoreleasedReturnValue();
    lastSelectedIndex = v9->_lastSelectedIndex;
    v9->_lastSelectedIndex = (NSIndexPath *)v39;

    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("Overlays"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v41);

    -[HKDisplayTypeSectionedContextView _registerForTraitChange](v9, "_registerForTraitChange");
  }
  return v9;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeSectionedContextView;
  -[HKDisplayTypeSectionedContextView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", a3);
}

- (BOOL)useBottomInsets
{
  return self->_bottomInsetsEnabled;
}

- (void)setUseBottomInsets:(BOOL)a3
{
  if (self->_bottomInsetsEnabled != a3)
  {
    self->_bottomInsetsEnabled = a3;
    -[HKDisplayTypeSectionedContextView _reconfigureCollectionViewLayoutAndInsetsIfNecessary](self, "_reconfigureCollectionViewLayoutAndInsetsIfNecessary");
  }
}

- (BOOL)useHorizontalInsets
{
  return self->_horizontalInsetsEnabled;
}

- (void)setUseHorizontalInsets:(BOOL)a3
{
  if (self->_horizontalInsetsEnabled != a3)
  {
    self->_horizontalInsetsEnabled = a3;
    -[HKDisplayTypeSectionedContextView _reconfigureCollectionViewLayoutAndInsetsIfNecessary](self, "_reconfigureCollectionViewLayoutAndInsetsIfNecessary");
  }
}

- (BOOL)useTopInsetsWithNoHeader
{
  return self->_topInsetsWithNoHeaderEnabled;
}

- (void)setUseTopInsetsWithNoHeader:(BOOL)a3
{
  if (self->_topInsetsWithNoHeaderEnabled != a3)
  {
    self->_topInsetsWithNoHeaderEnabled = a3;
    -[HKDisplayTypeSectionedContextView _reconfigureCollectionViewLayoutAndInsetsIfNecessary](self, "_reconfigureCollectionViewLayoutAndInsetsIfNecessary");
  }
}

- (double)contentViewTopInset
{
  return self->_contentViewTopInset;
}

- (void)setContentViewTopInset:(double)a3
{
  if (a3 >= 0.0 && self->_contentViewTopInset != a3)
  {
    self->_contentViewTopInset = a3;
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");
    -[HKDisplayTypeSectionedContextView _reconfigureCollectionViewLayoutAndInsetsIfNecessary](self, "_reconfigureCollectionViewLayoutAndInsetsIfNecessary");
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  -[HKDisplayTypeSectionedContextView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[HKDisplayTypeSectionedContextView _reloadCollectionViewWithSelectedItems](self, "_reloadCollectionViewWithSelectedItems");
}

- (void)_reloadCollectionViewWithSelectedItems
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_registerForTraitChange
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HKDisplayTypeSectionedContextView__registerForTraitChange__block_invoke;
  v5[3] = &unk_1E9C45448;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[HKDisplayTypeSectionedContextView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__HKDisplayTypeSectionedContextView__registerForTraitChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v13, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(WeakRetained, "_widthDesignationFromTraitCollection:", v7);

    v9 = objc_msgSend(WeakRetained, "_widthDesignationFromTraitCollection:", v5);
    objc_msgSend(v13, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9 || v11 != v12)
    {
      WeakRetained[63] = 0xBFF0000000000000;
      objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");
      objc_msgSend(WeakRetained, "setNeedsLayout");
      objc_msgSend(WeakRetained, "setNeedsUpdateConstraints");
    }
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  -[HKDisplayTypeSectionedContextView layoutSubviews](&v3, sel_layoutSubviews);
  -[HKDisplayTypeSectionedContextView _reconfigureCollectionViewLayoutAndInsetsIfNecessary](self, "_reconfigureCollectionViewLayoutAndInsetsIfNecessary");
  if (self->_style == 2)
    -[HKDisplayTypeSectionedContextView _updateSizingCellWithContextItemSections:](self, "_updateSizingCellWithContextItemSections:", self->_displayTypeContextSections);
  else
    -[HKDisplayTypeSectionedContextView _updateSizingCellEstimatedHeightIfNecessary](self, "_updateSizingCellEstimatedHeightIfNecessary");
}

- (void)updateConstraints
{
  objc_super v3;

  -[HKDisplayTypeSectionedContextView _updateSelfSizingHeightConstraintIfNecessary](self, "_updateSelfSizingHeightConstraintIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  -[HKDisplayTypeSectionedContextView updateConstraints](&v3, sel_updateConstraints);
}

- (void)_updateSelfSizingHeightConstraintIfNecessary
{
  double v3;
  double v4;
  double v5;
  _QWORD block[5];

  if (self->_style != 3)
  {
    -[HKDisplayTypeSectionedContextView _contentHeight](self, "_contentHeight");
    v4 = v3;
    -[NSLayoutConstraint constant](self->_collectionViewHeightConstraint, "constant");
    if (vabdd_f64(v4, v5) > 0.00000011920929)
    {
      -[NSLayoutConstraint setConstant:](self->_collectionViewHeightConstraint, "setConstant:", v4);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__HKDisplayTypeSectionedContextView__updateSelfSizingHeightConstraintIfNecessary__block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __81__HKDisplayTypeSectionedContextView__updateSelfSizingHeightConstraintIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadCollectionViewWithSelectedItems");
}

- (id)_currentConfigurationWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _HKSectionedContextViewConfiguration *v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(_HKSectionedContextViewConfiguration);
  -[_HKSectionedContextViewConfiguration setIsHorizontalInTwoOverlaysMode:](v9, "setIsHorizontalInTwoOverlaysMode:", -[HKDisplayTypeSectionedContextView _isHorizontalInTwoOverlaysMode](self, "_isHorizontalInTwoOverlaysMode"));
  -[_HKSectionedContextViewConfiguration setBottomInsetsEnabled:](v9, "setBottomInsetsEnabled:", v7);
  -[_HKSectionedContextViewConfiguration setHorizontalInsetsEnabled:](v9, "setHorizontalInsetsEnabled:", v6);
  -[_HKSectionedContextViewConfiguration setTopInsetsWithNoHeaderEnabled:](v9, "setTopInsetsWithNoHeaderEnabled:", v5);
  return v9;
}

- (id)_buildCollectionViewLayoutWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5
{
  void *v6;
  void *v7;

  -[HKDisplayTypeSectionedContextView _currentConfigurationWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_currentConfigurationWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isHorizontalInTwoOverlaysMode"))
    -[HKDisplayTypeSectionedContextView _collectionViewLayoutForHorizontalTwoOverlaysWithConfig:](self, "_collectionViewLayoutForHorizontalTwoOverlaysWithConfig:", v6);
  else
    -[HKDisplayTypeSectionedContextView _defaultCollectionViewLayoutWithConfiguration:](self, "_defaultCollectionViewLayoutWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_collectionViewLayoutForHorizontalTwoOverlaysWithConfig:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionViewLayoutCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionViewLayoutCache, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 50.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 50.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeWithWidthDimension:heightDimension:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3350];
    v23[0] = v11;
    v23[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "horizontalGroupWithLayoutSize:subitems:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3378];
    -[HKDisplayTypeSectionedContextView _interItemSpacing](self, "_interItemSpacing");
    objc_msgSend(v20, "fixedSpacing:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInterItemSpacing:", v21);

    -[HKDisplayTypeSectionedContextView _collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:", v19, objc_msgSend(v4, "bottomInsetsEnabled"), objc_msgSend(v4, "horizontalInsetsEnabled"), objc_msgSend(v4, "topInsetsWithNoHeaderEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_collectionViewLayoutCache, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (id)_defaultCollectionViewLayoutWithConfiguration:(id)a3
{
  id v4;
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionViewLayoutCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionViewLayoutCache, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 50.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "copy");
    v13 = (void *)MEMORY[0x1E0DC3350];
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "horizontalGroupWithLayoutSize:subitems:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDisplayTypeSectionedContextView _collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:", v15, objc_msgSend(v4, "bottomInsetsEnabled"), objc_msgSend(v4, "horizontalInsetsEnabled"), objc_msgSend(v4, "topInsetsWithNoHeaderEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_collectionViewLayoutCache, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (double)_collectionViewLineSpacing
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isiPad"))
    v3 = 16.0;
  else
    v3 = 10.0;

  return v3;
}

- (id)_collectionViewLayoutWithLayoutGroup:(id)a3 bottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5 topInsetsWithNoHeader:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[2];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 50.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v14, *MEMORY[0x1E0DC48A8], 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView _collectionViewLineSpacing](self, "_collectionViewLineSpacing");
  objc_msgSend(v16, "setInterGroupSpacing:");
  -[HKDisplayTypeSectionedContextView _contentItemInsetsWithTopInsets:BottomInsets:horizontalInsets:](self, "_contentItemInsetsWithTopInsets:BottomInsets:horizontalInsets:", v6, v8, v7);
  objc_msgSend(v16, "setContentInsets:");
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView _collectionViewLineSpacing](self, "_collectionViewLineSpacing");
  objc_msgSend(v17, "setInterGroupSpacing:");
  -[HKDisplayTypeSectionedContextView _contentItemInsetsWithTopInsets:BottomInsets:horizontalInsets:](self, "_contentItemInsetsWithTopInsets:BottomInsets:horizontalInsets:", 1, v8, v7);
  objc_msgSend(v17, "setContentInsets:");
  v29[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBoundarySupplementaryItems:", v18);

  objc_initWeak(&location, self);
  v19 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __126__HKDisplayTypeSectionedContextView__collectionViewLayoutWithLayoutGroup_bottomInsets_horizontalInsets_topInsetsWithNoHeader___block_invoke;
  v24[3] = &unk_1E9C45CA0;
  objc_copyWeak(&v27, &location);
  v20 = v17;
  v25 = v20;
  v21 = v16;
  v26 = v21;
  v22 = (void *)objc_msgSend(v19, "initWithSectionProvider:", v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v22;
}

id __126__HKDisplayTypeSectionedContextView__collectionViewLayoutWithLayoutGroup_bottomInsets_horizontalInsets_topInsetsWithNoHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "_appendHeaderForSectionIndex:", a2);
    v7 = 40;
    if (v6)
      v7 = 32;
    v8 = *(id *)(a1 + v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_appendHeaderForSectionIndex:(int64_t)a3
{
  NSArray *displayTypeContextSections;
  void *v4;
  void *v5;
  BOOL v6;

  displayTypeContextSections = self->_displayTypeContextSections;
  if (!displayTypeContextSections)
    return 0;
  -[NSArray objectAtIndexedSubscript:](displayTypeContextSections, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "length") != 0;
  else
    v6 = 0;

  return v6;
}

- (NSDirectionalEdgeInsets)_contentItemInsetsWithTopInsets:(BOOL)a3 BottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSDirectionalEdgeInsets result;

  v5 = 0.0;
  if (a3)
    v6 = 16.0;
  else
    v6 = 0.0;
  if (a5)
    v7 = 16.0;
  else
    v7 = 0.0;
  if (a4)
    v5 = 16.0;
  v8 = v7;
  result.trailing = v8;
  result.bottom = v5;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueForNSIntegerTrait:", objc_opt_class());

  return v4;
}

- (BOOL)_isHorizontalInTwoOverlaysMode
{
  void *v3;
  int64_t v4;

  if (self->_style != 2)
    return 0;
  -[HKDisplayTypeSectionedContextView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKDisplayTypeSectionedContextView _widthDesignationFromTraitCollection:](self, "_widthDesignationFromTraitCollection:", v3);

  return (unint64_t)(v4 - 4) < 3;
}

- (double)_interItemSpacing
{
  void *v3;
  int64_t v4;
  double result;

  if (!-[HKDisplayTypeSectionedContextView _isHorizontalInTwoOverlaysMode](self, "_isHorizontalInTwoOverlaysMode"))
    return 0.0;
  -[HKDisplayTypeSectionedContextView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKDisplayTypeSectionedContextView _widthDesignationFromTraitCollection:](self, "_widthDesignationFromTraitCollection:", v3);

  +[HKCollectionViewLayoutEngineDefaults interItemSpacingForWidthDesignation:](HKCollectionViewLayoutEngineDefaults, "interItemSpacingForWidthDesignation:", v4);
  return result;
}

- (void)_reconfigureCollectionViewLayoutAndInsetsIfNecessary
{
  void *v3;
  char v4;
  id v5;

  -[HKDisplayTypeSectionedContextView _buildCollectionViewLayoutWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_buildCollectionViewLayoutWithBottomInsets:horizontalInsets:topInsetsWithNoHeader:", self->_bottomInsetsEnabled, self->_horizontalInsetsEnabled, self->_topInsetsWithNoHeaderEnabled);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v5);
    -[HKDisplayTypeSectionedContextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HKDisplayTypeSectionedContextView setNeedsLayout](self, "setNeedsLayout");
    -[UICollectionView setNeedsDisplay](self->_collectionView, "setNeedsDisplay");
    -[HKDisplayTypeSectionedContextView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setDisplayTypeContextSections:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_displayTypeContextSections, a3);
  v5 = a3;
  -[HKDisplayTypeSectionedContextView _updateSizingCellWithContextItemSections:](self, "_updateSizingCellWithContextItemSections:", v5);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  UICollectionView *collectionView;
  id v7;

  collectionView = self->_collectionView;
  v7 = a3;
  -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
  -[HKDisplayTypeSectionedContextView _handleSelection:indexPath:informDelegate:](self, "_handleSelection:indexPath:informDelegate:", self->_collectionView, v7, 0);

}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSIndexPath *v5;
  NSIndexPath *lastSelectedIndex;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -1);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  lastSelectedIndex = self->_lastSelectedIndex;
  self->_lastSelectedIndex = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)scrollToTop
{
  UICollectionView *collectionView;
  double v4;

  if (-[UICollectionView isScrollEnabled](self->_collectionView, "isScrollEnabled"))
  {
    collectionView = self->_collectionView;
    -[UICollectionView contentInset](collectionView, "contentInset");
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", 0, 0.0, -v4);
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[HKDisplayTypeSectionedContextView _contentWidth](self, "_contentWidth");
  v4 = v3;
  -[HKDisplayTypeSectionedContextView _contentHeight](self, "_contentHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (HKDisplayTypeContextVerticalCollectionViewCell)sizingCell
{
  HKDisplayTypeContextVerticalCollectionViewCell *sizingCell;
  double v4;
  HKDisplayTypeContextVerticalCollectionViewCell *v5;
  HKDisplayTypeContextVerticalCollectionViewCell *v6;
  HKDisplayTypeContextVerticalCollectionViewCell *v7;
  void *v8;

  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    -[HKDisplayTypeSectionedContextView _cellSizingWidth](self, "_cellSizingWidth");
    v5 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:]([HKDisplayTypeContextVerticalCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, v4, 48.0);
    v6 = self->_sizingCell;
    self->_sizingCell = v5;

    -[HKDisplayTypeContextVerticalCollectionViewCell setHidden:](self->_sizingCell, "setHidden:", 1);
    v7 = self->_sizingCell;
    -[HKDisplayTypeSectionedContextView sizingItem](self, "sizingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextVerticalCollectionViewCell updateWithContextItem:mode:](v7, "updateWithContextItem:mode:", v8, self->_style);

    sizingCell = self->_sizingCell;
  }
  return sizingCell;
}

- (id)createCellWithItem:(id)a3
{
  id v4;
  double v5;
  HKDisplayTypeContextVerticalCollectionViewCell *v6;

  v4 = a3;
  -[HKDisplayTypeSectionedContextView _cellSizingWidth](self, "_cellSizingWidth");
  v6 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:]([HKDisplayTypeContextVerticalCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, v5, 48.0);
  -[HKDisplayTypeContextVerticalCollectionViewCell updateWithContextItem:mode:](v6, "updateWithContextItem:mode:", v4, self->_style);

  return v6;
}

- (HKDisplayTypeContextItem)sizingItem
{
  HKDisplayTypeContextItem *sizingItem;
  HKDisplayTypeContextItem *v4;
  HKDisplayTypeContextItem *v5;

  sizingItem = self->_sizingItem;
  if (!sizingItem)
  {
    -[HKDisplayTypeSectionedContextView _makeSizingItemWithItem:](self, "_makeSizingItemWithItem:", 0);
    v4 = (HKDisplayTypeContextItem *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sizingItem;
    self->_sizingItem = v4;

    sizingItem = self->_sizingItem;
  }
  return sizingItem;
}

- (id)_makeDummySizingItem
{
  HKDisplayTypeContextItem *v2;

  v2 = objc_alloc_init(HKDisplayTypeContextItem);
  -[HKDisplayTypeContextItem setTitle:](v2, "setTitle:", CFSTR("Fake Title"));
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("Fake Id"));
  -[HKDisplayTypeContextItem setValue:](v2, "setValue:", CFSTR("Fake Value"));
  -[HKDisplayTypeContextItem setUnit:](v2, "setUnit:", CFSTR("Fake Unit"));
  -[HKDisplayTypeContextItem setValueContext:](v2, "setValueContext:", CFSTR("Fake"));
  return v2;
}

- (id)_makeSizingItemWithItem:(id)a3
{
  id v4;
  HKDisplayTypeContextItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(HKDisplayTypeContextItem);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "accessibilityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v7);

    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setValue:](v5, "setValue:", v8);

    objc_msgSend(v4, "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setUnit:](v5, "setUnit:", v9);

    objc_msgSend(v4, "attributedLabelTextOverride");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setAttributedLabelTextOverride:](v5, "setAttributedLabelTextOverride:", v10);

    objc_msgSend(v4, "valueContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setValueContext:](v5, "setValueContext:", v11);

    -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v5, "setIsUnitIncludedInValue:", objc_msgSend(v4, "isUnitIncludedInValue"));
  }
  else
  {
    -[HKDisplayTypeSectionedContextView _makeDummySizingItem](self, "_makeDummySizingItem");
    v5 = (HKDisplayTypeContextItem *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_updateSizingCellWithContextItemSections:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  BOOL v17;
  void *v18;
  int v19;
  void *v20;
  id v21;

  if ((unint64_t)(self->_style - 1) <= 1)
  {
    objc_msgSend(a3, "firstObject");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeSectionedContextView _makeSizingItemWithItem:](self, "_makeSizingItemWithItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_style == 2)
    {
      objc_msgSend(v21, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayTypeSectionedContextView _makeSizingItemWithItem:](self, "_makeSizingItemWithItem:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKDisplayTypeSectionedContextView createCellWithItem:](self, "createCellWithItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayTypeSectionedContextView createCellWithItem:](self, "createCellWithItem:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayTypeSectionedContextView _estimateCellHeightForCell:](self, "_estimateCellHeightForCell:", v10);
      v13 = v12;
      -[HKDisplayTypeSectionedContextView _estimateCellHeightForCell:](self, "_estimateCellHeightForCell:", v11);
      if (v14 > v13)
      {
        v15 = v14;
        v16 = v9;

        v13 = v15;
        v6 = v16;
      }
      v17 = vabdd_f64(v13, self->_sizingCellEstimatedHeight) > 0.00000011920929;

    }
    else
    {
      v17 = 0;
    }
    -[HKDisplayTypeSectionedContextView sizingItem](self, "sizingItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v6, "isEqualToContextItem:", v18);

    if (v17 || !v19)
    {
      objc_storeStrong((id *)&self->_sizingItem, v6);
      -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateWithContextItem:mode:", self->_sizingItem, self->_style);

      -[HKDisplayTypeSectionedContextView _updateSizingCellEstimatedHeightIfNecessary](self, "_updateSizingCellEstimatedHeightIfNecessary");
    }

  }
}

- (void)_updateSizingCellEstimatedHeightIfNecessary
{
  double v3;

  -[HKDisplayTypeSectionedContextView _estimatedDynamicCellHeight](self, "_estimatedDynamicCellHeight");
  if (vabdd_f64(v3, self->_sizingCellEstimatedHeight) > 0.00000011920929)
  {
    self->_sizingCellEstimatedHeight = v3;
    -[HKDisplayTypeSectionedContextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HKDisplayTypeSectionedContextView setNeedsLayout](self, "setNeedsLayout");
    -[HKDisplayTypeSectionedContextView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (double)_estimatedDynamicCellHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView addSubview:](self, "addSubview:", v3);

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureForTraitCollection");

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView _estimateCellHeightForCell:](self, "_estimateCellHeightForCell:", v7);
  v9 = v8;

  -[HKDisplayTypeSectionedContextView sizingCell](self, "sizingCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  return v9;
}

- (double)_estimateCellHeightForCell:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[HKDisplayTypeSectionedContextView _cellSizingWidth](self, "_cellSizingWidth");
  objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v6 = v5;

  return v6;
}

- (double)_preferredCollectionViewHeightForCount:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double sizingCellEstimatedHeight;

  v5 = 16.0;
  if (!self->_bottomInsetsEnabled)
    v5 = 0.0;
  v6 = self->_contentViewTopInset + 16.0 + v5;
  -[HKDisplayTypeSectionedContextView _collectionViewLineSpacing](self, "_collectionViewLineSpacing");
  v8 = v6 + v7 * (double)(a3 - 1);
  if (a3 < 3)
  {
    sizingCellEstimatedHeight = self->_sizingCellEstimatedHeight;
    if (sizingCellEstimatedHeight == -1.0)
      -[HKDisplayTypeSectionedContextView _estimatedDynamicCellHeight](self, "_estimatedDynamicCellHeight");
    return v8 + sizingCellEstimatedHeight * (double)a3;
  }
  else
  {
    v9 = v8 + (double)a3 * 48.0;
    if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4Point7InchScreen"))
    {
      return fmin(v9, 125.0);
    }
    return v9;
  }
}

- (double)_contentHeight
{
  int64_t style;
  double result;

  style = self->_style;
  switch(style)
  {
    case 1:
      goto LABEL_8;
    case 3:
      style = -[HKDisplayTypeSectionedContextView _rowsForScreenSize](self, "_rowsForScreenSize");
LABEL_8:
      -[HKDisplayTypeSectionedContextView _preferredCollectionViewHeightForCount:](self, "_preferredCollectionViewHeightForCount:", style);
      return result;
    case 2:
      if (-[HKDisplayTypeSectionedContextView _isHorizontalInTwoOverlaysMode](self, "_isHorizontalInTwoOverlaysMode"))
        style = 1;
      else
        style = 2;
      goto LABEL_8;
  }
  return 0.0;
}

- (double)_contentWidth
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[HKDisplayTypeSectionedContextView frame](self, "frame");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

  }
  else
  {
    -[HKDisplayTypeSectionedContextView frame](self, "frame");
    return v7;
  }
  return v6;
}

- (double)_cellSizingWidth
{
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_horizontalInsetsEnabled)
    v3 = 32.0;
  else
    v3 = 0.0;
  v4 = -[HKDisplayTypeSectionedContextView _isHorizontalInTwoOverlaysMode](self, "_isHorizontalInTwoOverlaysMode");
  -[HKDisplayTypeSectionedContextView _contentWidth](self, "_contentWidth");
  v6 = v5;
  if (v4)
  {
    -[HKDisplayTypeSectionedContextView _interItemSpacing](self, "_interItemSpacing");
    v8 = (v6 - v7 - v3) * 0.5;
  }
  else
  {
    v8 = v5 - v3;
  }
  return fmax(v8, 0.0);
}

- (int64_t)_rowsForScreenSize
{
  if (objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen"))
    return 2;
  else
    return 4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  int64_t result;

  result = (int64_t)self->_displayTypeContextSections;
  if (result)
    return objc_msgSend((id)result, "count", a3);
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  NSArray *displayTypeContextSections;
  int64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  displayTypeContextSections = self->_displayTypeContextSections;
  if (displayTypeContextSections && -[NSArray count](displayTypeContextSections, "count") - 1 >= a4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "count");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  +[HKDisplayTypeContextVerticalCollectionViewCell reuseIdentifier](HKDisplayTypeContextVerticalCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "item");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateWithContextItem:mode:", v13, self->_style);
  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[HKDisplayTypeSectionedContextView _handleSelection:indexPath:informDelegate:](self, "_handleSelection:indexPath:informDelegate:", a3, a4, 1);
}

- (void)_handleSelection:(id)a3 indexPath:(id)a4 informDelegate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSIndexPath *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSIndexPath *v15;
  NSIndexPath **p_lastSelectedIndex;
  void *v17;
  uint64_t v18;
  NSIndexPath *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSIndexPath *)a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v8, "indexPathsForSelectedItems", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(NSIndexPath **)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if (v15 != v9)
          objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v15, 0);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  p_lastSelectedIndex = &self->_lastSelectedIndex;
  if (self->_lastSelectedIndex == v9)
  {
    if (v5)
    {
      objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v9, 0);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *p_lastSelectedIndex;
      *p_lastSelectedIndex = (NSIndexPath *)v18;

      -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextView:didDeselectItemAtIndexPath:", self, v9);
      goto LABEL_15;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSelectedIndex, a4);
    if (v5)
    {
      -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextView:didSelectItemAtIndexPath:", self, v9);
LABEL_15:

    }
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  NSIndexPath *v7;
  NSIndexPath *lastSelectedIndex;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a4;
  objc_msgSend(v5, "indexPathWithIndex:", -1);
  v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  lastSelectedIndex = self->_lastSelectedIndex;
  self->_lastSelectedIndex = v7;

  -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextView:didDeselectItemAtIndexPath:", self, v6);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contextView:canSelectItemAtIndexPath:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contextView:canSelectItemAtIndexPath:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a5;
  -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && (-[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")), v11 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v11, "accessoryButtonAction"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v11, v12))
  {
    v13 = *MEMORY[0x1E0DC48A8];
    +[_HKDisplayTypeSectionedHeaderWithButtonView reuseIdentifier](_HKDisplayTypeSectionedHeaderWithButtonView, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setTitle:", v17);
    -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessoryButtonAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessoryButtonAction:", v19);

  }
  else
  {
    v20 = *MEMORY[0x1E0DC48A8];
    +[_HKDisplayTypeSectionedHeaderView reuseIdentifier](_HKDisplayTypeSectionedHeaderView, "reuseIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v20, v21, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setTitle:", v17);
  }

  return v15;
}

- (double)_maximumHeaderLabelLength
{
  double Width;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[UICollectionView frame](self->_collectionView, "frame");
  Width = CGRectGetWidth(v8);
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v5 = Width - v4;
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  return v5 + v6;
}

- (void)didTapOnInfoButtonForCollectionViewCell:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKDisplayTypeSectionedContextView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextView:didTapOnInfoButtonAtIndex:", self, objc_msgSend(v7, "row"));

  }
}

- (NSArray)displayTypeContextSections
{
  return self->_displayTypeContextSections;
}

- (HKDisplayTypeSectionedContextViewDelegate)delegate
{
  return (HKDisplayTypeSectionedContextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (void)setSizingItem:(id)a3
{
  objc_storeStrong((id *)&self->_sizingItem, a3);
}

- (double)sizingCellEstimatedHeight
{
  return self->_sizingCellEstimatedHeight;
}

- (void)setSizingCellEstimatedHeight:(double)a3
{
  self->_sizingCellEstimatedHeight = a3;
}

- (NSMutableDictionary)collectionViewLayoutCache
{
  return self->_collectionViewLayoutCache;
}

- (void)setCollectionViewLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayoutCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewLayoutCache, 0);
  objc_storeStrong((id *)&self->_sizingItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayTypeContextSections, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndex, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
}

@end
