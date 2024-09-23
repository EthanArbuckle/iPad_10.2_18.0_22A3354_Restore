@implementation CLKComplicationTemplateGraphicCornerTextImage

- (CLKComplicationTemplateGraphicCornerTextImage)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKTextProvider *v6;
  CLKFullColorImageProvider *v7;
  CLKComplicationTemplateGraphicCornerTextImage *v8;
  CLKComplicationTemplateGraphicCornerTextImage *v9;
  objc_super v11;

  v6 = textProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicCornerTextImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicCornerTextImage setTextProvider:](v8, "setTextProvider:", v6);
    -[CLKComplicationTemplateGraphicCornerTextImage setImageProvider:](v9, "setImageProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicCornerTextImage)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKFullColorImageProvider *)imageProvider
{
  CLKFullColorImageProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:imageProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicCornerTextImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_869);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_870);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_870);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_870, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_871 = objc_msgSend(v6, "version");

    __95__CLKComplicationTemplateGraphicCornerTextImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_871;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_869);
  v14 = *(double *)&qword_254AB8538;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_867[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_868);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("imageProvider"), 0, 1, v16, 4, &v17, v15, v15, v14, v14, v14 * 0.5);

}

void __95__CLKComplicationTemplateGraphicCornerTextImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 13.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_868 = v2;
  objc_msgSend(v5, "scaledValue:", 20.0);
  qword_254AB8538 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:", 20.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_867 = v4;

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

@end
