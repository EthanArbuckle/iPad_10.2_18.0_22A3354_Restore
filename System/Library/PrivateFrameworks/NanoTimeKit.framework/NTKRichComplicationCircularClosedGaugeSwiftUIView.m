@implementation NTKRichComplicationCircularClosedGaugeSwiftUIView

- (NTKRichComplicationCircularClosedGaugeSwiftUIView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularClosedGaugeSwiftUIView;
  return -[NTKRichComplicationCircularClosedGaugeContentView initWithFamily:](&v3, sel_initWithFamily_, 10);
}

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

@end
