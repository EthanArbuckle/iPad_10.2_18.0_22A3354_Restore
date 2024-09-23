@implementation NTKCircularSmallCircularImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKCircularSmallCircularImageView)initWithFrame:(CGRect)a3
{
  NTKCircularSmallCircularImageView *v3;
  NTKCircularSmallCircularImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCircularSmallCircularImageView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NTKCircularComplicationView setWantsPlatter:](v3, "setWantsPlatter:", 0);
  return v4;
}

- (void)layoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCircularSmallCircularImageView;
  -[NTKCircularComplicationView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKCircularSmallCircularImageView bounds](self, "bounds");
  -[CDComplicationImageView sizeToFit](self->_imageView, "sizeToFit");
  -[CDComplicationImageView frame](self->_imageView, "frame");
  -[NTKCircularComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v5, v7, v9, v11);
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCircularSmallCircularImageView;
  -[NTKCircularComplicationView setUsesMediumLayout:](&v3, sel_setUsesMediumLayout_, a3);
}

- (void)_updateForTemplateChange
{
  void *v3;
  CDComplicationImageView *imageView;
  void *v5;
  char v6;
  CDComplicationImageView *v7;
  CDComplicationImageView *v8;
  CDComplicationImageView *v9;
  id v10;

  -[NTKCircularComplicationView complicationTemplate](self, "complicationTemplate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  -[CDComplicationImageView imageProvider](imageView, "imageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", imageView, v5);

  v7 = self->_imageView;
  if ((v6 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](v7, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v3);
    v8 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_imageView;
    self->_imageView = v8;

    if (self->_imageView)
    {
      -[NTKCircularSmallCircularImageView addSubview:](self, "addSubview:");
      v7 = self->_imageView;
    }
    else
    {
      v7 = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](v7, "setImageProvider:", v3);
  -[NTKCircularComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", self->_imageView);
  -[NTKCircularSmallCircularImageView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(a3, self->_imageView);
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
