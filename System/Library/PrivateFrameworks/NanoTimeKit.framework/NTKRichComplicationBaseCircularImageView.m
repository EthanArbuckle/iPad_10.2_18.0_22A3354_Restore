@implementation NTKRichComplicationBaseCircularImageView

- (NTKRichComplicationBaseCircularImageView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularImageView *v3;
  NTKRichComplicationBaseCircularImageView *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  CDRichComplicationImageView *imageView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationBaseCircularImageView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v13, sel_initWithFamily_, a3);
  v4 = v3;
  if (v3)
  {
    -[CDRichComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = NTKShowGossamerUI(v5);

    v7 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](v4, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDevice:useAccentColor:", v8, v6);
    imageView = v4->_imageView;
    v4->_imageView = (CDRichComplicationImageView *)v9;

    -[CDRichComplicationImageView setPaused:](v4->_imageView, "setPaused:", -[CDRichComplicationView paused](v4, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](v4->_imageView, "setFilterProvider:", v4);
    -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_imageView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBaseCircularImageView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v7, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CDRichComplicationImageView setFrame:](self->_imageView, "setFrame:");

  -[CDRichComplicationImageView bounds](self->_imageView, "bounds");
  v5 = v4 * 0.5;
  -[CDRichComplicationImageView layer](self->_imageView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularImageView;
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
    v8.super_class = (Class)NTKRichComplicationBaseCircularImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  objc_super v7;
  BOOL v8[8];
  id v9;
  double v10;

  v8[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v9 = v5;
  v10 = var2;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBaseCircularImageView;
  -[CDRichComplicationView _setFontConfiguration:](&v7, sel__setFontConfiguration_, v8);
  if (a3->var1)
  {
    -[CDRichComplicationImageView setFontDescriptor:](self->_imageView, "setFontDescriptor:");
    -[CDRichComplicationImageView setFontSizeFactor:](self->_imageView, "setFontSizeFactor:", a3->var2);

  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularImageView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularImageView;
  -[NTKRichComplicationCircularBaseView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
}

- (void)setTintedFraction:(double)a3
{
  if (-[CDRichComplicationImageView conformsToProtocol:](self->_imageView, "conformsToProtocol:", &unk_1F8E31BD0))-[CDRichComplicationImageView setTintedFraction:](self->_imageView, "setTintedFraction:", a3);
}

- (void)setTintedPlatterColor:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CDRichComplicationImageView conformsToProtocol:](self->_imageView, "conformsToProtocol:", &unk_1F8E31BD0))-[CDRichComplicationImageView setTintedPlatterColor:](self->_imageView, "setTintedPlatterColor:", v4);

}

- (CDRichComplicationImageView)imageView
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
