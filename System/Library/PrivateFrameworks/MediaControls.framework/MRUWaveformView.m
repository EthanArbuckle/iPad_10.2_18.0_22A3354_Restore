@implementation MRUWaveformView

- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4 settings:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  MRUWaveformView *v13;
  MRUWaveformView *v14;
  uint64_t v15;
  UIColor *fillColor;
  uint64_t v17;
  MRUWaveformData *waveformData;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  CALayer *v28;
  CALayer *artworkLightenLayer;
  id v30;
  double v31;
  CALayer *v32;
  CALayer *artworkDimLayer;
  id v34;
  double v35;
  CALayer *v36;
  CALayer *artworkLayer;
  void *v38;
  CALayer *v39;
  CALayer *fallbackLayer;
  CALayer *v41;
  CALayer *contentLayer;
  UIView *v43;
  UIView *barsContainerView;
  UIView *v45;
  UIView *barsView;
  void *v47;
  uint64_t v48;
  NSArray *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *bars;
  NSArray *v60;
  void *v61;
  void *v63;
  id v64;
  objc_super v65;
  _QWORD v66[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66[2] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v65.receiver = self;
  v65.super_class = (Class)MRUWaveformView;
  v13 = -[MRUWaveformView initWithFrame:](&v65, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_context = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.392156863, 1.0);
    v15 = objc_claimAutoreleasedReturnValue();
    fillColor = v14->_fillColor;
    v14->_fillColor = (UIColor *)v15;

    objc_storeStrong((id *)&v14->_settings, a5);
    +[MRUWaveformData zero](MRUWaveformData, "zero");
    v17 = objc_claimAutoreleasedReturnValue();
    waveformData = v14->_waveformData;
    v14->_waveformData = (MRUWaveformData *)v17;

    -[MRUWaveformView layer](v14, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 1);

    v20 = objc_alloc(MEMORY[0x1E0CD2780]);
    v21 = (void *)objc_msgSend(v20, "initWithType:", *MEMORY[0x1E0CD2C00]);
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[MRUWaveformSettings artworkSaturation](v14->_settings, "artworkSaturation");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:forKeyPath:", v23, *MEMORY[0x1E0CD2CB8]);

    v24 = objc_alloc(MEMORY[0x1E0CD2780]);
    v25 = (void *)objc_msgSend(v24, "initWithType:", *MEMORY[0x1E0CD2C88]);
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[MRUWaveformSettings artworkBlur](v14->_settings, "artworkBlur");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKeyPath:", v27, *MEMORY[0x1E0CD2D90]);

    objc_msgSend(v25, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
    v28 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    artworkLightenLayer = v14->_artworkLightenLayer;
    v14->_artworkLightenLayer = v28;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v14->_artworkLightenLayer, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

    LODWORD(v31) = 0;
    -[CALayer setOpacity:](v14->_artworkLightenLayer, "setOpacity:", v31);
    -[CALayer setName:](v14->_artworkLightenLayer, "setName:", CFSTR("lighten"));
    v32 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    artworkDimLayer = v14->_artworkDimLayer;
    v14->_artworkDimLayer = v32;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v14->_artworkDimLayer, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

    LODWORD(v35) = 0;
    -[CALayer setOpacity:](v14->_artworkDimLayer, "setOpacity:", v35);
    -[CALayer setName:](v14->_artworkDimLayer, "setName:", CFSTR("dim"));
    v36 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    artworkLayer = v14->_artworkLayer;
    v14->_artworkLayer = v36;

    -[CALayer addSublayer:](v14->_artworkLayer, "addSublayer:", v14->_artworkLightenLayer);
    -[CALayer addSublayer:](v14->_artworkLayer, "addSublayer:", v14->_artworkDimLayer);
    v63 = v25;
    v66[0] = v21;
    v66[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setFilters:](v14->_artworkLayer, "setFilters:", v38);

    -[CALayer setName:](v14->_artworkLayer, "setName:", CFSTR("artwork"));
    v39 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    fallbackLayer = v14->_fallbackLayer;
    v14->_fallbackLayer = v39;

    -[CALayer setBackgroundColor:](v14->_fallbackLayer, "setBackgroundColor:", -[UIColor CGColor](v14->_fillColor, "CGColor"));
    -[CALayer setCompositingFilter:](v14->_fallbackLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2E58]);
    -[CALayer setName:](v14->_fallbackLayer, "setName:", CFSTR("fallback"));
    v41 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    contentLayer = v14->_contentLayer;
    v14->_contentLayer = v41;

    -[CALayer setShouldRasterize:](v14->_contentLayer, "setShouldRasterize:", 1);
    -[CALayer setRasterizationScale:](v14->_contentLayer, "setRasterizationScale:", 1.0);
    -[CALayer addSublayer:](v14->_contentLayer, "addSublayer:", v14->_artworkLayer);
    -[CALayer addSublayer:](v14->_contentLayer, "addSublayer:", v14->_fallbackLayer);
    v43 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    barsContainerView = v14->_barsContainerView;
    v14->_barsContainerView = v43;

    v45 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    barsView = v14->_barsView;
    v14->_barsView = v45;

    v64 = v12;
    objc_msgSend(v12, "stops");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count") - 1;

    v49 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v48);
    if (v48 >= 1)
    {
      v50 = *MEMORY[0x1E0C9D648];
      v51 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v52 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v53 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v54 = *MEMORY[0x1E0CD2A68];
      do
      {
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v50, v51, v52, v53);
        objc_msgSend(v55, "layer");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setCornerCurve:", v54);

        objc_msgSend(v55, "layer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setAllowsEdgeAntialiasing:", 1);

        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setBackgroundColor:", v58);

        -[NSArray addObject:](v49, "addObject:", v55);
        -[UIView addSubview:](v14->_barsView, "addSubview:", v55);

        --v48;
      }
      while (v48);
    }
    bars = v14->_bars;
    v14->_bars = v49;
    v60 = v49;

    -[UIView layer](v14->_barsContainerView, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSublayer:", v14->_contentLayer);

    -[UIView addSubview:](v14->_barsContainerView, "addSubview:", v14->_barsView);
    -[MRUWaveformView addSubview:](v14, "addSubview:", v14->_barsContainerView);

    -[MRUWaveformView applyContext:](v14, "applyContext:", v14->_context);
    v12 = v64;
  }

  return v14;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v11.receiver = self;
  v11.super_class = (Class)MRUWaveformView;
  -[MRUWaveformView layoutSubviews](&v11, sel_layoutSubviews);
  -[MRUWaveformView bounds](self, "bounds");
  -[UIView setFrame:](self->_barsContainerView, "setFrame:");
  -[MRUWaveformView bounds](self, "bounds");
  -[UIView setFrame:](self->_barsView, "setFrame:");
  -[MRUWaveformView bounds](self, "bounds");
  v13 = CGRectInset(v12, -1.0, -1.0);
  -[CALayer setFrame:](self->_artworkLayer, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  -[CALayer frame](self->_artworkLayer, "frame");
  -[CALayer setFrame:](self->_artworkLightenLayer, "setFrame:");
  -[CALayer frame](self->_artworkLayer, "frame");
  -[CALayer setFrame:](self->_artworkDimLayer, "setFrame:");
  -[CALayer frame](self->_artworkLayer, "frame");
  -[CALayer setFrame:](self->_fallbackLayer, "setFrame:");
  -[MRUWaveformView bounds](self, "bounds");
  v4 = v3;
  v5 = -[NSArray count](self->_bars, "count");
  if (-[NSArray count](self->_bars, "count"))
  {
    v6 = 0;
    v7 = v4 / (double)v5;
    v8 = (float)(v7 * 0.5) * 0.5;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_bars, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCornerRadius:", v8);

      -[MRUWaveformView bounds](self, "bounds");
      objc_msgSend(v9, "setCenter:", (float)((float)((float)(v7 - (float)(v7 * 0.5)) * 0.5) + (float)(v8 + (float)((float)(int)v6 * v7))), CGRectGetMidY(v14));
      objc_msgSend(v9, "bounds");
      objc_msgSend(v9, "setBounds:", 0.0, 0.0, (float)(v7 * 0.5));

      ++v6;
    }
    while (-[NSArray count](self->_bars, "count") > v6);
  }
  -[MRUWaveformView setWaveformData:](self, "setWaveformData:", self->_waveformData);
}

- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  MRUWaveformView *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[MRUWaveformSettings currentSettings](MRUWaveformSettings, "currentSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRUWaveformView initWithFrame:context:settings:](self, "initWithFrame:context:settings:", a4, v10, x, y, width, height);

  return v11;
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

  -[MRUWaveformView updateVisualStyle](self, "updateVisualStyle");
  -[MRUVisualStylingProvider addObserver:](v6, "addObserver:", self);

}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
  -[MRUWaveformView updateLayers](self, "updateLayers");
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_dimmed != a3)
  {
    v3 = a3;
    self->_dimmed = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_bars;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      v8 = (double)!v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", v8, (_QWORD)v10);
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setFillColor:(id)a3
{
  UIColor **p_fillColor;
  id v6;

  p_fillColor = &self->_fillColor;
  v6 = a3;
  if ((-[UIColor isEqual:](*p_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[CALayer setBackgroundColor:](self->_fallbackLayer, "setBackgroundColor:", -[UIColor CGColor](*p_fillColor, "CGColor"));
  }

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
  -[CALayer setOpacity:](self->_artworkLayer, "setOpacity:", v6);
  -[NSTimer invalidate](self->_transitionTimer, "invalidate");
  transitionTimer = self->_transitionTimer;
  self->_transitionTimer = 0;

  if (artworkImage)
  {
    -[CALayer setContents:](self->_artworkLayer, "setContents:", -[UIImage CGImage](self->_artworkImage, "CGImage"));
    -[MRUWaveformView updateArtworkFilters](self, "updateArtworkFilters");
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__MRUWaveformView_updateLayers__block_invoke;
    v10[3] = &unk_1E5819368;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 0.5);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v9 = self->_transitionTimer;
    self->_transitionTimer = v8;

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __31__MRUWaveformView_updateLayers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setContents:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 536);
  *(_QWORD *)(v2 + 536) = 0;

}

- (void)updateArtworkFilters
{
  double v2;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  float v9;
  MRUWaveformSettings *settings;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  CALayer *artworkLayer;
  id v18;

  LODWORD(v2) = 0;
  -[CALayer setOpacity:](self->_artworkLightenLayer, "setOpacity:", v2);
  LODWORD(v4) = 0;
  -[CALayer setOpacity:](self->_artworkDimLayer, "setOpacity:", v4);
  luminanceForImage(self->_artworkImage);
  v6 = v5;
  -[MRUWaveformSettings artworkSaturation](self->_settings, "artworkSaturation");
  v8 = v7;
  -[MRUWaveformSettings minArtworkLuminance](self->_settings, "minArtworkLuminance");
  settings = self->_settings;
  if (v6 >= v9)
  {
    -[MRUWaveformSettings maxArtworkLuminance](settings, "maxArtworkLuminance");
    if (v6 > v14)
    {
      -[MRUWaveformSettings maxArtworkLuminance](self->_settings, "maxArtworkLuminance");
      v16 = v6 - v15;
      *(float *)&v16 = v16;
      -[CALayer setOpacity:](self->_artworkDimLayer, "setOpacity:", v16);
    }
  }
  else
  {
    -[MRUWaveformSettings minArtworkLuminance](settings, "minArtworkLuminance");
    v12 = v11;
    v13 = v12 - v6;
    *(float *)&v12 = v13;
    -[CALayer setOpacity:](self->_artworkLightenLayer, "setOpacity:", v12);
    v8 = v8 + v13 * 4.0;
  }
  artworkLayer = self->_artworkLayer;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[CALayer setValue:forKeyPath:](artworkLayer, "setValue:forKeyPath:", v18, CFSTR("filters.colorSaturate.inputAmount"));

}

- (void)applyContext:(unint64_t)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  float v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2uLL:
      v15 = *MEMORY[0x1E0CD2C48];
      -[UIView layer](self->_barsView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositingFilter:", v15);

      -[MRUWaveformSettings opacity](self->_settings, "opacity");
      -[UIView setAlpha:](self->_barsContainerView, "setAlpha:", v17);
      LODWORD(v18) = 1.0;
      -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v18);
      -[MRUWaveformView updateLayers](self, "updateLayers");
      break;
    case 1uLL:
      -[UIView setAlpha:](self->_barsContainerView, "setAlpha:", 1.0);
      LODWORD(v14) = 0;
      -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v14);
      break;
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_barsView, "setBackgroundColor:", v4);

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = self->_bars;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        v9 = *MEMORY[0x1E0CD2C50];
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "layer", (_QWORD)v19);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setCompositingFilter:", v9);

            ++v10;
          }
          while (v7 != v10);
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v7);
      }

      -[MRUWaveformSettings opacity](self->_settings, "opacity");
      -[UIView setAlpha:](self->_barsContainerView, "setAlpha:", v12);
      LODWORD(v13) = 1.0;
      -[CALayer setOpacity:](self->_contentLayer, "setOpacity:", v13);
      -[MRUWaveformView updateLayers](self, "updateLayers");
      break;
  }
}

- (void)setWaveformData:(id)a3
{
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_storeStrong((id *)&self->_waveformData, a3);
  -[MRUWaveformView bounds](self, "bounds");
  v6 = v5;
  v7 = -[NSArray count](self->_bars, "count");
  if (-[NSArray count](self->_bars, "count"))
  {
    v8 = 0;
    v9 = v6 / (double)v7;
    v10 = (float)(v9 * 0.5);
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_bars, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "amplitudes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      -[MRUWaveformSettings xScaleMultiplier](self->_settings, "xScaleMultiplier");
      v17 = v10 + v16 * v15;
      -[MRUWaveformView bounds](self, "bounds");
      if (v15 <= 1.0)
        v19 = v15;
      else
        v19 = 1.0;
      v20 = v19 * v18;
      if (v20 <= v10)
        v21 = v10;
      else
        v21 = v20;
      objc_msgSend(v11, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBounds:", 0.0, 0.0, v17, v21);

      objc_msgSend(v11, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCornerRadius:", v17 * 0.5);

      ++v8;
    }
    while (-[NSArray count](self->_bars, "count") > v8);
  }

}

- (void)updateVisualStyle
{
  NSArray *v3;
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
  v3 = self->_bars;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (CALayer)artworkLightenLayer
{
  return self->_artworkLightenLayer;
}

- (void)setArtworkLightenLayer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkLightenLayer, a3);
}

- (CALayer)artworkDimLayer
{
  return self->_artworkDimLayer;
}

- (void)setArtworkDimLayer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkDimLayer, a3);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (CALayer)artworkLayer
{
  return self->_artworkLayer;
}

- (void)setArtworkLayer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkLayer, a3);
}

- (CALayer)fallbackLayer
{
  return self->_fallbackLayer;
}

- (void)setFallbackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackLayer, a3);
}

- (UIView)barsView
{
  return self->_barsView;
}

- (void)setBarsView:(id)a3
{
  objc_storeStrong((id *)&self->_barsView, a3);
}

- (UIView)barsContainerView
{
  return self->_barsContainerView;
}

- (void)setBarsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_barsContainerView, a3);
}

- (NSArray)bars
{
  return self->_bars;
}

- (void)setBars:(id)a3
{
  objc_storeStrong((id *)&self->_bars, a3);
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transitionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_barsContainerView, 0);
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_fallbackLayer, 0);
  objc_storeStrong((id *)&self->_artworkLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_artworkDimLayer, 0);
  objc_storeStrong((id *)&self->_artworkLightenLayer, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_waveformData, 0);
}

@end
