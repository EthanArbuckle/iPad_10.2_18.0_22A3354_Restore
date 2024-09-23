@implementation CLKComplicationTemplateGraphicCornerGaugeText

- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  return -[CLKComplicationTemplateGraphicCornerGaugeText initWithGaugeProvider:leadingTextProvider:trailingTextProvider:outerTextProvider:](self, "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:outerTextProvider:", gaugeProvider, 0, 0, outerTextProvider);
}

- (CLKComplicationTemplateGraphicCornerGaugeText)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  CLKGaugeProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKTextProvider *v13;
  CLKComplicationTemplateGraphicCornerGaugeText *v14;
  CLKComplicationTemplateGraphicCornerGaugeText *v15;
  objc_super v17;

  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = outerTextProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCornerGaugeText;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateGraphicCornerGaugeText setGaugeProvider:](v14, "setGaugeProvider:", v10);
    -[CLKComplicationTemplateGraphicCornerGaugeText setLeadingTextProvider:](v15, "setLeadingTextProvider:", v11);
    -[CLKComplicationTemplateGraphicCornerGaugeText setTrailingTextProvider:](v15, "setTrailingTextProvider:", v12);
    -[CLKComplicationTemplateGraphicCornerGaugeText setOuterTextProvider:](v15, "setOuterTextProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  CLKTextProvider *v6;
  CLKGaugeProvider *v7;
  void *v8;

  v6 = outerTextProvider;
  v7 = gaugeProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:outerTextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCornerGaugeText *)v8;
}

+ (CLKComplicationTemplateGraphicCornerGaugeText)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider outerTextProvider:(CLKTextProvider *)outerTextProvider
{
  CLKTextProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKGaugeProvider *v13;
  void *v14;

  v10 = outerTextProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:outerTextProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateGraphicCornerGaugeText *)v14;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, uint64_t, uint64_t, _BYTE *);
  char v4;

  v3 = (void (**)(id, const __CFString *, uint64_t, uint64_t, _BYTE *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("leadingTextProvider"), 1, 1, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("trailingTextProvider"), 1, 1, &v4);
    if (!v4)
      v3[2](v3, CFSTR("outerTextProvider"), 0, 1, &v4);
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

- (CLKTextProvider)outerTextProvider
{
  return self->_outerTextProvider;
}

- (void)setOuterTextProvider:(CLKTextProvider *)outerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, outerTextProvider, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerTextProvider, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
