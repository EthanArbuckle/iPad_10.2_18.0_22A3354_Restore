@implementation CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText

- (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKGaugeProvider *v8;
  CLKTextProvider *v9;
  CLKTextProvider *v10;
  CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *v11;
  CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *v12;
  objc_super v14;

  v8 = gaugeProvider;
  v9 = bottomTextProvider;
  v10 = centerTextProvider;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText setGaugeProvider:](v11, "setGaugeProvider:", v8);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText setBottomTextProvider:](v12, "setBottomTextProvider:", v9);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText setCenterTextProvider:](v12, "setCenterTextProvider:", v10);
  }

  return v12;
}

+ (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomTextProvider:(CLKTextProvider *)bottomTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKTextProvider *v8;
  CLKTextProvider *v9;
  CLKGaugeProvider *v10;
  void *v11;

  v8 = centerTextProvider;
  v9 = bottomTextProvider;
  v10 = gaugeProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:bottomTextProvider:centerTextProvider:", v10, v9, v8);

  return (CLKComplicationTemplateGraphicCircularOpenGaugeSimpleText *)v11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("bottomTextProvider"), 0, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("centerTextProvider"), 0, 1, &v4);

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

- (CLKTextProvider)bottomTextProvider
{
  return self->_bottomTextProvider;
}

- (void)setBottomTextProvider:(CLKTextProvider *)bottomTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, bottomTextProvider, 80);
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, centerTextProvider, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerTextProvider, 0);
  objc_storeStrong((id *)&self->_bottomTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
