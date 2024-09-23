@implementation CSProminentTimeView

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (void)setDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[CSProminentTextElementView date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)CSProminentTimeView;
  -[CSProminentTextElementView setDate:](&v7, sel_setDate_, v4);
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
    -[CSProminentTimeView _updateTimeString](self, "_updateTimeString");

}

- (void)_updateTimeString
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (CSTimeNumberingSystemTypeRequiresLanguageTagging(-[CSProminentTimeView numberingSystem](self, "numberingSystem"))
    && (-[CSProminentTextElementView textLabel](self, "textLabel"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    CSTimeNumberingSystemTypeLanguageTag(-[CSProminentTimeView numberingSystem](self, "numberingSystem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB2CE0];
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CSProminentTimeView _timeString](self, "_timeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v6);

    -[CSProminentTextElementView textLabel](self, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v9);

  }
  else
  {
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentTimeView _timeString](self, "_timeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);
  }

  -[CSProminentTimeView _timeString](self, "_timeString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)objc_msgSend(v11, "length") > 4;

  -[CSProminentTimeView setFourDigitTime:](self, "setFourDigitTime:", v12);
  -[CSProminentTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_timeString
{
  void *v3;
  __CFString *v4;

  -[CSProminentTextElementView date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E55EB4F0;
  }

  return v4;
}

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (CSProminentTimeView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  CSProminentTimeView *v5;
  CSProminentTimeView *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSProminentTimeView;
  v5 = -[CSProminentTextElementView initWithDate:font:textColor:](&v13, sel_initWithDate_font_textColor_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CSProminentTimeView _updateTimeFormatter](v5, "_updateTimeFormatter");
    -[CSProminentTextElementView textLabel](v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CSProminentTextElementView textLabel](v6, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_currentLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__updateTimeString, *MEMORY[0x1E0C998A0], 0);

  }
  return v6;
}

- (CSProminentTimeView)initWithDate:(id)a3 baseFont:(id)a4 textColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CSProminentTimeView *v13;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "_prominentFontFromBaseFont:usingLightVariant:usingLandscapeVariant:", v9, self->_usesLightTimeFontVariant, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CSProminentTimeView initWithDate:font:textColor:](self, "initWithDate:font:textColor:", v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_baseFont, a4);

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSProminentTimeView;
  -[CSProminentTimeView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CSProminentTimeView;
  -[CSProminentTextElementView layoutSubviews](&v21, sel_layoutSubviews);
  -[CSProminentTextElementView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "textAlignment");

  if (v4 == 1)
  {
    -[CSProminentTimeView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend((id)objc_opt_class(), "_prominentFontFromBaseFont:usingLightVariant:usingLandscapeVariant:", self->_baseFont, 0, self->_usesLandscapeTimeFontVariant);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0DC1138];
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, v6, v8);
    v14 = v13;

    if (v14 > v6)
      v14 = v6;
    -[CSProminentTimeView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayScale");

    BSPointRoundForScale();
    v17 = v16;
    v19 = v18;
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v17, v19, v14, v8);

  }
}

+ (unint64_t)elementType
{
  return 1;
}

- (void)setUsesLightTimeFontVariant:(BOOL)a3
{
  id v5;

  if ((BSEqualBools() & 1) == 0)
  {
    self->_usesLightTimeFontVariant = a3;
    objc_msgSend((id)objc_opt_class(), "_prominentFontFromBaseFont:usingLightVariant:usingLandscapeVariant:", self->_baseFont, self->_usesLightTimeFontVariant, self->_usesLandscapeTimeFontVariant);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CSProminentTextElementView setPrimaryFont:](self, "setPrimaryFont:", v5);

  }
}

- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  id v7;

  LODWORD(v3) = a3;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceClass");

  if (v6 == 2)
    v3 = 0;
  else
    v3 = v3;
  if ((BSEqualBools() & 1) == 0)
  {
    self->_usesLandscapeTimeFontVariant = v3;
    objc_msgSend((id)objc_opt_class(), "_prominentFontFromBaseFont:usingLightVariant:usingLandscapeVariant:", self->_baseFont, self->_usesLightTimeFontVariant, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CSProminentTextElementView setPrimaryFont:](self, "setPrimaryFont:", v7);

  }
}

- (BOOL)animatesTimeChanges
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CSProminentTextElementView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CSProminentTextElementView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "animatesChanges");

  return v6;
}

- (void)setAnimatesTimeChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[CSProminentTextElementView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimatesChanges:", v3);

  }
}

- (BOOL)isVisible
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CSProminentTextElementView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CSProminentTextElementView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isVisible");

  return v6;
}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[CSProminentTextElementView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSProminentTextElementView textLabel](self, "textLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisible:", v3);

  }
}

- (void)setBaseFont:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    objc_msgSend((id)objc_opt_class(), "_prominentFontFromBaseFont:usingLightVariant:usingLandscapeVariant:", v6, self->_usesLightTimeFontVariant, self->_usesLandscapeTimeFontVariant);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentTextElementView setPrimaryFont:](self, "setPrimaryFont:", v5);

  }
}

- (void)setNumberingSystem:(int64_t)a3
{
  if (self->_numberingSystem != a3)
  {
    self->_numberingSystem = a3;
    -[CSProminentTimeView _updateTimeFormatterNumberingSystem](self, "_updateTimeFormatterNumberingSystem");
  }
}

- (void)_updateTimeFormatterNumberingSystem
{
  NSDateFormatter *timeFormatter;
  void *v4;
  NSDateFormatter *v5;
  void *v6;

  timeFormatter = self->_timeFormatter;
  -[CSProminentTimeView _localeAccountingForNumberingSystem:](self, "_localeAccountingForNumberingSystem:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](timeFormatter, "setLocale:", v4);

  v5 = self->_timeFormatter;
  -[CSProminentTimeView _correctedDateFormat](self, "_correctedDateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v6);

  -[CSProminentTimeView _updateTimeString](self, "_updateTimeString");
}

- (void)_updateTimeFormatter
{
  void *v3;
  NSDateFormatter *v4;
  NSDateFormatter *timeFormatter;
  NSDateFormatter *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetFormattersIfNecessary");

  -[CSProminentTimeView _localeAccountingForNumberingSystem:](self, "_localeAccountingForNumberingSystem:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01738], "formatterForDateAsTimeNoAMPMWithLocale:", v8);
  v4 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue();
  timeFormatter = self->_timeFormatter;
  self->_timeFormatter = v4;

  v6 = self->_timeFormatter;
  -[CSProminentTimeView _correctedDateFormat](self, "_correctedDateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setDateFormat:](v6, "setDateFormat:", v7);

  -[CSProminentTimeView _updateTimeString](self, "_updateTimeString");
}

- (id)_correctedDateFormat
{
  void *v2;
  void *v3;
  void *v4;

  -[CSProminentTimeView _localeAccountingForNumberingSystem:](self, "_localeAccountingForNumberingSystem:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01738], "formatterForDateAsTimeNoAMPMWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_localeAccountingForNumberingSystem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CSTimeNumberingSystemTypeToString(-[CSProminentTimeView numberingSystem](self, "numberingSystem"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setObject:forKey:", v7, CFSTR("numbers"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v13;
  }

  return v5;
}

+ (id)_prominentFontFromBaseFont:(id)a3 usingLightVariant:(BOOL)a4 usingLandscapeVariant:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 0.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", objc_msgSend(a1, "elementType"), v5);
  v13 = v12;
  if (v6)
  {
    objc_msgSend(a1, "_lightVariantForBaseFont:size:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "fontDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)_lightVariantForBaseFont:(id)a3 size:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  if ((objc_msgSend(v5, "cs_supportsVariantWeights") & 1) != 0)
  {
    v6 = objc_msgSend(v5, "cs_variantWeightRange");
    v8 = (uint64_t)((double)(unint64_t)(v7 - v6) * 0.1);
    v9 = objc_msgSend(v5, "cs_variantWeight");
    if (v9 - v8 <= v6)
      v10 = v6;
    else
      v10 = v9 - v8;
    objc_msgSend(v5, "cs_fontWithVariantWeight:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontWithSize:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "fontWithSize:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)usesLightTimeFontVariant
{
  return self->_usesLightTimeFontVariant;
}

- (BOOL)usesLandscapeTimeFontVariant
{
  return self->_usesLandscapeTimeFontVariant;
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (int64_t)numberingSystem
{
  return self->_numberingSystem;
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
}

@end
