@implementation TVRMDeviceInfo

+ (double)heightForCurrentDeviceWithOrientation:(int64_t)a3
{
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  id v13;
  double result;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  unsigned int v29;
  CGFloat Height;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v5 = CCUIScreenBounds(a1, a2);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13)
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      v33.origin.x = v5;
      v33.origin.y = v7;
      v33.size.width = v9;
      v33.size.height = v11;
      return fmin(CGRectGetHeight(v33) + -128.0, 682.0);
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
      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      return CGRectGetHeight(v32) + -54.0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v15, "userInterfaceIdiom"))
    {

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v17, "bounds");
      v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v20, "bounds");
      v22 = v21;

      if (v19 < v22)
        v19 = v22;

      if (v19 == 812.0)
        return 539.0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v16, "userInterfaceIdiom"))
    {

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v23, "bounds");
      v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v26, "bounds");
      v28 = v27;

      if (v25 < v28)
        v25 = v28;

      if (v25 > 812.0)
        return 682.0;
    }
    v29 = objc_msgSend(a1, "needsCompactLayoutForCurrentDevice");
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    Height = CGRectGetHeight(v34);
    v31 = Height + -128.0;
    result = Height + -96.0;
    if (!v29)
      return v31;
  }
  return result;
}

+ (double)widthForCurrentDevice
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  id v11;
  double result;
  unsigned int v13;
  CGRect v14;

  v3 = CCUIScreenBounds(a1, a2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11)
    return 360.0;
  v13 = objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice");
  v14.origin.x = v3;
  v14.origin.y = v5;
  v14.size.width = v7;
  v14.size.height = v9;
  result = CGRectGetWidth(v14);
  if (v13)
    return result + -128.0;
  return result;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double bottom;
  void *v5;
  unsigned __int8 v6;
  double v7;
  CGFloat left;
  double right;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  bottom = UIEdgeInsetsZero.bottom;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {

  }
  else
  {
    v6 = objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice");

    v7 = 27.0;
    if ((v6 & 1) == 0)
    {
      left = 27.0;
      goto LABEL_10;
    }
  }
  left = UIEdgeInsetsZero.left;
  right = UIEdgeInsetsZero.right;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == (id)1)
  {
    bottom = 27.0;
    v7 = 27.0;
  }
  else
  {
    v7 = right;
  }
  if (v11 == (id)1)
    top = 27.0;
LABEL_10:
  v12 = top;
  v13 = left;
  v14 = bottom;
  result.right = v7;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
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
  id v9;
  BOOL v11;
  CGRect v13;
  CGRect v14;

  v13.origin.x = CCUIScreenBounds(a1, a2);
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v2, "userInterfaceIdiom"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
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
  return MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) == 2;
}

+ (double)expandedRoundedCornerRadius
{
  void *v2;
  id v3;
  double result;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
  {
    CCUIExpandedModuleContinuousCornerRadius();
  }
  else if (+[TVRMDeviceInfo deviceHasRoundedCorners](TVRMDeviceInfo, "deviceHasRoundedCorners"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
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
