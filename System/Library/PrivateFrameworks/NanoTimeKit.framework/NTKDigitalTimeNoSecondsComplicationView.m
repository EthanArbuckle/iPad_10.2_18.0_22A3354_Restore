@implementation NTKDigitalTimeNoSecondsComplicationView

- (NTKDigitalTimeNoSecondsComplicationView)init
{
  NTKDigitalTimeNoSecondsComplicationView *v2;
  NTKDigitalTimeNoSecondsComplicationView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKDigitalTimeNoSecondsComplicationView;
  v2 = -[NTKDigitalTimeComplicationView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NTKDigitalTimeComplicationView setShowsSeconds:](v2, "setShowsSeconds:", 0);
  return v3;
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
