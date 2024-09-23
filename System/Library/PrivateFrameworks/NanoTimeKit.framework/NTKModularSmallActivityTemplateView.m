@implementation NTKModularSmallActivityTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v3, "isCompatibleWithFamily:", 0) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isCompatibleWithFamily:", 7);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallActivityTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallActivityTemplateView *v3;
  NTKModularSmallActivityTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallActivityTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKModularSmallActivityTemplateView _configureContentSubviews](v3, "_configureContentSubviews");
  return v4;
}

- (void)setForegroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKModularSmallActivityTemplateView;
  v4 = a3;
  -[NTKModuleView setForegroundColor:](&v5, sel_setForegroundColor_, v4);
  -[NTKRingsAndDotsView setForegroundColor:](self->_ringsView, "setForegroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)_configureContentSubviews
{
  void *v3;
  _BOOL4 v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NTKRingsAndDotsView *ringsView;
  void *v30;
  NSMutableArray *v31;
  NSMutableArray *ringsFillFractions;
  NTKRingsAndDotsView *v33;
  NTKRingsAndDotsView *v34;
  NTKRingsAndDotsView *v35;
  id v36;

  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKComplicationModuleView isXL](self, "isXL");
  v5 = v3;
  if (v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_0);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_0);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_0);
      if (v8 == v5)
      {
        v12 = objc_msgSend(v5, "version");
        v13 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_0;

        if (v12 == v13)
        {
LABEL_10:
          v16 = &_LayoutConstantsExtraLarge___constants_3;
          v17 = &_LayoutConstantsExtraLarge___constants_2;
          v18 = &_LayoutConstantsExtraLarge___constants_1;
          v19 = &_LayoutConstantsExtraLarge___constants_0;
          v20 = (os_unfair_lock_s *)&_LayoutConstantsExtraLarge___lock_0;
          goto LABEL_14;
        }
      }
      else
      {

      }
    }
    v14 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_0, v5);
    _LayoutConstantsExtraLarge___previousCLKDeviceVersion_0 = objc_msgSend(v5, "version");

    ___LayoutConstantsExtraLarge_block_invoke_0(v15, (uint64_t)v5);
    goto LABEL_10;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsSmall___lock);
  v9 = objc_loadWeakRetained(&_LayoutConstantsSmall___cachedDevice);
  if (!v9)
    goto LABEL_12;
  v10 = v9;
  v11 = objc_loadWeakRetained(&_LayoutConstantsSmall___cachedDevice);
  if (v11 != v5)
  {

LABEL_12:
    v23 = objc_storeWeak(&_LayoutConstantsSmall___cachedDevice, v5);
    _LayoutConstantsSmall___previousCLKDeviceVersion = objc_msgSend(v5, "version");

    ___LayoutConstantsSmall_block_invoke(v24, (uint64_t)v5);
    goto LABEL_13;
  }
  v21 = objc_msgSend(v5, "version");
  v22 = _LayoutConstantsSmall___previousCLKDeviceVersion;

  if (v21 != v22)
    goto LABEL_12;
LABEL_13:
  v16 = &_LayoutConstantsSmall___constants_3;
  v17 = &_LayoutConstantsSmall___constants_2;
  v18 = &_LayoutConstantsSmall___constants_1;
  v19 = &_LayoutConstantsSmall___constants_0;
  v20 = (os_unfair_lock_s *)&_LayoutConstantsSmall___lock;
LABEL_14:
  os_unfair_lock_unlock(v20);
  v25 = *(double *)v19;
  v26 = *(double *)v18;
  v27 = *(double *)v17;
  v28 = *(double *)v16;

  ringsView = self->_ringsView;
  if (ringsView)
    -[NTKRingsAndDotsView removeFromSuperview](ringsView, "removeFromSuperview");
  +[NTKRingsAndDotsView emptyFillFractions](NTKRingsAndDotsView, "emptyFillFractions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (NSMutableArray *)objc_msgSend(v30, "mutableCopy");
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v31;

  v33 = [NTKRingsAndDotsView alloc];
  v34 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v33, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v27, v25, v26, v28);
  v35 = self->_ringsView;
  self->_ringsView = v34;

  -[NTKRingsAndDotsView setRingsFillFractions:](self->_ringsView, "setRingsFillFractions:", self->_ringsFillFractions);
  -[NTKModuleView contentView](self, "contentView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", self->_ringsView);

}

- (void)setIsXL:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallActivityTemplateView;
  -[NTKComplicationModuleView setIsXL:](&v4, sel_setIsXL_, a3);
  -[NTKModularSmallActivityTemplateView _configureContentSubviews](self, "_configureContentSubviews");
  -[NTKModularSmallActivityTemplateView _layoutContentView](self, "_layoutContentView");
  -[NTKModuleView _updateColors](self, "_updateColors");
}

- (void)_layoutContentView
{
  NTKRingsAndDotsView *ringsView;
  id v3;

  ringsView = self->_ringsView;
  -[NTKModuleView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCA72B8](objc_msgSend(v3, "bounds"));
  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:");

}

- (void)_update
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
  v20.super_class = (Class)NTKModularSmallActivityTemplateView;
  -[NTKModularTemplateView _update](&v20, sel__update);
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
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
  -[NTKModularSmallActivityTemplateView _setLayoutEmptyRings](self, "_setLayoutEmptyRings");
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

- (void)applyColorScheme:(id)a3
{
  id v4;
  int v5;
  NTKRingsAndDotsView *ringsView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NTKModularSmallActivityTemplateView;
  v4 = a3;
  -[NTKModuleView applyColorScheme:](&v11, sel_applyColorScheme_, v4);
  v5 = objc_msgSend(v4, "containsOverrideFaceColor", v11.receiver, v11.super_class);

  if (v5)
  {
    ringsView = self->_ringsView;
    NTKMoveNonGradientTextColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    NTKExerciseNonGradientTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    NTKStandNonGradientTextColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRingsAndDotsView setRingColors:](ringsView, "setRingColors:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end
