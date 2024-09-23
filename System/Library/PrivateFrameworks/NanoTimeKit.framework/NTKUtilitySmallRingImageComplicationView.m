@implementation NTKUtilitySmallRingImageComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
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

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  -[NTKUtilitySmallRingComplicationView layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKUtilityCircularComplicationView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
  -[CDComplicationImageView frame](self->_imageView, "frame");
  -[NTKUtilityComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v6, v8, v10, v12);
}

- (void)_updateWithImageProvider:(id)a3
{
  char v4;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v6;
  CDComplicationImageView *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView);
  imageView = self->_imageView;
  if ((v4 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v10);
    v6 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageView;
    self->_imageView = v6;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      -[NTKUtilityCircularComplicationView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_imageView);

      imageView = self->_imageView;
    }
  }
  -[NTKUtilityComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", imageView);
  -[CDComplicationImageView setImageProvider:](self->_imageView, "setImageProvider:", v10);
  -[NTKUtilitySmallRingImageComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complicationDisplayNeedsResize:", self);

}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  NTKRing *v5;
  CLKProgressProvider *progressProvider;
  CLKProgressProvider *v7;
  NSNumber *v8;
  NSNumber *progressUpdateToken;
  NTKRing *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  -[NTKUtilityComplicationView _updateForTemplateChange](&v20, sel__updateForTemplateChange);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilitySmallRingImageComplicationView _updateWithImageProvider:](self, "_updateWithImageProvider:", v4);

  -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:", self->_imageView);
  -[NTKUtilityComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "progressProvider");
    v5 = (NTKRing *)objc_claimAutoreleasedReturnValue();
    progressProvider = self->_progressProvider;
    if (v5 != (NTKRing *)progressProvider)
    {
      -[CLKProgressProvider stopUpdatesForToken:](progressProvider, "stopUpdatesForToken:", self->_progressUpdateToken);
      objc_storeStrong((id *)&self->_progressProvider, v5);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v7 = self->_progressProvider;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __68__NTKUtilitySmallRingImageComplicationView__updateForTemplateChange__block_invoke;
      v15 = &unk_1E6BD0310;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      -[CLKProgressProvider startUpdatesWithHandler:](v7, "startUpdatesWithHandler:", &v12);
      v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v8;

      -[NTKUtilitySmallRingImageComplicationView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v5, v12, v13, v14, v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v10 = [NTKRing alloc];
    objc_msgSend(v3, "fillFraction");
    v5 = -[NTKRing initWithFillFraction:style:](v10, "initWithFillFraction:style:", objc_msgSend(v3, "ringStyle"), v11);
    -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v5);
  }

}

void __68__NTKUtilitySmallRingImageComplicationView__updateForTemplateChange__block_invoke(uint64_t a1)
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
  double v14;
  double v15;
  void *v16;
  id v17;
  _BYTE v18[64];
  double v19;

  v17 = a3;
  -[NTKUtilityComplicationView timeTravelDate](self, "timeTravelDate");
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
  objc_msgSend(v17, "progressFractionForNow:", v7);
  v10 = v9;
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", objc_msgSend(v11, "ringStyle"), v10);

  objc_msgSend(v17, "backgroundRingAlpha");
  if (v13 >= 0.0)
  {
    objc_msgSend(v17, "backgroundRingAlpha");
    v15 = v14;
    -[NTKUtilityComplicationView device](self, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v16, v18);
    -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:backgroundRingAlpha:](self, "updateRingWithRingDescription:backgroundRingAlpha:", v12, v15 / v19);

  }
  else
  {
    -[NTKUtilitySmallRingComplicationView updateRingWithRingDescription:](self, "updateRingWithRingDescription:", v12);
  }

}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  v4 = (void (**)(id, CDComplicationImageView *))a3;
  -[NTKUtilitySmallRingComplicationView _enumerateColoringViewsWithBlock:](&v5, sel__enumerateColoringViewsWithBlock_, v4);
  v4[2](v4, self->_imageView);

}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);

  v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4[2](v4, self->_imageView);

}

- (id)ringColor
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "progressProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
