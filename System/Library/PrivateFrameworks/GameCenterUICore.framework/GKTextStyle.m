@implementation GKTextStyle

+ (id)textStyle
{
  if (textStyle_onceToken != -1)
    dispatch_once(&textStyle_onceToken, &__block_literal_global_10);
  return (id)textStyle_sBaseTextStyle;
}

void __24__GKTextStyle_textStyle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1
    || ((objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"),
         v2 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v2, "bounds"),
         v4 = v3,
         v6 = v5,
         v2,
         v6 <= v4)
      ? (v7 = v4)
      : (v7 = v6),
        v7 <= 480.0))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 != 1)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");

    }
  }
  v11 = objc_alloc_init((Class)objc_opt_class());
  v12 = (void *)textStyle_sBaseTextStyle;
  textStyle_sBaseTextStyle = (uint64_t)v11;

}

+ (id)attributedString:(id)a3 byReplayingFromBaseStyle:(id)a4 systemContentSizeDidChange:(BOOL)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD1688];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithAttributedString:", v9);
  v11 = objc_msgSend(v9, "length");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__GKTextStyle_attributedString_byReplayingFromBaseStyle_systemContentSizeDidChange___block_invoke;
  v17[3] = &unk_24DC27BF8;
  v18 = v7;
  v20 = a5;
  v12 = v10;
  v19 = v12;
  v13 = v7;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v17);

  v14 = v19;
  v15 = v12;

  return v15;
}

void __84__GKTextStyle_attributedString_byReplayingFromBaseStyle_systemContentSizeDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GKRecorderAttribute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "replayOnBaseStyle:systemContentSizeDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "resolveFontAndLineSpacing:", &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10 != v9
      || *(_BYTE *)(a1 + 48)
      || (objc_msgSend(v12, "pointSize"), v15 = v14, objc_msgSend(v11, "pointSize"), v15 != v16))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v18);

      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v17, a3, a4);
    }

  }
}

+ (double)standardFontSize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "+[GKTextStyle standardFontSize]", objc_msgSend(v5, "UTF8String"), 165);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return -1.0;
}

- (GKTextStyle)init
{
  GKTextStyle *v2;
  GKColorPalette *v3;
  NSString *fontName;
  double v5;
  uint64_t v6;
  UIColor *color;
  GKColorPalette *palette;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTextStyle;
  v2 = -[GKTextStyle init](&v10, sel_init);
  if (v2)
  {
    +[GKColorPalette sharedPalette](GKColorPalette, "sharedPalette");
    v3 = (GKColorPalette *)objc_claimAutoreleasedReturnValue();
    fontName = v2->_fontName;
    v2->_fontName = (NSString *)CFSTR("GKMagicSystemFont");

    objc_msgSend((id)objc_opt_class(), "standardFontSize");
    v2->_fontSize = v5;
    v2->_fontSizeRebaseSelector = sel_baseFontRebaseSelector;
    v2->_fontNameRebaseSelector = sel_baseFontRebaseSelector;
    -[GKColorPalette standardTextColor](v3, "standardTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    color = v2->_color;
    v2->_color = (UIColor *)v6;

    palette = v2->_palette;
    v2->_palette = v3;

    *(int64x2_t *)&v2->_textAlignment = vdupq_n_s64(4uLL);
    v2->_needsParagraphStyle = 0;
  }
  return v2;
}

- (id)initEmpty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTextStyle;
  return -[GKTextStyle init](&v3, sel_init);
}

- (id)replayOnBaseStyle:(id)a3 systemContentSizeDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  GKTextStyle *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  GKTextStyle *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a4;
  v6 = a3;
  v7 = self;
  if (!objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()) || v4)
  {
    v8 = -[GKTextStyle fontSizeRebaseSelector](v7, "fontSizeRebaseSelector");
    v9 = -[GKTextStyle fontNameRebaseSelector](v7, "fontNameRebaseSelector");
    if (v8 | v9)
    {
      v10 = v9;
      v11 = -[GKTextStyle copyWithBaseClass:](v7, "copyWithBaseClass:", objc_opt_class());
      v12 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke;
      v26[3] = &unk_24DC27C20;
      v13 = v11;
      v27 = v13;
      v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x220737704](v26);
      v21 = v12;
      v22 = 3221225472;
      v23 = __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke_2;
      v24 = &unk_24DC27C20;
      v15 = v13;
      v25 = v15;
      v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x220737704](&v21);
      if (v8 == v10)
      {
        objc_msgSend(v15, "_gkInvokeSelector:", v8, v21, v22, v23, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v16)[2](v16, v18);
      }
      else
      {
        if (v10)
        {
          objc_msgSend(v15, "_gkInvokeSelector:", v10, v21, v22, v23, v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v16)[2](v16, v17);

        }
        if (!v8)
          goto LABEL_11;
        objc_msgSend(v15, "_gkInvokeSelector:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(_QWORD, void *))v14)[2](v14, v18);

LABEL_11:
      objc_msgSend(v15, "applyScaleForMesh", v21, v22, v23, v24);
      v19 = (GKTextStyle *)v15;

      v7 = v19;
    }
  }

  return v7;
}

double __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 72);
  *(double *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

void __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;

  v9 = a2;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = (void *)v9[7];
  v5 = v4;
  if (v3 != v5)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v4);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v7 = (void *)v9[8];
  v8 = v7;
  if (v6 != v8)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v7);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v9[1];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = *((_BYTE *)v9 + 17);

}

- (id)copy
{
  return -[GKTextStyle copyWithBaseClass:](self, "copyWithBaseClass:", objc_opt_class());
}

- (id)copyWithBaseClass:(Class)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend([a3 alloc], "initEmpty");
  if (v4)
  {
    v5 = -[NSString copy](self->_fontName, "copy");
    v6 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v5;

    v7 = -[NSString copy](self->_UIKitFontTextStyleName, "copy");
    v8 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v7;

    *(double *)(v4 + 8) = self->_UIKitFontLeading;
    *(_BYTE *)(v4 + 17) = self->_overrideUIKitFontSize;
    *(double *)(v4 + 72) = self->_fontSize;
    *(_QWORD *)(v4 + 104) = self->_fontSizeRebaseSelector;
    objc_storeStrong((id *)(v4 + 24), self->_color);
    objc_storeStrong((id *)(v4 + 48), self->_palette);
    *(double *)(v4 + 88) = self->_m34;
    *(double *)(v4 + 96) = self->_zPosition;
    *(_QWORD *)(v4 + 32) = self->_textAlignment;
    *(_QWORD *)(v4 + 40) = self->_lineBreakMode;
    *(_BYTE *)(v4 + 16) = self->_needsParagraphStyle;
    *(double *)(v4 + 80) = self->_minimumLineHeight;
  }
  return (id)v4;
}

- (id)description
{
  void *v3;
  double fontSize;
  const char *fontSizeRebaseSelector;
  void *v6;
  double zPosition;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  fontSize = self->_fontSize;
  fontSizeRebaseSelector = self->_fontSizeRebaseSelector;
  if (fontSizeRebaseSelector)
  {
    NSStringFromSelector(fontSizeRebaseSelector);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("> %.1fpt sel:%@ font:%@"), *(_QWORD *)&fontSize, v6, self->_fontName);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("> %.1fpt sel:%@ font:%@"), *(_QWORD *)&fontSize, CFSTR("<n/a>"), self->_fontName);
  }
  zPosition = self->_zPosition;
  if (zPosition != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" z:%.2f m34:%g 1/m34:%.0f"), *(_QWORD *)&zPosition, *(_QWORD *)&self->_m34, 1.0 / self->_m34);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  GKTextStyle *v5;
  GKTextStyle *v6;
  void *v7;
  UIColor *v8;
  UIColor *color;
  BOOL v10;
  BOOL v11;
  double v12;

  v5 = (GKTextStyle *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[GKTextStyle fontName](v6, "fontName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", self->_fontName))
      {
        v11 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[GKTextStyle color](v6, "color");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
      color = self->_color;
      if (v8 == color
        || (-[GKTextStyle color](v6, "color"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", self->_color)))
      {
        if (-[GKTextStyle fontSizeRebaseSelector](v6, "fontSizeRebaseSelector") == self->_fontSizeRebaseSelector
          && -[GKTextStyle textAlignment](v6, "textAlignment") == self->_textAlignment
          && -[GKTextStyle lineBreakMode](v6, "lineBreakMode") == self->_lineBreakMode)
        {
          -[GKTextStyle minimumLineHeight](v6, "minimumLineHeight");
          v10 = v12 == self->_minimumLineHeight;
          v11 = v10;
        }
        else
        {
          v10 = 0;
          v11 = 0;
        }
        if (v8 == color)
          goto LABEL_17;
      }
      else
      {
        v10 = 0;
      }

      v11 = v10;
LABEL_17:

      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)self->_fontSize | (unint64_t)self->_fontName;
}

+ (double)standardLeadingForFontTextStyle:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leading");
  v5 = GKRoundToScreenScale(v4);

  return v5;
}

+ (double)scaledValueFromHISpecLeading:(double)a3 forFontTextStyle:(id)a4
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", a3);
  v7 = GKRoundToScreenScale(v6);

  return v7;
}

- (id)resolveFontAndLineSpacing:(double *)a3
{
  __CFString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  double fontSize;

  v5 = self->_fontName;
  if (a3)
    *a3 = 0.0;
  v6 = self->_UIKitFontTextStyleName;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_overrideUIKitFontSize)
    {
      objc_msgSend(v7, "fontWithSize:", self->_fontSize);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (a3 && self->_UIKitFontLeading != 0.0)
    {
      objc_msgSend(v8, "_scaledValueForValue:");
      *a3 = GKRoundToScreenScale(v10);
    }
  }
  else
  {
    if (v5 == CFSTR("GKMagicSystemFont"))
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", self->_fontSize);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("GKMagicBoldSystemFont") || v5 == CFSTR("GKMagicMediumSystemFontName"))
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", self->_fontSize);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("GKMagicLightSystemFont"))
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "_lightSystemFontOfSize:", self->_fontSize);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      fontSize = self->_fontSize;
      if (v5 == CFSTR("GKMagicThinSystemFont"))
        objc_msgSend(MEMORY[0x24BDF6A70], "_thinSystemFontOfSize:", fontSize);
      else
        objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v5, fontSize);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v12;
  }

  return v8;
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (self->_lineBreakMode != a3)
  {
    self->_lineBreakMode = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setMinimumLineHeight:(double)a3
{
  if (self->_minimumLineHeight != a3)
  {
    self->_minimumLineHeight = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setFontSize:(double)a3 rebaseSelector:(SEL)a4
{
  self->_fontSize = a3;
  self->_fontSizeRebaseSelector = a4;
}

- (void)setFontName:(id)a3 rebaseSelector:(SEL)a4
{
  -[GKTextStyle setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:](self, "setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:", a3, self->_UIKitFontTextStyleName, 0, a4, 0.0);
}

- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 shouldOverrideSize:(BOOL)a5 rebaseSelector:(SEL)a6
{
  -[GKTextStyle setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:](self, "setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:", a3, a4, a5, a6, 0.0);
}

- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 leadingOverrideFromHISpec:(double)a5 shouldOverrideSize:(BOOL)a6 rebaseSelector:(SEL)a7
{
  NSString *v13;
  NSString *v14;

  v14 = (NSString *)a3;
  v13 = (NSString *)a4;
  if (self->_fontName != v14)
    objc_storeStrong((id *)&self->_fontName, a3);
  if (self->_UIKitFontTextStyleName != v13)
    objc_storeStrong((id *)&self->_UIKitFontTextStyleName, a4);
  self->_UIKitFontLeading = a5;
  self->_overrideUIKitFontSize = a6;
  self->_fontNameRebaseSelector = a7;

}

- (id)attributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIColor *v10;
  void *v11;
  id v12;
  double v13;
  uint64_t v14;
  UIColor *color;
  uint64_t v16;
  double v18;
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v18 = 0.0;
  -[GKTextStyle resolveFontAndLineSpacing:](self, "resolveFontAndLineSpacing:", &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown font:%@"), self->_fontName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (font != nil)\n[%s (%s:%d)]"), v5, "-[GKTextStyle attributes]", objc_msgSend(v7, "UTF8String"), 489);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }
  if (self->_needsParagraphStyle || v18 != 0.0)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v12, "setAlignment:", self->_textAlignment);
    objc_msgSend(v12, "setLineBreakMode:", self->_lineBreakMode);
    LODWORD(v13) = *(_DWORD *)"333?";
    objc_msgSend(v12, "setHyphenationFactor:", v13);
    if (self->_UIKitFontLeading <= 0.0)
    {
      if (self->_minimumLineHeight > 0.0)
        objc_msgSend(v12, "setMinimumLineHeight:");
    }
    else
    {
      objc_msgSend(v12, "setMinimumLineHeight:", v18);
      objc_msgSend(v12, "setMaximumLineHeight:", v18);
    }
    v14 = *MEMORY[0x24BDF6600];
    v19[0] = *MEMORY[0x24BDF65F8];
    v19[1] = v14;
    color = self->_color;
    v20[0] = v3;
    v20[1] = color;
    v16 = *MEMORY[0x24BDF6628];
    v19[2] = CFSTR("GKRecorderAttribute");
    v19[3] = v16;
    v20[2] = self;
    v20[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = *MEMORY[0x24BDF6600];
    v21[0] = *MEMORY[0x24BDF65F8];
    v21[1] = v9;
    v10 = self->_color;
    v22[0] = v3;
    v22[1] = v10;
    v21[2] = CFSTR("GKRecorderAttribute");
    v22[2] = self;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)applyToLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;

  v7 = 0.0;
  v4 = a3;
  -[GKTextStyle resolveFontAndLineSpacing:](self, "resolveFontAndLineSpacing:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);
  -[GKTextStyle color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v4, "setLineBreakMode:", -[GKTextStyle lineBreakMode](self, "lineBreakMode"));
  objc_msgSend(v4, "setTextAlignment:", -[GKTextStyle textAlignment](self, "textAlignment"));
  objc_msgSend(v4, "setLineSpacing:", (uint64_t)v7);

}

- (void)applyToEditField:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[GKTextStyle resolveFontAndLineSpacing:](self, "resolveFontAndLineSpacing:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

  -[GKTextStyle color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  objc_msgSend(v6, "setTextAlignment:", -[GKTextStyle textAlignment](self, "textAlignment"));
}

- (id)baseFontRebaseSelector
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend((id)objc_opt_class(), "standardFontSize");
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2);
  return v3;
}

- (id)header0
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 32.0);
  return v4;
}

- (id)header1
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle header1]", objc_msgSend(v5, "UTF8String"), 572);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)header2
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle header2]", objc_msgSend(v5, "UTF8String"), 578);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)header3
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  return v4;
}

- (id)header4
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 14.0);
  return v4;
}

- (id)headline
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), *MEMORY[0x24BDF77E8], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  return v4;
}

- (id)body
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77B0], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 17.0);
  return v4;
}

- (id)footnote
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77D0], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 15.0);
  return v3;
}

- (id)callout
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77B8], 0, a2);
  return v3;
}

- (id)caption1
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77C0], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 13.0);
  return v4;
}

- (id)caption2
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77C8], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 11.0);
  return v4;
}

- (id)bannerTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextOnDarkBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setLineBreakMode:", 4);
  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 17.0);
  return v4;
}

- (id)bannerShortTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextOnDarkBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setLineBreakMode:", 4);
  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 15.0);
  return v4;
}

- (id)bannerMessage
{
  void *v3;
  void *v4;
  void *v5;

  -[GKTextStyle header4](self, "header4");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emphasizedTextOnDarkBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  return v3;
}

- (id)caption
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setTextAlignment:", 4);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "friendRequestCaptionTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 12.0);
  return v4;
}

- (id)roundButtonTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInteractionColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 11.0);
  return v4;
}

- (id)buyButtonTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInteractionColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF7810], 0, a2, 0.0);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 14.0);
  return v4;
}

- (id)selectedBuyButtonTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textOnDarkBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:kitTextStyleName:leadingOverrideFromHISpec:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF7810], 0, a2, 0.0);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 14.0);
  return v4;
}

- (id)small
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 9.0);
  return v4;
}

- (id)info
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)smallInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle smallInfo]", objc_msgSend(v5, "UTF8String"), 807);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)viewBackground
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)emphasized
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emphasizedTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)emphasizedOnDarkBackground
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emphasizedTextOnDarkBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (void)applyScaleForMesh
{
  double zPosition;
  double m34;
  double v4;
  BOOL v5;
  double v6;

  zPosition = self->_zPosition;
  if (zPosition != 0.0)
  {
    m34 = self->_m34;
    v4 = 1.0 / m34;
    v5 = m34 == 0.0;
    v6 = -400.0;
    if (!v5)
      v6 = v4;
    -[GKTextStyle setFontSize:rebaseSelector:](self, "setFontSize:rebaseSelector:", self->_fontSizeRebaseSelector, fabs(self->_fontSize * (zPosition + v6) / v6));
  }
}

- (id)scaledForM34:(double)a3 zPosition:(double)a4
{
  id v6;

  v6 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v6, "setM34:", a3);
  objc_msgSend(v6, "setZPosition:", a4);
  objc_msgSend(v6, "applyScaleForMesh");
  return v6;
}

- (id)scaled:(double)a3
{
  id v5;

  v5 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v5, "setFontSize:rebaseSelector:", self->_fontSizeRebaseSelector, self->_fontSize * a3);
  return v5;
}

- (id)localPlayerColor
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localPlayerTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)friendColor
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)friendCaptionColor
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendRequestCaptionTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)bold
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  return v3;
}

- (id)strong
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  return v3;
}

- (id)thin
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
  return v3;
}

- (id)regular
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  return v3;
}

- (id)light
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  return v3;
}

- (id)medium
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicMediumSystemFontName"), a2);
  return v3;
}

- (id)centered
{
  id v2;

  v2 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (id)composeFields
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF7810], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 14.0);
  return v3;
}

- (id)composeMessage
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77B0], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 17.0);
  return v3;
}

- (id)headerViewSubText1
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77D0], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 15.0);
  return v3;
}

- (id)multiplayerNameText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), *MEMORY[0x24BDF7810], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 15.0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)multiplayerAddText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF7810], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 15.0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInteractionColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)multiplayerStatusText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77D0], 1, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 11.0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)multiplayerHeaderText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77D0], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 17.0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)multiplayerFooterText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77D0], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 17.0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)thinNumberText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle thinNumberText]", objc_msgSend(v5, "UTF8String"), 1058);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)gameDetailNameText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle gameDetailNameText]", objc_msgSend(v5, "UTF8String"), 1064);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)detailSecondaryHeaderText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle detailSecondaryHeaderText]", objc_msgSend(v5, "UTF8String"), 1070);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)leaderboardRankSmall
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 14.0);
  return v3;
}

- (id)leaderboardRankMedium
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 22.0);
  return v3;
}

- (id)leaderboardRankLarge
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 34.0);
  return v3;
}

- (id)achievementLeaderboardRank
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)achievementLeaderboardPointsText
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), *MEMORY[0x24BDF77C8], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 10.0);
  return v3;
}

- (id)achievementValueText
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77B0], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 19.0);
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  return v4;
}

- (id)sectionHeader
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF7810], 0, a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 15.0);
  return v4;
}

- (id)sectionCaption
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77C8], 0, a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 11.0);
  return v3;
}

- (id)sectionCaptionSmall
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle sectionCaptionSmall]", objc_msgSend(v5, "UTF8String"), 1163);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)cellActionItem
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ needs to implement me!"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "-[GKTextStyle cellActionItem]", objc_msgSend(v5, "UTF8String"), 1169);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (id)challengeText
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", CFSTR("GKMagicSystemFont"), *MEMORY[0x24BDF77B0], 1, a2);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != 1 || ((v6 = 25.0, *MEMORY[0x24BE3A2C0]) ? (v7 = _GKIsRemoteUIUsingPadIdiom == 0) : (v7 = 0), v7))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v6 = 16.2;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;

      v15 = v12 < 414.0 || v14 < 736.0;
      if (!v15 || (v14 >= 414.0 ? (v16 = v12 < 736.0) : (v16 = 1), !v16))
        v6 = 25.0;
    }
  }
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, v6);
  return v3;
}

- (id)challengeTitleText
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1 && (!*MEMORY[0x24BE3A2C0] || _GKIsRemoteUIUsingPadIdiom != 0))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = 30.0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    v15 = v12 < 414.0 || v14 < 736.0;
    if (!v15 || (v14 >= 414.0 ? (v16 = v12 < 736.0) : (v16 = 1), !v16))
LABEL_17:
      v9 = 45.0;
  }
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, v9);
  return v3;
}

- (id)buttonTitle
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemInteractionColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  return v3;
}

- (id)tableCellTitle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[GKTextStyle fontName](self, "fontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", v7, *MEMORY[0x24BDF77B0], 0, a2);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  return v4;
}

- (id)tableCellSubtitle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[GKTextStyle fontName](self, "fontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontName:kitTextStyleName:shouldOverrideSize:rebaseSelector:", v7, *MEMORY[0x24BDF77C8], 0, a2);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 12.0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  return v4;
}

- (id)tableFooterStyle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  return v4;
}

- (id)tabIconCaption
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 12.0);
  return v4;
}

- (id)removeButtonTitle
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 2);
  return v3;
}

- (id)alignment:(int64_t)a3 lineBreakMode:(int64_t)a4
{
  id v6;

  v6 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v6, "setTextAlignment:", a3);
  objc_msgSend(v6, "setLineBreakMode:", a4);
  return v6;
}

- (id)lineBreakMode:(int64_t)a3
{
  id v4;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setLineBreakMode:", a3);
  return v4;
}

- (id)lineHeight:(double)a3
{
  id v4;

  v4 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v4, "setMinimumLineHeight:", a3);
  return v4;
}

- (id)remoteUISectionHeader:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emphasizedTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 14.0);
  return v5;
}

- (id)remoteUISectionFooter:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  const __CFString *v11;
  const __CFString *v12;
  double v13;
  double v14;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  objc_msgSend(v6, "setTextAlignment:", 4);
  v9 = 20.0;
  v10 = 17.0;
  v11 = CFSTR("GKMagicLightSystemFont");
  if (a3 == 2)
  {
    v11 = CFSTR("GKMagicSystemFont");
    v10 = 21.0;
    v9 = 30.0;
  }
  if (a3)
    v12 = v11;
  else
    v12 = CFSTR("GKMagicSystemFont");
  if (a3)
    v13 = v10;
  else
    v13 = 14.0;
  if (a3)
    v14 = v9;
  else
    v14 = 21.0;
  objc_msgSend(v6, "setFontName:rebaseSelector:", v12, a2, 21.0, 14.0, v9, v10, 30.0);
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v13);
  objc_msgSend(v6, "setMinimumLineHeight:", v14);
  return v6;
}

- (id)remoteUILabel:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  v9 = 18.0;
  if (a3 == 2)
    v9 = 23.0;
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v9);
  return v6;
}

- (id)remoteUIDetailLabel:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "standardTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 12.0);
  return v5;
}

- (id)remoteUITableHeaderLabel:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  if (a3 == 2)
  {
    objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
    objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, 60.0);
    objc_msgSend(v6, "setMinimumLineHeight:", 71.0);
  }
  else
  {
    objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
    if (a3)
      v9 = 35.0;
    else
      v9 = 31.0;
    objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v9);
  }
  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  return v6;
}

- (id)remoteUITableHeaderSubLabel:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  double v10;
  double v11;
  const __CFString *v12;
  double v13;
  double v14;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  v9 = CFSTR("GKMagicLightSystemFont");
  v10 = 17.0;
  v11 = 16.0;
  if (a3 == 2)
  {
    v9 = CFSTR("GKMagicSystemFont");
    v10 = 21.0;
  }
  else
  {
    v11 = 11.0;
  }
  if (a3)
    v12 = v9;
  else
    v12 = CFSTR("GKMagicSystemFont");
  if (a3)
    v13 = v10;
  else
    v13 = 14.0;
  if (a3)
    v14 = v11;
  else
    v14 = 11.0;
  objc_msgSend(v6, "setFontName:rebaseSelector:", v12, a2, 11.0, 14.0, v10, v11, 21.0);
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v13);
  objc_msgSend(v6, "setMinimumLineHeight:", v14);
  return v6;
}

- (id)remoteUITableFooterButton:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemInteractionColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  v9 = 23.0;
  if (a3 == 2)
    v9 = 30.0;
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v9);
  return v6;
}

- (id)remoteUITableHeaderButton:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemInteractionColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 14.0);
  return v5;
}

- (id)remoteUIEditField:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emphasizedTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 14.0);
  objc_msgSend(v5, "setTextAlignment:", 4);
  return v5;
}

- (id)remoteUIEditLabel:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emphasizedTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 13.0);
  objc_msgSend(v5, "setTextAlignment:", 4);
  return v5;
}

- (id)remoteUISelectLabel:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emphasizedTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 13.0);
  objc_msgSend(v5, "setTextAlignment:", 4);
  return v5;
}

- (id)remoteUISelectField:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = -[GKTextStyle copy](self, "copy", *(_QWORD *)&a3);
  -[GKTextStyle palette](self, "palette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "standardTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  objc_msgSend(v5, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v5, "setFontSize:rebaseSelector:", a2, 14.0);
  objc_msgSend(v5, "setTextAlignment:", 4);
  return v5;
}

- (id)remoteUINickNameField:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  if (a3 == 2)
    v9 = 22.0;
  else
    v9 = 14.0;
  objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v9);
  objc_msgSend(v6, "setTextAlignment:", 4);
  return v6;
}

- (id)remoteUINickNameLabel:(int)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emphasizedTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v8);

  v9 = 14.0;
  if (a3 == 2)
    v9 = 18.0;
  if (a3)
    v10 = v9;
  else
    v10 = 13.0;
  objc_msgSend(v6, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2, v9);
  objc_msgSend(v6, "setFontSize:rebaseSelector:", a2, v10);
  objc_msgSend(v6, "setTextAlignment:", 4);
  return v6;
}

- (id)settingsLinkText
{
  id v3;
  void *v4;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 14.0);
  return v3;
}

- (id)settingsButton
{
  id v3;
  void *v4;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 17.0);
  return v3;
}

- (id)settingsBoldButton
{
  id v3;
  void *v4;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 17.0);
  return v3;
}

- (id)settingsLabel
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 17.0);
  return v4;
}

- (id)settingsHeader
{
  id v3;
  void *v4;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 14.0);
  return v3;
}

- (id)settingsFooter
{
  id v3;
  void *v4;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 14.0);
  return v3;
}

- (GKTextStyle)styleWithName:(id)a3 fallback:(id)a4 layoutMode:(int)a5
{
  NSString *v8;
  NSString *v9;
  SEL v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSString *v16;

  v8 = (NSString *)a4;
  v9 = (NSString *)a3;
  v10 = NSSelectorFromString(v9);
  -[NSString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(":"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  v12 = NSSelectorFromString(v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
LABEL_4:
    objc_msgSend(self, v12, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_6;
  }
  v10 = NSSelectorFromString(v8);
  -[NSString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(":"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = NSSelectorFromString(v16);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      goto LABEL_4;
    goto LABEL_10;
  }
LABEL_2:
  -[GKTextStyle _gkInvokeSelector:](self, "_gkInvokeSelector:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v14 = (void *)v13;
LABEL_6:

  return (GKTextStyle *)v14;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (GKColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_storeStrong((id *)&self->_fontName, a3);
}

- (NSString)UIKitFontTextStyleName
{
  return self->_UIKitFontTextStyleName;
}

- (void)setUIKitFontTextStyleName:(id)a3
{
  objc_storeStrong((id *)&self->_UIKitFontTextStyleName, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)minimumLineHeight
{
  return self->_minimumLineHeight;
}

- (double)m34
{
  return self->_m34;
}

- (void)setM34:(double)a3
{
  self->_m34 = a3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (BOOL)needsParagraphStyle
{
  return self->_needsParagraphStyle;
}

- (void)setNeedsParagraphStyle:(BOOL)a3
{
  self->_needsParagraphStyle = a3;
}

- (BOOL)overrideUIKitFontSize
{
  return self->_overrideUIKitFontSize;
}

- (void)setOverrideUIKitFontSize:(BOOL)a3
{
  self->_overrideUIKitFontSize = a3;
}

- (SEL)fontSizeRebaseSelector
{
  return self->_fontSizeRebaseSelector;
}

- (void)setFontSizeRebaseSelector:(SEL)a3
{
  self->_fontSizeRebaseSelector = a3;
}

- (SEL)fontNameRebaseSelector
{
  return self->_fontNameRebaseSelector;
}

- (void)setFontNameRebaseSelector:(SEL)a3
{
  self->_fontNameRebaseSelector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UIKitFontTextStyleName, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
