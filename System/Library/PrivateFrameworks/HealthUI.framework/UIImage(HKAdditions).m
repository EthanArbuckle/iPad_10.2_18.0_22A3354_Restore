@implementation UIImage(HKAdditions)

- (double)hk_scaledImageViewHeightWithScaledWidth:()HKAdditions
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "size");
  v5 = v4;
  objc_msgSend(a1, "size");
  return HKUICeilToScreenScale(a2 / (v5 / v6));
}

- (id)hk_croppedImageWithRect:()HKAdditions
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGImage *v16;
  CGImage *v17;
  void *v18;
  double v19;
  void *v20;
  CGRect v22;

  objc_msgSend(a1, "scale");
  if (v10 > 1.0)
  {
    objc_msgSend(a1, "scale");
    a2 = a2 * v11;
    objc_msgSend(a1, "scale");
    a3 = a3 * v12;
    objc_msgSend(a1, "scale");
    a4 = a4 * v13;
    objc_msgSend(a1, "scale");
    a5 = a5 * v14;
  }
  v15 = objc_retainAutorelease(a1);
  v16 = (CGImage *)objc_msgSend(v15, "CGImage");
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  v17 = CGImageCreateWithImageInRect(v16, v22);
  v18 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v15, "scale");
  objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v17);
  return v20;
}

- (id)hk_watchIconImage
{
  double v2;
  CGFloat v3;
  CGFloat v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  CGImage *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGContext *CurrentContext;
  id v18;
  CGFloat v19;
  void *v20;
  CGAffineTransform v22;
  CGSize v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "size");
  v24.size.height = v4;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v3;
  v25 = CGRectIntegral(v24);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v9 = objc_retainAutorelease(a1);
  v10 = (CGImage *)objc_msgSend(v9, "CGImage");
  objc_msgSend(v9, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "scale");
  v16 = v15;
  v23.width = v12;
  v23.height = v14;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v16);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v18, "CGPath"));

  CGContextClip(CurrentContext);
  objc_msgSend(v9, "size");
  v22.b = 0.0;
  v22.c = 0.0;
  v22.a = 1.0;
  *(_OWORD *)&v22.d = xmmword_1D7B81BC0;
  v22.ty = v19;
  CGContextConcatCTM(CurrentContext, &v22);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  CGContextDrawImage(CurrentContext, v26, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v20;
}

- (id)hk_resizedInterfaceImageWithSize:()HKAdditions
{
  void *v6;
  void *v7;
  _QWORD v9[7];

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__UIImage_HKAdditions__hk_resizedInterfaceImageWithSize___block_invoke;
  v9[3] = &unk_1E9C42D90;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  objc_msgSend(v6, "imageWithActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hk_transparentInterfaceImageWithSize:()HKAdditions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a1, a2);
  objc_msgSend(v2, "imageWithActions:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)hk_disclosureChevronImage
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
}

+ (id)hk_arrowMoveImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("arrow_move"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_arrowExerciseImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("arrow_exercise"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_arrowStandImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("arrow_stand"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_medicationsSymbolImage
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pills.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "hk_medicationTrackingSymbolConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageByApplyingSymbolConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hk_hearingHealthAudioExposureSymbolForClassification:()HKAdditions font:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = a4;
  objc_msgSend(v5, "hk_chartCurrentValueValueFont");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3888];
  if (v7 == v6)
  {
    objc_msgSend(v6, "pointSize");
    v11 = v10;

    objc_msgSend(v8, "configurationWithPointSize:weight:scale:", 4, 1, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_hearingHealthAudioExposureBackground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_hearingHealthAudioExposureColorForClassification:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPaletteColors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v16 = CFSTR("checkmark.circle.fill");
  }
  else
  {
    if (a3 != 2)
    {
      v17 = 0;
      goto LABEL_10;
    }
    v16 = CFSTR("exclamationmark.triangle.fill");
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(v17, "imageByApplyingSymbolConfiguration:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
