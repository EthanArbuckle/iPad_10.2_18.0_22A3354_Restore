@implementation CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeViewBridge

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

- (void)_enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("bottomLabelData"), 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bottomLabel")))
    return CFSTR("bottomLabelData");
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
  CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *v5;
  void *v6;
  void *v7;
  void *v8;
  CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *v9;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage alloc];
  -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeViewBridge gaugeProvider](self, "gaugeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bottomLabelData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeViewBridge centerTextProvider](self, "centerTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage initWithGaugeProvider:bottomImageProvider:centerTextProvider:](v5, "initWithGaugeProvider:bottomImageProvider:centerTextProvider:", v6, v7, v8);

  -[CLKComplicationTemplate setSdkVersion:](v9, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v9;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKTextProvider)centerTextProvider
{
  return self->_centerTextProvider;
}

- (void)setCenterTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)bottomLabelData
{
  return self->_bottomLabelData;
}

- (void)setBottomLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelData, 0);
  objc_storeStrong((id *)&self->_centerTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
