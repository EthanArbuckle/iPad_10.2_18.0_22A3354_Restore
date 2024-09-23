@implementation NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView

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

- (NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView;
  return -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_msgSend(v5, "gaugeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView progressView](self, "progressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGaugeProvider:", v6);

  objc_msgSend(v5, "leadingTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView leadingSmallLabel](self, "leadingSmallLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextProvider:", v8);

  objc_msgSend(v5, "trailingTextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView trailingSmallLabel](self, "trailingSmallLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextProvider:", v10);

  objc_msgSend(v5, "centerTextProvider");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView centerLabel](self, "centerLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextProvider:", v13);

}

@end
