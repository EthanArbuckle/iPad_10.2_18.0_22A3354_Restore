@implementation CLKComplicationTemplateGraphicRectangularLargeImage

- (CLKComplicationTemplateGraphicRectangularLargeImage)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKTextProvider *v6;
  CLKFullColorImageProvider *v7;
  CLKComplicationTemplateGraphicRectangularLargeImage *v8;
  CLKComplicationTemplateGraphicRectangularLargeImage *v9;
  objc_super v11;

  v6 = textProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicRectangularLargeImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicRectangularLargeImage setTextProvider:](v8, "setTextProvider:", v6);
    -[CLKComplicationTemplateGraphicRectangularLargeImage setImageProvider:](v9, "setImageProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicRectangularLargeImage)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:imageProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicRectangularLargeImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  id v4;
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
  uint64_t *v16;
  double v17;
  double v18;
  char v19;

  v4 = a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1093);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1094);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1094);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1094, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1095 = objc_msgSend(v6, "version");

    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1095;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1093);
  v14 = *(double *)&qword_254AB87A0;
  v15 = unk_254AB87A8;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize_1092[2
                                                                      * -[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = *(double *)v16;
  v18 = *((double *)v16 + 1);
  v19 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 0, 1, 0, 4, &v19, v17, v18, v14, v15, 4.0);

}

void __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = a2;
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v2, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  qword_254AB87A0 = __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v7, v2);
  unk_254AB87A8 = v3;
  v4 = __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(objc_msgSend(v7, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v2);
  v6 = v5;

  _enumerateFullColorImageProviderKeysWithBlock___imageSize_1092 = *(_QWORD *)&v4;
  *(_QWORD *)algn_254AB8798 = v6;

}

double __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v2 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr;
  v18 = getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr)
  {
    v4 = (void *)ComplicationDisplayLibrary();
    v3 = dlsym(v4, "CDGraphicLargeRectangularComplicationSize");
    v16[3] = (uint64_t)v3;
    getCDGraphicLargeRectangularComplicationSizeSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v15, 8);
  if (!v3)
  {
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
LABEL_12:
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    goto LABEL_13;
  }
  v5 = ((double (*)(id))v3)(v2);

  v6 = v2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr;
  v18 = getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr)
  {
    v8 = (void *)ComplicationDisplayLibrary();
    v7 = dlsym(v8, "CDGraphicLargeRectangularComplicationInset");
    v16[3] = (uint64_t)v7;
    getCDGraphicLargeRectangularComplicationInsetSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
    goto LABEL_12;
  v9 = ((double (*)(id))v7)(v6);

  v10 = v6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v11 = getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr;
  v18 = getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr;
  if (!getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr)
  {
    v12 = (void *)ComplicationDisplayLibrary();
    v11 = dlsym(v12, "CDGraphicLargeRectangularComplicationLargeImageHeight");
    v16[3] = (uint64_t)v11;
    getCDGraphicLargeRectangularComplicationLargeImageHeightSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v15, 8);
  if (!v11)
  {
LABEL_13:
    v14 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  ((void (*)(id))v11)(v10);

  return v5 + v9 * -2.0;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
  objc_setProperty_nonatomic_copy(self, a2, textProvider, 72);
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
  objc_storeStrong((id *)&self->_textProvider, 0);
}

uint64_t __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1()
{
  dlerror();
  abort_report_np();
  return __get_ClientRendererClass_block_invoke_cold_1();
}

@end
