@implementation CLKUIAnalogHandFactory

+ (id)getAssets:(unint64_t)a3 forConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CFTypeRef arg;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
  if (!a3)
  {
    v20 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_48;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "handCacheIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("hand-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "dropShadowCacheIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("hand-%@"), v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "radialShadowCacheIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("hand-%@"), v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "dropShadowCacheIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("maskedShadow-%@"), v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "handCacheIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("inlay-%@"), v18);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 1) != 0)
    v19 = objc_msgSend(a1, "newPathWithConfiguration:", v6);
  else
    v19 = 0;
  arg = (CFTypeRef)v19;
  if ((a3 & 2) != 0)
  {
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageForKey:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if ((a3 & 4) != 0)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(a1, "_getHandImageWithConfiguration:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a3 & 4) != 0)
        goto LABEL_13;
    }
LABEL_11:
    v23 = 0;
    goto LABEL_15;
  }
  v21 = 0;
  if ((a3 & 4) == 0)
    goto LABEL_11;
LABEL_13:
  +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageForKey:", v41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(a1, "_getRadialShadowImageWithConfiguration:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  v25 = (void *)(a3 & 0x18);
  if ((a3 & 0x18) != 0)
  {
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageForKey:", v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a3 & 0x10) != 0)
    {
      +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "imageForKey:", v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
LABEL_18:
        if ((a3 & 0x10) == 0)
          goto LABEL_25;
LABEL_23:
        if (!v25)
        {
          objc_msgSend(a1, "_getMaskedDropShadowImageWithConfiguration:shadowImage:", v6, v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_25;
      }
    }
    else
    {
      v25 = 0;
      if (v27)
        goto LABEL_18;
    }
    objc_msgSend(a1, "_getDropShadowImageWithConfiguration:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 0x10) != 0)
      goto LABEL_23;
  }
  else
  {
    v27 = 0;
  }
LABEL_25:
  if ((a3 & 0x20) != 0)
  {
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v30 = v10;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageForKey:", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v30;
    if (!v29)
    {
      objc_msgSend(a1, "_getInlayImageWithConfiguration:", v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v29 = 0;
  }
  v20 = (void *)objc_opt_new();
  if ((a3 & 1) != 0 && arg)
    objc_msgSend(v20, "setObject:forKey:", CFAutorelease(arg), &unk_1E86EF0C8);
  if ((a3 & 2) != 0 && v21)
  {
    objc_msgSend(v20, "setObject:forKey:", v21, &unk_1E86EF0E0);
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:forKey:", v21, v10);

  }
  if ((a3 & 4) != 0 && v23)
  {
    objc_msgSend(v20, "setObject:forKey:", v23, &unk_1E86EF0F8);
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:forKey:", v23, v41);

  }
  if ((a3 & 0x18) != 0 && v27)
  {
    objc_msgSend(v20, "setObject:forKey:", v27, &unk_1E86EF110);
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImage:forKey:", v27, v42);

  }
  if ((a3 & 0x10) != 0 && v25)
  {
    objc_msgSend(v20, "setObject:forKey:", v25, &unk_1E86EF128);
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setImage:forKey:", v25, v39);

  }
  if ((a3 & 0x20) != 0 && v29)
  {
    objc_msgSend(v20, "setObject:forKey:", v29, &unk_1E86EF140);
    +[CLKUIAnalogHandFactoryCache sharedInstance](CLKUIAnalogHandFactoryCache, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:forKey:", v29, v40);

  }
LABEL_48:

  return v20;
}

+ (CGPath)newPathWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  CGPath *v6;

  v4 = a3;
  objc_msgSend(v4, "hash");
  kdebug_trace();
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = objc_msgSend(a1, "newPathForSecondWithConfiguration:inset:", v4, 0.0);
LABEL_6:
    v6 = (CGPath *)v5;
    objc_msgSend(v4, "hash");
    kdebug_trace();
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "type"))
  {
    v5 = objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 0.0);
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)_getHandImageWithConfiguration:(id)a3
{
  id v4;
  const CGPath *v5;
  const CGPath *v6;
  uint64_t v7;
  id v8;
  const CGPath *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hash");
  kdebug_trace();
  if (objc_msgSend(v4, "type") == 1)
  {
    v5 = (const CGPath *)objc_msgSend(a1, "newPathForSecondWithConfiguration:inset:", v4, 0.0);
    v6 = (const CGPath *)objc_msgSend(a1, "newPathForSecondWithConfiguration:inset:", v4, 1.0);
    v7 = objc_msgSend(a1, "newPathForSecondWithConfiguration:inset:", v4, 2.0);
LABEL_6:
    v9 = (const CGPath *)v7;
    v20[0] = v5;
    v20[1] = v6;
    v20[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.321568627);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.752941176);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bounds");
    objc_msgSend(a1, "_createHandImageWithSize:paths:colors:", v10, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v6);
    CGPathRelease(v9);
    CGPathRelease(v5);
    objc_msgSend(v4, "hash");
    kdebug_trace();
    v8 = v17;

    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "type"))
  {
    v5 = (const CGPath *)objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 0.0);
    v6 = (const CGPath *)objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 1.0);
    v7 = objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 2.0);
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

+ (id)_getInlayImageWithConfiguration:(id)a3
{
  id v4;
  id v5;
  const CGPath *v6;
  const CGPath *v7;
  const CGPath *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hash");
  kdebug_trace();
  v5 = 0;
  if (objc_msgSend(v4, "type") != 1)
  {
    if (objc_msgSend(v4, "type"))
    {
      v5 = 0;
    }
    else
    {
      v6 = (const CGPath *)objc_msgSend(a1, "newPathForInlayWithConfiguration:inset:", v4, 0.0);
      v7 = (const CGPath *)objc_msgSend(a1, "newPathForInlayWithConfiguration:inset:", v4, 1.0);
      v8 = (const CGPath *)objc_msgSend(a1, "newPathForInlayWithConfiguration:inset:", v4, 2.0);
      v19[0] = v6;
      v19[1] = v7;
      v19[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.321568627);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.752941176);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v11;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "bounds");
      objc_msgSend(a1, "_createHandImageWithSize:paths:colors:", v9, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CGPathRelease(v7);
      CGPathRelease(v8);
      CGPathRelease(v6);
      objc_msgSend(v4, "hash");
      kdebug_trace();
      v5 = v16;

    }
  }

  return v5;
}

+ (id)_getDropShadowImageWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "dropShadowCacheIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("shadow-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dropShadowRadius");
  v9 = v8;
  objc_msgSend(v5, "dropShadowOpacity");
  objc_msgSend(a1, "_getShadowImageWithConfiguration:radius:opacity:key:", v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_getRadialShadowImageWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "radialShadowCacheIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("shadow-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "radialShadowRadius");
  v9 = v8;
  objc_msgSend(v5, "radialShadowOpacity");
  objc_msgSend(a1, "_getShadowImageWithConfiguration:radius:opacity:key:", v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_getShadowImageWithConfiguration:(id)a3 radius:(double)a4 opacity:(double)a5 key:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  const CGPath *v12;
  double v13;
  double v14;

  v9 = a3;
  objc_msgSend(v9, "hash");
  kdebug_trace();
  if (objc_msgSend(v9, "type") == 1)
  {
    v10 = objc_msgSend(a1, "newPathForSecondWithConfiguration:inset:", v9, 0.0);
LABEL_6:
    v12 = (const CGPath *)v10;
    objc_msgSend(v9, "bounds");
    objc_msgSend(a1, "_createShadowImageSize:path:radius:opacity:", v12, v13, v14, a4 * 0.5, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v12);
    objc_msgSend(v9, "hash");
    kdebug_trace();
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "type"))
  {
    v10 = objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v9, 1, 0.0);
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

+ (id)_getMaskedDropShadowImageWithConfiguration:(id)a3 shadowImage:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const CGPath *v12;
  double v13;
  double v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "hash");
  kdebug_trace();
  objc_msgSend(v7, "dropShadowRadius");
  v9 = v8 * 0.5;
  objc_msgSend(v7, "dropShadowOpacity");
  v11 = v10;
  v12 = (const CGPath *)objc_msgSend(a1, "newPathForPeg:inset:", v7, 0.0);
  objc_msgSend(v7, "bounds");
  objc_msgSend(a1, "_createMaskedShadowImageFromShadow:size:maskPath:radius:opacity:", v6, v12, v13, v14, v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CGPathRelease(v12);
  objc_msgSend(v7, "hash");

  kdebug_trace();
  return v15;
}

+ (id)_createHandImageWithSize:(CGSize)a3 paths:(id)a4 colors:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  CGContext *CurrentContext;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  CGSize v23;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v9 = a5;
  if (width == 0.0 || height == 0.0)
  {
    CLKLoggingObjectForDomain();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      +[CLKUIAnalogHandFactory _createHandImageWithSize:paths:colors:].cold.1(v21, width, height);

    v20 = 0;
  }
  else
  {
    v23.width = width;
    v23.height = height;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 4.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFillRule:", *MEMORY[0x1E0CD2B78]);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, width, height);
    objc_msgSend(v11, "setContentsScale:", 4.0);
    v12 = objc_msgSend(v8, "count");
    v13 = objc_msgSend(v9, "count");
    if (v12 >= v13)
      v14 = v13;
    else
      v14 = v12;
    if (v14)
    {
      v15 = 0;
      do
      {
        objc_msgSend(v11, "setPath:", objc_msgSend(v8, "objectAtIndex:", v15));
        objc_msgSend(v9, "objectAtIndex:", v15);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "setFillColor:", objc_msgSend(v16, "CGColor"));

        objc_msgSend(v11, "renderInContext:", UIGraphicsGetCurrentContext());
        ++v15;
        v17 = objc_msgSend(v8, "count");
        v18 = objc_msgSend(v9, "count");
        if (v17 >= v18)
          v19 = v18;
        else
          v19 = v17;
      }
      while (v15 < v19);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v20;
}

+ (id)_createShadowImageSize:(CGSize)a3 path:(CGPath *)a4 radius:(double)a5 opacity:(double)a6
{
  double height;
  double width;
  void *v11;
  id v12;
  double v13;
  id v14;
  CGContext *CurrentContext;
  CGFloat v16;
  void *v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  height = a3.height;
  width = a3.width;
  v19.width = a3.width + a5 * 2.0;
  v19.height = a3.height + a5 * 2.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 2.0);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v11, "setContentsScale:", 2.0);
  objc_msgSend(v11, "setPath:", a4);
  objc_msgSend(v11, "setFillRule:", *MEMORY[0x1E0CD2B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(v11, "setShadowPath:", a4);
  objc_msgSend(v11, "frame");
  objc_msgSend(v11, "setShadowOffset:", CGRectGetWidth(v20) + a5, 0.0);
  *(float *)&v13 = a6;
  objc_msgSend(v11, "setShadowOpacity:", v13);
  objc_msgSend(v11, "setShadowRadius:", a5 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v11, "frame");
  v16 = CGRectGetWidth(v21);
  CGContextTranslateCTM(CurrentContext, -v16, a5);
  objc_msgSend(v11, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)_createMaskedShadowImageFromShadow:(id)a3 size:(CGSize)a4 maskPath:(CGPath *)a5 radius:(double)a6 opacity:(double)a7
{
  double height;
  double width;
  id v12;
  void *v13;
  id v14;
  CGFloat v15;
  double v16;
  CGImage *v17;
  size_t v18;
  unint64_t v19;
  size_t v20;
  unsigned __int8 *v21;
  CGColorSpace *DeviceRGB;
  CGContext *v23;
  CGFloat v24;
  CGImage *Image;
  unsigned __int8 *v26;
  CGContext *v27;
  size_t i;
  CGImage *v29;
  void *v30;
  id v32;
  CGPath *path;
  CGAffineTransform transform;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  CGPathRetain(a5);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v13, "setContentsScale:", 2.0);
  path = a5;
  objc_msgSend(v13, "setPath:", a5);
  objc_msgSend(v13, "setFillRule:", *MEMORY[0x1E0CD2B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  objc_msgSend(v13, "frame");
  v15 = CGRectGetWidth(v35);
  objc_msgSend(v13, "setShadowOffset:", v15 + a6 + v15 + a6, 0.0);
  *(float *)&v16 = a7;
  objc_msgSend(v13, "setShadowOpacity:", v16);
  objc_msgSend(v13, "setShadowRadius:", a6);
  v32 = objc_retainAutorelease(v12);
  v17 = (CGImage *)objc_msgSend(v32, "CGImage");
  v18 = CGImageGetWidth(v17);
  v19 = CGImageGetHeight(v17);
  v20 = 4 * v18 * v19;
  v21 = (unsigned __int8 *)malloc_type_calloc(v20, 1uLL, 0x100004077774924uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v23 = CGBitmapContextCreate(v21, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1CB9E2970;
  transform.ty = (double)v19;
  CGContextConcatCTM(v23, &transform);
  CGContextScaleCTM(v23, 2.0, 2.0);
  objc_msgSend(v13, "frame");
  v24 = CGRectGetWidth(v36);
  CGContextTranslateCTM(v23, -v24, a6);
  objc_msgSend(v13, "renderInContext:", v23);
  Image = CGBitmapContextCreateImage(v23);
  CGContextRelease(v23);
  v26 = (unsigned __int8 *)malloc_type_calloc(v20, 1uLL, 0x100004077774924uLL);
  v27 = CGBitmapContextCreate(v26, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  CGContextScaleCTM(v27, 2.0, 2.0);
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = width + a6 * 2.0;
  v37.size.height = height + a6 * 2.0;
  CGContextDrawImage(v27, v37, v17);
  if (v20)
  {
    for (i = 0; i < v20; i += 4)
      v26[i + 3] = (unsigned __int16)(255
                                    * ((v26[i + 3] - v21[i + 3]) & ~(unsigned __int16)((v26[i + 3] - v21[i + 3]) >> 31)))
                 / (v21[i + 3] + 255);
  }
  v29 = CGBitmapContextCreateImage(v27);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v29, 0, 2.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGImageRelease(v29);
  CGContextRelease(v27);
  CGColorSpaceRelease(DeviceRGB);
  CGPathRelease(path);
  free(v21);
  free(v26);

  return v30;
}

+ (CGPath)newPathForHourMinuteWithConfiguration:(id)a3 inset:(double)a4 includePeg:(BOOL)a5
{
  _BOOL4 v5;
  double v6;
  void *v7;
  CGPath *Mutable;
  double v9;
  double v10;
  double v11;
  double v12;
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
  float v23;
  double v24;
  double v25;
  double v26;
  CGPath *v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGPath *v61;
  double v62;
  double v63;
  CGFloat v64;
  double v66;

  v5 = a5;
  v6 = a4 * 0.25;
  objc_msgSend(a3, "configurationByApplyingInset:", a4 * 0.25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  objc_msgSend(v7, "pegRadius");
  v10 = v9;
  objc_msgSend(v7, "pegStrokeWidth");
  v12 = v10 + v11;
  objc_msgSend(v7, "armWidth");
  v14 = v13;
  objc_msgSend(v7, "handWidth");
  v16 = v15 * 0.5;
  if (v16 < v12)
    v16 = v12;
  v17 = v6 + v16;
  objc_msgSend(v7, "armLength");
  v19 = v18;
  objc_msgSend(v7, "handLength");
  v21 = v6 + v12 + v19 + v20;
  objc_msgSend(v7, "smoothingRadius");
  v66 = v6;
  if (v22 == 0.0)
  {
    v23 = v14 / (v12 + v12);
    v24 = asinf(v23);
    v25 = v24 + -1.57079633;
    v26 = -1.57079633 - v24;
    v27 = Mutable;
    v28 = v17;
    v29 = v21;
    v30 = v12;
    if (v5)
    {
      v31 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v7, "armWidth");
    v33 = v32;
    objc_msgSend(v7, "smoothingRadius");
    v35 = v34 + v33 * 0.5;
    objc_msgSend(v7, "smoothingRadius");
    v37 = v12 + v36;
    v38 = sqrt(v37 * v37 - v35 * v35);
    v39 = acos(v35 / v37);
    v40 = v21 - v38;
    v6 = v66;
    objc_msgSend(v7, "smoothingRadius");
    CGPathAddArc(Mutable, 0, v17 + v35, v40, v41, 3.14159265, 3.14159265 - v39, 1);
    CGPathAddArc(Mutable, 0, v17, v21, v12, -v39, v39 + 3.14159265, !v5);
    objc_msgSend(v7, "smoothingRadius");
    v30 = v42;
    v26 = 0.0;
    v27 = Mutable;
    v28 = v17 - v35;
    v29 = v40;
    v25 = v39;
  }
  v31 = 1;
LABEL_8:
  CGPathAddArc(v27, 0, v28, v29, v30, v25, v26, v31);
  objc_msgSend(v7, "handWidth");
  v44 = v43 * 0.5;
  objc_msgSend(v7, "handLength");
  v46 = v6 + v45 - v44;
  objc_msgSend(v7, "smoothingRadius");
  v48 = v47;
  objc_msgSend(v7, "armWidth");
  v50 = v49;
  if (v48 == 0.0)
  {
    v51 = v49 / (v44 + v44);
    v52 = asinf(v51);
    CGPathAddArc(Mutable, 0, v17, v46, v44, v52 + -4.71238898, -3.14159265, 0);
    CGPathAddArc(Mutable, 0, v17, v66 + v44, v44, 3.14159265, 0.0, 0);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 6.28318531, -4.71238898 - v52, 0);
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    objc_msgSend(v7, "smoothingRadius");
    v54 = v53 + v50 * 0.5;
    objc_msgSend(v7, "smoothingRadius");
    v56 = v44 + v55;
    v57 = sqrt(v56 * v56 - v54 * v54);
    v58 = acos(v54 / v56);
    objc_msgSend(v7, "smoothingRadius");
    CGPathAddArc(Mutable, 0, v17 - v54, v46 + v57, v59, 0.0, -v58, 1);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 3.14159265 - v58, 3.14159265, 0);
    CGPathAddArc(Mutable, 0, v17, v66 + v44, v44, -3.14159265, 0.0, 0);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 0.0, v58, 0);
    objc_msgSend(v7, "smoothingRadius");
    CGPathAddArc(Mutable, 0, v17 + v54, v46 + v57, v60, v58 + 3.14159265, 3.14159265, 1);
    if (objc_msgSend(v7, "removeInlay"))
    {
      v61 = CGPathCreateMutable();
      CGPathAddArc(v61, 0, v17, v66 + v44, v66 + v44 + -2.0, 0.0, 3.14159265, 1);
      CGPathAddArc(v61, 0, v17, v46, v66 + v44 + -2.0, 3.14159265, 0.0, 1);
      CGPathCloseSubpath(v61);
      CGPathAddPath(Mutable, 0, v61);
      CGPathRelease(v61);
    }
  }
  objc_msgSend(v7, "pegRadius");
  if (v62 > 0.0 && v5)
  {
    objc_msgSend(v7, "pegRadius");
    CGPathMoveToPoint(Mutable, 0, v17 + v63, v21);
    objc_msgSend(v7, "pegRadius");
    CGPathAddArc(Mutable, 0, v17, v21, v64, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (CGPath)newPathForInlayWithConfiguration:(id)a3 inset:(double)a4
{
  double v4;
  void *v5;
  CGPath *Mutable;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGPath *v19;
  CGFloat v20;

  v4 = a4 * 0.25;
  objc_msgSend(a3, "configurationByApplyingInset:", a4 * 0.25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  objc_msgSend(v5, "pegRadius");
  v8 = v7;
  objc_msgSend(v5, "pegStrokeWidth");
  v10 = v8 + v9;
  objc_msgSend(v5, "handWidth");
  v12 = v11 * 0.5;
  if (v12 < v10)
    v12 = v10;
  v13 = v4 + v12;
  objc_msgSend(v5, "handWidth");
  v15 = v14 * 0.5;
  objc_msgSend(v5, "handLength");
  v17 = v4 + v16 - v15;
  v18 = v4 + v15;
  v19 = CGPathCreateMutable();
  v20 = v4 + v15 + -2.0;
  CGPathAddArc(v19, 0, v13, v18, v20, 0.0, 3.14159265, 1);
  CGPathAddArc(v19, 0, v13, v17, v20, 3.14159265, 0.0, 1);
  CGPathCloseSubpath(v19);
  CGPathAddPath(Mutable, 0, v19);
  CGPathRelease(v19);

  return Mutable;
}

+ (CGPath)newPathForSecondWithConfiguration:(id)a3 inset:(double)a4
{
  id v5;
  double v6;
  void *v7;
  CGPath *Mutable;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  int v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  double v67;
  double startAngle;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;

  v5 = a3;
  v6 = a4 * 0.25;
  objc_msgSend(v5, "configurationByApplyingInset:", a4 * 0.25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  objc_msgSend(v7, "pegRadius");
  v10 = v9;
  objc_msgSend(v7, "pegStrokeWidth");
  v12 = v10 + v11;
  v13 = v6 + v10 + v11;
  objc_msgSend(v7, "handWidth");
  v15 = v14 * 0.5;
  if (v13 < v15)
    v13 = v15;
  objc_msgSend(v7, "handLength");
  v17 = v6 + v16;
  objc_msgSend(v7, "handWidth");
  v19 = v18;
  objc_msgSend(v7, "smoothingRadius");
  v21 = v20 + v19 * 0.5;
  objc_msgSend(v7, "smoothingRadius");
  v23 = v12 + v22;
  v24 = sqrt(v23 * v23 - v21 * v21);
  v25 = acos(v21 / v23);
  v74 = v12;
  startAngle = v25 + 3.14159265;
  CGPathAddArc(Mutable, 0, v13, v17, v12, 3.14159265, v25 + 3.14159265, 0);
  v71 = v21;
  v73 = v17;
  v26 = v17 - v24;
  objc_msgSend(v7, "smoothingRadius");
  v28 = v27;
  v70 = v13 - v21;
  v29 = v13 - v21;
  v30 = v25;
  CGPathAddArc(Mutable, 0, v29, v17 - v24, v28, v25, 0.0, 1);
  v31 = objc_msgSend(v5, "roundedSecondHand");
  objc_msgSend(v7, "handWidth");
  v33 = v32 * 0.5;
  if (v31)
  {
    v34 = v6 + v33;
    objc_msgSend(v7, "handWidth");
    CGPathAddLineToPoint(Mutable, 0, v13 - v35 * 0.5, v34);
    objc_msgSend(v7, "handWidth");
    CGPathAddArc(Mutable, 0, v13, v34, v36 * 0.5, 3.14159265, 0.0, 0);
  }
  else
  {
    CGPathAddLineToPoint(Mutable, 0, v13 - v33, v6);
    objc_msgSend(v7, "handWidth");
    CGPathAddLineToPoint(Mutable, 0, v13 + v37 * 0.5, v6);
  }
  v38 = v13 + v71;
  objc_msgSend(v7, "smoothingRadius", *(_QWORD *)&v6);
  v72 = 3.14159265 - v25;
  CGPathAddArc(Mutable, 0, v38, v26, v39, 3.14159265, 3.14159265 - v25, 1);
  v40 = 0.0;
  v42 = v73;
  v41 = v74;
  v69 = -v30;
  CGPathAddArc(Mutable, 0, v13, v73, v74, -v30, 0.0, 0);
  if ((objc_msgSend(v7, "excludeSecondTail") & 1) == 0)
  {
    CGPathAddArc(Mutable, 0, v13, v73, v74, 0.0, v30, 0);
    objc_msgSend(v7, "smoothingRadius");
    CGPathAddArc(Mutable, 0, v38, v73 + v24, v43, startAngle, 3.14159265, 1);
    if (objc_msgSend(v5, "roundedSecondHand"))
    {
      objc_msgSend(v7, "handLength");
      v45 = v44;
      objc_msgSend(v7, "tailLength");
      v47 = v67 + v45 + v46;
      objc_msgSend(v7, "handWidth");
      v49 = v47 - v48 * 0.5;
      objc_msgSend(v7, "handWidth");
      CGPathAddLineToPoint(Mutable, 0, v13 + v50 * 0.5, v49);
      objc_msgSend(v7, "handWidth");
      v42 = v73;
      CGPathAddArc(Mutable, 0, v13, v49, v51 * 0.5, 0.0, -3.14159265, 0);
    }
    else
    {
      objc_msgSend(v7, "handWidth");
      v53 = v13 + v52 * 0.5;
      objc_msgSend(v7, "handLength");
      v55 = v54;
      objc_msgSend(v7, "tailLength");
      CGPathAddLineToPoint(Mutable, 0, v53, v67 + v55 + v56);
      objc_msgSend(v7, "handWidth");
      v58 = v13 - v57 * 0.5;
      objc_msgSend(v7, "handLength");
      v60 = v59;
      objc_msgSend(v7, "tailLength");
      CGPathAddLineToPoint(Mutable, 0, v58, v67 + v60 + v61);
    }
    objc_msgSend(v7, "smoothingRadius");
    CGPathAddArc(Mutable, 0, v70, v73 + v24, v62, 0.0, v69, 1);
    v40 = v72;
    v41 = v74;
  }
  CGPathAddArc(Mutable, 0, v13, v42, v41, v40, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  objc_msgSend(v7, "pegRadius");
  if (v63 > 0.0)
  {
    objc_msgSend(v7, "pegRadius");
    CGPathMoveToPoint(Mutable, 0, v13 + v64, v42);
    objc_msgSend(v7, "pegRadius");
    CGPathAddArc(Mutable, 0, v13, v42, v65, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (CGPath)newPathForPeg:(id)a3 inset:(double)a4
{
  double v4;
  void *v5;
  CGPath *Mutable;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  CGFloat v23;

  v4 = a4 * 0.25;
  objc_msgSend(a3, "configurationByApplyingInset:", a4 * 0.25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  objc_msgSend(v5, "pegRadius");
  v8 = v7;
  objc_msgSend(v5, "pegStrokeWidth");
  v10 = v8 + v9;
  if (objc_msgSend(v5, "type") == 1)
  {
    v11 = v4 + v10;
    objc_msgSend(v5, "handWidth");
    v13 = v12 * 0.5;
    if (v4 + v10 < v13)
      v11 = v13;
    objc_msgSend(v5, "handLength");
  }
  else
  {
    objc_msgSend(v5, "handWidth");
    v16 = v15 * 0.5;
    if (v16 < v10)
      v16 = v10;
    v11 = v4 + v16;
    objc_msgSend(v5, "armLength");
    v18 = v17;
    objc_msgSend(v5, "handLength");
    v14 = v10 + v18 + v19;
  }
  v20 = v4 + v14;
  CGPathAddArc(Mutable, 0, v11, v20, v10, 0.0, 6.28318531, 0);
  objc_msgSend(v5, "pegRadius");
  if (v21 > 0.0)
  {
    objc_msgSend(v5, "pegRadius");
    CGPathMoveToPoint(Mutable, 0, v11 + v22, v20);
    objc_msgSend(v5, "pegRadius");
    CGPathAddArc(Mutable, 0, v11, v20, v23, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (void)_createHandImageWithSize:(NSObject *)a1 paths:(double)a2 colors:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1CB9A4000, a1, OS_LOG_TYPE_FAULT, "cannot create hand image with size: %@", (uint8_t *)&v5, 0xCu);

}

@end
