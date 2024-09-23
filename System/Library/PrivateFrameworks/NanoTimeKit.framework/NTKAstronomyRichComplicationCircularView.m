@implementation NTKAstronomyRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKAstronomyRichComplicationCircularView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyRichComplicationCircularView;
  return -[NTKAstronomyRichComplicationBaseCircularView initWithFamily:](&v3, sel_initWithFamily_, 10);
}

@end
