@implementation CLKComplicationTemplateGraphicExtraLargeCircularStackImage

- (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)initWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKFullColorImageProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicExtraLargeCircularStackImage *v8;
  CLKComplicationTemplateGraphicExtraLargeCircularStackImage *v9;
  objc_super v11;

  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicExtraLargeCircularStackImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicExtraLargeCircularStackImage setLine1ImageProvider:](v8, "setLine1ImageProvider:", v6);
    -[CLKComplicationTemplateGraphicExtraLargeCircularStackImage setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicExtraLargeCircularStackImage)templateWithLine1ImageProvider:(CLKFullColorImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKFullColorImageProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1ImageProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicExtraLargeCircularStackImage *)v8;
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
  uint64_t *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char v21;

  v4 = (void (**)(id, const __CFString *, _QWORD, uint64_t, void *, uint64_t, char *, double, double, double, double, double))a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1203);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1204);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1204);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1204, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1205 = objc_msgSend(v6, "version");

    __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1205;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1203);
  v14 = *(double *)&qword_254AB8980;
  v15 = unk_254AB8988;
  v16 = &_enumerateFullColorImageProviderKeysWithBlock___maxImageSize[2
                                                                    * -[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = *(double *)v16;
  v18 = *((double *)v16 + 1);
  v21 = 0;
  *(float *)&v19 = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("line1ImageProvider"), 0, 1, v20, 4, &v21, v17, v18, v14, v15, 0.0);

}

void __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = a2;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2;
  v10[3] = &__block_descriptor_40_e36__CGSize_dd_16__0__CLKDeviceMetrics_8l;
  *(double *)&v10[4] = v6;
  v7 = (double (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](v10);
  qword_254AB8980 = ((double (**)(_QWORD, void *))v7)[2](v7, v5);
  unk_254AB8988 = v8;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  _enumerateFullColorImageProviderKeysWithBlock___maxImageSize = ((double (**)(_QWORD, void *))v7)[2](v7, v5);
  *(_QWORD *)algn_254AB8978 = v9;

}

uint64_t __108__CLKComplicationTemplateGraphicExtraLargeCircularStackImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scaledSize:withOverride:forSizeClass:", 3, *(double *)(a1 + 32) * 28.0, *(double *)(a1 + 32) * 14.0, *(double *)(a1 + 32) * 31.0, *(double *)(a1 + 32) * 16.0);
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
