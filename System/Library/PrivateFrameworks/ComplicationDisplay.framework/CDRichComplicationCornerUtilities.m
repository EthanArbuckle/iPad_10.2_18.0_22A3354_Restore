@implementation CDRichComplicationCornerUtilities

+ (id)hitTestPathWithViewBounds:(CGRect)a3 position:(int64_t)a4 forDevice:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  CLKLargeDialDiameterForDevice();
  v12 = v11;
  objc_msgSend(v10, "screenBounds");
  v14 = v13;
  v16 = v15;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", x, y, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (v14 - v12) * 0.5;
  v19 = (v16 - v12) * 0.5;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      v18 = width - v12 - v18;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      v18 = width - v12 - v18;
LABEL_5:
      v19 = height - v16 + v19;
      break;
    default:
      v18 = *MEMORY[0x24BDBEFB0];
      v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      break;
  }
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", v18, v19, v12, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bezierPathByReversingPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendPath:", v21);

  return v17;
}

+ (CGRect)cornerGaugeCustomViewRectWithPosition:(int64_t)a3 forDevice:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
    if (v8 == v5)
    {
      v9 = objc_msgSend(v5, "version");
      v10 = _LayoutConstants___previousCLKDeviceVersion_3;

      if (v9 == v10)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_3, v5);
  _LayoutConstants___previousCLKDeviceVersion_3 = objc_msgSend(v5, "version");

  ___LayoutConstants_block_invoke_3(v12, (uint64_t)v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  v13 = *(double *)&_LayoutConstants___constants_0_2;
  v14 = *(double *)&_LayoutConstants___constants_1_2;
  v15 = *(double *)&_LayoutConstants___constants_2_0;

  v16 = CDCornerComplicationSize(v5);
  v18 = v17;
  objc_msgSend(v5, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    v14 = CDCornerComplicationOuterImageCenterPoint(v5);
    v15 = v19;
  }
  switch(a3)
  {
    case 0:
      break;
    case 1:
      v14 = v16 - v14;
      break;
    case 2:
      goto LABEL_12;
    case 3:
      v14 = v16 - v14;
LABEL_12:
      v15 = v18 - v15;
      break;
    default:
      v14 = 0.0;
      v15 = 0.0;
      break;
  }

  v20 = v14 - v13 * 0.5;
  v21 = v15 - v13 * 0.5;
  v22 = v13;
  v23 = v13;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end
