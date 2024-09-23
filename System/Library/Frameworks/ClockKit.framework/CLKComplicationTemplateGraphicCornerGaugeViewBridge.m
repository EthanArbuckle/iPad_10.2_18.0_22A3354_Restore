@implementation CLKComplicationTemplateGraphicCornerGaugeViewBridge

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, uint64_t, uint64_t, _BYTE *);
  char v4;

  v3 = (void (**)(id, const __CFString *, uint64_t, uint64_t, _BYTE *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("leadingTextProvider"), 1, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("trailingTextProvider"), 1, 1, &v4);

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
  CLKComplicationTemplateGraphicCornerGaugeImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CLKComplicationTemplateGraphicCornerGaugeImage *v10;

  v4 = a3;
  v5 = [CLKComplicationTemplateGraphicCornerGaugeImage alloc];
  -[CLKComplicationTemplateGraphicCornerGaugeViewBridge gaugeProvider](self, "gaugeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicCornerGaugeViewBridge leadingTextProvider](self, "leadingTextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationTemplateGraphicCornerGaugeViewBridge trailingTextProvider](self, "trailingTextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CLKComplicationTemplateGraphicCornerGaugeImage initWithGaugeProvider:leadingTextProvider:trailingTextProvider:imageProvider:](v5, "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:imageProvider:", v6, v7, v8, v9);
  -[CLKComplicationTemplate setSdkVersion:](v10, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  return v10;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void)setTrailingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
