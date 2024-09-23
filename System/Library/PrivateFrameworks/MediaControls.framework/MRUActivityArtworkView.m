@implementation MRUActivityArtworkView

- (MRUActivityArtworkView)init
{
  MRUActivityArtworkView *v2;
  MRUActivityArtworkView *v3;
  CCUICAPackageView *v4;
  CCUICAPackageView *packageView;
  void *v6;
  uint64_t v7;
  UIImage *emptyImage;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MRUActivityArtworkView;
  v2 = -[MRUActivityArtworkView init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentState = 0;
    v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E0D14770]);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    -[CCUICAPackageView setUserInteractionEnabled:](v3->_packageView, "setUserInteractionEnabled:", 0);
    +[MRUAssetsProvider packageDescriptionWithName:](MRUAssetsProvider, "packageDescriptionWithName:", CFSTR("ActivityArtwork"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackageDescription:](v3->_packageView, "setPackageDescription:", v6);

    v3->_loading = 1;
    v3->_adjustsImageWhenLoading = 0;
    +[MRUAssetsProvider emptyArtwork](MRUAssetsProvider, "emptyArtwork");
    v7 = objc_claimAutoreleasedReturnValue();
    emptyImage = v3->_emptyImage;
    v3->_emptyImage = (UIImage *)v7;

    -[MRUActivityArtworkView setCurrentImage:animated:](v3, "setCurrentImage:animated:", 0, 0);
    -[MRUArtworkView artworkImageView](v3, "artworkImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[MRUArtworkView placeholderBackground](v3, "placeholderBackground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[MRUArtworkView placeholderImageView](v3, "placeholderImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[MRUActivityArtworkView addSubview:](v3, "addSubview:", v3->_packageView);
    -[MRUActivityArtworkView updatePackageAlphaAnimated:](v3, "updatePackageAlphaAnimated:", 0);
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p - loading=%u trackChanged=%u transitioning=%u state=%lu>"), objc_opt_class(), self, self->_loading, self->_currentItemHasChangedSinceArtworkLastSet, self->_transitioning, self->_currentState);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)MRUActivityArtworkView;
  -[MRUArtworkView layoutSubviews](&v9, sel_layoutSubviews);
  -[MRUActivityArtworkView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v7 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  if (v7 >= v8)
    v7 = v8;
  UIRectCenteredRect();
  -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
  -[CCUICAPackageView setScale:](self->_packageView, "setScale:", v7 / 20.0);
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  MRUActivityArtworkView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set onScreen to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    -[MRUActivityArtworkView updatePackageState](self, "updatePackageState");
  }
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  MRUActivityArtworkView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_playing != a3)
  {
    v3 = a3;
    self->_playing = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set playing to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    -[MRUActivityArtworkView updatePackageState](self, "updatePackageState");
  }
}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  MRUActivityArtworkView *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_loading != a3)
  {
    v3 = a3;
    self->_loading = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_INFO, "%{public}@ - set loading to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    -[MRUActivityArtworkView updatePackageAlphaAnimated:](self, "updatePackageAlphaAnimated:", self->_onScreen);
  }
}

- (void)setAdjustsImageWhenLoading:(BOOL)a3
{
  if (self->_adjustsImageWhenLoading != a3)
  {
    self->_adjustsImageWhenLoading = a3;
    -[MRUActivityArtworkView updatePackageAlphaAnimated:](self, "updatePackageAlphaAnimated:", self->_onScreen);
  }
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUActivityArtworkView;
  -[MRUArtworkView setAdjustsImageWhenHighlighted:](&v4, sel_setAdjustsImageWhenHighlighted_, a3);
  -[MRUActivityArtworkView updatePackageAlphaAnimated:](self, "updatePackageAlphaAnimated:", self->_onScreen);
}

- (double)artworkLoadingTimeout
{
  return 0.05;
}

- (void)setArtworkImage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  char v7;
  NSObject *v8;
  _BOOL4 loading;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *artworkIdentifier;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  objc_super v22;
  uint8_t buf[4];
  MRUActivityArtworkView *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRUArtworkView style](self, "style") == 10)
  {
    -[MRUArtworkView artworkImage](self, "artworkImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v6 = 1;
    else
      v6 = v5 == 0;
    v7 = !v6;

  }
  else
  {
    v7 = 0;
  }
  MCLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_INFO, "%{public}@ - Artwork will change to nil. Marking needsTransition", buf, 0xCu);
  }

  v22.receiver = self;
  v22.super_class = (Class)MRUActivityArtworkView;
  -[MRUArtworkView setArtworkImage:](&v22, sel_setArtworkImage_, v4);
  loading = self->_loading;
  -[MRUActivityArtworkView setLoading:](self, "setLoading:", v4 == 0);
  v10 = self->_artworkIdentifier;
  -[MRUArtworkView imageLoader](self, "imageLoader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastVendedArtworkIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringRepresentation");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  artworkIdentifier = self->_artworkIdentifier;
  self->_artworkIdentifier = v13;

  v15 = self->_artworkIdentifier;
  v16 = v10;
  v17 = v16;
  if (v16 == v15)
    v18 = 0;
  else
    v18 = -[NSString isEqual:](v16, "isEqual:", v15) ^ 1;

  if ((v7 & 1) != 0 || (self->_currentItemHasChangedSinceArtworkLastSet ? (v19 = v18) : (v19 = 0), v19 == 1))
  {
    MCLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Transitioning to new image: %{public}@", buf, 0x16u);
    }

    -[MRUActivityArtworkView transitionToImage:](self, "transitionToImage:", v4);
  }
  else
  {
    -[MRUActivityArtworkView updatePackageState](self, "updatePackageState");
    MCLogCategoryDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      v27 = 1024;
      v28 = !loading;
      _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Changing image: %{public}@, animated=%{BOOL}u", buf, 0x1Cu);
    }

    -[MRUActivityArtworkView setCurrentImage:animated:](self, "setCurrentImage:animated:", v4, !loading);
  }

}

- (void)setItemIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSObject *v8;
  NSString *v9;
  NSString *itemIdentifier;
  int v11;
  MRUActivityArtworkView *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = self->_itemIdentifier;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      MCLogCategoryDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v4;
        _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_INFO, "%{public}@ - Item identifier changed to: %{public}@. Marking needsTransition", (uint8_t *)&v11, 0x16u);
      }

      v9 = (NSString *)-[NSString copy](v4, "copy");
      itemIdentifier = self->_itemIdentifier;
      self->_itemIdentifier = v9;

      self->_currentItemHasChangedSinceArtworkLastSet = 1;
    }
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUActivityArtworkView;
  -[MRUArtworkView setHighlighted:](&v6, sel_setHighlighted_);
  v5 = !a3 && self->_onScreen;
  -[MRUActivityArtworkView updatePackageAlphaAnimated:](self, "updatePackageAlphaAnimated:", v5);
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    -[MRUActivityArtworkView setCurrentImage:animated:](self, "setCurrentImage:animated:", 0, 1);
    -[MRUActivityArtworkView updatePackageState](self, "updatePackageState");
  }
}

- (void)setCurrentImage:(id)a3 animated:(BOOL)a4
{
  UIImage *v6;
  uint64_t v7;
  NSTimer *emptyTimer;
  void *v9;
  NSTimer *v10;
  NSTimer *v11;
  UIImage *v12;
  __CFString *v13;
  CCUICAPackageView *packageView;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  id v30;
  id v31;
  UIImage *v32;
  void (**v33)(_QWORD);
  void (**v34)(_QWORD);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  UIImage *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  _QWORD v47[4];
  id v48;
  id location;

  v6 = (UIImage *)a3;
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[MRUActivityArtworkView setEmpty:](self, "setEmpty:", 0);
    -[NSTimer invalidate](self->_emptyTimer, "invalidate");
    emptyTimer = self->_emptyTimer;
    self->_emptyTimer = 0;

  }
  else if (!self->_emptyTimer)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0C99E88];
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke;
    v47[3] = &unk_1E58190C0;
    objc_copyWeak(&v48, &location);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v47, 5.0);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v11 = self->_emptyTimer;
    self->_emptyTimer = v10;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
  if (self->_empty)
  {
    v12 = self->_emptyImage;

    v6 = v12;
  }
  if (self->_currentState)
    v13 = CFSTR("albumart-back");
  else
    v13 = CFSTR("albumart-front");
  packageView = self->_packageView;
  v15 = v13;
  -[CCUICAPackageView package](packageView, "package");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "publishedObjectWithName:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "superlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");

  -[UIImage size](v6, "size");
  -[MRUArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = -[MRUArtworkView style](self, "style");
  -[UIImage size](v6, "size");
  v29 = MRUArtworkCornerRadius(v28, -[MRUArtworkView isSquare:](self, "isSquare:"));
  v35 = v7;
  v36 = 3221225472;
  v37 = __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke_2;
  v38 = &unk_1E58190E8;
  v30 = v18;
  v39 = v30;
  v42 = v21;
  v43 = v23;
  v44 = v25;
  v45 = v27;
  v46 = v29;
  v31 = v17;
  v40 = v31;
  v32 = v6;
  v41 = v32;
  v33 = (void (**)(_QWORD))_Block_copy(&v35);
  v34 = v33;
  if (a4)
  {
    v33[2](v33);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin", v35, v36, v37, v38, v39, v40);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v34[2](v34);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

void __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEmpty:", 1);
  objc_msgSend(WeakRetained, "setEmptyTimer:", 0);

}

void __51__MRUActivityArtworkView_setCurrentImage_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  v2 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "CGImage");
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setContents:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 40), "setContents:", objc_msgSend(v3, "CGColor"));

  }
}

- (void)transitionToImage:(id)a3
{
  self->_currentItemHasChangedSinceArtworkLastSet = 0;
  self->_currentState = self->_currentState == 0;
  -[MRUActivityArtworkView setCurrentImage:animated:](self, "setCurrentImage:animated:", a3, 0);
  -[MRUActivityArtworkView updatePackageState](self, "updatePackageState");
}

- (void)updatePackageState
{
  unint64_t currentState;
  const __CFString *v4;
  const __CFString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSObject *v10;
  uint8_t buf[4];
  MRUActivityArtworkView *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentState = self->_currentState;
  if (self->_loading)
  {
    if (currentState)
      v4 = CFSTR("back");
    else
      v4 = CFSTR("front");
    if (self->_playing)
      v5 = &stru_1E581FBA8;
    else
      v5 = CFSTR("-paused");
    if (!self->_empty)
      v5 = CFSTR("-loading");
  }
  else
  {
    if (currentState)
      v4 = CFSTR("back");
    else
      v4 = CFSTR("front");
    if (self->_playing)
      v5 = &stru_1E581FBA8;
    else
      v5 = CFSTR("-paused");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_currentStateName;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStateName, v6);
      -[CCUICAPackageView setStateName:](self->_packageView, "setStateName:", v6);
      MCLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_INFO, "%{public}@ - Changing package state to: %{public}@", buf, 0x16u);
      }

    }
  }

}

- (void)updatePackageAlphaAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  MRUActivityArtworkView *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[MRUArtworkView adjustsImageWhenHighlighted](self, "adjustsImageWhenHighlighted"))
    v5 = -[MRUActivityArtworkView isHighlighted](self, "isHighlighted");
  else
    v5 = 0;
  v6 = -[MRUActivityArtworkView adjustsImageWhenLoading](self, "adjustsImageWhenLoading");
  if (v6)
    v6 = -[MRUActivityArtworkView isLoading](self, "isLoading");
  if (v5 | v6)
    v7 = 0.2;
  else
    v7 = 1.0;
  -[MRUActivityArtworkView packageView](self, "packageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v10 = vabdd_f64(v9, v7);

  if (v10 > 2.22044605e-16)
  {
    MCLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544386;
      v15 = self;
      v16 = 2048;
      v17 = v7;
      v18 = 1024;
      v19 = v3;
      v20 = 1024;
      v21 = -[MRUActivityArtworkView isLoading](self, "isLoading");
      v22 = 1024;
      v23 = -[MRUActivityArtworkView isHighlighted](self, "isHighlighted");
      _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_INFO, "%{public}@ - Changing package alpha to: %f animated:%{BOOL}u. highlighted:%{BOOL}u loading:%{BOOL}u", buf, 0x28u);
    }

    if (v3)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __53__MRUActivityArtworkView_updatePackageAlphaAnimated___block_invoke;
      v13[3] = &unk_1E5819110;
      v13[4] = self;
      *(double *)&v13[5] = v7;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v13, 0, 0.25, 0.0);
    }
    else
    {
      -[MRUActivityArtworkView packageView](self, "packageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", v7);

    }
  }
}

void __53__MRUActivityArtworkView_updatePackageAlphaAnimated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "packageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)adjustsImageWhenLoading
{
  return self->_adjustsImageWhenLoading;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_artworkIdentifier, a3);
}

- (BOOL)currentItemHasChangedSinceArtworkLastSet
{
  return self->_currentItemHasChangedSinceArtworkLastSet;
}

- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3
{
  self->_currentItemHasChangedSinceArtworkLastSet = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (NSString)currentStateName
{
  return self->_currentStateName;
}

- (void)setCurrentStateName:(id)a3
{
  objc_storeStrong((id *)&self->_currentStateName, a3);
}

- (NSTimer)emptyTimer
{
  return self->_emptyTimer;
}

- (void)setEmptyTimer:(id)a3
{
  objc_storeStrong((id *)&self->_emptyTimer, a3);
}

- (UIImage)emptyImage
{
  return self->_emptyImage;
}

- (void)setEmptyImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyImage, a3);
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_emptyTimer, 0);
  objc_storeStrong((id *)&self->_currentStateName, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
