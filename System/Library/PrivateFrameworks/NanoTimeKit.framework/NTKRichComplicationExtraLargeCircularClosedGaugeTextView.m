@implementation NTKRichComplicationExtraLargeCircularClosedGaugeTextView

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
  return a3 == 12;
}

- (NTKRichComplicationExtraLargeCircularClosedGaugeTextView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularClosedGaugeTextView;
  return -[NTKRichComplicationBaseCircularClosedGaugeTextView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "centerTextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularClosedGaugeTextView centerLabel](self, "centerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextProvider:", v6);

  objc_msgSend(v5, "gaugeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationBaseCircularClosedGaugeTextView progressView](self, "progressView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGaugeProvider:", v8);

  -[NTKRichComplicationBaseCircularClosedGaugeTextView progressView](self, "progressView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStyle:", 1);

}

@end
