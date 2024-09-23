@implementation CLKComplicationTemplateUtilitarianSmallFlat

- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider
{
  return -[CLKComplicationTemplateUtilitarianSmallFlat initWithTextProvider:imageProvider:](self, "initWithTextProvider:imageProvider:", textProvider, 0);
}

- (CLKComplicationTemplateUtilitarianSmallFlat)initWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  CLKTextProvider *v6;
  CLKImageProvider *v7;
  CLKComplicationTemplateUtilitarianSmallFlat *v8;
  CLKComplicationTemplateUtilitarianSmallFlat *v9;
  objc_super v11;

  v6 = textProvider;
  v7 = imageProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateUtilitarianSmallFlat;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateUtilitarianSmallFlat setTextProvider:](v8, "setTextProvider:", v6);
    -[CLKComplicationTemplateUtilitarianSmallFlat setImageProvider:](v9, "setImageProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider
{
  CLKTextProvider *v4;
  void *v5;

  v4 = textProvider;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:", v4);

  return (CLKComplicationTemplateUtilitarianSmallFlat *)v5;
}

+ (CLKComplicationTemplateUtilitarianSmallFlat)templateWithTextProvider:(CLKTextProvider *)textProvider imageProvider:(CLKImageProvider *)imageProvider
{
  CLKImageProvider *v6;
  CLKTextProvider *v7;
  void *v8;

  v6 = imageProvider;
  v7 = textProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextProvider:imageProvider:", v7, v6);

  return (CLKComplicationTemplateUtilitarianSmallFlat *)v8;
}

- (BOOL)isCompatibleWithFamily:(int64_t)a3
{
  BOOL result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationTemplateUtilitarianSmallFlat;
  result = -[CLKComplicationTemplate isCompatibleWithFamily:](&v5, sel_isCompatibleWithFamily_);
  if (a3 == 6)
    return 1;
  return result;
}

- (int64_t)compatibleFamily
{
  return 2;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 1, &v3);
}

- (void)_enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  char v9;

  v9 = 0;
  v8 = 0uLL;
  v7 = 0uLL;
  v4 = a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UtilitarianFlatImageSizeForDevice(v6, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"), &v8, &v7);

  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("imageProvider"), 1, 1, 0, 4, 0, &v9, *(double *)&v8, *((double *)&v8 + 1), *(double *)&v7, *((double *)&v7 + 1));

}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
  objc_setProperty_nonatomic_copy(self, a2, textProvider, 72);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(CLKImageProvider *)imageProvider
{
  objc_setProperty_nonatomic_copy(self, a2, imageProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
