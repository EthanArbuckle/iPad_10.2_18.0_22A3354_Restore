@implementation ASCDefaultLockupTheme

+ (ASCDefaultLockupTheme)sharedTheme
{
  if (sharedTheme_onceToken != -1)
    dispatch_once(&sharedTheme_onceToken, &__block_literal_global_5);
  return (ASCDefaultLockupTheme *)(id)sharedTheme_sharedTheme;
}

void __36__ASCDefaultLockupTheme_sharedTheme__block_invoke()
{
  ASCDefaultLockupTheme *v0;
  void *v1;

  v0 = objc_alloc_init(ASCDefaultLockupTheme);
  v1 = (void *)sharedTheme_sharedTheme;
  sharedTheme_sharedTheme = (uint64_t)v0;

}

+ (CGSize)preferredIconSizeForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  double IconSize;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v5 = a3;
  IconSize = ASCLockupViewSizeGetIconSize(v5, objc_msgSend(a4, "horizontalSizeClass"));
  v8 = v7;

  v9 = IconSize;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (int64_t)preferredLabelAlignmentForSize:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  int64_t v10;
  const char *v12;

  v3 = a3;
  if ((ASCLockupViewSizeIsMini(v3, v4) & 1) != 0
    || (ASCLockupViewSizeIsSmall(v3, v5) & 1) != 0
    || (ASCLockupViewSizeIsMedium(v3, v6) & 1) != 0
    || (ASCLockupViewSizeIsSmallOfferButton(v3, v7) & 1) != 0
    || (ASCLockupViewSizeIsMediumOfferButton(v3, v8) & 1) != 0)
  {
    v10 = 4;
  }
  else
  {
    if ((ASCLockupViewSizeIsLargeAppShowcase(v3, v9) & 1) == 0 && (ASCLockupViewSizeIsLargeAppAd(v3, v12) & 1) == 0)
      ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v3);
    v10 = 1;
  }

  return v10;
}

+ (id)headingLabelColorForView:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend(a3, "lockupSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ASCLockupViewSizeIsMini(v3, v4) & 1) != 0)
    +[ASCSemanticColor primaryLabel]();
  else
    +[ASCSemanticColor secondaryLabel]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)headingLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  const char *v6;
  void *v7;

  v5 = a4;
  if (ASCLockupViewSizeIsMini(a3, v6))
    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], v5, *MEMORY[0x1E0DC4B88]);
  else
    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AB8], 0x8000, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)titleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lockupSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (ASCLockupViewSizeIsMini(v7, v8))
  {
    v10 = (void *)MEMORY[0x1E0DC37E8];
    v11 = *MEMORY[0x1E0DC4B10];
    v12 = *MEMORY[0x1E0DC4B88];
LABEL_8:
    objc_msgSend(v10, "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", v11, v12, v6);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((ASCLockupViewSizeIsSmall(v7, v9) & 1) != 0
    || (ASCLockupViewSizeIsMedium(v7, v13) & 1) != 0
    || (ASCLockupViewSizeIsSmallOfferButton(v7, v14) & 1) != 0
    || ASCLockupViewSizeIsMediumOfferButton(v7, v15))
  {
    v10 = (void *)MEMORY[0x1E0DC37E8];
    v11 = *MEMORY[0x1E0DC4A88];
    v12 = 0x8000;
    goto LABEL_8;
  }
  if ((ASCLockupViewSizeIsLargeAppShowcase(v7, v16) & 1) == 0 && !ASCLockupViewSizeIsLargeAppAd(v7, v20))
    ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v7);
  objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B58], v6);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = (void *)v17;

  return v18;
}

+ (int64_t)numberOfLinesInTitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return ASCLockupViewSizeIsMini(a3, a2);
}

+ (id)subtitleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  _QWORD *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lockupSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ASCLockupViewSizeIsMini(v7, v8) & 1) != 0)
  {
    v10 = (_QWORD *)MEMORY[0x1E0DC4A98];
  }
  else if ((ASCLockupViewSizeIsSmall(v7, v9) & 1) != 0
         || (ASCLockupViewSizeIsMedium(v7, v11) & 1) != 0
         || (ASCLockupViewSizeIsSmallOfferButton(v7, v12) & 1) != 0
         || (ASCLockupViewSizeIsMediumOfferButton(v7, v13) & 1) != 0)
  {
    v10 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  }
  else
  {
    if ((ASCLockupViewSizeIsLargeAppShowcase(v7, v14) & 1) == 0 && (ASCLockupViewSizeIsLargeAppAd(v7, v17) & 1) == 0)
      ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v7);
    v10 = (_QWORD *)MEMORY[0x1E0DC4B10];
  }
  objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:compatibleWithTraitCollection:", *v10, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (int64_t)numberOfLinesInSubtitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return ASCLockupViewSizeIsMini(a3, a2);
}

+ (void)updateOfferStatusLabelColorForView:(id)a3
{
  id v3;

  objc_msgSend(a3, "offerStatusLabelIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setTextColorFollowsTintColor:", 1);

}

+ (id)offerStatusLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AB8], 0x8000, a4);
}

- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int64_t v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "lockupSize");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  +[ASCDefaultLockupTheme preferredIconSizeForSize:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "preferredIconSizeForSize:compatibleWithTraitCollection:", v45, v5);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "iconArtworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredSize:", v8, v10);

  v12 = +[ASCDefaultLockupTheme preferredLabelAlignmentForSize:](ASCDefaultLockupTheme, "preferredLabelAlignmentForSize:", v45);
  +[ASCDefaultLockupTheme headingLabelFontForSize:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "headingLabelFontForSize:compatibleWithTraitCollection:", v45, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headingLabelIfLoaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  +[ASCDefaultLockupTheme headingLabelColorForView:](ASCDefaultLockupTheme, "headingLabelColorForView:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headingLabelIfLoaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  objc_msgSend(v6, "headingLabelIfLoaded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", v12);

  objc_msgSend(v6, "headingLabelIfLoaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNumberOfLines:", 1);

  objc_msgSend(v6, "headingLabelIfLoaded");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLineBreakMode:", 4);

  +[ASCDefaultLockupTheme titleLabelFontForView:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "titleLabelFontForView:compatibleWithTraitCollection:", v6, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  objc_msgSend(v6, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextAlignment:", v12);

  +[ASCSemanticColor loading]();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSkeletonColor:", v23);

  +[ASCSemanticColor primaryLabel]();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  v27 = +[ASCDefaultLockupTheme numberOfLinesInTitleForSize:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "numberOfLinesInTitleForSize:compatibleWithTraitCollection:", v45, v5);
  objc_msgSend(v6, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", v27);

  objc_msgSend(v6, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLineBreakMode:", 4);

  +[ASCDefaultLockupTheme subtitleLabelFontForView:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "subtitleLabelFontForView:compatibleWithTraitCollection:", v6, v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFont:", v30);

  objc_msgSend(v6, "subtitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextAlignment:", v12);

  +[ASCSemanticColor loading]();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSkeletonColor:", v33);

  +[ASCSemanticColor secondaryLabel]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextColor:", v35);

  v37 = +[ASCDefaultLockupTheme numberOfLinesInSubtitleForSize:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "numberOfLinesInSubtitleForSize:compatibleWithTraitCollection:", v45, v5);
  objc_msgSend(v6, "subtitleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setNumberOfLines:", v37);

  objc_msgSend(v6, "subtitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLineBreakMode:", 4);

  +[ASCDefaultLockupTheme updateOfferStatusLabelColorForView:](ASCDefaultLockupTheme, "updateOfferStatusLabelColorForView:", v6);
  +[ASCDefaultLockupTheme offerStatusLabelFontForSize:compatibleWithTraitCollection:](ASCDefaultLockupTheme, "offerStatusLabelFontForSize:compatibleWithTraitCollection:", v45, v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "offerStatusLabelIfLoaded");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFont:", v40);

  objc_msgSend(v6, "offerStatusLabelIfLoaded");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextAlignment:", v12);

  objc_msgSend(v6, "offerStatusLabelIfLoaded");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNumberOfLines:", 1);

  objc_msgSend(v6, "offerStatusLabelIfLoaded");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setLineBreakMode:", 4);
}

@end
