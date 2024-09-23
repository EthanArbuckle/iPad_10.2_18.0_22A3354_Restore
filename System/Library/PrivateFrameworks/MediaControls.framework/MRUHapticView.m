@implementation MRUHapticView

- (MRUHapticView)initWithContext:(unint64_t)a3 frame:(CGRect)a4
{
  MRUHapticView *v5;
  MRUHapticView *v6;
  void *v7;
  uint64_t v8;
  MAMusicHapticsManager *musicHapticsManager;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MRUHapticView;
  v5 = -[MRUHapticView initWithFrame:](&v18, sel_initWithFrame_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a3;
    -[MRUHapticView initializeSubviews](v5, "initializeSubviews");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v6, sel__hapticImageTap_);
    -[MRUHapticView addGestureRecognizer:](v6, "addGestureRecognizer:", v7);
    -[MRUHapticView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
    v8 = objc_claimAutoreleasedReturnValue();
    musicHapticsManager = v6->_musicHapticsManager;
    v6->_musicHapticsManager = (MAMusicHapticsManager *)v8;

    v6->_artworkIsHapticsUnavailableImage = 0;
    objc_initWeak(&location, v6);
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __39__MRUHapticView_initWithContext_frame___block_invoke;
    v15 = &unk_1E5818E18;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "registerUpdateBlock:forRetrieveSelector:withListener:", &v12, sel_hapticMusicActive, v6);

    objc_destroyWeak(&v16);
    -[MRUHapticView registerHapticObserver](v6, "registerHapticObserver", v12, v13, v14, v15);
    -[MRUHapticView registerSystemColorsObserver](v6, "registerSystemColorsObserver");
    -[MRUHapticView updateMusicHapticsStatus](v6, "updateMusicHapticsStatus");
    objc_destroyWeak(&location);

  }
  return v6;
}

void __39__MRUHapticView_initWithContext_frame___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "musicHapticsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "updateArtworkImageForHapticStatus:", v4 ^ 1u);

}

- (void)registerHapticObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleHapticEnabledStatusChangedNotification_, *MEMORY[0x1E0CC1C88], 0);

}

- (void)registerSystemColorsObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleDarkenSystemColorsNotification_, *MEMORY[0x1E0DDE078], 0);

}

- (void)handleDarkenSystemColorsNotification:(id)a3
{
  int v4;
  double v5;

  if (self->_artworkIsHapticsUnavailableImage)
  {
    v4 = _AXDarkenSystemColors();
    v5 = 0.9;
    if (!v4)
      v5 = 0.5;
    -[UIView setAlpha:](self->_hapticContainerView, "setAlpha:", v5);
  }
}

- (void)updateMusicHapticsStatus
{
  MAMusicHapticsManager *musicHapticsManager;
  NSCopying *v4;
  NSCopying *musicHapticsToken;
  NSCopying *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[MAMusicHapticsManager musicHapticsEnabled](self->_musicHapticsManager, "musicHapticsEnabled"))
  {
    objc_initWeak(&location, self);
    musicHapticsManager = self->_musicHapticsManager;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__MRUHapticView_updateMusicHapticsStatus__block_invoke;
    v7[3] = &unk_1E5819340;
    objc_copyWeak(&v8, &location);
    -[MAMusicHapticsManager addStatusObserver:](musicHapticsManager, "addStatusObserver:", v7);
    v4 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    musicHapticsToken = self->_musicHapticsToken;
    self->_musicHapticsToken = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MAMusicHapticsManager removeStatusObserver:](self->_musicHapticsManager, "removeStatusObserver:", self->_musicHapticsToken);
    v6 = self->_musicHapticsToken;
    self->_musicHapticsToken = 0;

  }
}

void __41__MRUHapticView_updateMusicHapticsStatus__block_invoke(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;

  if ((objc_msgSend(a2, "isEqualToString:", &stru_1E581FBA8) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (a3)
      v6 = 0;
    else
      v6 = 2;
    objc_msgSend(WeakRetained, "updateArtworkImageForHapticStatus:", v6);

  }
}

- (void)initializeSubviews
{
  UIColor *v3;
  UIColor *fillColor;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CALayer *v10;
  CALayer *hapticLightenLayer;
  id v12;
  double v13;
  CALayer *v14;
  CALayer *hapticDimLayer;
  id v16;
  double v17;
  CALayer *v18;
  CALayer *hapticLayer;
  void *v20;
  CALayer *v21;
  CALayer *fallbackLayer;
  CALayer *v23;
  CALayer *contentLayer;
  UIView *v25;
  UIView *hapticContainerView;
  UIView *v27;
  UIView *hapticImageViewHolder;
  UIImageView *v29;
  UIImageView *hapticImageView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.392156863, 1.0);
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  fillColor = self->_fillColor;
  self->_fillColor = v3;

  -[MRUHapticView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  v6 = objc_alloc(MEMORY[0x1E0CD2780]);
  v7 = (void *)objc_msgSend(v6, "initWithType:", *MEMORY[0x1E0CD2C00]);
  objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E58785B0, *MEMORY[0x1E0CD2CB8]);
  v8 = objc_alloc(MEMORY[0x1E0CD2780]);
  v9 = (void *)objc_msgSend(v8, "initWithType:", *MEMORY[0x1E0CD2C88]);
  objc_msgSend(v9, "setValue:forKeyPath:", &unk_1E58781D8, *MEMORY[0x1E0CD2D90]);
  objc_msgSend(v9, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
  v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  hapticLightenLayer = self->_hapticLightenLayer;
  self->_hapticLightenLayer = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_hapticLightenLayer, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

  LODWORD(v13) = 0;
  -[CALayer setOpacity:](self->_hapticLightenLayer, "setOpacity:", v13);
  -[CALayer setName:](self->_hapticLightenLayer, "setName:", CFSTR("lighten"));
  v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  hapticDimLayer = self->_hapticDimLayer;
  self->_hapticDimLayer = v14;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_hapticDimLayer, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

  LODWORD(v17) = 0;
  -[CALayer setOpacity:](self->_hapticDimLayer, "setOpacity:", v17);
  -[CALayer setName:](self->_hapticDimLayer, "setName:", CFSTR("dim"));
  v18 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  hapticLayer = self->_hapticLayer;
  self->_hapticLayer = v18;

  -[CALayer addSublayer:](self->_hapticLayer, "addSublayer:", self->_hapticLightenLayer);
  -[CALayer addSublayer:](self->_hapticLayer, "addSublayer:", self->_hapticDimLayer);
  v35[0] = v7;
  v35[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setFilters:](self->_hapticLayer, "setFilters:", v20);

  -[CALayer setName:](self->_hapticLayer, "setName:", CFSTR("artwork"));
  v21 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  fallbackLayer = self->_fallbackLayer;
  self->_fallbackLayer = v21;

  -[CALayer setBackgroundColor:](self->_fallbackLayer, "setBackgroundColor:", -[UIColor CGColor](self->_fillColor, "CGColor"));
  -[CALayer setCompositingFilter:](self->_fallbackLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2E58]);
  -[CALayer setName:](self->_fallbackLayer, "setName:", CFSTR("fallback"));
  v23 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  contentLayer = self->_contentLayer;
  self->_contentLayer = v23;

  -[CALayer setShouldRasterize:](self->_contentLayer, "setShouldRasterize:", 1);
  -[CALayer setRasterizationScale:](self->_contentLayer, "setRasterizationScale:", 1.0);
  -[CALayer addSublayer:](self->_contentLayer, "addSublayer:", self->_hapticLayer);
  -[CALayer addSublayer:](self->_contentLayer, "addSublayer:", self->_fallbackLayer);
  v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  hapticContainerView = self->_hapticContainerView;
  self->_hapticContainerView = v25;

  v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  hapticImageViewHolder = self->_hapticImageViewHolder;
  self->_hapticImageViewHolder = v27;

  -[MRUHapticView updateArtworkImageForHapticStatus:](self, "updateArtworkImageForHapticStatus:", -[MAMusicHapticsManager isActive](self->_musicHapticsManager, "isActive") ^ 1);
  v29 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", self->_artworkImage);
  hapticImageView = self->_hapticImageView;
  self->_hapticImageView = v29;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_hapticImageView, "setTintColor:", v31);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_hapticImageView, "setBackgroundColor:", v32);

  -[UIImageView setContentMode:](self->_hapticImageView, "setContentMode:", 1);
  -[UIImageView layer](self->_hapticImageView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](self->_hapticImageViewHolder, "addSubview:", self->_hapticImageView);
  -[UIView layer](self->_hapticContainerView, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSublayer:", self->_contentLayer);

  -[UIView addSubview:](self->_hapticContainerView, "addSubview:", self->_hapticImageViewHolder);
  -[MRUHapticView addSubview:](self, "addSubview:", self->_hapticContainerView);
  -[MRUHapticView applyContext:](self, "applyContext:", self->_context);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)MRUHapticView;
  -[MRUHapticView layoutSubviews](&v3, sel_layoutSubviews);
  -[MRUHapticView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_hapticImageView, "setFrame:");
  -[MRUHapticView bounds](self, "bounds");
  -[UIView setFrame:](self->_hapticImageViewHolder, "setFrame:");
  -[MRUHapticView bounds](self, "bounds");
  -[UIView setFrame:](self->_hapticContainerView, "setFrame:");
  -[MRUHapticView bounds](self, "bounds");
  v5 = CGRectInset(v4, -1.0, -1.0);
  -[CALayer setFrame:](self->_hapticLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  -[CALayer frame](self->_hapticLayer, "frame");
  -[CALayer setFrame:](self->_hapticLightenLayer, "setFrame:");
  -[CALayer frame](self->_hapticLayer, "frame");
  -[CALayer setFrame:](self->_hapticDimLayer, "setFrame:");
  -[CALayer frame](self->_hapticLayer, "frame");
  -[CALayer setFrame:](self->_fallbackLayer, "setFrame:");
}

- (void)setDimmed:(BOOL)a3
{
  double v3;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    v3 = 1.0;
    if (a3)
      v3 = 0.5;
    -[UIImageView setAlpha:](self->_hapticImageView, "setAlpha:", v3);
  }
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v4;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v6;

  v4 = (MRUVisualStylingProvider *)a3;
  -[MRUVisualStylingProvider removeObserver:](v4, "removeObserver:", self);
  stylingProvider = self->_stylingProvider;
  self->_stylingProvider = v4;
  v6 = v4;

  -[MRUHapticView updateVisualStyle](self, "updateVisualStyle");
  -[MRUVisualStylingProvider addObserver:](v6, "addObserver:", self);

}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
  -[MRUHapticView updateLayers](self, "updateLayers");
}

- (void)updateArtworkImageForHapticStatus:(unsigned int)a3
{
  UIImage *v4;
  UIImage *v5;
  int v6;
  double v7;
  MRUHapticView *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  UIImage *v12;
  UIImage *artworkImage;

  switch(a3)
  {
    case 0u:
      v10 = (void *)MEMORY[0x1E0DC3870];
      v11 = CFSTR("apple.haptics.and.music.note");
LABEL_9:
      objc_msgSend(v10, "_systemImageNamed:", v11);
      v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
      artworkImage = self->_artworkImage;
      self->_artworkImage = v12;

      -[UIView setAlpha:](self->_hapticContainerView, "setAlpha:", 1.0);
      self->_artworkIsHapticsUnavailableImage = 0;
      v8 = self;
      v9 = 1;
LABEL_10:
      -[MRUHapticView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", v9);
      break;
    case 1u:
      v10 = (void *)MEMORY[0x1E0DC3870];
      v11 = CFSTR("apple.haptics.and.music.note.slash");
      goto LABEL_9;
    case 2u:
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("apple.haptics.and.exclamationmark.triangle"));
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_artworkImage;
      self->_artworkImage = v4;

      v6 = _AXDarkenSystemColors();
      v7 = 0.9;
      if (!v6)
        v7 = 0.5;
      -[UIView setAlpha:](self->_hapticContainerView, "setAlpha:", v7);
      self->_artworkIsHapticsUnavailableImage = 1;
      v8 = self;
      v9 = 0;
      goto LABEL_10;
  }
  -[UIImageView setImage:](self->_hapticImageView, "setImage:", self->_artworkImage);
  -[MRUHapticView updateVisualStyle](self, "updateVisualStyle");
}

- (void)updateLayers
{
  double v3;
  UIImage *artworkImage;
  float v5;
  double v6;
  NSTimer *transitionTimer;
  NSTimer *v8;
  NSTimer *v9;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
  artworkImage = self->_artworkImage;
  if (artworkImage)
    *(float *)&v3 = 0.0;
  else
    *(float *)&v3 = 1.0;
  if (artworkImage)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[CALayer setOpacity:](self->_fallbackLayer, "setOpacity:", v3);
  *(float *)&v6 = v5;
  -[CALayer setOpacity:](self->_hapticLayer, "setOpacity:", v6);
  -[NSTimer invalidate](self->_transitionTimer, "invalidate");
  transitionTimer = self->_transitionTimer;
  self->_transitionTimer = 0;

  if (artworkImage)
  {
    -[CALayer setContents:](self->_hapticLayer, "setContents:", -[UIImage CGImage](self->_artworkImage, "CGImage"));
    -[MRUHapticView updateArtworkFilters](self, "updateArtworkFilters");
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__MRUHapticView_updateLayers__block_invoke;
    v10[3] = &unk_1E5819368;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 0.5);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v9 = self->_transitionTimer;
    self->_transitionTimer = v8;

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __29__MRUHapticView_updateLayers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setContents:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 520);
  *(_QWORD *)(v2 + 520) = 0;

}

- (void)updateArtworkFilters
{
  double v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CALayer *hapticLayer;
  id v10;

  LODWORD(v2) = 0;
  -[CALayer setOpacity:](self->_hapticLightenLayer, "setOpacity:", v2);
  LODWORD(v4) = 0;
  -[CALayer setOpacity:](self->_hapticDimLayer, "setOpacity:", v4);
  luminanceForHapticImage(self->_artworkImage);
  if (v5 >= 0.4)
  {
    v7 = 1.25;
    if (v5 > 0.5)
    {
      v8 = v5 + -0.5;
      *(float *)&v8 = v8;
      -[CALayer setOpacity:](self->_hapticDimLayer, "setOpacity:", v8);
    }
  }
  else
  {
    v6 = 0.4 - v5;
    *(float *)&v5 = 0.4 - v5;
    -[CALayer setOpacity:](self->_hapticLightenLayer, "setOpacity:", v5);
    v7 = v6 * 4.0 + 1.25;
  }
  hapticLayer = self->_hapticLayer;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CALayer setValue:forKeyPath:](hapticLayer, "setValue:forKeyPath:", v10, CFSTR("filters.colorSaturate.inputAmount"));

}

- (void)applyContext:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;

  if (a3 == 2)
  {
    v5 = *MEMORY[0x1E0CD2C48];
    v6 = 464;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v5);

    -[UIView setAlpha:](self->_hapticContainerView, "setAlpha:", 1.0);
    LODWORD(v8) = 1.0;
    -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v8);
    -[MRUHapticView updateLayers](self, "updateLayers");
    return;
  }
  if (a3 != 1)
  {
    if (a3)
      return;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_hapticImageViewHolder, "setBackgroundColor:", v4);

    v5 = *MEMORY[0x1E0CD2C50];
    v6 = 456;
    goto LABEL_6;
  }
  -[UIView setAlpha:](self->_hapticContainerView, "setAlpha:", 1.0);
  LODWORD(v9) = 0;
  -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v9);
}

- (void)_hapticImageTap:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = -[MAMusicHapticsManager isActive](self->_musicHapticsManager, "isActive", a3) ^ 1;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHapticMusicActive:", v3);

}

- (void)updateVisualStyle
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, self->_hapticImageView);
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (UIImageView)hapticImageView
{
  return self->_hapticImageView;
}

- (void)setHapticImageView:(id)a3
{
  objc_storeStrong((id *)&self->_hapticImageView, a3);
}

- (UIView)hapticImageViewHolder
{
  return self->_hapticImageViewHolder;
}

- (void)setHapticImageViewHolder:(id)a3
{
  objc_storeStrong((id *)&self->_hapticImageViewHolder, a3);
}

- (CALayer)hapticLightenLayer
{
  return self->_hapticLightenLayer;
}

- (void)setHapticLightenLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hapticLightenLayer, a3);
}

- (CALayer)hapticDimLayer
{
  return self->_hapticDimLayer;
}

- (void)setHapticDimLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hapticDimLayer, a3);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (CALayer)hapticLayer
{
  return self->_hapticLayer;
}

- (void)setHapticLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hapticLayer, a3);
}

- (CALayer)fallbackLayer
{
  return self->_fallbackLayer;
}

- (void)setFallbackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackLayer, a3);
}

- (UIView)hapticContainerView
{
  return self->_hapticContainerView;
}

- (void)setHapticContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_hapticContainerView, a3);
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTimer, a3);
}

- (MAMusicHapticsManager)musicHapticsManager
{
  return self->_musicHapticsManager;
}

- (void)setMusicHapticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_musicHapticsManager, a3);
}

- (NSCopying)musicHapticsToken
{
  return self->_musicHapticsToken;
}

- (void)setMusicHapticsToken:(id)a3
{
  objc_storeStrong((id *)&self->_musicHapticsToken, a3);
}

- (BOOL)artworkIsHapticsUnavailableImage
{
  return self->_artworkIsHapticsUnavailableImage;
}

- (void)setArtworkIsHapticsUnavailableImage:(BOOL)a3
{
  self->_artworkIsHapticsUnavailableImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicHapticsToken, 0);
  objc_storeStrong((id *)&self->_musicHapticsManager, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_hapticContainerView, 0);
  objc_storeStrong((id *)&self->_fallbackLayer, 0);
  objc_storeStrong((id *)&self->_hapticLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_hapticDimLayer, 0);
  objc_storeStrong((id *)&self->_hapticLightenLayer, 0);
  objc_storeStrong((id *)&self->_hapticImageViewHolder, 0);
  objc_storeStrong((id *)&self->_hapticImageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
}

@end
