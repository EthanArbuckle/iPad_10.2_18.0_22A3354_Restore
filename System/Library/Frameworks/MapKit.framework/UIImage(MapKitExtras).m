@implementation UIImage(MapKitExtras)

+ (id)_mapkit_imageNamed:()MapKitExtras
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CEA638];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "_mapkitBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_mapkit_imageNamed:()MapKitExtras compatibleWithTraitCollection:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "_mapkitBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_mapkit_dimmedImage
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGContext *CurrentContext;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  CGImage *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGSize v21;
  CGRect v22;
  CGRect v23;

  objc_msgSend(a1, "size");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "scale");
  v7 = v6;
  v21.width = v3;
  v21.height = v5;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(a1, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, v9);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(a1, "size");
  v11 = v10;
  objc_msgSend(a1, "size");
  v13 = v12;
  v14 = objc_retainAutorelease(a1);
  v15 = (CGImage *)objc_msgSend(v14, "CGImage");
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v11;
  v22.size.height = v13;
  CGContextDrawImage(CurrentContext, v22, v15);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 0.0, 0.199999988);
  objc_msgSend(v14, "size");
  v17 = v16;
  objc_msgSend(v14, "size");
  v23.size.height = v18;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v17;
  CGContextFillRect(CurrentContext, v23);
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v19;
}

- (id)_mapkit_horizontallyFlippedImage
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGContext *CurrentContext;
  CGFloat v9;
  void *v10;
  CGAffineTransform v12;
  CGSize v13;

  objc_msgSend(a1, "size");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "scale");
  v7 = v6;
  v13.width = v3;
  v13.height = v5;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(a1, "size");
  v12.a = -1.0;
  v12.b = 0.0;
  v12.c = 0.0;
  v12.d = 1.0;
  v12.tx = v9;
  v12.ty = 0.0;
  CGContextConcatCTM(CurrentContext, &v12);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v10;
}

- (id)_mapkit_templateImageWithTintColor:()MapKitExtras
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  double v19;
  double v20;

  v4 = a3;
  v5 = a1;
  v18 = *MEMORY[0x1E0C9D648];
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v6, v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__UIImage_MapKitExtras___mapkit_templateImageWithTintColor___block_invoke;
  v15[3] = &unk_1E20D8A98;
  v19 = v7;
  v20 = v9;
  v16 = v4;
  v17 = v5;
  v11 = v5;
  v12 = v4;
  objc_msgSend(v10, "imageWithActions:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_mapkit_imageWithAlpha:()MapKitExtras
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id v10;
  CGSize v12;

  if (a2 <= 0.0)
  {
    v10 = 0;
  }
  else if (a2 >= 1.0)
  {
    v10 = a1;
  }
  else
  {
    objc_msgSend(a1, "size");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "scale");
    v9 = v8;
    v12.width = v5;
    v12.height = v7;
    UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a2);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v10;
}

@end
