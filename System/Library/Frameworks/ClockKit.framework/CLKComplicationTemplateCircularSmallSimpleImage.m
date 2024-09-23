@implementation CLKComplicationTemplateCircularSmallSimpleImage

- (CLKComplicationTemplateCircularSmallSimpleImage)initWithImageProvider:(CLKImageProvider *)imageProvider
{
  CLKImageProvider *v4;
  CLKComplicationTemplateCircularSmallSimpleImage *v5;
  CLKComplicationTemplateCircularSmallSimpleImage *v6;
  objc_super v8;

  v4 = imageProvider;
  v8.receiver = self;
  v8.super_class = (Class)CLKComplicationTemplateCircularSmallSimpleImage;
  v5 = -[CLKComplicationTemplate initPrivate](&v8, sel_initPrivate);
  v6 = v5;
  if (v5)
    -[CLKComplicationTemplateCircularSmallSimpleImage setImageProvider:](v5, "setImageProvider:", v4);

  return v6;
}

+ (CLKComplicationTemplateCircularSmallSimpleImage)templateWithImageProvider:(CLKImageProvider *)imageProvider
{
  CLKImageProvider *v4;
  void *v5;

  v4 = imageProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageProvider:", v4);

  return (CLKComplicationTemplateCircularSmallSimpleImage *)v5;
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
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = &unk_24CC16D98;
  v10[0] = &unk_24CC17938;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SquareImageSizeScaled(v8, 1, a5, a3, a4, 18.0);

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
