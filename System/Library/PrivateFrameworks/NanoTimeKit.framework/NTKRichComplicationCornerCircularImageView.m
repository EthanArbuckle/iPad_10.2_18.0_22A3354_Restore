@implementation NTKRichComplicationCornerCircularImageView

- (id)_circularView
{
  CDRichComplicationImageView *imageView;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CDRichComplicationImageView *v8;
  CDRichComplicationImageView *v9;

  imageView = self->_imageView;
  if (!imageView)
  {
    -[CDRichComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CDShowGossamerUI();

    v6 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CDRichComplicationImageView *)objc_msgSend(v6, "initWithDevice:useAccentColor:", v7, v5);
    v9 = self->_imageView;
    self->_imageView = v8;

    -[CDRichComplicationImageView setFilterProvider:](self->_imageView, "setFilterProvider:", self);
    -[CDRichComplicationImageView setPaused:](self->_imageView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    imageView = self->_imageView;
  }
  -[CDRichComplicationImageView setContentMode:](imageView, "setContentMode:", 4);
  return self->_imageView;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCornerCircularImageView;
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
    v8.super_class = (Class)NTKRichComplicationCornerCircularImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
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
  v7.super_class = (Class)NTKRichComplicationCornerCircularImageView;
  -[CDRichComplicationView _setFontConfiguration:](&v7, sel__setFontConfiguration_, v8);
  if (a3->var1)
  {
    -[CDRichComplicationImageView setFontDescriptor:](self->_imageView, "setFontDescriptor:");
    -[CDRichComplicationImageView setFontSizeFactor:](self->_imageView, "setFontSizeFactor:", a3->var2);

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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 8;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;

  objc_msgSend(a3, "imageProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationImageView setImageProvider:reason:](self->_imageView, "setImageProvider:reason:", v6, a4);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKRichComplicationCornerCircularImageView _updatePlatterColor](self, "_updatePlatterColor");
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[NTKRichComplicationCornerCircularImageView _updatePlatterColor](self, "_updatePlatterColor");
  -[CDRichComplicationImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
}

- (void)_updatePlatterColor
{
  void *v3;
  void *v4;
  id v5;

  if (-[CDRichComplicationTemplateView templateWantsPlatter](self, "templateWantsPlatter"))
  {
    -[CDRichComplicationView filterProvider](self, "filterProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorForView:accented:", self, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    CLKUIDefaultComplicationBackgroundColorWithNonAccentColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
