@implementation NTKRichComplicationRectangularLargeImageView

- (id)body
{
  CDRichComplicationImageView *imageView;
  id v4;
  void *v5;
  CDRichComplicationImageView *v6;
  CDRichComplicationImageView *v7;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CDRichComplicationImageView *)objc_msgSend(v4, "initWithDevice:useAccentColor:", v5, 0);
    v7 = self->_imageView;
    self->_imageView = v6;

    -[CDRichComplicationImageView setPaused:](self->_imageView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](self->_imageView, "setFilterProvider:", self);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
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
    v8.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
  v6 = a3;
  -[NTKRichComplicationRectangularHeadlineLargeBodyView _handleTemplate:reason:](&v8, sel__handleTemplate_reason_, v6, a4);
  objc_msgSend(v6, "imageProvider", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationImageView setImageProvider:reason:](self->_imageView, "setImageProvider:reason:", v7, a4);
}

- (id)headerTextProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "textProvider");
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
  v6 = a4;
  -[CDRichComplicationView renderSynchronouslyWithImageQueueDiscard:inGroup:](&v7, sel_renderSynchronouslyWithImageQueueDiscard_inGroup_, v4, v6);
  -[CDRichComplicationImageView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_imageView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);

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
  v7.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
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
  v5.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
  -[NTKRichComplicationRectangularHeadlineLargeBodyView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularLargeImageView;
  -[NTKRichComplicationRectangularHeadlineLargeBodyView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
