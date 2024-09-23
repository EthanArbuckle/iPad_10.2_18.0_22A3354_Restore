@implementation NTKColorSlider

- (NTKColorSlider)initWithFrame:(CGRect)a3
{
  NTKColorSlider *v3;
  double v4;
  NTKColorSlider *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  void *v14;
  UISelectionFeedbackGenerator *v15;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  uint64_t v17;
  CAGradientLayer *trackLayer;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CAGradientLayer *v23;
  void *v24;
  CATransform3D v26;
  CATransform3D v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)NTKColorSlider;
  v3 = -[NTKColorSlider initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 0;
    -[NTKColorSlider setMinimumValue:](v3, "setMinimumValue:", v4);
    LODWORD(v6) = 1.0;
    -[NTKColorSlider setMaximumValue:](v5, "setMaximumValue:", v6);
    LODWORD(v7) = 0.5;
    -[NTKColorSlider setValue:](v5, "setValue:", v7);
    v5->_layoutDirection = CLKLayoutIsRTL();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4138]), "initWithStyle:", 2);
    -[NTKColorSlider _setEdgeFeedbackGenerator:](v5, "_setEdgeFeedbackGenerator:", v8);

    -[NTKColorSlider _edgeFeedbackGenerator](v5, "_edgeFeedbackGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAxis:", 1);

    -[NTKColorSlider maximumValue](v5, "maximumValue");
    v11 = v10;
    -[NTKColorSlider minimumValue](v5, "minimumValue");
    v13 = (float)(v11 - v12);
    -[NTKColorSlider _edgeFeedbackGenerator](v5, "_edgeFeedbackGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDistance:", v13);

    v15 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    selectionFeedbackGenerator = v5->_selectionFeedbackGenerator;
    v5->_selectionFeedbackGenerator = v15;

    -[UISelectionFeedbackGenerator _setOutputMode:](v5->_selectionFeedbackGenerator, "_setOutputMode:", 5);
    -[NTKColorSlider addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v5, sel_valueDidChange_forEvent_, 4096);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v17 = objc_claimAutoreleasedReturnValue();
    trackLayer = v5->_trackLayer;
    v5->_trackLayer = (CAGradientLayer *)v17;

    -[CAGradientLayer setCornerCurve:](v5->_trackLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[CAGradientLayer setStartPoint:](v5->_trackLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v5->_trackLayer, "setEndPoint:", 1.0, 0.5);
    if (v5->_layoutDirection == 1)
    {
      CATransform3DMakeScale(&v27, -1.0, 1.0, 1.0);
    }
    else
    {
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v27.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v27.m33 = v19;
      v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v27.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v27.m43 = v20;
      v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v27.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v27.m13 = v21;
      v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v27.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v27.m23 = v22;
    }
    v23 = v5->_trackLayer;
    v26 = v27;
    -[CAGradientLayer setTransform:](v23, "setTransform:", &v26);
    -[NTKColorSlider layer](v5, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertSublayer:atIndex:", v5->_trackLayer, 0);

    -[NTKColorSlider setClipsToBounds:](v5, "setClipsToBounds:", 0);
  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double width;
  double height;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)NTKColorSlider;
  -[NTKColorSlider layoutSubviews](&v14, sel_layoutSubviews);
  -[NTKColorSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView bounds](self->_thumbView, "bounds");
  -[NTKColorSliderThumbView setFrame:](self->_thumbContent, "setFrame:");
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectInset(v15, *MEMORY[0x1E0C9D820], 9.0);
  width = v16.size.width;
  height = v16.size.height;
  -[CAGradientLayer setFrame:](self->_trackLayer, "setFrame:", v16.origin.x, v16.origin.y);
  if (width >= height)
    v13 = height;
  else
    v13 = width;
  -[CAGradientLayer setCornerRadius:](self->_trackLayer, "setCornerRadius:", v13 * 0.5);
}

- (void)setColors:(id)a3
{
  NSArray **p_colors;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  p_colors = &self->_colors;
  objc_storeStrong((id *)&self->_colors, a3);
  v12 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  -[NTKColorSlider _colorGradientStep](self, "_colorGradientStep");
  v8 = *p_colors;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __28__NTKColorSlider_setColors___block_invoke;
  v13[3] = &unk_1E6BD8F18;
  v14 = v6;
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v11 = v6;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CAGradientLayer setColors:](self->_trackLayer, "setColors:", v11);
  -[CAGradientLayer setLocations:](self->_trackLayer, "setLocations:", v10);
  -[NTKColorSlider _updateThumbColor](self, "_updateThumbColor");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __28__NTKColorSlider_setColors___block_invoke(uint64_t a1, id a2, unint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48) * (double)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

+ (CGRect)frameForTrackFrame:(CGRect)a3
{
  return CGRectInset(a3, 0.0, -9.0);
}

- (void)_updateThumbColor
{
  float v3;
  NSArray *colors;
  uint64_t v5;
  float v6;
  NSArray *v7;
  uint64_t v8;
  double v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  if (-[NSArray count](self->_colors, "count"))
  {
    -[NTKColorSlider value](self, "value");
    if (v3 == 0.0)
    {
      colors = self->_colors;
      v5 = 0;
    }
    else
    {
      -[NTKColorSlider value](self, "value");
      if (v6 != 1.0)
      {
        -[NTKColorSlider _colorGradientStep](self, "_colorGradientStep");
        v10 = v9;
        -[NTKColorSlider value](self, "value");
        v12 = v11 / v10;
        -[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", (uint64_t)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", (uint64_t)v12 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NTKInterpolateBetweenColors(v13, v14);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        v8 = (uint64_t)v16;
        goto LABEL_8;
      }
      v7 = self->_colors;
      v5 = -[NSArray count](v7, "count") - 1;
      colors = v7;
    }
    -[NSArray objectAtIndexedSubscript:](colors, "objectAtIndexedSubscript:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v15 = (id)v8;
    -[NTKColorSliderThumbView setColor:](self->_thumbContent, "setColor:", v8);

  }
}

- (double)_colorGradientStep
{
  NSUInteger v3;
  double result;

  v3 = -[NSArray count](self->_colors, "count");
  result = 1.0;
  if (v3 >= 2)
    return 1.0 / (double)(-[NSArray count](self->_colors, "count", 1.0) - 1);
  return result;
}

- (id)createThumbView
{
  UIImageView *thumbView;
  UIImageView *v4;
  UIImageView *v5;
  NTKColorSliderThumbView *v6;
  NTKColorSliderThumbView *thumbContent;

  thumbView = self->_thumbView;
  if (!thumbView)
  {
    v4 = (UIImageView *)objc_opt_new();
    v5 = self->_thumbView;
    self->_thumbView = v4;

    v6 = (NTKColorSliderThumbView *)objc_opt_new();
    thumbContent = self->_thumbContent;
    self->_thumbContent = v6;

    -[UIImageView addSubview:](self->_thumbView, "addSubview:", self->_thumbContent);
    -[NTKColorSlider _updateThumbColor](self, "_updateThumbColor");
    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (CGRect)trackRectForBounds:(CGRect)a3
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
  objc_super v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)NTKColorSlider;
  -[NTKColorSlider trackRectForBounds:](&v15, sel_trackRectForBounds_);
  v8 = v7;
  v10 = v9;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v11 = CGRectGetWidth(v16) + 18.0;
  v12 = -9.0;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v11;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NTKColorSliderThumbView sizeThatFits:](self->_thumbContent, "sizeThatFits:", a3.size.width, a3.size.height);
  v10 = v9;
  v12 = v11;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGRectGetWidth(v18);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v10;
  v19.size.height = v12;
  CGRectGetWidth(v19);
  UIRectCenteredYInRectScale();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (void)_setValue:(float)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKColorSlider;
  -[NTKColorSlider setValue:animated:](&v5, sel_setValue_animated_, a4);
  -[NTKColorSlider _updateThumbColor](self, "_updateThumbColor");
}

- (BOOL)_valueIsInsideMidpoint:(float)a3
{
  float v5;
  float v6;
  float v7;
  float v8;

  -[NTKColorSlider maximumValue](self, "maximumValue");
  v6 = v5;
  -[NTKColorSlider minimumValue](self, "minimumValue");
  v8 = a3 + (float)((float)(v6 - v7) * -0.5);
  if (v8 < 0.0)
    v8 = -v8;
  return v8 + -0.01 < 0.0;
}

- (void)valueDidChange:(id)a3 forEvent:(id)a4
{
  id v5;
  float v6;
  float v7;
  BOOL v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  void *v15;
  NTKColorSlider *v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  float v27;
  id v28;

  v5 = a4;
  -[NTKColorSlider value](self, "value");
  v7 = v6;
  if (-[NTKColorSlider _valueIsInsideMidpoint:](self, "_valueIsInsideMidpoint:"))
  {
    if (!self->_shouldTriggerMidpointFeedback)
      goto LABEL_6;
    -[UISelectionFeedbackGenerator selectionChanged](self->_selectionFeedbackGenerator, "selectionChanged");
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  self->_shouldTriggerMidpointFeedback = v8;
LABEL_6:
  v9 = v7;
  -[NTKColorSlider _updateThumbColor](self, "_updateThumbColor");
  objc_msgSend(v5, "allTouches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "anyObject");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v28, "phase"))
  {
    case 0:
      -[UISelectionFeedbackGenerator prepare](self->_selectionFeedbackGenerator, "prepare");
      -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prepare");

      -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInteractionStarted");

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "colorSlider:valueChanged:phase:", self, 0, v7);

      goto LABEL_8;
    case 1:
LABEL_8:
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = v14;
      v16 = self;
      v17 = v7;
      v18 = 1;
      goto LABEL_11;
    case 3:
      -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userInteractionEnded");

      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "colorSlider:valueChanged:phase:", self, 2, v7);

      *(float *)&v21 = v7;
      -[NTKColorSlider setValue:animated:](self, "setValue:animated:", 0, v21);
      break;
    case 4:
      -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "userInteractionCancelled");

      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = v14;
      v16 = self;
      v17 = v7;
      v18 = 3;
LABEL_11:
      objc_msgSend(v14, "colorSlider:valueChanged:phase:", v16, v18, v17);

      break;
    default:
      break;
  }
  -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKColorSlider _edgeFeedbackGenerator](self, "_edgeFeedbackGenerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "distance");
  v26 = v25;
  -[NTKColorSlider minimumValue](self, "minimumValue");
  objc_msgSend(v23, "positionUpdated:", v26 * (v9 - v27));

}

- (NTKColorSliderDelegate)delegate
{
  return (NTKColorSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_storeStrong((id *)&self->_thumbContent, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
}

@end
