@implementation NTKModularSmallRingTemplateView

- (NTKModularSmallRingTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallRingTemplateView *v3;
  NTKModularSmallRingTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallRingTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKModularSmallRingTemplateView _configureContentSubviews](v3, "_configureContentSubviews");
    v4->_level = INFINITY;
  }
  return v4;
}

- (void)_configureContentSubviews
{
  void *v3;
  void *v4;
  id v5;
  CLKUIColoringImageView *v6;
  CLKUIColoringImageView *stateRing;
  void *v8;
  void *v9;
  CLKUIColoringLabel *v10;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v12;
  void *v13;
  CLKUIColoringLabel *v14;
  uint64_t v15;
  CLKUIColoringLabel *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  double v25;

  -[CLKUIColoringLabel textProvider](self->_label, "textProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringImageView removeFromSuperview](self->_stateRing, "removeFromSuperview");
  -[CLKUIColoringLabel removeFromSuperview](self->_label, "removeFromSuperview");
  v25 = 0.0;
  v23 = 0u;
  v24 = 0u;
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_6(v4, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)&v23);

  v5 = objc_alloc((Class)off_1E6BCA6D8);
  v6 = (CLKUIColoringImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *((double *)&v23 + 1), *(double *)&v24);
  stateRing = self->_stateRing;
  self->_stateRing = v6;

  -[NTKModuleView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_stateRing);

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", *(double *)&v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E6BCA6E0);
  label = self->_label;
  self->_label = v10;

  -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v9);
  -[CLKUIColoringLabel setTextProvider:](self->_label, "setTextProvider:", v3);
  -[CLKUIColoringLabel setMaxWidth:](self->_label, "setMaxWidth:", v25);
  v12 = self->_label;
  -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setInTimeTravel:](v12, "setInTimeTravel:", v13 != 0);

  objc_initWeak(&location, self);
  v14 = self->_label;
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke;
  v20[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v21, &location);
  -[CLKUIColoringLabel setNowProvider:](v14, "setNowProvider:", v20);
  v16 = self->_label;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke_2;
  v18[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v19, &location);
  -[CLKUIColoringLabel setNeedsResizeHandler:](v16, "setNeedsResizeHandler:", v18);
  -[NTKModuleView contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_label);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

id __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke(uint64_t a1)
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

void __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)setIsXL:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallRingTemplateView;
  -[NTKComplicationModuleView setIsXL:](&v4, sel_setIsXL_, a3);
  -[NTKModularSmallRingTemplateView _configureContentSubviews](self, "_configureContentSubviews");
  -[NTKModuleView _updateColors](self, "_updateColors");
  -[NTKModularSmallRingTemplateView _refreshRingImage](self, "_refreshRingImage");
  -[NTKModularSmallRingTemplateView _layoutContentView](self, "_layoutContentView");
}

- (void)_update
{
  void *v3;
  CLKUIColoringLabel *label;
  void *v5;
  char v6;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v8;
  CDComplicationImageView *v9;
  CDComplicationImageView *v10;
  void *v11;
  void *v12;
  NTKRing *v13;
  CLKProgressProvider *progressProvider;
  void *v15;
  void *v16;
  CLKProgressProvider *v17;
  NSNumber *v18;
  NSNumber *progressUpdateToken;
  NTKRing *v20;
  float v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id from;
  id location;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CDComplicationImageView setHidden:](self->_imageView, "setHidden:", 1);
    -[CLKUIColoringLabel setHidden:](self->_label, "setHidden:", 0);
    label = self->_label;
    objc_msgSend(v3, "textProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v5);
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CLKUIColoringLabel setHidden:](self->_label, "setHidden:", 1);
    objc_msgSend(v3, "imageProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v5);
    imageView = self->_imageView;
    if ((v6 & 1) == 0)
    {
      -[CDComplicationImageView removeFromSuperview](imageView, "removeFromSuperview");
      objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v5);
      v8 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
      v9 = self->_imageView;
      self->_imageView = v8;

      v10 = self->_imageView;
      if (v10)
      {
        -[NTKModuleView foregroundColor](self, "foregroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDComplicationImageView setColor:](v10, "setColor:", v11);

        -[NTKModuleView contentView](self, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", self->_imageView);

        imageView = self->_imageView;
      }
      else
      {
        imageView = 0;
      }
    }
    -[CDComplicationImageView setHidden:](imageView, "setHidden:", 0);
    -[CDComplicationImageView setImageProvider:](self->_imageView, "setImageProvider:", v5);
    goto LABEL_13;
  }
LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "progressProvider");
    v13 = (NTKRing *)objc_claimAutoreleasedReturnValue();
    progressProvider = self->_progressProvider;
    if (v13 != (NTKRing *)progressProvider)
    {
      -[CLKProgressProvider stopUpdatesForToken:](progressProvider, "stopUpdatesForToken:", self->_progressUpdateToken);
      objc_storeStrong((id *)&self->_progressProvider, v13);
      -[NTKRing tintColor](v13, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NTKRing tintColor](v13, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKUIColoringImageView setOverrideColor:](self->_stateRing, "setOverrideColor:", v16);

      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v13);
      v17 = self->_progressProvider;
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __42__NTKModularSmallRingTemplateView__update__block_invoke;
      v26 = &unk_1E6BD0310;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      -[CLKProgressProvider startUpdatesWithHandler:](v17, "startUpdatesWithHandler:", &v23);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v18;

      -[NTKModularSmallRingTemplateView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v13, v23, v24, v25, v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v20 = [NTKRing alloc];
    objc_msgSend(v3, "fillFraction");
    v13 = -[NTKRing initWithFillFraction:style:](v20, "initWithFillFraction:style:", objc_msgSend(v3, "ringStyle"), v21);
    -[NTKModularSmallRingTemplateView _updateRingWithRingDescription:](self, "_updateRingWithRingDescription:", v13);
  }

  -[NTKModuleView contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsLayout");

}

void __42__NTKModularSmallRingTemplateView__update__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateRingWithProgressProvider:", v2);

}

- (void)updateRingWithProgressProvider:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NTKRing *v8;
  double v9;
  double v10;
  void *v11;
  NTKRing *v12;
  double v13;
  id v14;

  v14 = a3;
  -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = [NTKRing alloc];
  objc_msgSend(v14, "progressFractionForNow:", v7);
  v10 = v9;
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", objc_msgSend(v11, "ringStyle"), v10);

  objc_msgSend(v14, "backgroundRingAlpha");
  if (v13 >= 0.0)
  {
    objc_msgSend(v14, "backgroundRingAlpha");
    -[NTKRing setBackgroundRingAlpha:](v12, "setBackgroundRingAlpha:");
  }
  -[NTKModularSmallRingTemplateView _updateRingWithRingDescription:](self, "_updateRingWithRingDescription:", v12);

}

- (void)_updateRingWithRingDescription:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _BYTE v9[24];
  double v10;
  _BYTE v11[8];
  double v12;

  v8 = a3;
  objc_msgSend(v8, "fillFraction");
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    objc_msgSend(v8, "fillFraction");
    *(float *)&v4 = v4;
    self->_level = *(float *)&v4;
    -[NTKModuleView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_6(v5, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)v11);
    objc_msgSend(v8, "setRadius:", v12 * 0.5);

    -[NTKModuleView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_6(v6, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)v9);
    objc_msgSend(v8, "setStrokeWidth:", v10);

    objc_msgSend(v8, "ringImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringImageView setImage:](self->_stateRing, "setImage:", v7);

  }
}

- (void)_layoutContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CLKUIColoringLabel *label;
  void *v23;
  uint64_t v24;
  CDComplicationImageView *imageView;
  _BYTE v26[32];

  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CLKUIColoringImageView sizeThatFits:](self->_stateRing, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[NTKModuleView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CLKUIColoringImageView setFrame:](self->_stateRing, "setFrame:", v14, v16, v18, v20);
  if ((-[CLKUIColoringLabel isHidden](self->_label, "isHidden") & 1) == 0)
  {
    -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
    -[CLKUIColoringLabel frame](self->_label, "frame");
    -[NTKModuleView device](self, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_6(v21, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)v26);

    label = self->_label;
    -[NTKModuleView device](self, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredIntegralRectForDevice();
    -[CLKUIColoringLabel setFrame:](label, "setFrame:");

  }
  if ((-[CDComplicationImageView isHidden](self->_imageView, "isHidden") & 1) == 0)
  {
    v24 = -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
    imageView = self->_imageView;
    MEMORY[0x1BCCA72B8](v24, v5, v7, v9, v11);
    -[CDComplicationImageView setCenter:](imageView, "setCenter:");
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringImageView *))a3 + 2))(v6, self->_stateRing);
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_imageView);

}

- (void)_refreshRingImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NTKRing *v7;
  double v8;
  double v9;
  void *v10;
  NTKRing *v11;
  NTKRing *v12;
  float v13;
  id v14;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    v7 = [NTKRing alloc];
    -[CLKProgressProvider progressFractionForNow:](self->_progressProvider, "progressFractionForNow:", v6);
    v9 = v8;
    -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTKRing initWithFillFraction:style:](v7, "initWithFillFraction:style:", objc_msgSend(v10, "ringStyle"), v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = [NTKRing alloc];
      objc_msgSend(v14, "fillFraction");
      v11 = -[NTKRing initWithFillFraction:style:](v12, "initWithFillFraction:style:", objc_msgSend(v14, "ringStyle"), v13);
    }
    else
    {
      v11 = 0;
    }
  }
  -[NTKModularSmallRingTemplateView _refreshRingImageWithRing:](self, "_refreshRingImageWithRing:", v11);

}

- (void)_refreshRingImageWithRing:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  _BYTE v9[24];
  double v10;
  _BYTE v11[8];
  double v12;

  v4 = a3;
  objc_msgSend(v4, "fillFraction");
  *(float *)&v5 = v5;
  self->_level = *(float *)&v5;
  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_6(v6, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)v11);
  objc_msgSend(v4, "setRadius:", v12 * 0.5);

  -[NTKModuleView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_6(v7, -[NTKComplicationModuleView isXL](self, "isXL"), (uint64_t)v9);
  objc_msgSend(v4, "setStrokeWidth:", v10);

  objc_msgSend(v4, "ringImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CLKUIColoringImageView setImage:](self->_stateRing, "setImage:", v8);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "supportedTemplateClasses");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

+ (id)supportedTemplateClasses
{
  if (supportedTemplateClasses_onceToken != -1)
    dispatch_once(&supportedTemplateClasses_onceToken, &__block_literal_global_29);
  return (id)supportedTemplateClasses__supportedClasses;
}

void __59__NTKModularSmallRingTemplateView_supportedTemplateClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedTemplateClasses__supportedClasses;
  supportedTemplateClasses__supportedClasses = v0;

}

- (CLKUIColoringImageView)stateRing
{
  return self->_stateRing;
}

- (void)setStateRing:(id)a3
{
  objc_storeStrong((id *)&self->_stateRing, a3);
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_stateRing, 0);
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
