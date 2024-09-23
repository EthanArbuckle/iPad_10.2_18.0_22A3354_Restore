@implementation NTKRichComplicationBaseCircularClosedGaugeImageView

- (id)innerView
{
  CDRichComplicationImageView *imageView;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  CDRichComplicationImageView *v9;
  CDRichComplicationImageView *v10;

  imageView = self->_imageView;
  if (!imageView)
  {
    -[CDRichComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKShowGossamerUI(v4);

    v6 = v5 ^ 1u;
    v7 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CDRichComplicationImageView *)objc_msgSend(v7, "initWithDevice:useAccentColor:", v8, v6);
    v10 = self->_imageView;
    self->_imageView = v9;

    -[CDRichComplicationImageView setPaused:](self->_imageView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](self->_imageView, "setFilterProvider:", self);
    imageView = self->_imageView;
  }
  return imageView;
}

- (id)gaugeProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "gaugeProvider");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
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
    v8.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
  -[NTKRichComplicationCircularClosedGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
  -[NTKRichComplicationCircularClosedGaugeContentView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
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
