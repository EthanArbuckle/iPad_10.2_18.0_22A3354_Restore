@implementation NTKBigNumeralsTimeComponentLabel

- (NTKBigNumeralsTimeComponentLabel)initWithDevice:(id)a3 timeComponent:(unint64_t)a4 fontVariant:(unint64_t)a5 filledFontSectName:(id)a6 outlineFontSectName:(id)a7 dsoHandle:(const mach_header_64 *)a8 fontSize:(double)a9 useLigatures:(BOOL)a10
{
  id v18;
  id v19;
  id v20;
  NTKBigNumeralsTimeComponentLabel *v21;
  NTKBigNumeralsTimeComponentLabel *v22;
  uint64_t v23;
  UIColor *color;
  uint64_t v25;
  CLKUIColoringLabel *transitioningLabel;
  CLKUIColoringLabel *v27;
  void *v28;
  uint64_t v29;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v31;
  void *v32;
  NSDateFormatter *v33;
  NSDateFormatter *formatter;
  NSDateFormatter *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v18 = a3;
  v19 = a6;
  v20 = a7;
  v39.receiver = self;
  v39.super_class = (Class)NTKBigNumeralsTimeComponentLabel;
  v21 = -[NTKBigNumeralsTimeComponentLabel init](&v39, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_device, a3);
    v22->_useLigatures = a10;
    v22->_typeface = 0;
    v22->_style = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = objc_claimAutoreleasedReturnValue();
    color = v22->_color;
    v22->_color = (UIColor *)v23;

    objc_storeStrong((id *)&v22->_filledFontSectName, a6);
    objc_storeStrong((id *)&v22->_outlinedFontSectName, a7);
    v22->_dsoHandle = a8;
    -[NTKBigNumeralsTimeComponentLabel setupFontsForSize:](v22, "setupFontsForSize:", a9);
    objc_msgSend(off_1E6BCA6E0, "labelWithOptions:", 0);
    v25 = objc_claimAutoreleasedReturnValue();
    transitioningLabel = v22->_transitioningLabel;
    v22->_transitioningLabel = (CLKUIColoringLabel *)v25;

    v27 = v22->_transitioningLabel;
    -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](v22, "_fontForStyle:", v22->_style);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](v27, "setFont:", v28);

    -[CLKUIColoringLabel setTextColor:](v22->_transitioningLabel, "setTextColor:", v22->_color);
    -[CLKUIColoringLabel setLineBreakMode:](v22->_transitioningLabel, "setLineBreakMode:", 2);
    -[NTKBigNumeralsTimeComponentLabel addSubview:](v22, "addSubview:", v22->_transitioningLabel);
    objc_msgSend(off_1E6BCA6E0, "labelWithOptions:", 0);
    v29 = objc_claimAutoreleasedReturnValue();
    label = v22->_label;
    v22->_label = (CLKUIColoringLabel *)v29;

    v31 = v22->_label;
    -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](v22, "_fontForStyle:", v22->_style);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](v31, "setFont:", v32);

    -[CLKUIColoringLabel setTextColor:](v22->_label, "setTextColor:", v22->_color);
    -[CLKUIColoringLabel setLineBreakMode:](v22->_label, "setLineBreakMode:", 2);
    -[NTKBigNumeralsTimeComponentLabel addSubview:](v22, "addSubview:", v22->_label);
    v33 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatter = v22->_formatter;
    v22->_formatter = v33;

    v35 = v22->_formatter;
    +[NTKBigNumeralsTimeComponentLabel localeForTypeface:](NTKBigNumeralsTimeComponentLabel, "localeForTypeface:", v22->_typeface);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v35, "setLocale:", v36);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v22, sel__updateLocale, *MEMORY[0x1E0C99720], 0);

    v22->_timeComponent = a4;
    v22->_fontVariant = a5;
    -[NTKBigNumeralsTimeComponentLabel _updateLocale](v22, "_updateLocale");
  }

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKBigNumeralsTimeComponentLabel;
  -[NTKBigNumeralsTimeComponentLabel dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *transitioningLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKBigNumeralsTimeComponentLabel;
  -[NTKBigNumeralsTimeComponentLabel layoutSubviews](&v5, sel_layoutSubviews);
  label = self->_label;
  -[NTKBigNumeralsTimeComponentLabel bounds](self, "bounds");
  -[CLKUIColoringLabel setFrame:](label, "setFrame:");
  transitioningLabel = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel bounds](self, "bounds");
  -[CLKUIColoringLabel setFrame:](transitioningLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setupFontsForSize:(double)a3
{
  void *v5;
  CLKFont *v6;
  CLKFont *filledFont;
  CLKFont *v8;
  CLKFont *outlinedFont;
  CLKUIColoringLabel *transitioningLabel;
  void *v11;
  CLKUIColoringLabel *label;
  void *v13;
  id v14;

  +[NTKFontLoader fontDescriptorForSectName:fromMachO:](NTKFontLoader, "fontDescriptorForSectName:fromMachO:", self->_filledFontSectName, self->_dsoHandle);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[NTKFontLoader fontDescriptorForSectName:fromMachO:](NTKFontLoader, "fontDescriptorForSectName:fromMachO:", self->_outlinedFontSectName, self->_dsoHandle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v14, a3);
  v6 = (CLKFont *)objc_claimAutoreleasedReturnValue();
  filledFont = self->_filledFont;
  self->_filledFont = v6;

  objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v5, a3);
  v8 = (CLKFont *)objc_claimAutoreleasedReturnValue();
  outlinedFont = self->_outlinedFont;
  self->_outlinedFont = v8;

  transitioningLabel = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", self->_style);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](transitioningLabel, "setFont:", v11);

  label = self->_label;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", self->_style);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](label, "setFont:", v13);

}

- (UIFont)font
{
  return (UIFont *)-[CLKUIColoringLabel font](self->_label, "font");
}

- (double)fontSize
{
  double result;

  -[CLKFont pointSize](self->_filledFont, "pointSize");
  return result;
}

- (void)setTextAlignment:(int64_t)a3
{
  -[CLKUIColoringLabel setTextAlignment:](self->_label, "setTextAlignment:");
  -[CLKUIColoringLabel setTextAlignment:](self->_transitioningLabel, "setTextAlignment:", a3);
}

- (int64_t)textAlignment
{
  return -[CLKUIColoringLabel textAlignment](self->_label, "textAlignment");
}

- (double)_lastLineBaseline
{
  double result;

  -[CLKUIColoringLabel _lastLineBaseline](self->_label, "_lastLineBaseline");
  return result;
}

- (void)setTypeface:(unint64_t)a3
{
  NSDateFormatter *formatter;
  void *v5;

  if (self->_typeface != a3)
  {
    self->_typeface = a3;
    formatter = self->_formatter;
    +[NTKBigNumeralsTimeComponentLabel localeForTypeface:](NTKBigNumeralsTimeComponentLabel, "localeForTypeface:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](formatter, "setLocale:", v5);

    -[NTKBigNumeralsTimeComponentLabel cleanupTransition](self, "cleanupTransition");
    -[NTKBigNumeralsTimeComponentLabel _updateLabelText](self, "_updateLabelText");
  }
}

- (void)setStyle:(unint64_t)a3
{
  id v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[NTKBigNumeralsTimeComponentLabel cleanupTransition](self, "cleanupTransition");
    -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setFont:](self->_label, "setFont:", v5);
    -[CLKUIColoringLabel setFont:](self->_transitioningLabel, "setFont:", v5);

  }
}

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[NTKBigNumeralsTimeComponentLabel cleanupTransition](self, "cleanupTransition");
    -[CLKUIColoringLabel setTextColor:](self->_label, "setTextColor:", v5);
    -[CLKUIColoringLabel setTextColor:](self->_transitioningLabel, "setTextColor:", v5);
  }

}

- (void)applyTransitionFraction:(double)a3 fromTypeface:(unint64_t)a4 toTypeface:(unint64_t)a5
{
  CLKUIColoringLabel *label;
  void *v10;
  CLKUIColoringLabel *transitioningLabel;
  void *v12;
  double v13;

  label = self->_label;
  -[NTKBigNumeralsTimeComponentLabel _attributedStringForTypeface:](self, "_attributedStringForTypeface:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setAttributedText:](label, "setAttributedText:", v10);

  transitioningLabel = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel _attributedStringForTypeface:](self, "_attributedStringForTypeface:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setAttributedText:](transitioningLabel, "setAttributedText:", v12);

  v13 = 1.0;
  if (a4 == a5)
    a3 = 0.0;
  else
    v13 = 1.0 - a3;
  -[CLKUIColoringLabel setAlpha:](self->_label, "setAlpha:", v13);
  -[CLKUIColoringLabel setAlpha:](self->_transitioningLabel, "setAlpha:", a3);
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  CLKUIColoringLabel *label;
  void *v10;
  CLKUIColoringLabel *transitioningLabel;
  void *v12;
  double v13;

  label = self->_label;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](label, "setFont:", v10);

  transitioningLabel = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](transitioningLabel, "setFont:", v12);

  v13 = 1.0;
  if (a4 == a5)
    a3 = 0.0;
  else
    v13 = 1.0 - a3;
  -[CLKUIColoringLabel setAlpha:](self->_label, "setAlpha:", v13);
  -[CLKUIColoringLabel setAlpha:](self->_transitioningLabel, "setAlpha:", a3);
}

- (void)applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  id v6;

  NTKInterpolateBetweenColors(a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](self->_label, "setTextColor:", v6);
  -[CLKUIColoringLabel setTextColor:](self->_transitioningLabel, "setTextColor:", v6);

}

- (void)cleanupTransition
{
  CLKUIColoringLabel *label;
  void *v4;
  CLKUIColoringLabel *transitioningLabel;
  void *v6;
  CLKUIColoringLabel *v7;
  void *v8;
  CLKUIColoringLabel *v9;
  void *v10;

  -[CLKUIColoringLabel setAlpha:](self->_label, "setAlpha:", 1.0);
  -[CLKUIColoringLabel setAlpha:](self->_transitioningLabel, "setAlpha:", 0.0);
  label = self->_label;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](label, "setFont:", v4);

  transitioningLabel = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel _fontForStyle:](self, "_fontForStyle:", self->_style);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](transitioningLabel, "setFont:", v6);

  v7 = self->_label;
  -[NTKBigNumeralsTimeComponentLabel _attributedStringForTypeface:](self, "_attributedStringForTypeface:", self->_typeface);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setAttributedText:](v7, "setAttributedText:", v8);

  v9 = self->_transitioningLabel;
  -[NTKBigNumeralsTimeComponentLabel _attributedStringForTypeface:](self, "_attributedStringForTypeface:", self->_typeface);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setAttributedText:](v9, "setAttributedText:", v10);

  -[CLKUIColoringLabel setTextColor:](self->_label, "setTextColor:", self->_color);
  -[CLKUIColoringLabel setTextColor:](self->_transitioningLabel, "setTextColor:", self->_color);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  -[NTKBigNumeralsTimeComponentLabel _updateLabelText](self, "_updateLabelText");
}

- (void)_updateLocale
{
  const __CFString *v3;
  unint64_t timeComponent;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("h");
  if (self->_fontVariant == 1 && CLKLocaleIs24HourMode())
    v3 = CFSTR("HH");
  timeComponent = self->_timeComponent;
  if (!timeComponent)
    goto LABEL_7;
  if (timeComponent == 1)
  {
    v3 = CFSTR("mm");
LABEL_7:
    -[NSDateFormatter setDateFormat:](self->_formatter, "setDateFormat:", v3);
  }
  -[NTKBigNumeralsTimeComponentLabel _updateLabelText](self, "_updateLabelText");

}

+ (id)localeForTypeface:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", off_1E6BCD660[a3], v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_attributedStringForTypeface:(unint64_t)a3
{
  NSDateFormatter *formatter;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  _BOOL4 useLigatures;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  formatter = self->_formatter;
  +[NTKBigNumeralsTimeComponentLabel localeForTypeface:](NTKBigNumeralsTimeComponentLabel, "localeForTypeface:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](formatter, "setLocale:", v6);

  -[NSDateFormatter stringFromDate:](self->_formatter, "stringFromDate:", self->_date);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 3)
  {
    v18 = -[__CFString integerValue](v7, "integerValue") + 8559;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v18, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v9;
  }
  v10 = &stru_1E6BDC918;
  if (v8)
    v10 = v8;
  v11 = v10;

  useLigatures = self->_useLigatures;
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = v13;
  if (useLigatures)
  {
    v19 = *MEMORY[0x1E0DC1158];
    v20[0] = &unk_1E6C9D5B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v11, v15);

    v11 = (__CFString *)v15;
  }
  else
  {
    v16 = (void *)objc_msgSend(v13, "initWithString:", v11);
  }

  return v16;
}

- (void)_updateLabelText
{
  id v3;

  -[NTKBigNumeralsTimeComponentLabel _attributedStringForTypeface:](self, "_attributedStringForTypeface:", self->_typeface);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setAttributedText:](self->_label, "setAttributedText:", v3);
  -[CLKUIColoringLabel setAttributedText:](self->_transitioningLabel, "setAttributedText:", v3);
  -[NTKBigNumeralsTimeComponentLabel setNeedsLayout](self, "setNeedsLayout");

}

- (id)_fontForStyle:(unint64_t)a3
{
  int *v3;

  if (!a3)
  {
    v3 = &OBJC_IVAR___NTKBigNumeralsTimeComponentLabel__filledFont;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___NTKBigNumeralsTimeComponentLabel__outlinedFont;
LABEL_5:
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *v3);
  }
  return (id)(id)a2;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (unint64_t)style
{
  return self->_style;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_outlinedFontSectName, 0);
  objc_storeStrong((id *)&self->_filledFontSectName, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_transitioningLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_outlinedFont, 0);
  objc_storeStrong((id *)&self->_filledFont, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
