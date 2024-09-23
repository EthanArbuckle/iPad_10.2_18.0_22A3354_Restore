@implementation NTKCircularSmallSimpleComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E0C93E90] == a3;
}

- (NTKCircularSmallSimpleComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallSimpleComplicationView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallSimpleComplicationView;
  result = -[NTKCircularComplicationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_maxDynamicFontSize = 3.0;
  return result;
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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  CLKUIColoringLabel *label;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGFloat v30;
  void *v31;
  void *v32;
  double v33;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v35;
  void *v36;
  CGAffineTransform v37;
  double v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)NTKCircularSmallSimpleComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v39, sel_layoutSubviews);
  -[NTKCircularSmallSimpleComplicationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_label)
  {
    v11 = (uint64_t)fmin(self->_maxDynamicFontSize, 3.0);
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    v12 = 0;
    if (v38 >= 1.79769313e308 || v11 < 1)
    {
      v14 = v11;
    }
    else
    {
      v13 = 0;
      do
      {
        -[NTKCircularComplicationView _fontForDynamicFontSize:](self, "_fontForDynamicFontSize:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[CLKUIColoringLabel widthForMaxWidth:withFont:](self->_label, "widthForMaxWidth:withFont:", v12, v38);
        v14 = v11 - 1;
        v16 = v15 > v38 && (unint64_t)v11 > 1;
        v13 = v12;
        --v11;
      }
      while (v16);
    }
    -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v12);
    label = self->_label;
    -[NTKCircularSmallSimpleComplicationView bounds](self, "bounds");
    -[CLKUIColoringLabel setMaxWidth:](label, "setMaxWidth:", v18);
    -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
    -[CLKUIColoringLabel frame](self->_label, "frame");
    if (v19 > v38)
      -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
    NTKPositionSimpleTemperatureLabel(self->_label, v4, v6, v8, v10);
    -[CLKUIColoringLabel frame](self->_label, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[NTKCircularSmallSimpleComplicationView _baselineOffsetForDynamicSize:](self, "_baselineOffsetForDynamicSize:", v14 + 1);
    v27 = v26;
    -[CLKUIColoringLabel _lastLineBaseline](self->_label, "_lastLineBaseline");
    -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v21, v27 - v28, v23, v25);

  }
  if (self->_imageView)
  {
    -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_opt_class();
      -[NTKCircularComplicationView device](self, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_imageScaleForTemplate:forDevice:", v29, v32);
      v30 = v33;

    }
    -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
    imageView = self->_imageView;
    CGAffineTransformMakeScale(&v37, v30, v30);
    -[CDComplicationImageView setTransform:](imageView, "setTransform:", &v37);
    v35 = self->_imageView;
    -[CDComplicationImageView bounds](v35, "bounds");
    -[NTKCircularComplicationView device](self, "device");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredIntegralRectForDevice();
    -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](v35, "ntk_setBoundsAndPositionFromFrame:");

  }
}

+ (double)_imageScaleForTemplate:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  _QWORD v15[5];

  v5 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate_forDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate_forDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_imageScaleForTemplate_forDevice____cachedDevice);
  if (v9 != v6)
  {

LABEL_5:
    v12 = objc_storeWeak(&_imageScaleForTemplate_forDevice____cachedDevice, v6);
    _imageScaleForTemplate_forDevice____previousCLKDeviceVersion = objc_msgSend(v6, "version");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke;
    v15[3] = &unk_1E6BD0658;
    v15[4] = v5;
    __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke((uint64_t)v15);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _imageScaleForTemplate_forDevice____previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate_forDevice____lock);
  v13 = *(double *)&_imageScaleForTemplate_forDevice___scale;

  return v13;
}

uint64_t __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke(uint64_t a1)
{
  uint64_t result;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;

  v5 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "maxSDKSize:deviceSize:forImageProviderKey:", 0, &v5, CFSTR("imageProvider"));
  v4 = 0uLL;
  result = objc_msgSend(MEMORY[0x1E0C94180], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1])
    v3.f64[0] = v3.f64[1];
  _imageScaleForTemplate_forDevice___scale = *(_QWORD *)&v3.f64[0];
  return result;
}

- (double)_baselineOffsetForDynamicSize:(int64_t)a3
{
  double result;

  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  if (a3 == 3)
    return 0.0;
  if (a3 == 2)
    return 0.0;
  result = 0.0;
  if (a3 == 1)
    return 0.0;
  return result;
}

- (void)updateLabelWithString:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:shortText:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallSimpleComplicationView _updateLabelWithTextProvider:](self, "_updateLabelWithTextProvider:", v4);

}

- (void)updateImageViewWithImage:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKCircularSmallSimpleComplicationView _updateImageViewWithImageProvider:](self, "_updateImageViewWithImageProvider:", v4);

}

- (void)_updateLabelWithTextProvider:(id)a3
{
  id v4;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v6;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v8;
  CLKUIColoringLabel *v9;
  CLKUIColoringLabel *v10;
  void *v11;
  CLKUIColoringLabel *v12;
  uint64_t v13;
  CLKUIColoringLabel *v14;
  CLKUIColoringLabel *v15;
  double v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  imageView = self->_imageView;
  if (imageView)
  {
    -[CDComplicationImageView removeFromSuperview](imageView, "removeFromSuperview");
    v6 = self->_imageView;
    self->_imageView = 0;

  }
  label = self->_label;
  if (!label)
  {
    v8 = (CLKUIColoringLabel *)objc_opt_new();
    v9 = self->_label;
    self->_label = v8;

    v10 = self->_label;
    -[NTKCircularComplicationView timeTravelDate](self, "timeTravelDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setInTimeTravel:](v10, "setInTimeTravel:", v11 != 0);

    objc_initWeak(&location, self);
    v12 = self->_label;
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke;
    v19[3] = &unk_1E6BCD7C8;
    objc_copyWeak(&v20, &location);
    -[CLKUIColoringLabel setNowProvider:](v12, "setNowProvider:", v19);
    v14 = self->_label;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke_2;
    v17[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v18, &location);
    -[CLKUIColoringLabel setNeedsResizeHandler:](v14, "setNeedsResizeHandler:", v17);
    v15 = self->_label;
    -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
    -[CLKUIColoringLabel setMaxWidth:](v15, "setMaxWidth:", v16);
    -[NTKCircularSmallSimpleComplicationView addSubview:](self, "addSubview:", self->_label);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    label = self->_label;
  }
  -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v4);
  -[NTKCircularComplicationView _updateLabelViewColor:](self, "_updateLabelViewColor:", self->_label);
  -[NTKCircularSmallSimpleComplicationView setNeedsLayout](self, "setNeedsLayout");

}

id __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke(uint64_t a1)
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

void __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_updateImageViewWithImageProvider:(id)a3
{
  id v4;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v6;
  char v7;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v9;
  CDComplicationImageView *v10;
  id v11;

  v4 = a3;
  label = self->_label;
  v11 = v4;
  if (label)
  {
    -[CLKUIColoringLabel removeFromSuperview](label, "removeFromSuperview");
    v6 = self->_label;
    self->_label = 0;

    v4 = v11;
  }
  v7 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v4);
  imageView = self->_imageView;
  if ((v7 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v11);
    v9 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v10 = self->_imageView;
    self->_imageView = v9;

    if (self->_imageView)
    {
      -[NTKCircularSmallSimpleComplicationView addSubview:](self, "addSubview:");
      imageView = self->_imageView;
    }
    else
    {
      imageView = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](imageView, "setImageProvider:", v11);
  -[NTKCircularComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  -[NTKCircularSmallSimpleComplicationView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  id v5;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "textProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularSmallSimpleComplicationView _updateLabelWithTextProvider:](self, "_updateLabelWithTextProvider:", v3);

    self->_maxDynamicFontSize = (double)objc_msgSend(v5, "maxDynamicFontSize");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "imageProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCircularSmallSimpleComplicationView _updateImageViewWithImageProvider:](self, "_updateImageViewWithImageProvider:", v4);

    }
  }

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

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (double)maxDynamicFontSize
{
  return self->_maxDynamicFontSize;
}

- (void)setMaxDynamicFontSize:(double)a3
{
  self->_maxDynamicFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
