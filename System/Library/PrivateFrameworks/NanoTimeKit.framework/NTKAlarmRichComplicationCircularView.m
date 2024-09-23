@implementation NTKAlarmRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKAlarmRichComplicationCircularView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAlarmRichComplicationCircularView;
  return -[NTKAlarmRichComplicationBaseCircularView initWithFamily:](&v3, sel_initWithFamily_, 10);
}

- (int64_t)_backgroundFilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 2;
  else
    return 0;
}

- (int64_t)_foregroundFilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 0;
  else
    return 2;
}

@end
