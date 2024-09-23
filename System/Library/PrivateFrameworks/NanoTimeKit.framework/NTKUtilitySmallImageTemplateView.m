@implementation NTKUtilitySmallImageTemplateView

- (NTKUtilitySmallImageTemplateView)initWithFrame:(CGRect)a3
{
  NTKUtilitySmallImageTemplateView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUtilitySmallImageTemplateView;
  result = -[NTKUtilityCircularComplicationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_needsLayoutContent = 1;
  return result;
}

- (void)_layoutContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (self->_needsLayoutContent)
  {
    -[NTKUtilityCircularComplicationView contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v5, v7);
    -[NTKUtilityComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredIntegralRectForDevice();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v10, v12, v14, v16);
    self->_needsLayoutContent = 0;
  }
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateForTemplateChange
{
  void *v3;
  void *v4;
  char v5;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v7;
  CDComplicationImageView *v8;
  void *v9;
  CDComplicationImageView *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKUtilitySmallImageTemplateView;
  -[NTKUtilityComplicationView _updateForTemplateChange](&v12, sel__updateForTemplateChange);
  -[NTKUtilityComplicationView complicationTemplate](self, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v4);
  imageView = self->_imageView;
  if ((v5 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v4);
    v7 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_imageView;
    self->_imageView = v7;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      -[NTKUtilityCircularComplicationView contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_imageView);

      imageView = self->_imageView;
    }
  }
  -[NTKUtilityComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", imageView);
  v10 = self->_imageView;
  objc_msgSend(v3, "imageProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDComplicationImageView setImageProvider:](v10, "setImageProvider:", v11);

  -[NTKUtilitySmallImageTemplateView _setNeedsLayoutContent](self, "_setNeedsLayoutContent");
}

- (void)_setNeedsLayoutContent
{
  void *v3;
  id v4;

  self->_needsLayoutContent = 1;
  -[NTKUtilityCircularComplicationView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationDisplayNeedsResize:", self);

}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(a3, self->_imageView);
}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);

  v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4[2](v4, self->_imageView);

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
