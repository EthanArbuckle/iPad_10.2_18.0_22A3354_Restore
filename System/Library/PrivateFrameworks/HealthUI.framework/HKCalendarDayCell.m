@implementation HKCalendarDayCell

- (HKCalendarDayCell)initWithDateCache:(id)a3
{
  id v5;
  HKCalendarDayCell *v6;
  HKCalendarDayCell *v7;
  uint64_t v8;
  CALayer *circle;
  uint64_t v10;
  CALayer *dayLabel;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCalendarDayCell;
  v6 = -[HKCalendarDayCell init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateCache, a3);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    circle = v7->_circle;
    v7->_circle = (CALayer *)v8;

    -[CALayer setHidden:](v7->_circle, "setHidden:", 1);
    -[HKCalendarDayCell addSublayer:](v7, "addSublayer:", v7->_circle);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = objc_claimAutoreleasedReturnValue();
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = (CALayer *)v10;

    -[HKCalendarDayCell addSublayer:](v7, "addSublayer:", v7->_dayLabel);
  }

  return v7;
}

- (HKCalendarDayCell)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (void)clearImageCache
{
  void *v2;
  id v3;

  _BoldImageCache();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  _NormalImageCache();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (id)_integerNumberFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_integerNumberFormatter___integerNumberFormatter;
  if (!_integerNumberFormatter___integerNumberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = (void *)_integerNumberFormatter___integerNumberFormatter;
    _integerNumberFormatter___integerNumberFormatter = (uint64_t)v3;

    objc_msgSend((id)_integerNumberFormatter___integerNumberFormatter, "setRoundingMode:", 2);
    objc_msgSend((id)_integerNumberFormatter___integerNumberFormatter, "setMaximumFractionDigits:", 0);
    v2 = (void *)_integerNumberFormatter___integerNumberFormatter;
  }
  return v2;
}

- (id)_reusedImageForDateIndex:(int64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];
  CGSize v37;

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[HKCalendarDayCell isSelected](self, "isSelected"))
    _BoldImageCache();
  else
    _NormalImageCache();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKCalendarDayCellIconConfiguration configurationWithDateIndex:color:style:](_HKCalendarDayCellIconConfiguration, "configurationWithDateIndex:color:style:", a3, v9, objc_msgSend(v8, "userInterfaceStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[HKCalendarDayCell _integerNumberFormatter](self, "_integerNumberFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromNumber:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HKCalendarDayCell isSelected](self, "isSelected"))
      -[HKCalendarDayCell boldFont](self, "boldFont");
    else
      -[HKCalendarDayCell font](self, "font");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    v17 = v16;
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    v19 = v18;
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    v35 = *MEMORY[0x1E0DC1138];
    v21 = v35;
    v36[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithString:attributes:", v32, v22);

    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    objc_msgSend(v23, "boundingRectWithSize:options:context:", 0, 0);
    v37.width = v17;
    v37.height = v19;
    UIGraphicsBeginImageContextWithOptions(v37, 0, 0.0);
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    UIRoundToViewScale();
    v25 = v24;
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    UIRoundToViewScale();
    v27 = v26;
    v28 = *MEMORY[0x1E0DC1140];
    v33[0] = v21;
    v33[1] = v28;
    v34[0] = v31;
    v34[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "drawAtPoint:withAttributes:", v29, v25, v27);

    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v7, "setObject:forKey:", v13, v10);

  }
  return v13;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  NSDate *v6;
  NSDate *date;
  NSDate *v8;

  v6 = (NSDate *)a3;
  -[HKCalendarDayCell setHidden:](self, "setHidden:", 0);
  date = self->_date;
  self->_date = v6;
  v8 = v6;

  self->_dayOfMonth = a4;
  LOBYTE(a4) = -[HKDateCache isDateInToday:](self->_dateCache, "isDateInToday:", v8);

  self->_representsToday = a4;
}

- (void)updateDateTextForDayNumber:(int64_t)a3 textColor:(id)a4
{
  void *v5;
  CALayer *dayLabel;
  id v7;

  -[HKCalendarDayCell _reusedImageForDateIndex:color:](self, "_reusedImageForDateIndex:color:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dayLabel = self->_dayLabel;
  v7 = objc_retainAutorelease(v5);
  -[CALayer setContents:](dayLabel, "setContents:", objc_msgSend(v7, "CGImage"));

}

- (void)setDayDiameter:(double)a3
{
  self->_dayDiameter = a3;
  -[HKCalendarDayCell layoutOnce](self, "layoutOnce");
}

- (void)layoutOnce
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 IsLargerThanSizeCategory;
  CALayer *circle;
  double v10;

  -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
  v4 = v3;
  v5 = v3 + -1.0;
  -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
  UIRoundToViewScale();
  v7 = v6;
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC4918]);
  circle = self->_circle;
  if (IsLargerThanSizeCategory)
    -[HKCalendarDayCell _roundedRectCornerRadius](self, "_roundedRectCornerRadius");
  else
    v10 = v5 * 0.5;
  -[CALayer setCornerRadius:](circle, "setCornerRadius:", v10);
  -[CALayer setFrame:](self->_circle, "setFrame:", 0.0, 0.0, v4 + -1.0, v4 + -1.0);
  -[CALayer setPosition:](self->_circle, "setPosition:", v7, v7);
  -[CALayer setFrame:](self->_dayLabel, "setFrame:", 0.0, 0.0, v4, v4);
}

- (double)_roundedRectCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  UIRoundToScale();
  v4 = v3;

  return v4;
}

- (CGSize)circleSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC4918]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKCalendarDayCell dayOfMonth](self, "dayOfMonth"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarDayCell _roundedRectSizeForDayNumberString:](self, "_roundedRectSizeForDayNumberString:", v4);
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    v12 = v11 + -1.0;
    -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
    v10 = v13 + -1.0;
    v9 = v12;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_roundedRectSizeForDayNumberString:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];
  CGSize result;

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
  v6 = v5 + -1.0;
  -[HKCalendarDayCell dayDiameter](self, "dayDiameter");
  v8 = v7;
  v16 = *MEMORY[0x1E0DC1138];
  -[HKCalendarDayCell boldFont](self, "boldFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithAttributes:", v10);
  v12 = v11;

  v13 = v12 + 4.0;
  if (v6 >= v13)
    v14 = v6;
  else
    v14 = v13;
  v15 = v8 + -1.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  id v7;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    v5 = !a3;
    -[HKCalendarDayCell circle](self, "circle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      -[HKCalendarDayCell textColor](self, "textColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HKCalendarDayCell updateDateTextForDayNumber:textColor:](self, "updateDateTextForDayNumber:textColor:", -[HKCalendarDayCell dayOfMonth](self, "dayOfMonth"), v7);

  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKCalendarDayCell;
  -[HKCalendarDayCell debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3578];
  -[HKCalendarDayCell date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  objc_msgSend(v3, "appendFormat:", CFSTR("date: %@; > "), v6);

  return v3;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (CALayer)circle
{
  return self->_circle;
}

- (CALayer)dayLabel
{
  return self->_dayLabel;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIFont)boldFont
{
  return self->_boldFont;
}

- (void)setBoldFont:(id)a3
{
  objc_storeStrong((id *)&self->_boldFont, a3);
}

- (double)dayDiameter
{
  return self->_dayDiameter;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)dayOfMonth
{
  return self->_dayOfMonth;
}

- (BOOL)representsToday
{
  return self->_representsToday;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
}

@end
