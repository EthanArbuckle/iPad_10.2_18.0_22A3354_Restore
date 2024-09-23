@implementation CLKComplicationTemplateModularSmallProgressRingImage

- (CLKComplicationTemplateModularSmallProgressRingImage)initWithImageProvider:(id)a3 progressProvider:(id)a4 ringStyle:(int64_t)a5
{
  id v8;
  id v9;
  CLKComplicationTemplateModularSmallProgressRingImage *v10;
  CLKComplicationTemplateModularSmallProgressRingImage *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateModularSmallProgressRingImage;
  v10 = -[CLKComplicationTemplate initPrivate](&v13, sel_initPrivate);
  v11 = v10;
  if (v10)
  {
    -[CLKComplicationTemplateModularSmallProgressRingImage setImageProvider:](v10, "setImageProvider:", v8);
    -[CLKComplicationTemplateModularSmallProgressRingImage setProgressProvider:](v11, "setProgressProvider:", v9);
    -[CLKComplicationTemplateModularSmallProgressRingImage setRingStyle:](v11, "setRingStyle:", a5);
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
  return 0;
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;

  v9 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 0, 1, 0, 4, 1, &v9, v7, v8, v5, v6);

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
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("ringStyle"), 1, &__block_literal_global_458, &v3);
}

BOOL __87__CLKComplicationTemplateModularSmallProgressRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = &unk_24CC16D98;
  v10[0] = &unk_24CC178E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 19.0);

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
