@implementation NTKStopwatchRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKStopwatchRichComplicationCircularView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKStopwatchRichComplicationCircularView;
  return -[NTKStopwatchRichComplicationBaseCircularView initWithFamily:](&v3, sel_initWithFamily_, 10);
}

@end
