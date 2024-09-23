@implementation AVTImageUtilities

+ (void)cropImageWhitespace:(CGImage *)a3 outsideRect:(CGRect)a4 insideRect:(CGRect)a5 resultBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void (**v15)(id, CGImage *, double, double, double, double);
  size_t v16;
  size_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGImage *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v15 = (void (**)(id, CGImage *, double, double, double, double))a6;
  v16 = CGImageGetWidth(a3);
  v17 = CGImageGetHeight(a3);
  +[AVTImageUtilities transparencyInsetsForImage:requiringFullOpacity:](AVTImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", a3, 0);
  v19 = v18;
  v29.origin.x = v20;
  v22 = (double)v16 - v20 - v21;
  v29.size.height = (double)v17 - v19 - v23;
  v29.origin.y = v19;
  v29.size.width = v22;
  v32.origin.x = v13;
  v32.origin.y = v12;
  v32.size.width = v11;
  v32.size.height = v10;
  v30 = CGRectUnion(v29, v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v31 = CGRectIntersection(v30, v33);
  v24 = v31.origin.x;
  v25 = v31.origin.y;
  v26 = v31.size.width;
  v27 = v31.size.height;
  v28 = CGImageCreateWithImageInRect(a3, v31);
  v15[2](v15, v28, v24, v25, v26, v27);

  CGImageRelease(v28);
}

+ (void)posterWithStickerImage:(CGImage *)a3 posterSize:(CGSize)a4 minimumHorizontalMargin:(float)a5 thumbnailRect:(CGRect)a6 allowsExtraTallContent:(BOOL)a7 expectsExtraTallContent:(BOOL)a8 resultBlock:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v15;
  void (**v17)(id, CGImage *, double, double, double, double);
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  size_t v37;
  BOOL v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  size_t BitsPerComponent;
  size_t v46;
  void *v47;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v50;
  CGImage *Image;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;

  v9 = a8;
  v10 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a4.height;
  v54 = a4.width;
  v17 = (void (**)(id, CGImage *, double, double, double, double))a9;
  v18 = (double)CGImageGetWidth(a3);
  v19 = (double)CGImageGetHeight(a3);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v20 = v19 - CGRectGetMaxY(v55);
  +[AVTImageUtilities transparencyInsetsForImage:requiringFullOpacity:](AVTImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", a3, 0);
  v24 = v23;
  v26 = v25;
  v27 = v20 > v21;
  if (v10)
    v28 = v21;
  else
    v28 = v20;
  v29 = v27 && v9;
  if (v27 && v9)
    v30 = v28;
  else
    v30 = v21;
  if (v27 && v9)
    v31 = v20;
  else
    v31 = v21;
  +[AVTImageUtilities transparencyInsetsForImage:imageRect:requiringFullOpacity:](AVTImageUtilities, "transparencyInsetsForImage:imageRect:requiringFullOpacity:", a3, 0, v26, v24, v18 - v26 - v22, v19 - v24 - v31);
  v33 = v32;
  v35 = v18 - v32 - v34;
  v36 = v19 - v24 - v30;
  v37 = (unint64_t)v15;
  if (v29)
    v38 = !v10;
  else
    v38 = 1;
  v53 = v35;
  if (v38)
  {
    v44 = v54;
    v39 = (v54 - (float)(a5 + a5)) / v35;
    v40 = (double)v37 - v36 * v39;
    if (v15 / v36 <= v39)
    {
      v39 = v15 / v36;
      v40 = 0.0;
    }
    if (v9)
      v42 = v15 / v36;
    else
      v42 = v39;
    if (v9)
      v43 = 0.0;
    else
      v43 = v40;
  }
  else
  {
    v41 = v36 / (v19 - v24 - v20);
    v37 = (unint64_t)(float)((float)v37 * v41);
    v42 = v15 / v36 * v41;
    v43 = 0.0;
    v44 = v54;
  }
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  v46 = (CGImageGetBitsPerPixel(a3) >> 3) * (unint64_t)v44;
  v47 = malloc_type_calloc(v37, v46, 0xAEC4E404uLL);
  ColorSpace = CGImageGetColorSpace(a3);
  BitmapInfo = CGImageGetBitmapInfo(a3);
  v50 = CGBitmapContextCreate(v47, (unint64_t)v44, v37, BitsPerComponent, v46, ColorSpace, BitmapInfo);
  v56.size.width = v42 * v18;
  v56.size.height = v42 * v19;
  v56.origin.x = ((double)(unint64_t)v44 - v53 * v42) * 0.5 - v33 * v42;
  v56.origin.y = v43 - (v19 - (v24 + v36)) * v42;
  CGContextDrawImage(v50, v56, a3);
  Image = CGBitmapContextCreateImage(v50);
  v17[2](v17, Image, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  CGImageRelease(Image);
  CGContextRelease(v50);
  free(v47);
}

+ (UIEdgeInsets)_transparencyInsetsForUInt8AlphaContext:(CGContext *)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL4 v4;
  size_t Width;
  size_t Height;
  unsigned __int8 *Data;
  _WORD *v9;
  _WORD *v10;
  uint64_t i;
  unsigned __int8 *v12;
  size_t v13;
  _WORD *v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  v4 = a4;
  Width = CGBitmapContextGetWidth(a3);
  Height = CGBitmapContextGetHeight(a3);
  Data = (unsigned __int8 *)CGBitmapContextGetData(a3);
  v9 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  v10 = malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  if (Height)
  {
    for (i = 0; i != Height; ++i)
    {
      v12 = Data;
      v13 = Width;
      v14 = v10;
      if (Width)
      {
        while (1)
        {
          v16 = *v12++;
          v15 = v16;
          if (v4)
            break;
          if (v15)
            goto LABEL_8;
LABEL_9:
          ++v14;
          if (!--v13)
            goto LABEL_10;
        }
        if (v15 != 255)
          goto LABEL_9;
LABEL_8:
        ++v9[i];
        ++*v14;
        goto LABEL_9;
      }
LABEL_10:
      Data += Width;
    }
    v17 = 0;
    v18 = *MEMORY[0x1E0CEB4B0];
    v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v20 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v21 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    while (!v9[v17])
    {
      if (Height == ++v17)
        goto LABEL_18;
    }
    v18 = (double)v17;
LABEL_18:
    v22 = 0;
    while (!v9[Height - 1 + v22])
    {
      if (-(uint64_t)Height == --v22)
      {
        if (Width)
          goto LABEL_24;
        goto LABEL_34;
      }
    }
    v20 = (double)-v22;
    if (!Width)
      goto LABEL_34;
  }
  else
  {
    v18 = *MEMORY[0x1E0CEB4B0];
    v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v20 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v21 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    if (!Width)
      goto LABEL_34;
  }
LABEL_24:
  v23 = 0;
  while (!v10[v23])
  {
    if (Width == ++v23)
      goto LABEL_29;
  }
  v19 = (double)v23;
LABEL_29:
  v24 = 0;
  while (!v10[Width - 1 + v24])
  {
    if (-(uint64_t)Width == --v24)
      goto LABEL_34;
  }
  v21 = (double)-v24;
LABEL_34:
  free(v10);
  free(v9);
  v25 = v18;
  v26 = v19;
  v27 = v20;
  v28 = v21;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t Width;
  unint64_t Height;
  void *v9;
  CGContext *v10;
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
  CGRect v23;
  UIEdgeInsets result;

  v4 = a4;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v9 = malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, Width, 0, 7u);
  v23.size.width = (double)Width;
  v23.size.height = (double)Height;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  CGContextDrawImage(v10, v23, a3);
  objc_msgSend(a1, "_transparencyInsetsForUInt8AlphaContext:requiringFullOpacity:", v10, v4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  CGContextRelease(v10);
  free(v9);
  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 imageRect:(CGRect)a4 requiringFullOpacity:(BOOL)a5
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  size_t v12;
  size_t v13;
  double v14;
  double v15;
  size_t v16;
  double v17;
  double v18;
  size_t v19;
  void *v20;
  CGContext *v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  UIEdgeInsets result;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = CGImageGetWidth(a3);
  v13 = CGImageGetHeight(a3);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v14 = CGRectGetWidth(v40);
  v15 = (double)v12;
  if (v14 > (double)v12)
    v14 = (double)v12;
  v16 = (unint64_t)v14;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v17 = CGRectGetHeight(v41);
  v18 = (double)v13;
  if (v17 > (double)v13)
    v17 = (double)v13;
  v19 = (unint64_t)v17;
  v20 = malloc_type_calloc((unint64_t)v17 * v16, 1uLL, 0x100004077774924uLL);
  v21 = CGBitmapContextCreate(v20, v16, v19, 8uLL, v16, 0, 7u);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v22 = -CGRectGetMinX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v44.origin.y = -(v18 - CGRectGetMaxY(v43));
  v44.origin.x = v22;
  v44.size.width = v15;
  v44.size.height = v18;
  CGContextDrawImage(v21, v44, a3);
  objc_msgSend(a1, "_transparencyInsetsForUInt8AlphaContext:requiringFullOpacity:", v21, v5);
  v24 = v23;
  v26 = v25;
  v39 = v27;
  v29 = v28;
  CGContextRelease(v21);
  free(v20);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v30 = v26 + CGRectGetMinX(v45);
  v31 = (double)CGImageGetWidth(a3);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v32 = v29 + v31 - CGRectGetMaxX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v33 = v24 + CGRectGetMinY(v47);
  v34 = (double)CGImageGetHeight(a3);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v35 = v39 + v34 - CGRectGetMaxY(v48);
  v36 = v33;
  v37 = v30;
  v38 = v32;
  result.right = v38;
  result.bottom = v35;
  result.left = v37;
  result.top = v36;
  return result;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3
{
  return (id)objc_msgSend(a1, "trimmedImageByTrimmingTransparentPixelsFromImage:requiringFullOpacity:", a3, 0);
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  id v9;
  id v11;
  CGImage *v12;
  size_t Width;
  size_t Height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  CGImage *v26;
  uint64_t v27;
  CGRect v28;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  if (v7 >= 2.0 && (objc_msgSend(v6, "size"), v8 >= 2.0))
  {
    v11 = objc_retainAutorelease(v6);
    v12 = (CGImage *)objc_msgSend(v11, "CGImage");
    Width = CGImageGetWidth(v12);
    Height = CGImageGetHeight(v12);
    objc_msgSend(v11, "scale");
    v16 = v15;
    objc_msgSend(a1, "transparencyInsetsForImage:requiringFullOpacity:", v12, v4);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v9 = v11;
    if (v18 != 0.0 || v22 != 0.0 || v20 != 0.0 || v24 != 0.0)
    {
      v28.origin.x = v20 + 0.0;
      v28.origin.y = v18 + 0.0;
      v28.size.width = (double)Width - (v20 + v24);
      v28.size.height = (double)Height - (v18 + v22);
      v26 = CGImageCreateWithImageInRect(v12, v28);
      v25 = v16;
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v26, objc_msgSend(v9, "imageOrientation"), v25);
      v27 = objc_claimAutoreleasedReturnValue();

      CGImageRelease(v26);
      v9 = (id)v27;
    }
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

@end
