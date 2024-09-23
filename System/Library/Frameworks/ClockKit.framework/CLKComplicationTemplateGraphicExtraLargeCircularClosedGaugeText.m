@implementation CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText

- (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKGaugeProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText *v8;
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText *v9;
  objc_super v11;

  v6 = gaugeProvider;
  v7 = centerTextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText setGaugeProvider:](v8, "setGaugeProvider:", v6);
    -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText setCenterTextProvider:](v9, "setCenterTextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKTextProvider *v6;
  CLKGaugeProvider *v7;
  void *v8;

  v6 = centerTextProvider;
  v7 = gaugeProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:centerTextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeText *)v8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("centerTextProvider"), 0, 1, &v3);
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  objc_setProperty_nonatomic_copy(self, a2, gaugeProvider, 72);
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, centerTextProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
