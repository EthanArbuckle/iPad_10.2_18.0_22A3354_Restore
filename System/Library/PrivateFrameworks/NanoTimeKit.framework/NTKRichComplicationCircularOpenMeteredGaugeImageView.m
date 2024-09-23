@implementation NTKRichComplicationCircularOpenMeteredGaugeImageView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
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
  return 2;
}

- (NTKRichComplicationCircularOpenMeteredGaugeImageView)init
{
  return -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView initWithFamily:](self, "initWithFamily:", 10);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView progressView](self, "progressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gaugeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGaugeProvider:", v8);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageProvider:reason:", v10, a4);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTextProvider:", v11);
}

@end
