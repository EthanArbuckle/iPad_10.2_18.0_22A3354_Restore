@implementation CLKComplicationTemplateGraphicCornerCircularImage

- (CLKComplicationTemplateGraphicCornerCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  CLKComplicationTemplateGraphicCornerCircularImage *v5;
  CLKComplicationTemplateGraphicCornerCircularImage *v6;
  objc_super v8;

  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicCornerCircularImage;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateGraphicCornerCircularImage setImageProvider:](v5, "setImageProvider:", v4);

  return v6;
}

+ (CLKComplicationTemplateGraphicCornerCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  void *v5;

  v4 = imageProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:", v4);

  return (CLKComplicationTemplateGraphicCornerCircularImage *)v5;
}

- (int64_t)compatibleFamily
{
  return 8;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_891);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_892);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_892);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_892, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_893 = objc_msgSend(v6, "version");

    __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_893;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_891);
  v14 = *(double *)&qword_254AB8568;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_889[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_890);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "scaledValue:", 19.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_890 = v3;
  qword_254AB8568 = __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(v2, v4);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_889 = __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);

}

double __99__CLKComplicationTemplateGraphicCornerCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = &unk_24CC16DC8;
  v8[1] = &unk_24CC16DE0;
  v9[0] = &unk_24CC179A8;
  v9[1] = &unk_24CC17A28;
  v8[2] = &unk_24CC16DF8;
  v8[3] = &unk_24CC16E10;
  v9[2] = &unk_24CC17A38;
  v9[3] = &unk_24CC17A28;
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 36.0);
  v6 = v5;

  return v6;
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
