@implementation NTKRichComplicationBezelUtilities

+ (id)hitTestPathWithViewBounds:(CGRect)a3 shape:(int64_t)a4 shapeFrame:(CGRect)a5 forDevice:(id)a6
{
  double v6;
  double y;
  double x;
  double v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double height;
  double width;

  height = a5.size.height;
  width = a3.size.width;
  v6 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.size.height;
  v31 = a3.origin.x;
  v32 = a3.origin.y;
  v11 = a6;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_66);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_66);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v14 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_66);
    if (v14 == v11)
    {
      v15 = objc_msgSend(v11, "version");
      v16 = _LayoutConstants___previousCLKDeviceVersion_66;

      if (v15 == v16)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v17 = objc_storeWeak(&_LayoutConstants___cachedDevice_66, v11);
  _LayoutConstants___previousCLKDeviceVersion_66 = objc_msgSend(v11, "version");

  ___LayoutConstants_block_invoke_62(v18, v11);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_66);
  v19 = *(double *)&_LayoutConstants_constants_0_8;
  v20 = *(double *)&_LayoutConstants_constants_1_9;
  v21 = *(double *)&_LayoutConstants_constants_2_8;
  v22 = *(double *)&_LayoutConstants_constants_3_7;

  if ((unint64_t)a4 < 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x, y, v6, height);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 2)
  {
    v27 = v10 * 0.5;
    v28 = v19 * 0.5;
    v29 = v19 * 0.5 - v20;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "moveToPoint:", width * 0.5, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, width * 0.5, v27, v29, v21, 3.14159265);
    objc_msgSend(v23, "addLineToPoint:", 0.0, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width * 0.5, v27, v28, 3.14159265, 0.0);
    objc_msgSend(v23, "addLineToPoint:", width - v20, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, width * 0.5, v27, v29, 0.0, v22);
    objc_msgSend(v23, "closePath");
  }
  else if (a4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v31, v32, width, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v10 * 0.5;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "moveToPoint:", width * 0.5, v24);
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width * 0.5, v24, v19 * 0.5 - v20, v22, v21);
    objc_msgSend(v25, "addLineToPoint:", width * 0.5, v24);
    objc_msgSend(v25, "closePath");
    objc_msgSend(v25, "bezierPathByReversingPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendPath:", v26);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
