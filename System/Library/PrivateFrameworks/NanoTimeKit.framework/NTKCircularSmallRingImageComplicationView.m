@implementation NTKCircularSmallRingImageComplicationView

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

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  double v5;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v7;
  void *v8;
  CGAffineTransform v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCircularSmallRingImageComplicationView;
  -[NTKCircularSmallRingComplicationView layoutSubviews](&v10, sel_layoutSubviews);
  -[NTKCircularSmallRingImageComplicationView bounds](self, "bounds");
  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_imageScaleForTemplate:", v3);
    v4 = v5;
  }
  -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
  imageView = self->_imageView;
  CGAffineTransformMakeScale(&v9, v4, v4);
  -[CDComplicationImageView setTransform:](imageView, "setTransform:", &v9);
  v7 = self->_imageView;
  -[CDComplicationImageView bounds](v7, "bounds");
  -[NTKCircularComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](v7, "ntk_setBoundsAndPositionFromFrame:");

}

+ (double)_imageScaleForTemplate:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  _QWORD v20[5];

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate____lock);
  WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
  if (v7 != v8)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_imageScaleForTemplate____cachedDevice, v14);

    v15 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
    _imageScaleForTemplate____previousCLKDeviceVersion = objc_msgSend(v15, "version");

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke;
    v20[3] = &unk_1E6BD0658;
    v20[4] = v3;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke((uint64_t)v20);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "version");
  v12 = _imageScaleForTemplate____previousCLKDeviceVersion;

  if (v11 != v12)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate____lock);
  v18 = *(double *)&_imageScaleForTemplate___scale;

  return v18;
}

uint64_t __68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke(uint64_t a1)
{
  uint64_t result;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;

  v5 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "maxSDKSize:deviceSize:forImageProviderKey:", 0, &v5, CFSTR("imageProvider"));
  v4 = 0uLL;
  result = objc_msgSend(MEMORY[0x1E0C94178], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1])
    v3.f64[0] = v3.f64[1];
  _imageScaleForTemplate___scale = *(_QWORD *)&v3.f64[0];
  return result;
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  CDComplicationImageView *imageView;
  void *v6;
  char v7;
  CDComplicationImageView *v8;
  CDComplicationImageView *v9;
  CDComplicationImageView *v10;
  NTKRing *v11;
  CLKProgressProvider *progressProvider;
  CLKProgressProvider *v13;
  NSNumber *v14;
  NSNumber *progressUpdateToken;
  NTKRing *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id from;
  id location;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  -[CDComplicationImageView imageProvider](imageView, "imageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", imageView, v6);

  v8 = self->_imageView;
  if ((v7 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](v8, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v4);
    v9 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v10 = self->_imageView;
    self->_imageView = v9;

    if (self->_imageView)
    {
      -[NTKCircularSmallRingImageComplicationView addSubview:](self, "addSubview:");
      v8 = self->_imageView;
    }
    else
    {
      v8 = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](v8, "setImageProvider:", v4);
  -[NTKCircularComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "progressProvider");
    v11 = (NTKRing *)objc_claimAutoreleasedReturnValue();
    progressProvider = self->_progressProvider;
    if (v11 != (NTKRing *)progressProvider)
    {
      -[CLKProgressProvider stopUpdatesForToken:](progressProvider, "stopUpdatesForToken:", self->_progressUpdateToken);
      objc_storeStrong((id *)&self->_progressProvider, v11);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v11);
      v13 = self->_progressProvider;
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __69__NTKCircularSmallRingImageComplicationView__updateForTemplateChange__block_invoke;
      v21 = &unk_1E6BD0310;
      objc_copyWeak(&v22, &location);
      objc_copyWeak(&v23, &from);
      -[CLKProgressProvider startUpdatesWithHandler:](v13, "startUpdatesWithHandler:", &v18);
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v14;

      -[NTKCircularSmallRingImageComplicationView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v11, v18, v19, v20, v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = [NTKRing alloc];
    objc_msgSend(v3, "fillFraction");
    v11 = -[NTKRing initWithFillFraction:style:](v16, "initWithFillFraction:style:", objc_msgSend(v3, "ringStyle"), v17);
    -[NTKCircularSmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v11);
  }

  -[NTKCircularSmallRingImageComplicationView setNeedsLayout](self, "setNeedsLayout");
}

void __69__NTKCircularSmallRingImageComplicationView__updateForTemplateChange__block_invoke(uint64_t a1)
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
  -[NTKCircularComplicationView timeTravelDate](self, "timeTravelDate");
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
  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", objc_msgSend(v11, "ringStyle"), v10);

  objc_msgSend(v14, "backgroundRingAlpha");
  if (v13 >= 0.0)
  {
    objc_msgSend(v14, "backgroundRingAlpha");
    -[NTKRing setBackgroundRingAlpha:](v12, "setBackgroundRingAlpha:");
  }
  -[NTKCircularSmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v12);

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCircularSmallRingImageComplicationView;
  v4 = (void (**)(id, CDComplicationImageView *))a3;
  -[NTKCircularSmallRingComplicationView _enumerateForegroundColoringViewsWithBlock:](&v5, sel__enumerateForegroundColoringViewsWithBlock_, v4);
  v4[2](v4, self->_imageView);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
