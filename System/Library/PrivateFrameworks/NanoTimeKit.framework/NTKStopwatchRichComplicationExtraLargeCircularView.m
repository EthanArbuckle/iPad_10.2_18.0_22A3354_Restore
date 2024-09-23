@implementation NTKStopwatchRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKStopwatchRichComplicationExtraLargeCircularView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKStopwatchRichComplicationExtraLargeCircularView;
  return -[NTKStopwatchRichComplicationBaseCircularView initWithFamily:](&v3, sel_initWithFamily_, 12);
}

@end
