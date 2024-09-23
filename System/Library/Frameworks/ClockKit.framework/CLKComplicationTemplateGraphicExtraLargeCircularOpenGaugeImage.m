@implementation CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage

- (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKGaugeProvider *v8;
  CLKFullColorImageProvider *v9;
  CLKTextProvider *v10;
  CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *v11;
  CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *v12;
  objc_super v14;

  v8 = gaugeProvider;
  v9 = bottomImageProvider;
  v10 = centerTextProvider;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage setGaugeProvider:](v11, "setGaugeProvider:", v8);
    -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage setBottomImageProvider:](v12, "setBottomImageProvider:", v9);
    -[CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage setCenterTextProvider:](v12, "setCenterTextProvider:", v10);
  }

  return v12;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider bottomImageProvider:(CLKFullColorImageProvider *)bottomImageProvider centerTextProvider:(CLKTextProvider *)centerTextProvider
{
  CLKTextProvider *v8;
  CLKFullColorImageProvider *v9;
  CLKGaugeProvider *v10;
  void *v11;

  v8 = centerTextProvider;
  v9 = bottomImageProvider;
  v10 = gaugeProvider;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:bottomImageProvider:centerTextProvider:", v10, v9, v8);

  return (CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage *)v11;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1179);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1180);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1180);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1180, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1181 = objc_msgSend(v6, "version");

    __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1181;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1179);
  v14 = *(double *)&qword_254AB8918;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1177[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1178);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("bottomImageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  _QWORD v7[5];

  v2 = a2;
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v7[3] = &__block_descriptor_40_e26_d16__0__CLKDeviceMetrics_8l;
  *(double *)&v7[4] = v4;
  v5 = (double (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](v7);
  objc_msgSend(v3, "scaledValue:", v4 * 11.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1178 = v6;
  qword_254AB8918 = ((double (**)(_QWORD, void *))v5)[2](v5, v3);
  objc_msgSend(v3, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1177 = ((double (**)(_QWORD, void *))v5)[2](v5, v3);

}

uint64_t __112__CLKComplicationTemplateGraphicExtraLargeCircularOpenGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scaledValue:withOverride:forSizeClass:", 3, *(double *)(a1 + 32) * 11.0, *(double *)(a1 + 32) * 12.0);
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
