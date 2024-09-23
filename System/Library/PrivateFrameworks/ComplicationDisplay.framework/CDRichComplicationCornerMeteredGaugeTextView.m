@implementation CDRichComplicationCornerMeteredGaugeTextView

- (CDRichComplicationCornerMeteredGaugeTextView)initWithFontFallback:(int64_t)a3
{
  CDRichComplicationCornerMeteredGaugeTextView *v3;
  CDRichComplicationCornerMeteredGaugeTextView *v4;
  CDRichComplicationImageView *v5;
  void *v6;
  uint64_t v7;
  CDRichComplicationImageView *outerImageView;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[40];
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
  v3 = -[CDRichComplicationCornerGaugeTextView initWithFontFallback:](&v15, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
  {
    -[CDRichComplicationCornerGaugeTextView _enumerateLabelsWithBlock:](v3, "_enumerateLabelsWithBlock:", &__block_literal_global_2);
    v5 = [CDRichComplicationImageView alloc];
    -[CDRichComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CDRichComplicationImageView initWithDevice:useAccentColor:](v5, "initWithDevice:useAccentColor:", v6, 1);
    outerImageView = v4->_outerImageView;
    v4->_outerImageView = (CDRichComplicationImageView *)v7;

    -[CDRichComplicationImageView setPaused:](v4->_outerImageView, "setPaused:", -[CDRichComplicationView paused](v4, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](v4->_outerImageView, "setFilterProvider:", v4);
    -[CDRichComplicationCornerGaugeTextView outerLabel](v4, "outerLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationCornerMeteredGaugeTextView outerImageView](v4, "outerImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationView device](v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants(v11, (uint64_t)v13);
    objc_msgSend(v9, "setImageView:placement:padding:", v10, 1, v14);

  }
  return v4;
}

uint64_t __69__CDRichComplicationCornerMeteredGaugeTextView_initWithFontFallback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUppercase:", 0);
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
  void *v13;
  __int128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
  -[CDRichComplicationCornerGaugeTextView layoutSubviews](&v15, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(v3, (uint64_t)&v14);

  -[CDRichComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CDRichComplicationCornerMeteredGaugeTextView outerImageView](self, "outerImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  objc_super v8;

  -[CDRichComplicationCornerMeteredGaugeTextView outerImageView](self, "outerImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tritiumUpdateMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (id)objc_msgSend(v4, "integerValue");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CDRichComplicationCornerMeteredGaugeTextView;
    v5 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }
  v6 = (int64_t)v5;

  return v6;
}

+ (int64_t)progressFillStyle
{
  return 4;
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[CDRichComplicationCornerGaugeTextView outerLabel](self, "outerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outerTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextProvider:", v8);

  objc_msgSend(v6, "gaugeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingTextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingTextProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftTextProvider:rightTextProvider:](self, "handleGaugeProvider:leftTextProvider:rightTextProvider:", v9, v10, v11);

  -[CDRichComplicationCornerMeteredGaugeTextView outerImageView](self, "outerImageView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outerImageProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setImageProvider:reason:", v12, a4);
}

- (CDRichComplicationImageView)outerImageView
{
  return self->_outerImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerImageView, 0);
}

@end
