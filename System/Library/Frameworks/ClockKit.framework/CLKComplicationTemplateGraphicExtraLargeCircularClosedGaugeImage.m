@implementation CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage

- (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKGaugeProvider *v6;
  CLKFullColorImageProvider *v7;
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *v8;
  CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *v9;
  objc_super v11;

  v6 = gaugeProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage setGaugeProvider:](v8, "setGaugeProvider:", v6);
    -[CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage setImageProvider:](v9, "setImageProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v6;
  CLKGaugeProvider *v7;
  void *v8;

  v6 = imageProvider;
  v7 = gaugeProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:imageProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage *)v8;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1192);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1193);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1193);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1193, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1194 = objc_msgSend(v6, "version");

    __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1194;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1192);
  v14 = *(double *)&qword_254AB8948;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1190[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1191);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v7[3] = &__block_descriptor_40_e26_d16__0__CLKDeviceMetrics_8l;
  *(double *)&v7[4] = v4;
  v5 = (double (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](v7);
  objc_msgSend(v3, "scaledValue:", v4 * 19.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1191 = v6;
  qword_254AB8948 = ((double (**)(_QWORD, void *))v5)[2](v5, v3);
  objc_msgSend(v3, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1190 = ((double (**)(_QWORD, void *))v5)[2](v5, v3);

}

uint64_t __114__CLKComplicationTemplateGraphicExtraLargeCircularClosedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scaledValue:withOverride:forSizeClass:", 3, *(double *)(a1 + 32) * 27.0, *(double *)(a1 + 32) * 31.0);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(CLKGaugeProvider *)gaugeProvider
{
  objc_setProperty_nonatomic_copy(self, a2, gaugeProvider, 72);
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
