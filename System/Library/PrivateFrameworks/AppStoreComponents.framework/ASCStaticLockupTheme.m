@implementation ASCStaticLockupTheme

+ (ASCStaticLockupTheme)adTheme
{
  if (adTheme_onceToken_0 != -1)
    dispatch_once(&adTheme_onceToken_0, &__block_literal_global_27);
  return (ASCStaticLockupTheme *)(id)adTheme_adTheme_0;
}

void __31__ASCStaticLockupTheme_adTheme__block_invoke()
{
  ASCStaticLockupTheme *v0;
  double v1;
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = [ASCStaticLockupTheme alloc];
  +[ASCSemanticColor primaryLabel]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DC4B70];
  +[ASCSemanticColor secondaryLabel]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC4B88];
  +[ASCSemanticColor secondaryLabel]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCStaticLockupTheme initWithTitleTextColor:titleFontSizeProvider:titleFontWeight:subtitleTextColor:subtitleFontSizeProvider:subtitleFontWeight:headingTextColor:headingFontSizeProvider:headingFontWeight:](v0, "initWithTitleTextColor:titleFontSizeProvider:titleFontWeight:subtitleTextColor:subtitleFontSizeProvider:subtitleFontWeight:headingTextColor:headingFontSizeProvider:headingFontWeight:", v7, &__block_literal_global_3_1, v2, &__block_literal_global_5, v4, &__block_literal_global_6_2, v1, v3, *MEMORY[0x1E0DC4B90]);
  v6 = (void *)adTheme_adTheme_0;
  adTheme_adTheme_0 = v5;

}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupTitlePointSizeProvider:](__ASCLayoutProxy, "lockupTitlePointSizeProvider:", a2);
}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupSubtitlePointSizeProvider:](__ASCLayoutProxy, "lockupSubtitlePointSizeProvider:", a2);
}

uint64_t __31__ASCStaticLockupTheme_adTheme__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupHeadingPointSizeProvider:](__ASCLayoutProxy, "lockupHeadingPointSizeProvider:", a2);
}

+ (ASCStaticLockupTheme)adWhiteTheme
{
  if (adWhiteTheme_onceToken != -1)
    dispatch_once(&adWhiteTheme_onceToken, &__block_literal_global_7_0);
  return (ASCStaticLockupTheme *)(id)adWhiteTheme_adWhiteTheme;
}

void __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke()
{
  ASCStaticLockupTheme *v0;
  void *v1;
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = [ASCStaticLockupTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCSemanticColor primaryLabel]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *MEMORY[0x1E0DC4B70];
  ASCLockupDarkStyleSubtitleColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4B88];
  ASCLockupDarkStyleSubtitleColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASCStaticLockupTheme initWithTitleTextColor:titleFontSizeProvider:titleFontWeight:subtitleTextColor:subtitleFontSizeProvider:subtitleFontWeight:headingTextColor:headingFontSizeProvider:headingFontWeight:](v0, "initWithTitleTextColor:titleFontSizeProvider:titleFontWeight:subtitleTextColor:subtitleFontSizeProvider:subtitleFontWeight:headingTextColor:headingFontSizeProvider:headingFontWeight:", v9, &__block_literal_global_8_0, v4, &__block_literal_global_9_0, v6, &__block_literal_global_10, v3, v5, *MEMORY[0x1E0DC4B90]);
  v8 = (void *)adWhiteTheme_adWhiteTheme;
  adWhiteTheme_adWhiteTheme = v7;

}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupTitlePointSizeProvider:](__ASCLayoutProxy, "lockupTitlePointSizeProvider:", a2);
}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupSubtitlePointSizeProvider:](__ASCLayoutProxy, "lockupSubtitlePointSizeProvider:", a2);
}

uint64_t __36__ASCStaticLockupTheme_adWhiteTheme__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[__ASCLayoutProxy lockupHeadingPointSizeProvider:](__ASCLayoutProxy, "lockupHeadingPointSizeProvider:", a2);
}

- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleTextStyle:(id)a4 titleFontWeight:(double)a5 subtitleTextColor:(id)a6 subtitleTextStyle:(id)a7 subtitleFontWeight:(double)a8 headingTextColor:(id)a9 headingTextStyle:(id)a10 headingFontWeight:(double)a11
{
  id v21;
  id v22;
  id v23;
  ASCStaticLockupTheme *v24;
  ASCStaticLockupTheme *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v30.receiver = self;
  v30.super_class = (Class)ASCStaticLockupTheme;
  v24 = -[ASCStaticLockupTheme init](&v30, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_titleTextColor, a3);
    objc_storeStrong((id *)&v25->_titleTextStyle, a4);
    v25->_titleFontWeight = a5;
    objc_storeStrong((id *)&v25->_subtitleTextColor, a6);
    objc_storeStrong((id *)&v25->_subtitleTextStyle, a7);
    v25->_subtitleFontWeight = a8;
    objc_storeStrong((id *)&v25->_headingTextColor, a9);
    objc_storeStrong((id *)&v25->_headingTextStyle, a10);
    v25->_headingFontWeight = a11;
  }

  return v25;
}

- (ASCStaticLockupTheme)initWithTitleTextColor:(id)a3 titleFontSizeProvider:(id)a4 titleFontWeight:(double)a5 subtitleTextColor:(id)a6 subtitleFontSizeProvider:(id)a7 subtitleFontWeight:(double)a8 headingTextColor:(id)a9 headingFontSizeProvider:(id)a10 headingFontWeight:(double)a11
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ASCStaticLockupTheme *v26;
  ASCStaticLockupTheme *v27;
  uint64_t v28;
  id titleFontSizeProvider;
  uint64_t v30;
  id subtitleFontSizeProvider;
  uint64_t v32;
  id headingFontSizeProvider;
  id v35;
  objc_super v36;

  v35 = a3;
  v21 = a4;
  v22 = a6;
  v23 = a7;
  v24 = a9;
  v25 = a10;
  v36.receiver = self;
  v36.super_class = (Class)ASCStaticLockupTheme;
  v26 = -[ASCStaticLockupTheme init](&v36, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_titleTextColor, a3);
    v28 = MEMORY[0x1BCCFE944](v21);
    titleFontSizeProvider = v27->_titleFontSizeProvider;
    v27->_titleFontSizeProvider = (id)v28;

    v27->_titleFontWeight = a5;
    objc_storeStrong((id *)&v27->_subtitleTextColor, a6);
    v30 = MEMORY[0x1BCCFE944](v23);
    subtitleFontSizeProvider = v27->_subtitleFontSizeProvider;
    v27->_subtitleFontSizeProvider = (id)v30;

    v27->_subtitleFontWeight = a8;
    objc_storeStrong((id *)&v27->_headingTextColor, a9);
    v32 = MEMORY[0x1BCCFE944](v25);
    headingFontSizeProvider = v27->_headingFontSizeProvider;
    v27->_headingFontSizeProvider = (id)v32;

    v27->_headingFontWeight = a11;
  }

  return v27;
}

- (id)titleFontCompatibleWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double (**v6)(_QWORD, _QWORD);
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ASCStaticLockupTheme titleFontSizeProvider](self, "titleFontSizeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCStaticLockupTheme titleFontSizeProvider](self, "titleFontSizeProvider");
    v6 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = ((double (**)(_QWORD, void *))v6)[2](v6, v7);
    if (!titleFontCompatibleWithTraitCollection__titleFont
      || (objc_msgSend((id)titleFontCompatibleWithTraitCollection__titleFont, "pointSize"), v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E0DC37E8];
      -[ASCStaticLockupTheme titleFontWeight](self, "titleFontWeight");
      objc_msgSend(v10, "systemFontOfSize:weight:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)titleFontCompatibleWithTraitCollection__titleFont;
      titleFontCompatibleWithTraitCollection__titleFont = v12;

    }
    v14 = (id)titleFontCompatibleWithTraitCollection__titleFont;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0DC37E8];
    -[ASCStaticLockupTheme titleTextStyle](self, "titleTextStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCStaticLockupTheme titleFontWeight](self, "titleFontWeight");
    objc_msgSend(v15, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v16, v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)subtitleFontCompatibleWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double (**v6)(_QWORD, _QWORD);
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ASCStaticLockupTheme subtitleFontSizeProvider](self, "subtitleFontSizeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCStaticLockupTheme subtitleFontSizeProvider](self, "subtitleFontSizeProvider");
    v6 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = ((double (**)(_QWORD, void *))v6)[2](v6, v7);
    if (!subtitleFontCompatibleWithTraitCollection__subtitleFont
      || (objc_msgSend((id)subtitleFontCompatibleWithTraitCollection__subtitleFont, "pointSize"), v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E0DC37E8];
      -[ASCStaticLockupTheme subtitleFontWeight](self, "subtitleFontWeight");
      objc_msgSend(v10, "systemFontOfSize:weight:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)subtitleFontCompatibleWithTraitCollection__subtitleFont;
      subtitleFontCompatibleWithTraitCollection__subtitleFont = v12;

    }
    v14 = (id)subtitleFontCompatibleWithTraitCollection__subtitleFont;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0DC37E8];
    -[ASCStaticLockupTheme subtitleTextStyle](self, "subtitleTextStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCStaticLockupTheme subtitleFontWeight](self, "subtitleFontWeight");
    objc_msgSend(v15, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v16, v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)headingFontCompatibleWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double (**v6)(_QWORD, _QWORD);
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ASCStaticLockupTheme headingFontSizeProvider](self, "headingFontSizeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASCStaticLockupTheme headingFontSizeProvider](self, "headingFontSizeProvider");
    v6 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = ((double (**)(_QWORD, void *))v6)[2](v6, v7);
    if (!headingFontCompatibleWithTraitCollection__headingFont
      || (objc_msgSend((id)headingFontCompatibleWithTraitCollection__headingFont, "pointSize"), v9 != v8))
    {
      v10 = (void *)MEMORY[0x1E0DC37E8];
      -[ASCStaticLockupTheme headingFontWeight](self, "headingFontWeight");
      objc_msgSend(v10, "systemFontOfSize:weight:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)headingFontCompatibleWithTraitCollection__headingFont;
      headingFontCompatibleWithTraitCollection__headingFont = v12;

    }
    v14 = (id)headingFontCompatibleWithTraitCollection__headingFont;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0DC37E8];
    -[ASCStaticLockupTheme headingTextStyle](self, "headingTextStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCStaticLockupTheme headingFontWeight](self, "headingFontWeight");
    objc_msgSend(v15, "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", v16, v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v6;
  id v7;
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

  v6 = a4;
  v7 = a3;
  -[ASCStaticLockupTheme titleTextColor](self, "titleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[ASCStaticLockupTheme subtitleTextColor](self, "subtitleTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[ASCStaticLockupTheme headingTextColor](self, "headingTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headingLabelIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[ASCStaticLockupTheme titleFontCompatibleWithTraitCollection:](self, "titleFontCompatibleWithTraitCollection:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[ASCStaticLockupTheme subtitleFontCompatibleWithTraitCollection:](self, "subtitleFontCompatibleWithTraitCollection:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[ASCStaticLockupTheme headingFontCompatibleWithTraitCollection:](self, "headingFontCompatibleWithTraitCollection:", v6);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "headingLabelIfLoaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setFont:", v19);
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCStaticLockupTheme titleTextColor](self, "titleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCStaticLockupTheme titleTextStyle](self, "titleTextStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCStaticLockupTheme titleFontWeight](self, "titleFontWeight");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCStaticLockupTheme subtitleTextColor](self, "subtitleTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCStaticLockupTheme subtitleTextStyle](self, "subtitleTextStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCStaticLockupTheme subtitleFontWeight](self, "subtitleFontWeight");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCStaticLockupTheme headingTextColor](self, "headingTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCStaticLockupTheme headingTextStyle](self, "headingTextStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCStaticLockupTheme headingFontWeight](self, "headingFontWeight");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  ASCStaticLockupTheme *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

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
    -[ASCStaticLockupTheme titleTextColor](self, "titleTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleTextColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCStaticLockupTheme titleTextStyle](self, "titleTextStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titleTextStyle");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (!objc_msgSend(v11, "isEqual:", v12))
            goto LABEL_33;
        }
        else if (v11 != (void *)v12)
        {
          goto LABEL_33;
        }
        -[ASCStaticLockupTheme titleFontWeight](self, "titleFontWeight");
        v16 = v15;
        objc_msgSend(v7, "titleFontWeight");
        if (v16 == v17)
        {
          -[ASCStaticLockupTheme subtitleTextColor](self, "subtitleTextColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "subtitleTextColor");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v18 && v19)
          {
            if (objc_msgSend(v18, "isEqual:", v19))
            {
LABEL_22:
              -[ASCStaticLockupTheme subtitleTextStyle](self, "subtitleTextStyle");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "subtitleTextStyle");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if (v21 && v22)
              {
                v24 = v21;
                v51 = v20;
                v25 = v21;
                v26 = v23;
                v27 = objc_msgSend(v24, "isEqual:", v23);
                v23 = v26;
                v21 = v25;
                v20 = v51;
                if (v27)
                  goto LABEL_25;
              }
              else if (v21 == (void *)v22)
              {
LABEL_25:
                v49 = v23;
                v50 = v21;
                -[ASCStaticLockupTheme subtitleFontWeight](self, "subtitleFontWeight");
                v29 = v28;
                objc_msgSend(v7, "subtitleFontWeight");
                if (v29 != v30)
                {
                  v14 = 0;
LABEL_45:
                  v23 = v49;
                  v21 = v50;
                  goto LABEL_46;
                }
                -[ASCStaticLockupTheme headingTextColor](self, "headingTextColor");
                v31 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "headingTextColor");
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = (void *)v32;
                v52 = (void *)v31;
                if (v31 && v32)
                {
                  v34 = (void *)v32;
                  v35 = objc_msgSend(v52, "isEqual:", v32);
                  v33 = v34;
                  if (v35)
                  {
LABEL_29:
                    v47 = v33;
                    -[ASCStaticLockupTheme headingTextStyle](self, "headingTextStyle");
                    v36 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "headingTextStyle");
                    v37 = objc_claimAutoreleasedReturnValue();
                    v38 = (void *)v37;
                    v48 = (void *)v36;
                    if (v36 && v37)
                    {
                      v39 = (void *)v37;
                      v40 = objc_msgSend(v48, "isEqual:", v37);
                      v38 = v39;
                      if (v40)
                      {
LABEL_32:
                        v41 = self;
                        v42 = v38;
                        -[ASCStaticLockupTheme headingFontWeight](v41, "headingFontWeight");
                        v44 = v43;
                        objc_msgSend(v7, "headingFontWeight");
                        v38 = v42;
                        v14 = v44 == v45;
LABEL_43:

                        v33 = v47;
                        goto LABEL_44;
                      }
                    }
                    else if (v36 == v37)
                    {
                      goto LABEL_32;
                    }
                    v14 = 0;
                    goto LABEL_43;
                  }
                }
                else if (v31 == v32)
                {
                  goto LABEL_29;
                }
                v14 = 0;
LABEL_44:

                goto LABEL_45;
              }
              v14 = 0;
LABEL_46:

              goto LABEL_47;
            }
          }
          else if (v18 == (void *)v19)
          {
            goto LABEL_22;
          }
          v14 = 0;
LABEL_47:

          goto LABEL_48;
        }
LABEL_33:
        v14 = 0;
LABEL_48:

        goto LABEL_49;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v14 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v14 = 0;
LABEL_50:

  return v14;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCStaticLockupTheme titleTextColor](self, "titleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("titleTextColor"));

  -[ASCStaticLockupTheme titleTextStyle](self, "titleTextStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titleTextStyle"));

  -[ASCStaticLockupTheme titleFontWeight](self, "titleFontWeight");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("titleFontWeight"));
  -[ASCStaticLockupTheme subtitleTextColor](self, "subtitleTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitleTextColor"));

  -[ASCStaticLockupTheme subtitleTextStyle](self, "subtitleTextStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("subtitleTextStyle"));

  -[ASCStaticLockupTheme subtitleFontWeight](self, "subtitleFontWeight");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("subtitleFontWeight"));
  -[ASCStaticLockupTheme headingTextColor](self, "headingTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("headingTextColor"));

  -[ASCStaticLockupTheme headingTextStyle](self, "headingTextStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("headingTextStyle"));

  -[ASCStaticLockupTheme headingFontWeight](self, "headingFontWeight");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("headingFontWeight"));
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)headingTextColor
{
  return self->_headingTextColor;
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)titleFontSizeProvider
{
  return self->_titleFontSizeProvider;
}

- (void)setTitleFontSizeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)titleFontWeight
{
  return self->_titleFontWeight;
}

- (void)setTitleFontWeight:(double)a3
{
  self->_titleFontWeight = a3;
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)subtitleFontSizeProvider
{
  return self->_subtitleFontSizeProvider;
}

- (void)setSubtitleFontSizeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)subtitleFontWeight
{
  return self->_subtitleFontWeight;
}

- (void)setSubtitleFontWeight:(double)a3
{
  self->_subtitleFontWeight = a3;
}

- (NSString)headingTextStyle
{
  return self->_headingTextStyle;
}

- (void)setHeadingTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)headingFontSizeProvider
{
  return self->_headingFontSizeProvider;
}

- (void)setHeadingFontSizeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (double)headingFontWeight
{
  return self->_headingFontWeight;
}

- (void)setHeadingFontWeight:(double)a3
{
  self->_headingFontWeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headingFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_headingTextStyle, 0);
  objc_storeStrong(&self->_subtitleFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong(&self->_titleFontSizeProvider, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_headingTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
}

@end
