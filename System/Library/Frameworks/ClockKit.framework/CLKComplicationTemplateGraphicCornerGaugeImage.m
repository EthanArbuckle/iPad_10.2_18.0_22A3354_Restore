@implementation CLKComplicationTemplateGraphicCornerGaugeImage

- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  return -[CLKComplicationTemplateGraphicCornerGaugeImage initWithGaugeProvider:leadingTextProvider:trailingTextProvider:imageProvider:](self, "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:imageProvider:", gaugeProvider, 0, 0, imageProvider);
}

- (CLKComplicationTemplateGraphicCornerGaugeImage)initWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKGaugeProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKFullColorImageProvider *v13;
  CLKComplicationTemplateGraphicCornerGaugeImage *v14;
  CLKComplicationTemplateGraphicCornerGaugeImage *v15;
  objc_super v17;

  v10 = gaugeProvider;
  v11 = leadingTextProvider;
  v12 = trailingTextProvider;
  v13 = imageProvider;
  v17.receiver = self;
  v17.super_class = (Class)CLKComplicationTemplateGraphicCornerGaugeImage;
  v14 = -[CLKComplicationTemplate initPrivate](&v17, sel_initPrivate);
  v15 = v14;
  if (v14)
  {
    -[CLKComplicationTemplateGraphicCornerGaugeImage setGaugeProvider:](v14, "setGaugeProvider:", v10);
    -[CLKComplicationTemplateGraphicCornerGaugeImage setLeadingTextProvider:](v15, "setLeadingTextProvider:", v11);
    -[CLKComplicationTemplateGraphicCornerGaugeImage setTrailingTextProvider:](v15, "setTrailingTextProvider:", v12);
    -[CLKComplicationTemplateGraphicCornerGaugeImage setImageProvider:](v15, "setImageProvider:", v13);
  }

  return v15;
}

+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v6;
  CLKGaugeProvider *v7;
  void *v8;

  v6 = imageProvider;
  v7 = gaugeProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:imageProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCornerGaugeImage *)v8;
}

+ (CLKComplicationTemplateGraphicCornerGaugeImage)templateWithGaugeProvider:(CLKGaugeProvider *)gaugeProvider leadingTextProvider:(CLKTextProvider *)leadingTextProvider trailingTextProvider:(CLKTextProvider *)trailingTextProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v10;
  CLKTextProvider *v11;
  CLKTextProvider *v12;
  CLKGaugeProvider *v13;
  void *v14;

  v10 = imageProvider;
  v11 = trailingTextProvider;
  v12 = leadingTextProvider;
  v13 = gaugeProvider;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGaugeProvider:leadingTextProvider:trailingTextProvider:imageProvider:", v13, v12, v11, v10);

  return (CLKComplicationTemplateGraphicCornerGaugeImage *)v14;
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
    v3[2](v3, CFSTR("trailingTextProvider"), 1, 1, &v4);

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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion = objc_msgSend(v6, "version");

    __96__CLKComplicationTemplateGraphicCornerGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock);
  v14 = *(double *)&qword_254AB8508;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __96__CLKComplicationTemplateGraphicCornerGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 16.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize = v2;
  objc_msgSend(v5, "scaledValue:", 20.0);
  qword_254AB8508 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:", 20.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter = v4;

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

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
