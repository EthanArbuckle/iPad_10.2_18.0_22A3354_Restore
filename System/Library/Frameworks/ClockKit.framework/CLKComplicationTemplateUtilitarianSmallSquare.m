@implementation CLKComplicationTemplateUtilitarianSmallSquare

- (CLKComplicationTemplateUtilitarianSmallSquare)initWithImageProvider:(CLKImageProvider *)imageProvider
{
  CLKImageProvider *v4;
  CLKComplicationTemplateUtilitarianSmallSquare *v5;
  CLKComplicationTemplateUtilitarianSmallSquare *v6;
  objc_super v8;

  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateUtilitarianSmallSquare;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateUtilitarianSmallSquare setImageProvider:](v5, "setImageProvider:", v4);

  return v6;
}

+ (CLKComplicationTemplateUtilitarianSmallSquare)templateWithImageProvider:(CLKImageProvider *)imageProvider
{
  CLKImageProvider *v4;
  void *v5;

  v4 = imageProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:", v4);

  return (CLKComplicationTemplateUtilitarianSmallSquare *)v5;
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
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v12 = &unk_24CC16DB0;
  v13[0] = &unk_24CC17918;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SquareImageSizeScaled(v6, 1, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), &v9, &v7, 22.0);

  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v5
   + 2))(v5, CFSTR("imageProvider"), 0, 1, 0, 4, 0, &v11, v9, v10, v7, v8);

}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
