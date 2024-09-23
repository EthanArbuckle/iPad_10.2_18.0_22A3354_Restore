@implementation NTKVictoryAnalogBackgroundView

- (NTKVictoryAnalogBackgroundView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NTKVictoryAnalogBackgroundView *v11;
  NTKVictoryAnalogBackgroundView *v12;
  UIView *v13;
  UIView *contentView;
  void *v15;
  NSArray *activeDigitIndices;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  _OWORD v28[9];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v51.receiver = self;
  v51.super_class = (Class)NTKVictoryAnalogBackgroundView;
  v11 = -[NTKVictoryAnalogBackgroundView initWithFrame:](&v51, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    memset(v28, 0, sizeof(v28));
    _LayoutConstants_37(v12->_device, v28);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v12->_contentView;
    v12->_contentView = v13;

    -[NTKVictoryAnalogBackgroundView addSubview:](v12, "addSubview:", v12->_contentView);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryAnalogBackgroundView setBackgroundColor:](v12, "setBackgroundColor:", v15);

    -[NTKVictoryAnalogBackgroundView setOpaque:](v12, "setOpaque:", 1);
    v12->_dialShape = 1;
    *(_DWORD *)&v12->_canonicalDigitStatesByStyle[2][8] = 0;
    *(_OWORD *)&v12->_canonicalDigitStatesByStyle[0][0] = 0u;
    *(_OWORD *)&v12->_canonicalDigitStatesByStyle[1][4] = 0u;
    activeDigitIndices = v12->_activeDigitIndices;
    v12->_activeDigitIndices = (NSArray *)&unk_1E6CAA0D8;

    if (-[NSArray count](v12->_activeDigitIndices, "count"))
    {
      v17 = 0;
      do
      {
        -[NSArray objectAtIndex:](v12->_activeDigitIndices, "objectAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v19 = 0;
          do
          {
            objc_msgSend(v18, "objectAtIndex:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "unsignedIntegerValue");

            v12->_canonicalDigitStatesByStyle[v17][v21] = 1;
            ++v19;
          }
          while (v19 < objc_msgSend(v18, "count"));
        }

        ++v17;
      }
      while (v17 < -[NSArray count](v12->_activeDigitIndices, "count"));
    }
    v22 = height * 0.5 + *((double *)&v29 + 1);
    v12->_logoPositionRing.x = width * 0.5 + *(double *)&v29;
    v12->_logoPositionRing.y = v22;
    v23 = height * 0.5 + *((double *)&v30 + 1);
    v12->_logoPositionNoDigits.x = width * 0.5 + *(double *)&v30;
    v12->_logoPositionNoDigits.y = v23;
    v24 = height * 0.5 + *((double *)&v46 + 1);
    v12->_logoPositionBig.x = width * 0.5 + *(double *)&v46;
    v12->_logoPositionBig.y = v24;
    v25 = height * 0.5 + *((double *)&v47 + 1);
    v12->_logoPositionSmallFont.x = width * 0.5 + *(double *)&v47;
    v12->_logoPositionSmallFont.y = v25;
    v26 = height * 0.5 + *((double *)&v48 + 1);
    v12->_logoPositionCircularDial.x = width * 0.5 + *(double *)&v48;
    v12->_logoPositionCircularDial.y = v26;
  }

  return v12;
}

- (void)addLogoButtonIfNeeded
{
  NTKVictoryLogoButton *v3;
  NTKVictoryLogoButton *logoButton;
  NTKVictoryLogoButton *v5;
  void *v6;
  NTKVictoryLogoButton *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!self->_logoButton)
  {
    +[NTKVictoryLogoButton buttonWithType:](NTKVictoryLogoButton, "buttonWithType:", 0);
    v3 = (NTKVictoryLogoButton *)objc_claimAutoreleasedReturnValue();
    logoButton = self->_logoButton;
    self->_logoButton = v3;

    v5 = self->_logoButton;
    -[NTKVictoryAnalogBackgroundView logoImage](self, "logoImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLogoButton setBackgroundImage:forState:](v5, "setBackgroundImage:forState:", v6, 0);

    v7 = self->_logoButton;
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[NTKVictoryAnalogBackgroundView logoSizeForStyle:](self, "logoSizeForStyle:", self->_style);
    -[NTKVictoryLogoButton setBounds:](v7, "setBounds:", v8, v9, v10, v11);
    -[NTKVictoryLogoButton addTarget:action:forControlEvents:](self->_logoButton, "addTarget:action:forControlEvents:", self, sel__logoTapped_, 64);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_logoButton);
    -[NTKVictoryAnalogBackgroundView logoPositionForStyle:](self, "logoPositionForStyle:", self->_style);
    -[UIView setPosition:](self->_logoButton, "setPosition:");
  }
}

- (void)addSmallLogoButtonIfNeeded
{
  NTKVictoryLogoButton *v3;
  NTKVictoryLogoButton *smallLogoButton;
  NTKVictoryLogoButton *v5;
  void *v6;
  NTKVictoryLogoButton *v7;
  double v8;
  double v9;
  double v10[62];

  if (!self->_smallLogoButton)
  {
    +[NTKVictoryLogoButton buttonWithType:](NTKVictoryLogoButton, "buttonWithType:", 0);
    v3 = (NTKVictoryLogoButton *)objc_claimAutoreleasedReturnValue();
    smallLogoButton = self->_smallLogoButton;
    self->_smallLogoButton = v3;

    v5 = self->_smallLogoButton;
    -[NTKVictoryAnalogBackgroundView _circularDialLogoImage](self, "_circularDialLogoImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLogoButton setBackgroundImage:forState:](v5, "setBackgroundImage:forState:", v6, 0);

    v7 = self->_smallLogoButton;
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    _LayoutConstants_37(self->_device, v10);
    -[NTKVictoryLogoButton setBounds:](v7, "setBounds:", v8, v9, v10[60], v10[61]);
    -[NTKVictoryLogoButton addTarget:action:forControlEvents:](self->_smallLogoButton, "addTarget:action:forControlEvents:", self, sel__logoTapped_, 64);
    -[NTKVictoryLogoButton setHidden:](self->_smallLogoButton, "setHidden:", 1);
    -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", self->_logoPositionCircularDial.x, self->_logoPositionCircularDial.y);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_smallLogoButton);
  }
}

- (void)_logoTapped:(id)a3
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
  id v13;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[NTKVictoryAnalogBackgroundView delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logoTappedFromRect:", v6, v8, v10, v12);

}

- (void)layoutSubviews
{
  UIView *contentView;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSMutableDictionary *smallHourMarkerLabelsByIndex;
  _QWORD v16[5];
  objc_super v17[31];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKVictoryAnalogBackgroundView;
  -[NTKVictoryAnalogBackgroundView layoutSubviews](&v18, sel_layoutSubviews);
  contentView = self->_contentView;
  -[NTKVictoryAnalogBackgroundView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](contentView, "ntk_setBoundsAndPositionFromFrame:");
  memset(v17, 0, sizeof(v17));
  _LayoutConstants_37(self->_device, v17);
  -[NTKVictoryAnalogBackgroundView bounds](self, "bounds");
  v4 = 0;
  v6 = v5 * 0.5;
  v8 = v7 * 0.5;
  do
  {
    v9 = (float)v4 * 6.28318531 / 12.0;
    __sincosf_stret(v9);
    CLKRoundForDevice();
    v11 = v10;
    CLKRoundForDevice();
    v13 = v12;
    -[NSMutableArray objectAtIndex:](self->_ringLayers, "objectAtIndex:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPosition:", v6 + v11, v8 + v13);

    ++v4;
  }
  while (v4 != 12);
  smallHourMarkerLabelsByIndex = self->_smallHourMarkerLabelsByIndex;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__NTKVictoryAnalogBackgroundView_layoutSubviews__block_invoke;
  v16[3] = &unk_1E6BD6990;
  v16[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smallHourMarkerLabelsByIndex, "enumerateKeysAndObjectsUsingBlock:", v16);
  -[NTKVictoryAnalogBackgroundView layoutNumbers](self, "layoutNumbers");
}

void __48__NTKVictoryAnalogBackgroundView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "centerPointForSmallHourMarkerAtIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
  objc_msgSend(v5, "setCenter:");

}

- (CGPoint)centerPointForSmallHourMarkerAtIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[NTKVictoryAnalogBackgroundView _ringDigitOffsetAtIndex:](self, "_ringDigitOffsetAtIndex:", a3);
  v5 = v4;
  v7 = v6;
  -[NTKVictoryAnalogBackgroundView bounds](self, "bounds");
  v10 = v5 + v8 * 0.5;
  v11 = v7 + v9 * 0.5;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)layoutNumbers
{
  double *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  __int128 v20;
  double dialShapeFraction;
  uint64_t i;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  _OWORD v38[3];
  _OWORD v39[31];
  CGRect v40;

  v3 = (double *)&v39[22] + 1;
  memset(v39, 0, sizeof(v39));
  _LayoutConstants_37(self->_device, v39);
  -[NTKVictoryAnalogBackgroundView bounds](self, "bounds");
  v4 = 0;
  v6 = v5 * 0.5;
  v8 = v7 * 0.5;
  v9 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  do
  {
    if (-[NSArray count](self->_largeHourMarkerLabels, "count") >= 4)
    {
      -[NSArray objectAtIndex:](self->_largeHourMarkerLabels, "objectAtIndex:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (self->_style < 5)
      {
        v12 = v6 + *(v3 - 17);
        v16 = v8 + *(v3 - 16);
      }
      else
      {
        v12 = *(v3 - 9);
        v13 = *(v3 - 8);
        objc_msgSend(v10, "bounds");
        v14 = v13 + CGRectGetHeight(v40) * -0.5;
        objc_msgSend(v11, "_baselineOffsetFromBottom");
        v16 = v15 + v14;
      }
      objc_msgSend(v11, "setCenter:", v12, v16);

    }
    if (-[NSArray count](self->_mediumNumberLayers, "count") >= 4)
    {
      v17 = *(v3 - 1);
      v18 = *v3;
      -[NSArray objectAtIndex:](self->_mediumNumberLayers, "objectAtIndex:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPosition:", v6 + v17, v8 + v18);
      v20 = v9[1];
      v38[0] = *v9;
      v38[1] = v20;
      v38[2] = v9[2];
      objc_msgSend(v19, "setTransform:", v38);

    }
    ++v4;
    v3 += 2;
  }
  while (v4 != 4);
  dialShapeFraction = self->_dialShapeFraction;
  if (dialShapeFraction > 0.0 && dialShapeFraction < 1.0)
  {
    for (i = 0; i != 4; ++i)
    {
      if (-[NSArray count](self->_largeHourMarkerLabels, "count") >= 4
        && -[NSArray count](self->_mediumNumberLayers, "count") >= 4)
      {
        -[NSArray objectAtIndex:](self->_largeHourMarkerLabels, "objectAtIndex:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_mediumNumberLayers, "objectAtIndex:", i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "center");
        objc_msgSend(v25, "position");
        CLKInterpolateBetweenFloatsClipped();
        v27 = v26;
        objc_msgSend(v24, "center");
        objc_msgSend(v25, "position");
        CLKInterpolateBetweenFloatsClipped();
        objc_msgSend(v24, "setCenter:", v27, v28);
        objc_msgSend(v24, "center");
        objc_msgSend(v25, "position");
        CLKInterpolateBetweenFloatsClipped();
        v30 = v29;
        objc_msgSend(v24, "center");
        objc_msgSend(v25, "position");
        CLKInterpolateBetweenFloatsClipped();
        objc_msgSend(v25, "setCenter:", v30, v31);
        objc_msgSend(v25, "bounds");
        objc_msgSend(v24, "bounds");
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v37, v32, v32);
        v36 = v37;
        objc_msgSend(v24, "setTransform:", &v36);
        objc_msgSend(v24, "bounds");
        objc_msgSend(v25, "bounds");
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v35, v33, v33);
        v34 = v35;
        objc_msgSend(v25, "setTransform:", &v34);

      }
    }
  }
}

- (CGPoint)_ringDigitOffsetAtIndex:(unint64_t)a3
{
  unint64_t v3;
  double *v4;
  double v5;
  double v6;
  _OWORD v7[31];
  CGPoint result;

  v3 = a3 - 1;
  v4 = (double *)MEMORY[0x1E0C9D538];
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
    case 7uLL:
    case 0xBuLL:
      goto LABEL_6;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_5;
    case 6uLL:
      v3 = 4;
      goto LABEL_5;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      v3 = a3 - 3;
      goto LABEL_5;
    default:
      v3 = 0;
LABEL_5:
      _LayoutConstants_37(self->_device, v7);
      v4 = (double *)&v7[v3 + 1];
LABEL_6:
      v5 = *v4;
      v6 = v4[1];
      result.y = v6;
      result.x = v5;
      return result;
  }
}

- (void)setInTimeTravel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_style >= 3)
  {
    v4 = a4;
    v5 = a3;
    -[NSArray subarrayWithRange:](self->_largeHourMarkerLabels, "subarrayWithRange:", 1, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = 0.2;
    else
      v8 = 1.0;
    if (v4)
    {
      if (v5)
        v9 = 1.0;
      else
        v9 = 0.2;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFromValue:", v11);

      objc_msgSend(v10, "setDuration:", *(double *)off_1E6BC9BB0);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v17, "setAlpha:", v8);
            objc_msgSend(v17, "layer");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addAnimation:forKey:", v10, CFSTR("timeTravelFade"));

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v14);
      }

    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "setAlpha:", v8);
          }
          v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v20);
      }
    }

  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[NTKVictoryAnalogBackgroundView addLogoButtonIfNeeded](self, "addLogoButtonIfNeeded");
  if (a3 > 2)
    -[NTKVictoryAnalogBackgroundView _createLargeHourMarkerLabelsAndAttachToViewIfNeeded](self, "_createLargeHourMarkerLabelsAndAttachToViewIfNeeded");
  else
    -[NTKVictoryAnalogBackgroundView _createRingLayersIfNeeded](self, "_createRingLayersIfNeeded");
  -[NTKVictoryAnalogBackgroundView _clearTransitionStateForStyle:palette:](self, "_clearTransitionStateForStyle:palette:", a3, self->_palette);
  -[NTKVictoryAnalogBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDialShape:(unint64_t)a3
{
  _BOOL4 v4;
  double v5;
  unint64_t dialShape;
  void *v7;
  int *v8;
  uint64_t v9;
  void *v10;
  NTKVictoryLogoButton *logoButton;
  NTKVictoryLogoButton *smallLogoButton;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  _OWORD v17[2];
  __int128 v18;

  self->_dialShape = a3;
  v4 = -[NTKVictoryAnalogBackgroundView isCircularDial](self, "isCircularDial");
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  self->_dialShapeFraction = v5;
  dialShape = self->_dialShape;
  if (dialShape)
  {
    if (dialShape != 1)
      goto LABEL_12;
    -[NTKVictoryAnalogBackgroundView addLogoButtonIfNeeded](self, "addLogoButtonIfNeeded");
    if (!-[NSArray count](self->_largeHourMarkerLabels, "count"))
      -[NTKVictoryAnalogBackgroundView _createLargeHourMarkerLabelsAndAttachToViewIfNeeded](self, "_createLargeHourMarkerLabelsAndAttachToViewIfNeeded");
    v7 = &__block_literal_global_123;
    v8 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__mediumNumberLayers;
  }
  else
  {
    -[NTKVictoryAnalogBackgroundView addSmallLogoButtonIfNeeded](self, "addSmallLogoButtonIfNeeded");
    if (!-[NSArray count](self->_mediumNumberLayers, "count"))
      -[NTKVictoryAnalogBackgroundView _createMediumNumberLayersIfNeededAndAttachToViewIfNeeded](self, "_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded");
    v7 = &__block_literal_global_25;
    v8 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__largeHourMarkerLabels;
  }
  v9 = *v8;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "enumerateObjectsUsingBlock:", v7);
  v10 = *(Class *)((char *)&self->super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.isa + v9) = 0;

LABEL_12:
  if (-[NTKVictoryAnalogBackgroundView style](self, "style") != 4)
    -[NTKVictoryAnalogBackgroundView setStyle:](self, "setStyle:", 4);
  -[NTKVictoryLogoButton setHidden:](self->_logoButton, "setHidden:", self->_dialShape == 0);
  -[NTKVictoryLogoButton setHidden:](self->_smallLogoButton, "setHidden:", self->_dialShape == 1);
  -[NTKVictoryAnalogBackgroundView logoPositionForStyle:](self, "logoPositionForStyle:", self->_style);
  -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:");
  logoButton = self->_logoButton;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v17[0] = *MEMORY[0x1E0C9BAA8];
  v14 = v17[0];
  v17[1] = v15;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v13 = v18;
  -[NTKVictoryLogoButton setTransform:](logoButton, "setTransform:", v17);
  -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", self->_logoPositionCircularDial.x, self->_logoPositionCircularDial.y);
  smallLogoButton = self->_smallLogoButton;
  v16[0] = v14;
  v16[1] = v15;
  v16[2] = v13;
  -[NTKVictoryLogoButton setTransform:](smallLogoButton, "setTransform:", v16);
  -[NTKVictoryAnalogBackgroundView layoutNumbers](self, "layoutNumbers");
}

uint64_t __47__NTKVictoryAnalogBackgroundView_setDialShape___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __47__NTKVictoryAnalogBackgroundView_setDialShape___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (BOOL)isCircularDial
{
  return self->_dialShape == 0;
}

- (void)applyTransitionFraction:(double)a3 fromDialShape:(unint64_t)a4 toDialShape:(unint64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  NTKVictoryLogoButton *logoButton;
  CGFloat v15;
  NTKVictoryLogoButton *smallLogoButton;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  void *v23;
  NSArray *mediumNumberLayers;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  if (a4 == a5)
  {
    -[NTKVictoryAnalogBackgroundView setDialShape:](self, "setDialShape:", a4, a3);
  }
  else
  {
    -[NTKVictoryAnalogBackgroundView addLogoButtonIfNeeded](self, "addLogoButtonIfNeeded");
    -[NTKVictoryAnalogBackgroundView addSmallLogoButtonIfNeeded](self, "addSmallLogoButtonIfNeeded");
    -[NTKVictoryLogoButton setHidden:](self->_logoButton, "setHidden:", 0);
    -[NTKVictoryLogoButton setHidden:](self->_smallLogoButton, "setHidden:", 0);
    self->_dialShapeFraction = a3;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setAlpha:](self->_logoButton, "setAlpha:");
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setAlpha:](self->_smallLogoButton, "setAlpha:");
    CLKInterpolateBetweenFloatsClipped();
    v8 = v7;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:", v8, v9);
    CLKInterpolateBetweenFloatsClipped();
    v11 = v10;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", v11, v12);
    -[NTKVictoryAnalogBackgroundView layoutNumbers](self, "layoutNumbers");
    -[NTKVictoryLogoButton bounds](self->_smallLogoButton, "bounds");
    -[NTKVictoryLogoButton bounds](self->_logoButton, "bounds");
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v29, v13, v13);
    logoButton = self->_logoButton;
    v28 = v29;
    -[NTKVictoryLogoButton setTransform:](logoButton, "setTransform:", &v28);
    -[NTKVictoryLogoButton bounds](self->_logoButton, "bounds");
    -[NTKVictoryLogoButton bounds](self->_smallLogoButton, "bounds");
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v27, v15, v15);
    smallLogoButton = self->_smallLogoButton;
    v26 = v27;
    -[NTKVictoryLogoButton setTransform:](smallLogoButton, "setTransform:", &v26);
    if (!-[NSArray count](self->_largeHourMarkerLabels, "count"))
      -[NTKVictoryAnalogBackgroundView _createLargeHourMarkerLabelsAndAttachToViewIfNeeded](self, "_createLargeHourMarkerLabelsAndAttachToViewIfNeeded");
    if (!-[NSArray count](self->_mediumNumberLayers, "count"))
      -[NTKVictoryAnalogBackgroundView _createMediumNumberLayersIfNeededAndAttachToViewIfNeeded](self, "_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded");
    CLKCompressFraction();
    v18 = v17;
    CLKCompressFraction();
    v20 = v19;
    if (-[NSArray count](self->_largeHourMarkerLabels, "count"))
    {
      v21 = 0;
      v22 = 1.0 - v18;
      do
      {
        if (-[NSArray count](self->_largeHourMarkerLabels, "count"))
        {
          -[NSArray objectAtIndex:](self->_largeHourMarkerLabels, "objectAtIndex:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setAlpha:", v22);

        }
        mediumNumberLayers = self->_mediumNumberLayers;
        if (mediumNumberLayers)
        {
          -[NSArray objectAtIndex:](mediumNumberLayers, "objectAtIndex:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAlpha:", v20);

        }
        ++v21;
      }
      while (v21 < -[NSArray count](self->_largeHourMarkerLabels, "count"));
    }
  }
}

- (void)applyTransitionFraction:(double)a3 fromOlympusStyle:(unint64_t)a4 toOlympusStyle:(unint64_t)a5
{
  double v6;
  double v7;
  CGFloat v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  CLKCompressFraction();
  v7 = v6;
  CLKInterpolateBetweenFloatsClipped();
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, v8, v8);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", v7);
  v9 = v10;
  -[UIView setTransform:](self->_contentView, "setTransform:", &v9);
}

- (id)_activeRingLayers
{
  NSMutableArray *ringLayers;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  v11 = 0;
  ringLayers = self->_ringLayers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__NTKVictoryAnalogBackgroundView__activeRingLayers__block_invoke;
  v5[3] = &unk_1E6BD6A18;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](ringLayers, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__NTKVictoryAnalogBackgroundView__activeRingLayers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  if (*(_BYTE *)(v8 + 448 + a3))
  {
    v11 = *(void **)(v8 + 480);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &unk_1E6C9FB98;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    if (a3)
  }
  else
  {
    objc_msgSend(*(id *)(v9 + 40), "addObject:", v15);
  }

}

- (id)_activeRingObjects
{
  NSMutableArray *ringLayers;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  v11 = 0;
  ringLayers = self->_ringLayers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NTKVictoryAnalogBackgroundView__activeRingObjects__block_invoke;
  v5[3] = &unk_1E6BD6A18;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](ringLayers, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__NTKVictoryAnalogBackgroundView__activeRingObjects__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  if (*(_BYTE *)(v8 + 448 + a3))
  {
    v11 = *(void **)(v8 + 480);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &unk_1E6C9FB98;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    if (a3)
  }
  else
  {
    objc_msgSend(*(id *)(v9 + 40), "addObject:", v14);
  }

}

- (void)_clearTransitionStateForStyle:(unint64_t)a3 palette:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  __int128 *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  NTKVictoryLogoButton *logoButton;
  NTKVictoryLogoButton *v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];

  v6 = a4;
  -[NTKVictoryAnalogBackgroundView addLogoButtonIfNeeded](self, "addLogoButtonIfNeeded");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_smallHourMarkerLabelsByIndex, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_29_1);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_ringLayers, "enumerateObjectsUsingBlock:", &__block_literal_global_30);
  if (a3 <= 2)
  {
    -[NSArray objectAtIndexedSubscript:](self->_activeDigitIndices, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_3;
    v40[3] = &unk_1E6BD54B0;
    v40[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v40);

  }
  v8 = 0;
  v9 = 2;
  if (a3 < 2)
    v9 = a3;
  v10 = self->_canonicalDigitStatesByStyle[v9];
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v26 = *MEMORY[0x1E0CD2610];
  v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  do
  {
    -[NTKVictoryAnalogBackgroundView _activeRingLayers](self, "_activeRingLayers", v23, v24, v25, v26, v27, v28, v29, v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v30;
    v37 = v29;
    v38 = v28;
    v39 = v27;
    v32 = v26;
    v33 = v25;
    v34 = v24;
    v35 = v23;
    objc_msgSend(v12, "setTransform:", &v32);
    -[NTKVictoryAnalogBackgroundView _setRingLayerAtIndex:isDigit:](self, "_setRingLayerAtIndex:isDigit:", v8, v10[v8]);

    ++v8;
  }
  while (v8 != 12);
  v13 = 0;
  if (a3 <= 2)
    v14 = 0.0;
  else
    v14 = 1.0;
  v15 = (__int128 *)MEMORY[0x1E0C9BAA8];
  do
  {
    if (-[NTKVictoryAnalogBackgroundView isCircularDial](self, "isCircularDial"))
      v16 = 472;
    else
      v16 = 464;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v16), "objectAtIndex:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v14);
    v18 = v15[1];
    v32 = *v15;
    v33 = v18;
    v34 = v15[2];
    objc_msgSend(v17, "setTransform:", &v32);

    ++v13;
  }
  while (v13 != 4);
  -[NTKVictoryAnalogBackgroundView logoPositionForStyle:](self, "logoPositionForStyle:", a3);
  -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:");
  logoButton = self->_logoButton;
  v31[4] = v30;
  v31[5] = v29;
  v31[6] = v28;
  v31[7] = v27;
  v31[0] = v26;
  v31[1] = v25;
  v31[2] = v24;
  v31[3] = v23;
  -[NTKVictoryLogoButton setTransform3D:](logoButton, "setTransform3D:", v31);
  -[NTKVictoryLogoButton setAlpha:](self->_logoButton, "setAlpha:", 1.0);
  v20 = self->_logoButton;
  -[NTKVictoryLogoButton center](v20, "center");
  v22 = v21;
  -[NTKVictoryLogoButton center](self->_logoButton, "center");
  -[NTKVictoryLogoButton setCenter:](v20, "setCenter:", v22);
  -[NTKVictoryAnalogBackgroundView _applyPalette:forStyle:](self, "_applyPalette:forStyle:", v6, a3);

}

uint64_t __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setHidden:", 1);
}

uint64_t __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

void __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  if (objc_msgSend(v8, "integerValue"))
    v4 = v8;
  else
    v4 = &unk_1E6C9FB98;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "objectAtIndexedSubscript:", objc_msgSend(v8, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

}

- (CGPoint)logoPositionForStyle:(unint64_t)a3
{
  int *v3;
  int *v4;
  double *v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionRing;
  if (!a3)
    v3 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionNoDigits;
  v4 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionSmallFont;
  if (a3 < 5)
    v4 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionBig;
  if (a3 >= 3)
    v3 = v4;
  v5 = (double *)((char *)self + *v3);
  v6 = *v5;
  v7 = v5[1];
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)logoSizeForStyle:(unint64_t)a3
{
  CLKDevice *device;
  double v4;
  double *v5;
  double v6;
  _QWORD v7[61];
  uint64_t v8;
  _BYTE v9[464];
  double v10;
  uint64_t v11;
  CGSize result;

  device = self->_device;
  if (a3 > 4)
  {
    _LayoutConstants_37(device, v7);
    v4 = *(double *)&v7[60];
    v5 = (double *)&v8;
  }
  else
  {
    _LayoutConstants_37(device, v9);
    v4 = v10;
    v5 = (double *)&v11;
  }
  v6 = *v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setPalette:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_palette, a3);
  v5 = a3;
  -[NTKVictoryAnalogBackgroundView _applyPalette:forStyle:](self, "_applyPalette:forStyle:", v5, self->_style);

}

- (void)_applyPalette:(id)a3 forStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  float v8;
  float v9;
  uint64_t v10;
  float v11;
  float v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  float v17;
  id v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *smallHourMarkerLabelsByIndex;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v6 = a3;
  objc_msgSend(v6, "backgroundColor");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryAnalogBackgroundView setBackgroundColor:](self, "setBackgroundColor:");
  objc_msgSend(v6, "dotMarkerAlpha");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v10 = 0;
  if (a4 <= 2)
    v11 = 1.0;
  else
    v11 = 0.0;
  if (a4 <= 2)
    v12 = v9;
  else
    v12 = 0.0;
  do
  {
    -[NSMutableArray objectAtIndex:](self->_ringLayers, "objectAtIndex:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_ringLayerIsDigit[v10];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "numberColorAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
    }
    else
    {
      objc_msgSend(v6, "dotMarkerColorAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
    }
    v18 = objc_retainAutorelease(v16);
    v19 = objc_msgSend(v18, "CGColor");

    objc_msgSend(v13, "setContentsMultiplyColor:", v19);
    *(float *)&v20 = v17;
    objc_msgSend(v13, "setOpacity:", v20);

    ++v10;
  }
  while (v10 != 12);
  if (-[NSArray count](self->_largeHourMarkerLabels, "count"))
  {
    v21 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_largeHourMarkerLabels, "objectAtIndex:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberColorAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setFillColor:", v24);
      }
      else
      {
        -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberColorAtIndex:", v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB37E8];
        -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberColorAtIndex:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setFillColor:inRange:", v24, 0, 1);
        objc_msgSend(v22, "setFillColor:inRange:", v29, 1, 1);

      }
      ++v21;
    }
    while (v21 < -[NSArray count](self->_largeHourMarkerLabels, "count"));
  }
  if (-[NSArray count](self->_mediumNumberLayers, "count"))
  {
    v30 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_mediumNumberLayers, "objectAtIndex:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberColorAtIndex:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setFillColor:", v33);
      ++v30;
    }
    while (v30 < -[NSArray count](self->_mediumNumberLayers, "count"));
  }
  smallHourMarkerLabelsByIndex = self->_smallHourMarkerLabelsByIndex;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __57__NTKVictoryAnalogBackgroundView__applyPalette_forStyle___block_invoke;
  v38[3] = &unk_1E6BD6990;
  v39 = v6;
  v35 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](smallHourMarkerLabelsByIndex, "enumerateKeysAndObjectsUsingBlock:", v38);
  objc_msgSend(v35, "logo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryLogoButton setTintColor:](self->_logoButton, "setTintColor:", v36);
  -[NTKVictoryLogoButton setTintColor:](self->_smallLogoButton, "setTintColor:", v36);

}

void __57__NTKVictoryAnalogBackgroundView__applyPalette_forStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") % 0xCuLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberColorAtIndex:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFillColor:", v9);
  objc_msgSend(v6, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentsMultiplyColor:", 0);
}

- (id)digitForLargeNumberAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return (id)qword_1E6BD6B88[a3];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6
{
  -[NTKVictoryAnalogBackgroundView applyTransitionFraction:fromPalette:toPalette:style:animateElements:](self, "applyTransitionFraction:fromPalette:toPalette:style:animateElements:", a4, a5, a6, 1, a3);
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6 animateElements:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  _BOOL4 v19;
  int *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  float v27;
  float v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  char isKindOfClass;
  id v39;
  int v40;
  void *v41;
  void *v42;
  double v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  float v62;
  float v63;
  CGFloat v64;
  NTKVictoryLogoButton *logoButton;
  NTKVictoryLogoButton *smallLogoButton;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  float v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NTKVictoryAnalogBackgroundView *v78;
  uint64_t v79;
  uint64_t (**v80)(void *, _QWORD);
  _BOOL4 v81;
  _QWORD *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  CATransform3D v88;
  CATransform3D v89;
  CATransform3D v90;
  CATransform3D v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CATransform3D v94;
  _QWORD v95[5];
  _QWORD aBlock[6];

  v81 = a7;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "dotMarkerAlpha");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");

  objc_msgSend(v11, "dotMarkerAlpha");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");

  v84 = v10;
  objc_msgSend(v10, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v11;
  objc_msgSend(v11, "backgroundColor");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0)
  {
    NTKInterpolateBetweenColors(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryAnalogBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v16);

  }
  v74 = v14;
  if (a6 > 2)
  {
    v19 = -[NTKVictoryAnalogBackgroundView isCircularDial](self, "isCircularDial");
    v20 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__largeHourMarkerLabels;
    if (v19)
      v20 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__mediumNumberLayers;
    v82 = &__block_literal_global_34;
    v83 = *(id *)((char *)&self->super.super.super.isa + *v20);
    v80 = (uint64_t (**)(void *, _QWORD))&__block_literal_global_35_0;
    v18 = 0.174999997;
    v72 = 0.150000006;
    v71 = 0.1;
  }
  else
  {
    -[NTKVictoryAnalogBackgroundView _activeRingObjects](self, "_activeRingObjects");
    v83 = (id)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke;
    aBlock[3] = &unk_1E6BD6AC0;
    aBlock[4] = self;
    v82 = _Block_copy(aBlock);
    v95[0] = v17;
    v95[1] = 3221225472;
    v95[2] = __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_2;
    v95[3] = &unk_1E6BD6AE8;
    v95[4] = self;
    v80 = (uint64_t (**)(void *, _QWORD))_Block_copy(v95);
    v72 = 0.5;
    v71 = 0.0;
    v18 = 0.0579999983;
  }
  v73 = (void *)v15;
  v21 = objc_msgSend(v83, "count");
  v22 = a6;
  if (v21)
  {
    v23 = 0;
    v24 = 0x1E0CB3000uLL;
    v78 = self;
    v79 = v21;
    do
    {
      if (v23)
        v25 = v23;
      else
        v25 = v21;
      -[NTKVictoryAnalogBackgroundView _transitionProgressForDigitAtIndex:overallProgress:delayPerDigit:digitTransitionLength:](self, "_transitionProgressForDigitAtIndex:overallProgress:delayPerDigit:digitTransitionLength:", v25 - 1, a3, v18, 0.300000012);
      v27 = v26;
      if ((float)((float)(v27 * 2.0) + -0.5) <= 1.0)
        v28 = (float)(v27 * 2.0) + -0.5;
      else
        v28 = 1.0;
      -[NTKVictoryAnalogBackgroundView _elementScaleForTransitionProgress:initialScale:middleScale:finalScale:](self, "_elementScaleForTransitionProgress:initialScale:middleScale:finalScale:", v27, 1.0, ((__n128 (*)(_QWORD *, uint64_t))v82[2])(v82, v23).n128_f32[0], 1.0);
      v30 = v29;
      objc_msgSend(v83, "objectAtIndex:", v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v24 + 2024), "numberWithUnsignedInteger:", v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "dotMarkerColorAtIndex:", v32);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v24 + 2024), "numberWithUnsignedInteger:", v23);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "dotMarkerColorAtIndex:", v33);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 == 3)
        -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", v23);
      else
        objc_msgSend(*(id *)(v24 + 2024), "numberWithUnsignedInteger:", v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = fmaxf(v28, 0.0);
      objc_msgSend(v84, "numberColorAtIndex:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "numberColorAtIndex:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v39 = v31;
      if ((isKindOfClass & 1) != 0)
      {
        if (v81)
        {
          CATransform3DMakeScale(&v94, v30, v30, v30);
          objc_msgSend(v39, "setTransform:", &v94);
        }
        v40 = v80[2](v80, v23);
        if (v40)
          v41 = v87;
        else
          v41 = v36;
        if (v40)
          v42 = v86;
        else
          v42 = v37;
        objc_msgSend(v39, "setContentsMultiplyColor:", -[NTKVictoryAnalogBackgroundView _layerTransitionColorFromColor:toColor:amount:](self, "_layerTransitionColorFromColor:toColor:amount:", v41, v42, v35));
        if (v22 <= 2)
        {
          CLKInterpolateBetweenFloatsClipped();
          *(float *)&v43 = v43;
          objc_msgSend(v39, "setOpacity:", v43);
        }
      }
      else
      {
        if (v81)
        {
          CGAffineTransformMakeScale(&v93, v30, v30);
          v92 = v93;
          objc_msgSend(v39, "setTransform:", &v92);
        }
        v44 = v80[2](v80, v23);
        if (v22 != 3 || v23)
        {
          if (v44)
            v58 = v87;
          else
            v58 = v36;
          if (v44)
            v59 = v86;
          else
            v59 = v37;
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", -[NTKVictoryAnalogBackgroundView _layerTransitionColorFromColor:toColor:amount:](self, "_layerTransitionColorFromColor:toColor:amount:", v58, v59, v35));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setFillColor:", v60);

          v22 = a6;
          if (a6 <= 2)
          {
            CLKInterpolateBetweenFloatsClipped();
            objc_msgSend(v39, "setAlpha:");
          }
        }
        else
        {
          -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "numberColorAtIndex:", v45);
          v76 = v36;
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = (void *)MEMORY[0x1E0CB37E8];
          -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](self, "digitForLargeNumberAtIndex:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v48, "integerValue") + 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "numberColorAtIndex:", v49);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](v78, "digitForLargeNumberAtIndex:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "numberColorAtIndex:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = (void *)MEMORY[0x1E0CB37E8];
          -[NTKVictoryAnalogBackgroundView digitForLargeNumberAtIndex:](v78, "digitForLargeNumberAtIndex:", 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "numberWithInteger:", objc_msgSend(v53, "integerValue") + 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "numberColorAtIndex:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          NTKInterpolateBetweenColors(v46, v51);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          NTKInterpolateBetweenColors(v75, v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setFillColor:inRange:", v56, 0, 1);
          objc_msgSend(v39, "setFillColor:inRange:", v57, 1, 1);

          self = v78;
          v36 = v76;
          v22 = a6;
        }
      }

      ++v23;
      v21 = v79;
      v24 = 0x1E0CB3000;
    }
    while (v79 != v23);
  }
  v61 = (a3 - v72) / 0.150000006;
  if (v61 > 1.0)
    v61 = 1.0;
  v62 = fmax(v61, 0.0);
  if (v81)
  {
    v63 = v62 + v62;
    if (v62 >= 0.5)
      v63 = 1.0 - (float)((float)(v62 + -0.5) + (float)(v62 + -0.5));
    v64 = (float)(v71 * v63) + 1.0;
    CATransform3DMakeScale(&v91, v64, v64, v64);
    logoButton = self->_logoButton;
    v90 = v91;
    -[NTKVictoryLogoButton setTransform3D:](logoButton, "setTransform3D:", &v90);
    CATransform3DMakeScale(&v89, v64, v64, v64);
    smallLogoButton = self->_smallLogoButton;
    v88 = v89;
    -[NTKVictoryLogoButton setTransform3D:](smallLogoButton, "setTransform3D:", &v88);
  }
  objc_msgSend(v84, "logo");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "logo");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryLogoButton setTintColor:](self->_logoButton, "setTintColor:", v69);

  NTKInterpolateBetweenColors(v67, v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryLogoButton setTintColor:](self->_smallLogoButton, "setTintColor:", v70);

}

float __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke(uint64_t a1, uint64_t a2)
{
  float result;

  result = 1.45;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 448 + a2))
    return 2.5;
  return result;
}

BOOL __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 32) + 448 + a2) == 0;
}

float __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_3()
{
  return 1.2;
}

uint64_t __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_4()
{
  return 0;
}

- (CGColor)_layerTransitionColorFromColor:(id)a3 toColor:(id)a4 amount:(double)a5
{
  id v6;
  id v7;
  void *v8;
  CGColor *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (CLKFloatEqualsFloat())
  {
    v8 = v6;
  }
  else
  {
    if (!CLKFloatEqualsFloat())
    {
      NTKInterpolateBetweenColors(v6, v7);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (CGColor *)objc_msgSend(v10, "CGColor");

      goto LABEL_7;
    }
    v8 = v7;
  }
  v9 = (CGColor *)objc_msgSend(objc_retainAutorelease(v8), "CGColor");
LABEL_7:

  return v9;
}

- (double)_transitionProgressForDigitAtIndex:(unint64_t)a3 overallProgress:(double)a4 delayPerDigit:(double)a5 digitTransitionLength:(double)a6
{
  double v6;

  v6 = (a4 - a5 * (double)a3) / a6;
  if (v6 > 1.0)
    v6 = 1.0;
  return fmax(v6, 0.0);
}

- (double)_elementScaleForTransitionProgress:(double)a3 initialScale:(double)a4 middleScale:(double)a5 finalScale:(double)a6
{
  double v6;
  double result;

  if (a3 >= 0.5)
    v6 = 1.0 - (a3 + -0.5 + a3 + -0.5);
  else
    v6 = a3 + a3;
  *(float *)&v6 = v6;
  -[CAMediaTimingFunction _solveForInput:](self->_transitionTimingFunction, "_solveForInput:", v6, a4);
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (void)willBeginEditing
{
  double v3;
  double v4;
  double v5;
  double v6;
  CAMediaTimingFunction *v7;
  CAMediaTimingFunction *transitionTimingFunction;

  -[NTKVictoryAnalogBackgroundView _createRingLayersIfNeeded](self, "_createRingLayersIfNeeded");
  if (!-[NTKVictoryAnalogBackgroundView isCircularDial](self, "isCircularDial"))
    -[NTKVictoryAnalogBackgroundView _createLargeHourMarkerLabelsAndAttachToViewIfNeeded](self, "_createLargeHourMarkerLabelsAndAttachToViewIfNeeded");
  if (!self->_transitionTimingFunction)
  {
    LODWORD(v3) = 1051260355;
    LODWORD(v5) = 1059648963;
    LODWORD(v4) = 0;
    LODWORD(v6) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v4, v5, v6);
    v7 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    transitionTimingFunction = self->_transitionTimingFunction;
    self->_transitionTimingFunction = v7;

  }
  -[NTKVictoryAnalogBackgroundView _clearTransitionStateForStyle:palette:](self, "_clearTransitionStateForStyle:palette:", self->_style, self->_palette);
  -[NTKVictoryAnalogBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setRingLayerAtIndex:(unint64_t)a3 isDigit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  self->_ringLayerIsDigit[a3] = a4;
  -[NSMutableArray objectAtIndex:](self->_ringLayers, "objectAtIndex:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryAnalogBackgroundView _dotImage](self, "_dotImage");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setContents:", objc_msgSend(v6, "CGImage"));
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v6, "size");
  objc_msgSend(v11, "setBounds:", v7, v8, v9, v10);
  objc_msgSend(v11, "setHidden:", v4);

}

- (void)_createRingLayersIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *ringLayers;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *v10;
  NSMutableDictionary *smallHourMarkerLabelsByIndex;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_ringLayers)
  {
    -[NTKVictoryAnalogBackgroundView _createAndAddLayersWithCount:](self, "_createAndAddLayersWithCount:", 12);
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    ringLayers = self->_ringLayers;
    self->_ringLayers = v3;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_ringLayers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setOpaque:", 1);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    -[NTKVictoryAnalogBackgroundView _applyPalette:forStyle:](self, "_applyPalette:forStyle:", self->_palette, self->_style);
  }
  if (!self->_smallHourMarkerLabelsByIndex)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    smallHourMarkerLabelsByIndex = self->_smallHourMarkerLabelsByIndex;
    self->_smallHourMarkerLabelsByIndex = v10;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(&unk_1E6CAA0F0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(&unk_1E6CAA0F0);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          -[NTKVictoryAnalogBackgroundView _createSmallHourMarkerLabelForIndex:](self, "_createSmallHourMarkerLabelForIndex:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setText:", v18);

          objc_msgSend(v17, "sizeToFit");
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smallHourMarkerLabelsByIndex, "setObject:forKeyedSubscript:", v17, v16);

        }
        v13 = objc_msgSend(&unk_1E6CAA0F0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }
  }
}

- (unint64_t)_digitForIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = 12;
  if (a3)
    v3 = 0;
  return v3 + 3 * a3;
}

- (void)_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded
{
  NSArray *mediumNumberLayers;
  NSArray *v4;
  NSArray *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9[62];

  mediumNumberLayers = self->_mediumNumberLayers;
  if (!mediumNumberLayers)
  {
    _LayoutConstants_37(self->_device, v9);
    -[NTKVictoryAnalogBackgroundView _createHourMarkerLabelsWithFontSize:](self, "_createHourMarkerLabelsWithFontSize:", v9[26]);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mediumNumberLayers;
    self->_mediumNumberLayers = v4;

    -[NTKVictoryAnalogBackgroundView _applyPalette:forStyle:](self, "_applyPalette:forStyle:", self->_palette, self->_style);
    mediumNumberLayers = self->_mediumNumberLayers;
  }
  if (-[NSArray count](mediumNumberLayers, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_mediumNumberLayers, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(v7, "removeFromSuperview");
      -[UIView addSubview:](self->_contentView, "addSubview:", v7);

      ++v6;
    }
    while (v6 < -[NSArray count](self->_mediumNumberLayers, "count"));
  }
}

- (void)_createLargeHourMarkerLabelsAndAttachToViewIfNeeded
{
  NSArray *largeHourMarkerLabels;
  double *v4;
  NSArray *v5;
  NSArray *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _OWORD v10[12];
  _OWORD v11[19];

  largeHourMarkerLabels = self->_largeHourMarkerLabels;
  if (!largeHourMarkerLabels)
  {
    memset(v11, 0, sizeof(v11));
    memset(v10, 0, sizeof(v10));
    _LayoutConstants_37(self->_device, v10);
    if (self->_style <= 4)
      v4 = (double *)v11;
    else
      v4 = (double *)v11 + 1;
    -[NTKVictoryAnalogBackgroundView _createHourMarkerLabelsWithFontSize:](self, "_createHourMarkerLabelsWithFontSize:", *v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_largeHourMarkerLabels;
    self->_largeHourMarkerLabels = v5;

    -[NTKVictoryAnalogBackgroundView _applyPalette:forStyle:](self, "_applyPalette:forStyle:", self->_palette, self->_style);
    largeHourMarkerLabels = self->_largeHourMarkerLabels;
  }
  if (-[NSArray count](largeHourMarkerLabels, "count"))
  {
    v7 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_largeHourMarkerLabels, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "removeFromSuperview");
      -[UIView addSubview:](self->_contentView, "addSubview:", v8);

      ++v7;
    }
    while (v7 < -[NSArray count](self->_largeHourMarkerLabels, "count"));
  }
}

- (id)_createHourMarkerLabelsWithFontSize:(double)a3
{
  void *v5;
  uint64_t i;
  NTKVictoryLabel *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    v7 = objc_alloc_init(NTKVictoryLabel);
    -[NTKVictoryLabel setAdditionalPaddingInsets:](v7, "setAdditionalPaddingInsets:", 5.0);
    -[NTKVictoryLabel setTextAlignment:](v7, "setTextAlignment:", 1);
    +[NTKVictoryLabel victoryFontWithSize:style:](NTKVictoryLabel, "victoryFontWithSize:style:", 0, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](v7, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NTKVictoryAnalogBackgroundView _digitForIndex:](self, "_digitForIndex:", i));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKVictoryLabel setText:](v7, "setText:", v10);

    -[NTKVictoryLabel sizeToFit](v7, "sizeToFit");
    objc_msgSend(v5, "addObject:", v7);

  }
  return v5;
}

- (id)_createSmallHourMarkerLabelForIndex:(id)a3
{
  id v4;
  NTKVictoryLabel *v5;
  void *v6;
  void *v7;
  double v9[62];

  v4 = a3;
  v5 = objc_alloc_init(NTKVictoryLabel);
  -[NTKVictoryLabel setAdditionalPaddingInsets:](v5, "setAdditionalPaddingInsets:", 10.0);
  -[NTKVictoryLabel setTextAlignment:](v5, "setTextAlignment:", 1);
  _LayoutConstants_37(self->_device, v9);
  +[NTKVictoryLabel victoryFontWithSize:style:](NTKVictoryLabel, "victoryFontWithSize:style:", 0, v9[27]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](v5, "setFont:", v6);

  objc_msgSend(v4, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKVictoryLabel setText:](v5, "setText:", v7);
  -[NTKVictoryLabel sizeToFit](v5, "sizeToFit");
  return v5;
}

- (id)_createAndAddLayersWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_disabledLayerActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActions:", v6);
      objc_msgSend(v11, "setBounds:", v7, v8, v9, v10);
      -[UIView layer](self->_contentView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSublayer:", v11);

      objc_msgSend(v5, "addObject:", v11);
      --a3;
    }
    while (a3);
  }

  return v5;
}

- (UIImage)logoImage
{
  UIImage *logoImage;

  logoImage = self->_logoImage;
  if (logoImage)
    return logoImage;
  NTKImageNamed(CFSTR("victoryNTK-fullscreen-logo"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_circularDialLogoImage
{
  return NTKImageNamed(CFSTR("VictoryNTK-circular-logo"));
}

- (id)_dotImage
{
  UIImage *dotImage;
  double v4;
  double v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  double v13[62];
  CGSize v14;
  CGRect v15;

  dotImage = self->_dotImage;
  if (!dotImage)
  {
    _LayoutConstants_37(self->_device, v13);
    v4 = v13[0];
    -[CLKDevice screenScale](self->_device, "screenScale");
    v6 = v5 + v5;
    v14.width = v4;
    v14.height = v4;
    UIGraphicsBeginImageContextWithOptions(v14, 1, v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFill");

    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = v4;
    v15.size.height = v4;
    UIRectFill(v15);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, v4, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fill");

    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_dotImage;
    self->_dotImage = v10;

    UIGraphicsEndImageContext();
    dotImage = self->_dotImage;
  }
  return dotImage;
}

+ (id)_disabledLayerActions
{
  void *v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("contents");
  v5[1] = CFSTR("contentsMultiplyColor");
  v6[0] = v2;
  v6[1] = v2;
  v5[2] = CFSTR("transform");
  v5[3] = CFSTR("bounds");
  v6[2] = v2;
  v6[3] = v2;
  v5[4] = CFSTR("position");
  v5[5] = CFSTR("opacity");
  v6[4] = v2;
  v6[5] = v2;
  v5[6] = CFSTR("hidden");
  v6[6] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NTKVictoryAnalogBackgroundColorPalette)palette
{
  return self->_palette;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dialShape
{
  return self->_dialShape;
}

- (void)setLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_logoImage, a3);
}

- (NTKVictoryAnalogBackgroundViewDelegate)delegate
{
  return (NTKVictoryAnalogBackgroundViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_smallLogoButton, 0);
  objc_storeStrong((id *)&self->_logoButton, 0);
  objc_storeStrong((id *)&self->_transitionTimingFunction, 0);
  objc_storeStrong((id *)&self->_activeDigitIndices, 0);
  objc_storeStrong((id *)&self->_smallHourMarkerLabelsByIndex, 0);
  objc_storeStrong((id *)&self->_mediumNumberLayers, 0);
  objc_storeStrong((id *)&self->_largeHourMarkerLabels, 0);
  objc_storeStrong((id *)&self->_ringLayers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
