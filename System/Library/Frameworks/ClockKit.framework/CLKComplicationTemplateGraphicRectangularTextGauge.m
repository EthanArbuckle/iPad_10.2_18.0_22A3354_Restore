@implementation CLKComplicationTemplateGraphicRectangularTextGauge

- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  return -[CLKComplicationTemplateGraphicRectangularTextGauge initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:](self, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:", 0, headerTextProvider, body1TextProvider, gaugeProvider);
}

- (CLKComplicationTemplateGraphicRectangularTextGauge)initWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  CLKFullColorImageProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKGaugeProvider *v13;
  CLKComplicationTemplateGraphicRectangularTextGauge *v14;
  CLKComplicationTemplateGraphicRectangularTextGauge *v15;
  objc_super v17;

  v10 = headerImageProvider;
  v11 = headerTextProvider;
  v12 = body1TextProvider;
  v13 = gaugeProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicRectangularTextGauge;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateGraphicRectangularTextGauge setHeaderImageProvider:](v14, "setHeaderImageProvider:", v10);
    -[CLKComplicationTemplateGraphicRectangularTextGauge setHeaderTextProvider:](v15, "setHeaderTextProvider:", v11);
    -[CLKComplicationTemplateGraphicRectangularTextGauge setBody1TextProvider:](v15, "setBody1TextProvider:", v12);
    -[CLKComplicationTemplateGraphicRectangularTextGauge setGaugeProvider:](v15, "setGaugeProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  CLKGaugeProvider *v8;
  CLKTextProvider *v9;
  CLKTextProvider *v10;
  void *v11;

  v8 = gaugeProvider;
  v9 = body1TextProvider;
  v10 = headerTextProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:body1TextProvider:gaugeProvider:", v10, v9, v8);

  return (CLKComplicationTemplateGraphicRectangularTextGauge *)v11;
}

+ (CLKComplicationTemplateGraphicRectangularTextGauge)templateWithHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider headerTextProvider:(CLKTextProvider *)headerTextProvider body1TextProvider:(CLKTextProvider *)body1TextProvider gaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  CLKGaugeProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKFullColorImageProvider *v13;
  void *v14;

  v10 = gaugeProvider;
  v11 = body1TextProvider;
  v12 = headerTextProvider;
  v13 = headerImageProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateGraphicRectangularTextGauge *)v14;
}

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
    v3[2](v3, CFSTR("body1TextProvider"), 0, 1, &v4);

}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  void (**v4)(id, const __CFString *, uint64_t, uint64_t, void *, uint64_t, _BYTE *, double, double, double, double, double);
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  char v17;

  v4 = (void (**)(id, const __CFString *, uint64_t, uint64_t, void *, uint64_t, _BYTE *, double, double, double, double, double))a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1115);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1116);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1116);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1116, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1117 = objc_msgSend(v6, "version");

    __100__CLKComplicationTemplateGraphicRectangularTextGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1117;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1115);
  v14 = *(double *)&qword_254AB8800;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1113[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1114);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("headerImageProvider"), 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);

}

void __100__CLKComplicationTemplateGraphicRectangularTextGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 12.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1114 = v2;
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  qword_254AB8800 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1113 = v4;

}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
}

- (CLKFullColorImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(CLKFullColorImageProvider *)headerImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerImageProvider, 72);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(CLKTextProvider *)headerTextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, headerTextProvider, 80);
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(CLKTextProvider *)body1TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, body1TextProvider, 88);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  objc_setProperty_nonatomic_copy(self, a2, gaugeProvider, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
