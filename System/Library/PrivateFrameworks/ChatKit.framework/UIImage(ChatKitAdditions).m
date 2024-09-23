@implementation UIImage(ChatKitAdditions)

+ (uint64_t)ckImageNamed:()ChatKitAdditions
{
  return objc_msgSend(a1, "ckImageNamed:compatibleWithTraitCollection:", a3, 0);
}

+ (id)ckImageNamed:()ChatKitAdditions compatibleWithTraitCollection:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a4;
  v7 = a3;
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ckColorImageOfSize:()ChatKitAdditions withColor:
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a1;
  v13.height = a2;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a1;
  v14.size.height = a2;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

+ (id)abImageNamed:()ChatKitAdditions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = abImageNamed__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&abImageNamed__onceToken, &__block_literal_global_48);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v4, abImageNamed__sABBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ckImageWithData:()ChatKitAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0CEA638];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithData:preserveScale:cache:", v4, 1, 1);

  v6 = (void *)MEMORY[0x1E0CEA638];
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGImage");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, objc_msgSend(v7, "imageOrientation"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)__ck_resizableBalloonWithBalloonDescriptor:()ChatKitAdditions framed:
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;

  objc_msgSend(a1, "__ck_imageWithOrientation:", 4 * (a3[3] == 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "capInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (a3[73])
    v16 = a3[1];
  else
    v16 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonMaskAlignmentRectInsetsWithTailShape:", v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  if (a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "balloonMaskFrameInsetsWithBalloonShape:", *a3);
    v9 = v9 + v27;
    v11 = v11 + v28;
    v13 = v13 + v29;
    v15 = v15 + v30;

  }
  objc_msgSend(v7, "resizableImageWithCapInsets:", v9, v11, v13, v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "imageWithAlignmentRectInsets:", v19, v21, v23, v25);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)__ck_imageWithOrientation:()ChatKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  if (objc_msgSend(v4, "imageOrientation") != a3)
  {
    objc_msgSend(v4, "images");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v40 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "__ck_imageWithOrientation:", a3, (_QWORD)v39);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v9);
      }

      v13 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v4, "duration");
      objc_msgSend(v13, "animatedImageWithImages:duration:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CEA638]);
      v16 = objc_retainAutorelease(v4);
      v17 = objc_msgSend(v16, "CGImage");
      objc_msgSend(v16, "scale");
      v14 = (void *)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v17, a3);

    }
    objc_msgSend(v4, "capInsets", (_QWORD)v39);
    v21 = *MEMORY[0x1E0CEB4B0];
    v22 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v23 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v24 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    if (v25 != v22 || v18 != v21 || v20 != v24 || v19 != v23)
    {
      objc_msgSend(v14, "resizableImageWithCapInsets:");
      v29 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v29;
    }
    objc_msgSend(v4, "alignmentRectInsets");
    if (v33 != v22 || v30 != v21 || v32 != v24 || v31 != v23)
    {
      objc_msgSend(v14, "imageWithAlignmentRectInsets:");
      v37 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v37;
    }

    v4 = v14;
  }
  return v4;
}

- (double)__ck_contentsCenter
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "capInsets");
  v5 = v4 / v3;
  if (v3 == 0.0)
    return 0.0;
  else
    return v5;
}

- (__CFData)__ck_ASTCRepresentation
{
  __CFData *v2;
  CGImageDestination *v3;
  CGImage *v4;

  v2 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (__ck_ASTCRepresentation_onceToken != -1)
    dispatch_once(&__ck_ASTCRepresentation_onceToken, &__block_literal_global_411_0);
  v3 = CGImageDestinationCreateWithData(v2, CFSTR("com.apple.atx"), 1uLL, 0);
  v4 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  CGImageDestinationAddImage(v3, v4, (CFDictionaryRef)__ck_ASTCRepresentation_imageProperties);
  CGImageDestinationFinalize(v3);
  CFRelease(v3);
  return v2;
}

- (id)ck_imageCroppedToCircle
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "size");
  if (v3 >= v4)
    v3 = v4;
  objc_msgSend(a1, "size");
  v6 = (v3 - v5) * 0.5;
  objc_msgSend(a1, "size");
  v8 = (v3 - v7) * 0.5;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v3;
  v20.size.height = v3;
  v21 = CGRectInset(v20, v6, v8);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  v19.width = width;
  v19.height = height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v15);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v3 * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addClip");

  objc_msgSend(a1, "drawInRect:", x, y, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v17;
}

- (void)decode
{
  void *result;

  result = (void *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (result)
    return (void *)objc_msgSend(result, "CA_prepareRenderValue");
  return result;
}

- (uint64_t)ckImageWithTintColor:()ChatKitAdditions
{
  return objc_msgSend(a1, "ckImageWithTintColor:insets:traitCollection:", a3, 0, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
}

- (id)ckImageWithTintColor:()ChatKitAdditions insets:traitCollection:
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v14 = a7;
  v15 = a8;
  objc_msgSend(a1, "size");
  v17 = v16;
  v19 = v18;
  if (v15)
    objc_msgSend(MEMORY[0x1E0CEA618], "formatForTraitCollection:", v15);
  else
    objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v20, a3 + a5 + v17, a2 + a4 + v19);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__UIImage_ChatKitAdditions__ckImageWithTintColor_insets_traitCollection___block_invoke;
  v25[3] = &unk_1E274E318;
  v27 = a2;
  v28 = a3;
  v29 = a4;
  v30 = a5;
  v25[4] = a1;
  v26 = v14;
  v22 = v14;
  objc_msgSend(v21, "imageWithActions:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ckImageNamed:()ChatKitAdditions withTintColor:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "ckImageWithTintColor:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

+ (id)ckTemplateImageNamed:()ChatKitAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ckImageNamed:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithRenderingMode:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "__ck_actionImageForSubscriptionShortName:isFilled:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions isFilled:
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  CGSize v34;

  v5 = (objc_class *)MEMORY[0x1E0CEABB0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 0.0, 17.0, 17.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(v9, "setText:", v6);
  if ((a4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v11);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v12);

    objc_msgSend(v9, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

    objc_msgSend(v9, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 3.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v15);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v16);

    objc_msgSend(v9, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMasksToBounds:", 1);

    objc_msgSend(v9, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 3.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "CGColor");
    objc_msgSend(v9, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderColor:", v20);

    objc_msgSend(v9, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", 1.5);
  }

  objc_msgSend(v9, "intrinsicContentSize");
  v23 = v22 + 7.0;
  if (v22 + 7.0 > 17.0)
  {
    v24 = v22 + 10.0;
    if (v24 <= 25.0)
      v25 = 25.0;
    else
      v25 = v24;
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v25, v25);
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v23, 17.0);
  }
  objc_msgSend(v7, "center");
  objc_msgSend(v9, "setCenter:");
  objc_msgSend(v7, "addSubview:", v9);
  objc_msgSend(v7, "bounds");
  v34.width = v26;
  v34.height = v27;
  UIGraphicsBeginImageContextWithOptions(v34, 0, 0.0);
  objc_msgSend(v7, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v30 = (void *)MEMORY[0x1E0CEA638];
  v31 = objc_retainAutorelease(v29);
  objc_msgSend(v30, "imageWithCGImage:scale:orientation:", objc_msgSend(v31, "CGImage"), 0, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
