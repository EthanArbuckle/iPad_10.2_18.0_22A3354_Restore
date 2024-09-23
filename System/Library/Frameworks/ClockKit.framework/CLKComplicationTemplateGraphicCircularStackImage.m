@implementation CLKComplicationTemplateGraphicCircularStackImage

- (CLKComplicationTemplateGraphicCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKFullColorImageProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicCircularStackImage *v8;
  CLKComplicationTemplateGraphicCircularStackImage *v9;
  objc_super v11;

  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCircularStackImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicCircularStackImage setLine1ImageProvider:](v8, "setLine1ImageProvider:", v6);
    -[CLKComplicationTemplateGraphicCircularStackImage setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKFullColorImageProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1ImageProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCircularStackImage *)v8;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1016);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1017);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1017);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1017, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1018 = objc_msgSend(v6, "version");

    __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1018;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1016);
  v14 = *(double *)&qword_254AB86C0;
  v15 = unk_254AB86C8;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___imageSize[2
                                                                 * -[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = *(double *)v16;
  v18 = *((double *)v16 + 1);
  v19 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, char *, double, double, double, double, double))v4
   + 2))(v4, CFSTR("line1ImageProvider"), 0, 1, 0, 4, &v19, v17, v18, v14, v15, 0.0);

}

void __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  qword_254AB86C0 = __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2((uint64_t)v4, v4);
  unk_254AB86C8 = v2;
  _enumerateFullColorImageProviderKeysWithBlock___imageSize = __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);
  *(_QWORD *)algn_254AB86B8 = v3;

}

double __98__CLKComplicationTemplateGraphicCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "scaledValue:", 28.0);
  v4 = v3;
  v7 = &unk_24CC16DB0;
  v8[0] = &unk_24CC17938;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 14.0);

  return v4;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("line2TextProvider"), 0, 1, &v3);
}

- (CLKFullColorImageProvider)line1ImageProvider
{
  return self->_line1ImageProvider;
}

- (void)setLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, line1ImageProvider, 72);
}

- (CLKTextProvider)line2TextProvider
{
  return self->_line2TextProvider;
}

- (void)setLine2TextProvider:(CLKTextProvider *)line2TextProvider
{
  objc_setProperty_nonatomic_copy(self, a2, line2TextProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);
  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end
