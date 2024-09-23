@implementation NTKRichComplicationExtraLargeCircularSwiftUIView

- (NTKRichComplicationExtraLargeCircularSwiftUIView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularSwiftUIView;
  return -[NTKRichComplicationBaseCircularSwiftUIView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
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
