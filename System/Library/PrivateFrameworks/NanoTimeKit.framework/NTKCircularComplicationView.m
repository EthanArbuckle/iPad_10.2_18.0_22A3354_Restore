@implementation NTKCircularComplicationView

+ (id)viewForComplicationType:(unint64_t)a3
{
  return objc_alloc_init((Class)_ViewClassForComplicationType(a3));
}

+ (id)mediumViewForComplicationType:(unint64_t)a3
{
  id v3;

  if (a3 == 7)
    objc_opt_class();
  else
    _ViewClassForComplicationType(a3);
  v3 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setUsesMediumLayout:", 1);
  return v3;
}

+ (int64_t)layoutOverride
{
  return 4;
}

- (NTKCircularComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularComplicationView *v3;
  void *v4;
  uint64_t v5;
  CLKDevice *device;
  UIView *v7;
  UIView *highlightView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCircularComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = objc_claimAutoreleasedReturnValue();
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v7;

    -[UIView setAlpha:](v3->_highlightView, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](v3->_highlightView, "setUserInteractionEnabled:", 0);
    -[NTKCircularComplicationView addSubview:](v3, "addSubview:", v3->_highlightView);
    -[NTKCircularComplicationView setWantsPlatter:](v3, "setWantsPlatter:", 1);
    -[NTKCircularComplicationView _computeForegroundColor](v3, "_computeForegroundColor");
    -[NTKCircularComplicationView _computePlatterColor](v3, "_computePlatterColor");
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
  UIView *platter;
  void *v12;
  double v13;
  void *v14;

  -[NTKCircularComplicationView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  platter = self->_platter;
  if (platter)
  {
    -[UIView setFrame:](platter, "setFrame:", v3, v4, v5, v6);
    -[UIView layer](self->_platter, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9 * 0.5;
    objc_msgSend(v12, "setCornerRadius:", v9 * 0.5);

    -[NTKCircularComplicationView sendSubviewToBack:](self, "sendSubviewToBack:", self->_platter);
  }
  else
  {
    v13 = v5 * 0.5;
  }
  -[UIView setFrame:](self->_highlightView, "setFrame:", v7, v8, v9, v10);
  -[UIView layer](self->_highlightView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13);

  -[NTKCircularComplicationView bringSubviewToFront:](self, "bringSubviewToFront:", self->_highlightView);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularComplicationView;
  -[NTKCircularComplicationView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NTKCircularComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
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
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[NTKCircularComplicationView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  v21.origin.x = v8 + v17;
  v21.origin.y = v10 + v16;
  v21.size.width = v12 - (v17 + v19);
  v21.size.height = v14 - (v16 + v18);
  v20.x = x;
  v20.y = y;
  return CGRectContainsPoint(v21, v20);
}

- (void)setWantsPlatter:(BOOL)a3
{
  UIView *platter;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  self->_wantsPlatter = a3;
  platter = self->_platter;
  if (a3)
  {
    if (!platter)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v7 = self->_platter;
      self->_platter = v6;

      -[UIView setBackgroundColor:](self->_platter, "setBackgroundColor:", self->_platterColor);
      -[UIView setUserInteractionEnabled:](self->_platter, "setUserInteractionEnabled:", 0);
      -[NTKCircularComplicationView addSubview:](self, "addSubview:", self->_platter);
      -[NTKCircularComplicationView sendSubviewToBack:](self, "sendSubviewToBack:", self->_platter);
    }
  }
  else
  {
    -[UIView removeFromSuperview](platter, "removeFromSuperview");
    v5 = self->_platter;
    self->_platter = 0;

  }
}

- (void)_computeForegroundColor
{
  objc_storeStrong((id *)&self->_computedForegroundColor, self->_foregroundColor);
}

- (id)_computedForegroundColor
{
  return self->_computedForegroundColor;
}

- (void)_computePlatterColor
{
  objc_storeStrong((id *)&self->_computedPlatterColor, self->_platterColor);
}

- (id)_computedPlatterColor
{
  return self->_computedPlatterColor;
}

- (void)_updateForegroundColor
{
  UIView *highlightView;
  void *v4;

  highlightView = self->_highlightView;
  -[UIColor colorWithAlphaComponent:](self->_computedForegroundColor, "colorWithAlphaComponent:", 0.4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](highlightView, "setBackgroundColor:", v4);

  -[NTKCircularComplicationView _updateColorChange](self, "_updateColorChange");
}

- (void)_updatePlatterColor
{
  -[UIView setBackgroundColor:](self->_platter, "setBackgroundColor:", self->_computedPlatterColor);
}

- (void)setForegroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_foregroundColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[NTKCircularComplicationView _computeForegroundColor](self, "_computeForegroundColor");
    -[NTKCircularComplicationView _updateForegroundColor](self, "_updateForegroundColor");
  }

}

- (void)setUsesMultiColor:(BOOL)a3
{
  self->_usesMultiColor = a3;
  -[NTKCircularComplicationView _updateColorChange](self, "_updateColorChange");
}

- (void)setPlatterColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterColor, a3);
  -[NTKCircularComplicationView _computePlatterColor](self, "_computePlatterColor");
  -[NTKCircularComplicationView _updatePlatterColor](self, "_updatePlatterColor");
}

- (void)setUseRoundedFontDesign:(BOOL)a3
{
  if (self->_useRoundedFontDesign != a3)
  {
    self->_useRoundedFontDesign = a3;
    -[NTKCircularComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  }
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  if (self->_usesMediumLayout != a3)
  {
    self->_usesMediumLayout = a3;
    -[NTKCircularComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
    -[NTKCircularComplicationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateColorChange
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__NTKCircularComplicationView__updateColorChange__block_invoke;
  v3[3] = &unk_1E6BD41E0;
  v3[4] = self;
  -[NTKCircularComplicationView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v3);
  -[NTKCircularComplicationView _updateForTemplateChange](self, "_updateForTemplateChange");
}

void __49__NTKCircularComplicationView__updateColorChange__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  double v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "usesMultiColor");
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_computedForegroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v4);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1.0;
    if (v3)
      v5 = 0.0;
    objc_msgSend(v6, "transitionToMonochromeWithFraction:", v5);
  }

}

- (void)_updateImageViewColor:(id)a3
{
  void *v4;
  id v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "imageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v14;
      v6 = -[NTKCircularComplicationView usesMultiColor](self, "usesMultiColor");
      v7 = 0.0;
      if (v6)
        v7 = 1.0;
      objc_msgSend(v5, "setMulticolorAlpha:", v7);

    }
    if (-[NTKCircularComplicationView usesMultiColor](self, "usesMultiColor"))
    {
      -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "foregroundAccentImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v4, "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "tintColor");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v13 = (void *)v12;
        objc_msgSend(v14, "setColor:", v12);

        goto LABEL_13;
      }
      if (!v9)
      {
        -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {
      -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "setColor:", v9);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)_updateLabelViewColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[NTKCircularComplicationView usesMultiColor](self, "usesMultiColor"))
  {
    -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "textProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v11;
      v9 = v7;
    }
    else
    {
      if (!v5)
      {
        -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextColor:", v10);

        goto LABEL_8;
      }
      v8 = v11;
      v9 = v5;
    }
    objc_msgSend(v8, "setTextColor:", v9);
LABEL_8:

    goto LABEL_9;
  }
  -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v5);
LABEL_9:

}

- (void)setHighlighted:(BOOL)a3
{
  double v3;
  double v4;
  _QWORD v5[6];

  v3 = 0.2;
  v4 = 0.0;
  if (a3)
  {
    v3 = 0.0;
    v4 = 1.0;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NTKCircularComplicationView_setHighlighted___block_invoke;
  v5[3] = &unk_1E6BD09B0;
  v5[4] = self;
  *(double *)&v5[5] = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, v3);
}

uint64_t __46__NTKCircularComplicationView_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", *(double *)(a1 + 40));
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  CLKComplicationTemplate *v6;
  CLKComplicationTemplate *v7;

  v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    if (-[CLKComplicationTemplate isCompatibleWithFamily:](v7, "isCompatibleWithFamily:", *MEMORY[0x1E0C93E90]))-[NTKCircularComplicationView setUsesMediumLayout:](self, "setUsesMediumLayout:", 1);
    -[NTKCircularComplicationView _updateForTemplateChange](self, "_updateForTemplateChange");
    v6 = v7;
  }

}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  NSDate *timeTravelDate;
  NSDate *v9;
  _BOOL4 v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", timeTravelDate) & 1) != 0)
      goto LABEL_14;
    v9 = self->_timeTravelDate;
    v11 = -[CLKComplicationTemplate timeTravelUpdateFrequency](self->_complicationTemplate, "timeTravelUpdateFrequency") == 2
       || v9 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0)
      goto LABEL_14;
    v11 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__NTKCircularComplicationView_setTimeTravelDate_animated___block_invoke;
  v12[3] = &unk_1E6BD41E0;
  v12[4] = self;
  -[NTKCircularComplicationView _enumerateForegroundColoringViewsWithBlock:](self, "_enumerateForegroundColoringViewsWithBlock:", v12);
  if (v11)
    -[NTKCircularComplicationView _updateForTemplateChange](self, "_updateForTemplateChange");
LABEL_14:

}

void __58__NTKCircularComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setInTimeTravel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) != 0);

}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)off_1E6BCA6E0);
  objc_msgSend(v5, "setFont:", v4);
  -[NTKCircularComplicationView timeTravelDate](self, "timeTravelDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInTimeTravel:", v6 != 0);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke;
  v11[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setNowProvider:", v11);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke_2;
  v9[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setNeedsResizeHandler:", v9);
  -[NTKCircularComplicationView addSubview:](self, "addSubview:", v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

id __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeTravelDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (int64_t)_variableFontSizeForText:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  NTKClockFaceLocalizedString(CFSTR("WEATHER_DEGREE_SYMBOL"), CFSTR("°"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "rangeOfString:", v5);

  v7 = v4 - (v6 != 0x7FFFFFFFFFFFFFFFLL);
  if (v7 >= 3)
  {
    if (v7 == 3)
      v8 = 2;
    else
      v8 = v7 < 6;
  }
  else
  {
    v8 = 3;
  }

  return v8;
}

- (id)_mediumStackFontForText:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  CLKDevice *device;
  CLKDevice *v8;
  uint64_t v9;
  uint64_t v10;
  CLKDevice *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = -[NTKCircularComplicationView _variableFontSizeForText:](self, "_variableFontSizeForText:", a3);
  os_unfair_lock_lock((os_unfair_lock_t)&_mediumStackFontForText____lock);
  WeakRetained = objc_loadWeakRetained(&_mediumStackFontForText____cachedDevice);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    device = self->_device;
    v8 = (CLKDevice *)objc_loadWeakRetained(&_mediumStackFontForText____cachedDevice);
    if (device == v8)
    {
      v9 = -[CLKDevice version](self->_device, "version");
      v10 = _mediumStackFontForText____previousCLKDeviceVersion;

      if (v9 == v10)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v11 = self->_device;
  v12 = objc_storeWeak(&_mediumStackFontForText____cachedDevice, v11);
  _mediumStackFontForText____previousCLKDeviceVersion = -[CLKDevice version](v11, "version");

  __55__NTKCircularComplicationView__mediumStackFontForText___block_invoke(v13, (uint64_t)self->_device);
LABEL_6:
  if (v4 >= 2)
    v4 = 2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_mediumStackFontForText____lock);
  v14 = (void *)_mediumStackFontForText____fonts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __55__NTKCircularComplicationView__mediumStackFontForText___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 11.5, 13.0);
  objc_msgSend(v2, "scaledValue:", 10.5);
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 9.5, 10.0);
  v8[0] = &unk_1E6CA1278;
  _MakeFont(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = &unk_1E6CA1290;
  _MakeFont(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = &unk_1E6CA12A8;
  _MakeFont(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_mediumStackFontForText____fonts;
  _mediumStackFontForText____fonts = v6;

}

- ($F26A0301DDFB9D033C0383030B5B2CF7)_layoutConstants
{
  $F26A0301DDFB9D033C0383030B5B2CF7 *result;
  id v6;

  -[NTKCircularComplicationView device](self, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
    _LayoutConstantsMedium(v6, (uint64_t)retstr);
  else
    _LayoutConstantsSmall(v6, (uint64_t)retstr);

  return result;
}

- (id)_fontForDynamicFontSize:(int64_t)a3
{
  CLKDevice *v4;
  id v5;
  void *v6;
  CLKDevice *v7;
  _BOOL4 useRoundedFontDesign;
  id WeakRetained;
  void *v10;
  CLKDevice *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  CLKDevice *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;

  if (!self->_usesMediumLayout)
  {
    useRoundedFontDesign = self->_useRoundedFontDesign;
    v4 = self->_device;
    if (useRoundedFontDesign)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_RoundedFontForDynamicSize___lock);
      WeakRetained = objc_loadWeakRetained(&_RoundedFontForDynamicSize___cachedDevice);
      if (WeakRetained)
      {
        v10 = WeakRetained;
        v11 = (CLKDevice *)objc_loadWeakRetained(&_RoundedFontForDynamicSize___cachedDevice);
        if (v11 == v4)
        {
          v20 = -[CLKDevice version](v4, "version");
          v21 = _RoundedFontForDynamicSize___previousCLKDeviceVersion;

          if (v20 == v21)
          {
LABEL_17:
            os_unfair_lock_unlock((os_unfair_lock_t)&_RoundedFontForDynamicSize___lock);
            v16 = (void *)_RoundedFontForDynamicSize__roundedFonts;
            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      v22 = objc_storeWeak(&_RoundedFontForDynamicSize___cachedDevice, v4);
      _RoundedFontForDynamicSize___previousCLKDeviceVersion = -[CLKDevice version](v4, "version");

      ___RoundedFontForDynamicSize_block_invoke(v23, v4);
      goto LABEL_17;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_StandardFontForDynamicSize___lock);
    v17 = objc_loadWeakRetained(&_StandardFontForDynamicSize___cachedDevice);
    if (v17)
    {
      v18 = v17;
      v19 = (CLKDevice *)objc_loadWeakRetained(&_StandardFontForDynamicSize___cachedDevice);
      if (v19 == v4)
      {
        v24 = -[CLKDevice version](v4, "version");
        v25 = _StandardFontForDynamicSize___previousCLKDeviceVersion;

        if (v24 == v25)
        {
LABEL_20:
          os_unfair_lock_unlock((os_unfair_lock_t)&_StandardFontForDynamicSize___lock);
          v16 = (void *)_StandardFontForDynamicSize__standardFonts;
          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    v26 = objc_storeWeak(&_StandardFontForDynamicSize___cachedDevice, v4);
    _StandardFontForDynamicSize___previousCLKDeviceVersion = -[CLKDevice version](v4, "version");

    ___StandardFontForDynamicSize_block_invoke(v27, v4);
    goto LABEL_20;
  }
  v4 = self->_device;
  os_unfair_lock_lock((os_unfair_lock_t)&_MediumFontForDynamicSize___lock);
  v5 = objc_loadWeakRetained(&_MediumFontForDynamicSize___cachedDevice);
  if (!v5)
  {
LABEL_10:
    v14 = objc_storeWeak(&_MediumFontForDynamicSize___cachedDevice, v4);
    _MediumFontForDynamicSize___previousCLKDeviceVersion = -[CLKDevice version](v4, "version");

    ___MediumFontForDynamicSize_block_invoke(v15, v4);
    goto LABEL_11;
  }
  v6 = v5;
  v7 = (CLKDevice *)objc_loadWeakRetained(&_MediumFontForDynamicSize___cachedDevice);
  if (v7 != v4)
  {

    goto LABEL_10;
  }
  v12 = -[CLKDevice version](v4, "version");
  v13 = _MediumFontForDynamicSize___previousCLKDeviceVersion;

  if (v12 != v13)
    goto LABEL_10;
LABEL_11:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MediumFontForDynamicSize___lock);
  v16 = (void *)_MediumFontForDynamicSize__standardFonts;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  CLKUIImageNamed();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_timerImageProviderMedium:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C944E8];
  if (a3)
  {
    NTKImageNamed(CFSTR("victoryNTKTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("victoryNTKTimerBackground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("victoryNTKTimerForeground");
  }
  else
  {
    NTKImageNamed(CFSTR("colorAnalogTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("colorAnalogTimerBackground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("colorAnalogTimerForeground");
  }
  NTKImageNamed(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_alarmImageProviderMedium:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("victoryNTKAlarm");
  else
    v3 = CFSTR("colorAnalogAlarm");
  +[NTKCircularComplicationView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKCircularComplicationView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("alarm"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_stopwatchImageProviderMedium:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("victoryNTKStopwatch");
  else
    v3 = CFSTR("colorAnalogStopwatch");
  +[NTKCircularComplicationView _imageProviderForImageSymbolName:imageAssetNamePrefix:](NTKCircularComplicationView, "_imageProviderForImageSymbolName:imageAssetNamePrefix:", CFSTR("stopwatch"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (BOOL)useRoundedFontDesign
{
  return self->_useRoundedFontDesign;
}

- (BOOL)usesMediumLayout
{
  return self->_usesMediumLayout;
}

- (BOOL)wantsPlatter
{
  return self->_wantsPlatter;
}

- (BOOL)usesMultiColor
{
  return self->_usesMultiColor;
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 432, 1);
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedPlatterColor, 0);
  objc_storeStrong((id *)&self->_computedForegroundColor, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_platter, 0);
}

@end
