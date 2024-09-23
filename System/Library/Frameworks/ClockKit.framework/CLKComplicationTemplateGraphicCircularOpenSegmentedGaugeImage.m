@implementation CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage

- (int64_t)compatibleFamily
{
  return 10;
}

- (CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage)initWithImageProvider:(id)a3 gaugeProvider:(id)a4 textProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage;
  v12 = -[CLKComplicationTemplate initPrivate](&v15, sel_initPrivate);
  v13 = (CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 9, a4);
    objc_storeStrong((id *)&v13->_textProvider, a5);
    objc_storeStrong((id *)&v13->_imageProvider, a3);
  }

  return v13;
}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1038);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1039);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1039);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1039, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1040 = objc_msgSend(v6, "version");

    __111__CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1040;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1038);
  v14 = *(double *)&qword_254AB8720;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1036[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1037);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 1, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __111__CLKComplicationTemplateGraphicCircularOpenSegmentedGaugeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 19.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1037 = v2;
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 34.0, 38.0);
  qword_254AB8720 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 34.0, 38.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1036 = v4;

}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 1, 1, &v3);
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
