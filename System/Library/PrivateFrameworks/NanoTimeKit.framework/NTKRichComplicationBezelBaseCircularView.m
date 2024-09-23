@implementation NTKRichComplicationBezelBaseCircularView

- (NTKRichComplicationBezelBaseCircularView)init
{
  NTKRichComplicationBezelBaseCircularView *v2;
  NTKRichComplicationBezelBaseCircularView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v2 = -[NTKRichComplicationBezelView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKRichComplicationBezelBaseCircularView _createBezelLabel](v2, "_createBezelLabel");
    v3->_newDataAnimationCircularScale = 1.0;
    v3->_newDataAnimationBezelLabelScale = 1.0;
    v3->_allowNofityingDelegateWithBezelTextUpdate = 1;
    v3->_allowUpdatingBezelTextProperties = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  -[NTKRichComplicationBezelBaseCircularView layoutSubviews](&v4, sel_layoutSubviews);
  -[NTKRichComplicationBezelBaseCircularView _layoutCircularView](self, "_layoutCircularView");
  -[NTKRichComplicationBezelBaseCircularView _layoutBezelLabel](self, "_layoutBezelLabel");
  if (-[CLKUICurvedColoringLabel isHidden](self->_bezelTextLabel, "isHidden"))
  {
    -[CDRichComplicationTemplateView frame](self->_circularView, "frame");
    v3 = 0;
  }
  else
  {
    -[NTKRichComplicationBezelBaseCircularView bounds](self, "bounds");
    v3 = 2;
  }
  -[NTKRichComplicationBezelView _updateHitTestShape:frame:](self, "_updateHitTestShape:frame:", v3);
}

- (void)setBezelTextColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v4 = a3;
  -[NTKRichComplicationBezelView setBezelTextColor:](&v5, sel_setBezelTextColor_, v4);
  -[CLKUICurvedColoringLabel setColor:](self->_bezelTextLabel, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void)setBezelLabelCircularRadius:(double)a3
{
  self->_bezelLabelCircularRadius = a3;
  -[CLKUICurvedColoringLabel setCircleRadius:](self->_bezelTextLabel, "setCircleRadius:");
  -[NTKRichComplicationBezelBaseCircularView setNeedsLayout](self, "setNeedsLayout");
}

- (CGPoint)circularViewCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  _OWORD v10[4];
  uint64_t v11;
  CGPoint result;

  -[NTKRichComplicationBezelBaseCircularView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  -[CDRichComplicationView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_17(v7, (uint64_t)v10);

  v8 = v4 * 0.5;
  v9 = v6 * 0.5 - *(double *)v10;
  result.y = v9;
  result.x = v8;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  -[NTKRichComplicationBezelBaseCircularView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUICurvedColoringLabel text](self->_bezelTextLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@ %@]"), v4, v5, self->_circularView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  objc_class *v6;
  CDRichComplicationTemplateView *v7;
  CDRichComplicationTemplateView *circularView;
  void *v9;
  void *v10;
  CDRichComplicationTemplateView *v11;
  void *v12;
  CLKUICurvedColoringLabel *bezelTextLabel;
  CLKUICurvedColoringLabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = -[NTKRichComplicationBezelBaseCircularView _circularViewClassFromFromTemplate:](self, "_circularViewClassFromFromTemplate:");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CDRichComplicationTemplateView removeFromSuperview](self->_circularView, "removeFromSuperview");
    -[CDRichComplicationTemplateView setDisplayObserver:](self->_circularView, "setDisplayObserver:", 0);
    v7 = (CDRichComplicationTemplateView *)objc_alloc_init(v6);
    circularView = self->_circularView;
    self->_circularView = v7;

    -[CDRichComplicationTemplateView setFilterProvider:](self->_circularView, "setFilterProvider:", self);
    -[CDRichComplicationTemplateView setDisplayObserver:](self->_circularView, "setDisplayObserver:", self);
    -[CDRichComplicationView timeTravelDate](self, "timeTravelDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[CDRichComplicationTemplateView setTimeTravelDate:animated:](self->_circularView, "setTimeTravelDate:animated:", v9, 0);
    -[CDRichComplicationTemplateView setPaused:](self->_circularView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    -[NTKRichComplicationBezelBaseCircularView addSubview:](self, "addSubview:", self->_circularView);

  }
  -[CDRichComplicationTemplateView transitThemeFromTheme:toTheme:fraction:](self->_circularView, "transitThemeFromTheme:toTheme:fraction:", self->_fromTheme, self->_toTheme, self->_themeFraction);
  -[NTKRichComplicationBezelBaseCircularView _circularTemplateFromTemplate:](self, "_circularTemplateFromTemplate:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationTemplateView setComplicationTemplate:reason:](self->_circularView, "setComplicationTemplate:reason:", v10, a4);
  v11 = self->_circularView;
  if (self->_inMonochromeModeFraction == 1.0)
    -[CDRichComplicationTemplateView updateMonochromeColor](v11, "updateMonochromeColor");
  else
    -[CDRichComplicationTemplateView transitionToMonochromeWithFraction:](v11, "transitionToMonochromeWithFraction:");
  -[NTKRichComplicationBezelBaseCircularView _bezelTextProviderFromTemplate:](self, "_bezelTextProviderFromTemplate:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  bezelTextLabel = self->_bezelTextLabel;
  if (v12)
  {
    -[CLKUICurvedColoringLabel setHidden:](bezelTextLabel, "setHidden:", 0);
    v14 = self->_bezelTextLabel;
    v15 = v12;
  }
  else
  {
    -[CLKUICurvedColoringLabel setHidden:](bezelTextLabel, "setHidden:", 1);
    v14 = self->_bezelTextLabel;
    v15 = 0;
  }
  -[CLKUICurvedColoringLabel setTextProvider:](v14, "setTextProvider:", v15);
  -[NTKRichComplicationBezelBaseCircularView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_applyPausedUpdate
{
  -[CDRichComplicationTemplateView setPaused:](self->_circularView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[CDRichComplicationTemplateView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_circularView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6)
    -[NTKRichComplicationBezelBaseCircularView _setWhistlerAnalogEditingTransitonFraction:direction:position:](self, "_setWhistlerAnalogEditingTransitonFraction:direction:position:", a4, a5, a3);
}

- (void)_editingDidEnd
{
  self->_bezelTextLabelRotationInDegree = 0.0;
  self->_circularViewRotationInDegree = 0.0;
  -[CDRichComplicationTemplateView _editingDidEnd](self->_circularView, "_editingDidEnd");
}

- (void)_layoutBezelLabel
{
  void *v3;
  CLKUICurvedColoringLabel *bezelTextLabel;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  _OWORD v15[3];
  __int128 v16;
  double v17;
  double v18;

  -[CLKUICurvedColoringLabel textProvider](self->_bezelTextLabel, "textProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v17 = 0.0;
    v18 = 0.0;
    v16 = *MEMORY[0x1E0C9D538];
    bezelTextLabel = self->_bezelTextLabel;
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v15[0] = *MEMORY[0x1E0C9BAA8];
    v15[1] = v5;
    v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CLKUICurvedColoringLabel setTransform:](bezelTextLabel, "setTransform:", v15);
    -[CLKUICurvedColoringLabel sizeToFit](self->_bezelTextLabel, "sizeToFit");
    -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_bezelTextLabel, "getTextCenter:startAngle:endAngle:", &v16, &v18, &v17);
    v6 = MEMORY[0x1BCCA72B8](-[NTKRichComplicationBezelBaseCircularView bounds](self, "bounds"));
    -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_bezelTextLabel, v6 - *(double *)&v16, v7 - *((double *)&v16 + 1), self->_bezelTextLabelRotationInDegree, self->_newDataAnimationBezelLabelScale);
    v8 = fabs(v18);
    v9 = fabs(v17);
    if (v8 >= v9)
      v10 = v8;
    else
      v10 = v9;
    if (v8 >= v9)
      v8 = v9;
    v11 = v10 - v8;
  }
  else
  {
    v11 = 0.0;
  }
  if (self->_allowUpdatingBezelTextProperties)
    -[NTKRichComplicationBezelView setBezelTextWidthInRadius:](self, "setBezelTextWidthInRadius:", v11);
  if (self->_allowNofityingDelegateWithBezelTextUpdate)
  {
    -[NTKRichComplicationBezelView delegate](self, "delegate", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[NTKRichComplicationBezelView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didUpdateBezelTextForRichComplicationBezelView:", self);

    }
  }
}

- (void)_layoutCircularView
{
  void *v3;
  double v4;
  CDRichComplicationTemplateView *circularView;
  __int128 v6;
  double v7;
  double v8;
  CDRichComplicationTemplateView *v9;
  CDRichComplicationTemplateView *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  _OWORD v14[3];

  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKWhistlerSubdialComplicationDiameter(v3);

  circularView = self->_circularView;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v6;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CDRichComplicationTemplateView setTransform:](circularView, "setTransform:", v14);
  -[CDRichComplicationTemplateView setFrame:](self->_circularView, "setFrame:", 0.0, 0.0, v4, v4);
  -[NTKRichComplicationBezelBaseCircularView circularViewCenter](self, "circularViewCenter");
  -[NTKRichComplicationBezelView _setLayoutTransformToView:origin:rotationInDegree:centerScale:](self, "_setLayoutTransformToView:origin:rotationInDegree:centerScale:", self->_circularView, v7 - v4 * 0.5, v8 - v4 * 0.5, self->_circularViewRotationInDegree, 1.0);
  v9 = self->_circularView;
  if (v9)
  {
    -[CDRichComplicationTemplateView transform](v9, "transform");
    v10 = self->_circularView;
  }
  else
  {
    v10 = 0;
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformScale(&v13, &v12, self->_newDataAnimationCircularScale, self->_newDataAnimationCircularScale);
  v11 = v13;
  -[CDRichComplicationTemplateView setTransform:](v10, "setTransform:", &v11);
}

- (void)_transitThemeFromTheme:(int64_t)a3 toTheme:(int64_t)a4 fraction:(double)a5
{
  self->_fromTheme = a3;
  self->_toTheme = a4;
  self->_themeFraction = a5;
  -[CDRichComplicationTemplateView transitThemeFromTheme:toTheme:fraction:](self->_circularView, "transitThemeFromTheme:toTheme:fraction:");
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  double v5;
  double v6;

  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationBezelLabelScale = v5;
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationCircularScale = v6;
  -[NTKRichComplicationBezelBaseCircularView _layoutCircularView](self, "_layoutCircularView");
  -[NTKRichComplicationBezelBaseCircularView _layoutBezelLabel](self, "_layoutBezelLabel");
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v6 = a3;
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](&v7, sel_setTimeTravelDate_animated_, v6, v4);
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](self->_circularView, "setTimeTravelDate:animated:", v6, v4, v7.receiver, v7.super_class);

}

- (void)setForegroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v4 = a3;
  -[CDRichComplicationView setForegroundColor:](&v5, sel_setForegroundColor_, v4);
  -[CDRichComplicationTemplateView setForegroundColor:](self->_circularView, "setForegroundColor:", v4, v5.receiver, v5.super_class);

}

- (id)_bezelTextProviderFromTemplate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "textProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_circularTemplateFromTemplate:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "circularTemplate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUICurvedColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBezelBaseCircularView;
  v4 = (void (**)(id, CLKUICurvedColoringLabel *))a3;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_bezelTextLabel);
  -[CDRichComplicationTemplateView _enumerateLabelsWithBlock:](self->_circularView, "_enumerateLabelsWithBlock:", v4, v5.receiver, v5.super_class);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_inMonochromeModeFraction = a3;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 1, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CLKUICurvedColoringLabel layer](self->_bezelTextLabel, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

  }
  -[CDRichComplicationTemplateView transitionToMonochromeWithFraction:](self->_circularView, "transitionToMonochromeWithFraction:", a3);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  id v5;

  self->_inMonochromeModeFraction = 1.0;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CLKUICurvedColoringLabel layer](self->_bezelTextLabel, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v5);

  }
  -[CDRichComplicationTemplateView updateMonochromeColor](self->_circularView, "updateMonochromeColor");

}

- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5
{
  id v8;

  -[CDRichComplicationView displayObserver](self, "displayObserver", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "complicationDisplay:renderStatsWithTime:cost:", self, a4, a5);

}

- (void)_createBezelLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  CLKUICurvedColoringLabel *bezelTextLabel;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_17(v3, (uint64_t)&v18);

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], *((double *)&v18 + 1), *MEMORY[0x1E0DC1438]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CLKFontWithAlternativePunctuation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFont:", v6);
  objc_msgSend(v4, "setUsesLegibility:", 0);
  objc_msgSend(v4, "setUppercase:", 1);
  objc_msgSend(v4, "setAlpha:", 1.0);
  objc_msgSend(v4, "setHidden:", 1);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke;
  v15[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v4, "setNowProvider:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke_2;
  v13[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "setNeedsResizeHandler:", v13);
  objc_msgSend(v4, "setInterior:", 0);
  objc_msgSend(v4, "setCenterAngle:", *(double *)&v19);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ar"));
  v11 = 24;
  if (v10)
    v11 = 32;
  objc_msgSend(v4, "setTracking:", *(double *)((char *)&v18 + v11));
  objc_msgSend(v4, "setMaxAngularWidth:", *((double *)&v20 + 1));
  -[NTKRichComplicationBezelBaseCircularView addSubview:](self, "addSubview:", v4);
  bezelTextLabel = self->_bezelTextLabel;
  self->_bezelTextLabel = (CLKUICurvedColoringLabel *)v4;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

id __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x1E0C944A0];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__NTKRichComplicationBezelBaseCircularView__createBezelLabel__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;
  __int128 v10;

  if ((unint64_t)a5 <= 1)
    CLKCompressFraction();
  -[CDRichComplicationView device](self, "device", a4, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_17(v7, (uint64_t)&v10);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1)
    v8 = -v8;
  self->_bezelTextLabelRotationInDegree = v8;
  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1)
    v9 = -v9;
  self->_circularViewRotationInDegree = v9;
  -[NTKRichComplicationBezelBaseCircularView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateNewDataAnimationFinalAlpha:(double)a3 finalBezelLabelScale:(double)a4 finalCircularViewScale:(double)a5 animationApplierBlock:(id)a6 animationFraction:(float)a7
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a6;
  -[NTKRichComplicationBezelBaseCircularView alpha](self, "alpha");
  v9 = a7;
  CLKInterpolateBetweenFloatsClipped();
  v11 = v10;
  -[NTKRichComplicationBezelBaseCircularView setAlpha:](self, "setAlpha:");
  -[NTKRichComplicationBezelView setBezelTextAlpha:](self, "setBezelTextAlpha:", v11);
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationCircularScale = v12;
  CLKInterpolateBetweenFloatsClipped();
  self->_newDataAnimationBezelLabelScale = v13;
  -[NTKRichComplicationBezelBaseCircularView setNeedsLayout](self, "setNeedsLayout");
  -[NTKRichComplicationBezelBaseCircularView layoutIfNeeded](self, "layoutIfNeeded");
  v14 = v15;
  if (v15)
  {
    (*((void (**)(id, double))v15 + 2))(v15, v9);
    v14 = v15;
  }

}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD *v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  float v32;
  double v33;
  double v34;
  float v35;
  void *v36;
  void *v37;
  double v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;

  v12 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a9;
  if (v12)
    v17 = v14;
  else
    v17 = v15;
  if (v12)
    v18 = v15;
  else
    v18 = v14;
  v19 = v17;
  v20 = v18;
  objc_msgSend(v19, "setAlpha:", 1.0);
  objc_msgSend(v20, "setAlpha:", 0.0);
  if (a6)
  {
    if (a6 != 1)
      goto LABEL_12;
    v21 = 1.0;
    v22 = 1.0;
  }
  else
  {
    v22 = 0.95;
    v21 = 0.9;
  }
  v19[86] = 0x3FF0000000000000;
  v19[87] = 0x3FF0000000000000;
  *((double *)v20 + 86) = v21;
  *((double *)v20 + 87) = v22;
LABEL_12:
  *((_BYTE *)v20 + 705) = 0;
  objc_msgSend(v14, "setNeedsLayout");
  objc_msgSend(v14, "layoutIfNeeded");
  objc_msgSend(v15, "setNeedsLayout");
  objc_msgSend(v15, "layoutIfNeeded");
  objc_msgSend(v20, "bezelTextWidthInRadius");
  v24 = v23;
  objc_msgSend(v19, "bezelTextWidthInRadius");
  v26 = v25;
  if (v24 <= v25)
  {
    *((_BYTE *)v20 + 704) = 0;
    objc_msgSend(v19, "bezelTextWidthInRadius");
    objc_msgSend(v20, "setBezelTextWidthInRadius:");
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __178__NTKRichComplicationBezelBaseCircularView_updateCustomDataAnimationFromEarlierView_laterView_isForward_animationType_animationDuration_animationFraction_bezelTextUpdateHandler___block_invoke;
  aBlock[3] = &unk_1E6BD34A8;
  v42 = v16;
  v27 = v19;
  v40 = v27;
  v28 = v20;
  v41 = v28;
  v29 = v16;
  v30 = _Block_copy(aBlock);
  CLKCompressFraction();
  v32 = v31;
  CLKCompressFraction();
  v35 = v34;
  if (v24 > v26)
    v36 = v30;
  else
    v36 = 0;
  if (v24 > v26)
    v37 = 0;
  else
    v37 = v30;
  *(float *)&v33 = v32;
  objc_msgSend(v27, "_updateNewDataAnimationFinalAlpha:finalBezelLabelScale:finalCircularViewScale:animationApplierBlock:animationFraction:", v36, 0.0, *((double *)v28 + 87), *((double *)v28 + 86), v33);
  *((_BYTE *)v28 + 704) = v32 >= 1.0;
  *(float *)&v38 = v35;
  objc_msgSend(v28, "_updateNewDataAnimationFinalAlpha:finalBezelLabelScale:finalCircularViewScale:animationApplierBlock:animationFraction:", v37, 1.0, 1.0, 1.0, v38);
  if (a8 >= 1.0)
  {
    *((_BYTE *)v28 + 704) = 1;
    *((_BYTE *)v28 + 705) = 1;
  }

}

uint64_t __178__NTKRichComplicationBezelBaseCircularView_updateCustomDataAnimationFromEarlierView_laterView_isForward_animationType_animationDuration_animationFraction_bezelTextUpdateHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "bezelTextWidthInRadius");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "bezelTextWidthInRadius");
  return (*(uint64_t (**)(uint64_t, double, double, double))(v4 + 16))(v4, v6, v7, a2);
}

- (double)bezelLabelCircularRadius
{
  return self->_bezelLabelCircularRadius;
}

- (CDRichComplicationView)circularView
{
  return &self->_circularView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelTextLabel, 0);
  objc_storeStrong((id *)&self->_circularView, 0);
}

- (Class)_circularViewClassFromFromTemplate:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
