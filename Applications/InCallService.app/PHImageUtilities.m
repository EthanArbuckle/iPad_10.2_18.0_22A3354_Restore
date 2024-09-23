@implementation PHImageUtilities

+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t Width;
  id v7;
  uint64_t Height;
  unsigned __int8 *v9;
  CGContext *v10;
  id v11;
  CGImage *v12;
  _WORD *v13;
  unsigned __int16 *v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  _WORD *v20;
  int v21;
  int v22;
  uint64_t v23;
  double top;
  double left;
  double bottom;
  double right;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  UIEdgeInsets result;

  v4 = a4;
  v5 = objc_retainAutorelease(a3);
  Width = CGImageGetWidth((CGImageRef)objc_msgSend(v5, "CGImage"));
  v7 = objc_retainAutorelease(v5);
  Height = CGImageGetHeight((CGImageRef)objc_msgSend(v7, "CGImage"));
  v9 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, Width, 0, 7u);
  v11 = objc_retainAutorelease(v7);
  v12 = (CGImage *)objc_msgSend(v11, "CGImage");
  v37.size.width = (double)Width;
  v37.size.height = (double)Height;
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  CGContextDrawImage(v10, v37, v12);
  v13 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  v14 = (unsigned __int16 *)malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  v15 = v14;
  if (Height <= 0)
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  else
  {
    v16 = 0;
    v17 = v9;
    do
    {
      v18 = v17;
      v19 = Width;
      v20 = v14;
      if (Width >= 1)
      {
        while (1)
        {
          v22 = *v18++;
          v21 = v22;
          if (v4)
            break;
          if (v21)
            goto LABEL_8;
LABEL_9:
          ++v20;
          if (!--v19)
            goto LABEL_10;
        }
        if (v21 != 255)
          goto LABEL_9;
LABEL_8:
        ++v13[v16];
        ++*v20;
        goto LABEL_9;
      }
LABEL_10:
      ++v16;
      v17 += Width;
    }
    while (v16 != Height);
    v23 = 0;
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    while (!v13[v23])
    {
      if (Height == ++v23)
        goto LABEL_17;
    }
    top = (double)v23;
  }
LABEL_17:
  v28 = -1;
  while (Height >= 1)
  {
    v29 = (unsigned __int16)v13[Height - 1];
    ++v28;
    --Height;
    if (v29)
    {
      bottom = (double)v28;
      break;
    }
  }
  if (Width >= 1)
  {
    v30 = 0;
    while (!v14[v30])
    {
      if (Width == ++v30)
        goto LABEL_27;
    }
    left = (double)v30;
  }
LABEL_27:
  v31 = -1;
  while (Width >= 1)
  {
    v32 = v14[Width - 1];
    ++v31;
    --Width;
    if (v32)
    {
      right = (double)v31;
      break;
    }
  }
  free(v9);
  free(v15);
  free(v13);
  CGContextRelease(v10);

  v33 = top;
  v34 = left;
  v35 = bottom;
  v36 = right;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3
{
  return _objc_msgSend(a1, "trimmedImageByTrimmingTransparentPixelsFromImage:requiringFullOpacity:", a3, 0);
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  id v9;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  if (v7 >= 2.0 && (objc_msgSend(v6, "size"), v8 >= 2.0))
  {
    objc_msgSend(v6, "size");
    v12 = v11;
    objc_msgSend(v6, "size");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pbui_CGImageBackedImage"));
    objc_msgSend(a1, "transparencyInsetsForImage:requiringFullOpacity:", v15, v4);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = v6;
    v9 = v24;
    if (v17 != 0.0 || v21 != 0.0 || v19 != 0.0 || v23 != 0.0)
    {
      objc_msgSend(v24, "scale");
      v26 = v19 / v25 + 0.0;
      objc_msgSend(v9, "scale");
      v28 = v17 / v27 + 0.0;
      objc_msgSend(v9, "scale");
      v30 = v12 - (v19 + v23) / v29;
      objc_msgSend(v9, "scale");
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pbui_cropImageWithRect:outputSize:", v26, v28, v30, v14 - (v17 + v21) / v31, v30, v14 - (v17 + v21) / v31));

      v9 = (id)v32;
    }
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 widthMultiplier:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a1, "transparencyInsetsForImage:requiringFullOpacity:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:", v5));

  return v6;
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5
{
  double bottom;
  double top;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  void *v17;
  double MidX;
  double v19;
  double v20;
  double MidY;
  double v22;
  UIImage *ImageFromCurrentImageContext;
  void *v24;
  CGSize v26;
  CGRect v27;
  CGRect v28;

  bottom = a4.bottom;
  top = a4.top;
  v9 = a3;
  objc_msgSend(v9, "size");
  v11 = v10 * a5;
  objc_msgSend(v9, "size");
  v13 = v12;
  objc_msgSend(v9, "scale");
  v15 = v14;
  v26.width = v11;
  v26.height = v13;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v15);
  if (bottom == 0.0 || top == 0.0)
    v16 = v9;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "trimmedImageByTrimmingTransparentPixelsFromImage:", v9));
  v17 = v16;
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v11;
  v27.size.height = v13;
  MidX = CGRectGetMidX(v27);
  objc_msgSend(v17, "size");
  v20 = MidX - v19 * 0.5;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v11;
  v28.size.height = v13;
  MidY = CGRectGetMidY(v28);
  objc_msgSend(v17, "size");
  objc_msgSend(v17, "drawAtPoint:", v20, MidY - v22 * 0.5);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v24;
}

@end
