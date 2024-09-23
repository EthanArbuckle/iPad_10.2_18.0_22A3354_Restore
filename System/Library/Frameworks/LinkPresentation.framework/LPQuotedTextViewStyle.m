@implementation LPQuotedTextViewStyle

- (LPQuotedTextViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  LPQuotedTextViewStyle *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  LPPointUnit *v12;
  void *v13;
  LPPointUnit *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIFont *longPullQuoteFont;
  LPTextViewStyle *v22;
  LPTextViewStyle *characterLimitIndicatorStyle;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  LPPointUnit *v30;
  void *v31;
  LPQuotedTextViewStyle *v32;
  objc_super v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)LPQuotedTextViewStyle;
  v8 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:](&v34, sel_initWithPlatform_fontScalingFactor_);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v8, "setColor:", v9);

    -[LPTextViewStyle setMaximumLines:](v8, "setMaximumLines:", 0);
    -[LPTextViewStyle setMaximumCharacters:](v8, "setMaximumCharacters:", 500);
    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC4BA0]);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else if ((unint64_t)a3 <= 6 && ((0x77u >> a3) & 1) != 0)
    {
      fontWithTraits(**((void ***)&unk_1E44A9940 + a3), dword_1A0D65E30[a3], a4);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC4BA0]);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    -[LPTextViewStyle setFont:](v8, "setFont:", v10);

    v12 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 15.0);
    -[LPTextViewStyle padding](v8, "padding");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTop:", v12);

    v14 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
    -[LPTextViewStyle padding](v8, "padding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBottom:", v14);

    outerHorizontalTextMargin((id)a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle padding](v8, "padding");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLeading:", v16);

    outerHorizontalTextMargin((id)a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle padding](v8, "padding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTrailing:", v18);

    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC4BA0]);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else if ((unint64_t)a3 <= 6 && ((0x77u >> a3) & 1) != 0)
    {
      fontWithTraits(**((void ***)&unk_1E44A9978 + a3), dword_1A0D65E30[a3], a4);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC4BA0]);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    longPullQuoteFont = v8->_longPullQuoteFont;
    v8->_longPullQuoteFont = (UIFont *)v20;

    v8->_maximumLinesToConsiderShort = 3;
    v8->_showQuoteIndicator = 1;
    v8->_showCharacterLimitIndicator = 1;
    v22 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    characterLimitIndicatorStyle = v8->_characterLimitIndicatorStyle;
    v8->_characterLimitIndicatorStyle = v22;

    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC4B88]);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)a3 > 6)
        goto LABEL_24;
      if (((1 << a3) & 0x73) != 0)
      {
        v37 = *MEMORY[0x1E0DC4A40];
        v35 = *MEMORY[0x1E0DC4BA8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC4B88]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        fontWithTraitsAndAttributes((void *)*MEMORY[0x1E0DC4AB8], 0, v28, a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      if (a3 == 2)
      {
        fontWithTraits((void *)*MEMORY[0x1E0DC4AC8], 0x8000, a4);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_24:
        objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0DC4B88]);
        v24 = objc_claimAutoreleasedReturnValue();
      }
    }
    v25 = (void *)v24;
LABEL_20:
    -[LPTextViewStyle setFont:](v8->_characterLimitIndicatorStyle, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v8->_characterLimitIndicatorStyle, "setColor:", v29);

    v30 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 15.0);
    -[LPTextViewStyle padding](v8->_characterLimitIndicatorStyle, "padding");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTop:", v30);

    v32 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  id *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPQuotedTextViewStyle;
  v4 = -[LPTextViewStyle copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 17, self->_longPullQuoteFont);
    *((_DWORD *)v5 + 33) = self->_maximumLinesToConsiderShort;
    *((_BYTE *)v5 + 128) = self->_showQuoteIndicator;
    *((_BYTE *)v5 + 129) = self->_showCharacterLimitIndicator;
    objc_storeStrong(v5 + 18, self->_characterLimitIndicatorStyle);
    v6 = v5;
  }

  return v5;
}

- (id)adjustedForString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[LPQuotedTextViewStyle copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v5, "_adjustForString:", v4);

  return v5;
}

- (UIFont)longPullQuoteFont
{
  return self->_longPullQuoteFont;
}

- (void)setLongPullQuoteFont:(id)a3
{
  objc_storeStrong((id *)&self->_longPullQuoteFont, a3);
}

- (unsigned)maximumLinesToConsiderShort
{
  return self->_maximumLinesToConsiderShort;
}

- (void)setMaximumLinesToConsiderShort:(unsigned int)a3
{
  self->_maximumLinesToConsiderShort = a3;
}

- (BOOL)showQuoteIndicator
{
  return self->_showQuoteIndicator;
}

- (void)setShowQuoteIndicator:(BOOL)a3
{
  self->_showQuoteIndicator = a3;
}

- (BOOL)showCharacterLimitIndicator
{
  return self->_showCharacterLimitIndicator;
}

- (void)setShowCharacterLimitIndicator:(BOOL)a3
{
  self->_showCharacterLimitIndicator = a3;
}

- (LPTextViewStyle)characterLimitIndicatorStyle
{
  return self->_characterLimitIndicatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterLimitIndicatorStyle, 0);
  objc_storeStrong((id *)&self->_longPullQuoteFont, 0);
}

@end
