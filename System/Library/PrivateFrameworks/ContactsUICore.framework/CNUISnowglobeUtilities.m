@implementation CNUISnowglobeUtilities

+ (id)avatarLayerForCGImages:(CGImage *)a3 inRect:(CGRect)a4 forItemCount:(int64_t)a5 scope:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const CGPath *v24;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a6;
  if (width < height)
    height = width;
  objc_msgSend((id)objc_opt_class(), "circularContainerLayerForRect:backgroundStyle:", objc_msgSend(v11, "backgroundStyle"), x, y, height, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIAvatarLayoutManager layoutConfigurationsForType:withItemCount:](CNUIAvatarLayoutManager, "layoutConfigurationsForType:withItemCount:", 2, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (v14 >= a5)
    v15 = a5;
  else
    v15 = v14;
  if (v15)
  {
    v16 = 0;
    v17 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(v11, "maskedAvatarIndices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsIndex:", v16);

      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setContents:", a3[v16]);
        objc_msgSend(v12, "addSublayer:", v20);
        objc_msgSend(v17, "arrayByAddingObject:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateLayer:inBounds:atIndex:isRTL:", v20, v16, objc_msgSend(v11, "rightToLeft"), x, y, height, height);
        v23 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        objc_msgSend(v20, "bounds");
        v28 = CGRectInset(v27, 1.0, 1.0);
        v24 = CGPathCreateWithEllipseInRect(v28, 0);
        objc_msgSend(v20, "setMask:", v23);
        objc_msgSend(v23, "setPath:", v24);
        if (v24)
          CGPathRelease(v24);

        v17 = (void *)v21;
      }
      ++v16;
    }
    while (v15 != v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (BOOL)enableGroupPhoto
{
  if (enableGroupPhoto_s_onceToken != -1)
    dispatch_once(&enableGroupPhoto_s_onceToken, &__block_literal_global_16);
  return (enableGroupPhoto_enableGroupPhoto | enableGroupPhoto_enablePinning) != 0;
}

void __42__CNUISnowglobeUtilities_enableGroupPhoto__block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  enableGroupPhoto_enableGroupPhoto = _os_feature_enabled_impl();
  enableGroupPhoto_enablePinning = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C965D8]);

  if (!enableGroupPhoto_enableGroupPhoto && !enableGroupPhoto_enablePinning)
  {
    if (v2)
    {
      enableGroupPhoto_enableGroupPhoto = CFPreferencesGetAppBooleanValue(CFSTR("EnableGroupPhoto"), CFSTR("com.apple.messages"), 0) != 0;
      enableGroupPhoto_enablePinning = CFPreferencesGetAppBooleanValue(CFSTR("ConversationPinning"), CFSTR("com.apple.messages"), 0) != 0;
    }
  }
}

+ (CGSize)sizeForImageAtIndex:(unint64_t)a3 inRect:(CGRect)a4 forItemCount:(unint64_t)a5 scope:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a6;
  +[CNUIAvatarLayoutManager layoutConfigurationsForType:withItemCount:](CNUIAvatarLayoutManager, "layoutConfigurationsForType:withItemCount:", 2, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") <= a3)
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemFrameInContainingBounds:isRTL:", objc_msgSend(v12, "rightToLeft"), x, y, width, height);
    v16 = v15;
    v18 = v17;

  }
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (CGImage)circularPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5
{
  double height;
  double width;
  double v9;
  double v10;
  void *v11;
  CGImage *v12;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v9 = width * a5;
  v10 = height * a5;
  objc_msgSend((id)objc_opt_class(), "circularContainerLayerForRect:backgroundStyle:", a4, 0.0, 0.0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CGImage *)objc_msgSend((id)objc_opt_class(), "imageForLayer:inRect:", v11, 0.0, 0.0, v9, v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  return v12;
}

+ (id)circularContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  const CGPath *v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "containerLayerForRect:backgroundStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v10 = CGPathCreateWithEllipseInRect(v12, 0);
  objc_msgSend(v8, "setMask:", v9);
  objc_msgSend(v9, "setPath:", v10);
  if (v10)
    CGPathRelease(v10);

  return v8;
}

+ (id)containerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend((id)objc_opt_class(), "backgroundColorForBackgroundStyle:", a4));
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  return v9;
}

+ (CGColor)backgroundColorForBackgroundStyle:(unint64_t)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGColor *result;

  switch(a3)
  {
    case 1uLL:
      v3 = 0.882352941;
      v4 = 0.88627451;
      v5 = 0.894117647;
      v6 = 0.32;
      break;
    case 2uLL:
      v6 = 0.56;
      goto LABEL_6;
    case 3uLL:
      v6 = 0.2;
LABEL_6:
      v3 = 1.0;
      v4 = 1.0;
      v5 = 1.0;
      break;
    case 4uLL:
      v3 = 0.0;
      v4 = 0.0;
      v5 = 0.0;
      v6 = 0.0;
      break;
    default:
      v3 = 0.882352941;
      v4 = 0.88627451;
      v5 = 0.894117647;
      v6 = 0.56;
      break;
  }
  result = CGColorCreateSRGB(v3, v4, v5, v6);
  if (result)
    return (CGColor *)CFAutorelease(result);
  return result;
}

+ (CGImage)imageForAvatarImages:(CGImage *)a3 badgeImages:(CGImage *)a4 badgeTypes:(id)a5 rect:(CGRect)a6 itemCount:(int64_t)a7 scope:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  CGFloat v18;
  double v19;
  double v20;
  CGColorSpace *DeviceRGB;
  CGContext *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t i;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGImageRef Image;
  CGImage *v58;
  CGContext *v60;
  CGAffineTransform transform;
  CGAffineTransform v62;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "scale");
  CGAffineTransformMakeScale(&v62, v18, v18);
  v19 = height * v62.c + v62.a * width;
  v20 = height * v62.d + v62.b * width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CNUIBitmapContextCreate(llround(v19), llround(v20), DeviceRGB);
  v23 = 0x1E0CD2000uLL;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend((id)objc_opt_class(), "avatarLayerForCGImages:inRect:forItemCount:scope:", a3, a7, v17, x, y, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v16, "count");
  if (v25)
  {
    v26 = v25;
    v60 = v22;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v19, v20);
    objc_msgSend(v27, "addSublayer:", v24);
    for (i = 0; i != v26; ++i)
    {
      objc_msgSend(v24, "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIAvatarLayoutManager avatarBadgeLayerForAvatarInRect:badgeType:isRTL:](CNUIAvatarLayoutManager, "avatarBadgeLayerForAvatarInRect:badgeType:isRTL:", objc_msgSend(v37, "integerValue"), objc_msgSend(v17, "rightToLeft"), v30, v32, v34, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "setContents:", a4[i]);
      objc_msgSend(v27, "addSublayer:", v38);
      if (objc_msgSend(v17, "rightToLeft"))
      {
        objc_msgSend(v38, "frame");
        if (v39 < 0.0)
        {
          objc_msgSend(v24, "frame");
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          objc_msgSend(v38, "frame");
          v49 = v41 + fabs(v48);
          objc_msgSend(v38, "frame");
          v51 = v50;
          v53 = v52;
          v55 = v54;
          objc_msgSend(v24, "setFrame:", v49, v43, v45, v47);
          objc_msgSend(v38, "setFrame:", 0.0, v51, v53, v55);
        }
      }

    }
    v22 = v60;
    v23 = 0x1E0CD2000;
  }
  else
  {
    v27 = v24;
  }
  objc_msgSend(v27, "frame");
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1DD1C8CB0;
  transform.ty = v56;
  CGContextConcatCTM(v22, &transform);
  objc_msgSend(v27, "renderInContext:", v22);
  Image = CGBitmapContextCreateImage(v22);
  objc_msgSend(*(id *)(v23 + 2224), "commit");
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v22);
  if (Image)
    v58 = (CGImage *)CFAutorelease(Image);
  else
    v58 = 0;

  return v58;
}

+ (CGImage)imageForLayer:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  id v6;
  CGColorSpace *DeviceRGB;
  CGContext *v8;
  CGImageRef Image;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CNUIBitmapContextCreate(llround(width), llround(height), DeviceRGB);
  objc_msgSend(v6, "renderInContext:", v8);

  Image = CGBitmapContextCreateImage(v8);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v8);
  if (Image)
    return (CGImage *)CFAutorelease(Image);
  else
    return 0;
}

+ (CGColor)defaultBackgroundColor
{
  return (CGColor *)objc_msgSend((id)objc_opt_class(), "backgroundColorForBackgroundStyle:", 0);
}

+ (CGColor)defaultDarkBackgroundColor
{
  return (CGColor *)objc_msgSend((id)objc_opt_class(), "backgroundColorForBackgroundStyle:", 1);
}

+ (id)roundedRectContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  CGFloat v10;
  const CGPath *v11;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "containerLayerForRect:backgroundStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v10 = floor(width * 15.0 / 255.0) * 0.5;
  v11 = CGPathCreateWithRoundedRect(v13, v10, v10, 0);
  objc_msgSend(v8, "setMask:", v9);
  objc_msgSend(v9, "setPath:", v11);
  if (v11)
    CGPathRelease(v11);

  return v8;
}

+ (CGImage)roundedRectPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5
{
  double height;
  double width;
  double v9;
  double v10;
  void *v11;
  CGImage *v12;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v9 = width * a5;
  v10 = height * a5;
  objc_msgSend((id)objc_opt_class(), "roundedRectContainerLayerForRect:backgroundStyle:", a4, 0.0, 0.0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CGImage *)objc_msgSend((id)objc_opt_class(), "imageForLayer:inRect:", v11, 0.0, 0.0, v9, v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  return v12;
}

@end
