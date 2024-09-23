@implementation CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeViewBridge

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
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("labelData"), 0, 1, &v3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("label")))
    return CFSTR("labelData");
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
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *v5;
  void *v6;
  void *v7;
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *v8;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage alloc];
  -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeViewBridge gaugeProvider](self, "gaugeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage initWithGaugeProvider:imageProvider:](v5, "initWithGaugeProvider:imageProvider:", v6, v7);
  -[CLKComplicationTemplate setSdkVersion:](v8, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v8;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)labelData
{
  return self->_labelData;
}

- (void)setLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_labelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelData, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
