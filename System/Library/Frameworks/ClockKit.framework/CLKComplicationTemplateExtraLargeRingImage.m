@implementation CLKComplicationTemplateExtraLargeRingImage

- (CLKComplicationTemplateExtraLargeRingImage)initWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKImageProvider *v8;
  CLKComplicationTemplateExtraLargeRingImage *v9;
  CLKComplicationTemplateExtraLargeRingImage *v10;
  double v11;
  objc_super v13;

  v8 = imageProvider;
  v13.receiver = self;
  v13.super_class = (Class)CLKComplicationTemplateExtraLargeRingImage;
  v9 = -[CLKComplicationTemplate initPrivate](&v13, sel_initPrivate);
  v10 = v9;
  if (v9)
  {
    -[CLKComplicationTemplateExtraLargeRingImage setImageProvider:](v9, "setImageProvider:", v8);
    *(float *)&v11 = fillFraction;
    -[CLKComplicationTemplateExtraLargeRingImage setFillFraction:](v10, "setFillFraction:", v11);
    -[CLKComplicationTemplateExtraLargeRingImage setRingStyle:](v10, "setRingStyle:", ringStyle);
  }

  return v10;
}

+ (CLKComplicationTemplateExtraLargeRingImage)templateWithImageProvider:(CLKImageProvider *)imageProvider fillFraction:(float)fillFraction ringStyle:(CLKComplicationRingStyle)ringStyle
{
  CLKImageProvider *v8;
  id v9;
  double v10;
  void *v11;

  v8 = imageProvider;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = fillFraction;
  v11 = (void *)objc_msgSend(v9, "initWithImageProvider:fillFraction:ringStyle:", v8, ringStyle, v10);

  return (CLKComplicationTemplateExtraLargeRingImage *)v11;
}

- (int64_t)compatibleFamily
{
  return 7;
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
  v12[0] = &unk_24CC16D98;
  v12[1] = &unk_24CC16DB0;
  v13[0] = &unk_24CC179E8;
  v13[1] = &unk_24CC179F8;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  _SquareImageSizeScaled(v6, 1, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), &v9, &v7, 66.5);
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, char *, double, double, double, double))v5
   + 2))(v5, CFSTR("imageProvider"), 0, 1, 0, 4, 1, &v11, v9, v10, v7, v8);

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
  (*((void (**)(id, const __CFString *, uint64_t, void *, char *))a3 + 2))(a3, CFSTR("ringStyle"), 1, &__block_literal_global_724, &v3);
}

BOOL __77__CLKComplicationTemplateExtraLargeRingImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidComplicationRingStyle(a2);
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
