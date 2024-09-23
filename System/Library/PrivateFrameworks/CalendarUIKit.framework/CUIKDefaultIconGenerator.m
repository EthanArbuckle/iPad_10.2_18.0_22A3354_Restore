@implementation CUIKDefaultIconGenerator

- (CUIKDefaultIconGenerator)initWithForceNoTextEffects:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUIKDefaultIconGenerator;
  return -[CUIKDefaultIconGenerator init](&v4, sel_init, a3);
}

- (CGImage)iconImageWithDateComponents:(id)a3 calendar:(id)a4 format:(int64_t)a5 size:(CGSize)a6 scale:(double)a7 appearance:(int64_t)a8
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  CGImage *v21;
  CGImage *v22;
  NSObject *v23;
  _QWORD v25[5];

  height = a6.height;
  width = a6.width;
  v16 = a3;
  v17 = a4;
  self->_canvasSize.width = width;
  self->_canvasSize.height = height;
  self->_canvasScale = a7;
  self->_iconFormat = a5;
  self->_appearance = a8;
  if (!v16)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CUIKDefaultIconGenerator iconImageWithDateComponents:calendar:format:size:scale:appearance:].cold.1();
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_dateComponents, a3);
  if (!v17)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CUIKDefaultIconGenerator iconImageWithDateComponents:calendar:format:size:scale:appearance:].cold.2();
LABEL_10:

    v22 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_calendar, a4);
  v18 = objc_alloc_init(MEMORY[0x1E0DC3830]);
  objc_msgSend(v18, "setScale:", a7);
  objc_msgSend(v18, "setOpaque:", 1);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:format:", v18, 0.0, 0.0, width, height);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __94__CUIKDefaultIconGenerator_iconImageWithDateComponents_calendar_format_size_scale_appearance___block_invoke;
  v25[3] = &unk_1E6EB7650;
  v25[4] = self;
  objc_msgSend(v19, "imageWithActions:", v25);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (CGImage *)objc_msgSend(v20, "CGImage");
  v22 = v21;
  if (v21)
    CFRetain(v21);

LABEL_11:
  return v22;
}

uint64_t __94__CUIKDefaultIconGenerator_iconImageWithDateComponents_calendar_format_size_scale_appearance___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_drawBackground");
  objc_msgSend(*(id *)(a1 + 32), "_drawDayNumber");
  return objc_msgSend(*(id *)(a1 + 32), "_drawDateName");
}

- (void)_drawBackground
{
  CGContext *CurrentContext;
  CGFloat height;
  CGFloat width;
  int64_t appearance;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  const __CFArray *v12;
  CGGradient *v13;
  CGFloat MinY;
  _QWORD v15[3];
  CGPoint v16;
  CGPoint v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v15[2] = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  appearance = self->_appearance;
  if (appearance == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.192156863, 0.192156863, 0.192156863, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0784313725, 0.0784313725, 0.0784313725, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v8);
    v15[0] = objc_msgSend(v10, "CGColor");
    v11 = objc_retainAutorelease(v9);
    v15[1] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v13 = CGGradientCreateWithColors(0, v12, 0);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = width;
    v19.size.height = height;
    MinY = CGRectGetMinY(v19);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = width;
    v20.size.height = height;
    v17.y = CGRectGetMaxY(v20);
    v16.x = 0.0;
    v17.x = 0.0;
    v16.y = MinY;
    CGContextDrawLinearGradient(CurrentContext, v13, v16, v17, 0);
    CGGradientRelease(v13);

  }
  else if (!appearance)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFill");

    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = width;
    v18.size.height = height;
    CGContextFillRect(CurrentContext, v18);
  }
}

+ (id)_dayNumberStringFromDateComponents:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CUIKDefaultIconGenerator _dayNumberStringFromDateComponents:calendar:].cold.1();

    v8 = 0;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v6, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    v11 = objc_msgSend(v5, "day");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromNumber:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_drawDayNumber
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Day number string is nil or empty from date components: %@, calendar: %@.", (uint8_t *)&v6, 0x16u);

}

+ (id)_dateNameFromDateComponents:(id)a3 calendar:(id)a4 type:(int64_t)a5 forceAbbreviated:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  +[CUIKApplicationIconUtilities dateFormatterWithCalendar:](CUIKApplicationIconUtilities, "dateFormatterWithCalendar:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFormattingContext:", 2);
  if (a5 != 1)
  {
    if (objc_msgSend(v9, "weekday") == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[CUIKDefaultIconGenerator _dateNameFromDateComponents:calendar:type:forceAbbreviated:].cold.2();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ccc"), &stru_1E6EBAE30, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ccc")) & 1) != 0 || v6)
    {
      objc_msgSend(v11, "shortStandaloneWeekdaySymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "standaloneWeekdaySymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v18;
    objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v9, "weekday") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("icon_weekday_force_uppercase"), CFSTR("1"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isEqualToString:", CFSTR("1")))
    {
      objc_msgSend(v10, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uppercaseStringWithLocale:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v21;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(v9, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "shortStandaloneMonthSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v9, "month") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uppercaseStringWithLocale:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[CUIKDefaultIconGenerator _dateNameFromDateComponents:calendar:type:forceAbbreviated:].cold.1();
LABEL_8:

  v13 = 0;
LABEL_17:

  return v13;
}

- (void)_drawDateName
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "iconFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Date name string is nil or empty from date components: %@, calendar: %@, type: %@", (uint8_t *)&v7, 0x20u);

}

- (double)_roundSpecToActual:(double)a3
{
  double v4;

  -[CUIKDefaultIconGenerator canvasSize](self, "canvasSize");
  return v4 * 0.0009765625 * a3;
}

- (id)_dateNameFont
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[CUIKDefaultIconGenerator _roundSpecToActual:](self, "_roundSpecToActual:", 200.0);
  return (id)objc_msgSend(v2, "systemFontOfSize:weight:");
}

- (id)_dayNumberFont
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[CUIKDefaultIconGenerator _roundSpecToActual:](self, "_roundSpecToActual:", 642.0);
  return (id)objc_msgSend(v2, "systemFontOfSize:weight:");
}

- (id)_iconBlackColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
}

- (id)_colorForDayOfWeekWithAppearance:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[CUIKDefaultIconGenerator calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend((id)objc_opt_class(), "_isNonRedDayOfWeekRequiredForLocale:", v6);
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.819607843, 0.819607843, 0.819607843, 1.0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v10 = (void *)MEMORY[0x1E0DC3658];
      goto LABEL_12;
    case 0:
      if (v7)
      {
        -[CUIKDefaultIconGenerator _iconBlackColor](self, "_iconBlackColor");
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v9 = (void *)v8;
        goto LABEL_14;
      }
      v10 = (void *)MEMORY[0x1E0DC3658];
LABEL_12:
      objc_msgSend(v10, "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)_colorForDayNumberWithAppearance:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v3 = 0;
    }
    else
    {
      -[CUIKDefaultIconGenerator _iconBlackColor](self, "_iconBlackColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_countriesRequiringNonRedDayOfWeek
{
  if (_countriesRequiringNonRedDayOfWeek_onceToken != -1)
    dispatch_once(&_countriesRequiringNonRedDayOfWeek_onceToken, &__block_literal_global_27);
  return (id)_countriesRequiringNonRedDayOfWeek_countries;
}

void __62__CUIKDefaultIconGenerator__countriesRequiringNonRedDayOfWeek__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("JP"), CFSTR("KR"), 0);
  v1 = (void *)_countriesRequiringNonRedDayOfWeek_countries;
  _countriesRequiringNonRedDayOfWeek_countries = v0;

}

+ (BOOL)_isNonRedDayOfWeekRequiredForLocale:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_countriesRequiringNonRedDayOfWeek");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (int64_t)iconFormat
{
  return self->_iconFormat;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)canvasScale
{
  return self->_canvasScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)iconImageWithDateComponents:calendar:format:size:scale:appearance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "Error: expects a nonnull dateComponents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)iconImageWithDateComponents:calendar:format:size:scale:appearance:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "Error: expects a nonnull calendar", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_dayNumberStringFromDateComponents:calendar:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "Error: dateComponents has not been provided a day value to generate dayNumberString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_dateNameFromDateComponents:calendar:type:forceAbbreviated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "Error: dateComponents has not been provided a month value to generate a string representation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_dateNameFromDateComponents:calendar:type:forceAbbreviated:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, v0, v1, "Error: dateComponents has not been provided a weekday value to generate a string representation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
