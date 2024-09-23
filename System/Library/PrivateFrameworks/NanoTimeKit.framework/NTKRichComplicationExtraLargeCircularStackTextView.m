@implementation NTKRichComplicationExtraLargeCircularStackTextView

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

- (NTKRichComplicationExtraLargeCircularStackTextView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularStackTextView;
  return -[NTKRichComplicationBaseCircularStackTextView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "line1TextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularStackTextView line1Label](self, "line1Label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextProvider:", v6);

  objc_msgSend(v5, "line2TextProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKRichComplicationBaseCircularStackTextView line2Label](self, "line2Label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextProvider:", v9);

}

@end
