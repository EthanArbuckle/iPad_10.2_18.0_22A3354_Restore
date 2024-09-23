@implementation CLKComplicationTemplateGraphicRectangularTextMeteredGauge

- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5
{
  return -[CLKComplicationTemplateGraphicRectangularTextMeteredGauge initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:](self, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:", 0, a3, a4, a5);
}

- (CLKComplicationTemplateGraphicRectangularTextMeteredGauge)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CLKComplicationTemplateGraphicRectangularTextMeteredGauge *v14;
  CLKComplicationTemplateGraphicRectangularTextMeteredGauge *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicRectangularTextMeteredGauge;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateGraphicRectangularTextMeteredGauge setHeaderImageProvider:](v14, "setHeaderImageProvider:", v10);
    -[CLKComplicationTemplateGraphicRectangularTextMeteredGauge setHeaderTextProvider:](v15, "setHeaderTextProvider:", v11);
    -[CLKComplicationTemplateGraphicRectangularTextMeteredGauge setBody1TextProvider:](v15, "setBody1TextProvider:", v12);
    -[CLKComplicationTemplateGraphicRectangularTextMeteredGauge setGaugeProvider:](v15, "setGaugeProvider:", v13);
  }

  return v15;
}

+ (id)templateWithHeaderTextProvider:(id)a3 body1TextProvider:(id)a4 gaugeProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:body1TextProvider:gaugeProvider:", v10, v9, v8);

  return v11;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 body1TextProvider:(id)a5 gaugeProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:gaugeProvider:", v13, v12, v11, v10);

  return v14;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1150);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1151);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1151);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1151, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1152 = objc_msgSend(v6, "version");

    __107__CLKComplicationTemplateGraphicRectangularTextMeteredGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1152;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1150);
  v14 = *(double *)&qword_254AB8898;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1148[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1149);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("headerImageProvider"), 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);

}

void __107__CLKComplicationTemplateGraphicRectangularTextMeteredGauge__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 19.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1149 = v2;
  objc_msgSend(v5, "scaledValue:", 14.0);
  qword_254AB8898 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:", 14.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1148 = v4;

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

- (void)setHeaderImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)body1TextProvider
{
  return self->_body1TextProvider;
}

- (void)setBody1TextProvider:(id)a3
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
  objc_storeStrong((id *)&self->_body1TextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
