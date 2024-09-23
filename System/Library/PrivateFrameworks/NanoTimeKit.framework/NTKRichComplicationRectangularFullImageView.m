@implementation NTKRichComplicationRectangularFullImageView

- (id)content
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
  v5.super_class = (Class)NTKRichComplicationRectangularFullImageView;
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
    v8.super_class = (Class)NTKRichComplicationRectangularFullImageView;
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

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;

  objc_msgSend(a3, "imageProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationImageView setImageProvider:reason:](self->_imageView, "setImageProvider:reason:", v6, a4);

}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[CDRichComplicationImageView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_imageView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullImageView;
  -[CDRichComplicationView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularFullImageView;
  -[CDRichComplicationView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
