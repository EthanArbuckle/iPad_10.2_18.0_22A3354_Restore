@implementation TVRMDeviceInfo

+ (double)heightForCurrentDeviceWithOrientation:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  double result;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  CGFloat Height;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  CCUIScreenBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14)
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      return fmin(CGRectGetHeight(v34) + -128.0, 682.0);
    }
    else
    {
      return 682.0;
    }
  }
  else
  {
    if (objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice"))
    {
      v33.origin.x = v6;
      v33.origin.y = v8;
      v33.size.width = v10;
      v33.size.height = v12;
      return CGRectGetHeight(v33) + -54.0;
    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "userInterfaceIdiom"))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v23 = v22;

      if (v20 < v23)
        v20 = v23;

      if (v20 == 812.0)
        return 539.0;
    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom"))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v26 = v25;

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v29 = v28;

      if (v26 < v29)
        v26 = v29;

      if (v26 > 812.0)
        return 682.0;
    }
    v30 = objc_msgSend(a1, "needsCompactLayoutForCurrentDevice");
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    Height = CGRectGetHeight(v35);
    v32 = Height + -128.0;
    result = Height + -96.0;
    if (!v30)
      return v32;
  }
  return result;
}

+ (double)widthForCurrentDevice
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  double result;
  int v14;
  CGRect v15;

  CCUIScreenBounds();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12)
    return 360.0;
  v14 = objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice");
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  result = CGRectGetWidth(v15);
  if (v14)
    return result + -128.0;
  return result;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = MEMORY[0x24BDF7718];
  v4 = *MEMORY[0x24BDF7718];
  v5 = *(double *)(MEMORY[0x24BDF7718] + 16);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom"))
  {

  }
  else
  {
    v7 = objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice");

    v8 = 27.0;
    if ((v7 & 1) == 0)
    {
      v9 = 27.0;
      goto LABEL_10;
    }
  }
  v9 = *(double *)(v3 + 8);
  v10 = *(double *)(v3 + 24);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
  {
    v5 = 27.0;
    v8 = 27.0;
  }
  else
  {
    v8 = v10;
  }
  if (v12 == 1)
    v4 = 27.0;
LABEL_10:
  v13 = v4;
  v14 = v9;
  v15 = v5;
  result.right = v8;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

+ (BOOL)needsLandscapeOrientationForCurrentDevice
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  BOOL v11;
  CGRect v13;
  CGRect v14;

  CCUIScreenBounds();
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v6 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v7 = CGRectGetHeight(v14);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");
  v11 = v6 > v7 && v9 == 0;

  return v11;
}

+ (BOOL)needsCompactLayoutForCurrentDevice
{
  void *v2;
  BOOL v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    if (v6 >= v9)
      v10 = v6;
    else
      v10 = v9;
    v3 = v10 == 568.0;
  }

  return v3;
}

+ (BOOL)deviceHasRoundedCorners
{
  return MGGetSInt32Answer() == 2;
}

+ (double)expandedRoundedCornerRadius
{
  void *v2;
  uint64_t v3;
  double result;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    CCUIExpandedModuleContinuousCornerRadius();
  }
  else if (+[TVRMDeviceInfo deviceHasRoundedCorners](TVRMDeviceInfo, "deviceHasRoundedCorners"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayCornerRadius");
    v8 = v7;

    return v8;
  }
  else
  {
    return 0.0;
  }
  return result;
}

@end
