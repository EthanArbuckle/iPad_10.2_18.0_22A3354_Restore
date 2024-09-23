@implementation ASCOfferButton

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCOfferButton;
  v3 = *MEMORY[0x1E0DC4660] | -[ASCOfferButton accessibilityTraits](&v7, sel_accessibilityTraits) | *MEMORY[0x1E0DC46E0];
  v4 = -[ASCOfferButton isEnabled](self, "isEnabled");
  v5 = *MEMORY[0x1E0DC4698];
  if (v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[ASCOfferButton metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v3, "isIcon"))
  {
    v5 = v3;
    +[ASCOfferMetadata redownloadMetadata](ASCOfferMetadata, "redownloadMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v7)
    {
      v4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    ASCLocalizedString(CFSTR("AX_OFFER_BUTTON_LABEL_REDOWNLOAD"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v4 = (void *)v9;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isProgress"))
  {
    v11 = CFSTR("AX_OFFER_BUTTON_LABEL_LOADING");
LABEL_8:
    ASCLocalizedString(v11, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isText"))
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
    -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);

    }
    ASCAXLabelForElements(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "isPlaceholder") & 1) == 0)
  {
    if (objc_msgSend(v3, "isDeeplink"))
    {
      v11 = CFSTR("AX_OFFER_BUTTON_LABEL_DEEPLINK");
    }
    else
    {
      if (!objc_msgSend(v3, "isViewInAppStore"))
        ASCUnknownEnumCase(CFSTR("ASCOfferMetadata"), v3);
      v11 = CFSTR("AX_OFFER_BUTTON_LABEL_VIEW_IN_APP_STORE");
    }
    goto LABEL_8;
  }
LABEL_2:
  v4 = 0;
LABEL_18:

  return v4;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[ASCOfferButton metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isProgress"))
  {
    ASCLocalizedPlatformString(CFSTR("AX_OFFER_BUTTON_HINT_CANCEL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  id v3;
  void *v4;
  double v5;

  -[ASCOfferButton metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isProgress"))
  {
    v3 = v2;
    if ((objc_msgSend(v3, "isIndeterminate") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "percent");
      *(float *)&v5 = v5;
      ASCAXFormatFloatWithPercentage(0, *(float *)&v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityActivate
{
  int v3;

  v3 = -[ASCOfferButton isEnabled](self, "isEnabled");
  if (v3)
    -[ASCOfferButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  return v3;
}

- (id)accessibilityIdentifier
{
  return (id)ASCAXIdentifierWithSuffix((uint64_t)CFSTR("offerButton"));
}

- (void)setSize:(id)a3
{
  NSString *v5;
  char v6;
  NSString *v7;

  v7 = (NSString *)a3;
  v5 = self->_size;
  if (v7 && v5)
  {
    v6 = -[NSString isEqual:](v5, "isEqual:", v7);

    if ((v6 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v5 != v7)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_size, a3);
    -[ASCOfferButton updateImageStyleProperties](self, "updateImageStyleProperties");
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
    -[ASCOfferButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:

}

+ (id)smallTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  v6 = objc_msgSend(a3, "length");
  v7 = 0.0;
  if (v6 > 7)
    v7 = -4.0;
  if (v6 <= 0xC)
    v8 = v7;
  else
    v8 = -6.0;
  v9 = ASCFontPointSizesResolve(v5, v8 + 13.0, v8 + 15.0, v8 + 18.0, v8 + 18.0);

  if (!smallTitleFontForText_compatibleWithTraitCollection__titleFont
    || (objc_msgSend((id)smallTitleFontForText_compatibleWithTraitCollection__titleFont, "pointSize"), v10 != v9))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", v9, *MEMORY[0x1E0DC4B70]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)smallTitleFontForText_compatibleWithTraitCollection__titleFont;
    smallTitleFontForText_compatibleWithTraitCollection__titleFont = v11;

  }
  return (id)smallTitleFontForText_compatibleWithTraitCollection__titleFont;
}

+ (id)mediumTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC4B98], a4);
}

+ (id)viewInAppStoreTitleFontForText:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AB8], 0x8000, a4);
}

+ (id)titleFontForText:(void *)a3 fittingSize:(void *)a4 representingMetadata:(void *)a5 compatibleWithTraitCollection:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_self();
  if (objc_msgSend(v10, "isViewInAppStore"))
  {
    objc_msgSend(v12, "viewInAppStoreTitleFontForText:compatibleWithTraitCollection:", v8, v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v9, "isEqualToString:", 0x1E7565128))
  {
    objc_msgSend(v12, "mediumTitleFontForText:compatibleWithTraitCollection:", v8, v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", 0x1E7565188))
      ASCUnknownEnumCase(CFSTR("ASCOfferButtonSize"), v9);
    objc_msgSend(v12, "smallTitleFontForText:compatibleWithTraitCollection:", v8, v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)subtitleFontFittingSize:forTheme:compatibleWithTraitCollection:
{
  objc_opt_self();
  if (subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__onceToken != -1)
    dispatch_once(&subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__onceToken, &__block_literal_global_19);
  return (id)subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__subtitleFont;
}

void __81__ASCOfferButton_subtitleFontFittingSize_forTheme_compatibleWithTraitCollection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 8.0, *MEMORY[0x1E0DC4B90]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__subtitleFont;
  subtitleFontFittingSize_forTheme_compatibleWithTraitCollection__subtitleFont = v0;

}

+ (BOOL)adjustsTitleFontSizeToFitWidthForSize:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", 0x1E7565128);
}

+ (id)textBackgroundImageFittingSize:(void *)a3 forTheme:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  ASCImageRenderer *v16;
  _QWORD v18[5];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (textBackgroundImageFittingSize_forTheme__onceToken != -1)
    dispatch_once(&textBackgroundImageFittingSize_forTheme__onceToken, &__block_literal_global_4);
  v19[0] = v4;
  objc_msgSend(v5, "backgroundStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)textBackgroundImageFittingSize_forTheme__cache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[__ASCLayoutProxy offerButtonHeightForSize:](__ASCLayoutProxy, "offerButtonHeightForSize:", v4);
    v12 = v11 + 1.0;
    objc_msgSend(v5, "backgroundStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cornerRadiusForImageSize:stretchableArea:", v12, v12, 1.0);
    v15 = v14;

    v16 = -[ASCImageRenderer initWithSize:capInsets:renderingMode:]([ASCImageRenderer alloc], "initWithSize:capInsets:renderingMode:", 1, v12, v12, v15, v15, v15, v15);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke_2;
    v18[3] = &__block_descriptor_40_e54_v48__0_CGRect__CGPoint_dd__CGSize_dd__8__CGContext__40l;
    *(double *)&v18[4] = v15;
    -[ASCImageRenderer imageWithActions:](v16, "imageWithActions:", v18);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)textBackgroundImageFittingSize_forTheme__cache, "setObject:forKey:", v10, v7);

  }
  return v10;
}

uint64_t __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)textBackgroundImageFittingSize_forTheme__cache;
  textBackgroundImageFittingSize_forTheme__cache = (uint64_t)v0;

  objc_msgSend((id)textBackgroundImageFittingSize_forTheme__cache, "setName:", CFSTR("Text background image cache"));
  return objc_msgSend((id)textBackgroundImageFittingSize_forTheme__cache, "setCountLimit:", 10);
}

void __58__ASCOfferButton_textBackgroundImageFittingSize_forTheme___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  const CGPath *v7;

  v7 = CGPathCreateWithRoundedRect(*(CGRect *)&a3, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32), 0);
  CGContextSetRGBFillColor(a2, 0.0, 0.0, 0.0, 1.0);
  CGContextAddPath(a2, v7);
  CGContextFillPath(a2);
  CGPathRelease(v7);
}

+ (id)progressStateImageFittingSize:(id)a3 forTheme:(id)a4 startPercent:(double)a5 endPercent:(double)a6 useFullImageSize:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  ASCImageRenderer *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, CGContext *, double, double, double, double);
  void *v32;
  id v33;
  double v34;
  double v35;
  _QWORD v36[9];

  v7 = a7;
  v36[7] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__onceToken != -1)
    dispatch_once(&progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__onceToken, &__block_literal_global_12);
  v36[0] = v11;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "progressLineWidth");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "progressLineCap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v15;
  objc_msgSend(v12, "progressColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    +[__ASCLayoutProxy offerProgressDiameterForSize:](__ASCLayoutProxy, "offerProgressDiameterForSize:", v11);
    v25 = floor((v24 + 1.0 + -1.0) * 0.5);
    if (v7)
      v26 = v24 + 1.0;
    else
      v26 = v24;
    v27 = -[ASCImageRenderer initWithSize:capInsets:renderingMode:]([ASCImageRenderer alloc], "initWithSize:capInsets:renderingMode:", 0, v26, v26, v25, v25, v25, v25);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke_2;
    v32 = &unk_1E7561460;
    v33 = v12;
    v34 = a5;
    v35 = a6;
    -[ASCImageRenderer imageWithActions:](v27, "imageWithActions:", &v29);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache, "setObject:forKey:", v23, v20, v29, v30, v31, v32);

  }
  return v23;
}

uint64_t __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache;
  progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache = (uint64_t)v0;

  objc_msgSend((id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache, "setName:", CFSTR("Progress state image cache"));
  return objc_msgSend((id)progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize__cache, "setCountLimit:", 20);
}

void __98__ASCOfferButton_progressStateImageFittingSize_forTheme_startPercent_endPercent_useFullImageSize___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  CGFloat v12;
  CGFloat v13;
  CGPath *ProgressRing;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "progressLineWidth");
  CGContextSetLineWidth(a2, v12);
  CGContextSetLineCap(a2, (CGLineCap)objc_msgSend(*(id *)(a1 + 32), "progressLineCap"));
  objc_msgSend(*(id *)(a1 + 32), "progressLineWidth");
  ProgressRing = ASCPathCreateProgressRing(a3, a4, a5, a6, v13, *(double *)(a1 + 40), *(double *)(a1 + 48));
  CGContextAddPath(a2, ProgressRing);
  objc_msgSend(*(id *)(a1 + 32), "progressColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)objc_msgSend(v15, "CGColor"));

  CGContextStrokePath(a2);
  CGPathRelease(ProgressRing);
}

+ (id)progressTransitionImageFittingSize:(void *)a3 forTheme:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend((id)objc_opt_self(), "progressStateImageFittingSize:forTheme:startPercent:endPercent:useFullImageSize:", v5, v4, 0, 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)indeterminateProgressImageFittingSize:(void *)a3 forTheme:
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend((id)objc_opt_self(), "progressStateImageFittingSize:forTheme:startPercent:endPercent:useFullImageSize:", v5, v4, 1, 0.1, 0.9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)progressImageWithPercent:(void *)a3 fittingSize:(void *)a4 forTheme:
{
  id v6;
  id v7;
  double v8;
  double v9;
  ASCImageRenderer *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  double v16;

  v6 = a4;
  v7 = a3;
  objc_opt_self();
  +[__ASCLayoutProxy offerProgressDiameterForSize:](__ASCLayoutProxy, "offerProgressDiameterForSize:", v7);
  v9 = v8;

  v10 = -[ASCImageRenderer initWithSize:]([ASCImageRenderer alloc], "initWithSize:", v9, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__ASCOfferButton_progressImageWithPercent_fittingSize_forTheme___block_invoke;
  v14[3] = &unk_1E7561488;
  v15 = v6;
  v16 = a1;
  v11 = v6;
  -[ASCImageRenderer imageWithActions:](v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __64__ASCOfferButton_progressImageWithPercent_fittingSize_forTheme___block_invoke(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  CGFloat v12;
  CGFloat v13;
  CGPath *ProgressRing;
  id v15;
  CGFloat v16;
  CGPath *v17;
  id v18;
  double Width;
  double Height;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const CGPath *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  objc_msgSend(*(id *)(a1 + 32), "progressLineWidth");
  CGContextSetLineWidth(a2, v12);
  CGContextSetLineCap(a2, (CGLineCap)objc_msgSend(*(id *)(a1 + 32), "progressLineCap"));
  CGContextSaveGState(a2);
  objc_msgSend(*(id *)(a1 + 32), "progressLineWidth");
  ProgressRing = ASCPathCreateProgressRing(a3, a4, a5, a6, v13, 0.0, 1.0);
  CGContextAddPath(a2, ProgressRing);
  objc_msgSend(*(id *)(a1 + 32), "progressColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)objc_msgSend(v15, "CGColor"));

  CGContextStrokePath(a2);
  CGPathRelease(ProgressRing);
  CGContextRestoreGState(a2);
  CGContextSaveGState(a2);
  objc_msgSend(*(id *)(a1 + 32), "progressLineWidth");
  v17 = ASCPathCreateProgressRing(a3, a4, a5, a6, v16, 0.0, *(double *)(a1 + 40));
  CGContextAddPath(a2, v17);
  objc_msgSend(*(id *)(a1 + 32), "iconTintColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a2, (CGColorRef)objc_msgSend(v18, "CGColor"));

  CGContextStrokePath(a2);
  CGPathRelease(v17);
  CGContextRestoreGState(a2);
  CGContextSaveGState(a2);
  v31.origin.x = a3;
  v31.origin.y = a4;
  v31.size.width = a5;
  v31.size.height = a6;
  Width = CGRectGetWidth(v31);
  v32.origin.x = a3;
  v32.origin.y = a4;
  v32.size.width = a5;
  v32.size.height = a6;
  Height = CGRectGetHeight(v32);
  if (Width >= Height)
    Width = Height;
  objc_msgSend(*(id *)(a1 + 32), "stopIndicatorRatio");
  v22 = floor(Width * v21);
  v33.origin.x = a3;
  v33.origin.y = a4;
  v33.size.width = a5;
  v33.size.height = a6;
  v23 = CGRectGetMidX(v33) - v22 * 0.5;
  v34.origin.x = a3;
  v34.origin.y = a4;
  v34.size.width = a5;
  v34.size.height = a6;
  v24 = CGRectGetMidY(v34) - v22 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "stopIndicatorCornerSize");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "stopIndicatorCornerSize");
  v28 = v27;
  v35.origin.x = v23;
  v35.origin.y = v24;
  v35.size.width = v22;
  v35.size.height = v22;
  v29 = CGPathCreateWithRoundedRect(v35, v26, v28, 0);
  CGContextAddPath(a2, v29);
  objc_msgSend(*(id *)(a1 + 32), "iconTintColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v30, "CGColor"));

  CGContextFillPath(a2);
  CGPathRelease(v29);
  CGContextRestoreGState(a2);
}

- (ASCOfferButton)initWithFrame:(CGRect)a3
{
  ASCOfferButton *v3;
  ASCOfferButton *v4;
  uint64_t v5;
  ASCOfferTheme *theme;
  uint64_t v7;
  ASCOfferMetadata *metadata;
  ASCOfferButtonBackgroundImageView *v9;
  uint64_t v10;
  ASCOfferButtonBackgroundImageView *imageView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ASCOfferButton;
  v3 = -[ASCOfferButton initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_size, CFSTR("small"));
    v4->_subtitlePosition = 0;
    +[ASCOfferTheme grayTheme](ASCOfferTheme, "grayTheme");
    v5 = objc_claimAutoreleasedReturnValue();
    theme = v4->_theme;
    v4->_theme = (ASCOfferTheme *)v5;

    +[ASCOfferMetadata emptyMetadata](ASCOfferMetadata, "emptyMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    metadata = v4->_metadata;
    v4->_metadata = (ASCOfferMetadata *)v7;

    v9 = [ASCOfferButtonBackgroundImageView alloc];
    v10 = -[ASCOfferButtonBackgroundImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (ASCOfferButtonBackgroundImageView *)v10;

    v4->_fixedHeight = 0;
    v4->_shouldTopAlign = 0;
    v4->_topPadding = 0.0;
    v4->_shouldExpandBackground = 0;
    -[ASCOfferButton setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCOfferButton setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ASCOfferButton setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 0);
    -[ASCOfferButtonBackgroundImageView setInsetsLayoutMarginsFromSafeArea:](v4->_imageView, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ASCOfferButtonBackgroundImageView setPreservesSuperviewLayoutMargins:](v4->_imageView, "setPreservesSuperviewLayoutMargins:", 0);
    -[ASCOfferButton imageView](v4, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton addSubview:](v4, "addSubview:", v12);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (id)-[ASCOfferButton registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v15, sel_onTraitCollectionChange);
  }
  return v4;
}

- (ASCOfferButton)initWithCoder:(id)a3
{
  -[ASCOfferButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCOfferButton doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setTitleLabelIfLoaded:(id)a3
{
  id v5;

  v5 = a3;
  -[UILabel removeFromSuperview](self->_titleLabelIfLoaded, "removeFromSuperview");
  objc_storeStrong((id *)&self->_titleLabelIfLoaded, a3);
  if (self->_titleLabelIfLoaded)
    -[ASCOfferButton addSubview:](self, "addSubview:");
  -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
  -[ASCOfferButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (UILabel)titleLabel
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v5, "setNumberOfLines:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    objc_msgSend(v5, "setMinimumScaleFactor:", 0.0);
    objc_msgSend(v5, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
    -[ASCOfferButton setTitleLabelIfLoaded:](self, "setTitleLabelIfLoaded:", v5);
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
  }

  return (UILabel *)v5;
}

- (void)setSubtitleLabelIfLoaded:(id)a3
{
  id v5;

  v5 = a3;
  -[UILabel removeFromSuperview](self->_subtitleLabelIfLoaded, "removeFromSuperview");
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, a3);
  if (self->_subtitleLabelIfLoaded)
    -[ASCOfferButton addSubview:](self, "addSubview:");
  -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
  -[ASCOfferButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (UILabel)subtitleLabel
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[ASCOfferButton size](self, "size");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton theme](self, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferButton subtitleFontFittingSize:forTheme:compatibleWithTraitCollection:]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v10);

    objc_msgSend(v5, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set_fontForShortcutBaselineCalculation:", v11);

    objc_msgSend(v5, "setNumberOfLines:", 3);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    objc_msgSend(v5, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
    -[ASCOfferButton setSubtitleLabelIfLoaded:](self, "setSubtitleLabelIfLoaded:", v5);
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
  }

  return (UILabel *)v5;
}

- (void)updateImageStyleProperties
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  ASCOfferMetadata *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  ASCOfferMetadata *v47;

  if (-[ASCOfferButton isEnabled](self, "isEnabled"))
  {
    -[ASCOfferButton imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 1.0;
  }
  else
  {
    objc_opt_self();
    -[ASCOfferButton imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0.6;
  }
  objc_msgSend(v3, "setAlpha:", v5);

  -[ASCOfferButton metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if (v7)
  {
LABEL_5:
    -[ASCOfferButton imageView](self, "imageView");
    v47 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferMetadata setTintColor:](v47, "setTintColor:", 0);
    goto LABEL_22;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isIcon");

  if (v9)
  {
    -[ASCOfferButton theme](self, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v11);

    v13 = self->_metadata;
    -[ASCOfferButton size](self, "size");
    v47 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferMetadata imageNameForSize:](v13, "imageNameForSize:", v47);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCOfferButton traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCImageRenderer bundleImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "bundleImageNamed:compatibleWithTraitCollection:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

    goto LABEL_22;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isProgress");

  if (v19)
  {
    v47 = self->_metadata;
    -[ASCOfferButton theme](self, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "iconTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v21);

    if (-[ASCOfferMetadata isIndeterminate](v47, "isIndeterminate"))
    {
      -[ASCOfferButton size](self, "size");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton theme](self, "theme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCOfferButton indeterminateProgressImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v23, v24);
    }
    else
    {
      -[ASCOfferMetadata percent](v47, "percent");
      v27 = v26;
      -[ASCOfferButton size](self, "size");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton theme](self, "theme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCOfferButton progressImageWithPercent:fittingSize:forTheme:](v27, (uint64_t)ASCOfferButton, v23, v24);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v28);
    goto LABEL_15;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isText"))
  {

  }
  else
  {
    -[ASCOfferButton metadata](self, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isPlaceholder");

    if (!v31)
    {
      -[ASCOfferButton metadata](self, "metadata");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isDeeplink");

      if (!v42)
      {
        -[ASCOfferButton metadata](self, "metadata");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isViewInAppStore");

        if (!v45)
        {
          -[ASCOfferButton metadata](self, "metadata");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          ASCUnknownEnumCase(CFSTR("ASCOfferMetadata"), v46);
        }
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app.fill"));
      v47 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferMetadata imageWithSymbolConfiguration:](v47, "imageWithSymbolConfiguration:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton imageView](self, "imageView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setImage:", v24);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton imageView](self, "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTintColor:", v28);
LABEL_15:

      goto LABEL_22;
    }
  }
  v32 = -[ASCOfferButton isHighlighted](self, "isHighlighted");
  -[ASCOfferButton theme](self, "theme");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "titleBackgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v36 = v34;
  if (v32)
  {
    objc_msgSend(v34, "asc_highlightedColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ASCOfferButton imageView](self, "imageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTintColor:", v36);

  if (v32)
  -[ASCOfferButton size](self, "size");
  v47 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton theme](self, "theme");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCOfferButton textBackgroundImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v47, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton imageView](self, "imageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setImage:", v39);

LABEL_22:
}

- (void)updateLabelStyleProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCOfferButton titleFontForText:fittingSize:representingMetadata:compatibleWithTraitCollection:]((uint64_t)ASCOfferButton, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[ASCOfferButton size](self, "size");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[ASCOfferButton adjustsTitleFontSizeToFitWidthForSize:](ASCOfferButton, "adjustsTitleFontSizeToFitWidthForSize:", v10);
  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", v11);

  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set_fontForShortcutBaselineCalculation:", v14);

  if (!-[ASCOfferButton isEnabled](self, "isEnabled"))
  {
    objc_opt_self();
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 0.56);

    -[ASCOfferButton theme](self, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleTextDisabledColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);
LABEL_7:

    goto LABEL_8;
  }
  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

  v17 = -[ASCOfferButton isHighlighted](self, "isHighlighted");
  -[ASCOfferButton theme](self, "theme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = v19;
  if (v17)
  {
    objc_msgSend(v19, "asc_highlightedColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  if ((v17 & 1) != 0)
    goto LABEL_7;
LABEL_8:

  -[ASCOfferButton theme](self, "theme");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "subtitleTextColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  v27 = -[ASCOfferButton subtitlePosition](self, "subtitlePosition");
  switch(v27)
  {
    case 2:
      goto LABEL_15;
    case 1:
      if (self)
        v28 = 2
            * (-[ASCOfferButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 0);
      else
        v28 = 0;
      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextAlignment:", v28);

LABEL_15:
      -[ASCOfferButton metadata](self, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isIcon"))
      {

      }
      else
      {
        -[ASCOfferButton metadata](self, "metadata");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isProgress");

        if (!v32)
        {
          if (self)
            v35 = 2
                * (-[ASCOfferButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 0);
          else
            v35 = 0;
          -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v33;
          v34 = v35;
          goto LABEL_19;
        }
      }
LABEL_18:
      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      v34 = 1;
LABEL_19:
      objc_msgSend(v33, "setTextAlignment:", v34);

      return;
    case 0:
      goto LABEL_18;
  }
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[ASCOfferButton updateImageStyleProperties](self, "updateImageStyleProperties");
  -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[ASCOfferButton updateImageStyleProperties](self, "updateImageStyleProperties");
  -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton setSemanticContentAttribute:](&v8, sel_setSemanticContentAttribute_);
  -[ASCOfferButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

  -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", a3);

  -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSemanticContentAttribute:", a3);

}

- (void)updateVisualEffects
{
  void *v3;

  -[ASCOfferButton focusEffect](self, "focusEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton setFocusEffect:](self, "setFocusEffect:", v3);

  -[ASCOfferButton updateFocusIfNeeded](self, "updateFocusIfNeeded");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[ASCOfferButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3 + -1.0;
  v6 = v5 + -1.0;
  v8 = v7 + 2.0;
  v10 = v9 + 2.0;

  return (id)objc_msgSend(MEMORY[0x1E0DC37D8], "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68], v4, v6, v8, v10, floor(v10 * 0.5));
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  v6 = a3;
  -[ASCOfferButton pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_42, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[ASCOfferButton setHighlighted:](self, "setHighlighted:", 1);

}

BOOL __41__ASCOfferButton_pressesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  v6 = a3;
  -[ASCOfferButton pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, a4);
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_45, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[ASCOfferButton setHighlighted:](self, "setHighlighted:", 0);
    if (-[ASCOfferButton isUserInteractionEnabled](self, "isUserInteractionEnabled"))
      -[ASCOfferButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  }

}

BOOL __41__ASCOfferButton_pressesEnded_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCOfferButton;
  v6 = a3;
  -[ASCOfferButton pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, a4);
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_48, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[ASCOfferButton setHighlighted:](self, "setHighlighted:", 0);

}

BOOL __45__ASCOfferButton_pressesCancelled_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

- (void)setSubtitlePosition:(int64_t)a3
{
  if (self->_subtitlePosition != a3)
  {
    self->_subtitlePosition = a3;
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
    -[ASCOfferButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTheme:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[ASCOfferTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    -[ASCOfferButton updateImageStyleProperties](self, "updateImageStyleProperties");
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
  }

}

- (void)setMetadata:(id)a3
{
  ASCOfferMetadata **p_metadata;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  ASCOfferMetadata *v10;
  ASCOfferMetadata *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  ASCOfferMetadata *v21;
  ASCOfferMetadata *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ASCOfferMetadata *v27;
  uint64_t v28;
  _BOOL4 v29;
  ASCOfferMetadata *v30;
  void *v31;
  void *v32;
  int v33;
  __CFString **v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  ASCOfferMetadata *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  p_metadata = &self->_metadata;
  v56 = a3;
  if ((-[ASCOfferMetadata isEqual:](*p_metadata, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_metadata, a3);
    if (-[ASCOfferMetadata isEmpty](*p_metadata, "isEmpty"))
    {
      -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", 0);

      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", 0);

      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
      -[ASCOfferButton imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", 0);
LABEL_9:

      -[ASCOfferButton imageView](self, "imageView");
      v27 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
      v11 = v27;
      v28 = 0;
LABEL_10:
      -[ASCOfferMetadata setIsBackgroundForText:](v27, "setIsBackgroundForText:", v28);
LABEL_21:

      -[ASCOfferButton updateImageStyleProperties](self, "updateImageStyleProperties");
      -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
      -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
      -[ASCOfferButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
      goto LABEL_22;
    }
    v9 = -[ASCOfferMetadata isText](*p_metadata, "isText");
    v10 = *p_metadata;
    if (v9)
    {
      v11 = v10;
      v12 = (void *)MEMORY[0x1E0CB3498];
      -[ASCOfferMetadata title](v11, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton traitCollection](self, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asc_attributedStringWithLockupTextContainingSymbols:compatibleWithTraitCollection:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton titleLabel](self, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAttributedText:", v15);

      -[ASCOfferMetadata subtitle](v11, "subtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[ASCOfferMetadata subtitle](v11, "subtitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCOfferButton subtitleLabel](self, "subtitleLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v18);

      }
      else
      {
        -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setText:", 0);
      }

      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
      -[ASCOfferButton imageView](self, "imageView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setContentMode:", 0);

      -[ASCOfferButton imageView](self, "imageView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = 1;
LABEL_20:
      objc_msgSend(v38, "setIsBackgroundForText:", v40);

      goto LABEL_21;
    }
    v20 = -[ASCOfferMetadata isIcon](v10, "isIcon");
    v21 = *p_metadata;
    if (v20)
    {
      v22 = v21;
      -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", 0);

      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", 0);

      -[ASCOfferMetadata animationName](v22, "animationName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      ASCOfferMetadataAnimationForName(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", v26);

      -[ASCOfferButton imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentMode:", 4);
      goto LABEL_9;
    }
    v29 = -[ASCOfferMetadata isProgress](v21, "isProgress");
    v30 = *p_metadata;
    if (v29)
    {
      v11 = v30;
      -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", 0);

      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", 0);

      v33 = -[ASCOfferMetadata isIndeterminate](v11, "isIndeterminate");
      v34 = &ASCOfferMetadataAnimationNameRotate;
      if (!v33)
        v34 = ASCOfferMetadataAnimationNameNone;
      ASCOfferMetadataAnimationForName(*v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", v35);

      if (-[ASCOfferMetadata isIndeterminate](v11, "isIndeterminate"))
        v36 = 0;
      else
        v36 = 4;
      -[ASCOfferButton imageView](self, "imageView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setContentMode:", v36);

      -[ASCOfferButton imageView](self, "imageView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = 0;
      goto LABEL_20;
    }
    if (-[ASCOfferMetadata isPlaceholder](v30, "isPlaceholder"))
    {
      -[ASCOfferButton titleLabel](self, "titleLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setText:", 0);

      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setText:", 0);

      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
      -[ASCOfferButton imageView](self, "imageView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v46 = 0;
    }
    else
    {
      if (!-[ASCOfferMetadata isDeeplink](*p_metadata, "isDeeplink"))
      {
        if (!-[ASCOfferMetadata isViewInAppStore](*p_metadata, "isViewInAppStore"))
          ASCUnknownEnumCase(CFSTR("ASCOfferMetadata"), v56);
        v49 = *p_metadata;
        v50 = (void *)MEMORY[0x1E0CB3498];
        -[ASCOfferMetadata title](v49, "title");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCOfferButton traitCollection](self, "traitCollection");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "asc_attributedStringWithLockupTextContainingSymbols:compatibleWithTraitCollection:", v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCOfferButton titleLabel](self, "titleLabel");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setAttributedText:", v53);

        -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setText:", 0);

        -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
        -[ASCOfferButton imageView](self, "imageView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setImage:", 0);
        goto LABEL_30;
      }
      -[ASCOfferButton titleLabel](self, "titleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setText:", 0);

      -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setText:", 0);

      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
      -[ASCOfferButton imageView](self, "imageView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v46 = 4;
    }
    objc_msgSend(v44, "setContentMode:", v46);
LABEL_30:

    -[ASCOfferButton imageView](self, "imageView");
    v27 = (ASCOfferMetadata *)objc_claimAutoreleasedReturnValue();
    v11 = v27;
    v28 = 1;
    goto LABEL_10;
  }
LABEL_22:

}

- (void)beginModalStateWithCancelBlock:(id)a3
{
  id v4;
  ASCModalViewInteraction *v5;
  id v6;

  v4 = a3;
  v5 = -[ASCModalViewInteraction initWithView:]([ASCModalViewInteraction alloc], "initWithView:", self);
  -[ASCOfferButton setModalInteraction:](self, "setModalInteraction:", v5);

  -[ASCOfferButton modalInteraction](self, "modalInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installWithCancelBlock:", v4);

}

- (void)endModalState
{
  void *v3;

  -[ASCOfferButton modalInteraction](self, "modalInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ASCOfferButton setModalInteraction:](self, "setModalInteraction:", 0);
}

- (CAAnimation)imageAnimation
{
  void *v2;
  void *v3;
  void *v4;

  -[ASCOfferButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend(v3, "animationForKey:", CFSTR("ASCOfferButton.imageAnimation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAAnimation *)v4;
}

- (void)setImageAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASCOfferButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("ASCOfferButton.imageAnimation"));

  if (v8)
  {
    -[ASCOfferButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("ASCOfferButton.imageAnimation"));

  }
}

- (void)setCurrentTransition:(id)a3
{
  UIViewPropertyAnimator **p_currentTransition;
  id v6;

  v6 = a3;
  p_currentTransition = &self->_currentTransition;
  if (*p_currentTransition && -[UIViewPropertyAnimator state](*p_currentTransition, "state") == 1)
  {
    -[UIViewPropertyAnimator stopAnimation:](*p_currentTransition, "stopAnimation:", 0);
    -[UIViewPropertyAnimator finishAnimationAtPosition:](*p_currentTransition, "finishAnimationAtPosition:", 0);
  }
  objc_storeStrong((id *)p_currentTransition, a3);
  if (*p_currentTransition)
    -[UIViewPropertyAnimator startAnimation](*p_currentTransition, "startAnimation");

}

- (BOOL)canTransitionToMetadata:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled")
    && (-[ASCOfferButton isHidden](self, "isHidden") & 1) == 0)
  {
    -[ASCOfferButton metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v4) & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[ASCOfferButton metadata](self, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEmpty") & 1) != 0 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        -[ASCOfferButton metadata](self, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isProgress") && (objc_msgSend(v4, "isProgress") & 1) != 0)
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          -[ASCOfferButton metadata](self, "metadata");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isPlaceholder") & 1) != 0)
            LOBYTE(v5) = 0;
          else
            v5 = objc_msgSend(v4, "isPlaceholder") ^ 1;

        }
      }

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldTransitionImageViewFromMetadata:(id)a3 toMetadata:(id)a4
{
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEmpty") && (objc_msgSend(v6, "isEmpty") & 1) != 0
    || objc_msgSend(v5, "isText") && (objc_msgSend(v6, "isText") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else if (objc_msgSend(v5, "isIcon") && objc_msgSend(v6, "isIcon"))
  {
    v8 = v6;
    objc_msgSend(v5, "animationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
      v12 = objc_msgSend(v9, "isEqual:", v10);
    else
      v12 = v9 == (void *)v10;
    LOBYTE(v7) = v12 ^ 1;

  }
  else
  {
    v7 = objc_msgSend(v6, "isViewInAppStore") ^ 1;
  }

  return v7;
}

- (BOOL)chainTransitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  id location;

  v8 = a3;
  v9 = a5;
  -[ASCOfferButton currentTransition](self, "currentTransition");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        -[ASCOfferButton currentTransition](self, "currentTransition"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "state"),
        v12,
        v11,
        v13 == 1))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 1);
    -[ASCOfferButton currentTransition](self, "currentTransition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pauseAnimation");

    objc_initWeak(&location, self);
    -[ASCOfferButton currentTransition](self, "currentTransition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__ASCOfferButton_chainTransitionToMetadata_scalingDurationBy_withCompletion___block_invoke;
    v20[3] = &unk_1E7561510;
    objc_copyWeak(v23, &location);
    v21 = v8;
    *(double *)&v23[1] = a4 * 0.7;
    v22 = v9;
    objc_msgSend(v16, "addCompletion:", v20);

    -[ASCOfferButton currentTransition](self, "currentTransition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "continueAnimationWithTimingParameters:durationFactor:", v14, a4 * 0.3);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);

    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __77__ASCOfferButton_chainTransitionToMetadata_scalingDurationBy_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "transitionToMetadata:scalingDurationBy:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

  }
}

- (id)transitionImageForMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ASCOfferButton metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isProgress") && objc_msgSend(v4, "isText")
    || objc_msgSend(v5, "isText")
    && objc_msgSend(v4, "isProgress")
    && (objc_msgSend(v4, "isIndeterminate") & 1) == 0)
  {
    -[ASCOfferButton size](self, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton theme](self, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferButton progressTransitionImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ASCOfferButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)transitionColorForMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[ASCOfferButton metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isText") & 1) != 0 || objc_msgSend(v4, "isText"))
  {
    -[ASCOfferButton theme](self, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v5, "isIcon") & 1) == 0
      && (objc_msgSend(v4, "isIcon") & 1) == 0
      && (objc_msgSend(v5, "isProgress") & 1) == 0
      && !objc_msgSend(v4, "isProgress"))
    {
      v8 = 0;
      goto LABEL_10;
    }
    -[ASCOfferButton theme](self, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_10:
  return v8;
}

- (void)transitionToMetadata:(id)a3 scalingDurationBy:(double)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  void (**v39)(_QWORD);
  _QWORD v40[4];
  id v41;
  id v42;
  ASCOfferButton *v43;
  _QWORD v44[4];
  id v45;
  ASCOfferButton *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (-[ASCOfferButton canTransitionToMetadata:](self, "canTransitionToMetadata:", v8))
  {
    if (!-[ASCOfferButton chainTransitionToMetadata:scalingDurationBy:withCompletion:](self, "chainTransitionToMetadata:scalingDurationBy:withCompletion:", v8, v9, a4))
    {
      -[ASCOfferButton imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton transitionImageForMetadata:](self, "transitionImageForMetadata:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v35);
      objc_msgSend(v10, "alpha");
      objc_msgSend(v11, "setAlpha:");
      objc_msgSend(v11, "setContentMode:", 0);
      objc_msgSend(v10, "frame");
      objc_msgSend(v11, "setFrame:");
      -[ASCOfferButton transitionColorForMetadata:](self, "transitionColorForMetadata:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v12);

      objc_msgSend(v11, "setSemanticContentAttribute:", -[ASCOfferButton semanticContentAttribute](self, "semanticContentAttribute"));
      -[ASCOfferButton addSubview:](self, "addSubview:", v11);
      v13 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
      v15 = (void *)objc_msgSend(v13, "initWithDuration:timingParameters:", v14, a4 * 0.3);

      -[ASCOfferButton metadata](self, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton setMetadata:](self, "setMetadata:", v8);
      -[ASCOfferButton layoutIfNeeded](self, "layoutIfNeeded");
      -[ASCOfferButton imageAnimation](self, "imageAnimation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCOfferButton setImageAnimation:](self, "setImageAnimation:", 0);
      v18 = -[ASCOfferButton shouldTransitionImageViewFromMetadata:toMetadata:](self, "shouldTransitionImageViewFromMetadata:toMetadata:", v16, v8);
      v19 = MEMORY[0x1E0C809B0];
      if (v18)
      {
        objc_msgSend(v10, "alpha");
        v21 = v20;
        objc_msgSend(v10, "setAlpha:", 0.0);
        objc_msgSend(v10, "frame");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        objc_msgSend(v11, "frame");
        objc_msgSend(v10, "setFrame:");
        -[ASCOfferButton updateVisualEffects](self, "updateVisualEffects");
        v44[0] = v19;
        v44[1] = 3221225472;
        v44[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke;
        v44[3] = &unk_1E7561538;
        v47 = v21;
        v48 = v23;
        v49 = v25;
        v50 = v27;
        v51 = v29;
        v45 = v10;
        v46 = self;
        objc_msgSend(v15, "addAnimations:", v44);

      }
      v40[0] = v19;
      v40[1] = 3221225472;
      v40[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_2;
      v40[3] = &unk_1E7560578;
      v30 = v11;
      v41 = v30;
      v42 = v10;
      v43 = self;
      v31 = v10;
      objc_msgSend(v15, "addAnimations:", v40);
      -[ASCOfferButton delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "offerButton:willTransitionToMetadata:usingAnimator:", self, v8, v15);

      v36[0] = v19;
      v36[1] = 3221225472;
      v36[2] = __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_3;
      v36[3] = &unk_1E7561560;
      v36[4] = self;
      v37 = v17;
      v38 = v30;
      v39 = v9;
      v33 = v30;
      v34 = v17;
      objc_msgSend(v15, "addCompletion:", v36);
      -[ASCOfferButton setCurrentTransition:](self, "setCurrentTransition:", v15);

    }
  }
  else
  {
    -[ASCOfferButton setMetadata:](self, "setMetadata:", v8);
    if (v9)
      v9[2](v9);
  }

}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 40), "updateVisualEffects");
}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_2(id *a1)
{
  objc_msgSend(a1[5], "frame");
  objc_msgSend(a1[4], "setFrame:");
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  return objc_msgSend(a1[6], "updateVisualEffects");
}

uint64_t __72__ASCOfferButton_transitionToMetadata_scalingDurationBy_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setImageAnimation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transitionToMetadata:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  ASCOfferButton *v14;
  id v15;

  v6 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__ASCOfferButton_transitionToMetadata_withCompletion___block_invoke;
  v13 = &unk_1E7561588;
  v14 = self;
  v15 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1BCCFE944](&v10);
  -[ASCOfferButton transitionToMetadata:scalingDurationBy:withCompletion:](self, "transitionToMetadata:scalingDurationBy:withCompletion:", v8, v9, 1.0, v10, v11, v12, v13, v14);

}

uint64_t __54__ASCOfferButton_transitionToMetadata_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateVisualEffects");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)onTraitCollectionChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;

  -[ASCOfferButton metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProgress");

  -[ASCOfferButton metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  if (!v4)
  {
    if (objc_msgSend(v5, "isText"))
    {

    }
    else
    {
      -[ASCOfferButton metadata](self, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPlaceholder");

      if (!v14)
      {
        -[ASCOfferButton metadata](self, "metadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isViewInAppStore");

        if (!v16)
          return;
      }
    }
    -[ASCOfferButton updateLabelStyleProperties](self, "updateLabelStyleProperties");
    -[ASCOfferButton setNeedsLayout](self, "setNeedsLayout");
    return;
  }
  if (objc_msgSend(v5, "isIndeterminate"))
  {
    -[ASCOfferButton size](self, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton theme](self, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferButton indeterminateProgressImageFittingSize:forTheme:]((uint64_t)ASCOfferButton, v6, v7);
  }
  else
  {
    objc_msgSend(v17, "percent");
    v9 = v8;
    -[ASCOfferButton size](self, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton theme](self, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferButton progressImageWithPercent:fittingSize:forTheme:](v9, (uint64_t)ASCOfferButton, v6, v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

  -[ASCOfferButton imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsBackgroundForText:", 0);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  ASCOfferButton *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "view");
    v8 = (ASCOfferButton *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != self && objc_msgSend(v7, "numberOfTouchesRequired") == 1 && objc_msgSend(v7, "numberOfTapsRequired") == 1;

  }
  else
  {
    v9 = 0;
  }

  return !v9;
}

- (id)makeLayout
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  _BOOL8 v24;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  -[ASCOfferButton metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");

  if (v4)
  {
    -[ASCOfferButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[__ASCLayoutProxy offerEmptyLayoutWithImageView:titleView:subtitleView:](__ASCLayoutProxy, "offerEmptyLayoutWithImageView:titleView:subtitleView:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isText"))
  {

LABEL_6:
    v12 = -[ASCOfferButton subtitlePosition](self, "subtitlePosition") == 1;
    -[ASCOfferButton size](self, "size");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ASCOfferButton shouldTopAlign](self, "shouldTopAlign");
    -[ASCOfferButton topPadding](self, "topPadding");
    v18 = v17;
    LOBYTE(v31) = -[ASCOfferButton shouldExpandBackground](self, "shouldExpandBackground");
    +[__ASCLayoutProxy offerTextLayoutForSize:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:](__ASCLayoutProxy, "offerTextLayoutForSize:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:", v5, v13, v14, v15, v12, v16, v18, v31);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v8 = (void *)v19;

    goto LABEL_16;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPlaceholder");

  if (v11)
    goto LABEL_6;
  -[ASCOfferButton metadata](self, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isIcon"))
  {

LABEL_10:
    v23 = -[ASCOfferButton subtitlePosition](self, "subtitlePosition") == 1
       || -[ASCOfferButton subtitlePosition](self, "subtitlePosition") == 2;
    -[ASCOfferButton size](self, "size");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ASCOfferButton shouldTopAlign](self, "shouldTopAlign");
    -[ASCOfferButton topPadding](self, "topPadding");
    LOBYTE(v31) = 0;
LABEL_14:
    +[__ASCLayoutProxy offerIconLayoutForSize:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:](__ASCLayoutProxy, "offerIconLayoutForSize:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:", v5, v13, v14, v15, v23, v24, v31);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isProgress");

  if (v22)
    goto LABEL_10;
  -[ASCOfferButton metadata](self, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isDeeplink");

  if (v27)
  {
    v23 = 1;
    if (-[ASCOfferButton subtitlePosition](self, "subtitlePosition") != 1)
      v23 = -[ASCOfferButton subtitlePosition](self, "subtitlePosition") == 2;
    -[ASCOfferButton size](self, "size");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton titleLabelIfLoaded](self, "titleLabelIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCOfferButton subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ASCOfferButton shouldTopAlign](self, "shouldTopAlign");
    -[ASCOfferButton topPadding](self, "topPadding");
    LOBYTE(v31) = 1;
    goto LABEL_14;
  }
  -[ASCOfferButton metadata](self, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isViewInAppStore");

  if (!v29)
  {
    -[ASCOfferButton metadata](self, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ASCUnknownEnumCase(CFSTR("ASCOfferMetadata"), v30);
  }
  -[ASCOfferButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy offerDisclosureLayoutWithDisclosureIndicator:](__ASCLayoutProxy, "offerDisclosureLayoutWithDisclosureIndicator:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v8;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if (-[ASCOfferButton translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[ASCOfferButton superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ASCOfferButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCOfferButton makeLayout](self, "makeLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "measuredSizeFittingSize:inTraitEnvironment:", v7, width, height);
  v9 = v8;
  v11 = v10;

  if (-[ASCOfferButton isFixedHeight](self, "isFixedHeight"))
  {
    -[ASCOfferButton size](self, "size");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[__ASCLayoutProxy offerButtonFixedHeightForSize:](__ASCLayoutProxy, "offerButtonFixedHeightForSize:", v12);
    v11 = v13;

  }
  v14 = v9;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[ASCOfferButton makeLayout](self, "makeLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alignmentInsetsInTraitEnvironment:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ASCOfferButton;
  -[ASCOfferButton layoutSubviews](&v21, sel_layoutSubviews);
  -[ASCOfferButton makeLayout](self, "makeLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferButton bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ASCOfferButton layoutMargins](self, "layoutMargins");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v13, v15, v17, v19);

}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCOfferButton theme](self, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("theme"));

  -[ASCOfferButton metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("metadata"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASCOfferTheme)theme
{
  return self->_theme;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (ASCOfferButtonDelegate)delegate
{
  return (ASCOfferButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)subtitlePosition
{
  return self->_subtitlePosition;
}

- (BOOL)isFixedHeight
{
  return self->_fixedHeight;
}

- (void)setFixedHeight:(BOOL)a3
{
  self->_fixedHeight = a3;
}

- (BOOL)shouldTopAlign
{
  return self->_shouldTopAlign;
}

- (void)setShouldTopAlign:(BOOL)a3
{
  self->_shouldTopAlign = a3;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (BOOL)shouldExpandBackground
{
  return self->_shouldExpandBackground;
}

- (void)setShouldExpandBackground:(BOOL)a3
{
  self->_shouldExpandBackground = a3;
}

- (NSString)size
{
  return self->_size;
}

- (ASCOfferButtonBackgroundImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabelIfLoaded
{
  return self->_titleLabelIfLoaded;
}

- (UILabel)subtitleLabelIfLoaded
{
  return self->_subtitleLabelIfLoaded;
}

- (ASCModalViewInteraction)modalInteraction
{
  return self->_modalInteraction;
}

- (void)setModalInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_modalInteraction, a3);
}

- (UIViewPropertyAnimator)currentTransition
{
  return self->_currentTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_modalInteraction, 0);
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_titleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_theme, 0);
}

@end
