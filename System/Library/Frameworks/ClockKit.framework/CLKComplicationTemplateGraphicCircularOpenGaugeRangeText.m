@implementation CLKComplicationTemplateGraphicCircularOpenGaugeRangeText

- (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKGaugeProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *v14;
  CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *v15;
  objc_super v17;

  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = centerTextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenGaugeRangeText;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateGraphicCircularOpenGaugeRangeText setGaugeProvider:](v14, "setGaugeProvider:", v10);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeRangeText setLeadingTextProvider:](v15, "setLeadingTextProvider:", v11);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeRangeText setTrailingTextProvider:](v15, "setTrailingTextProvider:", v12);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeRangeText setCenterTextProvider:](v15, "setCenterTextProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKTextProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKGaugeProvider *v13;
  void *v14;

  v10 = centerTextProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:centerTextProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateGraphicCircularOpenGaugeRangeText *)v14;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("leadingTextProvider"), 0, 1, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("trailingTextProvider"), 0, 1, &v4);
    if (!v4)
      v3[2](v3, CFSTR("centerTextProvider"), 0, 1, &v4);
  }

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

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(CLKTextProvider *)leadingTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, leadingTextProvider, 80);
}

- (CLKTextProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void)setTrailingTextProvider:(CLKTextProvider *)trailingTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, trailingTextProvider, 88);
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(CLKTextProvider *)centerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, centerTextProvider, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerTextProvider, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
