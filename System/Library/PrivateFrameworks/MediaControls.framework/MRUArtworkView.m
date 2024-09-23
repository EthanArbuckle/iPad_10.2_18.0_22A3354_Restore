@implementation MRUArtworkView

- (MRUArtworkView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUArtworkView *v7;
  uint64_t v8;
  NSHashTable *observers;
  void *v10;
  id v11;
  uint64_t v12;
  UIImageView *placeholderImageView;
  MRUShadowView *v14;
  MRUShadowView *artworkShadowView;
  uint64_t v16;
  UIImageView *artworkImageView;
  uint64_t v18;
  UIPointerInteraction *pointerInteraction;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  MRUArtworkController *v23;
  MRUArtworkController *controller;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  MRUArtworkView *v30;
  _QWORD v31[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)MRUArtworkView;
  v7 = -[MRUArtworkView initWithFrame:](&v26, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v31[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[MRUArtworkView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v10, sel_userInterfaceStyleChanged);

    -[MRUArtworkView updatePlaceholderBackground](v7, "updatePlaceholderBackground");
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    placeholderImageView = v7->_placeholderImageView;
    v7->_placeholderImageView = (UIImageView *)v12;

    -[UIImageView setUserInteractionEnabled:](v7->_placeholderImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v7->_placeholderImageView, "setContentMode:", 1);
    -[MRUArtworkView addSubview:](v7, "addSubview:", v7->_placeholderImageView);
    v14 = objc_alloc_init(MRUShadowView);
    artworkShadowView = v7->_artworkShadowView;
    v7->_artworkShadowView = v14;

    -[MRUArtworkView addSubview:](v7, "addSubview:", v7->_artworkShadowView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    artworkImageView = v7->_artworkImageView;
    v7->_artworkImageView = (UIImageView *)v16;

    -[UIImageView setUserInteractionEnabled:](v7->_artworkImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v7->_artworkImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v7->_artworkImageView, "setClipsToBounds:", 1);
    -[MRUArtworkView addSubview:](v7, "addSubview:", v7->_artworkImageView);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
    pointerInteraction = v7->_pointerInteraction;
    v7->_pointerInteraction = (UIPointerInteraction *)v18;

    -[UIPointerInteraction setEnabled:](v7->_pointerInteraction, "setEnabled:", 0);
    -[MRUArtworkView addInteraction:](v7, "addInteraction:", v7->_pointerInteraction);
    v20 = +[MRUFeatureFlagProvider isArtworkControllerEnabled](MRUFeatureFlagProvider, "isArtworkControllerEnabled");
    v7->_isArtworkControllerEnabled = v20;
    if (v20)
    {
      MCLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v28 = v22;
        v29 = 2048;
        v30 = v7;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_INFO, "%@<%p> initializing MRUArtworkController", buf, 0x16u);
      }

      v23 = objc_alloc_init(MRUArtworkController);
      controller = v7->_controller;
      v7->_controller = v23;

      -[MRUArtworkController setDelegate:](v7->_controller, "setDelegate:", v7);
    }
    v7->_showPlaceholder = 1;
    v7->_adjustsImageWhenHighlighted = 1;
    v7->_contentScale = 1.0;
    -[MRUArtworkView updateStyle](v7, "updateStyle");
    -[MRUArtworkView updateVisibility](v7, "updateVisibility");
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)MRUArtworkView;
  -[MRUArtworkView layoutSubviews](&v23, sel_layoutSubviews);
  -[MRUArtworkView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_placeholderBackground, "setFrame:");
  -[MRUArtworkView artworkFrame](self, "artworkFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIImageView setFrame:](self->_artworkImageView, "setFrame:");
  v19 = MRUArtworkShadowInset(self->_style);
  -[MRUShadowView setFrame:](self->_artworkShadowView, "setFrame:", v12 + v22, v14 + v19, v16 - (v22 + v20), v18 - (v19 + v21));
  -[UIImageView sizeThatFits:](self->_placeholderImageView, "sizeThatFits:", v8, v10);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectGetWidth(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGRectGetHeight(v25);
  UIRectCenteredRect();
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  -[MRUArtworkView updateArtworkFittingSize](self, "updateArtworkFittingSize");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  if (result.width >= result.height)
    result.width = result.height;
  width = result.width;
  result.height = width;
  return result;
}

- (void)userInterfaceStyleChanged
{
  if (self->_style == 1)
    -[MRUArtworkView updateStyle](self, "updateStyle");
}

- (double)artworkLoadingTimeout
{
  return 1.0;
}

- (void)setArtwork:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_artwork, a3);
  v5 = a3;
  objc_msgSend(v5, "catalog");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUArtworkView setCatalog:](self, "setCatalog:", v6);
}

- (void)setCatalog:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 isArtworkControllerEnabled;
  void *v9;
  _BOOL4 v10;
  MRUImageLoader *v11;
  MRUImageLoader *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  MSVTimer *v18;
  MSVTimer *artworkTimer;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  MRUArtworkView *v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_catalog, a3);
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_opt_class();
    isArtworkControllerEnabled = self->_isArtworkControllerEnabled;
    *(_DWORD *)buf = 138412802;
    v27 = v7;
    v28 = 2048;
    v29 = self;
    v30 = 1024;
    v31 = isArtworkControllerEnabled;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_INFO, "%@<%p> setCatalog isArtworkControllerEnabled:%{BOOL}u", buf, 0x1Cu);
  }

  if (self->_isArtworkControllerEnabled)
  {
    -[MRUArtworkView updateArtworkFittingSize](self, "updateArtworkFittingSize");
    -[MRUArtworkController setCatalog:](self->_controller, "setCatalog:", v5);
  }
  else
  {
    -[MRUArtworkView imageLoader](self, "imageLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      objc_initWeak((id *)buf, self);
      v11 = [MRUImageLoader alloc];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __29__MRUArtworkView_setCatalog___block_invoke;
      v24[3] = &unk_1E5818BF0;
      objc_copyWeak(&v25, (id *)buf);
      v12 = -[MRUImageLoader initWithDestination:imageHandler:](v11, "initWithDestination:imageHandler:", self, v24);
      -[MRUArtworkView setImageLoader:](self, "setImageLoader:", v12);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    if (v5)
    {
      -[MRUArtworkView imageLoader](self, "imageLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "wouldLoadNewImageForCatalog:", v5);

      if (v14)
      {
        objc_initWeak((id *)buf, self);
        v15 = (void *)MEMORY[0x1E0D4D110];
        -[MRUArtworkView artworkLoadingTimeout](self, "artworkLoadingTimeout");
        v17 = v16;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __29__MRUArtworkView_setCatalog___block_invoke_14;
        v21[3] = &unk_1E5818C18;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v5;
        objc_msgSend(v15, "timerWithInterval:repeats:block:", 0, v21, v17);
        v18 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
        artworkTimer = self->_artworkTimer;
        self->_artworkTimer = v18;

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
    }
    -[MRUArtworkView updateArtworkFittingSize](self, "updateArtworkFittingSize");
    -[MRUArtworkView imageLoader](self, "imageLoader");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateCatalog:", v5);

  }
}

void __29__MRUArtworkView_setCatalog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      MCLogCategoryImageLoading();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412802;
        v11 = objc_opt_class();
        v12 = 2048;
        v13 = WeakRetained;
        v14 = 2114;
        v15 = v6;
        _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_ERROR, "%@<%p> Image load failed with error: %{public}@.", (uint8_t *)&v10, 0x20u);
      }

    }
    objc_msgSend(WeakRetained, "artworkTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    objc_msgSend(WeakRetained, "setArtworkImage:", v5);
  }

}

void __29__MRUArtworkView_setCatalog___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  MCLogCategoryImageLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v4;
    v8 = 2048;
    v9 = WeakRetained;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_ERROR, "%@<%p> clearing old artwork while waiting for catalog=%p", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(WeakRetained, "setArtworkImage:", 0);
}

- (void)setArtworkImage:(id)a3
{
  id v5;
  NSHashTable *v6;
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
  v5 = a3;
  objc_storeStrong((id *)&self->_artworkImage, a3);
  -[UIImageView setImage:](self->_artworkImageView, "setImage:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "artworkView:didChangeArtworkImage:", self, v5, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[MRUArtworkView updateStyle](self, "updateStyle");
  -[MRUArtworkView updateVisibility](self, "updateVisibility");
  -[MRUArtworkView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setPlaceholderImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_placeholderImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v5);

  -[MRUArtworkView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUArtworkView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MRUArtworkView updateStyle](self, "updateStyle");
    -[MRUArtworkView updateVisibility](self, "updateVisibility");
    -[MRUArtworkView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    -[MRUArtworkView updateVisibility](self, "updateVisibility");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUArtworkView;
  -[MRUArtworkView setHighlighted:](&v7, sel_setHighlighted_);
  if (-[MRUArtworkView adjustsImageWhenHighlighted](self, "adjustsImageWhenHighlighted"))
  {
    if (v3)
    {
      -[MRUArtworkView artworkImageView](self, "artworkImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlpha:", 0.2);

    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __33__MRUArtworkView_setHighlighted___block_invoke;
      v6[3] = &unk_1E5818C88;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v6, 0, 0.25, 0.0);
    }
  }
}

void __33__MRUArtworkView_setHighlighted___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "artworkImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  UIRectGetCenter();
  v9 = v8;
  v11 = v10;
  -[MRUArtworkView center](self, "center");
  v14 = v13 != v11 || v12 != v9;
  if (v14)
    -[MRUArtworkView setCenter:](self, "setCenter:", v9, v11);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v15 = CGRectGetWidth(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v16 = CGRectGetHeight(v18);
  -[MRUArtworkView bounds](self, "bounds");
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v15;
  v20.size.height = v16;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[MRUArtworkView setBounds:](self, "setBounds:", 0.0, 0.0, v15, v16);
    goto LABEL_10;
  }
  if (v14)
  {
LABEL_10:
    -[MRUArtworkView setNeedsLayout](self, "setNeedsLayout");
    -[MRUArtworkView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setUseVisualEffectPlaceholder:(BOOL)a3
{
  if (self->_useVisualEffectPlaceholder != a3)
  {
    self->_useVisualEffectPlaceholder = a3;
    -[MRUArtworkView updatePlaceholderBackground](self, "updatePlaceholderBackground");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUArtworkView updateStyle](self, "updateStyle");
  }
}

- (void)prepareForReuse
{
  -[MRUArtworkView setCatalog:](self, "setCatalog:", 0);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[UIImageView frame](self->_artworkImageView, "frame", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3B30];
  v8 = (void *)MEMORY[0x1E0DC3508];
  -[UIImageView frame](self->_artworkImageView, "frame");
  objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v9, v10, v11, v12, MRUArtworkCornerRadius(self->_style, -[MRUArtworkView isSquareArtwork](self, "isSquareArtwork")));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shapeWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  MRUArtworkView *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = objc_opt_class();
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_INFO, "%{public}@<%p> controller:didStartLoadingImageForCatalog:", (uint8_t *)&v9, 0x16u);
  }

  -[MRUArtwork catalog](self->_artwork, "catalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isArtworkVisuallyIdenticalToCatalog:", v5);

  if (v8)
    -[MRUArtworkView setArtworkImage:](self, "setArtworkImage:", 0);
}

- (void)controller:(id)a3 didLoadArtworkImage:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  MRUArtworkView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = objc_opt_class();
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_INFO, "%{public}@<%p> controller:didLoadArtworkImage:", (uint8_t *)&v7, 0x16u);
  }

  -[MRUArtworkView setArtworkImage:](self, "setArtworkImage:", v5);
}

- (void)artworkLoadingDidTimeoutInController:(id)a3
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  MRUArtworkView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_INFO, "%{public}@<%p> artworkLoadingDidTimeoutInController:", (uint8_t *)&v5, 0x16u);
  }

  -[MRUArtworkView setArtworkImage:](self, "setArtworkImage:", 0);
}

- (void)updatePlaceholderBackground
{
  UIView *v3;
  UIView *placeholderBackground;

  -[UIView removeFromSuperview](self->_placeholderBackground, "removeFromSuperview");
  if (-[MRUArtworkView useVisualEffectPlaceholder](self, "useVisualEffectPlaceholder"))
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 1);
  else
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterTertiaryMaterial");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  placeholderBackground = self->_placeholderBackground;
  self->_placeholderBackground = v3;

  -[UIView setUserInteractionEnabled:](self->_placeholderBackground, "setUserInteractionEnabled:", 0);
  -[UIView setClipsToBounds:](self->_placeholderBackground, "setClipsToBounds:", 1);
  -[MRUArtworkView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_placeholderBackground, 0);
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_placeholderImageView);
}

- (void)updateVisibility
{
  int64_t style;
  _BOOL8 v4;
  _BOOL8 v5;
  UIView *placeholderBackground;
  UIImageView *placeholderImageView;
  _BOOL8 v8;
  double v9;

  style = self->_style;
  switch(style)
  {
    case 7:
      v5 = self->_artworkImage != 0;
      placeholderBackground = self->_placeholderBackground;
LABEL_8:
      -[UIView setHidden:](placeholderBackground, "setHidden:", v5);
      placeholderImageView = self->_placeholderImageView;
      v4 = 1;
LABEL_13:
      -[UIImageView setHidden:](placeholderImageView, "setHidden:", v4);
      v9 = 0.0;
      goto LABEL_17;
    case 9:
      placeholderBackground = self->_placeholderBackground;
      v5 = 1;
      goto LABEL_8;
    case 8:
      -[UIView setHidden:](self->_placeholderBackground, "setHidden:", self->_artworkImage != 0);
      v4 = !self->_showPlaceholder || self->_artworkImage != 0;
      placeholderImageView = self->_placeholderImageView;
      goto LABEL_13;
  }
  -[UIView setHidden:](self->_placeholderBackground, "setHidden:", self->_artworkImage != 0);
  v8 = !self->_showPlaceholder || self->_artworkImage != 0;
  -[UIImageView setHidden:](self->_placeholderImageView, "setHidden:", v8);
  v9 = 1.0;
  if (!self->_artworkImage)
    v9 = 0.0;
LABEL_17:
  -[MRUShadowView setAlpha:](self->_artworkShadowView, "setAlpha:", v9);
}

- (void)updateStyle
{
  double v3;
  int64_t style;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v3 = MRUArtworkCornerRadius(self->_style, -[MRUArtworkView isSquareArtwork](self, "isSquareArtwork"))
     * self->_contentScale;
  -[UIView _setContinuousCornerRadius:](self->_placeholderBackground, "_setContinuousCornerRadius:", v3);
  -[UIImageView _setContinuousCornerRadius:](self->_artworkImageView, "_setContinuousCornerRadius:", v3);
  -[MRUShadowView _setContinuousCornerRadius:](self->_artworkShadowView, "_setContinuousCornerRadius:", v3);
  -[MRUShadowView setOffset:](self->_artworkShadowView, "setOffset:", MRUArtworkShadowOffset());
  -[MRUShadowView setRadius:](self->_artworkShadowView, "setRadius:", MRUArtworkShadowRadius(self->_style));
  style = self->_style;
  -[MRUArtworkView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MRUArtworkShadowOpacity(style, objc_msgSend(v5, "userInterfaceStyle"));
  *(float *)&v6 = v6;
  -[MRUShadowView setOpacity:](self->_artworkShadowView, "setOpacity:", v6);

  MRUArtworkShadowColor((char *)self->_style);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUShadowView setColor:](self->_artworkShadowView, "setColor:", v7);

  MRUArtworkShadowFilter(self->_style);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUShadowView setCompositingFilter:](self->_artworkShadowView, "setCompositingFilter:", v8);

  MRUArtworkPlaceholderSymbolConfiguration(self->_style);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_placeholderImageView, "setPreferredSymbolConfiguration:", v9);

}

- (BOOL)isSquareArtwork
{
  -[UIImage size](self->_artworkImage, "size");
  return -[MRUArtworkView isSquare:](self, "isSquare:");
}

- (BOOL)isSquare:(CGSize)a3
{
  double v4;

  if (a3.width == *MEMORY[0x1E0C9D820] && a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 1;
  v4 = 1.0 - a3.width / a3.height;
  if (v4 < 0.0)
    v4 = -v4;
  return v4 < 0.03;
}

- (CGRect)artworkFrame
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
  CGRect result;

  -[UIImage size](self->_artworkImage, "size");
  v4 = v3;
  v6 = v5;
  -[MRUArtworkView bounds](self, "bounds");
  -[MRUArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:", v4, v6, v7, v8, v9, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)artworkFrameForSize:(CGSize)a3 availableBounds:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  if (!-[MRUArtworkView isSquare:](self, "isSquare:"))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (!CGRectIsEmpty(v19) && v9 > 0.0 && v8 > 0.0)
    {
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      CGRectGetWidth(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      CGRectGetHeight(v21);
LABEL_8:
      UIRectCenteredRect();
      x = v11;
      y = v12;
      width = v13;
      height = v14;
      goto LABEL_9;
    }
  }
  if (!-[MRUArtworkView isSquare:](self, "isSquare:", width, height))
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetWidth(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetHeight(v23);
    goto LABEL_8;
  }
LABEL_9:
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)updateArtworkFittingSize
{
  double v3;
  double v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double height;
  double width;
  void *v9;
  double v10;
  id v11;

  -[MRUArtworkView bounds](self, "bounds");
  v5 = self->_preferredContentSize.width == *MEMORY[0x1E0C9D820];
  v6 = self->_preferredContentSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v5 && v6)
    height = v4;
  else
    height = self->_preferredContentSize.height;
  if (v5 && v6)
    width = v3;
  else
    width = self->_preferredContentSize.width;
  if (self->_isArtworkControllerEnabled)
  {
    -[MRUArtworkView controller](self, "controller");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredContentSize:", width, height);
  }
  else
  {
    -[MRUArtworkView imageLoader](self, "imageLoader");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUArtworkView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayScale");
    objc_msgSend(v11, "updateFittingSize:scale:", width, height, v10);

  }
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (BOOL)useVisualEffectPlaceholder
{
  return self->_useVisualEffectPlaceholder;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUArtworkController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (MRUShadowView)artworkShadowView
{
  return self->_artworkShadowView;
}

- (void)setArtworkShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkShadowView, a3);
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTimer, a3);
}

- (int64_t)failedRetryCount
{
  return self->_failedRetryCount;
}

- (void)setFailedRetryCount:(int64_t)a3
{
  self->_failedRetryCount = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isArtworkControllerEnabled
{
  return self->_isArtworkControllerEnabled;
}

- (void)setIsArtworkControllerEnabled:(BOOL)a3
{
  self->_isArtworkControllerEnabled = a3;
}

- (UIView)placeholderBackground
{
  return self->_placeholderBackground;
}

- (void)setPlaceholderBackground:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderBackground, a3);
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (void)setArtworkLoadingTimeout:(double)a3
{
  self->_artworkLoadingTimeout = a3;
}

- (MRUImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoader, a3);
}

- (BOOL)adjustsImageWhenHighlighted
{
  return self->_adjustsImageWhenHighlighted;
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  self->_adjustsImageWhenHighlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_placeholderBackground, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_artworkShadowView, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end
