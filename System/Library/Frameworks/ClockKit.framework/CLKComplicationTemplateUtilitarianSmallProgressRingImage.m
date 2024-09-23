@implementation CLKComplicationTemplateUtilitarianSmallProgressRingImage

- (CLKComplicationTemplateUtilitarianSmallProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8;
  id v9;
  CLKComplicationTemplateUtilitarianSmallProgressRingImage *v10;
  CLKComplicationTemplateUtilitarianSmallProgressRingImage *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateUtilitarianSmallProgressRingImage;
  v10 = -[CLKComplicationTemplate initPrivate](&v13, sel_initPrivate);
  v11 = v10;
  if (v10)
  {
    -[CLKComplicationTemplateUtilitarianSmallProgressRingImage setImageProvider:](v10, "setImageProvider:", v8);
    -[CLKComplicationTemplateUtilitarianSmallProgressRingImage setProgressProvider:](v11, "setProgressProvider:", v9);
    -[CLKComplicationTemplateUtilitarianSmallProgressRingImage setRingStyle:](v11, "setRingStyle:", a5);
  }

  return v11;
}

+ (id)templateWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:progressProvider:ringStyle:", v9, v8, a5);

  return v10;
}

- (int64_t)compatibleFamily
{
  return 2;
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v12[0] = &unk_24CC16D98;
  v12[1] = &unk_24CC16DB0;
  v13[0] = &unk_24CC17928;
  v13[1] = &unk_24CC17938;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SquareImageSizeScaled(v6, 1, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), &v9, &v7, 14.0);

  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, char *, double, double, double, double))v5
   + 2))(v5, CFSTR("imageProvider"), 0, 1, 0, 4, 1, &v11, v9, v10, v7, v8);

}

- (void)_enumerateProgressProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("progressProvider"), 0, 1, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("ringStyle"), 1, &__block_literal_global_650, &v3);
}

BOOL __91__CLKComplicationTemplateUtilitarianSmallProgressRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKProgressProvider)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(int64_t)a3
{
  self->_ringStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
