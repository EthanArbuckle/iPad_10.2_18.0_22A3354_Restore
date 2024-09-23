@implementation NTKRichComplicationExtraLargeCircularOpenGaugeSimpleTextView

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

- (NTKRichComplicationExtraLargeCircularOpenGaugeSimpleTextView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularOpenGaugeSimpleTextView;
  return -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "gaugeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView progressView](self, "progressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGaugeProvider:", v6);

  objc_msgSend(v5, "bottomTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView smallLabel](self, "smallLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextProvider:", v8);

  objc_msgSend(v5, "centerTextProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView centerLabel](self, "centerLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextProvider:", v11);

}

@end
