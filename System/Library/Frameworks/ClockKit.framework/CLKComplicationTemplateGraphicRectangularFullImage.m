@implementation CLKComplicationTemplateGraphicRectangularFullImage

- (CLKComplicationTemplateGraphicRectangularFullImage)initWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  CLKComplicationTemplateGraphicRectangularFullImage *v5;
  CLKComplicationTemplateGraphicRectangularFullImage *v6;
  objc_super v8;

  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateGraphicRectangularFullImage;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateGraphicRectangularFullImage setImageProvider:](v5, "setImageProvider:", v4);

  return v6;
}

+ (CLKComplicationTemplateGraphicRectangularFullImage)templateWithImageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v4;
  void *v5;

  v4 = imageProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:", v4);

  return (CLKComplicationTemplateGraphicRectangularFullImage *)v5;
}

- (int64_t)compatibleFamily
{
  return 11;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1084);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1085);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1085);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1085, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1086 = objc_msgSend(v6, "version");

    __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1086;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1084);
  v14 = *(double *)&qword_254AB8768;
  v15 = unk_254AB8770;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize_1083[2
                                                                      * -[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = *(double *)v16;
  v18 = *((double *)v16 + 1);
  v19 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 0, 1, 0, 4, &v19, v17, v18, v14, v15, 4.0);

}

void __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  qword_254AB8768 = __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v4, v4);
  unk_254AB8770 = v2;
  _enumerateFullColorImageProviderKeysWithBlock___imageSize_1083 = __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);
  unk_254AB8760 = v3;

}

double __100__CLKComplicationTemplateGraphicRectangularFullImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;

  v2 = a2;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 162.0, 184.0);
  v4 = v3;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 69.0, 78.0);

  return v4;
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
