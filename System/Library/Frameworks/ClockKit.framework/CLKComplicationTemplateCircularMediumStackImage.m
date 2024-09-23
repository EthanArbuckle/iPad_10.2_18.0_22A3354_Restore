@implementation CLKComplicationTemplateCircularMediumStackImage

- (int64_t)compatibleFamily
{
  return 105;
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

  os_unfair_lock_lock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock_700);
  WeakRetained = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_701);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_701);
    if (obj == v11)
    {
      v12 = objc_msgSend(obj, "version");
      v13 = _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion_702;

      if (v12 == v13)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v14 = objc_storeWeak(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_701, obj);
  _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion_702 = objc_msgSend(obj, "version");

  __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(v15, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock_700);
  if (a4)
    *a4 = (CGSize)xmmword_254AB84D8;
  if (a3)
    *a3 = *(CGSize *)&_imageSDKSize_deviceSize_forSDKVersion___imageSize_699[2 * a5];

}

void __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&xmmword_254AB84D8 = __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2((uint64_t)v4, v4);
  *((_QWORD *)&xmmword_254AB84D8 + 1) = v2;
  _imageSDKSize_deviceSize_forSDKVersion___imageSize_699 = __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(objc_msgSend(v4, "setNewestAllowedSizeClass:", &unk_24CC16DB0), v4);
  unk_254AB84D0 = v3;

}

double __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 28.0, 24.0);
  v4 = v3;
  v7[0] = &unk_24CC16D98;
  v7[1] = &unk_24CC16DB0;
  v8[0] = &unk_24CC179B8;
  v8[1] = &unk_24CC17938;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 14.0);

  return v4;
}

@end
