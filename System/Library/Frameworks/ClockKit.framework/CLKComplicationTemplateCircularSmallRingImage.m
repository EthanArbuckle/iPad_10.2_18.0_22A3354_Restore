@implementation CLKComplicationTemplateCircularSmallRingImage

- (CLKComplicationTemplateCircularSmallRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKImageProvider *v8;
  CLKComplicationTemplateCircularSmallRingImage *v9;
  CLKComplicationTemplateCircularSmallRingImage *v10;
  double v11;
  objc_super v13;

  v8 = imageProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateCircularSmallRingImage;
  v9 = -[CLKComplicationTemplate initPrivate](&v13, sel_initPrivate);
  v10 = v9;
  if (v9)
  {
    -[CLKComplicationTemplateCircularSmallRingImage setImageProvider:](v9, "setImageProvider:", v8);
    *(float *)&v11 = fillFraction;
    -[CLKComplicationTemplateCircularSmallRingImage setFillFraction:](v10, "setFillFraction:", v11);
    -[CLKComplicationTemplateCircularSmallRingImage setRingStyle:](v10, "setRingStyle:", ringStyle);
  }

  return v10;
}

+ (CLKComplicationTemplateCircularSmallRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKImageProvider *v8;
  id v9;
  double v10;
  void *v11;

  v8 = imageProvider;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = fillFraction;
  v11 = (void *)objc_msgSend(v9, "initWithImageProvider:fillFraction:ringStyle:", v8, ringStyle, v10);

  return (CLKComplicationTemplateCircularSmallRingImage *)v11;
}

- (int64_t)compatibleFamily
{
  return 4;
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
  objc_msgSend((id)objc_opt_class(), "_imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 0, 1, 0, 4, 1, &v9, v7, v8, v5, v6);

}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, _QWORD, char *))a3 + 2))(a3, CFSTR("fillFraction"), 1, 0, &v3);
}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("ringStyle"), 1, &__block_literal_global_673, &v3);
}

BOOL __80__CLKComplicationTemplateCircularSmallRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  _SquareImageSizeScaled(0, 1, a5, a3, a4, 22.0);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 80);
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)fillFraction
{
  self->_fillFraction = fillFraction;
}

- (CLKComplicationRingStyle)ringStyle
{
  return self->_ringStyle;
}

- (void)setRingStyle:(CLKComplicationRingStyle)ringStyle
{
  self->_ringStyle = ringStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
