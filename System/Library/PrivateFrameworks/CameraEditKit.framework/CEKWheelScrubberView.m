@implementation CEKWheelScrubberView

- (CEKWheelScrubberView)initWithFrame:(CGRect)a3
{
  CEKWheelScrubberView *v3;
  CEKWheelScrubberView *v4;
  CGSize *p_thumbnailSize;
  objc_class *v6;
  CGFloat v7;
  double v8;
  uint64_t v9;
  UIColor *selectedThumbnailBorderColor;
  CEKWheelScrubberCollectionViewLayout *v11;
  CEKWheelScrubberCollectionViewLayout *collectionViewLayout;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UICollectionView *collectionView;
  UICollectionView *v20;
  void *v21;
  double v22;
  uint64_t v23;
  UIView *selectedItemLoupe;
  UIView *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIView *centerDotIndicatorView;
  uint64_t v33;
  UITapGestureRecognizer *tapGestureRecognizer;
  CEKEdgeGradientView *v35;
  CEKEdgeGradientView *edgeGradientView;
  void *v37;
  CEKSelectionFeedbackGenerator *v38;
  CEKSelectionFeedbackGenerator *selectionFeedbackGenerator;
  CEKWheelScrubberView *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CEKWheelScrubberView;
  v3 = -[CEKWheelScrubberView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_thumbnailSize = &v3->_thumbnailSize;
    +[CEKWheelScrubberViewCell defaultContentSize](CEKWheelScrubberViewCell, "defaultContentSize");
    *(_QWORD *)&p_thumbnailSize->width = v6;
    v4->_thumbnailSize.height = v7;
    +[CEKWheelScrubberViewCell defaultContentInsetWidth](CEKWheelScrubberViewCell, "defaultContentInsetWidth");
    v4->_thumbnailSpacing = v8 + v8;
    v4->_selectedThumbnailBorderWidth = 3.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
    selectedThumbnailBorderColor = v4->_selectedThumbnailBorderColor;
    v4->_selectedThumbnailBorderColor = (UIColor *)v9;

    v4->_dotIndicatorBehavior = 0;
    v4->_dotPlacement = 0;
    v11 = objc_alloc_init(CEKWheelScrubberCollectionViewLayout);
    collectionViewLayout = v4->__collectionViewLayout;
    v4->__collectionViewLayout = v11;

    -[CEKWheelScrubberCollectionViewLayout setWheelScrubberDelegate:](v4->__collectionViewLayout, "setWheelScrubberDelegate:", v4);
    v4->_cornerStyle = 1;
    v4->_desiredThumbnailCornerRadius = 0.0;
    v13 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v18 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v4->__collectionViewLayout, *MEMORY[0x1E0C9D648], v15, v16, v17);
    collectionView = v4->__collectionView;
    v4->__collectionView = (UICollectionView *)v18;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v4->__collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CEKWheelScrubberViewCellReuseIdentifier"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v4->__collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("CEKWheelScrubberSectionHeaderReuseIdentifier"));
    -[UICollectionView setShowsHorizontalScrollIndicator:](v4->__collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](v4->__collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setDataSource:](v4->__collectionView, "setDataSource:", v4);
    -[UICollectionView setDelegate:](v4->__collectionView, "setDelegate:", v4);
    v20 = v4->__collectionView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    -[UICollectionView setAllowsSelection:](v4->__collectionView, "setAllowsSelection:", 1);
    -[UICollectionView setAllowsMultipleSelection:](v4->__collectionView, "setAllowsMultipleSelection:", 1);
    -[UICollectionView setContentInsetAdjustmentBehavior:](v4->__collectionView, "setContentInsetAdjustmentBehavior:", 2);
    v22 = *MEMORY[0x1E0DC5368] * 0.625 + *MEMORY[0x1E0DC5360] * 0.375;
    -[UICollectionView setHorizontalScrollDecelerationFactor:](v4->__collectionView, "setHorizontalScrollDecelerationFactor:", v22);
    -[UICollectionView setVerticalScrollDecelerationFactor:](v4->__collectionView, "setVerticalScrollDecelerationFactor:", v22);
    -[CEKWheelScrubberView addSubview:](v4, "addSubview:", v4->__collectionView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v14, v15, v16, v17);
    selectedItemLoupe = v4->__selectedItemLoupe;
    v4->__selectedItemLoupe = (UIView *)v23;

    v25 = v4->__selectedItemLoupe;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UIView layer](v4->__selectedItemLoupe, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView selectedThumbnailBorderColor](v4, "selectedThumbnailBorderColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v27, "setBorderColor:", objc_msgSend(v28, "CGColor"));

    -[UIView layer](v4->__selectedItemLoupe, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](v4, "selectedThumbnailBorderWidth");
    objc_msgSend(v29, "setBorderWidth:");

    -[UIView layer](v4->__selectedItemLoupe, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 8.0);

    -[UIView setUserInteractionEnabled:](v4->__selectedItemLoupe, "setUserInteractionEnabled:", 0);
    -[CEKWheelScrubberView addSubview:](v4, "addSubview:", v4->__selectedItemLoupe);
    if (v4->_dotIndicatorBehavior == 1)
    {
      v31 = -[CEKWheelScrubberView newCenterDotIndicatorView](v4, "newCenterDotIndicatorView");
      centerDotIndicatorView = v4->__centerDotIndicatorView;
      v4->__centerDotIndicatorView = (UIView *)v31;

      -[CEKWheelScrubberView addSubview:](v4, "addSubview:", v4->__centerDotIndicatorView);
    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleTapGestureRecognizer_);
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v33;

    -[UICollectionView addGestureRecognizer:](v4->__collectionView, "addGestureRecognizer:", v4->__tapGestureRecognizer);
    v4->_gradientInsets.startInset = 0.0;
    v4->_gradientInsets.endInset = 0.0;
    v35 = -[CEKEdgeGradientView initWithFrame:]([CEKEdgeGradientView alloc], "initWithFrame:", v14, v15, v16, v17);
    edgeGradientView = v4->__edgeGradientView;
    v4->__edgeGradientView = v35;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView setOpaqueGradientsWithColor:](v4, "setOpaqueGradientsWithColor:", v37);

    if (CEKHapticsAllowed())
    {
      v38 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v4->__selectionFeedbackGenerator;
      v4->__selectionFeedbackGenerator = v38;

    }
    v4->_selectionLoupeVisibility = 0;
    v4->_useSelectionLoupeShadow = 0;
    v4->_customThumbnailVisibility = 0;
    v4->_cellOverlayMode = 0;
    -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](v4, "_updateSelectionLoupeAlphaAnimated:", 0);
    -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](v4, "_updateCustomThumbnailAlphaAnimated:", 0);
    v4->__decelerationTargetIndex = 0x7FFFFFFFFFFFFFFFLL;
    v40 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CEKWheelScrubberView;
  -[CEKWheelScrubberView dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $49BF8B24B168BEA945A62196A8B5BD11 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillBeginDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapOnSelectedCellWithFrame = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidTapOnSelectedCell = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToNumberOfSections = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToNumberOfItemsInSection = objc_opt_respondsToSelector() & 1;
  }

}

- (void)_setDragging:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_dragging != a3)
  {
    v3 = a3;
    self->_dragging = a3;
    -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](self, "_updateSelectionLoupeAlphaAnimated:", 1);
    -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", 1);
    if (v3)
    {
      if (!self->_delegateFlags.respondsToWillBeginDragging)
        return;
      -[CEKWheelScrubberView delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wheelScrubberViewWillBeginDragging:", self);
    }
    else
    {
      if (!self->_delegateFlags.respondsToDidEndDragging)
        return;
      -[CEKWheelScrubberView delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wheelScrubberViewDidEndDragging:", self);
    }

  }
}

- (void)updateItems
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;

  -[CEKWheelScrubberView _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[CEKWheelScrubberView _collectionView](self, "_collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfItemsInSection:", v5);

      if (v7)
      {
        for (i = 0; i != v7; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CEKWheelScrubberView _collectionView](self, "_collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = -[CEKWheelScrubberView globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v9);
            -[CEKWheelScrubberView delegate](self, "delegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "wheelScrubberView:updateCell:forItemAtIndex:", self, v11, v12);

          }
        }
      }
      ++v5;
      -[CEKWheelScrubberView _collectionView](self, "_collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "numberOfSections");

    }
    while (v5 < v15);
  }
}

- (void)setItemCount:(unint64_t)a3
{
  void *v4;

  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

    -[CEKWheelScrubberView _updateCollectionViewForMarkedIndexAnimated:](self, "_updateCollectionViewForMarkedIndexAnimated:", 0);
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  -[CEKWheelScrubberView _setSelectedIndex:shouldNotify:shouldSuppressHaptic:](self, "_setSelectedIndex:shouldNotify:shouldSuppressHaptic:", a3, 0, 1);
  -[CEKWheelScrubberView _scrollToIndex:animated:shouldOvershoot:](self, "_scrollToIndex:animated:shouldOvershoot:", a3, 0, 0);
}

- (void)_setSelectedIndex:(unint64_t)a3 shouldNotify:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5
{
  _BOOL8 v6;
  id WeakRetained;

  if (self->_selectedIndex != a3)
  {
    v6 = a4;
    self->_selectedIndex = a3;
    if (-[CEKWheelScrubberView _decelerationTargetIndex](self, "_decelerationTargetIndex") == a3)
      -[CEKWheelScrubberView set_decelerationTargetIndex:](self, "set_decelerationTargetIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](self, "_updateSelectionLoupeAlphaAnimated:", v6);
    -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", v6);
    -[CEKWheelScrubberView _updateOverlayVisibilityAnimated:](self, "_updateOverlayVisibilityAnimated:", v6);
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "wheelScrubberViewDidChangeSelectedIndex:", self);

      -[CEKWheelScrubberView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
    if (!a5)
    {
      if (-[CEKWheelScrubberView _shouldPerformFeedback](self, "_shouldPerformFeedback"))
      {
        -[CEKWheelScrubberView _performFeedback](self, "_performFeedback");
        -[CEKWheelScrubberView _prepareFeedback](self, "_prepareFeedback");
      }
    }
  }
}

- (void)setMarkedIndex:(unint64_t)a3
{
  -[CEKWheelScrubberView setMarkedIndex:animated:](self, "setMarkedIndex:animated:", a3, 0);
}

- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (!-[CEKWheelScrubberView dotIndicatorBehavior](self, "dotIndicatorBehavior") && self->_markedIndex != a3)
  {
    self->_markedIndex = a3;
    -[CEKWheelScrubberView _updateCollectionViewForMarkedIndexAnimated:](self, "_updateCollectionViewForMarkedIndexAnimated:", v4);
  }
}

- (NSString)selectionText
{
  void *v2;
  void *v3;

  -[CEKWheelScrubberView _selectedItemTextOverlay](self, "_selectedItemTextOverlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSelectionText:(id)a3
{
  -[CEKWheelScrubberView setSelectionText:animated:](self, "setSelectionText:animated:", a3, 0);
}

- (void)setSelectionText:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  UILabel *v11;
  UILabel *selectedItemTextOverlay;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
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
  id v32;
  unsigned int v33;
  _QWORD v34[4];
  id v35;
  id v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[5];

  v4 = a4;
  v46[3] = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  -[CEKWheelScrubberView _selectedItemTextOverlay](self, "_selectedItemTextOverlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v6 | v8 && (objc_msgSend((id)v6, "isEqualToString:", v8) & 1) == 0)
  {
    -[CEKWheelScrubberView _selectedItemTextOverlay](self, "_selectedItemTextOverlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC3990]);
      v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      selectedItemTextOverlay = self->__selectedItemTextOverlay;
      self->__selectedItemTextOverlay = v11;

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
      v33 = v4;
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel layer](self->__selectedItemTextOverlay, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_retainAutorelease(v14);
      objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

      -[UILabel layer](self->__selectedItemTextOverlay, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCornerRadius:", 8.0);

      -[UILabel setUserInteractionEnabled:](self->__selectedItemTextOverlay, "setUserInteractionEnabled:", 0);
      -[UILabel setTextAlignment:](self->__selectedItemTextOverlay, "setTextAlignment:", 1);
      v17 = self->__selectedItemTextOverlay;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v17, "setTextColor:", v18);

      self->__showSelectedItemTextOverlay = 0;
      objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC4A68], 13.0, *MEMORY[0x1E0DC4B90]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fontDescriptor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0DC4A48];
      v44[0] = *MEMORY[0x1E0DC4A58];
      v19 = v44[0];
      v44[1] = v20;
      v45[0] = &unk_1E70B3DD0;
      v45[1] = &unk_1E70B3DE8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v21;
      v42[0] = v19;
      v42[1] = v20;
      v43[0] = &unk_1E70B3E00;
      v43[1] = &unk_1E70B3E18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v22;
      v40[0] = v19;
      v40[1] = v20;
      v41[0] = &unk_1E70B3E00;
      v41[1] = &unk_1E70B3E30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46[2] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = *MEMORY[0x1E0DC4A28];
      v39 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fontDescriptorByAddingAttributes:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v26, 13.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel setFont:](self->__selectedItemTextOverlay, "setFont:", v27);
      v4 = v33;

    }
    objc_msgSend(v7, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!v28)
      {
        -[CEKWheelScrubberView _selectedItemLoupe](self, "_selectedItemLoupe");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEKWheelScrubberView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v29);

      }
      objc_msgSend(v7, "setText:", v6);
      -[CEKWheelScrubberView _setShowTextOverlay:animated:completion:](self, "_setShowTextOverlay:animated:completion:", 1, v4, 0);
    }
    else
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__CEKWheelScrubberView_setSelectionText_animated___block_invoke;
      v34[3] = &unk_1E70A4F28;
      v35 = v7;
      v36 = 0;
      v37 = v28 != 0;
      -[CEKWheelScrubberView _setShowTextOverlay:animated:completion:](self, "_setShowTextOverlay:animated:completion:", 0, v4, v34);

    }
  }

}

uint64_t __50__CEKWheelScrubberView_setSelectionText_animated___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setText:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return result;
}

- (void)_setShowTextOverlay:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void (**v8)(id, uint64_t);
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  double v21;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  if (-[CEKWheelScrubberView _showSelectedItemTextOverlay](self, "_showSelectedItemTextOverlay") == v6)
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    -[CEKWheelScrubberView set_showSelectedItemTextOverlay:](self, "set_showSelectedItemTextOverlay:", v6);
    -[CEKWheelScrubberView _selectedItemTextOverlay](self, "_selectedItemTextOverlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    if (v6)
      v11 = 1.0;
    else
      v11 = 0.0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __64__CEKWheelScrubberView__setShowTextOverlay_animated_completion___block_invoke;
    v19 = &unk_1E70A4E38;
    v12 = v9;
    v20 = v12;
    v21 = v11;
    v13 = _Block_copy(&v16);
    v14 = v13;
    if (v5)
    {
      if (v6)
        v15 = 0.0;
      else
        v15 = 1.0;
      if (!v6)
        v10 = 0.33;
      objc_msgSend(v12, "setAlpha:", v15, v16, v17, v18, v19);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v14, v8, 0.33, v10);
    }
    else
    {
      (*((void (**)(void *))v13 + 2))(v13);
      if (v8)
        v8[2](v8, 1);
    }

  }
}

uint64_t __64__CEKWheelScrubberView__setShowTextOverlay_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setCornerStyle:(int64_t)a3
{
  id v3;

  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)setSelectionLoupeVisibility:(int64_t)a3
{
  -[CEKWheelScrubberView setSelectionLoupeVisibility:animated:](self, "setSelectionLoupeVisibility:animated:", a3, 0);
}

- (void)setSelectionLoupeVisibility:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectionLoupeVisibility != a3)
  {
    self->_selectionLoupeVisibility = a3;
    -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](self, "_updateSelectionLoupeAlphaAnimated:", a4);
  }
}

- (BOOL)selectionLoupeVisible
{
  return -[CEKWheelScrubberView selectionLoupeVisibility](self, "selectionLoupeVisibility") == 0;
}

- (void)setSelectionLoupeVisible:(BOOL)a3
{
  -[CEKWheelScrubberView setSelectionLoupeVisible:animated:](self, "setSelectionLoupeVisible:animated:", a3, 0);
}

- (void)setSelectionLoupeVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[CEKWheelScrubberView setSelectionLoupeVisibility:animated:](self, "setSelectionLoupeVisibility:animated:", 0, a4);
}

- (void)setUseSelectionLoupeShadow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  self->_useSelectionLoupeShadow = a3;
  -[UIView layer](self->__selectedItemLoupe, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  LODWORD(v7) = 1058642330;
  if (!v3)
    *(float *)&v7 = 0.0;
  objc_msgSend(v5, "setShadowOpacity:", v7);

  -[UIView layer](self->__selectedItemLoupe, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, 0.0);

}

- (void)setCustomCenteredThumbnailOverlayView:(id)a3
{
  UIView *v5;
  UIView *customCenteredThumbnailOverlayView;
  CEKWheelScrubberView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  customCenteredThumbnailOverlayView = self->_customCenteredThumbnailOverlayView;
  if (customCenteredThumbnailOverlayView != v5)
  {
    v8 = v5;
    -[UIView superview](customCenteredThumbnailOverlayView, "superview");
    v7 = (CEKWheelScrubberView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UIView removeFromSuperview](self->_customCenteredThumbnailOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customCenteredThumbnailOverlayView, a3);
    -[CEKWheelScrubberView addSubview:](self, "addSubview:", v8);
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setCustomThumbnailVisibility:(int64_t)a3
{
  -[CEKWheelScrubberView setCustomThumbnailVisibility:animated:](self, "setCustomThumbnailVisibility:animated:", a3, 0);
}

- (void)setCustomThumbnailVisibility:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_customThumbnailVisibility != a3)
  {
    self->_customThumbnailVisibility = a3;
    -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", a4);
  }
}

- (void)setCustomThumbailHiddenIndices:(id)a3
{
  NSIndexSet *v5;
  NSIndexSet *customThumbailHiddenIndices;
  char v7;
  NSIndexSet *v8;

  v5 = (NSIndexSet *)a3;
  customThumbailHiddenIndices = self->_customThumbailHiddenIndices;
  if (customThumbailHiddenIndices != v5)
  {
    v8 = v5;
    v7 = -[NSIndexSet isEqual:](customThumbailHiddenIndices, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customThumbailHiddenIndices, a3);
      -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", 0);
      v5 = v8;
    }
  }

}

- (void)_updateCollectionViewForMarkedIndexAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v3 = a3;
  if (!-[CEKWheelScrubberView dotIndicatorBehavior](self, "dotIndicatorBehavior"))
  {
    v5 = -[CEKWheelScrubberView markedIndex](self, "markedIndex");
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForSelectedItems");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[CEKWheelScrubberView itemCount](self, "itemCount");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 >= v7)
    {
      if (!-[CEKWheelScrubberView itemCount](self, "itemCount"))
      {
        v9 = 0;
LABEL_12:
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __68__CEKWheelScrubberView__updateCollectionViewForMarkedIndexAnimated___block_invoke;
        v13[3] = &unk_1E70A4F50;
        v14 = v9;
        v15 = v6;
        v16 = v3;
        v10 = v6;
        v11 = v9;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

        return;
      }
      v8 = -[CEKWheelScrubberView defaultIndex](self, "defaultIndex");
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0;
      else
        v5 = v8;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(v12, "containsObject:", v9) & 1) == 0)
        objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v9, v3, 0);
    }
    goto LABEL_12;
  }
}

uint64_t __68__CEKWheelScrubberView__updateCollectionViewForMarkedIndexAnimated___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "deselectItemAtIndexPath:animated:", a2, *(unsigned __int8 *)(result + 48));
  return result;
}

- (id)selectedCellOverlay
{
  return -[CEKWheelScrubberView cellOverlayAtIndex:](self, "cellOverlayAtIndex:", self->_selectedIndex);
}

- (id)cellOverlayAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_cellOverlayMode == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_selectedIndex, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "overlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isSectioned
{
  id WeakRetained;
  BOOL v4;

  if (!self->_delegateFlags.respondsToNumberOfSections)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (unint64_t)objc_msgSend(WeakRetained, "wheelScrubberViewNumberOfSections:", self) > 1;

  return v4;
}

- (unint64_t)totalNumberOfItems
{
  unint64_t v3;
  unint64_t v4;

  if (!-[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 += -[UICollectionView numberOfItemsInSection:](self->__collectionView, "numberOfItemsInSection:", v3++);
  while (v3 < -[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"));
  return v4;
}

- (unint64_t)globalIndexForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    v5 = 0;
    v6 = 0;
    do
      v6 += -[UICollectionView numberOfItemsInSection:](self->__collectionView, "numberOfItemsInSection:", v5++);
    while (v5 < objc_msgSend(v4, "section"));
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v4, "row") + v6;

  return v7;
}

- (void)setTransparentGradients
{
  id v3;

  -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEdgeGradientStyleMask");
  -[CEKWheelScrubberView setMaskView:](self, "setMaskView:", v3);

}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomEdgeGradientStyleWithColor:", v4);

  -[CEKWheelScrubberView setMaskView:](self, "setMaskView:", 0);
  -[CEKWheelScrubberView addSubview:](self, "addSubview:", v5);

}

- (int64_t)layoutOrder
{
  void *v2;
  int64_t v3;

  -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutOrder");

  return v3;
}

- (void)setLayoutOrder:(int64_t)a3
{
  id v4;

  -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutOrder:", a3);

}

- (int64_t)layoutDirection
{
  void *v2;
  int64_t v3;

  -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection");

  return v3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  id v4;

  -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutDirection:", a3);

}

- (void)setDotIndicatorBehavior:(int64_t)a3
{
  UIView *v4;
  UIView *centerDotIndicatorView;
  UIView *v6;

  if (self->_dotIndicatorBehavior != a3)
  {
    self->_dotIndicatorBehavior = a3;
    if (a3 == 1)
    {
      v4 = -[CEKWheelScrubberView newCenterDotIndicatorView](self, "newCenterDotIndicatorView");
      centerDotIndicatorView = self->__centerDotIndicatorView;
      self->__centerDotIndicatorView = v4;

      -[CEKWheelScrubberView addSubview:](self, "addSubview:", self->__centerDotIndicatorView);
    }
    else
    {
      -[UIView removeFromSuperview](self->__centerDotIndicatorView, "removeFromSuperview");
      v6 = self->__centerDotIndicatorView;
      self->__centerDotIndicatorView = 0;

    }
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)newCenterDotIndicatorView
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[CEKWheelScrubberUtilities dotIndicatorDiameter](CEKWheelScrubberUtilities, "dotIndicatorDiameter");
  v5 = v4;
  +[CEKWheelScrubberUtilities dotIndicatorBackgroundColor](CEKWheelScrubberUtilities, "dotIndicatorBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);
  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5 * 0.5);

  return v3;
}

- (void)setDotPlacement:(int64_t)a3
{
  if (self->_dotPlacement != a3)
  {
    self->_dotPlacement = a3;
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateLayoutForVisibleCells
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CEKWheelScrubberView _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CEKWheelScrubberView _updateLayoutForCell:](self, "_updateLayoutForCell:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_updateLayoutForCell:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
  objc_msgSend(v5, "setContentInsetWidth:", v4 * 0.5);
  -[CEKWheelScrubberView selectionDotCenterTopSpacing](self, "selectionDotCenterTopSpacing");
  objc_msgSend(v5, "setSelectionDotCenterTopSpacing:");
  objc_msgSend(v5, "setDotPlacement:", -[CEKWheelScrubberView dotPlacement](self, "dotPlacement"));

}

- (void)setSelectedThumbnailBorderWidth:(double)a3
{
  void *v5;
  void *v6;

  if (self->_selectedThumbnailBorderWidth != a3)
  {
    self->_selectedThumbnailBorderWidth = a3;
    -[CEKWheelScrubberView _selectedItemLoupe](self, "_selectedItemLoupe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", a3);

    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedThumbnailBorderColor:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[UIColor isEqual:](self->_selectedThumbnailBorderColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedThumbnailBorderColor, a3);
    v5 = objc_msgSend(objc_retainAutorelease(v8), "CGColor");
    -[CEKWheelScrubberView _selectedItemLoupe](self, "_selectedItemLoupe");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v5);

  }
}

- (void)setThumbnailSize:(CGSize)a3
{
  if (self->_thumbnailSize.width != a3.width || self->_thumbnailSize.height != a3.height)
  {
    self->_thumbnailSize = a3;
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
    -[CEKWheelScrubberCollectionViewLayout invalidateLayout](self->__collectionViewLayout, "invalidateLayout");
  }
}

- (void)setThumbnailSpacing:(double)a3
{
  if (self->_thumbnailSpacing != a3)
  {
    self->_thumbnailSpacing = a3;
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
    -[CEKWheelScrubberCollectionViewLayout invalidateLayout](self->__collectionViewLayout, "invalidateLayout");
  }
}

- (void)setThumbnailEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_thumbnailEdgeInsets.left != a3.left
    || self->_thumbnailEdgeInsets.top != a3.top
    || self->_thumbnailEdgeInsets.right != a3.right
    || self->_thumbnailEdgeInsets.bottom != a3.bottom)
  {
    self->_thumbnailEdgeInsets = a3;
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)thumbnailCornerRadius
{
  int64_t v3;
  double result;
  double v5;
  double v6;

  v3 = -[CEKWheelScrubberView cornerStyle](self, "cornerStyle");
  if (v3 != 2)
  {
    result = 0.0;
    if (v3 != 1)
      return result;
    -[CEKWheelScrubberView desiredThumbnailCornerRadius](self, "desiredThumbnailCornerRadius", 0.0);
    if (v5 == 0.0)
      return 5.0;
    goto LABEL_6;
  }
  -[CEKWheelScrubberView desiredThumbnailCornerRadius](self, "desiredThumbnailCornerRadius");
  if (v6 != 0.0)
  {
LABEL_6:
    -[CEKWheelScrubberView desiredThumbnailCornerRadius](self, "desiredThumbnailCornerRadius");
    return result;
  }
  return 8.0;
}

- (void)setGradientInsets:(id)a3
{
  double var1;
  double var0;
  $EA4D17EC7EF19748977D62946CF719EB *p_gradientInsets;

  var1 = a3.var1;
  var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if (!CEKEdgeInsetsEqualToInsets(a3.var0, a3.var1, self->_gradientInsets.startInset, self->_gradientInsets.endInset))
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    -[CEKWheelScrubberView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectionDotCenterTopSpacing:(double)a3
{
  if (self->_selectionDotCenterTopSpacing != a3)
  {
    self->_selectionDotCenterTopSpacing = a3;
    -[CEKWheelScrubberView _updateLayoutForVisibleCells](self, "_updateLayoutForVisibleCells");
  }
}

- (BOOL)_isDirectionHorizontal
{
  return -[CEKWheelScrubberView layoutDirection](self, "layoutDirection") == 0;
}

- (BOOL)_isOrderReverse
{
  return -[CEKWheelScrubberView layoutOrder](self, "layoutOrder") == 1;
}

- (CGRect)centeredThumbnailContentFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  -[CEKWheelScrubberView bounds](self, "bounds");
  -[CEKWheelScrubberView _collectionViewAlignmentRectForBounds:](self, "_collectionViewAlignmentRectForBounds:");
  -[CEKWheelScrubberView _centeredCellFrameForCollectionViewAlignmentRect:](self, "_centeredCellFrameForCollectionViewAlignmentRect:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
  v12 = v11 * 0.5;
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectInset(v13, v12, v12);
}

- (CGRect)_collectionViewAlignmentRectForBounds:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  _BOOL4 v16;
  double MinX;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MinY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  -[CEKWheelScrubberView alignmentRectForFrame:](self, "alignmentRectForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CEKWheelScrubberView _defaultItemSize](self, "_defaultItemSize");
  v13 = v12;
  v15 = v14;
  v16 = -[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal");
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  MinX = CGRectGetMinX(v29);
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v11;
  if (v16)
  {
    MinY = CGRectGetMinY(*(CGRect *)&v18);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    CGRectGetHeight(v30);
    UIRoundToViewScale();
    v24 = MinY + v23;
  }
  else
  {
    CGRectGetWidth(*(CGRect *)&v18);
    UIRoundToViewScale();
    MinX = MinX + v25;
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    v24 = CGRectGetMinY(v31);
    v15 = v11;
    v9 = v13;
  }
  v26 = MinX;
  v27 = v9;
  v28 = v15;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v24;
  result.origin.x = v26;
  return result;
}

- (CGRect)_centeredCellFrameForCollectionViewAlignmentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
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
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CEKWheelScrubberView _defaultItemSize](self, "_defaultItemSize");
  v8 = v7;
  v10 = v9;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGRectGetMidX(v18);
  UIRoundToViewScale();
  v12 = v11;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGRectGetMidY(v19);
  UIRoundToViewScale();
  v14 = v13;
  v15 = v12;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)_centerDotIndicatorFrameForCollectionViewAlignmentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CEKWheelScrubberUtilities dotIndicatorDiameter](CEKWheelScrubberUtilities, "dotIndicatorDiameter");
  v9 = v8;
  v10 = -[CEKWheelScrubberView dotPlacement](self, "dotPlacement");
  if (v10 == 2)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetMaxX(v22);
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](self, "selectedThumbnailBorderWidth");
    -[CEKWheelScrubberView selectionDotCenterTopSpacing](self, "selectionDotCenterTopSpacing");
    UIRoundToViewScale();
    v11 = v14;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetMidY(v23);
    goto LABEL_7;
  }
  if (v10 == 1)
  {
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    CGRectGetMinX(v24);
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](self, "selectedThumbnailBorderWidth");
    -[CEKWheelScrubberView selectionDotCenterTopSpacing](self, "selectionDotCenterTopSpacing");
    UIRoundToViewScale();
    v11 = v15;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    CGRectGetMidY(v25);
    goto LABEL_7;
  }
  v11 = 0.0;
  v12 = 0.0;
  if (!v10)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    CGRectGetMidX(v20);
    UIRoundToViewScale();
    v11 = v13;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectGetMinY(v21);
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](self, "selectedThumbnailBorderWidth");
    -[CEKWheelScrubberView selectionDotCenterTopSpacing](self, "selectionDotCenterTopSpacing");
LABEL_7:
    UIRoundToViewScale();
    v12 = v16;
  }
  v17 = v11;
  v18 = v9;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v12;
  result.origin.x = v17;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double selectionDotCenterTopSpacing;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double MinX;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double MinY;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat rect;
  CGFloat v97;
  CGFloat v98;
  objc_super v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v99.receiver = self;
  v99.super_class = (Class)CEKWheelScrubberView;
  -[CEKWheelScrubberView layoutSubviews](&v99, sel_layoutSubviews);
  -[CEKWheelScrubberView bounds](self, "bounds");
  x = v100.origin.x;
  y = v100.origin.y;
  width = v100.size.width;
  height = v100.size.height;
  if (!CGRectIsEmpty(v100))
  {
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView _selectedItemLoupe](self, "_selectedItemLoupe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView _selectedItemTextOverlay](self, "_selectedItemTextOverlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberView alignmentRectForFrame:](self, "alignmentRectForFrame:", x, y, width, height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v88 = v17;
    -[CEKWheelScrubberView _collectionViewAlignmentRectForBounds:](self, "_collectionViewAlignmentRectForBounds:", x, y, width, height);
    v94 = v19;
    v95 = v18;
    v92 = v21;
    v93 = v20;
    -[CEKWheelScrubberView _centeredCellFrameForCollectionViewAlignmentRect:](self, "_centeredCellFrameForCollectionViewAlignmentRect:");
    v23 = v22;
    v97 = v25;
    v98 = v24;
    rect = v26;
    selectionDotCenterTopSpacing = self->_selectionDotCenterTopSpacing;
    v89 = v22;
    if (-[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal"))
    {
      v90 = selectionDotCenterTopSpacing + 5.0;
      v101.origin.x = v23;
      v101.origin.y = v98;
      v101.size.width = v97;
      v101.size.height = rect;
      MinX = CGRectGetMinX(v101);
      v102.origin.x = v12;
      v102.origin.y = v14;
      v102.size.width = v16;
      v102.size.height = v88;
      v28 = MinX - CGRectGetMinX(v102);
      v103.origin.x = v12;
      v103.origin.y = v14;
      v103.size.width = v16;
      v29 = v28;
      v103.size.height = v88;
      v30 = CGRectGetWidth(v103);
      v104.origin.x = v23;
      v104.origin.y = v98;
      v104.size.width = v97;
      v104.size.height = rect;
      v31 = v30 - CGRectGetMaxX(v104);
      v32 = -v90;
      v33 = 19.0;
      v34 = -19.0;
      v35 = 0.0;
      v36 = 0.0;
    }
    else
    {
      v105.origin.x = v23;
      v105.origin.y = v98;
      v105.size.width = v97;
      v105.size.height = rect;
      MinY = CGRectGetMinY(v105);
      v106.origin.x = v12;
      v106.origin.y = v14;
      v106.size.width = v16;
      v106.size.height = v88;
      v90 = MinY - CGRectGetMinY(v106);
      v107.origin.x = v12;
      v107.origin.y = v14;
      v107.size.width = v16;
      v107.size.height = v88;
      v37 = CGRectGetHeight(v107);
      v108.origin.x = v23;
      v108.origin.y = v98;
      v108.size.width = v97;
      v108.size.height = rect;
      v33 = v37 - CGRectGetMaxY(v108);
      v38 = -[CEKWheelScrubberView dotPlacement](self, "dotPlacement");
      if (v38 == 1)
        v31 = 19.0;
      else
        v31 = self->_selectionDotCenterTopSpacing + 5.0;
      if (v38 == 1)
        v29 = self->_selectionDotCenterTopSpacing + 5.0;
      else
        v29 = 19.0;
      v35 = -v29;
      v36 = -v31;
      v32 = 0.0;
      v34 = 0.0;
    }
    v39 = v95 + v35;
    v40 = v94 + v32;
    v41 = v93 - (v35 + v36);
    v42 = v92 - (v32 + v34);
    objc_msgSend(v7, "bounds");
    v44 = v43;
    objc_msgSend(v7, "setFrame:", v39, v40, v41, v42);
    objc_msgSend(v8, "setContentInsets:", v90, v29, v33, v31);
    -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v39, v40, v41, v42);

    LODWORD(v45) = -[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal");
    -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setGradientDirection:", v45 ^ 1);

    -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "frame");
    v49 = v48;
    v51 = v50;

    if ((_DWORD)v45)
      v51 = v49;
    -[CEKWheelScrubberView gradientInsets](self, "gradientInsets");
    v53 = v52;
    -[CEKWheelScrubberView gradientInsets](self, "gradientInsets");
    v55 = v54;
    -[CEKWheelScrubberView _edgeGradientView](self, "_edgeGradientView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setGradientDimensions:", v53, v51 * 0.07, v51 * 0.07, v55);

    -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
    v58 = v57 * 0.5;
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](self, "selectedThumbnailBorderWidth");
    v60 = v58 - v59;
    -[CEKWheelScrubberView selectedThumbnailBorderWidth](self, "selectedThumbnailBorderWidth");
    v62 = v58 - v61;
    v109.origin.x = v89;
    v109.size.width = v97;
    v109.origin.y = v98;
    v109.size.height = rect;
    v110 = CGRectInset(v109, v60, v62);
    v63 = v110.origin.x;
    v64 = v110.origin.y;
    v65 = v110.size.width;
    v66 = v110.size.height;
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v10, "setFrame:", v63, v64, v65, v66);
    -[CEKWheelScrubberView customCenteredThumbnailOverlayView](self, "customCenteredThumbnailOverlayView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      -[CEKWheelScrubberView centeredThumbnailContentFrame](self, "centeredThumbnailContentFrame");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      -[CEKWheelScrubberView customCenteredThumbnailOverlayView](self, "customCenteredThumbnailOverlayView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

    }
    -[CEKWheelScrubberView _centerDotIndicatorView](self, "_centerDotIndicatorView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      -[CEKWheelScrubberView _centerDotIndicatorFrameForCollectionViewAlignmentRect:](self, "_centerDotIndicatorFrameForCollectionViewAlignmentRect:", v95, v94, v93, v92);
      v79 = v78;
      v81 = v80;
      v83 = v82;
      v85 = v84;
      -[CEKWheelScrubberView _centerDotIndicatorView](self, "_centerDotIndicatorView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFrame:", v79, v81, v83, v85);

    }
    if (v44 <= 0.0)
      -[CEKWheelScrubberView _scrollToIndex:animated:shouldOvershoot:](self, "_scrollToIndex:animated:shouldOvershoot:", -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"), 0, 0);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id WeakRetained;
  int64_t v5;

  if (!-[CEKWheelScrubberView isSectioned](self, "isSectioned", a3))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "wheelScrubberViewNumberOfSections:", self);

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained;
  int64_t v7;

  if (!-[CEKWheelScrubberView isSectioned](self, "isSectioned", a3)
    || !self->_delegateFlags.respondsToNumberOfItemsInSection)
  {
    return -[CEKWheelScrubberView itemCount](self, "itemCount");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "wheelScrubberView:numberOfItemsInSection:", self, a4);

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CEKWheelScrubberViewCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CEKWheelScrubberView globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v6);

  -[CEKWheelScrubberView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wheelScrubberView:updateCell:forItemAtIndex:", self, v7, v8);

  -[CEKWheelScrubberView _updateLayoutForCell:](self, "_updateLayoutForCell:", v7);
  -[CEKWheelScrubberView _updateCornerMaskForCell:withItemIndex:](self, "_updateCornerMaskForCell:withItemIndex:", v7, v8);
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  v9 = *MEMORY[0x1E0DC48A8];
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("CEKWheelScrubberSectionHeaderReuseIdentifier"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateCornerMaskForCell:(id)a3 withItemIndex:(int64_t)a4
{
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  v6 = -[CEKWheelScrubberView cornerStyle](self, "cornerStyle");
  if (v6 == 1)
  {
    v7 = -[CEKWheelScrubberView _outermostCornerMaskForItemIndex:](self, "_outermostCornerMaskForItemIndex:", a4);
  }
  else if (v6 == 2)
  {
    v7 = 15;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v11, "itemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[CEKWheelScrubberView thumbnailCornerRadius](self, "thumbnailCornerRadius");
  else
    v10 = 0.0;
  objc_msgSend(v9, "setCornerRadius:", v10);
  objc_msgSend(v9, "setMaskedCorners:", v7);

}

- (unint64_t)_outermostCornerMaskForItemIndex:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = -[CEKWheelScrubberView layoutDirection](self, "layoutDirection");
  v6 = v5;
  if (a3)
  {
    v7 = -[CEKWheelScrubberView itemCount](self, "itemCount") - 1;
    v8 = 12;
    if (!v6)
      v8 = 10;
    if (v7 == a3)
      return v8;
    else
      return 0;
  }
  else if (v5)
  {
    return 3;
  }
  else
  {
    return 5;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  if (-[CEKWheelScrubberView cellOverlayMode](self, "cellOverlayMode") == 1)
  {
    v8 = -[CEKWheelScrubberView globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v7);
    if (v8 == -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"))
    {
      v9 = v16;
      objc_msgSend(v9, "overlayView");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v9, "overlayView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "alpha");
        v14 = v13;

        if (v14 == 0.0)
        {
          objc_msgSend(v9, "overlayView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAlpha:", 1.0);

        }
      }

    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  -[CEKWheelScrubberView _prepareFeedback](self, "_prepareFeedback", a3);
  -[CEKWheelScrubberView _setDragging:](self, "_setDragging:", 1);
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wheelScrubberViewWillBeginScrolling:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  int v5;
  int v6;
  char v7;
  id v8;

  v8 = a3;
  if (self->_delegateFlags.respondsToDidScroll)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wheelScrubberViewDidScroll:", self);

  }
  v5 = objc_msgSend(v8, "isDragging");
  v6 = objc_msgSend(v8, "isDecelerating");
  v7 = objc_msgSend(v8, "_isAnimatingScroll");
  objc_msgSend(v8, "contentOffset");
  if ((v5 | v6) == 1 && (v7 & 1) == 0)
    -[CEKWheelScrubberView _setSelectedIndex:shouldNotify:shouldSuppressHaptic:](self, "_setSelectedIndex:shouldNotify:shouldSuppressHaptic:", -[CEKWheelScrubberView _itemIndexUsingHysteresisForScrollingToContentOffset:](self, "_itemIndexUsingHysteresisForScrollingToContentOffset:"), 1, 0);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  double v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  id v17;

  y = a4.y;
  x = a4.x;
  if (-[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal", a3))
    v9 = x;
  else
    v9 = y;
  if (fabs(v9) >= 0.05)
    v10 = -[CEKWheelScrubberView _itemIndexUsingHysteresisForScrollingToContentOffset:](self, "_itemIndexUsingHysteresisForScrollingToContentOffset:", a5->x, a5->y);
  else
    v10 = -[CEKWheelScrubberView selectedIndex](self, "selectedIndex");
  v11 = v10;
  v12 = -[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems");
  v13 = -[CEKWheelScrubberView _isOrderReverse](self, "_isOrderReverse");
  if ((uint64_t)(v11 - v12 + 1) >= 0)
    v14 = v11 - v12 + 1;
  else
    v14 = ~(v11 - v12);
  if (v13)
    v11 = v14;
  -[CEKWheelScrubberView _contentOffsetForItemIndex:](self, "_contentOffsetForItemIndex:", v11);
  a5->x = v15;
  a5->y = v16;
  if (v11 != -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"))
    -[CEKWheelScrubberView set_decelerationTargetIndex:](self, "set_decelerationTargetIndex:", v11);
  if (self->_delegateFlags.respondsToWillEndScrolling)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "wheelScrubberViewWillEndScrolling:withVelocity:targetContentOffset:", self, a5, x, y);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[CEKWheelScrubberView set_decelerationTargetIndex:](self, "set_decelerationTargetIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[CEKWheelScrubberView _setDragging:](self, "_setDragging:", 0);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wheelScrubberViewDidEndScrolling:", self);

  }
  if ((objc_msgSend(v5, "isDragging") & 1) == 0)
    -[CEKWheelScrubberView _scrollToIndex:animated:shouldOvershoot:](self, "_scrollToIndex:animated:shouldOvershoot:", -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"), 1, 0);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;

  -[CEKWheelScrubberView set_decelerationTargetIndex:](self, "set_decelerationTargetIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](self, "_updateSelectionLoupeAlphaAnimated:", 1);
  -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", 1);
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wheelScrubberViewDidEndScrolling:", self);

  }
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  -[CEKWheelScrubberView set_decelerationTargetIndex:](self, "set_decelerationTargetIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[CEKWheelScrubberView _updateSelectionLoupeAlphaAnimated:](self, "_updateSelectionLoupeAlphaAnimated:", 1);
  -[CEKWheelScrubberView _updateCustomThumbnailAlphaAnimated:](self, "_updateCustomThumbnailAlphaAnimated:", 1);
}

- (CGSize)_defaultItemSize
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
  CGSize result;

  -[CEKWheelScrubberView thumbnailSize](self, "thumbnailSize");
  v4 = v3;
  v6 = v5;
  -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
  v8 = v4 + v7;
  -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
  v10 = v6 + v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)_defaultItemLength
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CEKWheelScrubberView _defaultItemSize](self, "_defaultItemSize");
  v4 = v3;
  v6 = v5;
  if (-[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal"))
    return v4;
  else
    return v6;
}

- (CGPoint)_contentOffsetForItemIndex:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CEKWheelScrubberView _contentOffsetAmountForItemIndex:](self, "_contentOffsetAmountForItemIndex:", a3);
  v7 = v6;
  v8 = -[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal");
  if (v8)
    v9 = v5;
  else
    v9 = v7;
  if (v8)
    v10 = v7;
  else
    v10 = v4;
  result.y = v9;
  result.x = v10;
  return result;
}

- (double)_contentOffsetAmountForItemIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CEKWheelScrubberView _defaultItemLength](self, "_defaultItemLength");
  v6 = v5;
  v7 = (double)-[CEKWheelScrubberView numberOfSectionsBeforeItemIndex:](self, "numberOfSectionsBeforeItemIndex:", a3);
  +[CEKWheelScrubberSectionDividerView dividerViewWidth](CEKWheelScrubberSectionDividerView, "dividerViewWidth");
  return v8 * v7 + (double)a3 * v6;
}

- (double)_fractionalItemOffsetForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double result;

  y = a3.y;
  x = a3.x;
  if (-[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal"))
    v6 = x;
  else
    v6 = y;
  -[CEKWheelScrubberView _fractionalItemOffsetForContentOffsetAmount:](self, "_fractionalItemOffsetForContentOffsetAmount:", v6);
  return result;
}

- (double)_fractionalItemOffsetForContentOffsetAmount:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[CEKWheelScrubberView _defaultItemLength](self, "_defaultItemLength");
  v6 = v5;
  -[CEKWheelScrubberView _contentOffsetIgnoringSectionHeaders:](self, "_contentOffsetIgnoringSectionHeaders:", a3);
  return CEKClamp(v7 / v6, 0.0, (double)(-[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems") - 1));
}

- (unint64_t)numberOfSectionsBeforeItemIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  if (!-[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"))
    return 0;
  v5 = 0;
  v6 = 0;
  while (1)
  {
    v6 += -[UICollectionView numberOfItemsInSection:](self->__collectionView, "numberOfItemsInSection:", v5);
    if (v6 > a3)
      break;
    if (++v5 >= -[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"))
      return 0;
  }
  return v5;
}

- (double)_contentOffsetIgnoringSectionHeaders:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[CEKWheelScrubberView _defaultItemLength](self, "_defaultItemLength");
  v6 = v5;
  +[CEKWheelScrubberSectionDividerView dividerViewWidth](CEKWheelScrubberSectionDividerView, "dividerViewWidth");
  v8 = v7;
  if (!-[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"))
    return a3;
  v9 = 0;
  v10 = v6 * -0.5;
  v11 = v8 * 0.5;
  v12 = a3;
  do
  {
    v13 = v10
        + v6
        * (double)-[UICollectionView numberOfItemsInSection:](self->__collectionView, "numberOfItemsInSection:", v9);
    if (v13 > a3)
      break;
    v14 = v11 + v13;
    if (v14 > a3)
      return v12 - (a3 - (v14 - v11));
    v10 = v11 + v14;
    if (v11 + v14 > a3)
      return v12 + v10 - a3;
    v12 = v12 - v8;
    ++v9;
  }
  while (v9 < -[UICollectionView numberOfSections](self->__collectionView, "numberOfSections"));
  return v12;
}

- (int64_t)_nominalItemIndexForFractionalItemOffset:(double)a3
{
  return (uint64_t)CEKClamp((double)(uint64_t)round(a3), 0.0, (double)(-[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems") - 1));
}

- (int64_t)_itemIndexUsingHysteresisForScrollingToContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  int64_t v8;
  unint64_t v9;

  y = a3.y;
  x = a3.x;
  v6 = (double)-[CEKWheelScrubberView selectedIndex](self, "selectedIndex");
  -[CEKWheelScrubberView _fractionalItemOffsetForContentOffset:](self, "_fractionalItemOffsetForContentOffset:", x, y);
  v8 = -[CEKWheelScrubberView _nominalItemIndexForFractionalItemOffset:](self, "_nominalItemIndexForFractionalItemOffset:", v7 + dbl_1B9877B00[v7 > v6]);
  v9 = -[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems");
  if (!-[CEKWheelScrubberView _isOrderReverse](self, "_isOrderReverse"))
    return v8;
  if ((uint64_t)(v8 - v9 + 1) >= 0)
    return v8 - v9 + 1;
  return ~(v8 - v9);
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CGRect v29;
  CGRect v30;

  v28 = a3;
  if (objc_msgSend(v28, "state") == 3)
  {
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "locationInView:", v4);
    objc_msgSend(v4, "indexPathForItemAtPoint:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[CEKWheelScrubberView globalIndexForIndexPath:](self, "globalIndexForIndexPath:", v5);
      if (v6 == -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"))
      {
        if (self->_delegateFlags.respondsToDidTapOnSelectedCell
          || self->_delegateFlags.respondsToDidTapOnSelectedCellWithFrame)
        {
          -[CEKWheelScrubberView _collectionView](self, "_collectionView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          -[CEKWheelScrubberView thumbnailSpacing](self, "thumbnailSpacing");
          v10 = v9 * 0.5;
          objc_msgSend(v8, "frame");
          v30 = CGRectInset(v29, v10, v10);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          -[CEKWheelScrubberView _collectionView](self, "_collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "convertRect:toView:", self, x, y, width, height);
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;

          if (self->_delegateFlags.respondsToDidTapOnSelectedCellWithFrame)
          {
            -[CEKWheelScrubberView delegate](self, "delegate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "wheelScrubberView:didTapOnSelectedCellWithFrame:", self, v17, v19, v21, v23);

          }
          if (self->_delegateFlags.respondsToDidTapOnSelectedCell)
          {
            -[CEKWheelScrubberView _collectionView](self, "_collectionView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "cellForItemAtIndexPath:", v5);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[CEKWheelScrubberView delegate](self, "delegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "wheelScrubberView:didTapOnSelectedCell:withFrame:", self, v26, v17, v19, v21, v23);

          }
        }
      }
      else
      {
        -[CEKWheelScrubberView _switchToIndex:shouldOvershoot:shouldSuppressHaptic:](self, "_switchToIndex:shouldOvershoot:shouldSuppressHaptic:", v6, 0, 1);
      }
    }

  }
}

- (void)_switchToIndex:(int64_t)a3 shouldOvershoot:(BOOL)a4 shouldSuppressHaptic:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;

  v5 = a5;
  v6 = a4;
  -[CEKWheelScrubberView _prepareFeedback](self, "_prepareFeedback");
  -[CEKWheelScrubberView _setSelectedIndex:shouldNotify:shouldSuppressHaptic:](self, "_setSelectedIndex:shouldNotify:shouldSuppressHaptic:", a3, 1, v5);
  -[CEKWheelScrubberView _scrollToIndex:animated:shouldOvershoot:](self, "_scrollToIndex:animated:shouldOvershoot:", a3, 1, v6);
}

- (void)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 shouldOvershoot:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v5 = a5;
  v6 = a4;
  -[CEKWheelScrubberView _collectionView](self, "_collectionView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKWheelScrubberView _collectionViewLayout](self, "_collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "layoutOrder");

  v11 = -[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems");
  if ((uint64_t)(a3 - v11 + 1) >= 0)
    v12 = a3 - v11 + 1;
  else
    v12 = ~(a3 - v11);
  if (v10 == 1)
    v13 = v12;
  else
    v13 = a3;
  -[CEKWheelScrubberView _contentOffsetForItemIndex:](self, "_contentOffsetForItemIndex:", v13);
  v15 = v14;
  v17 = v16;
  if (v6 && v5)
  {
    objc_msgSend(v29, "contentOffset");
    v19 = v18;
    v21 = v20;
    -[CEKWheelScrubberView _defaultItemLength](self, "_defaultItemLength");
    v23 = v22;
    v24 = v22 * 0.14;
    if (-[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal"))
    {
      if (v15 <= v19 + v23)
      {
        if (v15 < v19 - v23)
          v15 = v15 - v24;
      }
      else
      {
        v15 = v15 + v24;
      }
    }
    else if (v17 <= v21 + v23)
    {
      if (v17 < v21 - v23)
        v17 = v17 - v24;
    }
    else
    {
      v17 = v17 + v24;
    }
  }
  v25 = -[CEKWheelScrubberView _isDirectionHorizontal](self, "_isDirectionHorizontal");
  objc_msgSend(v29, "contentOffset");
  if (v25)
  {
    if (v26 == v15)
      goto LABEL_25;
  }
  else if (v27 == v17)
  {
    goto LABEL_25;
  }
  objc_msgSend(v29, "setContentOffset:animated:", v6, v15, v17);
  if (v6 && self->_delegateFlags.respondsToWillBeginScrolling)
  {
    -[CEKWheelScrubberView delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wheelScrubberViewWillBeginScrolling:", self);

  }
LABEL_25:

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;

  if (self->_suspended != a3)
  {
    v3 = a3;
    self->_suspended = a3;
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CEKWheelScrubberView setSelectedIndex:](self, "setSelectedIndex:", -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__CEKWheelScrubberView_setSuspended___block_invoke;
      block[3] = &unk_1E70A4E60;
      block[4] = self;
      v26 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      -[CEKWheelScrubberView _collectionViewSnapshot](self, "_collectionViewSnapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKWheelScrubberView _setCollectionViewSnapshot:](self, "_setCollectionViewSnapshot:", 0);
      -[CEKWheelScrubberView _collectionView](self, "_collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

      if (v6)
      {
        objc_msgSend(v5, "setUserInteractionEnabled:", 0);
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        v8 = (void *)MEMORY[0x1E0CD28B0];
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __37__CEKWheelScrubberView_setSuspended___block_invoke_2;
        v22 = &unk_1E70A4E60;
        v9 = v6;
        v23 = v9;
        v24 = v5;
        objc_msgSend(v8, "setCompletionBlock:", &v19);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"), v19, v20, v21, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = 1.0;
        LODWORD(v12) = 0;
        LODWORD(v13) = 1.0;
        LODWORD(v14) = 1.0;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTimingFunction:", v15);

        objc_msgSend(v10, "setDuration:", 0.33);
        objc_msgSend(v10, "setFromValue:", &unk_1E70B3E48);
        objc_msgSend(v10, "setToValue:", &unk_1E70B3DE8);
        objc_msgSend(v9, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAnimation:forKey:", v10, CFSTR("fadeOutAnimation"));

        objc_msgSend(v9, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = 0;
        objc_msgSend(v17, "setOpacity:", v18);

        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }

    }
  }
}

void __37__CEKWheelScrubberView_setSuspended___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isSuspended"))
  {
    objc_msgSend(*(id *)(a1 + 40), "snapshotView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "frame");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_collectionViewSnapshot");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "_setCollectionViewSnapshot:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

uint64_t __37__CEKWheelScrubberView_setSuspended___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", 1);
}

- (void)switchToNextItem
{
  -[CEKWheelScrubberView _switchToItemAtIndexOffset:shouldOvershoot:](self, "_switchToItemAtIndexOffset:shouldOvershoot:", 1, 1);
}

- (void)switchToPreviousItem
{
  -[CEKWheelScrubberView _switchToItemAtIndexOffset:shouldOvershoot:](self, "_switchToItemAtIndexOffset:shouldOvershoot:", -1, 1);
}

- (void)_switchToItemAtIndexOffset:(int64_t)a3 shouldOvershoot:(BOOL)a4
{
  int64_t v6;
  int64_t v7;

  v6 = -[CEKWheelScrubberView totalNumberOfItems](self, "totalNumberOfItems");
  v7 = -[CEKWheelScrubberView selectedIndex](self, "selectedIndex") + a3;
  if (v7 >= 0 && v7 < v6)
    -[CEKWheelScrubberView _switchToIndex:shouldOvershoot:shouldSuppressHaptic:](self, "_switchToIndex:shouldOvershoot:shouldSuppressHaptic:");
}

- (BOOL)_shouldPerformFeedback
{
  return 1;
}

- (void)_prepareFeedback
{
  if (-[CEKWheelScrubberView _shouldPerformFeedback](self, "_shouldPerformFeedback"))
    -[CEKSelectionFeedbackGenerator prepareFeedback](self->__selectionFeedbackGenerator, "prepareFeedback");
}

- (void)_performFeedback
{
  if (-[CEKWheelScrubberView _shouldPerformFeedback](self, "_shouldPerformFeedback"))
    -[CEKSelectionFeedbackGenerator performFeedback](self->__selectionFeedbackGenerator, "performFeedback");
}

- (double)_alphaForVisibility:(int64_t)a3
{
  double result;
  BOOL v4;
  _BOOL4 v5;

  if (a3 == 3)
  {
    v4 = !-[CEKWheelScrubberView isDragging](self, "isDragging");
    result = 1.0;
LABEL_5:
    if (!v4)
      return 0.0;
    return result;
  }
  if (a3 != 2)
  {
    result = 1.0;
    v4 = a3 == 0;
    goto LABEL_5;
  }
  v5 = -[CEKWheelScrubberView isDragging](self, "isDragging");
  result = 0.0;
  if (v5)
    return 1.0;
  return result;
}

- (void)_updateSelectionLoupeAlphaAnimated:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  _QWORD v10[6];

  if (-[CEKWheelScrubberView _decelerationTargetIndex](self, "_decelerationTargetIndex") == 0x7FFFFFFFFFFFFFFFLL
    || (v5 = 1.0, -[CEKWheelScrubberView selectionLoupeVisibility](self, "selectionLoupeVisibility") != 2))
  {
    -[CEKWheelScrubberView _alphaForVisibility:](self, "_alphaForVisibility:", -[CEKWheelScrubberView selectionLoupeVisibility](self, "selectionLoupeVisibility"));
    v5 = v6;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CEKWheelScrubberView__updateSelectionLoupeAlphaAnimated___block_invoke;
  v10[3] = &unk_1E70A4E38;
  v10[4] = self;
  *(double *)&v10[5] = v5;
  v7 = _Block_copy(v10);
  v8 = v7;
  if (a3)
  {
    v9 = 0.5;
    if (v5 > 0.0)
      v9 = 0.25;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", (unint64_t)(v5 <= 0.0) << 17, v7, 0, v9, 0.0);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }

}

void __59__CEKWheelScrubberView__updateSelectionLoupeAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_selectedItemLoupe");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_updateCustomThumbnailAlphaAnimated:(BOOL)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  -[CEKWheelScrubberView customThumbailHiddenIndices](self, "customThumbailHiddenIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", -[CEKWheelScrubberView selectedIndex](self, "selectedIndex"));

  v7 = 0;
  if ((v6 & 1) == 0
    && (-[CEKWheelScrubberView _decelerationTargetIndex](self, "_decelerationTargetIndex") == 0x7FFFFFFFFFFFFFFFLL
     || -[CEKWheelScrubberView customThumbnailVisibility](self, "customThumbnailVisibility") != 3))
  {
    -[CEKWheelScrubberView _alphaForVisibility:](self, "_alphaForVisibility:", -[CEKWheelScrubberView customThumbnailVisibility](self, "customThumbnailVisibility"));
    v7 = v8;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CEKWheelScrubberView__updateCustomThumbnailAlphaAnimated___block_invoke;
  v11[3] = &unk_1E70A4E38;
  v11[4] = self;
  v11[5] = v7;
  v9 = _Block_copy(v11);
  v10 = v9;
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, 0.25);
  else
    (*((void (**)(void *))v9 + 2))(v9);

}

void __60__CEKWheelScrubberView__updateCustomThumbnailAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "customCenteredThumbnailOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_updateOverlayVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v3 = a3;
  if (-[CEKWheelScrubberView cellOverlayMode](self, "cellOverlayMode") == 1)
  {
    if (v3)
      v5 = 0.25;
    else
      v5 = 0.0;
    -[CEKWheelScrubberView _collectionView](self, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForVisibleItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke;
    v8[3] = &unk_1E70A4F78;
    v8[4] = self;
    *(double *)&v8[5] = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  }
}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  id *v10;
  uint64_t *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(*(id *)(a1 + 32), "globalIndexForIndexPath:", v4);
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "selectedIndex"))
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = *(double *)(a1 + 40);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_2;
    v23 = &unk_1E70A4B18;
    v10 = &v24;
    v24 = v6;
    v11 = &v20;
LABEL_5:
    objc_msgSend(v8, "animateWithDuration:animations:", v11, v9, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_6;
  }
  objc_msgSend(v6, "overlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alpha");
  v14 = v13;

  if (v14 > 0.0)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = *(double *)(a1 + 40);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_3;
    v18 = &unk_1E70A4B18;
    v10 = &v19;
    v19 = v6;
    v11 = &v15;
    goto LABEL_5;
  }
LABEL_6:

}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __57__CEKWheelScrubberView__updateOverlayVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (CEKWheelScrubberViewDelegate)delegate
{
  return (CEKWheelScrubberViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (unint64_t)defaultIndex
{
  return self->_defaultIndex;
}

- (void)setDefaultIndex:(unint64_t)a3
{
  self->_defaultIndex = a3;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (unint64_t)markedIndex
{
  return self->_markedIndex;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (int64_t)selectionLoupeVisibility
{
  return self->_selectionLoupeVisibility;
}

- (BOOL)useSelectionLoupeShadow
{
  return self->_useSelectionLoupeShadow;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)thumbnailSpacing
{
  return self->_thumbnailSpacing;
}

- (UIEdgeInsets)thumbnailEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_thumbnailEdgeInsets.top;
  left = self->_thumbnailEdgeInsets.left;
  bottom = self->_thumbnailEdgeInsets.bottom;
  right = self->_thumbnailEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)desiredThumbnailCornerRadius
{
  return self->_desiredThumbnailCornerRadius;
}

- (void)setDesiredThumbnailCornerRadius:(double)a3
{
  self->_desiredThumbnailCornerRadius = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset;
  double endInset;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  startInset = self->_gradientInsets.startInset;
  endInset = self->_gradientInsets.endInset;
  result.var1 = endInset;
  result.var0 = startInset;
  return result;
}

- (double)selectedThumbnailBorderWidth
{
  return self->_selectedThumbnailBorderWidth;
}

- (UIColor)selectedThumbnailBorderColor
{
  return self->_selectedThumbnailBorderColor;
}

- (double)selectionDotCenterTopSpacing
{
  return self->_selectionDotCenterTopSpacing;
}

- (int64_t)dotIndicatorBehavior
{
  return self->_dotIndicatorBehavior;
}

- (int64_t)dotPlacement
{
  return self->_dotPlacement;
}

- (UIView)customCenteredThumbnailOverlayView
{
  return self->_customCenteredThumbnailOverlayView;
}

- (int64_t)customThumbnailVisibility
{
  return self->_customThumbnailVisibility;
}

- (NSIndexSet)customThumbailHiddenIndices
{
  return self->_customThumbailHiddenIndices;
}

- (int64_t)cellOverlayMode
{
  return self->_cellOverlayMode;
}

- (void)setCellOverlayMode:(int64_t)a3
{
  self->_cellOverlayMode = a3;
}

- (CEKWheelScrubberCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (UIView)_selectedItemLoupe
{
  return self->__selectedItemLoupe;
}

- (UILabel)_selectedItemTextOverlay
{
  return self->__selectedItemTextOverlay;
}

- (BOOL)_showSelectedItemTextOverlay
{
  return self->__showSelectedItemTextOverlay;
}

- (void)set_showSelectedItemTextOverlay:(BOOL)a3
{
  self->__showSelectedItemTextOverlay = a3;
}

- (UIView)_centerDotIndicatorView
{
  return self->__centerDotIndicatorView;
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)set_edgeGradientView:(id)a3
{
  objc_storeStrong((id *)&self->__edgeGradientView, a3);
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (UIView)_collectionViewSnapshot
{
  return self->__collectionViewSnapshot;
}

- (void)_setCollectionViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->__collectionViewSnapshot, a3);
}

- (int64_t)_decelerationTargetIndex
{
  return self->__decelerationTargetIndex;
}

- (void)set_decelerationTargetIndex:(int64_t)a3
{
  self->__decelerationTargetIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__collectionViewSnapshot, 0);
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__centerDotIndicatorView, 0);
  objc_storeStrong((id *)&self->__selectedItemTextOverlay, 0);
  objc_storeStrong((id *)&self->__selectedItemLoupe, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_customThumbailHiddenIndices, 0);
  objc_storeStrong((id *)&self->_customCenteredThumbnailOverlayView, 0);
  objc_storeStrong((id *)&self->_selectedThumbnailBorderColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
