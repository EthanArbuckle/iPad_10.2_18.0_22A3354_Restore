@implementation UIImage(CUIKPlatforms)

+ (uint64_t)cuik_resizableImageFromOriginalImage:()CUIKPlatforms withCapInsets:resizingMode:
{
  return objc_msgSend(a3, "resizableImageWithCapInsets:resizingMode:", a4);
}

+ (id)cuik_drawImageWithSize:()CUIKPlatforms drawBlock:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setScale:", CUIKScaleFactor());
  objc_msgSend(v8, "setOpaque:", 0);
  objc_msgSend(v8, "setPreferredRange:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v8, a1, a2);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__UIImage_CUIKPlatforms__cuik_drawImageWithSize_drawBlock___block_invoke;
  v13[3] = &unk_1E6EB72A8;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "imageWithActions:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)cuik_stripedImageWithBackgroundColor:()CUIKPlatforms stripeColor:scale:
{
  CGImageRef v6;
  void *v7;

  v6 = CUIKCreateStripedImage(a4, a5, a1);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v6);
  return v7;
}

+ (uint64_t)cuik_imageFromISImage:()CUIKPlatforms
{
  void *v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  v5 = objc_msgSend(v4, "CGImage");
  objc_msgSend(v4, "scale");
  v7 = v6;

  return objc_msgSend(v3, "imageWithCGImage:scale:orientation:", v5, 0, v7);
}

- (id)cuik_imageWithInsets:()CUIKPlatforms
{
  double v10;
  double v11;
  double v12;
  _QWORD v14[7];

  objc_msgSend(a1, "size");
  v11 = a5 + a3 + v10;
  objc_msgSend(a1, "size");
  v14[1] = 3221225472;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __47__UIImage_CUIKPlatforms__cuik_imageWithInsets___block_invoke;
  v14[3] = &unk_1E6EB72D0;
  v14[4] = a1;
  *(double *)&v14[5] = a3;
  *(double *)&v14[6] = a2;
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_drawImageWithSize:drawBlock:", v14, v11, a4 + a2 + v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)cuik_imageWithTintColor:()CUIKPlatforms asTemplate:
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 1;
  return objc_msgSend(a1, "imageWithTintColor:renderingMode:", a3, v4);
}

@end
