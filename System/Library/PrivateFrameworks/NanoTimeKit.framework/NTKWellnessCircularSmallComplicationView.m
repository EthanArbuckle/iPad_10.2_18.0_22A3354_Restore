@implementation NTKWellnessCircularSmallComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 4);
  else
    v4 = 0;

  return v4;
}

- (NTKWellnessCircularSmallComplicationView)initWithFrame:(CGRect)a3
{
  NTKWellnessCircularSmallComplicationView *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *ringsFillFractions;
  NTKRingsAndDotsView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NTKRingsAndDotsView *ringsView;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[NTKRingsAndDotsView emptyFillFractions](NTKRingsAndDotsView, "emptyFillFractions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    ringsFillFractions = v3->_ringsFillFractions;
    v3->_ringsFillFractions = (NSMutableArray *)v5;

    v7 = [NTKRingsAndDotsView alloc];
    -[NTKWellnessCircularSmallComplicationView _ringDiameter](v3, "_ringDiameter");
    v9 = v8;
    -[NTKWellnessCircularSmallComplicationView _ringStrokeWidth](v3, "_ringStrokeWidth");
    v11 = v10;
    -[NTKWellnessCircularSmallComplicationView _ringGapWidth](v3, "_ringGapWidth");
    v13 = v12;
    -[NTKWellnessCircularSmallComplicationView _overlapStrokeWidth](v3, "_overlapStrokeWidth");
    v15 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v7, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v9, v11, v13, v14);
    ringsView = v3->_ringsView;
    v3->_ringsView = (NTKRingsAndDotsView *)v15;

    -[NTKRingsAndDotsView setRingsFillFractions:](v3->_ringsView, "setRingsFillFractions:", v3->_ringsFillFractions);
    -[NTKRingsAndDotsView setUserInteractionEnabled:](v3->_ringsView, "setUserInteractionEnabled:", 0);
    -[NTKWellnessCircularSmallComplicationView addSubview:](v3, "addSubview:", v3->_ringsView);
    -[NTKCircularComplicationView setWantsPlatter:](v3, "setWantsPlatter:", 0);
  }
  return v3;
}

- (double)_ringDiameter
{
  void *v4;
  double v5;
  double v6;

  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
  {
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    return v6;
  }
  else
  {
    -[NTKCircularComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKCircularSmallComplicationDiameter();

    return v5;
  }
}

- (double)_ringStrokeWidth
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  double *v13;
  uint64_t v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_ringStrokeWidth___lock);
  WeakRetained = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    -[NTKCircularComplicationView device](self, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
    if (v5 == v6)
    {
      -[NTKCircularComplicationView device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "version");
      v9 = _ringStrokeWidth___previousCLKDeviceVersion;

      if (v8 == v9)
        goto LABEL_6;
    }
    else
    {

    }
  }
  -[NTKCircularComplicationView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&_ringStrokeWidth___cachedDevice, v10);

  v11 = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
  _ringStrokeWidth___previousCLKDeviceVersion = objc_msgSend(v11, "version");

  -[NTKCircularComplicationView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __60__NTKWellnessCircularSmallComplicationView__ringStrokeWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_ringStrokeWidth___lock);
  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
  {
    v13 = (double *)&_ringStrokeWidth__mediumWidth;
  }
  else
  {
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    v13 = (double *)&v15;
  }
  return *v13;
}

void __60__NTKWellnessCircularSmallComplicationView__ringStrokeWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 4.0, 3.0);
  _ringStrokeWidth__mediumWidth = v2;

}

- (double)_ringGapWidth
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  double result;

  os_unfair_lock_lock((os_unfair_lock_t)&_ringGapWidth___lock);
  WeakRetained = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    -[NTKCircularComplicationView device](self, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
    if (v5 == v6)
    {
      -[NTKCircularComplicationView device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "version");
      v9 = _ringGapWidth___previousCLKDeviceVersion;

      if (v8 == v9)
        goto LABEL_6;
    }
    else
    {

    }
  }
  -[NTKCircularComplicationView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&_ringGapWidth___cachedDevice, v10);

  v11 = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
  _ringGapWidth___previousCLKDeviceVersion = objc_msgSend(v11, "version");

  -[NTKCircularComplicationView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __57__NTKWellnessCircularSmallComplicationView__ringGapWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_ringGapWidth___lock);
  v13 = -[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout");
  result = *(double *)&_ringGapWidth__mediumWidth;
  if (!v13)
    return 2.0;
  return result;
}

void __57__NTKWellnessCircularSmallComplicationView__ringGapWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_1E6CA12C0;
  v5[1] = &unk_1E6CA12D8;
  v6[0] = &unk_1E6CA5308;
  v6[1] = &unk_1E6CA5318;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 2.0);
  _ringGapWidth__mediumWidth = v4;

}

- (double)_overlapStrokeWidth
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  double result;

  os_unfair_lock_lock((os_unfair_lock_t)&_overlapStrokeWidth___lock);
  WeakRetained = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    -[NTKCircularComplicationView device](self, "device");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
    if (v5 == v6)
    {
      -[NTKCircularComplicationView device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "version");
      v9 = _overlapStrokeWidth___previousCLKDeviceVersion;

      if (v8 == v9)
        goto LABEL_6;
    }
    else
    {

    }
  }
  -[NTKCircularComplicationView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&_overlapStrokeWidth___cachedDevice, v10);

  v11 = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
  _overlapStrokeWidth___previousCLKDeviceVersion = objc_msgSend(v11, "version");

  -[NTKCircularComplicationView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __63__NTKWellnessCircularSmallComplicationView__overlapStrokeWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_overlapStrokeWidth___lock);
  v13 = -[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout");
  result = *(double *)&_overlapStrokeWidth__mediumWidth;
  if (!v13)
    return 1.75;
  return result;
}

void __63__NTKWellnessCircularSmallComplicationView__overlapStrokeWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  double v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_1E6CA12C0;
  v5[1] = &unk_1E6CA12D8;
  v6[0] = &unk_1E6CA5318;
  v6[1] = &unk_1E6CA5328;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 3.5);
  *(double *)&_overlapStrokeWidth__mediumWidth = v4 * 0.5;

}

- (void)setForegroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  -[NTKCircularComplicationView setForegroundColor:](&v4, sel_setForegroundColor_, a3);
  -[NTKWellnessCircularSmallComplicationView _updateColors](self, "_updateColors");
}

- (void)setUsesMultiColor:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  -[NTKCircularComplicationView setUsesMultiColor:](&v4, sel_setUsesMultiColor_, a3);
  -[NTKWellnessCircularSmallComplicationView _updateColors](self, "_updateColors");
}

- (void)setSecondaryForegroundColor:(id)a3
{
  -[NTKRingsAndDotsView setSecondaryForegroundColor:](self->_ringsView, "setSecondaryForegroundColor:", a3);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NTKRingsAndDotsView *ringsView;
  CGFloat v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v9, sel_layoutSubviews);
  -[NTKWellnessCircularSmallComplicationView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  ringsView = self->_ringsView;
  v8 = CGRectGetHeight(v10) * 0.5;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:", v8, CGRectGetWidth(v11) * 0.5);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, NTKRingsAndDotsView *))a3 + 2))(a3, self->_ringsView);
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  -[NTKCircularComplicationView _updateForTemplateChange](&v20, sel__updateForTemplateChange);
  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "dotsAreHidden"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "movePercentComplete");
    if (v5 < 0.00000011920929)
      v5 = 0.00000011920929;
    objc_msgSend(v4, "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

    if ((v8 & 1) == 0)
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 0, v6);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "exercisePercentComplete");
    if (v10 < 0.00000011920929)
      v10 = 0.00000011920929;
    objc_msgSend(v9, "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

    if ((v13 & 1) != 0)
    {
      v14 = v8 ^ 1;
    }
    else
    {
      v14 = 1;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 1, v11);
    }
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "standPercentComplete");
    if (v16 < 0.00000011920929)
      v16 = 0.00000011920929;
    objc_msgSend(v15, "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_ringsFillFractions, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

    if ((v19 & 1) != 0)
    {
      if (!v14)
        goto LABEL_19;
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_ringsFillFractions, "replaceObjectAtIndex:withObject:", 2, v17);
    }
    -[NTKRingsAndDotsView setRingsFillFractions:](self->_ringsView, "setRingsFillFractions:", self->_ringsFillFractions);
LABEL_19:

    goto LABEL_20;
  }
  -[NTKWellnessCircularSmallComplicationView _setLayoutEmptyRings](self, "_setLayoutEmptyRings");
LABEL_20:

}

- (void)_setLayoutEmptyRings
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *ringsFillFractions;

  +[NTKRingsAndDotsView emptyFillFractions](NTKRingsAndDotsView, "emptyFillFractions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v4;

  -[NTKRingsAndDotsView setRingsFillFractions:](self->_ringsView, "setRingsFillFractions:", self->_ringsFillFractions);
}

- (void)_updateColors
{
  _BOOL4 v3;
  NTKRingsAndDotsView *ringsView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = -[NTKCircularComplicationView usesMultiColor](self, "usesMultiColor");
  ringsView = self->_ringsView;
  if (v3)
  {
    NTKMoveNonGradientTextColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    NTKStandNonGradientTextColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    NTKExerciseNonGradientTextColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRingsAndDotsView setRingColors:](ringsView, "setRingColors:", v8);

  }
  else
  {
    -[NTKCircularComplicationView _computedForegroundColor](self, "_computedForegroundColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKRingsAndDotsView setForegroundColor:](ringsView, "setForegroundColor:");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
