@implementation SUUIProductImageDataConsumer

+ (id)consumerWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;

  height = a3.height;
  width = a3.width;
  result = (id)objc_msgSend(a1, "consumer");
  *((CGFloat *)result + 2) = width;
  *((CGFloat *)result + 3) = height;
  return result;
}

+ (id)gridConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4052C00000000000uLL);
  return result;
}

+ (id)lockupConsumerWithSize:(int64_t)a3 itemKind:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "consumer");
  v6 = objc_claimAutoreleasedReturnValue();
  *(double *)(v6 + 16) = SUUILockupImageSizeForLockupSize(a3, a4);
  *(_QWORD *)(v6 + 24) = v7;
  return (id)v6;
}

+ (id)cardConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 72.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)chartsConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if (v4 == 1)
    v5 = 67.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)updatesConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 57.0;
  if (v4 == 1)
    v5 = 72.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)purchasedConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 57.0;
  if (v4 == 1)
    v5 = 72.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)productPageConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 100.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 170.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)swooshConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 72.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 90.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)giftComposeConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4052C00000000000uLL);
  return result;
}

+ (id)giftComposeLetterboxConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((_OWORD *)result + 1) = xmmword_241EFB9E0;
  return result;
}

+ (id)giftComposePosterConsumer
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "consumer");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = qword_241EFB9F0[(v4 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)giftThemeConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x404C800000000000uLL);
  return result;
}

+ (id)giftThemeLetterboxConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((_OWORD *)result + 1) = xmmword_241EFBA00;
  return result;
}

+ (id)giftThemePosterConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x404C800000000000uLL);
  return result;
}

+ (id)giftResultConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 72.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 144.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)smartBannerConsumer
{
  double *v2;
  void *v3;
  uint64_t v4;
  double v5;

  objc_msgSend(a1, "consumer");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 64.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 75.0;
  v2[2] = v5;
  v2[3] = v5;
  return v2;
}

+ (id)wishlistConsumer
{
  id result;

  result = (id)objc_msgSend(a1, "consumer");
  *((int64x2_t *)result + 1) = vdupq_n_s64(0x4050000000000000uLL);
  return result;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)imageForColor:(id)a3
{
  return -[SUUIProductImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_iconSize.width, self->_iconSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  SUUIColorScheme *colorScheme;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];

  height = a4.height;
  width = a4.width;
  v34[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = 0;
  if (width > 0.0 && height > 0.0)
  {
    v33 = 0uLL;
    v32 = 0u;
    v31 = 0u;
    SUUIIconFrameForIconSize((double *)&v33, (double *)&v31, width, height, self->_iconSize.width, self->_iconSize.height, 0.0);
    colorScheme = self->_colorScheme;
    v29 = 0;
    v30 = 0;
    v28 = 0;
    SUUIIconColorsForColorScheme(colorScheme, &v30, &v29, &v28);
    v10 = v30;
    v11 = v29;
    v12 = v28;
    v13 = objc_retainAutorelease(v10);
    v34[0] = objc_msgSend(v13, "CGColor");
    v14 = objc_retainAutorelease(v11);
    v34[1] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBounds:", v31, v32);
    objc_msgSend(v16, "setColors:", v15);
    objc_msgSend(v16, "setLocations:", &unk_2512EE9B8);
    objc_msgSend(MEMORY[0x24BEBD620], "preferredFormat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    objc_msgSend(v17, "setScale:");

    v19 = objc_alloc(MEMORY[0x24BEBD618]);
    v20 = (void *)objc_msgSend(v19, "initWithSize:format:", v17, v33);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __51__SUUIProductImageDataConsumer_imageForColor_size___block_invoke;
    v23[3] = &unk_2511F5720;
    v25 = v33;
    v26 = v31;
    v27 = v32;
    v23[4] = self;
    v24 = v16;
    v21 = v16;
    objc_msgSend(v20, "imageWithActions:", v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __51__SUUIProductImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v5)
    objc_msgSend(v5, "setFill");
  objc_msgSend(v6, "clipToRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v6, "fillRect:", 0.0, 0.0, v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "renderInContext:", objc_msgSend(v6, "CGContext"));

}

- (id)imageForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  SUUIColorScheme *colorScheme;
  id v8;
  BOOL v9;
  void *v10;
  CGFloat v11;
  UIColor *backgroundColor;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  CGSize v18;
  CGRect v19;

  v4 = a3;
  v18.width = 0.0;
  v18.height = 0.0;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "size");
  SUUIIconFrameForIconSize(&v18.width, (double *)&v16, v5, v6, self->_iconSize.width, self->_iconSize.height, 0.0);
  colorScheme = self->_colorScheme;
  v15 = 0;
  SUUIIconColorsForColorScheme(colorScheme, 0, 0, &v15);
  v8 = v15;
  v9 = self->_backgroundColor != 0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  UIGraphicsBeginImageContextWithOptions(v18, v9, v11);

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    -[UIColor set](backgroundColor, "set");
    v19.size.width = v18.width;
    v19.size.height = v18.height;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    UIRectFill(v19);
  }
  objc_msgSend(v4, "drawInRect:", v16, v17);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_backgroundColor);
  objc_storeStrong((id *)(v4 + 32), self->_colorScheme);
  *(CGSize *)(v4 + 16) = self->_iconSize;
  return (id)v4;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
