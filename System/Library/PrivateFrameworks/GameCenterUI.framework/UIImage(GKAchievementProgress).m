@implementation UIImage(GKAchievementProgress)

- (id)_gkQuestionMarkImage
{
  if (_gkQuestionMarkImage_onceToken != -1)
    dispatch_once(&_gkQuestionMarkImage_onceToken, &__block_literal_global_51);
  return (id)_gkQuestionMarkImage_sImage;
}

- (id)_gkMaskImageWithProgress:()GKAchievementProgress isDetail:
{
  void *v5;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGSize v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (a2 <= 0.999)
  {
    if (_gkMaskImageWithProgress_isDetail__onceToken != -1)
      dispatch_once(&_gkMaskImageWithProgress_isDetail__onceToken, &__block_literal_global_1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d~%g"), a4, *(_QWORD *)&a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)_gkMaskImageWithProgress_isDetail__sMaskCache;
    objc_sync_enter(v9);
    objc_msgSend((id)_gkMaskImageWithProgress_isDetail__sMaskCache, "objectForKey:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "size");
      v11 = v10;
      v13 = v12;
      objc_msgSend(a1, "scale");
      v15 = v14;
      v30.width = v11;
      v30.height = v13;
      UIGraphicsBeginImageContextWithOptions(v30, 0, v15);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "set");

      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, v11, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fill");
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.width = v11;
      v31.size.height = v13;
      v32 = CGRectInset(v31, 1.5, 1.5);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      if (a2 <= 0.01)
      {
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fillWithBlendMode:alpha:", 16, 1.0);
        objc_msgSend(a1, "_gkQuestionMarkImage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "size");
        objc_msgSend(v26, "drawInRect:", round(x + (width - v27) * 0.5), round(y + (height - v28) * 0.5), v27);

      }
      else
      {
        MidX = CGRectGetMidX(v32);
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        MidY = CGRectGetMidY(v33);
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "moveToPoint:", MidX, MidY);
        v25 = width * 0.5;
        objc_msgSend(v24, "addLineToPoint:", MidX, MidY - v25);
        objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, MidY, v25, -1.57079633, (a2 + a2) * 3.14159265 + -1.57079633);
        objc_msgSend(v24, "addLineToPoint:", MidX, MidY);
        objc_msgSend(v24, "closePath");
        objc_msgSend(v24, "fillWithBlendMode:alpha:", 16, 1.0);
      }

      UIGraphicsGetImageFromCurrentImageContext();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_gkMaskImageWithProgress_isDetail__sMaskCache, "setObject:forKey:", v5, v8);
      UIGraphicsEndImageContext();

    }
    objc_sync_exit(v9);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_gkImageWithProgress:()GKAchievementProgress achievement:isDetail:
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  CGContext *CurrentContext;
  id v17;
  CGImage *v18;
  id v19;
  CGImage *v20;
  void *v21;
  CGSize v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v7 = a1;
  v8 = v7;
  if (a2 <= 0.999)
  {
    objc_msgSend(v7, "size");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "_gkMaskImageWithProgress:isDetail:", a5, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v15 = v14;
    v23.width = v10;
    v23.height = v12;
    UIGraphicsBeginImageContextWithOptions(v23, 0, v15);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextTranslateCTM(CurrentContext, 0.0, v12);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v17 = objc_retainAutorelease(v13);
    v18 = (CGImage *)objc_msgSend(v17, "CGImage");
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v10;
    v24.size.height = v12;
    CGContextClipToMask(CurrentContext, v24, v18);
    v19 = objc_retainAutorelease(v8);
    v20 = (CGImage *)objc_msgSend(v19, "CGImage");

    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v10;
    v25.size.height = v12;
    CGContextDrawImage(CurrentContext, v25, v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "set");

    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = v10;
    v26.size.height = v12;
    UIRectFillUsingBlendMode(v26, kCGBlendModeNormal);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v8;
}

@end
