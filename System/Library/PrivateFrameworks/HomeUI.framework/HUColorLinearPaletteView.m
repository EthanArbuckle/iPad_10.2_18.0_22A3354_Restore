@implementation HUColorLinearPaletteView

- (HUColorLinearPaletteView)initWithProfile:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProfile_colorPalette_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUColorLinearPaletteView.m"), 52, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUColorLinearPaletteView initWithProfile:]",
    v6);

  return 0;
}

- (HUColorLinearPaletteView)initWithProfile:(id)a3 colorPalette:(id)a4
{
  id v7;
  id v8;
  HUColorLinearPaletteView *v9;
  HUColorLinearPaletteView *v10;
  UICollectionViewFlowLayout *v11;
  UICollectionViewFlowLayout *collectionViewFlowLayout;
  id v13;
  uint64_t v14;
  UICollectionView *colorSwatchCollectionView;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUColorLinearPaletteView;
  v9 = -[HUColorLinearPaletteView init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v10->_reachabilityState = 0;
    objc_storeStrong((id *)&v10->_colorPalette, a4);
    -[HUColorLinearPaletteView _updateCalibratedColorPalette](v10, "_updateCalibratedColorPalette");
    v11 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0CEA450]);
    collectionViewFlowLayout = v10->_collectionViewFlowLayout;
    v10->_collectionViewFlowLayout = v11;

    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v10->_collectionViewFlowLayout, "setMinimumInteritemSpacing:", 0.0);
    v13 = objc_alloc(MEMORY[0x1E0CEA410]);
    v14 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v10->_collectionViewFlowLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    colorSwatchCollectionView = v10->_colorSwatchCollectionView;
    v10->_colorSwatchCollectionView = (UICollectionView *)v14;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v10->_colorSwatchCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("colorSwatchViewCell"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v10->_colorSwatchCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("naturalLightSwatchViewCell"));
    -[UICollectionView setClipsToBounds:](v10->_colorSwatchCollectionView, "setClipsToBounds:", 0);
    -[UICollectionView setDataSource:](v10->_colorSwatchCollectionView, "setDataSource:", v10);
    -[UICollectionView setDelegate:](v10->_colorSwatchCollectionView, "setDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v10->_colorSwatchCollectionView, "setBackgroundColor:", v16);

    -[UICollectionView setShowsHorizontalScrollIndicator:](v10->_colorSwatchCollectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](v10->_colorSwatchCollectionView, "setShowsVerticalScrollIndicator:", 0);
    -[HUColorLinearPaletteView addSubview:](v10, "addSubview:", v10->_colorSwatchCollectionView);
    -[HUColorLinearPaletteView setClipsToBounds:](v10, "setClipsToBounds:", 0);
    -[HUColorLinearPaletteView _prepareForTapticFeedback](v10, "_prepareForTapticFeedback");
  }

  return v10;
}

- (void)setColorPalette:(id)a3
{
  -[HUColorLinearPaletteView _setColorPalette:notifyDelegate:](self, "_setColorPalette:notifyDelegate:", a3, 0);
}

- (void)_setColorPalette:(id)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  char v7;
  void *v8;
  HFColorPalette *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a4;
  v24 = a3;
  v7 = -[HFColorPalette isEqual:](self->_colorPalette, "isEqual:", v24);
  v8 = v24;
  if ((v7 & 1) == 0)
  {
    v9 = self->_colorPalette;
    objc_storeStrong((id *)&self->_colorPalette, a3);
    -[HUColorLinearPaletteView _updateCalibratedColorPalette](self, "_updateCalibratedColorPalette");
    v10 = (void *)objc_opt_new();
    -[HFColorPalette colors](v9, "colors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      do
      {
        -[HFColorPalette colors](v9, "colors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "colors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "isEqual:", v17);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "na_safeAddObject:", v19);

        }
        ++v13;
        -[HFColorPalette colors](v9, "colors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

      }
      while (v13 < v21);
    }
    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadItemsAtIndexPaths:", v10);

    v8 = v24;
    if (v4)
    {
      -[HUColorLinearPaletteView interactionDelegate](self, "interactionDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "controlView:colorPaletteDidChange:", self, v24);

      v8 = v24;
    }
  }

}

- (void)_updateCalibratedColorPalette
{
  void *v3;
  void *v4;
  HFColorPalette *v5;
  void *v6;
  void *v7;
  HFColorPalette *v8;
  HFColorPalette *calibratedColorPalette;
  HFColorPalette *v10;
  HFColorPalette *v11;

  -[HUColorLinearPaletteView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUColorLinearPaletteView colorPalette](self, "colorPalette");
  v5 = (HFColorPalette *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = v5;
    -[HUColorLinearPaletteView profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFColorPalette colorPaletteByAdjustingForColorProfile:](v11, "colorPaletteByAdjustingForColorProfile:", v7);
    v8 = (HFColorPalette *)objc_claimAutoreleasedReturnValue();
    calibratedColorPalette = self->_calibratedColorPalette;
    self->_calibratedColorPalette = v8;

    v10 = v11;
  }
  else
  {
    v10 = self->_calibratedColorPalette;
    self->_calibratedColorPalette = v5;
  }

}

- (void)_setSelectedColor:(id)a3 notifyDelegate:(BOOL)a4 selectionChanged:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v6 = a4;
  -[HUColorLinearPaletteView setSelectedColor:](self, "setSelectedColor:", a3);
  v15 = (id)objc_opt_new();
  -[HUColorLinearPaletteView prevSelectedColorIndexPath](self, "prevSelectedColorIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_safeAddObject:", v8);

  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_safeAddObject:", v9);

  -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadItemsAtIndexPaths:", v15);

  -[HUColorLinearPaletteView prevSelectedColorIndexPath](self, "prevSelectedColorIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v15, "containsObject:", v11);

  if (v12)
    -[HUColorLinearPaletteView setPrevSelectedColorIndexPath:](self, "setPrevSelectedColorIndexPath:", 0);
  if (v6 && v5)
  {
    -[HUColorLinearPaletteView interactionDelegate](self, "interactionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorLinearPaletteView value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "controlView:valueDidChange:", self, v14);

  }
}

- (unint64_t)_indexForSelectedColor:(id)a3 includeBias:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HUColorLinearPaletteView__indexForSelectedColor_includeBias___block_invoke;
  v12[3] = &unk_1E6F54AA0;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "firstIndex");
  return v10;
}

uint64_t __63__HUColorLinearPaletteView__indexForSelectedColor_includeBias___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSimilarToColor:", *(_QWORD *)(a1 + 32));
}

- (void)updateSelectedColorIndexPathToIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColorLinearPaletteView setPrevSelectedColorIndexPath:](self, "setPrevSelectedColorIndexPath:", v5);

  -[HUColorLinearPaletteView setSelectedColorIndexPath:](self, "setSelectedColorIndexPath:", v4);
  v9 = (id)objc_opt_new();
  -[HUColorLinearPaletteView prevSelectedColorIndexPath](self, "prevSelectedColorIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v6);

  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v7);

  -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItemsAtIndexPaths:", v9);

}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor descriptorWithAspectRatio:](HUIntrinsicSizeDescriptor, "descriptorWithAspectRatio:", a3, 1.0);
}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  v20 = v6;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v20;
  else
    v7 = 0;
  v8 = v7;
  v6 = v20;
  v9 = v20;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

    v6 = v20;
LABEL_7:
    v9 = 0;
  }

  v12 = -[HUColorLinearPaletteView _indexForSelectedColor:includeBias:](self, "_indexForSelectedColor:includeBias:", v9, 1);
  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "item");
LABEL_12:

    goto LABEL_13;
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorLinearPaletteView setSelectedColorIndexPath:](self, "setSelectedColorIndexPath:", v14);
    goto LABEL_12;
  }
LABEL_13:
  -[HUColorLinearPaletteView selectedColor](self, "selectedColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "isEqual:", v16);

  -[HUColorLinearPaletteView colorPalette](self, "colorPalette");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v12 == 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL && (objc_msgSend(v9, "isNaturalLightColor") & 1) == 0)
  {
    objc_msgSend(v19, "setColor:atIndex:", v9, v15);
    -[HUColorLinearPaletteView _setColorPalette:notifyDelegate:](self, "_setColorPalette:notifyDelegate:", v19, 1);
  }
  -[HUColorLinearPaletteView _setSelectedColor:notifyDelegate:selectionChanged:](self, "_setSelectedColor:notifyDelegate:selectionChanged:", v9, 0, v17 ^ 1u);

}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUColorLinearPaletteView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3 >= 2)
  {
    if (a3 != 2)
      return;
    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);
  }
  else
  {
    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.5);

    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    -[HUColorLinearPaletteView setSelectedColor:](self, "setSelectedColor:", 0);
    -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUColorLinearPaletteView;
  -[HUColorLinearPaletteView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUColorLinearPaletteView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUColorLinearPaletteView;
  -[HUColorLinearPaletteView layoutSubviews](&v10, sel_layoutSubviews);
  -[HUColorLinearPaletteView frame](self, "frame");
  v4 = v3;
  -[HUColorLinearPaletteView frame](self, "frame");
  v6 = v5;
  -[HUColorLinearPaletteView colorSwatchCollectionView](self, "colorSwatchCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  v8 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  -[HUColorLinearPaletteView collectionViewFlowLayout](self, "collectionViewFlowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemSize:", v8, v8);

  -[HUColorLinearPaletteView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUColorLinearPaletteView reachabilityState](self, "reachabilityState"));
}

- (void)setUserInteractionActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_userInteractionActive != a3)
  {
    v3 = a3;
    self->_userInteractionActive = a3;
    -[HUColorLinearPaletteView interactionDelegate](self, "interactionDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controlView:interactionStateDidChange:forFirstTouch:", self, v3, 0);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HUNaturalLightColorSwatchCollectionViewCell *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;

  v6 = a3;
  v7 = a4;
  -[HUColorLinearPaletteView selectedColor](self, "selectedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUColorLinearPaletteView _indexForSelectedColor:includeBias:](self, "_indexForSelectedColor:includeBias:", v8, 1);

  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "item");

  }
  -[HUColorLinearPaletteView colorPalette](self, "colorPalette");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isNaturalLightColor"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("naturalLightSwatchViewCell"), v7);
    v15 = (HUNaturalLightColorSwatchCollectionViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = -[HUNaturalLightColorSwatchCollectionViewCell initWithFrame:]([HUNaturalLightColorSwatchCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, 57.0, 57.0);
    v16 = objc_msgSend(v7, "item");
    -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTag:", v16);

    -[HUColorLinearPaletteView selectedColor](self, "selectedColor");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18 && (v19 = (void *)v18, v20 = objc_msgSend(v7, "item"), v19, v9 == v20))
    {
      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 2;
    }
    else
    {
      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 0;
    }
    objc_msgSend(v21, "setSelectionState:", v23);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("colorSwatchViewCell"), v7);
    v15 = (HUNaturalLightColorSwatchCollectionViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = -[HUColorSwatchViewCollectionViewCell initWithFrame:]([HUColorSwatchViewCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, 57.0, 57.0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlColorPickerEditButton"), CFSTR("HUQuickControlColorPickerEditButton"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedUppercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    v27 = objc_msgSend(v7, "item");
    -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTag:", v27);

    -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "colors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "UIColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setColor:", v32);

    -[HUColorLinearPaletteView selectedColor](self, "selectedColor");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34 && (v35 = (void *)v34, v36 = objc_msgSend(v7, "item"), v35, v9 == v36))
    {
      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSelectionState:", 2);

      -[HUColorLinearPaletteView profile](self, "profile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v22, "mode") != 0;
      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setLabelHidden:", v38);

    }
    else
    {
      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSelectionState:", 0);

      -[HUNaturalLightColorSwatchCollectionViewCell swatchView](v15, "swatchView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLabelHidden:", 1);
    }
    v14 = v31;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUColorSwatchViewCollectionViewCell-%lu"), objc_msgSend(v7, "item"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightColorSwatchCollectionViewCell setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v41);

  return v15;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 57.0;
  v6 = 57.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUColorLinearPaletteView setUserInteractionActive:](self, "setUserInteractionActive:", 1);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v5;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "User selected indexPath %@. colors = %@", (uint8_t *)&v24, 0x16u);

  }
  -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUColorLinearPaletteView selectedColorIndexPath](self, "selectedColorIndexPath");
  }
  else
  {
    -[HUColorLinearPaletteView selectedColor](self, "selectedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUColorLinearPaletteView _indexForSelectedColor:includeBias:](self, "_indexForSelectedColor:includeBias:", v10, 1);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUColorLinearPaletteView setPrevSelectedColorIndexPath:](self, "setPrevSelectedColorIndexPath:", v12);

  -[HUColorLinearPaletteView setSelectedColorIndexPath:](self, "setSelectedColorIndexPath:", v5);
  -[HUColorLinearPaletteView calibratedColorPalette](self, "calibratedColorPalette");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v5, "item");
  -[HUColorLinearPaletteView prevSelectedColorIndexPath](self, "prevSelectedColorIndexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "item");

  v19 = objc_msgSend(v15, "isNaturalLightColor");
  if (v16 == v18)
  {
    v20 = v19;
    -[HUColorLinearPaletteView profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "mode"))
      v20 = 1;

    if ((v20 & 1) == 0)
    {
      -[HUColorLinearPaletteView setPrevSelectedColorIndexPath:](self, "setPrevSelectedColorIndexPath:", 0);
      -[HUColorLinearPaletteView setPrevSelectedColorIndexPath:](self, "setPrevSelectedColorIndexPath:", 0);
      -[HUColorLinearPaletteView interactionDelegate](self, "interactionDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "presentFullColorViewForControlView:selectedColorIndexPath:", self, v5);

      -[HUColorLinearPaletteView _actuateImpactTapticFeedback](self, "_actuateImpactTapticFeedback");
    }
  }
  else
  {
    -[HUColorLinearPaletteView interactionDelegate](self, "interactionDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "controlView:didSelectColorAtIndexPath:", self, v5);

    -[HUColorLinearPaletteView _setSelectedColor:notifyDelegate:selectionChanged:](self, "_setSelectedColor:notifyDelegate:selectionChanged:", v15, 1, 1);
    -[HUColorLinearPaletteView _actuateSelectionTapticFeedback](self, "_actuateSelectionTapticFeedback");
  }

  -[HUColorLinearPaletteView setUserInteractionActive:](self, "setUserInteractionActive:", 0);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 4.5;
  v7 = 0.0;
  v8 = 4.5;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)_prepareForTapticFeedback
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA998]);
  -[HUColorLinearPaletteView setSelectionFeedbackGenerator:](self, "setSelectionFeedbackGenerator:", v3);

  -[HUColorLinearPaletteView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 1);
  -[HUColorLinearPaletteView setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", v5);

  -[HUColorLinearPaletteView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepare");

}

- (void)_actuateSelectionTapticFeedback
{
  void *v3;
  id v4;

  -[HUColorLinearPaletteView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

  -[HUColorLinearPaletteView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (void)_actuateImpactTapticFeedback
{
  void *v3;
  id v4;

  -[HUColorLinearPaletteView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactOccurred");

  -[HUColorLinearPaletteView impactFeedbackGenerator](self, "impactFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (HUQuickControlColorPaletteViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlColorPaletteViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (NSIndexPath)selectedColorIndexPath
{
  return self->_selectedColorIndexPath;
}

- (void)setSelectedColorIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColorIndexPath, a3);
}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (HFColorPalette)calibratedColorPalette
{
  return self->_calibratedColorPalette;
}

- (void)setCalibratedColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_calibratedColorPalette, a3);
}

- (HFColorPaletteColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (NSIndexPath)prevSelectedColorIndexPath
{
  return self->_prevSelectedColorIndexPath;
}

- (void)setPrevSelectedColorIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_prevSelectedColorIndexPath, a3);
}

- (UICollectionView)colorSwatchCollectionView
{
  return self->_colorSwatchCollectionView;
}

- (void)setColorSwatchCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_colorSwatchCollectionView, a3);
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, a3);
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_colorSwatchCollectionView, 0);
  objc_storeStrong((id *)&self->_prevSelectedColorIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_calibratedColorPalette, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_selectedColorIndexPath, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
