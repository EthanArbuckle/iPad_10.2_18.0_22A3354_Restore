@implementation LPTheme

+ (id)regularTheme
{
  return (id)objc_msgSend(a1, "themeWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:", 0, 0, 0, 0, 0, 0, *MEMORY[0x1E0DC4918]);
}

+ (double)badgeIconSizeInPoints
{
  return 16.0;
}

+ (double)largestIconSizeInPoints
{
  return 40.0;
}

+ (double)placeholderIconSizeInPoints
{
  return 50.0;
}

+ (double)disabledButtonOpacity
{
  return 0.4;
}

+ (id)primaryLabelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)secondaryLabelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (LPTheme)themeWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9
{
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  LPTheme *v22;
  void *v23;
  void *v24;
  LPTheme *v25;
  id v27;
  id v28;
  _BOOL4 v29;

  v29 = a8;
  v13 = a4;
  v28 = a7;
  v27 = a9;
  themeCache();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v28;
  v17 = v27;
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = objc_msgSend(v15, "_isFallbackIcon");
  objc_msgSend(v16, "_cacheKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%ld-%d-%ld-%ld-%@-%d-%@"), a3, v19, a5, a6, v20, v29, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", v21);
  v22 = (LPTheme *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 4)
    {
      objc_msgSend(v14, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v24);

    }
    v22 = -[LPTheme initWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:]([LPTheme alloc], "initWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:", a3, v15, a5, a6, v16, v29, v17);
    objc_msgSend(v14, "setObject:forKey:", v22, v21);
  }
  v25 = v22;

  return v25;
}

- (LPTheme)initWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9
{
  id v15;
  LPTheme *v16;
  LPTheme *v17;
  uint64_t v18;
  NSString *preferredContentSizeCategory;
  uint64_t sizeClass;
  NSString *v21;
  void *v22;
  NSString *v23;
  const __CTFontDescriptor *v24;
  const __CTFont *v25;
  const __CTFontDescriptor *v26;
  const __CTFont *v27;
  double Size;
  double v29;
  void *v30;
  double v31;
  uint64_t v32;
  UIColor *highlightColor;
  LPAppearanceDependentValue *v34;
  LPAppearanceDependentValue *highlightCompositingFilter;
  void *v36;
  void *v37;
  LPCaptionBarStyle *v38;
  LPCaptionBarStyle *captionBar;
  LPCollaborationFooterStyle *v40;
  LPQuotedTextViewStyle *v41;
  LPQuotedTextViewStyle *quotedText;
  uint64_t v43;
  UIColor *backgroundColor;
  uint64_t v45;
  UIColor *mediaBackgroundColor;
  uint64_t v47;
  LPPointUnit *v48;
  LPPointUnit *maximumWidth;
  LPImageViewStyle *v50;
  LPImageViewStyle *mediaImage;
  double v52;
  LPVisualMediaViewStyle *v53;
  LPVisualMediaViewStyle *mediaVideo;
  LPCaptionBarStyle *v55;
  LPCaptionBarStyle *mediaTopCaptionBar;
  void *v57;
  uint64_t v58;
  id v59;
  LPCaptionBarStyle *v60;
  LPCaptionBarStyle *mediaBottomCaptionBar;
  void *v62;
  id v63;
  LPImageViewStyle *v64;
  LPImageViewStyle *placeholderImage;
  LPSize *v66;
  double v67;
  LPPointUnit *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  UIFont *domainNameIndicatorFont;
  uint64_t v75;
  UIFont *domainNameIndicatorIconFont;
  LPImageViewStyle *v77;
  LPImageViewStyle *backgroundImage;
  LPContactsBadgeStyle *v79;
  LPContactsBadgeStyle *contactsBadgeStyle;
  LPIndeterminateProgressSpinnerStyle *v81;
  LPIndeterminateProgressSpinnerStyle *progressSpinner;
  LPPointUnit *v83;
  void *v84;
  LPPointUnit *v85;
  uint64_t *v86;
  void *v87;
  LPPointUnit *cornerRadius;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  LPTheme *v96;
  void *v98;
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  objc_super v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  _QWORD v110[3];

  v110[1] = *MEMORY[0x1E0C80C00];
  v99 = a4;
  v15 = a7;
  v100 = a9;
  v105.receiver = self;
  v105.super_class = (Class)LPTheme;
  v16 = -[LPTheme init](&v105, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_26;
  v16->_style = a3;
  v16->_sizeClass = a6;
  objc_storeStrong((id *)&v16->_sizeClassParameters, a7);
  v17->_platform = a5;
  v17->_isFallbackIcon = objc_msgSend(v99, "_isFallbackIcon");
  v17->_hasButton = a8;
  v18 = objc_msgSend(v100, "copy");
  preferredContentSizeCategory = v17->_preferredContentSizeCategory;
  v17->_preferredContentSizeCategory = (NSString *)v18;

  sizeClass = v17->_sizeClass;
  v21 = v17->_preferredContentSizeCategory;
  maximumContentSizeCategory(sizeClass);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryCompareToCategory(v21, (UIContentSizeCategory)v22) == NSOrderedDescending)
  {
    v23 = v22;

    v21 = v23;
  }
  v24 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  v25 = CTFontCreateWithFontDescriptorAndOptions(v24, 0.0, 0, 0);
  CFRelease(v24);
  v26 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  v27 = CTFontCreateWithFontDescriptorAndOptions(v26, 0.0, 0, 0);
  CFRelease(v26);
  Size = CTFontGetSize(v25);
  v29 = CTFontGetSize(v27);
  CFRelease(v25);
  CFRelease(v27);

  v17->_leadingScalingFactor = Size / v29;
  if (a5 == 6)
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pointSize");
    v17->_leadingScalingFactor = v31 / 17.0 * v17->_leadingScalingFactor;

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "_lp_colorWithDynamicProvider:", &__block_literal_global_17);
  v32 = objc_claimAutoreleasedReturnValue();
  highlightColor = v17->_highlightColor;
  v17->_highlightColor = (UIColor *)v32;

  v34 = -[LPAppearanceDependentValue initWithProvider:]([LPAppearanceDependentValue alloc], "initWithProvider:", &__block_literal_global_963);
  highlightCompositingFilter = v17->_highlightCompositingFilter;
  v17->_highlightCompositingFilter = v34;

  objc_opt_self();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPAppearanceDependentValue setDependentTraits:](v17->_highlightCompositingFilter, "setDependentTraits:", v37);

  v38 = -[LPCaptionBarStyle initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:]([LPCaptionBarStyle alloc], "initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:", a5, a6, v15, v17->_leadingScalingFactor);
  captionBar = v17->_captionBar;
  v17->_captionBar = v38;

  v40 = -[LPCollaborationFooterStyle initWithPlatform:sizeClass:fontScalingFactor:]([LPCollaborationFooterStyle alloc], "initWithPlatform:sizeClass:fontScalingFactor:", a5, a6, v17->_leadingScalingFactor);
  -[LPCaptionBarStyle setCollaborationFooter:](v17->_captionBar, "setCollaborationFooter:", v40);

  v41 = -[LPQuotedTextViewStyle initWithPlatform:sizeClass:fontScalingFactor:]([LPQuotedTextViewStyle alloc], "initWithPlatform:sizeClass:fontScalingFactor:", a5, a6, v17->_leadingScalingFactor);
  quotedText = v17->_quotedText;
  v17->_quotedText = v41;

  defaultBackgroundColor(a5);
  v43 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v17->_backgroundColor;
  v17->_backgroundColor = (UIColor *)v43;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_1148);
  v45 = objc_claimAutoreleasedReturnValue();
  mediaBackgroundColor = v17->_mediaBackgroundColor;
  v17->_mediaBackgroundColor = (UIColor *)v45;

  if ((unint64_t)a5 > 6)
    v47 = 6;
  else
    v47 = qword_1A0D65EF8[a5];
  v17->_backgroundMaterial = v47;
  v48 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 350.0);
  maximumWidth = v17->_maximumWidth;
  v17->_maximumWidth = v48;

  v17->_widthFractionForTallMedia = 0.76;
  v50 = objc_alloc_init(LPImageViewStyle);
  mediaImage = v17->_mediaImage;
  v17->_mediaImage = v50;

  -[LPImageViewStyle setScalingMode:](v17->_mediaImage, "setScalingMode:", 2);
  -[LPImageViewStyle setFilter:](v17->_mediaImage, "setFilter:", 2);
  v52 = 0.03;
  if (a5 == 2)
    v52 = 0.0;
  -[LPImageViewStyle setDarkeningAmount:](v17->_mediaImage, "setDarkeningAmount:", v52);
  v53 = -[LPVisualMediaViewStyle initWithPlatform:]([LPVisualMediaViewStyle alloc], "initWithPlatform:", a5);
  mediaVideo = v17->_mediaVideo;
  v17->_mediaVideo = v53;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[LPCaptionBarStyle initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:]([LPCaptionBarStyle alloc], "initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:", a5, a6, v15, v17->_leadingScalingFactor);
  mediaTopCaptionBar = v17->_mediaTopCaptionBar;
  v17->_mediaTopCaptionBar = v55;

  -[LPCaptionBarStyle textStack](v17->_mediaTopCaptionBar, "textStack");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = MEMORY[0x1E0C809B0];
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_3;
  v103[3] = &unk_1E44A96D0;
  v59 = v98;
  v104 = v59;
  objc_msgSend(v57, "applyToAllTextViewStyles:", v103);

  v60 = -[LPCaptionBarStyle initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:]([LPCaptionBarStyle alloc], "initWithPlatform:sizeClass:sizeClassParameters:fontScalingFactor:", a5, a6, v15, v17->_leadingScalingFactor);
  mediaBottomCaptionBar = v17->_mediaBottomCaptionBar;
  v17->_mediaBottomCaptionBar = v60;

  -[LPCaptionBarStyle textStack](v17->_mediaBottomCaptionBar, "textStack");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v58;
  v101[1] = 3221225472;
  v101[2] = __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_4;
  v101[3] = &unk_1E44A96D0;
  v63 = v59;
  v102 = v63;
  objc_msgSend(v62, "applyToAllTextViewStyles:", v101);

  v64 = objc_alloc_init(LPImageViewStyle);
  placeholderImage = v17->_placeholderImage;
  v17->_placeholderImage = v64;

  v66 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 320.0, 180.0);
  -[LPImageViewStyle setFixedSize:](v17->_placeholderImage, "setFixedSize:", v66);

  +[LPTheme placeholderIconSizeInPoints](LPTheme, "placeholderIconSizeInPoints");
  v68 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v67);
  -[LPImageViewStyle setFixedFallbackImageSize:](v17->_placeholderImage, "setFixedFallbackImageSize:", v68);

  -[LPImageViewStyle setFixedFallbackImageWeight:](v17->_placeholderImage, "setFixedFallbackImageWeight:", &unk_1E44EEB28);
  -[LPImageViewStyle setScalingMode:](v17->_placeholderImage, "setScalingMode:", 3);
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPImageViewStyle setMaskColor:](v17->_placeholderImage, "setMaskColor:", v69);

  if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC4B70]);
    v70 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v109 = *MEMORY[0x1E0DC4A40];
    v107 = *MEMORY[0x1E0DC4BA8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC4B98]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v71;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    fontWithTraitsAndAttributes((void *)*MEMORY[0x1E0DC4A98], 0, v73, a6);
    v70 = objc_claimAutoreleasedReturnValue();

  }
  domainNameIndicatorFont = v17->_domainNameIndicatorFont;
  v17->_domainNameIndicatorFont = (UIFont *)v70;

  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", fmax(v17->_leadingScalingFactor, 1.0) * 17.0, *MEMORY[0x1E0DC4B90]);
  v75 = objc_claimAutoreleasedReturnValue();
  domainNameIndicatorIconFont = v17->_domainNameIndicatorIconFont;
  v17->_domainNameIndicatorIconFont = (UIFont *)v75;

  v77 = objc_alloc_init(LPImageViewStyle);
  backgroundImage = v17->_backgroundImage;
  v17->_backgroundImage = v77;

  -[LPImageViewStyle setScalingMode:](v17->_backgroundImage, "setScalingMode:", 2);
  v79 = -[LPContactsBadgeStyle initWithPlatform:]([LPContactsBadgeStyle alloc], "initWithPlatform:", a5);
  contactsBadgeStyle = v17->_contactsBadgeStyle;
  v17->_contactsBadgeStyle = v79;

  v81 = -[LPIndeterminateProgressSpinnerStyle initWithPlatform:sizeClass:fontScalingFactor:]([LPIndeterminateProgressSpinnerStyle alloc], "initWithPlatform:sizeClass:fontScalingFactor:", a5, a6, v17->_leadingScalingFactor);
  progressSpinner = v17->_progressSpinner;
  v17->_progressSpinner = v81;

  if ((unint64_t)a5 < 5)
    goto LABEL_15;
  if (a5 == 5)
  {
    if (a6 == 1)
    {
      v84 = (void *)defaultCornerRadius_tinyVisionSize;
      if (defaultCornerRadius_tinyVisionSize)
        goto LABEL_18;
      v85 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
      v86 = &defaultCornerRadius_tinyVisionSize;
    }
    else
    {
      v84 = (void *)defaultCornerRadius_visionSize;
      if (defaultCornerRadius_visionSize)
        goto LABEL_18;
      v85 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 22.0);
      v86 = &defaultCornerRadius_visionSize;
    }
    goto LABEL_17;
  }
  if (a5 == 6)
  {
LABEL_15:
    v84 = (void *)defaultCornerRadius_normalSize;
    if (defaultCornerRadius_normalSize)
    {
LABEL_18:
      v83 = v84;
      goto LABEL_19;
    }
    v85 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
    v86 = &defaultCornerRadius_normalSize;
LABEL_17:
    v87 = (void *)*v86;
    *v86 = (uint64_t)v85;

    v84 = (void *)*v86;
    goto LABEL_18;
  }
LABEL_19:
  cornerRadius = v17->_cornerRadius;
  v17->_cornerRadius = v83;

  -[LPTheme adjustForStyle](v17, "adjustForStyle");
  -[LPCaptionBarStyle textStack](v17->_captionBar, "textStack");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "captionTextPadding");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90 && objc_msgSend(v15, "alignTextAndMediaHorizontalEdges"))
  {
    +[LPPointUnit zero](LPPointUnit, "zero");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setLeading:", v91);

    +[LPPointUnit zero](LPPointUnit, "zero");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setTrailing:", v92);

  }
  -[LPTextViewStyle padding](v17->_quotedText, "padding", v98);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93 && objc_msgSend(v15, "alignTextAndMediaHorizontalEdges"))
  {
    +[LPPointUnit zero](LPPointUnit, "zero");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setLeading:", v94);

    +[LPPointUnit zero](LPPointUnit, "zero");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setTrailing:", v95);

  }
  v96 = v17;

LABEL_26:
  return v17;
}

id __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", (double)objc_msgSend(v2, "_lp_prefersDarkInterface"), 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_2(uint64_t a1, void *a2)
{
  int v2;
  id *v3;

  v2 = objc_msgSend(a2, "_lp_prefersDarkInterface");
  v3 = (id *)MEMORY[0x1E0CD2EA0];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0CD2E98];
  return *v3;
}

void __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setColor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setMaximumLines:", 1);

}

void __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setColor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setMaximumLines:", 1);

}

- (void)_adjustForStyleWithFullWidthBottomButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenuBackgroundColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", v16);

  fontWithTraits((void *)*MEMORY[0x1E0DC4A98], 2, self->_sizeClass);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenuFont:", v17);

  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPrefersBehavioralStylePad:", 1);

  -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
  -[LPCaptionBarStyle setButtonIgnoresTextSafeAreaInsets:](self->_captionBar, "setButtonIgnoresTextSafeAreaInsets:", 1);
  -[LPCaptionBarStyle setAddFullWidthLineForButton:](self->_captionBar, "setAddFullWidthLineForButton:", 1);
  outerHorizontalTextMargin((id)self->_platform);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "margin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeading:", v19);

  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "margin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrailing:", v19);

  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "margin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBottom:", v19);

  +[LPPointUnit zero](LPPointUnit, "zero");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "margin");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTop:", v12);

}

- (void)_adjustForEnrichedBusinessChatStyle
{
  id v3;

  -[LPTheme _adjustForStyleWithFullWidthBottomButton](self, "_adjustForStyleWithFullWidthBottomButton");
  -[LPCaptionBarStyle button](self->_captionBar, "button");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBehavior:", 1);

}

- (void)_adjustForAppleMusicCollaborativePlaylistStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  LPPointUnit *v20;
  void *v21;
  void *v22;
  LPPointUnit *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  -[LPTheme _adjustForStyleWithFullWidthBottomButton](self, "_adjustForStyleWithFullWidthBottomButton");
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v30);

  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUseFullWidth:", 1);

  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUseSafeAreaInsetWithPadding:", 1);

  outerHorizontalTextMargin((id)self->_platform);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "margin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeading:", v33);

  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "margin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTrailing:", v33);

  +[LPPointUnit zero](LPPointUnit, "zero");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "margin");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTop:", v11);

  +[LPPointUnit zero](LPPointUnit, "zero");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "margin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBottom:", v14);

  +[LPPointUnit zero](LPPointUnit, "zero");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "padding");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTop:", v17);

  v20 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "padding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBottom:", v20);

  v23 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "separatorMargin");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBottom:", v23);

  +[LPPointUnit zero](LPPointUnit, "zero");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "separatorMargin");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTop:", v26);

}

- (void)adjustForStyle
{
  unint64_t v2;
  LPPointUnit *v4;
  LPSize *p_quotedText;
  unint64_t sizeClass;
  unint64_t platform;
  BOOL v8;
  uint64_t v9;
  uint64_t *v11;
  void *v12;
  double v13;
  LPPointUnit *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  UIColor *v18;
  UIColor *v19;
  LPSize *v20;
  void *v21;
  void *v22;
  LPPointUnit *v23;
  void *v24;
  LPPointUnit *v25;
  void *v26;
  void *v27;
  LPPointUnit *v28;
  void *v29;
  void *v30;
  LPPointUnit *v31;
  void *v32;
  void *v33;
  LPPointUnit *v34;
  void *v35;
  void *v36;
  LPPointUnit *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  UIColor *v69;
  UIColor *v70;
  LPSize *v71;
  void *v72;
  LPPointUnit *v73;
  void *v74;
  LPPointUnit *v75;
  void *v76;
  void *v77;
  LPPointUnit *v78;
  void *v79;
  void *v80;
  LPPointUnit *v81;
  void *v82;
  void *v83;
  LPPointUnit *v84;
  void *v85;
  void *v86;
  LPPointUnit *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  uint64_t v106;
  UIColor *v107;
  UIColor *backgroundColor;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  unsigned int v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  LPPointUnit *v120;
  void *v121;
  void *v122;
  LPPointUnit *v123;
  void *v124;
  void *v125;
  LPPointUnit *v126;
  void *v127;
  void *v128;
  LPPointUnit *v129;
  uint64_t v130;
  double v131;
  double v132;
  unint64_t v133;
  void *v134;
  void *v135;
  UIColor *v136;
  UIColor *mediaBackgroundColor;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  LPSize *v154;
  LPSize *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  LPPointUnit *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  LPPointUnit *v178;
  unint64_t v179;
  void *v180;
  unint64_t v181;
  void *v182;
  LPTapToLoadViewStyle *v183;
  LPTapToLoadViewStyle *tapToLoad;
  void *v185;
  void *v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  LPSize *v194;
  BOOL v195;
  LPCaptionBarStyle *captionBar;
  id v197;
  unint64_t v198;
  double v199;
  LPSize *v200;
  LPPointUnit *v201;
  LPPointUnit *v202;
  void *v203;
  LPPointUnit *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  LPPointUnit *v213;
  void *v214;
  LPPointUnit *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  LPPointUnit *v220;
  void *v221;
  void *v222;
  LPPointUnit *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  LPPointUnit *v246;
  void *v247;
  void *v248;
  LPPointUnit *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  UIColor *v259;
  UIColor *v260;
  void *v261;
  void *v262;
  void *v263;
  LPSize *v264;
  LPImageViewStyle **p_mediaImage;
  unint64_t v266;
  uint64_t *v267;
  void *v268;
  double v269;
  LPPointUnit *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  UIColor *v278;
  UIColor *v279;
  LPSize *v280;
  unint64_t v281;
  uint64_t *v282;
  void *v283;
  double v284;
  LPPointUnit *v285;
  void *v286;
  LPSize *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  UIColor *v298;
  UIColor *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  LPSize *v313;
  void *v314;
  LPPointUnit *v315;
  void *v316;
  void *v317;
  LPPointUnit *v318;
  void *v319;
  void *v320;
  void *v321;
  LPPointUnit *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  LPSize *v358;
  void *v359;
  id v360;
  void *v361;
  void *v362;
  LPPointUnit *v363;
  void *v364;
  void *v365;
  LPPointUnit *v366;
  LPPointUnit *maximumWidth;
  LPPointUnit *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  LPPointUnit *v379;
  LPPointUnit *v380;
  LPPointUnit *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  LPPointUnit *v393;
  void *v394;
  void *v395;
  LPPointUnit *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  LPPointUnit *v402;
  void *v403;
  void *v404;
  LPPointUnit *v405;
  void *v406;
  void *v407;
  LPPointUnit *v408;
  void *v409;
  void *v410;
  LPPointUnit *v411;
  void *v412;
  void *v413;
  LPPointUnit *v414;
  LPPointUnit *v415;
  LPPointUnit *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  LPPointUnit *v428;
  void *v429;
  void *v430;
  LPPointUnit *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  LPPointUnit *v437;
  void *v438;
  void *v439;
  LPPointUnit *v440;
  void *v441;
  void *v442;
  LPPointUnit *v443;
  void *v444;
  void *v445;
  LPPointUnit *v446;
  void *v447;
  void *v448;
  LPPointUnit *v449;
  LPPointUnit *v450;
  LPPointUnit *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  BOOL v456;
  LPCaptionBarStyle *v457;
  id v458;
  LPPointUnit *v459;
  void *v460;
  void *v461;
  id v462;
  unint64_t v463;
  void *v464;
  LPSize *v465;
  uint64_t *v466;
  uint64_t *v467;
  void *v468;
  double v469;
  LPSize *v470;
  void *v471;
  id v472;
  void *v473;
  LPSize *v474;
  void *v475;
  void *v476;
  LPSize *v477;
  void *v478;
  LPPointUnit *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  LPPointUnit *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  LPPointUnit *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  LPPointUnit *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  int64_t style;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  void *v523;
  void *v524;
  LPSize *v525;
  void *v526;
  double v527;
  LPSize *v528;
  void *v529;
  void *v530;
  LPSize *v531;
  void *v532;
  id v533;
  void *v534;
  void *v535;
  int v536;
  LPPointUnit *v537;
  double v538;
  LPPointUnit *v539;
  void *v540;
  void *v541;
  void *v542;
  LPPointUnit *v543;
  void *v544;
  void *v545;
  void *v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  int64_t v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  void *v568;
  void *v569;
  void *v570;
  void *v571;
  void *v572;
  void *v573;
  void *v574;
  LPPointUnit *v575;
  void *v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  LPPointUnit *v581;
  void *v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  LPPointUnit *v588;
  void *v589;
  void *v590;
  LPPointUnit *v591;
  void *v592;
  void *v593;
  LPPointUnit *v594;
  void *v595;
  void *v596;
  void *v597;
  void *v598;
  void *v599;
  void *v600;
  void *v601;
  LPPointUnit *v602;
  void *v603;
  void *v604;
  LPPointUnit *v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  BOOL v611;
  LPCaptionBarStyle *v612;
  id v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  LPPointUnit *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  id v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  BOOL v636;
  LPCaptionBarStyle *v637;
  id v638;
  int64_t v639;
  unint64_t v640;
  uint64_t v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  unint64_t v646;
  unint64_t v647;
  uint64_t v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  LPPointUnit *v653;
  void *v654;
  LPPointUnit *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  UIColor *v666;
  UIColor *v667;
  LPPointUnit *v668;
  void *v669;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  void *v674;
  void *v675;
  UIColor *v676;
  UIColor *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  LPPointUnit *v683;
  void *v684;
  LPPointUnit *v685;
  void *v686;
  LPPointUnit *v687;
  void *v688;
  LPPointUnit *v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  void *v694;
  void *v695;
  void *v696;
  void *v697;
  unint64_t v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  LPPointUnit *v703;
  void *v704;
  void *v705;
  void *v706;
  void *v707;
  LPPointUnit *v708;
  void *v709;
  void *v710;
  void *v711;
  void *v712;
  uint64_t *v713;
  void *v714;
  double v715;
  unint64_t v716;
  LPPointUnit *v717;
  void *v718;
  void *v719;
  void *v720;
  void *v721;
  void *v722;
  void *v723;
  void *v724;
  LPSize *v725;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  void *v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  void *v737;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  double v742;
  double v743;
  void *v744;
  void *v745;
  double v746;
  double v747;
  void *v748;
  void *v749;
  void *v750;
  LPPointUnit *v751;
  void *v752;
  void *v753;
  void *v754;
  void *v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  LPPointUnit *v760;
  void *v761;
  void *v762;
  LPPointUnit *v763;
  void *v764;
  LPPointUnit *v765;
  void *v766;
  void *v767;
  void *v768;
  void *v769;
  void *v770;
  LPPointUnit *v771;
  void *v772;
  void *v773;
  LPPointUnit *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  void *v779;
  void *v780;
  int64_t v781;
  void *v782;
  void *v783;
  LPPointUnit *v784;
  double v785;
  LPPointUnit *v786;
  void *v787;
  LPPointUnit *v788;
  void *v789;
  void *v790;
  unint64_t v791;
  LPPointUnit *v792;
  LPPointUnit *cornerRadius;
  void *v794;
  unint64_t v795;
  Class v796;
  double v797;
  LPPointUnit *v798;
  Class isa;
  LPPointUnit *v800;
  unint64_t v801;
  uint64_t *v802;
  void *v803;
  double v804;
  LPSize *v805;
  void *v806;
  void *v807;
  unint64_t v808;
  uint64_t *v809;
  void *v810;
  double v811;
  LPPointUnit *v812;
  void *v813;
  void *v814;
  uint64_t v815;
  LPPointUnit *v816;
  void *v817;
  void *v818;
  void *v819;
  uint64_t v820;
  void *v821;
  void *v822;
  uint64_t v823;
  void *v824;
  void *v825;
  void *v826;
  void *v827;
  void *v828;
  LPPointUnit *v829;
  void *v830;
  uint64_t v831;
  void *v832;
  uint64_t v833;
  void *v834;
  uint64_t v835;
  void *v836;
  void *v837;
  void *v838;
  void *v839;
  LPPointUnit *v840;
  void *v841;
  void *v842;
  void *v843;
  void *v844;
  LPSize *v845;
  void *v846;
  void *v847;
  void *v848;
  void *v849;
  void *v850;
  void *v851;
  void *v852;
  LPPointUnit *v853;
  void *v854;
  unint64_t v855;
  void *v856;
  void *v857;
  unint64_t v858;
  UIColor *v859;
  UIColor *v860;
  LPPointUnit *v861;
  void *v862;
  void *v863;
  void *v864;
  void *v865;
  void *v866;
  void *v867;
  void *v868;
  uint64_t v869;
  LPPointUnit *v870;
  void *v871;
  void *v872;
  void *v873;
  uint64_t v874;
  void *v875;
  void *v876;
  uint64_t v877;
  void *v878;
  void *v879;
  void *v880;
  void *v881;
  void *v882;
  uint64_t v883;
  void *v884;
  void *v885;
  void *v886;
  void *v887;
  void *v888;
  void *v889;
  void *v890;
  UIColor *v891;
  UIColor *v892;
  LPPointUnit *v893;
  LPPointUnit *v894;
  void *v895;
  void *v896;
  void *v897;
  void *v898;
  void *v899;
  void *v900;
  void *v901;
  void *v902;
  void *v903;
  void *v904;
  void *v905;
  void *v906;
  void *v907;
  _BOOL4 v908;
  void *v909;
  int64_t v910;
  LPPointUnit *v911;
  void *v912;
  void *v913;
  void *v914;
  double v915;
  LPSize *v916;
  void *v917;
  LPPointUnit *v918;
  void *v919;
  void *v920;
  void *v921;
  void *v922;
  LPPointUnit *v923;
  void *v924;
  LPPointUnit *v925;
  void *v926;
  void *v927;
  void *v928;
  void *v929;
  void *v930;
  void *v931;
  LPPointUnit *v932;
  void *v933;
  void *v934;
  LPPointUnit *v935;
  void *v936;
  void *v937;
  LPPointUnit *v938;
  void *v939;
  void *v940;
  LPPointUnit *v941;
  void *v942;
  void *v943;
  LPPointUnit *v944;
  void *v945;
  void *v946;
  LPPointUnit *v947;
  void *v948;
  void *v949;
  void *v950;
  void *v951;
  void *v952;
  void *v953;
  void *v954;
  void *v955;
  void *v956;
  void *v957;
  void *v958;
  void *v959;
  double v960;
  double v961;
  void *v962;
  void *v963;
  void *v964;
  double v965;
  LPPointUnit *v966;
  void *v967;
  void *v968;
  id v969;
  LPSize *v970;
  void *v971;
  void *v972;
  void *v973;
  void *v974;
  void *v975;
  unint64_t v976;
  void *v977;
  void *v978;
  void *v979;
  void *v980;
  void *v981;
  LPPointUnit *v982;
  void *v983;
  LPPointUnit *v984;
  void *v985;
  void *v986;
  LPCaptionBarStyle *v987;
  void *v988;
  void *v989;
  void *v990;
  void *v991;
  void *v992;
  void *v993;
  void *v994;
  void *v995;
  void *v996;
  void *v997;
  void *v998;
  LPSize *v999;
  void *v1000;
  void *v1001;
  void *v1002;
  void *v1003;
  void *v1004;
  void *v1005;
  void *v1006;
  void *v1007;
  void *v1008;
  void *v1009;
  void *v1010;
  void *v1011;
  void *v1012;
  void *v1013;
  void *v1014;
  void *v1015;
  void *v1016;
  void *v1017;
  void *v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  void *v1022;
  void *v1023;
  void *v1024;
  void *v1025;
  LPPointUnit *v1026;
  void *v1027;
  uint64_t v1028;
  void *v1029;
  void *v1030;
  LPPointUnit *v1031;
  LPPointUnit *v1032;
  void *v1033;
  void *v1034;
  void *v1035;
  void *v1036;
  void *v1037;
  void *v1038;
  void *v1039;
  void *v1040;
  void *v1041;
  void *v1042;
  void *v1043;
  void *v1044;
  void *v1045;
  void *v1046;
  void *v1047;
  void *v1048;
  void *v1049;
  uint64_t v1050;
  void *v1051;
  void *v1052;
  void *v1053;
  void *v1054;
  void *v1055;
  void *v1056;
  void *v1057;
  void *v1058;
  uint64_t v1059;
  void *v1060;
  void *v1061;
  void *v1062;
  void *v1063;
  void *v1064;
  void *v1065;
  void *v1066;
  void *v1067;
  void *v1068;
  void *v1069;
  void *v1070;
  void *v1071;
  void *v1072;
  void *v1073;
  uint64_t v1074;
  void *v1075;
  void *v1076;
  void *v1077;
  LPPointUnit *v1078;
  void *v1079;
  void *v1080;
  LPPointUnit *v1081;
  void *v1082;
  void *v1083;
  LPPointUnit *v1084;
  void *v1085;
  void *v1086;
  void *v1087;
  void *v1088;
  void *v1089;
  LPPointUnit *v1090;
  void *v1091;
  void *v1092;
  LPPointUnit *v1093;
  void *v1094;
  void *v1095;
  id v1096;
  _QWORD v1097[5];
  _QWORD v1098[4];
  char v1099;
  _QWORD v1100[4];
  char v1101;
  _QWORD v1102[4];
  id v1103;
  _QWORD v1104[4];
  id v1105;
  _QWORD v1106[4];
  id v1107;
  _QWORD v1108[4];
  id v1109;
  _QWORD v1110[4];
  id v1111;
  _QWORD v1112[4];
  char v1113;
  _QWORD v1114[4];
  BOOL v1115;
  _QWORD v1116[5];
  uint64_t v1117;
  void *v1118;
  uint64_t v1119;
  _QWORD v1120[3];

  v1120[1] = *MEMORY[0x1E0C80C00];
  v4 = (LPPointUnit *)sizeClassAllowsMedia(self->_sizeClass);
  p_quotedText = (LPSize *)v4;
  sizeClass = self->_sizeClass;
  switch(sizeClass)
  {
    case 1uLL:
      platform = self->_platform;
      v8 = platform > 6;
      v9 = (1 << platform) & 0x75;
      if (v8 || v9 == 0)
      {
        v11 = &tinyIconSize_macSize;
        v12 = (void *)tinyIconSize_macSize;
        if (tinyIconSize_macSize)
          goto LABEL_128;
        v13 = 16.0;
      }
      else
      {
        v11 = &tinyIconSize_iOSSize;
        v12 = (void *)tinyIconSize_iOSSize;
        if (tinyIconSize_iOSSize)
        {
LABEL_128:
          v472 = v12;
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v473 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v473, "setFixedFallbackImageSize:", v472);

          v474 = [LPSize alloc];
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v475 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v475, "fixedFallbackImageSize");
          v476 = (void *)objc_claimAutoreleasedReturnValue();
          v477 = -[LPSize initWithSquarePoints:](v474, "initWithSquarePoints:", v476);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v478 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v478, "setFixedSize:", v477);

          v479 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v480 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v480, "margin");
          v481 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v481, "setLeading:", v479);

          +[LPPointUnit zero](LPPointUnit, "zero");
          v482 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v483 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v483, "margin");
          v484 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v484, "setTrailing:", v482);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v485 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v485, "margin");
          v486 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v486, "setTop:", v479);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v487 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v487, "margin");
          v488 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v488, "setBottom:", v479);

          v489 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 5.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v490, "setCornerRadius:", v489);

          if (self->_isFallbackIcon)
          {
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v491 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v491, "setFilter:", 11);

            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
            v492 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v493 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v493, "setMaskColor:", v492);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v494 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v494, "setScalingMode:", 3);

            v495 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", -3.0);
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v496 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v496, "padding");
            v497 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v497, "setTop:", v495);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v498 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v498, "padding");
            v499 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v499, "setLeading:", v495);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v500 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v500, "padding");
            v501 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v501, "setBottom:", v495);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v502 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v502, "padding");
            v503 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v503, "setTrailing:", v495);

          }
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v504 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v504, "captionTextPadding");
          v505 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v505, "setLeading:", v479);

          v506 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v507 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v507, "captionTextPadding");
          v508 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v508, "setTrailing:", v506);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v509 = (void *)objc_claimAutoreleasedReturnValue();
          v1116[0] = MEMORY[0x1E0C809B0];
          v1116[1] = 3221225472;
          v1116[2] = __25__LPTheme_adjustForStyle__block_invoke;
          v1116[3] = &unk_1E44A96D0;
          v1116[4] = self;
          objc_msgSend(v509, "applyToAllTextViewStyles:", v1116);

          +[LPPointUnit zero](LPPointUnit, "zero");
          v510 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v511 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v511, "setFirstLineLeading:", v510);

          +[LPPointUnit zero](LPPointUnit, "zero");
          v512 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v513 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v513, "setLastLineDescent:", v512);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v514 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v514, "setShouldAlignToBaselines:", 0);

          style = self->_style;
          if (style == 12)
          {
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v516 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v516, "setFilter:", 5);

            style = self->_style;
          }
          if (style == 18)
          {
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v517 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v517, "setFilter:", 6);

          }
          return;
        }
        v13 = 24.0;
      }
      v14 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v13);
      v15 = (void *)*v11;
      *v11 = (uint64_t)v14;

      v12 = (void *)*v11;
      goto LABEL_128;
    case 2uLL:
      if (-[LPLinkRendererSizeClassParameters disableTextWrapping](self->_sizeClassParameters, "disableTextWrapping")
        || self->_platform != 2
        && UIContentSizeCategoryCompareToCategory(self->_preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E0DC48F8]) == NSOrderedAscending)
      {
        v16 = 0;
        v17 = self->_platform == 1;
      }
      else
      {
        v16 = 1;
        v17 = 1;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v107 = (UIColor *)objc_claimAutoreleasedReturnValue();
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v107;

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "topCaption");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = MEMORY[0x1E0C809B0];
      v1114[0] = MEMORY[0x1E0C809B0];
      v1114[1] = 3221225472;
      v1114[2] = __25__LPTheme_adjustForStyle__block_invoke_2;
      v1114[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
      v1115 = v17;
      objc_msgSend(v110, "applyToAllTextViewStyles:", v1114);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setFirstLineLeading:", v112);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setLastLineDescent:", v114);

      if (v17)
        v116 = 3;
      else
        v116 = 2;
      if (v16)
        v117 = 4;
      else
        v117 = v116;
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "setMaximumNumberOfLines:", v117);

      v119 = self->_platform;
      if (v119 > 6)
        goto LABEL_137;
      if (((1 << v119) & 0x59) != 0)
      {
        v120 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 17.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "captionTextPadding");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setTop:", v120);

        v123 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 18.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "captionTextPadding");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setBottom:", v123);
      }
      else if (v119 == 2)
      {
        pt(3.0);
        v518 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v519 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v519, "captionTextPadding");
        v520 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v520, "setTop:", v518);

        pt(4.0);
        v123 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "captionTextPadding");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setBottom:", v123);
      }
      else
      {
        if (v119 != 5)
          goto LABEL_137;
        v126 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 22.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "captionTextPadding");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "setTop:", v126);

        v123 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 22.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "captionTextPadding");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setBottom:", v123);
      }

LABEL_137:
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v521 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v521, "bottomCaption");
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      v1112[0] = v111;
      v1112[1] = 3221225472;
      v1112[2] = __25__LPTheme_adjustForStyle__block_invoke_3;
      v1112[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
      v1113 = v16;
      objc_msgSend(v522, "applyToAllTextViewStyles:", v1112);

      if (self->_platform == 2)
      {
        cardHeadingIconSize(2uLL, v523);
        v524 = (void *)objc_claimAutoreleasedReturnValue();
        v525 = [LPSize alloc];
        objc_msgSend(v524, "height");
        v526 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v526, "value");
        v528 = -[LPSize initWithSize:](v525, "initWithSize:", 0.0, v527);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v529 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v529, "setMinimumSize:", v528);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v530 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v530, "setFixedSize:", v524);

      }
      else
      {
        v531 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 28.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v532 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v532, "setMinimumSize:", v531);

        cardHeadingIconSize(self->_platform, v533);
        v534 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v535 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v535, "setFixedSize:", v534);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v524 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v524, "setRequireFixedSize:", 1);
      }

      v536 = stylePrefersSmallerCornerRadiusInCardHeading(self->_style);
      v537 = [LPPointUnit alloc];
      v538 = 4.0;
      if (v536)
        v538 = 3.0;
      v539 = -[LPPointUnit initWithValue:](v537, "initWithValue:", v538);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v540, "setCornerRadius:", v539);

      if (self->_platform != 5)
      {
        +[LPShadowStyle cardHeadingIconShadow](LPShadowStyle, "cardHeadingIconShadow");
        v541 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v542 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v542, "setShadow:", v541);

      }
      v543 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 17.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "setFixedFallbackImageSize:", v543);

      if (-[LPLinkRendererSizeClassParameters onlyShowIcon](self->_sizeClassParameters, "onlyShowIcon"))
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v545 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v545, "setRequireFixedSize:", 0);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v546 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v546, "setScalesToFitParent:", 1);

      }
      +[LPPointUnit zero](LPPointUnit, "zero");
      v547 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v548, "margin");
      v549 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v549, "setLeading:", v547);

      cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
      v550 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v551 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v551, "margin");
      v552 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v552, "setTop:", v550);

      cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
      v553 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v554 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v554, "margin");
      v555 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v555, "setBottom:", v553);

      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v556, "setFilter:", 13);

      applyCommonCardHeadingCaptionBarProperties(self->_captionBar, self->_platform, self->_style, self->_sizeClass, self->_isFallbackIcon);
      -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
      v557 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v557, "setShowSeparator:", 0);

      v558 = self->_platform;
      if (v558 == 5)
      {
        +[LPPointUnit zero](LPPointUnit, "zero");
        v559 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v560 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v560, "margin");
        v561 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v561, "setBottom:", v559);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v562 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v563 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v563, "margin");
        v564 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v564, "setTop:", v562);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v565 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v566 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v566, "margin");
        v567 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v567, "setTrailing:", v565);

        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v568 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v568, "setIgnoreSafeAreaInset:", 1);

        v558 = self->_platform;
      }
      if (v558 == 1)
      {
        if (self->_hasButton)
        {
          +[LPPointUnit zero](LPPointUnit, "zero");
          v569 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle button](self->_captionBar, "button");
          v570 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v570, "margin");
          v571 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v571, "setLeading:", v569);

          +[LPPointUnit zero](LPPointUnit, "zero");
          v572 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle button](self->_captionBar, "button");
          v573 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v573, "margin");
          v574 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v574, "setBottom:", v572);

          v575 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
          -[LPCaptionBarStyle button](self->_captionBar, "button");
          v576 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v576, "margin");
          v577 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v577, "setTop:", v575);

          +[LPPointUnit zero](LPPointUnit, "zero");
          v578 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle button](self->_captionBar, "button");
          v579 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v579, "margin");
          v580 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v580, "setTrailing:", v578);

          -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
          -[LPCaptionBarStyle setAddFullWidthLineForButton:](self->_captionBar, "setAddFullWidthLineForButton:", 1);
          -[LPCaptionBarStyle setButtonIgnoresTextSafeAreaInsets:](self->_captionBar, "setButtonIgnoresTextSafeAreaInsets:", 1);
          v581 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
        }
        else
        {
          v581 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
        }
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v582 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v582, "margin");
        v583 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v583, "setTop:", v581);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v584 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v585 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v585, "margin");
        v586 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v586, "setBottom:", v584);

        v588 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 2.0);
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v589 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v589, "padding");
        v590 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v590, "setTop:", v588);

        v591 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 0.5);
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v592 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v592, "padding");
        v593 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v593, "setBottom:", v591);

        v594 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v595 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v595, "padding");
        v596 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v596, "setLeading:", v594);

        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v597 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v597, "padding");
        v598 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v598, "leading");
        v599 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v600 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v600, "padding");
        v601 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v601, "setTrailing:", v599);

        v602 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 5.0);
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v603 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v603, "setCornerRadius:", v602);

      }
      else
      {
        -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
        v587 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v587, "setUseFullWidth:", 0);

      }
      return;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v19 = self->_backgroundColor;
      self->_backgroundColor = v18;

      v20 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 26.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFixedSize:", v20);

      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setOpacity:", 0.5);

      v23 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCornerRadius:", v23);

      v25 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "margin");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTop:", v25);

      v28 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "margin");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setLeading:", v28);

      v31 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "captionTextPadding");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLeading:", v31);

      v34 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 14.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "captionTextPadding");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTrailing:", v34);

      v37 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 7.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "captionTextPadding");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setTop:", v37);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "captionTextPadding");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "top");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "captionTextPadding");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBottom:", v42);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFirstLineLeading:", v45);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setLastLineDescent:", v47);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setShouldAlignToBaselines:", 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "colorWithAlphaComponent:", 0.5);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "colorWithAlphaComponent:", 0.25);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "aboveTopCaption");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = MEMORY[0x1E0C809B0];
      v1110[0] = MEMORY[0x1E0C809B0];
      v1110[1] = 3221225472;
      v1110[2] = __25__LPTheme_adjustForStyle__block_invoke_4;
      v1110[3] = &unk_1E44A96D0;
      v57 = v51;
      v1111 = v57;
      objc_msgSend(v55, "applyToAllTextViewStyles:", v1110);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "topCaption");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v1108[0] = v56;
      v1108[1] = 3221225472;
      v1108[2] = __25__LPTheme_adjustForStyle__block_invoke_5;
      v1108[3] = &unk_1E44A96D0;
      v60 = v57;
      v1109 = v60;
      objc_msgSend(v59, "applyToAllTextViewStyles:", v1108);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "bottomCaption");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v1106[0] = v56;
      v1106[1] = 3221225472;
      v1106[2] = __25__LPTheme_adjustForStyle__block_invoke_6;
      v1106[3] = &unk_1E44A96D0;
      v63 = v53;
      v1107 = v63;
      objc_msgSend(v62, "applyToAllTextViewStyles:", v1106);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "belowBottomCaption");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v1104[0] = v56;
      v1104[1] = 3221225472;
      v1104[2] = __25__LPTheme_adjustForStyle__block_invoke_7;
      v1104[3] = &unk_1E44A96D0;
      v66 = v63;
      v1105 = v66;
      objc_msgSend(v65, "applyToAllTextViewStyles:", v1104);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "applyToAllTextViewStyles:", &__block_literal_global_974);

      if (self->_isFallbackIcon)
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        applyFallbackIconProperties(v68, self->_platform, self->_style, self->_sizeClass);

      }
      return;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v69 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v70 = self->_backgroundColor;
      self->_backgroundColor = v69;

      v71 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 26.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setFixedSize:", v71);

      v73 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setCornerRadius:", v73);

      v75 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "margin");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setTop:", v75);

      v78 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
      -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "margin");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setLeading:", v78);

      v81 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "captionTextPadding");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setLeading:", v81);

      v84 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "captionTextPadding");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setTrailing:", v84);

      v87 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 5.0);
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "captionTextPadding");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setTop:", v87);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "captionTextPadding");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "top");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "captionTextPadding");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setBottom:", v92);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setFirstLineLeading:", v95);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setLastLineDescent:", v97);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setShouldAlignToBaselines:", 0);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "applyToAllTextViewStyles:", &__block_literal_global_975);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "topCaption");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "applyToAllTextViewStyles:", &__block_literal_global_976);

      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "bottomCaption");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "applyToAllTextViewStyles:", &__block_literal_global_977);

      if (self->_isFallbackIcon)
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v1096 = (id)objc_claimAutoreleasedReturnValue();
        applyFallbackIconProperties(v1096, self->_platform, self->_style, self->_sizeClass);

      }
      return;
    default:
      v105 = self->_style;
      if (v105 != 3)
        goto LABEL_49;
      v2 = self->_platform;
      if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
      {
        objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4BA0]);
        v106 = objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      if (v2 > 6)
        goto LABEL_385;
      if (((1 << v2) & 0x53) != 0)
      {
        fontWithTraits((void *)*MEMORY[0x1E0DC4A90], 0, sizeClass);
        v106 = objc_claimAutoreleasedReturnValue();
      }
      else if (v2 == 2)
      {
        fontWithTraits((void *)*MEMORY[0x1E0DC4AC8], 0x8000, sizeClass);
        v106 = objc_claimAutoreleasedReturnValue();
      }
      else if (v2 == 5)
      {
        fontWithTraits((void *)*MEMORY[0x1E0DC4A88], 0, sizeClass);
        v106 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_385:
        objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4BA0]);
        v106 = objc_claimAutoreleasedReturnValue();
      }
LABEL_37:
      v129 = (LPPointUnit *)v106;
      -[LPTextViewStyle setFont:](self->_quotedText, "setFont:", v106);

      -[LPQuotedTextViewStyle setMaximumLinesToConsiderShort:](self->_quotedText, "setMaximumLinesToConsiderShort:", 0);
      -[LPTextViewStyle setMaximumCharacters:](self->_quotedText, "setMaximumCharacters:", 0);
      if (self->_platform == 2)
        v130 = 7;
      else
        v130 = 30;
      -[LPTextViewStyle setMaximumLines:](self->_quotedText, "setMaximumLines:", v130);
      -[LPTextViewStyle setMaximumLinesWithMedia:](self->_quotedText, "setMaximumLinesWithMedia:", 7);
      -[LPLinkRendererSizeClassParameters minimumMediaCornerRadius](self->_sizeClassParameters, "minimumMediaCornerRadius");
      v132 = v131;
      if (v131 == 0.0)
      {
        v133 = self->_platform;
        if (v133 <= 6)
          v129 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", dbl_1A0D65F30[v133]);
        -[LPTextViewStyle padding](self->_quotedText, "padding");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "setTop:", v129);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPTextViewStyle padding](self->_quotedText, "padding");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "setBottom:", v135);

      }
      -[LPQuotedTextViewStyle setShowQuoteIndicator:](self->_quotedText, "setShowQuoteIndicator:", 0);
      -[LPQuotedTextViewStyle setShowCharacterLimitIndicator:](self->_quotedText, "setShowCharacterLimitIndicator:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v136 = (UIColor *)objc_claimAutoreleasedReturnValue();
      mediaBackgroundColor = self->_mediaBackgroundColor;
      self->_mediaBackgroundColor = v136;

      if (self->_sizeClass != 8)
      {
        if (v132 == 0.0)
        {
          pt(self->_leadingScalingFactor * 24.0);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "setFirstLineLeading:", v138);

          pt(self->_leadingScalingFactor * 13.0);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setLastLineDescent:", v140);

          tweetTextToIconPadding((LPPointUnit *)self->_platform);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "captionTextPadding");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "setLeading:", v142);

          tweetTextOuterPadding((LPPointUnit *)self->_platform);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "captionTextPadding");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "setTrailing:", v145);

        }
        outerHorizontalTextMargin((id)self->_platform);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "margin");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "setLeading:", v148);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "margin");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "setTrailing:", v151);

        v154 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 25.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "setFixedSize:", v154);

      }
      v105 = self->_style;
LABEL_49:
      if (v105 == 2)
      {
        v155 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 32.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setFixedSize:", v155);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "margin");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "setTop:", v157);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "margin");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "setBottom:", v160);

        v163 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 24.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setFixedFallbackImageSize:", v163);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "fixedSize");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "setFixedSize:", v166);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "margin");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "setTop:", v168);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "margin");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "setBottom:", v171);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "fixedFallbackImageSize");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "setFixedFallbackImageSize:", v175);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v178 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        v1102[0] = MEMORY[0x1E0C809B0];
        v1102[1] = 3221225472;
        v1102[2] = __25__LPTheme_adjustForStyle__block_invoke_12;
        v1102[3] = &unk_1E44A96D0;
        v2 = v177;
        v1103 = (id)v2;
        -[LPPointUnit applyToAllTextViewStyles:](v178, "applyToAllTextViewStyles:", v1102);

        v179 = self->_platform;
        if (v179 <= 6)
          v178 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", self->_leadingScalingFactor * dbl_1A0D65F68[v179]);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "setFirstLineLeading:", v178);

        v181 = self->_platform;
        if (v181 <= 6)
          v178 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", self->_leadingScalingFactor * dbl_1A0D65FA0[v181]);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "setLastLineDescent:", v178);

        v105 = self->_style;
      }
      if (v105 == 15)
      {
        v183 = -[LPTapToLoadViewStyle initWithPlatform:sizeClass:fontScalingFactor:]([LPTapToLoadViewStyle alloc], "initWithPlatform:sizeClass:fontScalingFactor:", self->_platform, self->_sizeClass, self->_leadingScalingFactor);
        tapToLoad = self->_tapToLoad;
        self->_tapToLoad = v183;

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "topCaption");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "leading");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "setMaximumLines:", 1);

        v105 = self->_style;
      }
      if (v105 == 4)
      {
        v187 = -[LPGlyphStyle initSearchGlyph]([LPGlyphStyle alloc], "initSearchGlyph");
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "topCaption");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "leading");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "setLeadingGlyph:", v187);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "topCaption");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "leading");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "setMaximumLines:", 1);

        v194 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 24.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "setFixedSize:", v194);

        v105 = self->_style;
      }
      if (v105 <= 0x2A && ((1 << v105) & 0x40000480020) != 0)
      {
        if (rowConfigurationForSizeClass(self->_sizeClass) == 3)
        {
          v195 = sizeClassRequiresTrailingIcon(self->_sizeClass);
          captionBar = self->_captionBar;
          if (v195)
            -[LPCaptionBarStyle trailingIcon](captionBar, "trailingIcon");
          else
            -[LPCaptionBarStyle leadingIcon](captionBar, "leadingIcon");
          v197 = (id)objc_claimAutoreleasedReturnValue();

          v198 = self->_platform;
          v199 = 0.0;
          if (v198 <= 6)
            v199 = dbl_1A0D65FD8[v198];
          v200 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", v199);
          objc_msgSend(v197, "setFixedSize:", v200);

          v201 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
          objc_msgSend(v197, "setCornerRadius:", v201);

          v202 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
          objc_msgSend(v197, "margin");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "setTop:", v202);

          v204 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
          objc_msgSend(v197, "margin");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "setBottom:", v204);

        }
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v2, "bottomCaption");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "leading");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "setColor:", v206);

        v105 = self->_style;
        if (v105 == 42)
        {
          v1119 = *MEMORY[0x1E0DC4A40];
          v1117 = *MEMORY[0x1E0DC4BA8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC4B70]);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v1118 = v209;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1118, &v1117, 1);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v1120[0] = v210;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1120, &v1119, 1);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          fontWithTraitsAndAttributes((void *)*MEMORY[0x1E0DC4B60], 32770, v211, self->_sizeClass);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPTextViewStyle setFont:](self->_quotedText, "setFont:", v212);

          -[LPQuotedTextViewStyle setMaximumLinesToConsiderShort:](self->_quotedText, "setMaximumLinesToConsiderShort:", 0);
          -[LPTextViewStyle setMaximumCharacters:](self->_quotedText, "setMaximumCharacters:", 0);
          -[LPQuotedTextViewStyle setShowQuoteIndicator:](self->_quotedText, "setShowQuoteIndicator:", 0);
          -[LPQuotedTextViewStyle setShowCharacterLimitIndicator:](self->_quotedText, "setShowCharacterLimitIndicator:", 0);
          v213 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
          -[LPTextViewStyle setParagraphSpacing:](self->_quotedText, "setParagraphSpacing:", v213);

          -[LPTextViewStyle setMaximumLines:](self->_quotedText, "setMaximumLines:", 20);
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPTextViewStyle setColor:](self->_quotedText, "setColor:", v214);

          v215 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 15.0);
          -[LPTextViewStyle padding](self->_quotedText, "padding");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "setTop:", v215);

          -[LPTextViewStyle padding](self->_quotedText, "padding");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "top");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPTextViewStyle padding](self->_quotedText, "padding");
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "setBottom:", v218);

          v220 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "captionTextPadding");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "setLeading:", v220);

          v223 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", self->_leadingScalingFactor * 46.0);
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v224, "captionTextPadding");
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v225, "setTrailing:", v223);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "captionTextPadding");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v227, "leading");
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPTextViewStyle padding](self->_quotedText, "padding");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "setLeading:", v228);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v230, "captionTextPadding");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "trailing");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPTextViewStyle padding](self->_quotedText, "padding");
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "setTrailing:", v232);

          fontWithTraits((void *)*MEMORY[0x1E0DC4AA0], 0, self->_sizeClass);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "topCaption");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "trailing");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "setFont:", v234);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.45);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "topCaption");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "trailing");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v241, "setColor:", v238);

          -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "topCaption");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "trailing");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          v245 = *MEMORY[0x1E0CD2EA0];
          objc_msgSend(v244, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

          v246 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
          -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "captionTextPadding");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "setTrailing:", v246);

          v249 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 14.0);
          -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v250, "setLastLineDescent:", v249);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v251, "applyToAllTextViewStyles:", &__block_literal_global_982);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "belowBottomCaption");
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "leading");
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v255, "setColor:", v252);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v2 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v2, "belowBottomCaption");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v256, "leading");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "setCompositingFilter:", v245);

          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle setBackgroundColor:](self->_captionBar, "setBackgroundColor:", v258);

          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v259 = (UIColor *)objc_claimAutoreleasedReturnValue();
          v260 = self->_mediaBackgroundColor;
          self->_mediaBackgroundColor = v259;

          v105 = self->_style;
        }
      }
      if (v105 > 0x38 || ((1 << v105) & 0x100000000300240) == 0)
        goto LABEL_81;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "bottomCaption");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v262, "leading");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "setColor:", v261);

      if (!sizeClassAllowsInsetMedia(self->_sizeClass) || (sizeClassUsesVisualRefresh(self->_sizeClass) & 1) != 0)
        goto LABEL_80;
      v264 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 172.0);
      -[LPImageViewStyle setFixedSize:](self->_mediaImage, "setFixedSize:", v264);

      p_mediaImage = &self->_mediaImage;
      -[LPImageViewStyle setFilter:](self->_mediaImage, "setFilter:", 13);
      -[LPImageViewStyle setScalingMode:](self->_mediaImage, "setScalingMode:", 2);
      v266 = self->_platform;
      if (v266 < 5)
        goto LABEL_75;
      if (v266 == 5)
      {
        v267 = &musicAlbumCornerRadius_visionSize;
        v268 = (void *)musicAlbumCornerRadius_visionSize;
        if (musicAlbumCornerRadius_visionSize)
          goto LABEL_78;
        v269 = 7.0;
        goto LABEL_77;
      }
      if (v266 == 6)
      {
LABEL_75:
        v267 = &musicAlbumCornerRadius_normalSize;
        v268 = (void *)musicAlbumCornerRadius_normalSize;
        if (musicAlbumCornerRadius_normalSize)
        {
LABEL_78:
          p_mediaImage = v268;
          goto LABEL_79;
        }
        v269 = 4.0;
LABEL_77:
        v270 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v269);
        v271 = (void *)*v267;
        *v267 = (uint64_t)v270;

        v268 = (void *)*v267;
        goto LABEL_78;
      }
LABEL_79:
      -[LPImageViewStyle setCornerRadius:](self->_mediaImage, "setCornerRadius:", p_mediaImage);

      outerHorizontalTextMargin((id)self->_platform);
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle padding](self->_mediaImage, "padding");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v273, "setLeading:", v272);

      outerHorizontalTextMargin((id)self->_platform);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle padding](self->_mediaImage, "padding");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "setTrailing:", v274);

      outerHorizontalTextMargin((id)self->_platform);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle padding](self->_mediaImage, "padding");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "setTop:", v276);

LABEL_80:
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImageViewStyle setBackgroundColor:](self->_mediaImage, "setBackgroundColor:", v277);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v278 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v279 = self->_mediaBackgroundColor;
      self->_mediaBackgroundColor = v278;

      v105 = self->_style;
LABEL_81:
      if ((v105 == 40 || v105 == 7) && (_DWORD)p_quotedText)
      {
        v280 = [LPSize alloc];
        v281 = self->_platform;
        if (v281 >= 5)
        {
          if (v281 == 5)
          {
            v282 = &musicArtistDiameter_visionSize;
            v283 = (void *)musicArtistDiameter_visionSize;
            if (musicArtistDiameter_visionSize)
              goto LABEL_88;
            v284 = 163.0;
            goto LABEL_87;
          }
          if (v281 != 6)
            goto LABEL_89;
        }
        v282 = &musicArtistDiameter_normalSize;
        v283 = (void *)musicArtistDiameter_normalSize;
        if (musicArtistDiameter_normalSize)
        {
LABEL_88:
          v2 = v283;
LABEL_89:
          v287 = -[LPSize initWithSquarePoints:](v280, "initWithSquarePoints:", v2);
          -[LPImageViewStyle setFixedSize:](self->_mediaImage, "setFixedSize:", v287);

          -[LPImageViewStyle setFilter:](self->_mediaImage, "setFilter:", 12);
          -[LPImageViewStyle setScalingMode:](self->_mediaImage, "setScalingMode:", 2);
          musicArtistOuterPadding((void *)self->_platform, v288);
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPImageViewStyle padding](self->_mediaImage, "padding");
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "setLeading:", v289);

          musicArtistOuterPadding((void *)self->_platform, v291);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPImageViewStyle padding](self->_mediaImage, "padding");
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v293, "setTrailing:", v292);

          musicArtistOuterPadding((void *)self->_platform, v294);
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPImageViewStyle padding](self->_mediaImage, "padding");
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v296, "setTop:", v295);

          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPImageViewStyle setBackgroundColor:](self->_mediaImage, "setBackgroundColor:", v297);

          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v298 = (UIColor *)objc_claimAutoreleasedReturnValue();
          v299 = self->_mediaBackgroundColor;
          self->_mediaBackgroundColor = v298;

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v300 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v300, "topCaption");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v301, "leading");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v302, "setTextAlignment:", 2);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v303, "bottomCaption");
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v304, "leading");
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "setTextAlignment:", 2);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v306, "belowBottomCaption");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v307, "leading");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v308, "setTextAlignment:", 2);

          v105 = self->_style;
          goto LABEL_90;
        }
        v284 = 172.0;
LABEL_87:
        v285 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v284);
        v286 = (void *)*v282;
        *v282 = (uint64_t)v285;

        v283 = (void *)*v282;
        goto LABEL_88;
      }
LABEL_90:
      if (v105 <= 0x38 && ((1 << v105) & 0x100000000000300) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v310, "bottomCaption");
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v311, "leading");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "setColor:", v309);

        v105 = self->_style;
      }
      if (v105 == 17)
      {
        v313 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 18.0);
        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v314, "setFixedSize:", v313);

        v315 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v316, "margin");
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v317, "setLeading:", v315);

        v318 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v319, "margin");
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v320, "setTop:", v318);

        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v321, "setFilter:", 3);

        v322 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 5.0);
        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v323, "setCornerRadius:", v322);

        v105 = self->_style;
      }
      if (v105 == 24)
      {
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v324, "topCaption");
        v325 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v325, "leading");
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v326, "setMaximumLines:", 0);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v327 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v327, "bottomCaption");
        v328 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v328, "leading");
        v329 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v329, "setMaximumLines:", 0);

        bottomCaptionFont(self->_platform, self->_sizeClass);
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v331, "topCaption");
        v332 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v332, "leading");
        v333 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v333, "setFont:", v330);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v334 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v335, "topCaption");
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v336, "leading");
        v337 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v337, "setColor:", v334);

        topCaptionFont(self->_platform, self->_sizeClass);
        v338 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v339, "bottomCaption");
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v340, "leading");
        v341 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v341, "setFont:", v338);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v342 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v343, "bottomCaption");
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v344, "leading");
        v345 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v345, "setColor:", v342);

        v105 = self->_style;
      }
      if (v105 == 27)
      {
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v346, "topCaption");
        v347 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v347, "leading");
        v348 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v348, "setMaximumLines:", 0);

        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v349 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v349, "bottomCaption");
        v350 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v350, "leading");
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setMaximumLines:", 0);

        topCaptionFont(self->_platform, self->_sizeClass);
        v352 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v353 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v353, "bottomCaption");
        v354 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v354, "leading");
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v355, "setFont:", v352);

        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v356 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v356, "setFilter:", 1);

        v357 = (void *)businessChatApplePayIconSize_normalSize;
        if (!businessChatApplePayIconSize_normalSize)
        {
          v358 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 60.0, 30.0);
          v359 = (void *)businessChatApplePayIconSize_normalSize;
          businessChatApplePayIconSize_normalSize = (uint64_t)v358;

          v357 = (void *)businessChatApplePayIconSize_normalSize;
        }
        v360 = v357;
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v361, "setFixedSize:", v360);

        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v362, "setVerticalAlignment:", 1);

        v363 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "margin");
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v365, "setTop:", v363);

        v366 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 263.0);
        maximumWidth = self->_maximumWidth;
        self->_maximumWidth = v366;

        v368 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 222.0);
        -[LPCaptionBarStyle setMinimumWidth:](self->_captionBar, "setMinimumWidth:", v368);

        v105 = self->_style;
      }
      if (v105 == 30)
      {
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v369, "topCaption");
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v370, "leading");
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v371, "setMaximumLines:", 0);

        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v372 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v372, "bottomCaption");
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v373, "leading");
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v374, "setMaximumLines:", 0);

        topCaptionFont(self->_platform, self->_sizeClass);
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "bottomCaption");
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v377, "leading");
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v378, "setFont:", v375);

        v379 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 263.0);
        v380 = self->_maximumWidth;
        self->_maximumWidth = v379;

        v381 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 222.0);
        -[LPCaptionBarStyle setMinimumWidth:](self->_captionBar, "setMinimumWidth:", v381);

        v105 = self->_style;
      }
      if (v105 == 29)
      {
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v382, "topCaption");
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v383, "leading");
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v384, "setMaximumLines:", 0);

        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v385, "bottomCaption");
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v386, "leading");
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v387, "setMaximumLines:", 0);

        topCaptionFont(self->_platform, self->_sizeClass);
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v389 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v389, "bottomCaption");
        v390 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v390, "leading");
        v391 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v391, "setFont:", v388);

        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v392, "setFilter:", 3);

        v393 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v394, "setCornerRadius:", v393);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v395, "setFilter:", 3);

        v396 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v397, "setCornerRadius:", v396);

        businessChatImageSmallSize();
        v398 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v399, "setFixedSize:", v398);

        businessChatImageSmallSize();
        v400 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v401 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v401, "setFixedSize:", v400);

        v402 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v403 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v403, "margin");
        v404 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v404, "setTop:", v402);

        v405 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v406, "margin");
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v407, "setBottom:", v405);

        v408 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v409 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v409, "margin");
        v410 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v410, "setTop:", v408);

        v411 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v412 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v412, "margin");
        v413 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v413, "setBottom:", v411);

        v414 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 263.0);
        v415 = self->_maximumWidth;
        self->_maximumWidth = v414;

        v416 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 222.0);
        -[LPCaptionBarStyle setMinimumWidth:](self->_captionBar, "setMinimumWidth:", v416);

        v105 = self->_style;
      }
      if (v105 == 28)
      {
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v417, "topCaption");
        v418 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v418, "leading");
        v419 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v419, "setMaximumLines:", 0);

        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v420 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v420, "bottomCaption");
        v421 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v421, "leading");
        v422 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v422, "setMaximumLines:", 0);

        topCaptionFont(self->_platform, self->_sizeClass);
        v423 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_mediaBottomCaptionBar, "textStack");
        v424 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v424, "bottomCaption");
        v425 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v425, "leading");
        v426 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v426, "setFont:", v423);

        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v427 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v427, "setFilter:", 3);

        v428 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v429 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v429, "setCornerRadius:", v428);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v430 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v430, "setFilter:", 3);

        v431 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v432 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v432, "setCornerRadius:", v431);

        businessChatImageIconSize();
        v433 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v434 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v434, "setFixedSize:", v433);

        businessChatImageIconSize();
        v435 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v436 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v436, "setFixedSize:", v435);

        v437 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v438 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v438, "margin");
        v439 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v439, "setTop:", v437);

        v440 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v441 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v441, "margin");
        v442 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v442, "setBottom:", v440);

        v443 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v444, "margin");
        v445 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v445, "setTop:", v443);

        v446 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v447 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v447, "margin");
        v448 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v448, "setBottom:", v446);

        v449 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 263.0);
        v450 = self->_maximumWidth;
        self->_maximumWidth = v449;

        v451 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 222.0);
        -[LPCaptionBarStyle setMinimumWidth:](self->_captionBar, "setMinimumWidth:", v451);

        v105 = self->_style;
      }
      if (v105 == 12)
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v452 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v452, "setFilter:", 5);

        v105 = self->_style;
      }
      if (v105 == 18)
      {
        iMessageAppLinkIconSize((id)self->_platform);
        v453 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v454, "setFixedSize:", v453);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v455 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v455, "setFilter:", 6);

        v105 = self->_style;
      }
      if (v105 == 46 || v105 == 16)
      {
        v456 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v457 = self->_captionBar;
        if (v456)
          -[LPCaptionBarStyle trailingIcon](v457, "trailingIcon");
        else
          -[LPCaptionBarStyle leadingIcon](v457, "leadingIcon");
        v458 = (id)objc_claimAutoreleasedReturnValue();

        v459 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 9.0);
        objc_msgSend(v458, "margin");
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v460, "setLeading:", v459);

        objc_msgSend(v458, "margin");
        v461 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v461, "setTop:", v459);

        objc_msgSend(v458, "margin");
        v462 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v462, "setBottom:", v459);

        v463 = self->_platform;
        if (self->_style == 46)
        {
          switch(v463)
          {
            case 0uLL:
            case 1uLL:
            case 4uLL:
            case 6uLL:
              v464 = (void *)faceTimeIconSize_normalSize;
              if (faceTimeIconSize_normalSize)
                goto LABEL_173;
              v465 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 30.0);
              v466 = &faceTimeIconSize_normalSize;
              break;
            case 2uLL:
              v464 = (void *)faceTimeIconSize_watchSize;
              if (faceTimeIconSize_watchSize)
                goto LABEL_173;
              v465 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 22.0);
              v466 = &faceTimeIconSize_watchSize;
              break;
            case 3uLL:
              v464 = (void *)faceTimeIconSize_htmlSize;
              if (faceTimeIconSize_htmlSize)
                goto LABEL_173;
              v465 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 30.0, 20.0);
              v466 = &faceTimeIconSize_htmlSize;
              break;
            case 5uLL:
              v464 = (void *)faceTimeIconSize_visionSize;
              if (faceTimeIconSize_visionSize)
                goto LABEL_173;
              v465 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 44.0, 56.0);
              v466 = &faceTimeIconSize_visionSize;
              break;
            default:
              goto LABEL_174;
          }
          v604 = (void *)*v466;
          *v466 = (uint64_t)v465;

          v464 = (void *)*v466;
LABEL_173:
          v462 = v464;
LABEL_174:
          objc_msgSend(v458, "setFixedSize:", v462);

          if (self->_platform == 5)
          {
            objc_msgSend(v458, "setFixedFallbackImageWeight:", &unk_1E44EEB40);
            objc_msgSend(v458, "setFixedFallbackImageFontTextStyle:", *MEMORY[0x1E0DC4B60]);
          }
          goto LABEL_176;
        }
        if (v463 > 6)
        {
LABEL_126:
          objc_msgSend(v458, "setFixedSize:", v462);

LABEL_176:
          if (!sizeClassRequiresTrailingIcon(self->_sizeClass))
          {
            v605 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v606 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v606, "captionTextPadding");
            v607 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v607, "setLeading:", v605);

          }
          if (self->_style != 46 || (sizeClassAllowsPillButton(self->_sizeClass) & 1) == 0)
          {
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v608 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v608, "topCaption");
            v609 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v609, "leading");
            v610 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v610, "setMaximumLines:", 1);

          }
          v105 = self->_style;
          goto LABEL_182;
        }
        if (v463 == 2)
        {
          v467 = &iCloudDocumentShareIconSize_watchSize;
          v468 = (void *)iCloudDocumentShareIconSize_watchSize;
          if (iCloudDocumentShareIconSize_watchSize)
            goto LABEL_125;
          v469 = 22.0;
        }
        else
        {
          v467 = &iCloudDocumentShareIconSize_normalSize;
          v468 = (void *)iCloudDocumentShareIconSize_normalSize;
          if (iCloudDocumentShareIconSize_normalSize)
          {
LABEL_125:
            v462 = v468;
            goto LABEL_126;
          }
          v469 = 30.0;
        }
        v470 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", v469);
        v471 = (void *)*v467;
        *v467 = (uint64_t)v470;

        v468 = (void *)*v467;
        goto LABEL_125;
      }
LABEL_182:
      if (v105 == 26)
      {
        v611 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v612 = self->_captionBar;
        if (v611)
          -[LPCaptionBarStyle trailingIcon](v612, "trailingIcon");
        else
          -[LPCaptionBarStyle leadingIcon](v612, "leadingIcon");
        v613 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v613, "setFilter:", 6);
        iMessageAppLinkIconSize((id)self->_platform);
        v614 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v613, "setFixedSize:", v614);

        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v615 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v615, "setFilter:", 6);

        iMessageAppLinkIconSize((id)self->_platform);
        v616 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_mediaTopCaptionBar, "leadingIcon");
        v617 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v617, "setFixedSize:", v616);

        v105 = self->_style;
      }
      if (v105 == 31)
      {
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v618 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v618, "topCaption");
        v619 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v619, "leading");
        v620 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v620, "setMaximumLines:", 10);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v621 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v621, "bottomCaption");
        v622 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v622, "leading");
        v623 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v623, "setMaximumLines:", 10);

        v624 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 17.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v625 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v625, "setFixedFallbackImageSize:", v624);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v626 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v626, "fixedFallbackImageSize");
        v627 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        v628 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v628, "setFixedFallbackImageSize:", v627);

        v105 = self->_style;
      }
      if (v105 == 32)
      {
        v629 = -[LPGlyphStyle initSearchGlyph]([LPGlyphStyle alloc], "initSearchGlyph");
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v630 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v630, "topCaption");
        v631 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v631, "leading");
        v632 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v632, "setLeadingGlyph:", v629);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v633 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v633, "topCaption");
        v634 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v634, "leading");
        v635 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v635, "setMaximumLines:", 10);

        v105 = self->_style;
      }
      if (v105 == 33)
      {
        v636 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v637 = self->_captionBar;
        if (v636)
          -[LPCaptionBarStyle trailingIcon](v637, "trailingIcon");
        else
          -[LPCaptionBarStyle leadingIcon](v637, "leadingIcon");
        v638 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v638, "setFilter:", 1);
        v105 = self->_style;
      }
      if (v105 == 36)
      {
        v639 = self->_platform;
        v640 = self->_sizeClass;
        if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
        {
          objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 24.0, *MEMORY[0x1E0DC4B70]);
          v641 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          switch(v639)
          {
            case 0:
            case 2:
            case 6:
              fontWithTraits((void *)*MEMORY[0x1E0DC4B58], 32770, v640);
              v641 = objc_claimAutoreleasedReturnValue();
              break;
            case 5:
              fontWithTraits((void *)*MEMORY[0x1E0DC4B58], 2, v640);
              v641 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 24.0, *MEMORY[0x1E0DC4B70]);
              v641 = objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        v642 = (void *)v641;
        -[LPCaptionBarStyle textStack](self->_mediaTopCaptionBar, "textStack");
        v643 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v643, "topCaption");
        v644 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v644, "leading");
        v645 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v645, "setFont:", v642);

        v646 = self->_platform;
        v647 = self->_sizeClass;
        if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
        {
          objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC4B70]);
          v648 = objc_claimAutoreleasedReturnValue();
        }
        else if (v646 <= 6 && ((1 << v646) & 0x65) != 0)
        {
          fontWithTraits((void *)*MEMORY[0x1E0DC4B10], 0, v647);
          v648 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC4B70]);
          v648 = objc_claimAutoreleasedReturnValue();
        }
        v649 = (void *)v648;
        -[LPCaptionBarStyle textStack](self->_mediaTopCaptionBar, "textStack");
        v650 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v650, "bottomCaption");
        v651 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v651, "leading");
        v652 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v652, "setFont:", v649);

        v653 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 30.0);
        -[LPCaptionBarStyle textStack](self->_mediaTopCaptionBar, "textStack");
        v654 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v654, "setFirstLineLeading:", v653);

        v655 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 18.0);
        -[LPCaptionBarStyle textStack](self->_mediaTopCaptionBar, "textStack");
        v656 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v656, "bottomCaption");
        v657 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v657, "leading");
        v658 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v658, "setFirstLineLeading:", v655);

        v105 = self->_style;
      }
      if (v105 <= 0x39 && ((1 << v105) & 0x200000000006000) != 0)
      {
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v659 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v659, "topCaption");
        v660 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v660, "leading");
        v661 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v661, "color");
        v662 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v663 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v663, "bottomCaption");
        v664 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v664, "leading");
        v665 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v665, "setColor:", v662);

        v105 = self->_style;
      }
      if ((_DWORD)p_quotedText)
      {
        if (v105 - 13 > 1)
          goto LABEL_220;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v666 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v667 = self->_mediaBackgroundColor;
        self->_mediaBackgroundColor = v666;

        v668 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", -10.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v669 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v669, "setBottom:", v668);

        p_quotedText = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 300.0);
        -[LPImageViewStyle setFixedSize:](self->_mediaImage, "setFixedSize:", p_quotedText);

        v4 = (LPPointUnit *)-[LPImageViewStyle setScalingMode:](self->_mediaImage, "setScalingMode:", 1);
        v105 = self->_style;
      }
      if (v105 == 13)
      {
        p_quotedText = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 20.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v670 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v670, "setTop:", p_quotedText);

        v105 = self->_style;
      }
      if (v105 == 14)
      {
        p_quotedText = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v671 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v671, "setTop:", p_quotedText);

        v105 = self->_style;
      }
LABEL_220:
      if (v105 == 41)
      {
        -[LPQuotedTextViewStyle setShowQuoteIndicator:](self->_quotedText, "setShowQuoteIndicator:", 0);
        p_quotedText = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 40.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v672 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v672, "setFixedSize:", p_quotedText);

        v105 = self->_style;
      }
      if (v105 == 53 || v105 == 44)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v673 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v674 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v674, "setBackgroundColor:", v673);

        p_quotedText = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v675 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v675, "setImagePadding:", p_quotedText);

        v105 = self->_style;
      }
      if (v105 == 56)
      {
        v4 = (LPPointUnit *)-[LPTheme _adjustForAppleMusicCollaborativePlaylistStyle](self, "_adjustForAppleMusicCollaborativePlaylistStyle");
        v105 = self->_style;
      }
      if (v105 == 58)
      {
        v4 = (LPPointUnit *)-[LPTheme _adjustForEnrichedBusinessChatStyle](self, "_adjustForEnrichedBusinessChatStyle");
        v105 = self->_style;
      }
      if (v105 == 46)
      {
        +[LPResources faceTimeBackgroundColor](LPResources, "faceTimeBackgroundColor");
        v676 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v677 = self->_backgroundColor;
        self->_backgroundColor = v676;

        self->_backgroundMaterial = 9;
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v678 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v679 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v679, "setBackgroundColor:", v678);

        +[LPResources faceTimeBackgroundColor](LPResources, "faceTimeBackgroundColor");
        v680 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v681 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v681, "setForegroundColor:", v680);

        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        p_quotedText = (LPSize *)objc_claimAutoreleasedReturnValue();
        -[LPSize colorWithAlphaComponent:](p_quotedText, "colorWithAlphaComponent:", 0.6);
        v682 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPImageViewStyle setMaskColor:](self->_placeholderImage, "setMaskColor:", v682);

        v105 = self->_style;
      }
      if (v105 == 50)
      {
        p_quotedText = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 60.0);
        -[LPImageViewStyle setMaximumSize:](self->_mediaImage, "setMaximumSize:", p_quotedText);
        -[LPImageViewStyle setFixedSize:](self->_mediaImage, "setFixedSize:", p_quotedText);
        -[LPImageViewStyle setScalingMode:](self->_mediaImage, "setScalingMode:", 1);
        v683 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 14.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v684 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v684, "setTop:", v683);

        v685 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 14.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v686 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v686, "setBottom:", v685);

        -[LPImageViewStyle setFilter:](self->_mediaImage, "setFilter:", 5);
        v105 = self->_style;
      }
      if (v105 == 48)
      {
        p_quotedText = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 60.0);
        -[LPImageViewStyle setMaximumSize:](self->_mediaImage, "setMaximumSize:", p_quotedText);
        -[LPImageViewStyle setFixedSize:](self->_mediaImage, "setFixedSize:", p_quotedText);
        -[LPImageViewStyle setScalingMode:](self->_mediaImage, "setScalingMode:", 1);
        v687 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v688 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v688, "setTop:", v687);

        v689 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPImageViewStyle padding](self->_mediaImage, "padding");
        v690 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v690, "setBottom:", v689);

        -[LPImageViewStyle setDarkeningAmount:](self->_mediaImage, "setDarkeningAmount:", 0.0);
        v105 = self->_style;
      }
      if (v105 == 51)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v691 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v692 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v692, "bottomCaption");
        v693 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v693, "leading");
        v694 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v694, "setColor:", v691);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        p_quotedText = (LPSize *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v695 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v695, "belowBottomCaption");
        v696 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v696, "leading");
        v697 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v697, "setColor:", p_quotedText);

        v105 = self->_style;
      }
      if (v105 == 47 && !self->_sizeClass)
      {
        v698 = self->_platform;
        if (v698 <= 6)
          p_quotedText = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", dbl_1A0D66010[v698]);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v699 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v699, "setFixedSize:", p_quotedText);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v700 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v700, "setRequireFixedSize:", 0);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v701 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v701, "setScalingMode:", 1);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v702 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v702, "setFilter:", 13);

        v703 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 4.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v704 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v704, "setCornerRadius:", v703);

        +[LPShadowStyle collaborationPreviewShadow](LPShadowStyle, "collaborationPreviewShadow");
        v705 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v706 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v706, "setShadow:", v705);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v707 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v707, "setCanAdjustVerticalPaddingForFixedSize:", 1);

        v708 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 0.5);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v709 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v709, "setBorderWidth:", v708);

        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v710 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v710, "colorWithAlphaComponent:", 0.3);
        v711 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v712 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v712, "setBorderColor:", v711);

        if (self->_platform != 5)
        {
          pt(275.0);
          p_quotedText = (LPSize *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle setMinimumWidth:](self->_captionBar, "setMinimumWidth:", p_quotedText);

          v716 = self->_platform;
          if (v716 > 6)
            goto LABEL_250;
          if (((1 << v716) & 0x5B) != 0)
          {
            v713 = &sharedObjectAutomaticIconOuterMargin_normalSize;
            v714 = (void *)sharedObjectAutomaticIconOuterMargin_normalSize;
            if (!sharedObjectAutomaticIconOuterMargin_normalSize)
            {
              v715 = 12.0;
              goto LABEL_248;
            }
LABEL_249:
            p_quotedText = v714;
LABEL_250:
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v719 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v719, "margin");
            v720 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v720, "setLeading:", p_quotedText);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v721 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v721, "margin");
            v722 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v722, "setTop:", p_quotedText);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v723 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v723, "margin");
            v724 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v724, "setBottom:", p_quotedText);

            if (self->_platform == 2)
              v725 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 15.0);
            else
              v725 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 20.0);
            -[LPCaptionBarStyle leadingIconBadge](self->_captionBar, "leadingIconBadge");
            v726 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v726, "setFixedSize:", v725);

            if (self->_platform == 5)
            {
              +[LPPointUnit zero](LPPointUnit, "zero");
              v727 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
              v728 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v728, "captionTextPadding");
              v729 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v729, "setLeading:", v727);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v730 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
              v731 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v731, "padding");
              v732 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v732, "setTrailing:", v730);

              pt(12.0);
              v733 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
              v734 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v734, "margin");
              v735 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v735, "setTrailing:", v733);

            }
            -[LPCaptionBarStyle leadingIconBadge](self->_captionBar, "leadingIconBadge");
            v736 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v736, "fixedSize");
            v737 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle trailingIconBadge](self->_captionBar, "trailingIconBadge");
            v738 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v738, "setFixedSize:", v737);

            -[LPCaptionBarStyle leadingIconBadge](self->_captionBar, "leadingIconBadge");
            v739 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v739, "fixedSize");
            v740 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v740, "width");
            v741 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v741, "value");
            v743 = v742;
            -[LPCaptionBarStyle leadingIconBadge](self->_captionBar, "leadingIconBadge");
            v744 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v744, "setOffset:", v743 * 0.5 + -2.0);

            -[LPCaptionBarStyle leadingIconBadge](self->_captionBar, "leadingIconBadge");
            v745 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v745, "offset");
            v747 = v746;
            -[LPCaptionBarStyle trailingIconBadge](self->_captionBar, "trailingIconBadge");
            v748 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v748, "setOffset:", v747);

            fallbackIconSize(self->_platform);
            v749 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v750 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v750, "setFixedFallbackImageSize:", v749);

            if (self->_hasButton)
            {
              v751 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 1.0);
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v752 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v752, "margin");
              v753 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v753, "setTop:", v751);

              if (self->_platform == 5)
              {
                pt(12.0);
                v754 = (void *)objc_claimAutoreleasedReturnValue();
                -[LPCaptionBarStyle button](self->_captionBar, "button");
                v755 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v755, "margin");
                v756 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v756, "setLeading:", v754);

                pt(20.0);
              }
              else
              {
                pt(16.0);
              }
              v757 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v758 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v758, "margin");
              v759 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v759, "setTrailing:", v757);

              v760 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v761 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v761, "margin");
              v762 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v762, "setBottom:", v760);

              v763 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 3.0);
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v764 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v764, "setAdditionalVerticalPadding:", v763);

              -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
              -[LPCaptionBarStyle setCanAddLineForButton:](self->_captionBar, "setCanAddLineForButton:", 1);
              -[LPCaptionBarStyle setButtonRespectsTextStackPadding:](self->_captionBar, "setButtonRespectsTextStackPadding:", 1);
              -[LPCaptionBarStyle setPositionButtonRelativeToTextStack:](self->_captionBar, "setPositionButtonRelativeToTextStack:", 1);
              -[LPCaptionBarStyle setAlignButtonWithCaptionTextLeadingEdge:](self->_captionBar, "setAlignButtonWithCaptionTextLeadingEdge:", 1);
              -[LPCaptionBarStyle setExpandButtonToCaptionEdge:](self->_captionBar, "setExpandButtonToCaptionEdge:", 1);
              -[LPCaptionBarStyle setButtonIgnoresTextSafeAreaInsets:](self->_captionBar, "setButtonIgnoresTextSafeAreaInsets:", 1);
              v765 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v766 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v766, "margin");
              v767 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v767, "setTop:", v765);

            }
            +[LPPointUnit zero](LPPointUnit, "zero");
            v768 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v769 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v769, "margin");
            v770 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v770, "setBottom:", v768);

            v771 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v772 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v772, "padding");
            v773 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v773, "setBottom:", v771);

            v774 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 9.0);
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v775 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v775, "separatorMargin");
            v776 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v776, "setBottom:", v774);

            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v777 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v777, "setUseFullWidthDuringSizing:", 0);

            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v778 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v779 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v779, "options");
            v780 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v780, "setColor:", v778);

            v781 = self->_platform;
            if (v781 == 5)
            {
              pt(11.0);
              v782 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v783 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v783, "setCornerRadius:", v782);

              v781 = self->_platform;
            }
            v784 = [LPPointUnit alloc];
            v785 = 25.0;
            if (v781 == 2)
              v785 = 20.0;
            v786 = -[LPPointUnit initWithValue:](v784, "initWithValue:", v785);
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v787 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v787, "setFirstLineLeading:", v786);

            v788 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 11.0);
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v789 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v789, "setLastLineDescent:", v788);

            goto LABEL_265;
          }
          if (v716 == 2)
          {
            v713 = &sharedObjectAutomaticIconOuterMargin_watchSize;
            v714 = (void *)sharedObjectAutomaticIconOuterMargin_watchSize;
            if (sharedObjectAutomaticIconOuterMargin_watchSize)
              goto LABEL_249;
            v715 = 10.0;
            goto LABEL_248;
          }
        }
        v713 = &sharedObjectAutomaticIconOuterMargin_visionSize;
        v714 = (void *)sharedObjectAutomaticIconOuterMargin_visionSize;
        if (!sharedObjectAutomaticIconOuterMargin_visionSize)
        {
          v715 = 14.0;
LABEL_248:
          v717 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v715);
          v718 = (void *)*v713;
          *v713 = (uint64_t)v717;

          v714 = (void *)*v713;
          goto LABEL_249;
        }
        goto LABEL_249;
      }
LABEL_265:
      if (self->_isFallbackIcon)
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v790 = (void *)objc_claimAutoreleasedReturnValue();
        applyFallbackIconProperties(v790, self->_platform, self->_style, self->_sizeClass);

        -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
        p_quotedText = (LPSize *)objc_claimAutoreleasedReturnValue();
        applyFallbackIconProperties(p_quotedText, self->_platform, self->_style, self->_sizeClass);

      }
      v791 = self->_sizeClass;
      if (v791 == 5)
      {
        if (self->_platform == 5)
        {
          v792 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 11.0);
          cornerRadius = self->_cornerRadius;
          self->_cornerRadius = v792;

        }
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v794 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v794, "applyToAllTextViewStyles:", &__block_literal_global_985);

        p_quotedText = (LPSize *)&self->_quotedText;
        -[LPQuotedTextViewStyle setShowQuoteIndicator:](self->_quotedText, "setShowQuoteIndicator:", 0);
        v4 = (LPPointUnit *)-[LPQuotedTextViewStyle setShowCharacterLimitIndicator:](self->_quotedText, "setShowCharacterLimitIndicator:", 0);
        v791 = self->_sizeClass;
      }
      if (v791 == 8)
      {
        v795 = self->_platform;
        if (v795 > 6)
        {
LABEL_280:
          v800 = self->_cornerRadius;
          self->_cornerRadius = v4;

          v801 = self->_platform;
          if (v801 > 6)
          {
LABEL_288:
            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v807 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v807, "setFixedSize:", p_quotedText);

            v808 = self->_platform;
            if (v808 > 6)
              goto LABEL_296;
            if (((1 << v808) & 0x65) != 0)
            {
              v809 = &smallDetailedIconCornerRadius_normalSize;
              v810 = (void *)smallDetailedIconCornerRadius_normalSize;
              if (!smallDetailedIconCornerRadius_normalSize)
              {
                v811 = 6.0;
LABEL_294:
                v812 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v811);
                v813 = (void *)*v809;
                *v809 = (uint64_t)v812;

                v810 = (void *)*v809;
              }
            }
            else
            {
              v809 = &smallDetailedIconCornerRadius_macSize;
              v810 = (void *)smallDetailedIconCornerRadius_macSize;
              if (!smallDetailedIconCornerRadius_macSize)
              {
                v811 = 2.0;
                goto LABEL_294;
              }
            }
            p_quotedText = v810;
LABEL_296:
            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v814 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v814, "setCornerRadius:", p_quotedText);

            v815 = adjustForStyle_smallDetailedIconMargin;
            if (!adjustForStyle_smallDetailedIconMargin)
            {
              v816 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
              v817 = (void *)adjustForStyle_smallDetailedIconMargin;
              adjustForStyle_smallDetailedIconMargin = (uint64_t)v816;

              v815 = adjustForStyle_smallDetailedIconMargin;
            }
            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v818 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v818, "margin");
            v819 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v819, "setTrailing:", v815);

            v820 = adjustForStyle_smallDetailedIconMargin;
            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v821 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v821, "margin");
            v822 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v822, "setTop:", v820);

            v823 = adjustForStyle_smallDetailedIconMargin;
            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v824 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v824, "margin");
            v825 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v825, "setBottom:", v823);

            -[LPCaptionBarStyle trailingIcon](self->_captionBar, "trailingIcon");
            v826 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v826, "fixedSize");
            v827 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle playButton](self->_captionBar, "playButton");
            v828 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v828, "setSize:", v827);

            v829 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 20.0);
            -[LPCaptionBarStyle playButton](self->_captionBar, "playButton");
            v830 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v830, "setGlyphSize:", v829);

            v831 = adjustForStyle_smallDetailedIconMargin;
            -[LPCaptionBarStyle playButtonPadding](self->_captionBar, "playButtonPadding");
            v832 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v832, "setTrailing:", v831);

            v833 = adjustForStyle_smallDetailedIconMargin;
            -[LPCaptionBarStyle playButtonPadding](self->_captionBar, "playButtonPadding");
            v834 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v834, "setTop:", v833);

            v835 = adjustForStyle_smallDetailedIconMargin;
            -[LPCaptionBarStyle playButtonPadding](self->_captionBar, "playButtonPadding");
            v836 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v836, "setBottom:", v835);

            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v837 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v837, "setMaximumNumberOfLines:", 3);

            -[LPCaptionBarStyle setMinimumNumberOfLinesToVerticallyCenter:](self->_captionBar, "setMinimumNumberOfLinesToVerticallyCenter:", 3);
            v791 = self->_sizeClass;
            goto LABEL_299;
          }
          if (((1 << v801) & 0x65) != 0)
          {
            v802 = &smallDetailedIconSize_normalSize;
            v803 = (void *)smallDetailedIconSize_normalSize;
            if (!smallDetailedIconSize_normalSize)
            {
              v804 = 48.0;
LABEL_286:
              v805 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", v804);
              v806 = (void *)*v802;
              *v802 = (uint64_t)v805;

              v803 = (void *)*v802;
            }
          }
          else
          {
            v802 = &smallDetailedIconSize_macSize;
            v803 = (void *)smallDetailedIconSize_macSize;
            if (!smallDetailedIconSize_macSize)
            {
              v804 = 42.0;
              goto LABEL_286;
            }
          }
          p_quotedText = v803;
          goto LABEL_288;
        }
        if (((1 << v795) & 0x65) != 0)
        {
          p_quotedText = (LPSize *)&smallDetailedCornerRadius_normalSize;
          v796 = (Class)smallDetailedCornerRadius_normalSize;
          if (!smallDetailedCornerRadius_normalSize)
          {
            v797 = 16.0;
LABEL_278:
            v798 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v797);
            isa = p_quotedText->super.isa;
            p_quotedText->super.isa = (Class)v798;

            v796 = p_quotedText->super.isa;
          }
        }
        else
        {
          p_quotedText = (LPSize *)&smallDetailedCornerRadius_macSize;
          v796 = (Class)smallDetailedCornerRadius_macSize;
          if (!smallDetailedCornerRadius_macSize)
          {
            v797 = 12.0;
            goto LABEL_278;
          }
        }
        v4 = v796;
        goto LABEL_280;
      }
LABEL_299:
      if (v791 - 10 <= 2)
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v838 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v838, "setFilter:", 13);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v839 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v839, "setScalingMode:", 2);

        v840 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 5.0);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v841 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v841, "setCornerRadius:", v840);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v842 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v843 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v843, "margin");
        v844 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v844, "setTrailing:", v842);

        if (self->_platform == 5)
        {
          v845 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 0.0, 44.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v846 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v846, "setMinimumSize:", v845);

        }
        +[LPPointUnit zero](LPPointUnit, "zero");
        v847 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v848 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v848, "setFirstLineLeading:", v847);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v849 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v850 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v850, "setLastLineDescent:", v849);

        mediumOrLargeHorizontalFillColor(self->_platform);
        v851 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v852 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v852, "setBackgroundColor:", v851);

        mediumOrLargeHorizontalForegroundColor(self->_platform);
        v853 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v854 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v854, "setForegroundColor:", v853);

        v855 = self->_platform;
        if (v855 <= 6)
          v853 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", dbl_1A0D66048[v855]);
        -[LPContactsBadgeStyle setSize:](self->_contactsBadgeStyle, "setSize:", v853);

        -[LPContactsBadgeStyle setMargin:](self->_contactsBadgeStyle, "setMargin:", 0.0);
        -[LPContactsBadgeStyle setUseShadow:](self->_contactsBadgeStyle, "setUseShadow:", 0);
        -[LPContactsBadgeStyle setLocation:](self->_contactsBadgeStyle, "setLocation:", 1);
        if (self->_isFallbackIcon)
        {
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v856 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v856, "setFilter:", 11);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v857 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v857, "setScalingMode:", 3);

        }
      }
      v858 = self->_sizeClass;
      if ((v858 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
      {
        if (self->_platform == 5)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
          v859 = (UIColor *)objc_claimAutoreleasedReturnValue();
          v860 = self->_backgroundColor;
          self->_backgroundColor = v859;

          v858 = self->_sizeClass;
        }
        if (v858 == 10)
        {
          v861 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
          -[LPCaptionBarStyle button](self->_captionBar, "button");
          v862 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v862, "margin");
          v863 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v863, "setTrailing:", v861);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v864 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v864, "setScalesToFitParent:", 1);

          if (-[LPLinkRendererSizeClassParameters preserveIconAspectRatioAndAlignmentWhenScaling](self->_sizeClassParameters, "preserveIconAspectRatioAndAlignmentWhenScaling"))
          {
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v865 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v865, "setScalingMode:", 1);

            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v866 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v866, "setPreservesEdgeAlignmentWhenScaling:", 1);

          }
          fallbackIconSize(self->_platform);
          v867 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v868 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v868, "setFixedFallbackImageSize:", v867);

          v869 = adjustForStyle_leadingOuterMargin;
          if (!adjustForStyle_leadingOuterMargin)
          {
            v870 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
            v871 = (void *)adjustForStyle_leadingOuterMargin;
            adjustForStyle_leadingOuterMargin = (uint64_t)v870;

            v869 = adjustForStyle_leadingOuterMargin;
          }
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v872 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v872, "margin");
          v873 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v873, "setLeading:", v869);

          v874 = adjustForStyle_leadingOuterMargin;
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v875 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v875, "margin");
          v876 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v876, "setTop:", v874);

          v877 = adjustForStyle_leadingOuterMargin;
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v878 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v878, "margin");
          v879 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v879, "setBottom:", v877);

          outerHorizontalTextMargin((id)self->_platform);
          v880 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v881 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v881, "captionTextPadding");
          v882 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v882, "setLeading:", v880);

          v883 = adjustForStyle_leadingOuterMargin;
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v884 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v884, "captionTextPadding");
          v885 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v885, "setTop:", v883);

          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v886 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v886, "setMaximumNumberOfLines:", 0);

          -[LPCaptionBarStyle setMinimumNumberOfLinesToVerticallyCenter:](self->_captionBar, "setMinimumNumberOfLinesToVerticallyCenter:", 0xFFFFFFFFLL);
          -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
          if (self->_isFallbackIcon)
          {
            mediumOrLargeHorizontalForegroundColor(self->_platform);
            v887 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v888 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v888, "setMaskColor:", v887);

            mediumOrLargeHorizontalFillColor(self->_platform);
            v889 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v890 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v890, "setBackgroundColor:", v889);

          }
          v858 = self->_sizeClass;
        }
      }
      if (v858 == 11)
      {
        v911 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
        -[LPCaptionBarStyle button](self->_captionBar, "button");
        v912 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v912, "margin");
        v913 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v913, "setTrailing:", v911);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v914 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v914, "setScalesToFitParent:", 1);

        if (self->_platform == 5)
          v915 = 56.0;
        else
          v915 = 42.0;
        v916 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", v915);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v917 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v917, "setFixedSize:", v916);

        v918 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v915);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v919 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v919, "setFixedFallbackImageSize:", v918);

        fontWithTraits((void *)*MEMORY[0x1E0DC4A88], 0, self->_sizeClass);
        v920 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v921 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v921, "setFixedFallbackImageFont:", v920);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v922 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v922, "setFixedFallbackImageScale:", &unk_1E44EEB58);

        if (self->_platform == 5)
        {
          -[LPContactsBadgeStyle setIconOffset:](self->_contactsBadgeStyle, "setIconOffset:", -8.0);
          v923 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v924 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v924, "setCornerRadius:", v923);

          v925 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v926 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v926, "margin");
          v927 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v927, "setLeading:", v925);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v928 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v928, "margin");
          v929 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v929, "setTop:", v925);

          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v930 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v930, "margin");
          v931 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v931, "setBottom:", v925);

          v932 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v933 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v933, "captionTextPadding");
          v934 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v934, "setLeading:", v932);

        }
        else
        {
          v935 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 14.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v936 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v936, "margin");
          v937 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v937, "setLeading:", v935);

          v938 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 9.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v939 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v939, "margin");
          v940 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v940, "setTop:", v938);

          v941 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 9.0);
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v942 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v942, "margin");
          v943 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v943, "setBottom:", v941);

          v925 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v932 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
          -[LPPointUnit captionTextPadding](v932, "captionTextPadding");
          v933 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v933, "setLeading:", v925);
        }

        v944 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 13.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v945 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v945, "captionTextPadding");
        v946 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v946, "setTop:", v944);

        v947 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 13.0);
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v948 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v948, "captionTextPadding");
        v949 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v949, "setBottom:", v947);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v950 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v950, "setMaximumNumberOfLines:", 2);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v951 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v951, "setShouldAlignToBaselines:", 0);

        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v952 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v952, "applyToAllTextViewStyles:", &__block_literal_global_992);

        if (self->_isFallbackIcon)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v953 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v954 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v954, "setMaskColor:", v953);

          mediumOrLargeHorizontalFillColor(self->_platform);
          v955 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v956 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v956, "setBackgroundColor:", v955);

        }
      }
      else if (v858 == 12)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v891 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v892 = self->_backgroundColor;
        self->_backgroundColor = v891;

        v893 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 428.0);
        v894 = self->_maximumWidth;
        self->_maximumWidth = v893;

        fallbackIconSize(self->_platform);
        v895 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v896 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v896, "setFixedFallbackImageSize:", v895);

        +[LPPointUnit zero](LPPointUnit, "zero");
        v897 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v898 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v898, "margin");
        v899 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v899, "setLeading:", v897);

        cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
        v900 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v901 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v901, "margin");
        v902 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v902, "setTop:", v900);

        cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
        v903 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v904 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v904, "margin");
        v905 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v905, "setBottom:", v903);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v906 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v906, "setRequireFixedSize:", 1);

        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v907 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v907, "setVerticalAlignment:", 1);

        v908 = -[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self->_sizeClassParameters, "alignButtonWithCaptionTextLeadingEdge");
        v910 = self->_platform;
        if (v908)
        {
          if (v910 == 5)
          {
            largeCardHeadingIconSize(5, v909);
            v970 = (LPSize *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v970 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 60.0);
          }
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v971 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v971, "setFixedSize:", v970);

          if (!self->_isFallbackIcon)
          {
            pt(4.0);
            v972 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v973 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v973, "setCornerRadius:", v972);

            if (self->_platform != 5)
            {
              +[LPShadowStyle collaborationPreviewShadow](LPShadowStyle, "collaborationPreviewShadow");
              v974 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
              v975 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v975, "setShadow:", v974);

            }
            v976 = self->_style;
            if (v976 <= 0x2F && ((1 << v976) & 0x800200010000) != 0)
            {
              pt(0.5);
              v977 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
              v978 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v978, "setBorderWidth:", v977);

              objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
              v979 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v979, "colorWithAlphaComponent:", 0.3);
              v980 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
              v981 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v981, "setBorderColor:", v980);

            }
          }
          if (self->_hasButton)
          {
            -[LPCaptionBarStyle setButtonRespectsTextStackPadding:](self->_captionBar, "setButtonRespectsTextStackPadding:", 1);
            v982 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 191.0);
            -[LPCaptionBarStyle button](self->_captionBar, "button");
            v983 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v983, "setMenuMinimumWidth:", v982);

            v984 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 1.0);
            -[LPCaptionBarStyle button](self->_captionBar, "button");
            v985 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v985, "setAdditionalVerticalPadding:", v984);

            -[LPCaptionBarStyle button](self->_captionBar, "button");
            v986 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v986, "setShowsChevronForSingleAction:", 1);

            v987 = self->_captionBar;
            if (self->_platform == 5)
            {
              -[LPCaptionBarStyle button](v987, "button");
              v988 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v988, "setUseSegmentedControl:", 1);

              pt(11.0);
              v989 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v990 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v990, "padding");
              v991 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v991, "setTop:", v989);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v992 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v993 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v993, "margin");
              v994 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v994, "setTrailing:", v992);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v995 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v996 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v996, "margin");
              v997 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v997, "setLeading:", v995);

              -[LPCaptionBarStyle setAddFullWidthLineForButton:](self->_captionBar, "setAddFullWidthLineForButton:", 1);
              -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
              -[LPCaptionBarStyle setButtonIgnoresTextSafeAreaInsets:](self->_captionBar, "setButtonIgnoresTextSafeAreaInsets:", 1);
            }
            else
            {
              -[LPCaptionBarStyle setPositionButtonRelativeToTextStack:](v987, "setPositionButtonRelativeToTextStack:", 1);
            }
          }
          if (self->_platform == 5)
          {
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1006 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1006, "setUseFullWidth:", 1);

            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
            v1007 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1008 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1008, "setBackgroundColor:", v1007);

            pt(14.0);
            v1009 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1010 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1010, "margin");
            v1011 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1011, "setTop:", v1009);

            +[LPPointUnit zero](LPPointUnit, "zero");
            v1012 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1013 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1013, "margin");
            v1014 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1014, "setBottom:", v1012);

            pt(14.0);
            v1015 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1016 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1016, "setCornerRadius:", v1015);

            pt(23.0);
            v1017 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1018 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1018, "padding");
            v1019 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1019, "setBottom:", v1017);

            pt(27.0);
            v1020 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1021 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1021, "padding");
            v1022 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1022, "setLeading:", v1020);

            pt(27.0);
            v1023 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1024 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1024, "padding");
            v1025 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1025, "setTrailing:", v1023);

            -[LPCaptionBarStyle setMinimumNumberOfLinesToVerticallyCenter:](self->_captionBar, "setMinimumNumberOfLinesToVerticallyCenter:", 1);
            -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
            v1004 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1004, "setVerticalAlignment:", 3);
LABEL_356:

            applyCommonCardHeadingCaptionBarProperties(self->_captionBar, self->_platform, self->_style, self->_sizeClass, self->_isFallbackIcon);
            if (!adjustForStyle_outerMargin)
            {
              v1026 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
              v1027 = (void *)adjustForStyle_outerMargin;
              adjustForStyle_outerMargin = (uint64_t)v1026;

            }
            if (self->_hasButton)
            {
              if (!-[LPCaptionBarStyle addFullWidthLineForButton](self->_captionBar, "addFullWidthLineForButton"))
              {
                v1028 = adjustForStyle_outerMargin;
                -[LPCaptionBarStyle button](self->_captionBar, "button");
                v1029 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1029, "margin");
                v1030 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1030, "setLeading:", v1028);

              }
              if (-[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self->_sizeClassParameters, "alignButtonWithCaptionTextLeadingEdge"))
              {
                +[LPPointUnit zero](LPPointUnit, "zero");
                v1031 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v1031 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
              }
              v1032 = v1031;
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1033 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1033, "margin");
              v1034 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1034, "setTop:", v1032);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v1035 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1036 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1036, "margin");
              v1037 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1037, "setTrailing:", v1035);

              objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
              v1038 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1039 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1039, "setMenuBackgroundColor:", v1038);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v1040 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1041 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1041, "setHeight:", v1040);

              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1042 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1042, "setIgnoresInvertColors:", 1);

              -[LPCaptionBarStyle button](self->_captionBar, "button");
              v1043 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1043, "setEnableUserInteractionForDecorativeButton:", 0);

              if (self->_platform == 5)
              {
                +[LPPointUnit zero](LPPointUnit, "zero");
                v1044 = (void *)objc_claimAutoreleasedReturnValue();
                -[LPCaptionBarStyle button](self->_captionBar, "button");
                v1045 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1045, "margin");
                v1046 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1046, "setTop:", v1044);

                +[LPPointUnit zero](LPPointUnit, "zero");
                v1047 = (void *)objc_claimAutoreleasedReturnValue();
                -[LPCaptionBarStyle button](self->_captionBar, "button");
                v1048 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1048, "margin");
                v1049 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1049, "setBottom:", v1047);

              }
              else
              {
                v1050 = adjustForStyle_outerMargin;
                -[LPCaptionBarStyle button](self->_captionBar, "button");
                v1047 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1047, "margin");
                v1048 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1048, "setBottom:", v1050);
              }

            }
            if (self->_platform == 5)
            {
              +[LPPointUnit zero](LPPointUnit, "zero");
              v1051 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
              v1052 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1052, "captionTextPadding");
              v1053 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1053, "setTop:", v1051);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v1054 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
              v1055 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1055, "captionTextPadding");
              v1056 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1056, "setBottom:", v1054);

              +[LPPointUnit zero](LPPointUnit, "zero");
              v1057 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
              v1058 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1058, "setLastLineDescent:", v1057);
            }
            else
            {
              v1059 = adjustForStyle_outerMargin;
              -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
              v1057 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1057, "captionTextPadding");
              v1058 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1058, "setTop:", v1059);
            }

            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1060 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1060, "applyToAllTextViewStyles:", &__block_literal_global_987);

            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v1061 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1062 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1062, "topCaption");
            v1063 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1063, "leading");
            v1064 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1064, "setColor:", v1061);

            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
            v1065 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1066 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1066, "bottomCaption");
            v1067 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1067, "leading");
            v1068 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1068, "setColor:", v1065);

            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
            v1069 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1070 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1070, "belowBottomCaption");
            v1071 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1071, "leading");
            v1072 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1072, "setColor:", v1069);

            LOBYTE(v1071) = UIContentSizeCategoryCompareToCategory(self->_preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) != NSOrderedAscending;
            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1073 = (void *)objc_claimAutoreleasedReturnValue();
            v1074 = MEMORY[0x1E0C809B0];
            v1100[0] = MEMORY[0x1E0C809B0];
            v1100[1] = 3221225472;
            v1100[2] = __25__LPTheme_adjustForStyle__block_invoke_3_988;
            v1100[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
            v1101 = (char)v1071;
            objc_msgSend(v1073, "applyToAllTextViewStyles:", v1100);

            -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
            v1075 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1075, "topCaption");
            v1076 = (void *)objc_claimAutoreleasedReturnValue();
            v1098[0] = v1074;
            v1098[1] = 3221225472;
            v1098[2] = __25__LPTheme_adjustForStyle__block_invoke_4_989;
            v1098[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
            v1099 = (char)v1071;
            objc_msgSend(v1076, "applyToAllTextViewStyles:", v1098);

            if (self->_hasButton)
            {
              if (self->_platform != 5
                || !-[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self->_sizeClassParameters, "alignButtonWithCaptionTextLeadingEdge"))
              {
                -[LPCaptionBarStyle setMinimumNumberOfLinesToVerticallyCenter:](self->_captionBar, "setMinimumNumberOfLinesToVerticallyCenter:", 0xFFFFFFFFLL);
              }
              -[LPCaptionBarStyle setUsesOutOfLineButton:](self->_captionBar, "setUsesOutOfLineButton:", 1);
              -[LPCaptionBarStyle setCanAddLineForButton:](self->_captionBar, "setCanAddLineForButton:", 1);
              -[LPCaptionBarStyle setButtonIgnoresTextSafeAreaInsets:](self->_captionBar, "setButtonIgnoresTextSafeAreaInsets:", 1);
              if (-[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self->_sizeClassParameters, "alignButtonWithCaptionTextLeadingEdge"))
              {
                -[LPCaptionBarStyle setAlignButtonWithCaptionTextLeadingEdge:](self->_captionBar, "setAlignButtonWithCaptionTextLeadingEdge:", 1);
              }
            }
            -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
            v1077 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1077, "setShowSeparator:", 0);

            if (self->_platform == 5)
            {
              v1078 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 11.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1079 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1079, "margin");
              v1080 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1080, "setTop:", v1078);

              v1081 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 22.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1082 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1082, "margin");
              v1083 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1083, "setBottom:", v1081);

              v1084 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 22.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1085 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1085, "padding");
              v1086 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1086, "setTop:", v1084);

              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1087 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1087, "setIgnoreSafeAreaInset:", 1);

            }
            else
            {
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1088 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1088, "setUseFullWidth:", 0);

              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1089 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1089, "setUseInlineIndicator:", 1);

              v1090 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 10.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1091 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1091, "margin");
              v1092 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1092, "setTop:", v1090);

              v1093 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 13.0);
              -[LPCaptionBarStyle collaborationFooter](self->_captionBar, "collaborationFooter");
              v1094 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1094, "margin");
              v1095 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v1095, "setBottom:", v1093);

            }
            return;
          }
          pt(11.0);
          v1004 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
          v1005 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1005, "setLastLineDescent:", v1004);
        }
        else
        {
          if (v910 == 5)
          {
            cardHeadingIconSize(5uLL, v909);
            v969 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v998 = (void *)largeCardHeadingReducedIconSize_normalSize;
            if (!largeCardHeadingReducedIconSize_normalSize)
            {
              v999 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 72.0);
              v1000 = (void *)largeCardHeadingReducedIconSize_normalSize;
              largeCardHeadingReducedIconSize_normalSize = (uint64_t)v999;

              v998 = (void *)largeCardHeadingReducedIconSize_normalSize;
            }
            v969 = v998;
          }
          v1001 = v969;
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v1002 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1002, "setMinimumSize:", v1001);

          largeCardHeadingIconSize(self->_platform, v1003);
          v1004 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
          v1005 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1005, "setFixedSize:", v1004);
        }

        goto LABEL_356;
      }
      v1097[0] = MEMORY[0x1E0C809B0];
      v1097[1] = 3221225472;
      v1097[2] = __25__LPTheme_adjustForStyle__block_invoke_2_993;
      v1097[3] = &unk_1E44A9878;
      v1097[4] = self;
      if (__25__LPTheme_adjustForStyle__block_invoke_2_993((uint64_t)v1097))
      {
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v957 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v957, "margin");
        v958 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v958, "leading");
        v959 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v959, "value");
        v961 = v960;
        -[LPCaptionBarStyle textStack](self->_captionBar, "textStack");
        v962 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v962, "captionTextPadding");
        v963 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v963, "leading");
        v964 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v964, "value");
        v966 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", v961 - v965);
        -[LPCaptionBarStyle leadingIcon](self->_captionBar, "leadingIcon");
        v967 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v967, "margin");
        v968 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v968, "setTrailing:", v966);

      }
      return;
  }
}

void __25__LPTheme_adjustForStyle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setMaximumLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v3);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v5 = v4 > 6;
  v6 = (1 << v4) & 0x75;
  if (v5 || v6 == 0)
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B90]);
  else
    fontWithTraits((void *)*MEMORY[0x1E0DC4B08], 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

}

void __25__LPTheme_adjustForStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  LODWORD(v4) = 1036831949;
  if (!*(_BYTE *)(a1 + 32))
    *(float *)&v4 = 0.0;
  v7 = v3;
  objc_msgSend(v3, "setHyphenationFactor:", v4);
  if (*(_BYTE *)(a1 + 32))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v7, "setMaximumLines:", v5);
  +[LPPointUnit zero](LPPointUnit, "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFirstLineLeading:", v6);

  objc_msgSend(v7, "setMaximumLineCountScalingBehavior:", 0);
}

void __25__LPTheme_adjustForStyle__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
    v4 = 2;
  else
    v4 = 1;
  v6 = v3;
  objc_msgSend(v3, "setMaximumLines:", v4);
  +[LPPointUnit zero](LPPointUnit, "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFirstLineLeading:", v5);

  objc_msgSend(v6, "setMaximumLineCountScalingBehavior:", 0);
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

void __25__LPTheme_adjustForStyle__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMaximumLines:", 1);
  +[LPPointUnit zero](LPPointUnit, "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstLineLeading:", v2);

  objc_msgSend(v3, "setMaximumLineCountScalingBehavior:", 0);
}

void __25__LPTheme_adjustForStyle__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMaximumLines:", 1);
  +[LPPointUnit zero](LPPointUnit, "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstLineLeading:", v2);

  objc_msgSend(v3, "setMaximumLineCountScalingBehavior:", 0);
}

void __25__LPTheme_adjustForStyle__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B88]);
  else
    fontWithTraits((void *)*MEMORY[0x1E0DC4AB8], 32770, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v2);

}

void __25__LPTheme_adjustForStyle__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B88]);
  else
    fontWithTraits((void *)*MEMORY[0x1E0DC4AB8], 0x8000, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v2);

}

void __25__LPTheme_adjustForStyle__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMaximumLines:", 1);
  objc_msgSend(v3, "setColor:", *(_QWORD *)(a1 + 32));

}

void __25__LPTheme_adjustForStyle__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v2);

}

void __25__LPTheme_adjustForStyle__block_invoke_984(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setMaximumLines:", 1);
  objc_msgSend(v2, "setMaximumLineCountScalingBehavior:", 1);

}

void __25__LPTheme_adjustForStyle__block_invoke_2_986(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[LPPointUnit zero](LPPointUnit, "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstLineLeading:", v2);

}

void __25__LPTheme_adjustForStyle__block_invoke_3_988(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
    v4 = 2;
  else
    v4 = 1;
  v5 = v3;
  objc_msgSend(v3, "setMaximumLines:", v4);
  objc_msgSend(v5, "setMaximumLineCountScalingBehavior:", 0);

}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_4_989(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = 1036831949;
  if (!*(_BYTE *)(a1 + 32))
    *(float *)&a3 = 0.0;
  return objc_msgSend(a2, "setHyphenationFactor:", a3);
}

void __25__LPTheme_adjustForStyle__block_invoke_991(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[LPPointUnit zero](LPPointUnit, "zero");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstLineLeading:", v2);

}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_2_993(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = stylePrefersLeadingIcon(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    return v4 != 3 && (v4 != 47 || *(_QWORD *)(v3 + 32) != 5);
  }
  return result;
}

+ (void)addClient:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[LPThemeParametersObserver shared](LPThemeParametersObserver, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addClient:", v4);

}

+ (void)removeClient:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[LPThemeParametersObserver shared](LPThemeParametersObserver, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", v4);

}

+ (int64_t)platformForView:(id)a3
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)valueForThemeProperty:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPTheme valueForKeyPath:](self, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)CSSTextForThemeProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LPTheme valueForThemeProperty:](self, "valueForThemeProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[LPTheme CSSTextForProperty:withValue:](self, "CSSTextForProperty:withValue:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)CSSTextForProperty:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = v5;
    objc_msgSend(v6, "_lp_CSSText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)iconPlatterPaddingForReason:(int64_t)a3
{
  LPPointUnit *v3;
  double v4;

  if (a3 == 2)
  {
    v3 = [LPPointUnit alloc];
    v4 = 20.0;
    return -[LPPointUnit initWithValue:](v3, "initWithValue:", v4);
  }
  if (a3 == 1)
  {
    v3 = [LPPointUnit alloc];
    v4 = 26.0;
    return -[LPPointUnit initWithValue:](v3, "initWithValue:", v4);
  }
  +[LPPointUnit zero](LPPointUnit, "zero");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)iconPlatterCornerRadius
{
  return -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 1.5);
}

+ (id)defaultBackgroundColorForPlatform:(int64_t)a3
{
  return defaultBackgroundColor(a3);
}

- (LPPointUnit)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (LPAppearanceDependentValue)highlightCompositingFilter
{
  return self->_highlightCompositingFilter;
}

- (void)setHighlightCompositingFilter:(id)a3
{
  objc_storeStrong((id *)&self->_highlightCompositingFilter, a3);
}

- (int64_t)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  self->_backgroundMaterial = a3;
}

- (LPCaptionBarStyle)captionBar
{
  return self->_captionBar;
}

- (LPQuotedTextViewStyle)quotedText
{
  return self->_quotedText;
}

- (LPImageViewStyle)mediaImage
{
  return self->_mediaImage;
}

- (LPImageViewStyle)placeholderImage
{
  return self->_placeholderImage;
}

- (LPVisualMediaViewStyle)mediaVideo
{
  return self->_mediaVideo;
}

- (UIColor)mediaBackgroundColor
{
  return self->_mediaBackgroundColor;
}

- (void)setMediaBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_mediaBackgroundColor, a3);
}

- (LPCaptionBarStyle)mediaTopCaptionBar
{
  return self->_mediaTopCaptionBar;
}

- (LPCaptionBarStyle)mediaBottomCaptionBar
{
  return self->_mediaBottomCaptionBar;
}

- (LPTapToLoadViewStyle)tapToLoad
{
  return self->_tapToLoad;
}

- (UIFont)domainNameIndicatorFont
{
  return self->_domainNameIndicatorFont;
}

- (UIFont)domainNameIndicatorIconFont
{
  return self->_domainNameIndicatorIconFont;
}

- (LPImageViewStyle)backgroundImage
{
  return self->_backgroundImage;
}

- (LPContactsBadgeStyle)contactsBadgeStyle
{
  return self->_contactsBadgeStyle;
}

- (LPIndeterminateProgressSpinnerStyle)progressSpinner
{
  return self->_progressSpinner;
}

- (LPPointUnit)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maximumWidth, a3);
}

- (double)widthFractionForTallMedia
{
  return self->_widthFractionForTallMedia;
}

- (void)setWidthFractionForTallMedia:(double)a3
{
  self->_widthFractionForTallMedia = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWidth, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_contactsBadgeStyle, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_domainNameIndicatorIconFont, 0);
  objc_storeStrong((id *)&self->_domainNameIndicatorFont, 0);
  objc_storeStrong((id *)&self->_tapToLoad, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_mediaVideo, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_mediaImage, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);
  objc_storeStrong((id *)&self->_highlightCompositingFilter, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
}

+ (void)invalidateThemeCache
{
  id v2;

  +[LPThemeParametersObserver shared](LPThemeParametersObserver, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeThemeParameters");

}

@end
