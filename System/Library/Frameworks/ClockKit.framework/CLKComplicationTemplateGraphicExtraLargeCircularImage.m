@implementation CLKComplicationTemplateGraphicExtraLargeCircularImage

- (CLKComplicationTemplateGraphicExtraLargeCircularImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  CLKComplicationTemplateGraphicExtraLargeCircularImage *v5;
  CLKComplicationTemplateGraphicExtraLargeCircularImage *v6;
  objc_super v8;

  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularImage;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateGraphicExtraLargeCircularImage setImageProvider:](v5, "setImageProvider:", v4);

  return v6;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  void *v5;

  v4 = imageProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:", v4);

  return (CLKComplicationTemplateGraphicExtraLargeCircularImage *)v5;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1164);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1165);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1165);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1165, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1166 = objc_msgSend(v6, "version");

    __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1166;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1164);
  v14 = *(double *)&qword_254AB88E8;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1162[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1163);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  id v5;
  double (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  double v13;

  v2 = a2;
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v11 = &unk_24CBF9C60;
  v12 = v2;
  v13 = v4;
  v5 = v2;
  v6 = (double (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](&v8);
  objc_msgSend(v3, "scaledValue:", 24.0, v8, v9, v10, v11);
  CLKRoundForDevice(v5);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1163 = v7;
  qword_254AB88E8 = ((double (**)(_QWORD, void *))v6)[2](v6, v3);
  objc_msgSend(v3, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1162 = ((double (**)(_QWORD, void *))v6)[2](v6, v3);

}

double __103__CLKComplicationTemplateGraphicExtraLargeCircularImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = getCDCircularMediumComplicationDiameterSymbolLoc_ptr;
  v14 = getCDCircularMediumComplicationDiameterSymbolLoc_ptr;
  if (!getCDCircularMediumComplicationDiameterSymbolLoc_ptr)
  {
    v6 = (void *)ComplicationDisplayLibrary();
    v5 = dlsym(v6, "CDCircularMediumComplicationDiameter");
    v12[3] = (uint64_t)v5;
    getCDCircularMediumComplicationDiameterSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v11, 8);
  if (!v5)
  {
    v10 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  ((void (*)(id))v5)(v4);

  CLKRoundForDevice(*(void **)(a1 + 32));
  v8 = v7;

  return v8;
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
