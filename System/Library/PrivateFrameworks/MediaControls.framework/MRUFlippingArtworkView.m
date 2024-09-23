@implementation MRUFlippingArtworkView

- (MRUFlippingArtworkView)initWithFrame:(CGRect)a3
{
  MRUFlippingArtworkView *v3;
  uint64_t v4;
  NSHashTable *observers;
  MRUShadowView *v6;
  MRUShadowView *artworkShadowView;
  MRUFlippingArtworkLayer *v8;
  MRUFlippingArtworkLayer *artworkLayer;
  void *v10;
  void *v11;
  MRUArtworkController *v12;
  MRUArtworkController *controller;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRUFlippingArtworkView;
  v3 = -[MRUFlippingArtworkView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v3->_currentItemHasChangedSinceArtworkLastSet = 0;
    v6 = objc_alloc_init(MRUShadowView);
    artworkShadowView = v3->_artworkShadowView;
    v3->_artworkShadowView = v6;

    -[MRUFlippingArtworkView addSubview:](v3, "addSubview:", v3->_artworkShadowView);
    v8 = objc_alloc_init(MRUFlippingArtworkLayer);
    artworkLayer = v3->_artworkLayer;
    v3->_artworkLayer = v8;

    -[MRUFlippingArtworkLayer setAnchorPoint:](v3->_artworkLayer, "setAnchorPoint:", 0.5, 0.5);
    -[MRUFlippingArtworkView traitCollection](v3, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    -[MRUFlippingArtworkLayer setContentsScale:](v3->_artworkLayer, "setContentsScale:");

    -[MRUFlippingArtworkView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v3->_artworkLayer);

    v12 = objc_alloc_init(MRUArtworkController);
    controller = v3->_controller;
    v3->_controller = v12;

    -[MRUArtworkController setArtworkLoadingTimeout:](v3->_controller, "setArtworkLoadingTimeout:", 3.0);
    -[MRUArtworkController setDelegate:](v3->_controller, "setDelegate:", v3);
    v3->_dimsWhenPaused = 0;
    -[MRUFlippingArtworkView setArtworkImage:](v3, "setArtworkImage:", 0);
    -[MRUFlippingArtworkView updateStyle](v3, "updateStyle");
    -[MRUFlippingArtworkView updateOpacity](v3, "updateOpacity");
    -[MRUFlippingArtworkView setPlaying:](v3, "setPlaying:", 0);
  }
  return v3;
}

- (void)layoutSubviews
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUFlippingArtworkView;
  -[MRUFlippingArtworkView layoutSubviews](&v17, sel_layoutSubviews);
  -[MRUFlippingArtworkView artworkFrame](self, "artworkFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUFlippingArtworkLayer setFrame:](self->_artworkLayer, "setFrame:");
  -[MRUFlippingArtworkView bounds](self, "bounds");
  -[MRUArtworkController setPreferredContentSize:](self->_controller, "setPreferredContentSize:", v11, v12);
  -[MRUFlippingArtworkView shadowViewInsets](self, "shadowViewInsets");
  -[MRUShadowView setFrame:](self->_artworkShadowView, "setFrame:", v4 + v16, v6 + v13, v8 - (v16 + v14), v10 - (v13 + v15));
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
    -[MRUFlippingArtworkView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setItemIdentifier:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *itemIdentifier;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_itemIdentifier;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      itemIdentifier = self->_itemIdentifier;
      self->_itemIdentifier = v6;

      self->_currentItemHasChangedSinceArtworkLastSet = 1;
    }
  }

}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _OWORD v6[2];
  uint64_t v7;
  _QWORD v8[5];

  if (self->_playing != a3)
  {
    v3 = a3;
    self->_playing = a3;
    -[MRUFlippingArtworkView artworkLayer](self, "artworkLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaying:", v3);

    -[MRUFlippingArtworkView setNeedsLayout](self, "setNeedsLayout");
    if (self->_onScreen)
    {
      v8[1] = 3221225472;
      v8[2] = __37__MRUFlippingArtworkView_setPlaying___block_invoke;
      v8[3] = &unk_1E5818C88;
      v8[4] = self;
      v6[0] = MRUFlippingArtworkSpringParameters;
      v6[1] = unk_1AAAD5790;
      v7 = 0;
      v8[0] = MEMORY[0x1E0C809B0];
      objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateWithSpringParameters:options:animations:", v6, 4, v8);
    }
  }
}

uint64_t __37__MRUFlippingArtworkView_setPlaying___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setDimsWhenPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_dimsWhenPaused != a3)
  {
    v3 = a3;
    self->_dimsWhenPaused = a3;
    -[MRUFlippingArtworkView artworkLayer](self, "artworkLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDimsWhenPaused:", v3);

  }
}

- (void)setArtwork:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_artwork, a3);
  objc_msgSend(v7, "catalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUArtworkController setCatalog:](self->_controller, "setCatalog:", v5);

  objc_msgSend(v7, "catalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[MRUFlippingArtworkView updatePlaceholder](self, "updatePlaceholder");

}

- (void)setArtwork:(id)a3 transitionDirection:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[MRUFlippingArtworkView setPendingTransitionDirection:](self, "setPendingTransitionDirection:", a4);
  -[MRUFlippingArtworkView setArtwork:](self, "setArtwork:", v6);

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MRUFlippingArtworkView updateStyle](self, "updateStyle");
    -[MRUFlippingArtworkView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setArtworkImageWithThrottle:(id)a3 updatePlaceholder:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  MSVTimer *v9;
  MSVTimer *setArtworkThrottleTimer;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[MSVTimer invalidate](self->_setArtworkThrottleTimer, "invalidate");
  v7 = (void *)MEMORY[0x1E0D4D110];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__MRUFlippingArtworkView_setArtworkImageWithThrottle_updatePlaceholder___block_invoke;
  v11[3] = &unk_1E5819228;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "timerWithInterval:repeats:block:", 0, v11, 0.1);
  v9 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
  setArtworkThrottleTimer = self->_setArtworkThrottleTimer;
  self->_setArtworkThrottleTimer = v9;

}

uint64_t __72__MRUFlippingArtworkView_setArtworkImageWithThrottle_updatePlaceholder___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setArtworkImage:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "setSetArtworkThrottleTimer:", 0);
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "updatePlaceholder");
  return result;
}

- (void)setArtworkImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;
  UIImage *artworkImage;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  UIImage *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (UIImage *)a3;
  v6 = v5;
  artworkImage = self->_artworkImage;
  if (v5 && artworkImage == v5)
    goto LABEL_20;
  if (!-[MRUFlippingArtworkView shouldTransitionFromImage:toImage:](self, "shouldTransitionFromImage:toImage:", artworkImage, v5))
  {
    self->_currentItemHasChangedSinceArtworkLastSet = 0;
    goto LABEL_9;
  }
  v8 = -[MRUFlippingArtworkView isOnScreen](self, "isOnScreen");
  self->_currentItemHasChangedSinceArtworkLastSet = 0;
  if (!v8)
  {
LABEL_9:
    MCLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v24 = v6;
      v25 = 1024;
      LODWORD(v26) = -[MRUFlippingArtworkView isOnScreen](self, "isOnScreen");
      _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].View view will set image:<%p> to current layer onScreen:%{BOOL}u", buf, 0x12u);
    }

    -[MRUFlippingArtworkView artworkLayer](self, "artworkLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImageToCurrentLayer:animated:", -[UIImage CGImage](objc_retainAutorelease(v6), "CGImage"), -[MRUFlippingArtworkView isOnScreen](self, "isOnScreen"));
    goto LABEL_12;
  }
  MCLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    MRUFlippingArtworkTransitionDirectionDescription(-[MRUFlippingArtworkView pendingTransitionDirection](self, "pendingTransitionDirection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v24 = v6;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].View view will transition to image:<%p> direction:%@", buf, 0x16u);

  }
  -[MRUFlippingArtworkView artworkLayer](self, "artworkLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionToImage:transitionDirection:", -[UIImage CGImage](objc_retainAutorelease(v6), "CGImage"), -[MRUFlippingArtworkView pendingTransitionDirection](self, "pendingTransitionDirection"));
LABEL_12:

  objc_storeStrong((id *)&self->_artworkImage, a3);
  -[MRUFlippingArtworkView setNeedsLayout](self, "setNeedsLayout");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_observers;
  v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "artworkView:didChangeArtworkImage:", self, v6, (_QWORD)v18);
      }
      v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[MRUFlippingArtworkView updateOpacity](self, "updateOpacity");
LABEL_20:

}

- (void)setPlaceholderSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderSymbolName, a3);
  -[MRUFlippingArtworkView updatePlaceholder](self, "updatePlaceholder");
}

- (void)updatePlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_artworkImage || !self->_placeholderSymbolName)
  {
    -[MRUFlippingArtworkLayer setPlaceholderImage:](self->_artworkLayer, "setPlaceholderImage:", 0);
  }
  else
  {
    MRUArtworkPlaceholderSymbolConfiguration(self->_style);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", self->_placeholderSymbolName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithSymbolConfiguration:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    -[MRUFlippingArtworkLayer setPlaceholderImage:](self->_artworkLayer, "setPlaceholderImage:", objc_msgSend(v6, "CGImage"));

  }
  -[MRUFlippingArtworkView updateOpacity](self, "updateOpacity");
}

- (BOOL)shouldTransitionFromImage:(id)a3 toImage:(id)a4
{
  BOOL v7;
  BOOL currentItemHasChangedSinceArtworkLastSet;
  BOOL v9;
  char v10;

  v7 = a3 == a4 || !self->_currentItemHasChangedSinceArtworkLastSet;
  if (-[MRUFlippingArtworkLayer placeholderImage](self->_artworkLayer, "placeholderImage"))
    currentItemHasChangedSinceArtworkLastSet = self->_currentItemHasChangedSinceArtworkLastSet;
  else
    currentItemHasChangedSinceArtworkLastSet = 0;
  if (a3)
    v9 = 1;
  else
    v9 = a4 == 0;
  v10 = !v9 || v7;
  return currentItemHasChangedSinceArtworkLastSet | v10 ^ 1;
}

- (void)controller:(id)a3 didStartLoadingImageForCatalog:(id)a4
{
  MRUArtwork *artwork;
  id v6;
  void *v7;
  int v8;

  artwork = self->_artwork;
  v6 = a4;
  -[MRUArtwork catalog](artwork, "catalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isArtworkVisuallyIdenticalToCatalog:", v6);

  if (v8)
    -[MRUFlippingArtworkView setArtworkImageWithThrottle:updatePlaceholder:](self, "setArtworkImageWithThrottle:updatePlaceholder:", 0, 0);
}

- (void)controller:(id)a3 didLoadArtworkImage:(id)a4
{
  -[MRUFlippingArtworkView setArtworkImageWithThrottle:updatePlaceholder:](self, "setArtworkImageWithThrottle:updatePlaceholder:", a4, 1);
}

- (void)artworkLoadingDidTimeoutInController:(id)a3
{
  -[MRUFlippingArtworkView setArtworkImageWithThrottle:updatePlaceholder:](self, "setArtworkImageWithThrottle:updatePlaceholder:", 0, 1);
}

- (BOOL)isSquareArtwork
{
  -[UIImage size](self->_artworkImage, "size");
  return -[MRUFlippingArtworkView isSquare:](self, "isSquare:");
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
  -[MRUFlippingArtworkView bounds](self, "bounds");
  -[MRUFlippingArtworkView artworkFrameForSize:availableBounds:](self, "artworkFrameForSize:availableBounds:", v4, v6, v7, v8, v9, v10);
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
  if (!-[MRUFlippingArtworkView isSquare:](self, "isSquare:"))
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
  if (!-[MRUFlippingArtworkView isSquare:](self, "isSquare:", width, height))
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

- (void)updateOpacity
{
  double v3;
  _QWORD v4[6];

  v3 = 1.0;
  if (!self->_artworkImage)
  {
    if (-[MRUFlippingArtworkLayer placeholderImage](self->_artworkLayer, "placeholderImage"))
      v3 = 1.0;
    else
      v3 = 0.2;
  }
  if (-[MRUFlippingArtworkView isOnScreen](self, "isOnScreen"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__MRUFlippingArtworkView_updateOpacity__block_invoke;
    v4[3] = &unk_1E5819110;
    v4[4] = self;
    *(double *)&v4[5] = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v4, 0, 0.25, 0.0);
  }
  else
  {
    -[MRUFlippingArtworkView setAlpha:](self, "setAlpha:", v3);
  }
}

uint64_t __39__MRUFlippingArtworkView_updateOpacity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)updateStyle
{
  double v3;
  int64_t style;
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[MRUFlippingArtworkLayer setArtworkStyle:](self->_artworkLayer, "setArtworkStyle:", self->_style);
  v3 = MRUArtworkCornerRadius(self->_style, -[MRUFlippingArtworkView isSquareArtwork](self, "isSquareArtwork"));
  -[MRUFlippingArtworkLayer setArtworkCornerRadius:](self->_artworkLayer, "setArtworkCornerRadius:");
  -[MRUShadowView _setContinuousCornerRadius:](self->_artworkShadowView, "_setContinuousCornerRadius:", v3);
  -[MRUShadowView setOffset:](self->_artworkShadowView, "setOffset:", MRUArtworkShadowOffset());
  -[MRUShadowView setRadius:](self->_artworkShadowView, "setRadius:", MRUArtworkShadowRadius(self->_style));
  style = self->_style;
  -[MRUFlippingArtworkView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MRUArtworkShadowOpacity(style, objc_msgSend(v5, "userInterfaceStyle"));
  *(float *)&v6 = v6;
  -[MRUShadowView setOpacity:](self->_artworkShadowView, "setOpacity:", v6);

  MRUArtworkShadowColor((char *)self->_style);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUShadowView setColor:](self->_artworkShadowView, "setColor:", v7);

  MRUArtworkShadowFilter(self->_style);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUShadowView setCompositingFilter:](self->_artworkShadowView, "setCompositingFilter:", v8);

}

- (void)updateVisualStyling
{
  id v3;

  -[MRUVisualStylingProvider primaryColor](self->_stylingProvider, "primaryColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[MRUFlippingArtworkLayer setPlaceholderImageTintColor:](self->_artworkLayer, "setPlaceholderImageTintColor:", objc_msgSend(v3, "CGColor"));

}

- (UIEdgeInsets)shadowViewInsets
{
  _BOOL4 playing;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  MRUArtworkShadowInset(self->_style);
  playing = self->_playing;
  -[MRUFlippingArtworkView bounds](self, "bounds");
  MRUFlippingArtworkInsets(playing, v4, v5);
  UIEdgeInsetsAdd();
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)dimsWhenPaused
{
  return self->_dimsWhenPaused;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (NSString)placeholderSymbolName
{
  return self->_placeholderSymbolName;
}

- (int64_t)style
{
  return self->_style;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUFlippingArtworkLayer)artworkLayer
{
  return self->_artworkLayer;
}

- (void)setArtworkLayer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkLayer, a3);
}

- (MRUShadowView)artworkShadowView
{
  return self->_artworkShadowView;
}

- (void)setArtworkShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkShadowView, a3);
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (BOOL)currentItemHasChangedSinceArtworkLastSet
{
  return self->_currentItemHasChangedSinceArtworkLastSet;
}

- (void)setCurrentItemHasChangedSinceArtworkLastSet:(BOOL)a3
{
  self->_currentItemHasChangedSinceArtworkLastSet = a3;
}

- (MRUArtworkController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int64_t)pendingTransitionDirection
{
  return self->_pendingTransitionDirection;
}

- (void)setPendingTransitionDirection:(int64_t)a3
{
  self->_pendingTransitionDirection = a3;
}

- (MSVTimer)setArtworkThrottleTimer
{
  return self->_setArtworkThrottleTimer;
}

- (void)setSetArtworkThrottleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_setArtworkThrottleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setArtworkThrottleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_artworkShadowView, 0);
  objc_storeStrong((id *)&self->_artworkLayer, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_placeholderSymbolName, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
