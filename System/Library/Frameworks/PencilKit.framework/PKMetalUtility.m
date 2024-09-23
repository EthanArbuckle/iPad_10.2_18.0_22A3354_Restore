@implementation PKMetalUtility

+ (double)layerContentsScale
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeScale");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PaperKit.MarkupPhotoEditingExtension"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.quicklook.extension.previewUI")))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.quicklook.UIExtension"));

      if (!v12)
        return v4;
    }
  }
  if (PKIsPhoneDevice() && v4 > 2.0)
    return 2.0;
  return v4;
}

+ (BOOL)isMetalAvailable
{
  return 1;
}

+ (BOOL)deviceSupportsFramebufferFetch:(id)a3
{
  return objc_msgSend(a3, "supportsFamily:", 1001);
}

+ (id)defaultDevice
{
  return MTLCreateSystemDefaultDevice();
}

+ (CGSize)clampedPixelSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width > 8192.0)
  {
    a3.height = round(a3.height * 8192.0 / a3.width);
    a3.width = 8192.0;
  }
  if (a3.height > 8192.0)
  {
    a3.width = round(a3.width * 8192.0 / a3.height);
    a3.height = 8192.0;
  }
  v3 = round(a3.width);
  if (v3 < 1.0)
    v3 = 1.0;
  v4 = round(a3.height);
  if (v4 < 1.0)
    v4 = 1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)deviceSupportsMemorylessFramebuffers:(id)a3
{
  return objc_msgSend(a3, "supportsFamily:", 1001);
}

+ (id)textureFromImage:(CGImage *)a3 device:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CC6C40];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDevice:", v6);

  v8 = *MEMORY[0x1E0CC6C10];
  v13[0] = *MEMORY[0x1E0CC6C18];
  v13[1] = v8;
  v14[0] = &unk_1E77EBBB0;
  v14[1] = &unk_1E77EBBC8;
  v13[2] = *MEMORY[0x1E0CC6BF8];
  v14[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = (void *)objc_msgSend(v7, "newTextureWithCGImage:options:error:", a3, v9, &v12);

  return v10;
}

+ (CGAffineTransform)transformConvertingRect:(SEL)a3 toRect:(CGRect)a4 percent:(CGRect)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform *result;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  height = a5.size.height;
  width = a5.size.width;
  v8 = a4.size.height;
  v9 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = DKDSubtractPoints(a5.origin.x, a5.origin.y, a4.origin.x);
  v15 = DKDMultiplyPointScalar(v13, v14, a6);
  v16 = MEMORY[0x1E0C9BAA8];
  v17 = *MEMORY[0x1E0C9BAA8];
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v18;
  v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)&retstr->tx = v19;
  *(_OWORD *)&v29.a = v17;
  *(_OWORD *)&v29.c = v18;
  *(_OWORD *)&v29.tx = v19;
  CGAffineTransformTranslate(retstr, &v29, v15, v20);
  v21 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v21;
  *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v29, &v28, x, y);
  v22 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v22;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
  v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v23;
  *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v29, &v28, 1.0 - a6 + width / v9 * a6, 1.0 - a6 + height / v8 * a6);
  v24 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v24;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
  v25 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v25;
  *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v29, &v28, -x, -y);
  v27 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v27;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
  return result;
}

@end
