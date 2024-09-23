@implementation NTKCircularSmallStackImageComplicationView

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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E0C93E90] == a3;
}

- (NTKCircularSmallStackImageComplicationView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallStackImageComplicationView *v3;
  NTKCircularSmallStackImageComplicationView *v4;
  void *v5;
  uint64_t v6;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v8;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKCircularSmallStackImageComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCircularComplicationView _fontForDynamicFontSize:](v3, "_fontForDynamicFontSize:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKCircularComplicationView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v5);
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v6;

    v8 = v4->_label;
    -[NTKCircularComplicationView _layoutConstants](v4, "_layoutConstants");
    -[CLKUIColoringLabel setMaxWidth:](v8, "setMaxWidth:", v10);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  CGFloat v5;
  double v6;
  CDComplicationImageView *imageView;
  void *v8;
  CDComplicationImageView *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  _QWORD v20[20];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKCircularSmallStackImageComplicationView;
  -[NTKCircularComplicationView layoutSubviews](&v21, sel_layoutSubviews);
  -[NTKCircularSmallStackImageComplicationView bounds](self, "bounds");
  memset(v20, 0, 152);
  -[NTKCircularComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
    _LayoutConstantsMedium(v3, (uint64_t)v20);
  else
    _LayoutConstantsSmall(v3, (uint64_t)v20);

  -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
  -[CLKUIColoringLabel sizeToFit](self->_label, "sizeToFit");
  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_imageScaleForTemplate:", v4);
    v5 = v6;
  }
  -[CDComplicationImageView bounds](self->_imageView, "bounds");
  imageView = self->_imageView;
  -[NTKCircularComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectIntegralForDevice();
  -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](imageView, "ntk_setBoundsAndPositionFromFrame:");

  v9 = self->_imageView;
  CGAffineTransformMakeScale(&v19, v5, v5);
  -[CDComplicationImageView setTransform:](v9, "setTransform:", &v19);
  -[CLKUIColoringLabel frame](self->_label, "frame");
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[CLKUIColoringLabel _lastLineBaseline](self->_label, "_lastLineBaseline");
  -[NTKCircularComplicationView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v12, v14, v16, v18);
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
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate____lock_323);
  WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_324);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_324);
  if (v7 != v8)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_imageScaleForTemplate____cachedDevice_324, v14);

    v15 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_324);
    _imageScaleForTemplate____previousCLKDeviceVersion_325 = objc_msgSend(v15, "version");

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke;
    v20[3] = &unk_1E6BD0658;
    v20[4] = v3;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke((uint64_t)v20);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "version");
  v12 = _imageScaleForTemplate____previousCLKDeviceVersion_325;

  if (v11 != v12)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate____lock_323);
  v18 = *(double *)&_imageScaleForTemplate___scale_322;

  return v18;
}

uint64_t __69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke(uint64_t a1)
{
  uint64_t result;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;

  v5 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "maxSDKSize:deviceSize:forImageProviderKey:", 0, &v5, CFSTR("line1ImageProvider"));
  v4 = 0uLL;
  result = objc_msgSend(MEMORY[0x1E0C94190], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1])
    v3.f64[0] = v3.f64[1];
  _imageScaleForTemplate___scale_322 = *(_QWORD *)&v3.f64[0];
  return result;
}

- (void)_updateForTemplateChange
{
  void *v3;
  CLKUIColoringLabel *label;
  void *v5;
  void *v6;
  CDComplicationImageView *imageView;
  void *v8;
  char v9;
  CDComplicationImageView *v10;
  CDComplicationImageView *v11;
  CDComplicationImageView *v12;
  id v13;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  v13 = v3;
  objc_msgSend(v3, "line2TextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v5);

  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
    -[NTKCircularSmallStackImageComplicationView _updateLabelsForFontChange](self, "_updateLabelsForFontChange");
  objc_msgSend(v13, "line1ImageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  -[CDComplicationImageView imageProvider](imageView, "imageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", imageView, v8);

  v10 = self->_imageView;
  if ((v9 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](v10, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v6);
    v11 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v12 = self->_imageView;
    self->_imageView = v11;

    if (self->_imageView)
    {
      -[NTKCircularSmallStackImageComplicationView addSubview:](self, "addSubview:");
      v10 = self->_imageView;
    }
    else
    {
      v10 = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](v10, "setImageProvider:", v6);
  -[NTKCircularComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  -[NTKCircularSmallStackImageComplicationView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateLabelsForFontChange
{
  void *v3;
  void *v4;
  CLKUIColoringLabel *label;
  double v6;

  if (-[NTKCircularComplicationView usesMediumLayout](self, "usesMediumLayout"))
  {
    -[CLKUIColoringLabel text](self->_label, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCircularComplicationView _mediumStackFontForText:](self, "_mediumStackFontForText:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKCircularComplicationView _fontForDynamicFontSize:](self, "_fontForDynamicFontSize:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v4);
  label = self->_label;
  -[NTKCircularComplicationView _layoutConstants](self, "_layoutConstants");
  -[CLKUIColoringLabel setMaxWidth:](label, "setMaxWidth:", v6);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
