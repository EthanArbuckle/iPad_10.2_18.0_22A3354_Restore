@implementation MKInfoCardThemeManager

- (BOOL)_isInSpotlightContext
{
  if (qword_1ECE2DDF0 != -1)
    dispatch_once(&qword_1ECE2DDF0, &__block_literal_global_96);
  return _MergedGlobals_170;
}

void __47__MKInfoCardThemeManager__isInSpotlightContext__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_170 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

}

+ (id)currentTheme
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MKInfoCardThemeManager_currentTheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2DE00 != -1)
    dispatch_once(&qword_1ECE2DE00, block);
  return (id)qword_1ECE2DDF8;
}

void __38__MKInfoCardThemeManager_currentTheme__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithThemeType:", 0);
  v2 = (void *)qword_1ECE2DDF8;
  qword_1ECE2DDF8 = v1;

}

+ (id)themeWithThemeType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithThemeType:", a3);
}

+ (void)setTheme:(unint64_t)a3
{
  _BYTE *v4;
  _BYTE *v5;

  objc_msgSend(a1, "currentTheme");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v4[8] = 1;
    v5 = v4;
    objc_msgSend(v4, "_setTheme:", a3);
    v4 = v5;
  }

}

+ (unint64_t)themeType
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a1, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "themeType");

  return v3;
}

- (MKInfoCardThemeManager)init
{

  return 0;
}

- (id)_initWithThemeType:(unint64_t)a3
{
  MKInfoCardThemeManager *v4;
  MKInfoCardThemeManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKInfoCardThemeManager;
  v4 = -[MKInfoCardThemeManager init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (!a3)
      a3 = -[MKInfoCardThemeManager _currentSystemTheme](v4, "_currentSystemTheme");
    -[MKInfoCardThemeManager _setTheme:](v5, "_setTheme:", a3);
  }
  return v5;
}

- (unint64_t)_currentSystemTheme
{
  return 1;
}

- (void)_setTheme:(unint64_t)a3
{
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
  _QWORD *v15;
  _QWORD *v16;
  NSDictionary *v17;
  NSDictionary *colors;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[25];
  _QWORD v37[25];
  _QWORD v38[25];
  _QWORD v39[27];

  v39[25] = *MEMORY[0x1E0C80C00];
  if (-[MKInfoCardThemeManager themeType](self, "themeType") != a3)
  {
    self->_themeType = a3;
    if (a3 == 2)
    {
      v36[0] = CFSTR("textColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v35;
      v36[1] = CFSTR("lightTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v34;
      v36[2] = CFSTR("tertiaryTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v33;
      v36[3] = CFSTR("separatorLineColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v32;
      v36[4] = CFSTR("selectedRowColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.100000001);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v31;
      v36[5] = CFSTR("tintColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[5] = v30;
      v36[6] = CFSTR("highlightedTintColor");
      -[MKInfoCardThemeManager tintColor](self, "tintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "colorWithAlphaComponent:", 0.25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[6] = v28;
      v36[7] = CFSTR("rowColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[7] = v27;
      v36[8] = CFSTR("disabledActionRowTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.200000003);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[8] = v26;
      v36[9] = CFSTR("disabledActionRowBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0500000007);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[9] = v25;
      v36[10] = CFSTR("normalActionRowBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0599999987);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[10] = v24;
      v36[11] = CFSTR("normalActionRowBackgroundPressedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.180000007);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[11] = v23;
      v36[12] = CFSTR("headerPrimaryButtonNormalColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[12] = v22;
      v36[13] = CFSTR("headerPrimaryButtonHighlightedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.286274523, 0.749019623, 0.937254906, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[13] = v21;
      v36[14] = CFSTR("buttonNormalColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.899999976);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[14] = v20;
      v36[15] = CFSTR("buttonHighlightedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.400000006);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37[15] = v19;
      v36[16] = CFSTR("transitOntimeTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v37[16] = v5;
      v36[17] = CFSTR("transitDelayedTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v37[17] = v6;
      v36[18] = CFSTR("transitChevronBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.949019611, 0.956862748, 0.988235295, 0.140000001);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37[18] = v7;
      v36[19] = CFSTR("normalBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.100000001);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37[19] = v8;
      v36[20] = CFSTR("ratingBarStartColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.556862772, 0.556862772, 0.576470613, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v37[20] = v9;
      v36[21] = CFSTR("ratingBarEndColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37[21] = v10;
      v36[22] = CFSTR("ratingBarBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0500000007);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37[22] = v11;
      v36[23] = CFSTR("transitIncidentBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.100000001);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[23] = v12;
      v36[24] = CFSTR("mapsui_cardBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[24] = v13;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v37;
      v16 = v36;
    }
    else
    {
      if (a3 != 1)
        return;
      v38[0] = CFSTR("textColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v35;
      v38[1] = CFSTR("lightTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v34;
      v38[2] = CFSTR("tertiaryTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v33;
      v38[3] = CFSTR("separatorLineColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v32;
      v38[4] = CFSTR("tintColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v31;
      v38[5] = CFSTR("highlightedTintColor");
      -[MKInfoCardThemeManager tintColor](self, "tintColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "colorWithAlphaComponent:", 0.25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39[5] = v29;
      v38[6] = CFSTR("rowColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[6] = v28;
      v38[7] = CFSTR("selectedRowColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0599999987);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[7] = v27;
      v38[8] = CFSTR("disabledActionRowTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.200000003);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[8] = v26;
      v38[9] = CFSTR("disabledActionRowBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0399999991);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[9] = v25;
      v38[10] = CFSTR("normalActionRowBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0599999987);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39[10] = v24;
      v38[11] = CFSTR("normalActionRowBackgroundPressedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.100000001);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39[11] = v23;
      v38[12] = CFSTR("headerPrimaryButtonNormalColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[12] = v22;
      v38[13] = CFSTR("headerPrimaryButtonHighlightedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.419607848, 0.87843138, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39[13] = v21;
      v38[14] = CFSTR("buttonNormalColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.899999976);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39[14] = v20;
      v38[15] = CFSTR("buttonHighlightedColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.400000006);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39[15] = v19;
      v38[16] = CFSTR("transitOntimeTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v39[16] = v5;
      v38[17] = CFSTR("transitDelayedTextColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v39[17] = v6;
      v38[18] = CFSTR("transitChevronBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156877, 0.0392156877, 0.470588237, 0.0500000007);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39[18] = v7;
      v38[19] = CFSTR("normalBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.100000001);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39[19] = v8;
      v38[20] = CFSTR("ratingBarStartColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.556862772, 0.556862772, 0.576470613, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39[20] = v9;
      v38[21] = CFSTR("ratingBarEndColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39[21] = v10;
      v38[22] = CFSTR("ratingBarBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0500000007);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39[22] = v11;
      v38[23] = CFSTR("transitIncidentBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39[23] = v12;
      v38[24] = CFSTR("mapsui_cardBackgroundColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[24] = v13;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v39;
      v16 = v38;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 25);
    v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    colors = self->_colors;
    self->_colors = v17;

  }
}

- (void)_setTintColorProvider:(id)a3
{
  void *v4;
  id tintColorProvider;

  v4 = (void *)objc_msgSend(a3, "copy");
  tintColorProvider = self->_tintColorProvider;
  self->_tintColorProvider = v4;

}

+ (void)setTintColorProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "currentTheme");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTintColorProvider:", v4);

}

- (BOOL)isDarkTheme
{
  return self->_themeType == 2;
}

- (UIColor)textColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("textColor"));
}

- (UIColor)lightTextColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("lightTextColor"));
}

- (UIColor)tertiaryTextColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("tertiaryTextColor"));
}

- (UIColor)highlightedTintColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("highlightedTintColor"));
}

- (UIColor)separatorLineColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("separatorLineColor"));
}

- (UIColor)rowColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("rowColor"));
}

- (UIColor)selectedRowColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("selectedRowColor"));
}

- (UIColor)disabledActionRowTextColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("disabledActionRowTextColor"));
}

- (UIColor)normalActionRowBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("normalActionRowBackgroundColor"));
}

- (UIColor)disabledActionRowBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("disabledActionRowBackgroundColor"));
}

- (UIColor)normalActionRowBackgroundPressedColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("normalActionRowBackgroundPressedColor"));
}

- (UIColor)headerPrimaryButtonNormalColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("headerPrimaryButtonNormalColor"));
}

- (UIColor)headerPrimaryButtonHighlightedColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("headerPrimaryButtonHighlightedColor"));
}

- (UIColor)buttonNormalColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("buttonNormalColor"));
}

- (UIColor)buttonHighlightedColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("buttonHighlightedColor"));
}

- (UIColor)transitOntimeTextColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("transitOntimeTextColor"));
}

- (UIColor)transitDelayedTextColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("transitDelayedTextColor"));
}

- (UIColor)transitChevronBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("transitChevronBackgroundColor"));
}

- (UIColor)normalBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("normalBackgroundColor"));
}

- (UIColor)ratingBarStartColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("ratingBarStartColor"));
}

- (UIColor)ratingBarEndColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("ratingBarEndColor"));
}

- (UIColor)ratingBarBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("ratingBarBackgroundColor"));
}

- (UIColor)transitIncidentBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("transitIncidentBackgroundColor"));
}

- (UIColor)cardBackgroundColor
{
  return (UIColor *)-[NSDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", CFSTR("mapsui_cardBackgroundColor"));
}

- (UIColor)tintColor
{
  void (**tintColorProvider)(id, SEL);
  void *v4;
  double v5;
  double v6;
  double v7;

  tintColorProvider = (void (**)(id, SEL))self->_tintColorProvider;
  if (tintColorProvider)
  {
    tintColorProvider[2](tintColorProvider, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_themeType == 2)
    {
      v5 = 0.109803922;
      v6 = 0.686274529;
      v7 = 0.925490201;
    }
    else
    {
      v6 = 0.478431374;
      v5 = 0.0;
      v7 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v4;
}

- (NSString)javaScriptName
{
  unint64_t themeType;
  const __CFString *v3;

  themeType = self->_themeType;
  v3 = CFSTR("invalid");
  if (themeType == 1)
    v3 = CFSTR("light");
  if (themeType == 2)
    return (NSString *)CFSTR("dark");
  else
    return &v3->isa;
}

- (unint64_t)themeType
{
  return self->_themeType;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tintColorProvider, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
