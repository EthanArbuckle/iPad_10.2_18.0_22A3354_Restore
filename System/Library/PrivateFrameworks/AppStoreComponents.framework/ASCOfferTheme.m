@implementation ASCOfferTheme

+ (ASCOfferTheme)grayTheme
{
  if (grayTheme_onceToken != -1)
    dispatch_once(&grayTheme_onceToken, &__block_literal_global_20);
  return (ASCOfferTheme *)(id)grayTheme_theme;
}

void __26__ASCOfferTheme_grayTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:](v0, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v7, v1, v2, v3, v4);
  v6 = (void *)grayTheme_theme;
  grayTheme_theme = v5;

}

+ (ASCOfferTheme)blueTheme
{
  if (blueTheme_onceToken != -1)
    dispatch_once(&blueTheme_onceToken, &__block_literal_global_2);
  return (ASCOfferTheme *)(id)blueTheme_theme;
}

void __26__ASCOfferTheme_blueTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:](v0, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v7, v1, v2, v3, v4);
  v6 = (void *)blueTheme_theme;
  blueTheme_theme = v5;

}

+ (ASCOfferTheme)whiteTheme
{
  if (whiteTheme_onceToken != -1)
    dispatch_once(&whiteTheme_onceToken, &__block_literal_global_3_0);
  return (ASCOfferTheme *)(id)whiteTheme_theme;
}

void __27__ASCOfferTheme_whiteTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.768481433, 0.768305421, 0.788933814, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:](v0, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:", v8, v1, v2, v3, v4, v5);
  v7 = (void *)whiteTheme_theme;
  whiteTheme_theme = v6;

}

+ (ASCOfferTheme)whiteOnGrayTheme
{
  if (whiteOnGrayTheme_onceToken != -1)
    dispatch_once(&whiteOnGrayTheme_onceToken, &__block_literal_global_4_0);
  return (ASCOfferTheme *)(id)whiteOnGrayTheme_theme;
}

void __33__ASCOfferTheme_whiteOnGrayTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v0 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.768481433, 0.768305421, 0.788933814, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCOfferBackgroundStyle defaultStyle](ASCOfferBackgroundStyle, "defaultStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1;
  v7 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:](v0, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v10, v1, v2, v3, v4, v5, 2.0, 0.3, 1.0, 1.0, v9, v6);
  v8 = (void *)whiteOnGrayTheme_theme;
  whiteOnGrayTheme_theme = v7;

}

+ (id)confirmationForTheme:(id)a3
{
  id v3;
  ASCOfferTheme *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASCOfferTheme *v10;

  v3 = a3;
  v4 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "subtitleTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "progressColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:](v4, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v5, v6, v7, v8, v9);

  return v10;
}

+ (ASCOfferTheme)adTheme
{
  if (adTheme_onceToken != -1)
    dispatch_once(&adTheme_onceToken, &__block_literal_global_6);
  return (ASCOfferTheme *)(id)adTheme_adTheme;
}

void __24__ASCOfferTheme_adTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = [ASCOfferTheme alloc];
  v1 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "asc_colorWithLightColor:darkColor:", v2, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.149, 0.529, 0.984, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.039, 0.517, 0.996, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "asc_colorWithLightColor:darkColor:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:](v0, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v12, v6, v7, v8, v9);
  v11 = (void *)adTheme_adTheme;
  adTheme_adTheme = v10;

}

+ (ASCOfferTheme)essoTheme
{
  if (essoTheme_onceToken != -1)
    dispatch_once(&essoTheme_onceToken, &__block_literal_global_7);
  return (ASCOfferTheme *)(id)essoTheme_theme;
}

void __26__ASCOfferTheme_essoTheme__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[ASCOfferTheme blueTheme](ASCOfferTheme, "blueTheme");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offerThemeWithProgressLineWidth:", 3.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "offerThemeWithStopIndicatorRatio:", 0.35);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCOfferBackgroundStyle fixedCornerRadiusStyle:](ASCOfferBackgroundStyle, "fixedCornerRadiusStyle:", 14.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "offerThemeWithBackgroundStyle:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)essoTheme_theme;
  essoTheme_theme = v3;

}

+ (ASCOfferTheme)viewInAppStoreTheme
{
  if (viewInAppStoreTheme_onceToken != -1)
    dispatch_once(&viewInAppStoreTheme_onceToken, &__block_literal_global_8);
  return (ASCOfferTheme *)(id)viewInAppStoreTheme_theme;
}

void __36__ASCOfferTheme_viewInAppStoreTheme__block_invoke()
{
  ASCOfferTheme *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = [ASCOfferTheme alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:](v0, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v7, v1, v2, v3, v4);
  v6 = (void *)viewInAppStoreTheme_theme;
  viewInAppStoreTheme_theme = v5;

}

+ (ASCOfferTheme)primaryTheme
{
  return +[ASCOfferTheme grayTheme](ASCOfferTheme, "grayTheme");
}

+ (ASCOfferTheme)secondaryTheme
{
  return +[ASCOfferTheme whiteTheme](ASCOfferTheme, "whiteTheme");
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 subtitleTextColor:(id)a5 iconTintColor:(id)a6 progressColor:(id)a7
{
  return -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:](self, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:", a3, a4, a4, a5, a6, a7);
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  ASCOfferTheme *v21;
  uint64_t v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[ASCOfferBackgroundStyle defaultStyle](ASCOfferBackgroundStyle, "defaultStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 0;
  v21 = -[ASCOfferTheme initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:](self, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v19, v18, v17, v16, v15, v14, 2.0, 0.3, 1.0, 1.0, v23, v20);

  return v21;
}

- (ASCOfferTheme)initWithTitleBackgroundColor:(id)a3 titleTextColor:(id)a4 titleTextDisabledColor:(id)a5 subtitleTextColor:(id)a6 iconTintColor:(id)a7 progressColor:(id)a8 progressLineWidth:(double)a9 progressLineCap:(int)a10 stopIndicatorRatio:(double)a11 stopIndicatorCornerSize:(CGSize)a12 backgroundStyle:(id)a13
{
  CGFloat height;
  CGFloat width;
  id v24;
  id v25;
  ASCOfferTheme *v26;
  ASCOfferTheme *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  height = a12.height;
  width = a12.width;
  v24 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v25 = a13;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v34.receiver = self;
  v34.super_class = (Class)ASCOfferTheme;
  v26 = -[ASCOfferTheme init](&v34, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_titleBackgroundColor, a3);
    objc_storeStrong((id *)&v27->_titleTextColor, a4);
    objc_storeStrong((id *)&v27->_titleTextDisabledColor, a5);
    objc_storeStrong((id *)&v27->_subtitleTextColor, a6);
    objc_storeStrong((id *)&v27->_iconTintColor, a7);
    objc_storeStrong((id *)&v27->_progressColor, a8);
    v27->_progressLineWidth = a9;
    v27->_stopIndicatorRatio = a11;
    v27->_progressLineCap = a10;
    v27->_stopIndicatorCornerSize.width = width;
    v27->_stopIndicatorCornerSize.height = height;
    objc_storeStrong((id *)&v27->_backgroundStyle, a13);
  }

  return v27;
}

- (id)clone
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v3 = objc_alloc((Class)objc_opt_class());
  -[ASCOfferTheme titleBackgroundColor](self, "titleBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme titleTextColor](self, "titleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme titleTextDisabledColor](self, "titleTextDisabledColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme subtitleTextColor](self, "subtitleTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme iconTintColor](self, "iconTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme progressColor](self, "progressColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferTheme progressLineWidth](self, "progressLineWidth");
  v11 = v10;
  v12 = -[ASCOfferTheme progressLineCap](self, "progressLineCap");
  -[ASCOfferTheme stopIndicatorRatio](self, "stopIndicatorRatio");
  v14 = v13;
  -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
  v16 = v15;
  v18 = v17;
  -[ASCOfferTheme backgroundStyle](self, "backgroundStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v12;
  v20 = (void *)objc_msgSend(v3, "initWithTitleBackgroundColor:titleTextColor:titleTextDisabledColor:subtitleTextColor:iconTintColor:progressColor:progressLineWidth:progressLineCap:stopIndicatorRatio:stopIndicatorCornerSize:backgroundStyle:", v4, v5, v6, v7, v8, v9, v11, v14, v16, v18, v22, v19);

  return v20;
}

- (ASCOfferTheme)offerThemeWithProgressLineWidth:(double)a3
{
  double v5;
  ASCOfferTheme *v6;

  -[ASCOfferTheme progressLineWidth](self, "progressLineWidth");
  if (v5 == a3)
  {
    v6 = self;
  }
  else
  {
    -[ASCOfferTheme clone](self, "clone");
    v6 = (ASCOfferTheme *)objc_claimAutoreleasedReturnValue();
    v6->_progressLineWidth = a3;
  }
  return v6;
}

- (ASCOfferTheme)offerThemeWithProgressLineCap:(int)a3
{
  ASCOfferTheme *v5;

  if (-[ASCOfferTheme progressLineCap](self, "progressLineCap") == a3)
  {
    v5 = self;
  }
  else
  {
    -[ASCOfferTheme clone](self, "clone");
    v5 = (ASCOfferTheme *)objc_claimAutoreleasedReturnValue();
    v5->_progressLineCap = a3;
  }
  return v5;
}

- (ASCOfferTheme)offerThemeWithStopIndicatorRatio:(double)a3
{
  double v5;
  ASCOfferTheme *v6;

  -[ASCOfferTheme stopIndicatorRatio](self, "stopIndicatorRatio");
  if (v5 == a3)
  {
    v6 = self;
  }
  else
  {
    -[ASCOfferTheme clone](self, "clone");
    v6 = (ASCOfferTheme *)objc_claimAutoreleasedReturnValue();
    v6->_stopIndicatorRatio = a3;
  }
  return v6;
}

- (ASCOfferTheme)offerThemeWithBackgroundStyle:(id)a3
{
  id v5;
  void *v6;
  id v7;
  int v8;
  ASCOfferTheme *v9;

  v5 = a3;
  -[ASCOfferTheme backgroundStyle](self, "backgroundStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5 || !v6)
  {

    if (v7 == v5)
      goto LABEL_4;
LABEL_6:
    -[ASCOfferTheme clone](self, "clone");
    v9 = (ASCOfferTheme *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_backgroundStyle, a3);
    goto LABEL_7;
  }
  v8 = objc_msgSend(v6, "isEqual:", v5);

  if (!v8)
    goto LABEL_6;
LABEL_4:
  v9 = self;
LABEL_7:

  return v9;
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
  double v10;
  void *v11;
  unint64_t v12;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCOfferTheme titleBackgroundColor](self, "titleBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCOfferTheme titleTextColor](self, "titleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCOfferTheme titleTextDisabledColor](self, "titleTextDisabledColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCOfferTheme subtitleTextColor](self, "subtitleTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCOfferTheme iconTintColor](self, "iconTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCOfferTheme progressColor](self, "progressColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCOfferTheme progressLineWidth](self, "progressLineWidth");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCOfferTheme progressLineCap](self, "progressLineCap"));
  -[ASCOfferTheme stopIndicatorRatio](self, "stopIndicatorRatio");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v10);
  -[ASCOfferTheme backgroundStyle](self, "backgroundStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  v12 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v12;
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  char v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

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
    -[ASCOfferTheme titleBackgroundColor](self, "titleBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCOfferTheme titleTextColor](self, "titleTextColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titleTextColor");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCOfferTheme titleTextDisabledColor](self, "titleTextDisabledColor");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "titleTextDisabledColor");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (objc_msgSend(v14, "isEqual:", v15))
              {
LABEL_16:
                -[ASCOfferTheme subtitleTextColor](self, "subtitleTextColor");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "subtitleTextColor");
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = (void *)v18;
                v59 = v17;
                if (v17 && v18)
                {
                  v57 = v14;
                  v20 = v16;
                  v21 = (void *)v18;
                  v22 = objc_msgSend(v17, "isEqual:", v18);
                  v19 = v21;
                  v16 = v20;
                  v14 = v57;
                  if (v22)
                  {
LABEL_19:
                    v55 = v19;
                    v56 = v16;
                    -[ASCOfferTheme iconTintColor](self, "iconTintColor");
                    v23 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "iconTintColor");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v25 = (void *)v24;
                    v58 = (void *)v23;
                    if (v23 && v24)
                    {
                      v26 = (void *)v24;
                      v27 = objc_msgSend(v58, "isEqual:", v24);
                      v25 = v26;
                      if (v27)
                      {
LABEL_22:
                        v53 = v25;
                        -[ASCOfferTheme progressColor](self, "progressColor");
                        v28 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v7, "progressColor");
                        v29 = objc_claimAutoreleasedReturnValue();
                        v30 = (void *)v29;
                        v54 = (void *)v28;
                        if (v28 && v29)
                        {
                          v31 = (void *)v29;
                          v32 = objc_msgSend(v54, "isEqual:", v29);
                          v30 = v31;
                          if (v32)
                          {
LABEL_25:
                            v33 = v30;
                            -[ASCOfferTheme progressLineWidth](self, "progressLineWidth");
                            v35 = v34;
                            objc_msgSend(v7, "progressLineWidth");
                            if (v35 == v36
                              && (v37 = -[ASCOfferTheme progressLineCap](self, "progressLineCap"),
                                  v37 == objc_msgSend(v7, "progressLineCap"))
                              && (-[ASCOfferTheme stopIndicatorRatio](self, "stopIndicatorRatio"),
                                  v39 = v38,
                                  objc_msgSend(v7, "stopIndicatorRatio"),
                                  v39 == v40))
                            {
                              -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
                              v42 = v41;
                              v44 = v43;
                              objc_msgSend(v7, "stopIndicatorCornerSize");
                              v46 = 0;
                              if (v42 == v47)
                              {
                                v30 = v33;
                                if (v44 == v45)
                                {
                                  -[ASCOfferTheme backgroundStyle](self, "backgroundStyle");
                                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v7, "backgroundStyle");
                                  v49 = objc_claimAutoreleasedReturnValue();
                                  v50 = (void *)v49;
                                  v52 = v48;
                                  if (v48 && v49)
                                    v46 = objc_msgSend(v48, "isEqual:", v49);
                                  else
                                    v46 = v48 == (void *)v49;

                                  goto LABEL_47;
                                }
LABEL_48:

                                v25 = v53;
                                goto LABEL_49;
                              }
                            }
                            else
                            {
                              v46 = 0;
                            }
LABEL_47:
                            v30 = v33;
                            goto LABEL_48;
                          }
                        }
                        else if (v28 == v29)
                        {
                          goto LABEL_25;
                        }
                        v46 = 0;
                        goto LABEL_48;
                      }
                    }
                    else if (v23 == v24)
                    {
                      goto LABEL_22;
                    }
                    v46 = 0;
LABEL_49:

                    v19 = v55;
                    v16 = v56;
                    goto LABEL_50;
                  }
                }
                else if (v17 == (void *)v18)
                {
                  goto LABEL_19;
                }
                v46 = 0;
LABEL_50:

                goto LABEL_51;
              }
            }
            else if (v14 == (void *)v15)
            {
              goto LABEL_16;
            }
            v46 = 0;
LABEL_51:

            goto LABEL_52;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v46 = 0;
LABEL_52:

        goto LABEL_53;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v46 = 0;
LABEL_53:

    goto LABEL_54;
  }
  v46 = 0;
LABEL_54:

  return v46;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCOfferTheme titleBackgroundColor](self, "titleBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("titleBackgroundColor"));

  -[ASCOfferTheme titleTextColor](self, "titleTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titleTextColor"));

  -[ASCOfferTheme titleTextDisabledColor](self, "titleTextDisabledColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("titleTextDisabledColor"));

  -[ASCOfferTheme subtitleTextColor](self, "subtitleTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("subtitleTextColor"));

  -[ASCOfferTheme iconTintColor](self, "iconTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("iconTintColor"));

  -[ASCOfferTheme progressColor](self, "progressColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("progressColor"));

  -[ASCOfferTheme progressLineWidth](self, "progressLineWidth");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("progressLineWidth"));
  -[ASCDescriber addInteger:withName:](v3, "addInteger:withName:", -[ASCOfferTheme progressLineCap](self, "progressLineCap"), CFSTR("progressLineCap"));
  -[ASCOfferTheme stopIndicatorRatio](self, "stopIndicatorRatio");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("stopIndicatorRatio"));
  -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("stopIndicatorCornerSize.width"));
  -[ASCOfferTheme stopIndicatorCornerSize](self, "stopIndicatorCornerSize");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("stopIndicatorCornerSize.height"), v10);
  -[ASCOfferTheme backgroundStyle](self, "backgroundStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("backgroundStyle"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIColor)titleBackgroundColor
{
  return self->_titleBackgroundColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)titleTextDisabledColor
{
  return self->_titleTextDisabledColor;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (int)progressLineCap
{
  return self->_progressLineCap;
}

- (double)stopIndicatorRatio
{
  return self->_stopIndicatorRatio;
}

- (CGSize)stopIndicatorCornerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_stopIndicatorCornerSize.width;
  height = self->_stopIndicatorCornerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (ASCOfferBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundStyle, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextDisabledColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleBackgroundColor, 0);
}

@end
