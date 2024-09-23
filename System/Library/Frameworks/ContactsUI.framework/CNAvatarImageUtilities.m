@implementation CNAvatarImageUtilities

+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t Width;
  uint64_t v7;
  id v8;
  uint64_t Height;
  unsigned __int8 *v10;
  CGContext *v11;
  id v12;
  CGImage *v13;
  _WORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  _WORD *v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t i;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  UIEdgeInsets result;

  v4 = a4;
  v5 = objc_retainAutorelease(a3);
  Width = CGImageGetWidth((CGImageRef)objc_msgSend(v5, "CGImage"));
  v7 = Width;
  v8 = objc_retainAutorelease(v5);
  Height = CGImageGetHeight((CGImageRef)objc_msgSend(v8, "CGImage"));
  v10 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v11 = CGBitmapContextCreate(v10, Width, Height, 8uLL, Width, 0, 7u);
  v12 = objc_retainAutorelease(v8);
  v13 = (CGImage *)objc_msgSend(v12, "CGImage");
  v38.size.width = (double)Width;
  v38.size.height = (double)Height;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  CGContextDrawImage(v11, v38, v13);
  v14 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  v15 = malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  v16 = v15;
  if (Height <= 0)
  {
    v25 = *MEMORY[0x1E0DC49E8];
    v26 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v17 = 0;
    v18 = v10;
    do
    {
      v19 = v18;
      v20 = v15;
      v21 = Width;
      if (Width >= 1)
      {
        while (1)
        {
          v23 = *v19++;
          v22 = v23;
          if (v4)
            break;
          if (v22)
            goto LABEL_8;
LABEL_9:
          ++v20;
          if (!--v21)
            goto LABEL_10;
        }
        if (v22 != 255)
          goto LABEL_9;
LABEL_8:
        ++v14[v17];
        ++*v20;
        goto LABEL_9;
      }
LABEL_10:
      ++v17;
      v18 += Width;
    }
    while (v17 != Height);
    v24 = 0;
    v25 = *MEMORY[0x1E0DC49E8];
    v26 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    while (!v14[v24])
    {
      if (Height == ++v24)
        goto LABEL_17;
    }
    v25 = (double)v24;
  }
LABEL_17:
  v29 = Height;
  while (1)
  {
    v30 = v29;
    v31 = v29-- < 1;
    if (v31)
      break;
    if (v14[v30 - 1])
    {
      v27 = (double)((Height - v30) & ~((Height - v30) >> 63));
      break;
    }
  }
  if (Width < 1)
    goto LABEL_27;
  for (i = 0; i != Width; ++i)
  {
    if (*((_WORD *)v15 + i))
    {
      v26 = (double)i;
      break;
    }
  }
LABEL_27:
  while (1)
  {
    v33 = v7;
    v31 = v7-- < 1;
    if (v31)
      break;
    if (*((_WORD *)v15 + v33 - 1))
    {
      v28 = (double)((Width - v33) & ~((Width - v33) >> 63));
      break;
    }
  }
  free(v10);
  free(v16);
  free(v14);
  CGContextRelease(v11);

  v34 = v25;
  v35 = v26;
  v36 = v27;
  v37 = v28;
  result.right = v37;
  result.bottom = v36;
  result.left = v35;
  result.top = v34;
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
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  CGImage *v29;
  CGImage *v30;
  void *v31;
  double v32;
  CGRect v33;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  if (v7 >= 2.0 && (objc_msgSend(v6, "size"), v8 >= 2.0))
  {
    objc_msgSend(v6, "size");
    v12 = v11;
    objc_msgSend(v6, "scale");
    v14 = v13;
    objc_msgSend(v6, "size");
    v16 = v15;
    objc_msgSend(v6, "scale");
    v18 = v17;
    objc_msgSend(a1, "transparencyInsetsForImage:requiringFullOpacity:", v6, v4);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = v6;
    v9 = v27;
    if (v20 != 0.0 || v24 != 0.0 || v22 != 0.0 || v26 != 0.0)
    {
      v28 = objc_retainAutorelease(v27);
      v29 = (CGImage *)objc_msgSend(v28, "CGImage");
      v33.origin.x = v22 + 0.0;
      v33.origin.y = v20 + 0.0;
      v33.size.width = v12 * v14 - (v22 + v26);
      v33.size.height = v16 * v18 - (v20 + v24);
      v30 = CGImageCreateWithImageInRect(v29, v33);
      v31 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v28, "scale");
      objc_msgSend(v31, "imageWithCGImage:scale:orientation:", v30, objc_msgSend(v28, "imageOrientation"), v32);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v30);
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
  objc_msgSend(a1, "croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a3;
  objc_msgSend(v11, "size");
  v13 = v12 * a5;
  objc_msgSend(v11, "size");
  v15 = v14;
  v16 = objc_alloc_init(MEMORY[0x1E0DC3830]);
  objc_msgSend(v16, "setOpaque:", 0);
  objc_msgSend(v11, "scale");
  objc_msgSend(v16, "setScale:");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v16, v13, v15);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__CNAvatarImageUtilities_croppedAndCenteredAvatarImageForImage_usingTransparencyInsets_widthMultiplier___block_invoke;
  v21[3] = &unk_1E20485B8;
  v23 = top;
  v24 = left;
  v25 = bottom;
  v26 = right;
  v22 = v11;
  v28 = 0;
  v29 = 0;
  v27 = a1;
  v30 = v13;
  v31 = v15;
  v18 = v11;
  objc_msgSend(v17, "imageWithActions:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)paddedImage:(id)a3 withPadding:(double)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3830]);
  objc_msgSend(v6, "setOpaque:", 0);
  objc_msgSend(v5, "scale");
  objc_msgSend(v6, "setScale:");
  objc_msgSend(v5, "size");
  v8 = v7 + a4 * 2.0;
  objc_msgSend(v5, "size");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v6, v8, v9 + a4 * 2.0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__CNAvatarImageUtilities_paddedImage_withPadding___block_invoke;
  v14[3] = &unk_1E2049178;
  v15 = v5;
  v11 = v5;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __50__CNAvatarImageUtilities_paddedImage_withPadding___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double MidX;
  double v6;
  double v7;
  void *v8;
  double MidY;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "format");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  MidX = CGRectGetMidX(v12);
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7 = MidX - v6 * 0.5;
  objc_msgSend(v4, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  MidY = CGRectGetMidY(v13);
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v3, "drawAtPoint:", v7, MidY - v10 * 0.5);

}

void __104__CNAvatarImageUtilities_croppedAndCenteredAvatarImageForImage_usingTransparencyInsets_widthMultiplier___block_invoke(uint64_t a1)
{
  id v2;
  double MidX;
  double v4;
  double v5;
  double MidY;
  double v7;
  id v8;

  if (*(double *)(a1 + 56) == 0.0)
  {
    v2 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "trimmedImageByTrimmingTransparentPixelsFromImage:", *(_QWORD *)(a1 + 32));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v2;
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 80));
  objc_msgSend(v8, "size");
  v5 = MidX - v4 * 0.5;
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 80));
  objc_msgSend(v8, "size");
  objc_msgSend(v8, "drawAtPoint:", v5, MidY - v7 * 0.5);

}

@end
