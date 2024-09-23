@implementation NTKRichComplicationRectangularFullView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (NTKRichComplicationRectangularFullView)init
{
  NTKRichComplicationRectangularFullView *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CDRichComplicationImageView *imageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationRectangularFullView;
  v2 = -[NTKRichComplicationRectangularBaseView init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](v2, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithDevice:useAccentColor:", v4, 0);
    imageView = v2->_imageView;
    v2->_imageView = (CDRichComplicationImageView *)v5;

    -[CDRichComplicationImageView setPaused:](v2->_imageView, "setPaused:", -[CDRichComplicationView paused](v2, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](v2->_imageView, "setFilterProvider:", v2);
    -[NTKRichComplicationRectangularFullView addSubview:](v2, "addSubview:", v2->_imageView);
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CDRichComplicationImageView *imageView;
  double MidX;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationRectangularFullView;
  -[NTKRichComplicationRectangularFullView layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKRichComplicationRectangularFullView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CDRichComplicationImageView setFrame:](self->_imageView, "setFrame:");
  imageView = self->_imageView;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[CDRichComplicationImageView setCenter:](imageView, "setCenter:", MidX, CGRectGetMidY(v15));
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  CDRichComplicationImageView *imageView;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationRectangularFullView;
  -[CDRichComplicationTemplateView _handleTemplate:reason:](&v9, sel__handleTemplate_reason_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    imageView = self->_imageView;
    objc_msgSend(v6, "imageProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationImageView setImageProvider:reason:](imageView, "setImageProvider:reason:", v8, a4);

  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDRichComplicationImageView setPaused:](self->_imageView, "setPaused:", v3);
}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  objc_super v8;

  -[CDRichComplicationImageView tritiumUpdateMode](self->_imageView, "tritiumUpdateMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 >= 2)
      v6 = 2;
    else
      v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationRectangularFullView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
