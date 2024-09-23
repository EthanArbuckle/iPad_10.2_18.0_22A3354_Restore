@implementation CLKComplicationTemplateModularSmallStackImage

- (CLKComplicationTemplateModularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKImageProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateModularSmallStackImage *v8;
  CLKComplicationTemplateModularSmallStackImage *v9;
  objc_super v11;

  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateModularSmallStackImage setLine1ImageProvider:](v8, "setLine1ImageProvider:", v6);
    -[CLKComplicationTemplateModularSmallStackImage setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateModularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKImageProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1ImageProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateModularSmallStackImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 0;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("line2TextProvider"), 0, 1, &v3);
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
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("line1ImageProvider"), 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

- (void)_enumerateIntegerKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, void *, char *))a3 + 2))(a3, CFSTR("highlightMode"), 0, &__block_literal_global_366, &v3);
}

BOOL __80__CLKComplicationTemplateModularSmallStackImage__enumerateIntegerKeysWithBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return CLKIsValidForegroundHighlightMode(a2);
}

- (void)setHighlightLine2:(BOOL)highlightLine2
{
  -[CLKComplicationTemplateModularSmallStackImage setHighlightMode:](self, "setHighlightMode:", highlightLine2);
}

- (BOOL)highlightLine2
{
  return -[CLKComplicationTemplateModularSmallStackImage highlightMode](self, "highlightMode") != 0;
}

- (id)initPrivateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  v7 = -[CLKComplicationTemplate initPrivateWithJSONObjectRepresentation:bundle:](&v10, sel_initPrivateWithJSONObjectRepresentation_bundle_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highlightLine2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("highlightLine2"), v8);
      objc_msgSend(v7, "setHighlightLine2:", objc_msgSend(v8, "BOOLValue"));
    }

  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateModularSmallStackImage;
  -[CLKComplicationTemplate JSONObjectRepresentationWritingResourcesToBundlePath:purpose:](&v7, sel_JSONObjectRepresentationWritingResourcesToBundlePath_purpose_, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CLKComplicationTemplateModularSmallStackImage highlightLine2](self, "highlightLine2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("highlightLine2"));

  return v4;
}

+ (void)imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  id v14;

  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v9, 2);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    a4->width = __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(v10, v14);
    a4->height = v11;
  }
  if (a3)
  {
    v12 = v14;
    if (!a5)
    {
      v10 = objc_msgSend(v14, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
      v12 = v14;
    }
    a3->width = __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(v10, v12);
    a3->height = v13;
  }

}

double __87__CLKComplicationTemplateModularSmallStackImage_imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24CC16D98;
  v2 = (void *)MEMORY[0x24BDD1968];
  v3 = a2;
  objc_msgSend(v2, "valueWithCGSize:", 26.0, 14.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = &unk_24CC16DB0;
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 32.0, 17.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledSize:withOverrides:", v6, 29.0, 15.0);
  v8 = v7;

  return v8;
}

- (CLKImageProvider)line1ImageProvider
{
  return self->_line1ImageProvider;
}

- (void)setLine1ImageProvider:(CLKImageProvider *)line1ImageProvider
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

- (unint64_t)highlightMode
{
  return self->_highlightMode;
}

- (void)setHighlightMode:(unint64_t)a3
{
  self->_highlightMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);
  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end
