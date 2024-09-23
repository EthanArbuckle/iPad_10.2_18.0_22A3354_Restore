@implementation NTKRichComplicationCornerMeteredGaugeImageView

- (NTKRichComplicationCornerMeteredGaugeImageView)initWithFontFallback:(int64_t)a3
{
  NTKRichComplicationCornerMeteredGaugeImageView *v3;
  NTKRichComplicationCornerMeteredGaugeImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationCornerMeteredGaugeImageView;
  v3 = -[CDRichComplicationCornerGaugeCustomView initWithFontFallback:](&v6, sel_initWithFontFallback_, a3);
  v4 = v3;
  if (v3)
    -[CDRichComplicationCornerBaseGaugeView _enumerateLabelsWithBlock:](v3, "_enumerateLabelsWithBlock:", &__block_literal_global_144);
  return v4;
}

uint64_t __71__NTKRichComplicationCornerMeteredGaugeImageView_initWithFontFallback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUppercase:", 0);
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

+ (int64_t)progressFillStyle
{
  return 4;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "imageProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCornerGaugeImageView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageProvider:reason:", v11, a4);

  objc_msgSend(v6, "gaugeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingTextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingTextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRichComplicationCornerBaseGaugeView handleGaugeProvider:leftTextProvider:rightTextProvider:](self, "handleGaugeProvider:leftTextProvider:rightTextProvider:", v8, v9, v10);
}

@end
