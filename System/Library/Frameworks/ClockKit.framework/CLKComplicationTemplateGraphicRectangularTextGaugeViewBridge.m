@implementation CLKComplicationTemplateGraphicRectangularTextGaugeViewBridge

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("headerTextProvider"), 0, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("bodyTextProvider"), 0, 1, &v4);

}

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, CFSTR("headerLabelData"), 1, 1, &v3);
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("headerLabel")))
    return CFSTR("headerLabelData");
  else
    return 0;
}

- (BOOL)usesSwiftUI
{
  return 1;
}

- (BOOL)needsSerializableCopy
{
  return 1;
}

- (id)serializableCopyWithImageProviders:(id)a3
{
  id v4;
  CLKComplicationTemplateGraphicRectangularTextGauge *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CLKComplicationTemplateGraphicRectangularTextGauge *v10;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicRectangularTextGauge alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headerLabelData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKComplicationTemplateGraphicRectangularTextGaugeViewBridge headerTextProvider](self, "headerTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicRectangularTextGaugeViewBridge bodyTextProvider](self, "bodyTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicRectangularTextGaugeViewBridge gaugeProvider](self, "gaugeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CLKComplicationTemplateGraphicRectangularTextGauge initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:](v5, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:", v6, v7, v8, v9);

  -[CLKComplicationTemplate setSdkVersion:](v10, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v10;
}

- (NSData)headerLabelData
{
  return self->_headerLabelData;
}

- (void)setHeaderLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabelData, a3);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)bodyTextProvider
{
  return self->_bodyTextProvider;
}

- (void)setBodyTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
  objc_storeStrong((id *)&self->_bodyTextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerLabelData, 0);
}

@end
