@implementation CLKComplicationTemplateGraphicRectangularLargeText

- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4
{
  return -[CLKComplicationTemplateGraphicRectangularLargeText initWithHeaderImageProvider:headerTextProvider:bodyTextProvider:](self, "initWithHeaderImageProvider:headerTextProvider:bodyTextProvider:", 0, a3, a4);
}

- (CLKComplicationTemplateGraphicRectangularLargeText)initWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLKComplicationTemplateGraphicRectangularLargeText *v11;
  CLKComplicationTemplateGraphicRectangularLargeText *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateGraphicRectangularLargeText;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKComplicationTemplateGraphicRectangularLargeText setHeaderImageProvider:](v11, "setHeaderImageProvider:", v8);
    -[CLKComplicationTemplateGraphicRectangularLargeText setHeaderTextProvider:](v12, "setHeaderTextProvider:", v9);
    -[CLKComplicationTemplateGraphicRectangularLargeText setBodyTextProvider:](v12, "setBodyTextProvider:", v10);
  }

  return v12;
}

+ (id)templateWithHeaderTextProvider:(id)a3 bodyTextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderTextProvider:bodyTextProvider:", v7, v6);

  return v8;
}

+ (id)templateWithHeaderImageProvider:(id)a3 headerTextProvider:(id)a4 bodyTextProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHeaderImageProvider:headerTextProvider:bodyTextProvider:", v10, v9, v8);

  return v11;
}

- (int64_t)compatibleFamily
{
  return 11;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD, uint64_t, char *);
  char v4;

  v3 = (void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("headerTextProvider"), 0, 1, &v4);
  if (!v4)
    v3[2](v3, CFSTR("bodyTextProvider"), 0, 1, &v4);

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

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1129);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1130);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1130);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_1130, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1131 = objc_msgSend(v6, "version");

    __100__CLKComplicationTemplateGraphicRectangularLargeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_1131;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_1129);
  v14 = *(double *)&qword_254AB8830;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1127[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_1128);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("headerImageProvider"), 1, 1, v16, 6, &v17, v15, v15, v14, v14, 0.0);

}

void __100__CLKComplicationTemplateGraphicRectangularLargeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 12.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_1128 = v2;
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  qword_254AB8830 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:withOverride:forSizeClass:", 3, 12.0, 13.5);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_1127 = v4;

}

- (CLKFullColorImageProvider)headerImageProvider
{
  return self->_headerImageProvider;
}

- (void)setHeaderImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKTextProvider)headerTextProvider
{
  return self->_headerTextProvider;
}

- (void)setHeaderTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)bodyTextProvider
{
  return self->_bodyTextProvider;
}

- (void)setBodyTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextProvider, 0);
  objc_storeStrong((id *)&self->_headerTextProvider, 0);
  objc_storeStrong((id *)&self->_headerImageProvider, 0);
}

@end
