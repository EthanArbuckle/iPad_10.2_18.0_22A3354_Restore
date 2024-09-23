@implementation CSProminentSubtitleDateView

- (id)_dateString
{
  void *v3;
  NSDateFormatter *v4;
  NSDateFormatter *formatter;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDateFormatter *v12;
  NSDateFormatter *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_formatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatter = self->_formatter;
    self->_formatter = v4;

    -[NSDateFormatter setLocale:](self->_formatter, "setLocale:", v3);
    -[NSDateFormatter setFormattingContext:](self->_formatter, "setFormattingContext:", 2);
  }
  if (self->_alternateCalendarIdentifier
    || -[CSProminentSubtitleDateView _wantsCompactForOrientation](self, "_wantsCompactForOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEE MMM d"), 0, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CSFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DATE_FORMAT_CHARACTERS_TO_OMIT"), &stru_1E55EB4F0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", &stru_1E55EB4F0);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
    }
    -[NSDateFormatter setDateFormat:](self->_formatter, "setDateFormat:", v6);

  }
  else
  {
    v12 = self->_formatter;
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEEMMMMd"), 0, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", v6);
  }

  v13 = self->_formatter;
  -[CSProminentTextElementView date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  v7.super_class = (Class)CSProminentSubtitleDateView;
  -[CSProminentTextElementView setDate:](&v7, sel_setDate_, v4);
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
    -[CSProminentSubtitleDateView _updateLabel](self, "_updateLabel");

}

- (BOOL)_wantsCompactForOrientation
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceClass");

  if (v4 == 2)
    return 0;
  -[CSProminentSubtitleDateView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)(objc_msgSend(v6, "interfaceOrientation") - 3) < 2;

  return v5;
}

- (void)_updateLabel
{
  void *v3;
  void *v4;

  -[CSProminentTextElementView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentSubtitleDateView overrideString](self, "overrideString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[CSProminentSubtitleDateView setNeedsLayout](self, "setNeedsLayout");
}

- (id)overrideString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[CSProminentTextElementView date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSProminentSubtitleDateView _dateString](self, "_dateString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSProminentSubtitleDateView _alternateDateString](self, "_alternateDateString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ · %@"), v4, v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v7 = v6;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSProminentSubtitleDateView;
    -[CSProminentTextElementView overrideString](&v9, sel_overrideString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_alternateDateString
{
  void *v3;
  void *v4;
  void *v5;
  NSDateFormatter *alternateDateFormatter;
  NSDateFormatter *v7;
  NSDateFormatter *v8;
  NSDateFormatter *v9;
  void *v10;
  void *v11;

  -[CSProminentSubtitleDateView alternateCalendarIdentifier](self, "alternateCalendarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSProminentSubtitleDateView alternateCalendarLocale](self, "alternateCalendarLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v3);
      if (v5)
      {
        alternateDateFormatter = self->_alternateDateFormatter;
        if (!alternateDateFormatter)
        {
          v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
          v8 = self->_alternateDateFormatter;
          self->_alternateDateFormatter = v7;

          alternateDateFormatter = self->_alternateDateFormatter;
        }
        -[NSDateFormatter setCalendar:](alternateDateFormatter, "setCalendar:", v5);
        -[NSDateFormatter setLocale:](self->_alternateDateFormatter, "setLocale:", v4);
        -[NSDateFormatter setDateStyle:](self->_alternateDateFormatter, "setDateStyle:", 2);
        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_alternateDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("UMMMd"));
        v9 = self->_alternateDateFormatter;
        -[CSProminentTextElementView date](self, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)alternateCalendarIdentifier
{
  return self->_alternateCalendarIdentifier;
}

- (CSProminentSubtitleDateView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CSProminentSubtitleDateView *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  objc_super v26;

  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "elementType");
  +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", v9, 0);
  v11 = v10;
  +[CSProminentLayoutController fontWeightForElementType:](CSProminentLayoutController, "fontWeightForElementType:", v9);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)CSProminentSubtitleDateView;
  v14 = -[CSProminentTextElementView initWithDate:font:textColor:](&v26, sel_initWithDate_font_textColor_, v8, v13, v7);

  if (v14)
  {
    -[CSProminentTextElementView textLabel](v14, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v17 = v15;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);
    v20 = *MEMORY[0x1E0DC48C8];
    objc_msgSend(v19, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48C8]);
    objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

    -[CSProminentTextElementView textLabel](v14, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CSProminentTextElementView textLabel](v14, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(v23, "setMaximumContentSizeCategory:", v20);
      objc_msgSend(v23, "setAdjustsFontSizeToFitWidth:", 1);

    }
    -[CSProminentTextElementView textLabel](v14, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMinimumScaleFactor:", 15.0 / v11);

    -[CSProminentSubtitleDateView _updateLabel](v14, "_updateLabel");
  }

  return v14;
}

- (CSProminentSubtitleDateView)initWithDate:(id)a3 textColor:(id)a4
{
  return -[CSProminentSubtitleDateView initWithDate:font:textColor:](self, "initWithDate:font:textColor:", a3, 0, a4);
}

+ (unint64_t)elementType
{
  return 2;
}

- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (*(_OWORD *)&self->_alternateCalendarIdentifier != __PAIR128__((unint64_t)v7, (unint64_t)v8))
  {
    objc_storeStrong((id *)&self->_alternateCalendarIdentifier, a3);
    objc_storeStrong((id *)&self->_alternateCalendarLocale, a4);
    -[CSProminentSubtitleDateView _updateLabel](self, "_updateLabel");
  }

}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (NSDateFormatter)alternateDateFormatter
{
  return self->_alternateDateFormatter;
}

- (void)setAlternateDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDateFormatter, a3);
}

- (void)setAlternateCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSLocale)alternateCalendarLocale
{
  return self->_alternateCalendarLocale;
}

- (void)setAlternateCalendarLocale:(id)a3
{
  objc_storeStrong((id *)&self->_alternateCalendarLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCalendarLocale, 0);
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateDateFormatter, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
