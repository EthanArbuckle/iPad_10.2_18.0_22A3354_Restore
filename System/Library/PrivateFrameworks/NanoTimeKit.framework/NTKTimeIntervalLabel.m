@implementation NTKTimeIntervalLabel

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 signed:(BOOL)a6 forDevice:(id)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NTKTimeIntervalLabel *v18;
  NTKTimeIntervalLabel *v19;
  void *v20;
  uint64_t v21;
  CLKFont *font;
  uint64_t v23;
  NSMutableDictionary *images;
  uint64_t v25;
  UILabel *label;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v31;

  v12 = a4;
  v13 = a7;
  v31.receiver = self;
  v31.super_class = (Class)NTKTimeIntervalLabel;
  v14 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = -[NTKTimeIntervalLabel initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v15, v16, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_device, a7);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CLKFontWithMonospacedNumbers");
    v21 = objc_claimAutoreleasedReturnValue();
    font = v19->_font;
    v19->_font = (CLKFont *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    images = v19->_images;
    v19->_images = (NSMutableDictionary *)v23;

    v19->_showSubSeconds = 1;
    v19->_frozen = 0;
    v19->_style = a5;
    v19->_isSigned = a6;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v14, v15, v16, v17);
    label = v19->_label;
    v19->_label = (UILabel *)v25;

    -[UILabel setFont:](v19->_label, "setFont:", v19->_font);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v19->_label, "setBackgroundColor:", v27);

    -[UILabel setTextColor:](v19->_label, "setTextColor:", v12);
    if (a5 == 1)
      v28 = 2;
    else
      v28 = 1;
    -[UILabel setTextAlignment:](v19->_label, "setTextAlignment:", v28);
    -[NTKTimeIntervalLabel forceTime:](v19, "forceTime:", 720.0);
    -[NTKTimeIntervalLabel addSubview:](v19, "addSubview:", v19->_label);
    -[NTKTimeIntervalLabel calculateMetrics](v19, "calculateMetrics");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v19, sel__localeChanged, *MEMORY[0x1E0C99720], 0);

  }
  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKTimeIntervalLabel;
  -[NTKTimeIntervalLabel dealloc](&v4, sel_dealloc);
}

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 color:(id)a4 style:(int64_t)a5 forDevice:(id)a6
{
  return -[NTKTimeIntervalLabel initWithMonospacedFontOfSize:color:style:signed:forDevice:](self, "initWithMonospacedFontOfSize:color:style:signed:forDevice:", a4, a5, 0, a6, a3);
}

- (NTKTimeIntervalLabel)initWithMonospacedFontOfSize:(double)a3 forDevice:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  NTKTimeIntervalLabel *v9;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a4;
  objc_msgSend(v6, "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTKTimeIntervalLabel initWithMonospacedFontOfSize:color:style:forDevice:](self, "initWithMonospacedFontOfSize:color:style:forDevice:", v8, 0, v7, a3);

  return v9;
}

- (id)_localImageForDigit:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_images, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[NTKTimeIntervalLabel _cachedImageForDigit:](self, "_cachedImageForDigit:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSMutableDictionary setObject:forKey:](self->_images, "setObject:forKey:", v6, v5);
  }
  v7 = v6;

  return v7;
}

- (void)calculateMetrics
{
  NSString *v3;
  NSString *text;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[NTKTimeIntervalLabel getTimeText](self, "getTimeText");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v3;

  v5 = *MEMORY[0x1E0DC1138];
  v16[0] = self->_font;
  v6 = *MEMORY[0x1E0DC1140];
  v15[0] = v5;
  v15[1] = v6;
  -[NTKTimeIntervalLabel textColor](self, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString substringWithRange:](self->_text, "substringWithRange:", -[NSString length](self->_text, "length") - 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithAttributes:", v8);
  self->_digitWidth = v10;

  -[NSString substringWithRange:](self->_text, "substringWithRange:", 0, -[NSString length](self->_text, "length") - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithAttributes:", v8);
  self->_staticLabelWidth = v12;

  -[NSString sizeWithAttributes:](self->_text, "sizeWithAttributes:", v8);
  self->_textSize.width = v13;
  self->_textSize.height = v14;
  *(_WORD *)&self->_isShowingDigits = 1;

}

- (double)actualWidth
{
  double width;
  UILabel *suffix;
  double v5;
  UILabel *prefix;
  double v7;

  width = self->_textSize.width;
  suffix = self->_suffix;
  if (suffix)
  {
    -[UILabel frame](suffix, "frame");
    width = width + v5;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    -[UILabel frame](prefix, "frame");
    return width + v7;
  }
  return width;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  UILabel *suffix;
  double v7;
  UILabel *prefix;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = self->_textSize.width;
  height = self->_textSize.height;
  suffix = self->_suffix;
  if (suffix)
  {
    -[UILabel frame](suffix, "frame", a3.width, a3.height);
    width = width + v7;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    -[UILabel frame](prefix, "frame", a3.width, a3.height);
    width = width + v9;
  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)createDigitViews
{
  NSMutableArray *v3;
  NSMutableArray *digits;
  char v5;
  char v6;
  NSMutableArray *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_digits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    digits = self->_digits;
    self->_digits = v3;

    v5 = 1;
    do
    {
      v6 = v5;
      v7 = self->_digits;
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[NTKTimeIntervalLabel _localImageForDigit:](self, "_localImageForDigit:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithImage:", v9);
      -[NSMutableArray addObject:](v7, "addObject:", v10);

      -[NSMutableArray lastObject](self->_digits, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKTimeIntervalLabel addSubview:](self, "addSubview:", v11);

      v5 = 0;
    }
    while ((v6 & 1) != 0);
  }
}

- (double)_labelWidth
{
  int *v2;

  if (self->_style)
    v2 = &OBJC_IVAR___NTKTimeIntervalLabel__staticLabelWidth;
  else
    v2 = &OBJC_IVAR___NTKTimeIntervalLabel__textSize;
  return *(double *)((char *)&self->super.super.super.isa + *v2);
}

- (void)layoutSubviews
{
  double v3;
  UILabel *prefix;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)NTKTimeIntervalLabel;
  -[NTKTimeIntervalLabel layoutSubviews](&v32, sel_layoutSubviews);
  v3 = 0.0;
  if (-[NTKTimeIntervalLabel shouldShowDigits](self, "shouldShowDigits"))
    v3 = -self->_digitWidth;
  prefix = self->_prefix;
  if (prefix)
  {
    -[UILabel frame](prefix, "frame");
    v6 = v5;
    -[UILabel frame](self->_prefix, "frame");
    -[UILabel setFrame:](self->_prefix, "setFrame:", 0.0, 0.0, v6);
    -[UILabel frame](self->_prefix, "frame");
    CLKCeilForDevice();
    v3 = v3 + v7;
  }
  -[NTKTimeIntervalLabel _labelWidth](self, "_labelWidth");
  CLKCeilForDevice();
  v9 = v8;
  -[UILabel frame](self->_label, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:", v3, 0.0, v9);
  CLKCeilForDevice();
  v11 = v3 + v10;
  if (-[NTKTimeIntervalLabel shouldShowDigits](self, "shouldShowDigits"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = self->_digits;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          CLKCeilForDevice();
          v19 = v18;
          -[UILabel frame](self->_label, "frame", (_QWORD)v28);
          v21 = v20;
          objc_msgSend(v17, "frame");
          v23 = v22;
          objc_msgSend(v17, "frame");
          objc_msgSend(v17, "setFrame:", v19, v21, v23);
          v11 = self->_digitWidth + v11;
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }

  }
  if (self->_suffix)
  {
    CLKCeilForDevice();
    v25 = v24;
    -[UILabel frame](self->_suffix, "frame");
    v27 = v26;
    -[UILabel frame](self->_suffix, "frame");
    -[UILabel setFrame:](self->_suffix, "setFrame:", v25, 0.0, v27);
  }
}

- (void)_localeChanged
{
  void *v3;

  createDateFormats();
  _ImageCache(self->_device);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[NTKTimeIntervalLabel _invalidateDigitImages](self, "_invalidateDigitImages");
}

- (id)getTimeText
{
  NSString *v3;
  double time;
  double v5;
  uint64_t v6;

  v3 = self->_text;
  time = self->_time;
  v5 = time - self->_currentTextTime;
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 >= 1.0)
  {
    self->_currentTextTime = round(time);
    -[NTKTimeIntervalLabel formatTimeInterval](self, "formatTimeInterval");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v6;
  }
  return v3;
}

- (id)formatTimeInterval
{
  double time;
  double v4;
  signed int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t *v10;
  double v11;
  float v12;
  int v13;
  uint64_t v14;
  uint64_t v16;

  time = self->_time;
  if (time >= 0.0)
    v4 = self->_time;
  else
    v4 = -time;
  v5 = vcvtmd_s64_f64(v4 / 60.0);
  v6 = (v5 / 60);
  if (formatTimeInterval_onceToken != -1)
    dispatch_once(&formatTimeInterval_onceToken, &__block_literal_global_26);
  v7 = (v5 % 60);
  if (self->_style)
    v8 = 1;
  else
    v8 = (v5 + 59) >= 0x77;
  v9 = !v8;
  self->_showSubSeconds = v9;
  if (self->_style == 1)
  {
    if (self->_isSigned)
      v10 = &__formatHourMinSigned;
    else
      v10 = &__formatHourMin;
    v11 = (double)(int)v6;
    if (time < 0.0)
      v11 = -(double)(int)v6;
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", *v10, v12, (v5 % 60), v16);
  }
  else
  {
    v13 = 60 * v5;
    v14 = (int)(v4 - (double)(60 * v5));
    if (-[NTKTimeIntervalLabel showSubSeconds](self, "showSubSeconds"))
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", __formatMinSecSubsec, v7, v14, ((int)llround((v4 - (double)(v13 + (int)v14)) * 100.0) % 100));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", __formatHourMinSec, v6, v7, v14);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowDigits
{
  if (self->_frozen)
    return 0;
  if (self->_showSubSeconds)
    return 1;
  return self->_style == 1;
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
    -[NTKTimeIntervalLabel forceTime:](self, "forceTime:");
}

- (void)setSuffix:(id)a3
{
  id v4;
  UILabel *suffix;
  id v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v4 = a3;
  suffix = self->_suffix;
  v16 = v4;
  if (!v4)
  {
    -[UILabel removeFromSuperview](suffix, "removeFromSuperview");
    v10 = self->_suffix;
    self->_suffix = 0;

LABEL_10:
    v15 = v16;
    goto LABEL_11;
  }
  if (!suffix)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_suffix;
    self->_suffix = v7;

    if (self->_suffixSmallCaps)
    {
      -[CLKFont CLKFontWithLocalizedSmallCaps](self->_font, "CLKFontWithLocalizedSmallCaps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_suffix, "setFont:", v9);

    }
    else
    {
      -[UILabel setFont:](self->_suffix, "setFont:", self->_font);
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_suffix, "setBackgroundColor:", v11);

    -[UILabel textColor](self->_label, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_suffix, "setTextColor:", v12);

    -[UILabel setTextAlignment:](self->_suffix, "setTextAlignment:", 0);
    -[NTKTimeIntervalLabel addSubview:](self, "addSubview:", self->_suffix);
    suffix = self->_suffix;
  }
  -[UILabel text](suffix, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v16, "isEqual:", v13);

  v15 = v16;
  if ((v14 & 1) == 0)
  {
    -[UILabel setText:](self->_suffix, "setText:", v16);
    -[UILabel sizeToFit](self->_suffix, "sizeToFit");
    goto LABEL_10;
  }
LABEL_11:

}

- (NSString)suffix
{
  return -[UILabel text](self->_suffix, "text");
}

- (void)setPrefix:(id)a3
{
  id v4;
  UILabel *prefix;
  id v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v4 = a3;
  prefix = self->_prefix;
  v16 = v4;
  if (!v4)
  {
    -[UILabel removeFromSuperview](prefix, "removeFromSuperview");
    v10 = self->_prefix;
    self->_prefix = 0;

LABEL_10:
    v15 = v16;
    goto LABEL_11;
  }
  if (!prefix)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_prefix;
    self->_prefix = v7;

    if (self->_suffixSmallCaps)
    {
      -[CLKFont CLKFontWithLocalizedSmallCaps](self->_font, "CLKFontWithLocalizedSmallCaps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_prefix, "setFont:", v9);

    }
    else
    {
      -[UILabel setFont:](self->_prefix, "setFont:", self->_font);
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_prefix, "setBackgroundColor:", v11);

    -[UILabel textColor](self->_label, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_prefix, "setTextColor:", v12);

    -[UILabel setTextAlignment:](self->_prefix, "setTextAlignment:", 0);
    -[NTKTimeIntervalLabel addSubview:](self, "addSubview:", self->_prefix);
    prefix = self->_prefix;
  }
  -[UILabel text](prefix, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v16, "isEqual:", v13);

  v15 = v16;
  if ((v14 & 1) == 0)
  {
    -[UILabel setText:](self->_prefix, "setText:", v16);
    -[UILabel sizeToFit](self->_prefix, "sizeToFit");
    goto LABEL_10;
  }
LABEL_11:

}

- (NSString)prefix
{
  return -[UILabel text](self->_prefix, "text");
}

- (void)forceTime:(double)a3
{
  NSString *v4;
  NSString *text;
  double time;
  double v7;
  signed int v8;
  int v9;
  double v10;
  signed int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  self->_time = a3;
  -[NTKTimeIntervalLabel getTimeText](self, "getTimeText");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v4;

  if (-[NTKTimeIntervalLabel shouldShowDigits](self, "shouldShowDigits"))
  {
    -[NTKTimeIntervalLabel createDigitViews](self, "createDigitViews");
    time = self->_time;
    if (time >= 0.0)
      v7 = self->_time;
    else
      v7 = -time;
    v8 = vcvtmd_s64_f64(v7 / 60.0);
    v9 = v8 % 60;
    if (-[NTKTimeIntervalLabel showSubSeconds](self, "showSubSeconds"))
    {
      v10 = v7 - (double)((int)(v7 - (double)(60 * v8)) + 60 * v9);
      v11 = llround(v10 * 10.0);
      v9 = llround(v10 * 100.0);
    }
    else
    {
      v11 = (((103 * (char)v9) >> 15) & 1) + ((103 * (char)v9) >> 10);
    }
    v14 = v11 % 10;
    v15 = v9 % 10;
    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKTimeIntervalLabel _localImageForDigit:](self, "_localImageForDigit:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17)
      objc_msgSend(v13, "setImage:", v16);
    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKTimeIntervalLabel _localImageForDigit:](self, "_localImageForDigit:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 != v20)
      objc_msgSend(v18, "setImage:", v19);
    objc_msgSend(v13, "setHidden:", 0);
    objc_msgSend(v18, "setHidden:", 0);
    -[NSString substringWithRange:](self->_text, "substringWithRange:", 0, -[NSString length](self->_text, "length") - 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKTimeIntervalLabel setLabelText:](self, "setLabelText:", v21);

  }
  else
  {
    -[NTKTimeIntervalLabel setLabelText:](self, "setLabelText:", self->_text);
    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);
  }

  -[NTKTimeIntervalLabel sizeToFitLabelIfNeeded](self, "sizeToFitLabelIfNeeded");
}

- (void)sizeToFitLabelIfNeeded
{
  _BOOL4 isShowingDigits;
  void (**didResizeHandler)(void);

  isShowingDigits = self->_isShowingDigits;
  if (isShowingDigits != -[NTKTimeIntervalLabel shouldShowDigits](self, "shouldShowDigits") || !self->_labelWasSized)
  {
    self->_isShowingDigits = -[NTKTimeIntervalLabel shouldShowDigits](self, "shouldShowDigits");
    self->_labelWasSized = 1;
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    didResizeHandler = (void (**)(void))self->_didResizeHandler;
    if (didResizeHandler)
      didResizeHandler[2]();
  }
}

- (void)setFrozen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->_frozen != a3)
  {
    v3 = a3;
    self->_frozen = a3;
    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    -[NSMutableArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

    -[NTKTimeIntervalLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)recalculateSize
{
  -[NTKTimeIntervalLabel calculateMetrics](self, "calculateMetrics");
  -[NTKTimeIntervalLabel sizeToFit](self, "sizeToFit");
  -[NTKTimeIntervalLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLabelText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  id v12;

  v12 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NTKEqualStrings(v12, v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel text](self->_label, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    v8 = objc_msgSend(v12, "length");

    if (v7 != v8)
      -[NTKTimeIntervalLabel recalculateSize](self, "recalculateSize");
    if (self->_isSigned)
    {
      -[UILabel text](self->_label, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "characterAtIndex:", 0);
      v11 = objc_msgSend(v12, "characterAtIndex:", 0);

      if (v10 != v11)
        -[NTKTimeIntervalLabel recalculateSize](self, "recalculateSize");
    }
    -[UILabel setText:](self->_label, "setText:", v12);
  }

}

- (void)setTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel textColor](self->_label, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setTextColor:](self->_label, "setTextColor:", v6);
    -[NTKTimeIntervalLabel _invalidateDigitImages](self, "_invalidateDigitImages");
  }

}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[UILabel setFont:](self->_label, "setFont:", v5);
  }

}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (void)_invalidateDigitImages
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *digits;
  NSMutableDictionary *images;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_digits;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  digits = self->_digits;
  self->_digits = 0;

  images = self->_images;
  self->_images = 0;

}

- (id)_cachedImageForDigit:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UILabel textColor](self->_label, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKFont pointSize](self->_font, "pointSize");
  _cacheKeyString(a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ImageCache(self->_device);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%tu"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithFont:border:color:cropped:", self->_font, 0, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ImageCache(self->_device);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:forKey:", v9, v7);

  }
  return v9;
}

- (double)time
{
  return self->_time;
}

- (BOOL)suffixSmallCaps
{
  return self->_suffixSmallCaps;
}

- (void)setSuffixSmallCaps:(BOOL)a3
{
  self->_suffixSmallCaps = a3;
}

- (CLKFont)font
{
  return self->_font;
}

- (BOOL)showSubSeconds
{
  return self->_showSubSeconds;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (CGSize)textSize
{
  double width;
  double height;
  CGSize result;

  width = self->_textSize.width;
  height = self->_textSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)didResizeHandler
{
  return self->_didResizeHandler;
}

- (void)setDidResizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didResizeHandler, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
