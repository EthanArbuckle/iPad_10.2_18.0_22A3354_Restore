@implementation NTKWorldClockRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKWorldClockRichComplicationExtraLargeCircularView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockRichComplicationExtraLargeCircularView;
  return -[NTKWorldClockRichComplicationBaseCircularView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

@end
