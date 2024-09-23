@implementation UIImage(Additions)

- (void)drawInRect:()Additions fromRect:blendMode:alpha:
{
  CGImage *v25;
  CGFloat Width;
  CGFloat Height;
  CGImage *v28;
  CGRect v30;
  CGRect v31;

  v25 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v30.origin.x = a6;
  v30.origin.y = a7;
  v30.size.width = a8;
  v30.size.height = a9;
  if (CGRectIsEmpty(v30))
  {
    Width = (double)CGImageGetWidth(v25);
    Height = (double)CGImageGetHeight(v25);
    compositeCGImageRefInRect(v25, a11, a2, a3, a4, a5, 0.0, 0.0, Width, Height, a12);
  }
  else
  {
    v31.origin.x = a6;
    v31.origin.y = a7;
    v31.size.width = a8;
    v31.size.height = a9;
    v28 = CGImageCreateWithImageInRect(v25, v31);
    compositeCGImageRefInRect(v28, a11, a2, a3, a4, a5, a6, a7, a8, a9, a12);
    if (v28)
      CFRelease(v28);
  }
}

- (uint64_t)adjustFitInSize:()Additions normalizeOrientation:
{
  CGFloat v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t result;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v7 = *a3;
  v8 = a3[1];
  objc_msgSend(a1, "size");
  v10 = v9;
  objc_msgSend(a1, "size");
  v13 = !CGRectCouldContainRect(0.0, 0.0, v7, v8, 0.0, 0.0, v10, v11);
  result = v13;
  v13 = v13 || a4 == 0;
  if (!v13)
  {
    result = objc_msgSend(a1, "imageOrientation");
    if (result)
    {
      objc_msgSend(a1, "size");
      *(_QWORD *)a3 = v14;
      objc_msgSend(a1, "size");
      *((_QWORD *)a3 + 1) = v15;
      return 1;
    }
  }
  return result;
}

- (double)scaledSized:()Additions maintainAspectRatio:
{
  double v7;
  double v8;
  double v9;
  float v10;

  if (a5)
  {
    objc_msgSend(a1, "size");
    v9 = v7 / v8;
    if (v9 < 1.0)
    {
      v10 = a3 * v9;
      return floorf(v10);
    }
  }
  return a2;
}

- (id)scaledImageEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  id v9;
  double v11;
  double v12;

  v11 = a2;
  v12 = a3;
  if ((objc_msgSend(a1, "adjustFitInSize:normalizeOrientation:", &v11) & 1) != 0)
  {
    objc_msgSend(a1, "drawImageIntoSize:maintainAspectRatio:normalizeOrientation:", a5, a6, v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (uint64_t)drawImageIntoSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  double v2;
  double v3;

  objc_msgSend(a1, "scaledSized:maintainAspectRatio:");
  return objc_msgSend(a1, "extendedRangeSafeDrawInRect:", 0.0, 0.0, v2, v3);
}

- (uint64_t)scaledSizeEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  double v8;
  double v9;

  v8 = a2;
  v9 = a3;
  if ((objc_msgSend(a1, "adjustFitInSize:normalizeOrientation:", &v8) & 1) != 0)
    return objc_msgSend(a1, "scaledSized:maintainAspectRatio:", a5, v8, v9);
  else
    return objc_msgSend(a1, "size");
}

- (id)scaledImageWithMaxDimension:()Additions
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  CGFloat v15;
  double v16;
  uint64_t v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = a1;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  if (v5 >= v6)
    v7 = v5;
  else
    v7 = v6;
  if (v7 > a2)
  {
    objc_msgSend(v3, "size");
    v9 = v8;
    objc_msgSend(v3, "size");
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v19.width = v9;
    v22.size.width = a2;
    v22.size.height = a2;
    v20 = AVMakeRectWithAspectRatioInsideRect(v19, v22);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    v14 = CGRectGetWidth(v20);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v15 = CGRectGetHeight(v21);
    LODWORD(v16) = 1.0;
    objc_msgSend(v3, "extendedRangeSafeDrawInRect:opaque:scale:", 0, 0.0, 0.0, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v17;
  }
  return v3;
}

- (uint64_t)cropped16X9Image
{
  double v2;
  double v3;
  double v4;
  float v5;
  double v6;
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

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "size");
  v5 = v3 / v4;
  objc_msgSend(a1, "size");
  v8 = v7;
  if (v5 <= 1.7778)
  {
    objc_msgSend(a1, "size");
    v10 = v11 * 0.0625 * 9.0;
  }
  else
  {
    v8 = v6 / 9.0 * 16.0;
    objc_msgSend(a1, "size");
    v10 = v9;
  }
  objc_msgSend(a1, "size");
  v12 = 0.0;
  v13 = 0.0;
  if (v14 > v8)
  {
    objc_msgSend(a1, "size");
    v13 = (v15 - v8) * 0.5;
  }
  objc_msgSend(a1, "size");
  if (v16 > v10)
  {
    objc_msgSend(a1, "size");
    v12 = (v17 - v10) * 0.5;
  }
  return objc_msgSend(a1, "cropImage:", v13, v12, v8, v10);
}

- (id)cropImage:()Additions
{
  id v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v9 = a1;
  objc_msgSend(v9, "size");
  if (a4 != v11 || a5 != v10)
  {
    objc_msgSend(v9, "size");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v9, "scale");
    *(float *)&v18 = v17;
    objc_msgSend(v9, "extendedRangeSafeDrawInRect:opaque:scale:", 1, -a2, -a3, v14, v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v19;
  }
  return v9;
}

+ (BOOL)isSizeSwappedForImageOrientation:()Additions
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

+ (double)transformForImageOrientation:()Additions andSize:
{
  uint64_t v4;
  __int128 v5;

  v4 = MEMORY[0x24BDBD8B8];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a2 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
  switch(a1)
  {
    case 1:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
      *(double *)(a2 + 32) = result;
      *(double *)(a2 + 40) = a4;
      break;
    case 2:
      result = 0.0;
      *(_OWORD *)a2 = xmmword_226AB71D0;
      *(_OWORD *)(a2 + 16) = xmmword_226AB7580;
      *(double *)(a2 + 32) = a4;
      goto LABEL_6;
    case 3:
      *(_OWORD *)a2 = xmmword_226AB7570;
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
      *(double *)(a2 + 40) = result;
      break;
    case 4:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0x3FF0000000000000;
      *(double *)(a2 + 32) = result;
LABEL_6:
      *(_QWORD *)(a2 + 40) = 0;
      break;
    case 5:
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = 0x3FF0000000000000;
      result = -1.0;
      *(_OWORD *)(a2 + 24) = xmmword_226AB7580;
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      *(_OWORD *)a2 = xmmword_226AB7570;
      *(_OWORD *)(a2 + 16) = xmmword_226AB7580;
      *(double *)(a2 + 32) = a4;
      *(double *)(a2 + 40) = result;
      break;
    case 7:
      result = 0.0;
      *(_OWORD *)a2 = xmmword_226AB71D0;
      *(_QWORD *)(a2 + 16) = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (uint64_t)tintedImage
{
  return objc_msgSend(a1, "imageWithRenderingMode:", 2);
}

+ (uint64_t)imageWithColor:()Additions
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithColor:andSize:", 1.0, 1.0);
}

+ (id)imageWithColor:()Additions andSize:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;

  v7 = a5;
  if (NSClassFromString(CFSTR("UIGraphicsImageRendererFormat")))
  {
    objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithBounds:format:", v8, 0.0, 0.0, a1, a2);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__UIImage_Additions__imageWithColor_andSize___block_invoke;
    v12[3] = &unk_24EE589D8;
    v14 = 0;
    v15 = 0;
    v13 = v7;
    v16 = a1;
    v17 = a2;
    objc_msgSend(v9, "imageWithActions:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)extendedRangeSafeDrawInRect:()Additions
{
  double v10;
  double v11;

  objc_msgSend(a1, "scale");
  *(float *)&v11 = v10;
  return objc_msgSend(a1, "extendedRangeSafeDrawInRect:opaque:scale:", 0, a2, a3, a4, a5, v11);
}

- (id)extendedRangeSafeDrawInRect:()Additions opaque:scale:
{
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[9];
  CGSize v20;

  if (NSClassFromString(CFSTR("UIGraphicsImageRendererFormat")))
  {
    objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOpaque:", a8);
    objc_msgSend(v15, "setScale:", a6);
    if (objc_msgSend(v15, "preferredRange") == 1 && objc_msgSend(a1, "_isSRGB"))
      objc_msgSend(v15, "setPreferredRange:", 2);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithBounds:format:", v15, a2, a3, a4, a5);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke;
    v19[3] = &unk_24EE589D8;
    v19[4] = a1;
    *(double *)&v19[5] = a2;
    *(double *)&v19[6] = a3;
    *(CGFloat *)&v19[7] = a4;
    *(CGFloat *)&v19[8] = a5;
    objc_msgSend(v16, "imageWithActions:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (extendedRangeSafeDrawInRect_opaque_scale__onceToken != -1)
      dispatch_once(&extendedRangeSafeDrawInRect_opaque_scale__onceToken, &__block_literal_global_9_0);
    v20.width = a4;
    v20.height = a5;
    UIGraphicsBeginImageContextWithOptions(v20, a8, a6);
    objc_msgSend(a1, "drawInRect:", a2, a3, a4, a5);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v17;
}

- (BOOL)_isSRGB
{
  CGColorSpaceRef ColorSpace;

  ColorSpace = CGImageGetColorSpace((CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"));
  if (_isSRGB_onceToken != -1)
    dispatch_once(&_isSRGB_onceToken, &__block_literal_global_14);
  return CFEqual(ColorSpace, (CFTypeRef)_isSRGB_s_sRGB) != 0;
}

@end
