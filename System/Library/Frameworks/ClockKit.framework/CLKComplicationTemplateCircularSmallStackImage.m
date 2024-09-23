@implementation CLKComplicationTemplateCircularSmallStackImage

- (CLKComplicationTemplateCircularSmallStackImage)initWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKImageProvider *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateCircularSmallStackImage *v8;
  CLKComplicationTemplateCircularSmallStackImage *v9;
  objc_super v11;

  v6 = line1ImageProvider;
  v7 = line2TextProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateCircularSmallStackImage;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateCircularSmallStackImage setLine1ImageProvider:](v8, "setLine1ImageProvider:", v6);
    -[CLKComplicationTemplateCircularSmallStackImage setLine2TextProvider:](v9, "setLine2TextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateCircularSmallStackImage)templateWithLine1ImageProvider:(CLKImageProvider *)line1ImageProvider line2TextProvider:(CLKTextProvider *)line2TextProvider
{
  CLKTextProvider *v6;
  CLKImageProvider *v7;
  void *v8;

  v6 = line2TextProvider;
  v7 = line1ImageProvider;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLine1ImageProvider:line2TextProvider:", v7, v6);

  return (CLKComplicationTemplateCircularSmallStackImage *)v8;
}

- (int64_t)compatibleFamily
{
  return 4;
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
  objc_msgSend((id)objc_opt_class(), "_imageSDKSize:deviceSize:forSDKVersion:", &v7, &v5, -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, char *, double, double, double, double))v4
   + 2))(v4, CFSTR("line1ImageProvider"), 0, 1, 0, 4, 0, &v9, v7, v8, v5, v6);

}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id obj;

  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  obj = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock);
  WeakRetained = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice);
    if (obj == v11)
    {
      v12 = objc_msgSend(obj, "version");
      v13 = _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion;

      if (v12 == v13)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v14 = objc_storeWeak(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice, obj);
  _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion = objc_msgSend(obj, "version");

  __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(v15, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock);
  if (a4)
    *a4 = (CGSize)xmmword_254AB84A0;
  if (a3)
    *a3 = *(CGSize *)&_imageSDKSize_deviceSize_forSDKVersion___imageSize[2 * a5];

}

void __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&xmmword_254AB84A0 = __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2((uint64_t)v4, v4);
  *((_QWORD *)&xmmword_254AB84A0 + 1) = v2;
  _imageSDKSize_deviceSize_forSDKVersion___imageSize = __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);
  *(_QWORD *)algn_254AB8498 = v3;

}

double __89__CLKComplicationTemplateCircularSmallStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = &unk_24CC16D98;
  v8[1] = &unk_24CC16DB0;
  v9[0] = &unk_24CC17938;
  v9[1] = &unk_24CC17968;
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 17.0);
  v6 = v5;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 8.0, 7.0);
  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextProvider, 0);
  objc_storeStrong((id *)&self->_line1ImageProvider, 0);
}

@end
