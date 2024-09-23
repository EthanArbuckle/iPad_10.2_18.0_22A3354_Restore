@implementation NTKModularSmallSimpleTemplateView

- (NTKModularSmallSimpleTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallSimpleTemplateView *v3;
  NTKModularSmallSimpleTemplateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallSimpleTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKModularSmallSimpleTemplateView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)_update
{
  void *v3;
  id v4;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[NTKModularSmallSimpleTemplateView _configureWithTextTemplate:](self, "_configureWithTextTemplate:", v4);
  else
    -[NTKModularSmallSimpleTemplateView _configureWithImageTemplate:](self, "_configureWithImageTemplate:", v4);
  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

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
  int64_t maxDynamicFontSize;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  id v19;
  id WeakRetained;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v38;
  CDComplicationImageView *imageView;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;

  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_label)
  {
    maxDynamicFontSize = self->_maxDynamicFontSize;
    -[NTKModularSmallSimpleTemplateView _maxTextWidthForDynamicFontSize:](self, "_maxTextWidthForDynamicFontSize:", maxDynamicFontSize);
    v14 = v13;
    v15 = 0;
    if (v13 < 1.79769313e308 && (maxDynamicFontSize & 0x8000000000000000) == 0)
    {
      v16 = 0;
      while (1)
      {
        -[NTKModularSmallSimpleTemplateView _maxTextWidthForDynamicFontSize:](self, "_maxTextWidthForDynamicFontSize:", maxDynamicFontSize);
        v14 = v17;
        v18 = -[NTKComplicationModuleView isXL](self, "isXL");
        -[NTKModuleView device](self, "device");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&_FontForExtraLargeDynamicSize___lock);
          WeakRetained = objc_loadWeakRetained(&_FontForExtraLargeDynamicSize___cachedDevice);
          if (!WeakRetained)
            goto LABEL_13;
          v21 = WeakRetained;
          v22 = objc_loadWeakRetained(&_FontForExtraLargeDynamicSize___cachedDevice);
          if (v22 != v19)
          {

            goto LABEL_13;
          }
          v26 = objc_msgSend(v19, "version");
          v27 = _FontForExtraLargeDynamicSize___previousCLKDeviceVersion;

          if (v26 != v27)
          {
LABEL_13:
            v28 = objc_storeWeak(&_FontForExtraLargeDynamicSize___cachedDevice, v19);
            _FontForExtraLargeDynamicSize___previousCLKDeviceVersion = objc_msgSend(v19, "version");

            ___FontForExtraLargeDynamicSize_block_invoke(v29, v19);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_FontForExtraLargeDynamicSize___lock);
          v30 = (void *)_FontForExtraLargeDynamicSize_fonts;
          goto LABEL_18;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&_FontForModularSmallDynamicSize___lock);
        v23 = objc_loadWeakRetained(&_FontForModularSmallDynamicSize___cachedDevice);
        if (!v23)
          goto LABEL_16;
        v24 = v23;
        v25 = objc_loadWeakRetained(&_FontForModularSmallDynamicSize___cachedDevice);
        if (v25 != v19)
          break;
        v31 = objc_msgSend(v19, "version");
        v32 = _FontForModularSmallDynamicSize___previousCLKDeviceVersion;

        if (v31 != v32)
          goto LABEL_16;
LABEL_17:
        os_unfair_lock_unlock((os_unfair_lock_t)&_FontForModularSmallDynamicSize___lock);
        v30 = (void *)_FontForModularSmallDynamicSize_fonts;
LABEL_18:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", maxDynamicFontSize);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[CLKUIColoringLabel widthForMaxWidth:withFont:](self->_label, "widthForMaxWidth:withFont:", v15, v14);
        if (v36 > v14)
        {
          v16 = v15;
          if (maxDynamicFontSize-- > 0)
            continue;
        }
        goto LABEL_21;
      }

LABEL_16:
      v33 = objc_storeWeak(&_FontForModularSmallDynamicSize___cachedDevice, v19);
      _FontForModularSmallDynamicSize___previousCLKDeviceVersion = objc_msgSend(v19, "version");

      ___FontForModularSmallDynamicSize_block_invoke(v34, v19);
      goto LABEL_17;
    }
LABEL_21:
    -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v15);
    -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
    -[CLKUIColoringLabel frame](self->_label, "frame");
    if (v38 > v14)
      -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
    NTKPositionSimpleTemperatureLabel(self->_label, v5, v7, v9, v11);

  }
  imageView = self->_imageView;
  if (imageView)
  {
    -[CDComplicationImageView sizeThatFits:](imageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[NTKModuleView device](self, "device");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredIntegralRectForDevice();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v42, v44, v46, v48);
  }
}

- (void)_configureWithTextTemplate:(id)a3
{
  id v4;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v6;
  CLKUIColoringLabel *v7;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v9;
  void *v10;
  CLKUIColoringLabel *v11;
  void *v12;
  CLKUIColoringLabel *v13;
  uint64_t v14;
  CLKUIColoringLabel *v15;
  void *v16;
  CLKUIColoringLabel *v17;
  void *v18;
  CLKUIColoringLabel *v19;
  void *v20;
  __int128 v21;
  double v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  v4 = a3;
  imageView = self->_imageView;
  if (imageView)
  {
    -[CDComplicationImageView removeFromSuperview](imageView, "removeFromSuperview");
    v6 = self->_imageView;
    self->_imageView = 0;

  }
  if (!self->_label)
  {
    v7 = (CLKUIColoringLabel *)objc_opt_new();
    label = self->_label;
    self->_label = v7;

    v9 = self->_label;
    -[NTKModuleView foregroundColor](self, "foregroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v9, "setTextColor:", v10);

    v11 = self->_label;
    -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setInTimeTravel:](v11, "setInTimeTravel:", v12 != 0);

    objc_initWeak(&location, self);
    v13 = self->_label;
    v14 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke;
    v25[3] = &unk_1E6BCD7C8;
    objc_copyWeak(&v26, &location);
    -[CLKUIColoringLabel setNowProvider:](v13, "setNowProvider:", v25);
    v15 = self->_label;
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke_2;
    v23[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v24, &location);
    -[CLKUIColoringLabel setNeedsResizeHandler:](v15, "setNeedsResizeHandler:", v23);
    -[NTKModuleView contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_label);

    v17 = self->_label;
    -[NTKModuleView device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_24(v18, -[NTKComplicationModuleView isXL](self, "isXL"), &v21);
    -[CLKUIColoringLabel setMaxWidth:](v17, "setMaxWidth:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  self->_maxDynamicFontSize = objc_msgSend(v4, "maxDynamicFontSize");
  v19 = self->_label;
  objc_msgSend(v4, "textProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](v19, "setTextProvider:", v20);

}

id __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke(uint64_t a1)
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

void __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (void)_configureWithImageTemplate:(id)a3
{
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v5;
  void *v6;
  char v7;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v9;
  CDComplicationImageView *v10;
  CDComplicationImageView *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  label = self->_label;
  if (label)
  {
    -[CLKUIColoringLabel removeFromSuperview](label, "removeFromSuperview");
    v5 = self->_label;
    self->_label = 0;

  }
  objc_msgSend(v14, "imageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v6);
  imageView = self->_imageView;
  if ((v7 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v6);
    v9 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v10 = self->_imageView;
    self->_imageView = v9;

    v11 = self->_imageView;
    if (v11)
    {
      -[NTKModuleView foregroundColor](self, "foregroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDComplicationImageView setColor:](v11, "setColor:", v12);

      -[NTKModuleView contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", self->_imageView);

      imageView = self->_imageView;
    }
    else
    {
      imageView = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](imageView, "setImageProvider:", v6);

}

- (double)_maxTextWidthForDynamicFontSize:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v8[6];
  __int128 v9;
  __int128 v10;
  double v11;
  __int128 v12;
  double v13;
  __int128 v14;
  double v15;

  switch(a3)
  {
    case 0:
      -[NTKModuleView device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_24(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v14);
      v5 = v15;
      goto LABEL_8;
    case 1:
      -[NTKModuleView device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_24(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v12);
      v5 = v13;
      goto LABEL_8;
    case 2:
      -[NTKModuleView device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_24(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v10);
      v5 = v11;
      goto LABEL_8;
    case 3:
      -[NTKModuleView device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_24(v4, -[NTKComplicationModuleView isXL](self, "isXL"), &v9);
      v5 = *((double *)&v9 + 1);
      goto LABEL_8;
    case 4:
      -[NTKModuleView device](self, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_24(v4, -[NTKComplicationModuleView isXL](self, "isXL"), v8);
      v5 = v8[0];
LABEL_8:

      break;
    default:
      v5 = 0.0;
      break;
  }
  -[NTKModularSmallSimpleTemplateView frame](self, "frame");
  return fmin(v5, v6);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_imageView);

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
  if (supportedTemplateClasses_onceToken_0 != -1)
    dispatch_once(&supportedTemplateClasses_onceToken_0, &__block_literal_global_99);
  return (id)supportedTemplateClasses__supportedClasses_0;
}

void __61__NTKModularSmallSimpleTemplateView_supportedTemplateClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedTemplateClasses__supportedClasses_0;
  supportedTemplateClasses__supportedClasses_0 = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
