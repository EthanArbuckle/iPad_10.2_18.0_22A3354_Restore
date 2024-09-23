@implementation AVTAvatarAttributeEditorSectionColorController

+ (BOOL)supportsSelection
{
  return 0;
}

+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  id v5;
  char v6;
  double v7;
  unsigned __int8 v8;
  double v9;

  v5 = a4;
  v6 = objc_msgSend(v5, "deviceIsPad");
  v7 = 400.0;
  if (a3 <= 400.0 || (v7 = 12.0, (v6 & 1) == 0))
  {
    v8 = objc_msgSend(v5, "deviceIsMac", v7);
    v7 = 6.0;
    if (((a3 > 300.0) & v8) != 0)
      v7 = 10.0;
  }
  v9 = floor((a3 + -24.0 + (v7 + -1.0) * -0.0) / v7);

  return v9;
}

+ (CGSize)cellSizeFittingWidth:(double)a3 environment:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "edgeLengthFittingWidth:environment:", a4, a3);
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)updateCollectionViewLayout:(id)a3 containerSize:(CGSize)a4 environment:(id)a5 forExtended:(BOOL)a6 withSlider:(BOOL)a7 numberOfItems:(int64_t)a8
{
  _BOOL4 v8;
  double width;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a6;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend((id)objc_opt_class(), "cellSizeFittingWidth:environment:", v12, width);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v11, "setItemSize:", v14, v16);
  v17 = !v8;
  objc_msgSend(v11, "setMinimumLineSpacing:", 0.0);
  v18 = objc_msgSend(v11, "scrollDirection");
  if (v18 != v17)
    objc_msgSend(v11, "setScrollDirection:", v17);
  objc_msgSend(v11, "setSectionInset:", 12.0, 0.0, 12.0, 0.0);

  return v18 != v17;
}

+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4
{
  CGFloat y;
  double x;
  id v6;
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
  CGPoint result;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  objc_msgSend(v6, "contentInset");
  v10 = v8 + v9;
  objc_msgSend(v6, "bounds");
  v11 = v10 - CGRectGetWidth(v18);
  objc_msgSend(v6, "contentInset");
  v13 = v12;

  v14 = -v13;
  if (v11 >= x)
    v15 = x;
  else
    v15 = v11;
  if (v15 >= v14)
    v14 = v15;
  v16 = y;
  result.y = v16;
  result.x = v14;
  return result;
}

- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3
{
  return -[AVTAvatarAttributeEditorSectionColorController initWithEnvironment:showsHeader:](self, "initWithEnvironment:showsHeader:", a3, 0);
}

- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3 showsHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AVTAvatarAttributeEditorSectionColorDataSource *v7;
  AVTAvatarAttributeEditorSectionColorController *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AVTAvatarAttributeEditorSectionColorDataSource);
  v8 = -[AVTAvatarAttributeEditorSectionColorController initWithDataSource:showsHeader:environment:](self, "initWithDataSource:showsHeader:environment:", v7, v4, v6);

  return v8;
}

- (AVTAvatarAttributeEditorSectionColorController)initWithDataSource:(id)a3 showsHeader:(BOOL)a4 environment:(id)a5
{
  id v9;
  id v10;
  AVTAvatarAttributeEditorSectionColorController *v11;
  AVTAvatarAttributeEditorSectionColorController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorSectionColorController;
  v11 = -[AVTAvatarAttributeEditorSectionColorController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_needsScrollToSelected = 1;
    objc_storeStrong((id *)&v11->_dataSource, a3);
    -[AVTAvatarAttributeEditorSectionColorDataSource setDelegate:](v12->_dataSource, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_environment, a5);
    v12->_showsHeader = a4;
  }

  return v12;
}

- (UIView)sectionView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTAvatarAttributeEditorSectionColorController setContainerView:](self, "setContainerView:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[AVTAvatarAttributeEditorSectionColorController createCollectionView](self, "createCollectionView");
  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    -[AVTAvatarAttributeEditorSectionColorController createSliderContainerView](self, "createSliderContainerView");
  return -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
}

- (int64_t)selectedIndex
{
  void *v2;
  int64_t v3;

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedItemIndex");

  return v3;
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)currentRelativeContentOffsetX
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v8 = v5 + v7;

  return v8;
}

- (void)setCurrentRelativeContentOffsetX:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  CGRect v29;

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v29);
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  v15 = Width - (v12 + v14);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInset");
  v18 = v17;

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentOffset");
  v21 = v20;

  if (v7 <= v15)
  {
    -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentInset");
    v25 = -v27;
  }
  else
  {
    v22 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clampedContentOffsetForOffset:collectionView:", v23, a3 - v18, v21);
    v25 = v24;
    v21 = v26;
  }

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentOffset:", v25, v21);

}

- (void)createCollectionView
{
  AVTAttributeEditorSectionHeaderView *v3;
  void *v4;
  AVTAttributeEditorSectionHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  uint64_t v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  objc_class *v42;
  void *v43;
  void *v44;
  id v45;
  CGRect v46;

  if (-[AVTAvatarAttributeEditorSectionColorController showsHeader](self, "showsHeader"))
  {
    v3 = [AVTAttributeEditorSectionHeaderView alloc];
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[AVTAttributeEditorSectionHeaderView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v46), 40.0);
    -[AVTAvatarAttributeEditorSectionColorController setHeaderView:](self, "setHeaderView:", v5);

    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayString:", v8);

    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController headerView](self, "headerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[AVTAvatarAttributeEditorSectionColorController headerView](self, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutoresizingMask:", 34);

  }
  v13 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[AVTAvatarAttributeEditorSectionColorController collectionViewLayout](self, "collectionViewLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);
  -[AVTAvatarAttributeEditorSectionColorController setCollectionView:](self, "setCollectionView:", v24);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDataSource:", self);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v27);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setShowsHorizontalScrollIndicator:", 0);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAutoresizingMask:", 2);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerClass:forCellWithReuseIdentifier:", v33, v35);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  v38 = (objc_class *)objc_opt_class();
  NSStringFromClass(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "registerClass:forCellWithReuseIdentifier:", v37, v39);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_opt_class();
  v42 = (objc_class *)objc_opt_class();
  NSStringFromClass(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "registerClass:forCellWithReuseIdentifier:", v41, v43);

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", v44);

}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  UICollectionViewFlowLayout *collectionViewLayout;
  AVTFlippingCollectionViewFlowLayout *v4;
  UICollectionViewFlowLayout *v5;

  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    v4 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
    v5 = self->_collectionViewLayout;
    self->_collectionViewLayout = &v4->super;

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (void)createSliderContainerView
{
  void *v3;
  double v4;
  double v5;
  AVTAvatarColorSliderContainerView *v6;
  void *v7;
  AVTAvatarColorSliderContainerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = [AVTAvatarColorSliderContainerView alloc];
  -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarColorSliderContainerView initWithFrame:userInterfaceLayoutDirection:](v6, "initWithFrame:userInterfaceLayoutDirection:", objc_msgSend(v7, "userInterfaceLayoutDirection"), 0.0, 0.0, v5, 45.0);
  -[AVTAvatarAttributeEditorSectionColorController setSliderContainerView:](self, "setSliderContainerView:", v8);

  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 10);

  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 0.0);

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

}

- (void)showSliderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  _QWORD v16[5];
  _QWORD v17[5];
  CGRect v18;
  CGRect v19;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke;
  v17[3] = &unk_1EA51D188;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v17);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke_2;
  v16[3] = &unk_1EA51D188;
  v16[4] = self;
  v6 = MEMORY[0x1DF0D0754](v16);
  v7 = (void *)v6;
  if (v3)
  {
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    Height = CGRectGetHeight(v18);
    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = Height - CGRectGetMinY(v19) + -6.0;

    CGAffineTransformMakeTranslation(&v15, 0.0, v11 + -20.0);
    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    objc_msgSend(v12, "setTransform:", &v14);

    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[AVTAvatarAttributeEditorSectionColorController animateWithSpringAnimations:completion:](self, "animateWithSpringAnimations:completion:", v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

}

void __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutSubviewsForIndex:", 0);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

void __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

- (void)hideSliderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  _QWORD v12[6];
  _QWORD v13[5];
  CGRect v14;
  CGRect v15;

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke;
  v13[3] = &unk_1EA51D250;
  v13[4] = self;
  v6 = MEMORY[0x1DF0D0754](v13, a2);
  v7 = (void *)v6;
  if (v3)
  {
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    Height = CGRectGetHeight(v14);
    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = Height - CGRectGetMinY(v15) + -6.0;

    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke_2;
    v12[3] = &unk_1EA51ECD8;
    v12[4] = self;
    *(double *)&v12[5] = v11;
    -[AVTAvatarAttributeEditorSectionColorController animateWithSpringAnimations:completion:](self, "animateWithSpringAnimations:completion:", v12, v7);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }

}

void __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6[0] = *MEMORY[0x1E0C9BAA8];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v6);

  }
}

void __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&v7, 0, sizeof(v7));
  CGAffineTransformTranslate(&v8, &v7, 0.0, *(double *)(a1 + 40) + -20.0);
  objc_msgSend(*(id *)(a1 + 32), "sliderContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  objc_msgSend(v5, "setTransform:", &v6);

}

- (void)animateWithSpringAnimations:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, a3, a4, 0.3, 0.0, 0.7, 0.0);
}

- (void)updateCollectionViewLayoutWithContainerSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTAvatarAttributeEditorSectionColorController layoutSubviewsForIndex:](self, "layoutSubviewsForIndex:", 0);
    v7 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorController collectionViewLayout](self, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isShowingExtended");
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isShowingSlider");
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "updateCollectionViewLayout:containerSize:environment:forExtended:withSlider:numberOfItems:", v8, v9, v11, v13, objc_msgSend(v14, "numberOfItemsInSection:", 0), width, height);

    if ((_DWORD)v7)
      -[AVTAvatarAttributeEditorSectionColorController scrollCollectionViewToOrigin](self, "scrollCollectionViewToOrigin");
  }
}

- (void)scrollCollectionViewToSelectedColor
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex");
    -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);

    if (v3 < v5)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 16, 0);

    }
  }
}

- (void)scrollCollectionViewToOrigin
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");
  v4 = -v3;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", v4, 0.0);

}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorController collectionViewLayout](self, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isShowingExtended");
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isShowingSlider");
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateCollectionViewLayout:containerSize:environment:forExtended:withSlider:numberOfItems:", v5, v11, v13, v15, objc_msgSend(v16, "numberOfItemsInSection:", 0), v8, v10);

    -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadData");

    -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

  }
}

- (void)updateWithSection:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSection identifier](self->_section, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    self->_needsScrollToSelected = 1;
  objc_storeStrong((id *)&self->_section, a3);
  -[AVTAvatarAttributeEditorSectionColorController setDontAnimateSelection:](self, "setDontAnimateSelection:", 1);
  v8 = -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex");
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorSection:", v14);

  if (v8 == -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"))
  {
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionItemAtIndex:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorSectionColorController updateSliderForSectionItemIfNeeded:](self, "updateSliderForSectionItemIfNeeded:", v11);
  }
  -[AVTAvatarAttributeEditorSectionColorController setDontAnimateSelection:](self, "setDontAnimateSelection:", 0);
  objc_msgSend(v14, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDisplayString:", v12);

}

- (void)updateSliderForSectionItemIfNeeded:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingSlider");

  objc_msgSend(v15, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canShowSlider");

  if (v7)
  {
    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSectionItem:animated:", v15, v5);

    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorVariationStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorPresetFromColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateSliderWithColorPreset:animated:", v13, v5);

  }
}

- (void)willDisplayViewForIndex:(int64_t)a3
{
  -[AVTAvatarAttributeEditorSectionColorController layoutSubviewsForIndex:](self, "layoutSubviewsForIndex:", a3);
  -[AVTAvatarAttributeEditorSectionColorController reloadData](self, "reloadData");
  if (-[AVTAvatarAttributeEditorSectionColorController needsScrollToSelected](self, "needsScrollToSelected"))
  {
    -[AVTAvatarAttributeEditorSectionColorController setNeedsScrollToSelected:](self, "setNeedsScrollToSelected:", 0);
    -[AVTAvatarAttributeEditorSectionColorController scrollCollectionViewToSelectedColor](self, "scrollCollectionViewToSelectedColor");
  }
}

- (void)layoutSubviewsForIndex:(int64_t)a3
{
  void *v4;
  double Width;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double MaxY;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v36);

  -[AVTAvatarAttributeEditorSectionColorController heightForSectionHeaderFittingWidth:](self, "heightForSectionHeaderFittingWidth:", Width);
  v7 = v6;
  -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetWidth(v37);

  -[AVTAvatarAttributeEditorSectionColorController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, v7);

  -[AVTAvatarAttributeEditorSectionColorController heightForCollectionViewFittingWidth:](self, "heightForCollectionViewFittingWidth:", Width);
  v12 = v11;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v9;
  v38.size.height = v7;
  MaxY = CGRectGetMaxY(v38);
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", 0.0, MaxY, Width, v12);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentInset:", 0.0, 12.0, 0.0, 12.0);

  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentOffset");
  v18 = v17;

  if (v18 == 0.0)
    -[AVTAvatarAttributeEditorSectionColorController scrollCollectionViewToOrigin](self, "scrollCollectionViewToOrigin");
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isShowingSlider");

  if (v21)
  {
    v22 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "edgeLengthFittingWidth:environment:", v26, v25);
    v28 = v27;

    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30 - v28 + -12.0;
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v34 = v33;

    -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", 0.0, v31, v34, v28);

  }
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 1;
}

- (double)heightForSectionHeaderFittingWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (-[AVTAvatarAttributeEditorSectionColorController showsHeader](self, "showsHeader")
    && objc_msgSend(v6, "shouldDisplayTitle"))
  {
    +[AVTUIFontRepository attributeTitleFont](AVTUIFontRepository, "attributeTitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineHeight");
    v11 = v10 + v10;
    v20 = *MEMORY[0x1E0CEA098];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, a3 + -40.0, v11);
    v14 = v13;

    +[AVTUIFontRepository attributeTitleFont](AVTUIFontRepository, "attributeTitleFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_scaledValueForValue:", 18.0);
    v17 = v16;

    v18 = 30.0;
    if (v17 <= 30.0)
      v18 = v17;
    v7 = ceil(v14 + v18 * 2.0 + -12.0);

  }
  return v7;
}

- (double)heightForCollectionViewFittingWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v5 = (void *)objc_opt_class();
  -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "edgeLengthFittingWidth:environment:", v6, a3);
  v8 = v7;

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isShowingExtended");

  if ((_DWORD)v6)
  {
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extendedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (double)(unint64_t)objc_msgSend(v12, "count");

    v8 = (v8 + 0.0) * (double)(uint64_t)ceil(v13 / (double)(uint64_t)floor((a3 + -24.0) / (v8 + 0.0)));
  }
  return v8 + 24.0;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  width = a4.width;
  -[AVTAvatarAttributeEditorSectionColorController heightForCollectionViewFittingWidth:](self, "heightForCollectionViewFittingWidth:", a3, a4.width, a4.height);
  v7 = v6;
  if (-[AVTAvatarAttributeEditorSectionColorController showsHeader](self, "showsHeader"))
  {
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldDisplayTitle");

    if (v10)
    {
      -[AVTAvatarAttributeEditorSectionColorController heightForSectionHeaderFittingWidth:](self, "heightForSectionHeaderFittingWidth:", width);
      v7 = v7 + v11;
    }
  }
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isShowingSlider");

  if (v13)
  {
    v14 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "edgeLengthFittingWidth:environment:", v15, width);
    v17 = v16;

    v7 = v7 + v17 + 6.0;
  }
  v18 = width;
  v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (unint64_t)indexForItem:(id)a3
{
  return 0;
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  objc_msgSend(a3, "layoutIfNeeded");
  -[AVTAvatarAttributeEditorSectionColorController willDisplayViewForIndex:](self, "willDisplayViewForIndex:", a4);
}

- (void)resetToDefaultState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__AVTAvatarAttributeEditorSectionColorController_resetToDefaultState__block_invoke;
  v2[3] = &unk_1EA51D188;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

uint64_t __69__AVTAvatarAttributeEditorSectionColorController_resetToDefaultState__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetToDefaultDisplayMode");

  return objc_msgSend(*(id *)(a1 + 32), "scrollCollectionViewToSelectedColor");
}

- (void)invalidateLayoutForNewContainerSize:(CGSize)a3
{
  void *v4;
  id v5;

  -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", a3.width, a3.height);
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AVTAvatarAttributeEditorSectionColorController viewForIndex:](self, "viewForIndex:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributeView:", v7);

}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  void *v5;
  char v6;

  if (objc_msgSend(a3, "value"))
    return 0;
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShowingSlider");

  return v6;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a4.width;
  v6 = (void *)objc_opt_class();
  -[AVTAvatarAttributeEditorSectionColorController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellSizeFittingWidth:environment:", v7, width);
  v9 = v8;
  v11 = v10;

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v12, "isShowingSlider");

  v13 = v9 + 6.0 + 10.0;
  if (!(_DWORD)v6)
    v13 = -0.0;
  v14 = v11 + v13;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  AVTColorWheelView *v15;
  AVTColorWheelView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AVTAttributeValueView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathOfExtendedIcon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
    AVTUIEditorShowAssetsName_once();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueView");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (AVTColorWheelView *)v14;
  v34 = (void *)v12;
  if (v10)
  {
    if (!v14)
    {
      v16 = [AVTColorWheelView alloc];
      objc_msgSend(v13, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v15 = -[AVTColorWheelView initWithFrame:](v16, "initWithFrame:");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v15);
    v15 = v15;
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorSection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "primaryItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extendedItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorWheelView updateWithPrimaryItems:extendedItems:](v15, "updateWithPrimaryItems:extendedItems:", v20, v23);

  }
  else
  {
    if (!v14)
    {
      v24 = [AVTAttributeValueView alloc];
      objc_msgSend(v13, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v15 = -[AVTAttributeValueView initWithFrame:](v24, "initWithFrame:");

    }
    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sectionItemAtIndex:", objc_msgSend(v6, "item"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "colorSection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorVariationStore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "color");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "colorPresetFromColor:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAttributeValueView imageLayer](v15, "imageLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorSectionColorController updateCellLayer:withColorItem:withColorPreset:](self, "updateCellLayer:withColorItem:withColorPreset:", v31, v18, v19);

    if (!AVTUIEditorShowAssetsName_once())
    {
      v32 = v34;
      goto LABEL_15;
    }
    objc_msgSend(v18, "localizedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLabelString:", v20);
  }
  v32 = v34;

LABEL_15:
  -[AVTAttributeValueView setSelectionStyle:](v15, "setSelectionStyle:", 1);
  objc_msgSend(v13, "setAttributeView:", v15);

  return v13;
}

- (void)updateCellLayer:(id)a3 withColorItem:(id)a4 withColorPreset:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, id, void *, id);

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "layerContentProvider");
  v11 = (void (**)(id, id, void *, id))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "skinColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2](v11, v7, v10, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = objc_msgSend(a5, "item");
  v9 = v8 == -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex");
  v11 = v7;
  objc_msgSend(v11, "layoutIfNeeded");
  objc_msgSend(v11, "valueView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateSelectedState:animated:", v9, 0);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHighlightedState:animated:completionBlock:", 1, 1, 0);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHighlightedState:animated:completionBlock:", 0, 1, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectSectionItemAtIndexPath:", v5);

}

- (void)colorDataSource:(id)a3 didDeselectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController setSelectedState:animated:forCellAtIndexPath:](self, "setSelectedState:animated:forCellAtIndexPath:", 0, -[AVTAvatarAttributeEditorSectionColorController dontAnimateSelection](self, "dontAnimateSelection") ^ 1, v6);

}

- (void)colorDataSource:(id)a3 didSelectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController setSelectedState:animated:forCellAtIndexPath:](self, "setSelectedState:animated:forCellAtIndexPath:", 1, -[AVTAvatarAttributeEditorSectionColorController dontAnimateSelection](self, "dontAnimateSelection") ^ 1, v8);
  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionItemAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AVTAvatarAttributeEditorSectionColorController updateSliderForSectionItemIfNeeded:](self, "updateSliderForSectionItemIfNeeded:", v10);
    if (v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __105__AVTAvatarAttributeEditorSectionColorController_colorDataSource_didSelectItemAtIndex_shouldReloadModel___block_invoke;
      v11[3] = &unk_1EA51D570;
      v11[4] = self;
      v12 = v10;
      -[AVTAvatarAttributeEditorSectionColorController animateWithSpringAnimations:completion:](self, "animateWithSpringAnimations:completion:", v11, 0);

    }
  }

}

void __105__AVTAvatarAttributeEditorSectionColorController_colorDataSource_didSelectItemAtIndex_shouldReloadModel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeEditorSectionController:didSelectSectionItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5
{
  unint64_t v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v8 = a4 & 0xFFFFFFFFFFFFFFFDLL;
  v9 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  v10 = ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) ^ ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2);
  if (v9 == ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1))
  {
    if ((v10 & 1) != 0)
    {
      -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", v12, v13);

LABEL_8:
      -[AVTAvatarAttributeEditorSectionColorController reloadData](self, "reloadData");
    }
  }
  else
  {
    if (v8 == 1)
      -[AVTAvatarAttributeEditorSectionColorController showSliderAnimated:](self, "showSliderAnimated:", 1);
    else
      -[AVTAvatarAttributeEditorSectionColorController hideSliderAnimated:](self, "hideSliderAnimated:", 1);
    -[AVTAvatarAttributeEditorSectionColorController containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", v15, v16);

    if ((v10 & 1) != 0)
      goto LABEL_8;
  }

}

- (void)setSelectedState:(BOOL)a3 animated:(BOOL)a4 forCellAtIndexPath:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSelectedState:animated:", v6, v5);

}

- (void)colorSliderVariationChanged:(double)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AVTAvatarAttributeEditorSectionColorController updateSectionItem:withVariation:](self, "updateSectionItem:withVariation:", v6, a3);
  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeEditorSectionController:didUpdateSectionItem:", self, v6);

}

- (void)colorSliderDidFinishChangingVariation:(double)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AVTAvatarAttributeEditorSectionColorController updateSectionItem:withVariation:](self, "updateSectionItem:withVariation:", v6, a3);
  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeEditorSectionController:didSelectSectionItem:", self, v6);

}

- (void)updateSectionItem:(id)a3 withVariation:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a3;
  objc_msgSend(v6, "indexPathForItem:inSection:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"), 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baseColorPreset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  objc_msgSend(v11, "colorPresetWithVariation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorSectionColorController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorVariationStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "saveColorPreset:forColor:", v13, v17);

  objc_msgSend(v9, "valueView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorController updateCellLayer:withColorItem:withColorPreset:](self, "updateCellLayer:withColorItem:withColorPreset:", v19, v7, v13);

  -[AVTAvatarAttributeEditorSectionColorController sliderContainerView](self, "sliderContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateSliderWithColorPreset:animated:", v13, 0);

}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeEditorSectionController:didSelectSectionItem:", self, v5);

}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeEditorSectionController:didUpdateSectionItem:", self, v5);

}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeEditorSectionController:didDeleteSectionItems:", self, v5);

}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AVTAvatarAttributeEditorSectionColorController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeEditorSectionControllerNeedsLayoutUpdate:", self);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__AVTAvatarAttributeEditorSectionColorController_attributeEditorSectionControllerNeedsLayoutUpdate___block_invoke;
  v5[3] = &unk_1EA51D188;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v5);
}

void __100__AVTAvatarAttributeEditorSectionColorController_attributeEditorSectionControllerNeedsLayoutUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "layoutSubviewsForIndex:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v2, "updateCollectionViewLayoutWithContainerSize:", v3, v4);

}

- (void)selectIndexPath:(id)a3
{
  -[AVTAvatarAttributeEditorSectionColorController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", self->_collectionView, a3);
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (AVTAvatarAttributeEditorSectionColorDataSource)dataSource
{
  return self->_dataSource;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (AVTAvatarColorSliderContainerView)sliderContainerView
{
  return self->_sliderContainerView;
}

- (void)setSliderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderContainerView, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (BOOL)dontAnimateSelection
{
  return self->_dontAnimateSelection;
}

- (void)setDontAnimateSelection:(BOOL)a3
{
  self->_dontAnimateSelection = a3;
}

- (BOOL)needsScrollToSelected
{
  return self->_needsScrollToSelected;
}

- (void)setNeedsScrollToSelected:(BOOL)a3
{
  self->_needsScrollToSelected = a3;
}

- (AVTAttributeEditorSectionHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sliderContainerView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_section, 0);
}

@end
