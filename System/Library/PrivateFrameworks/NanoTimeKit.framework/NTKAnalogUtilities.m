@implementation NTKAnalogUtilities

+ (CGSize)sceneSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  CLKSceneSizeForDevice();
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)dialSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  +[NTKAnalogUtilities dialDiameterForDevice:](NTKAnalogUtilities, "dialDiameterForDevice:", a3);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)dialDiameterForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dialDiameterForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&dialDiameterForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&dialDiameterForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&dialDiameterForDevice____cachedDevice, v3);
    dialDiameterForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    +[NTKAnalogUtilities dialDiameterForDevice:withRounding:](NTKAnalogUtilities, "dialDiameterForDevice:withRounding:", v3, 2);
    dialDiameterForDevice___dialDiameter = v10;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = dialDiameterForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&dialDiameterForDevice____lock);
  v11 = *(double *)&dialDiameterForDevice___dialDiameter;

  return v11;
}

+ (double)dialDiameterForDevice:(id)a3 withRounding:(unint64_t)a4
{
  double result;

  CLKDialDiameterForDeviceWithRoundingBehavior();
  return result;
}

+ (CGSize)largeDialSizeForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  CGSize result;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&largeDialSizeForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&largeDialSizeForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&largeDialSizeForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&largeDialSizeForDevice____cachedDevice, v4);
    largeDialSizeForDevice____previousCLKDeviceVersion = objc_msgSend(v4, "version");

    objc_msgSend(a1, "largeDialDiameterForDevice:", v4);
    largeDialSizeForDevice___largeDialSize_0 = v11;
    largeDialSizeForDevice___largeDialSize_1 = v11;
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = largeDialSizeForDevice____previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&largeDialSizeForDevice____lock);
  v12 = largeDialSizeForDevice___largeDialSize_0;
  v13 = largeDialSizeForDevice___largeDialSize_1;

  v14 = *(double *)&v12;
  v15 = *(double *)&v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (double)largeDialDiameterForDevice:(id)a3
{
  double result;

  CLKLargeDialDiameterForDevice();
  return result;
}

+ (double)whistlerMediumDialDiameterForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&whistlerMediumDialDiameterForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&whistlerMediumDialDiameterForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&whistlerMediumDialDiameterForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&whistlerMediumDialDiameterForDevice____cachedDevice, v3);
    whistlerMediumDialDiameterForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __58__NTKAnalogUtilities_whistlerMediumDialDiameterForDevice___block_invoke(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = whistlerMediumDialDiameterForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&whistlerMediumDialDiameterForDevice____lock);
  v11 = *(double *)&whistlerMediumDialDiameterForDevice____mediumDiameter;

  return v11;
}

void __58__NTKAnalogUtilities_whistlerMediumDialDiameterForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoundingBehavior:", 2);
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, 107.0, 120.0);
  whistlerMediumDialDiameterForDevice____mediumDiameter = v2;

}

@end
