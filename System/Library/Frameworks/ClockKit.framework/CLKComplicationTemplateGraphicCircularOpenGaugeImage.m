@implementation CLKComplicationTemplateGraphicCircularOpenGaugeImage

- (CLKComplicationTemplateGraphicCircularOpenGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKGaugeProvider *v8;
  CLKFullColorImageProvider *v9;
  CLKTextProvider *v10;
  CLKComplicationTemplateGraphicCircularOpenGaugeImage *v11;
  CLKComplicationTemplateGraphicCircularOpenGaugeImage *v12;
  objc_super v14;

  v8 = gaugeProvider;
  v9 = bottomImageProvider;
  v10 = centerTextProvider;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenGaugeImage;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKComplicationTemplateGraphicCircularOpenGaugeImage setGaugeProvider:](v11, "setGaugeProvider:", v8);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeImage setBottomImageProvider:](v12, "setBottomImageProvider:", v9);
    -[CLKComplicationTemplateGraphicCircularOpenGaugeImage setCenterTextProvider:](v12, "setCenterTextProvider:", v10);
  }

  return v12;
}

+ (CLKComplicationTemplateGraphicCircularOpenGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKTextProvider *v8;
  CLKFullColorImageProvider *v9;
  CLKGaugeProvider *v10;
  void *v11;

  v8 = centerTextProvider;
  v9 = bottomImageProvider;
  v10 = gaugeProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:bottomImageProvider:centerTextProvider:", v10, v9, v8);

  return (CLKComplicationTemplateGraphicCircularOpenGaugeImage *)v11;
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

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  void (**v4)(id, const __CFString *, _QWORD, uint64_t, void *, uint64_t, char *, double, double, double, double, double);
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

  v4 = (void (**)(id, const __CFString *, _QWORD, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_980);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_981);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_981);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_981, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_982 = objc_msgSend(v6, "version");

    __102__CLKComplicationTemplateGraphicCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_982;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_980);
  v14 = *(double *)&qword_254AB8658;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_978[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_979);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("bottomImageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __102__CLKComplicationTemplateGraphicCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 11.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_979 = v2;
  objc_msgSend(v5, "scaledValue:", 11.0);
  qword_254AB8658 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:", 11.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_978 = v4;

}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  objc_setProperty_nonatomic_copy(self, a2, gaugeProvider, 72);
}

- (CLKFullColorImageProvider)bottomImageProvider
{
  return self->_bottomImageProvider;
}

- (void)setBottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, bottomImageProvider, 80);
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
  objc_storeStrong((id *)&self->_bottomImageProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
