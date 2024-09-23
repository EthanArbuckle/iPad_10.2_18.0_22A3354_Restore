@implementation EKUIResizingDateLabel

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1000.0;
  v3 = 1000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)stringForDateThatFits
{
  double Width;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];
  CGRect v30;

  v29[1] = *MEMORY[0x1E0C80C00];
  -[EKUIResizingDateLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v30);
  -[EKUIResizingDateLabel date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKLongDayStringForDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DC1138];
  v28 = *MEMORY[0x1E0DC1138];
  -[EKUIResizingDateLabel font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v8);
  v10 = v9;

  if (v10 > Width)
  {
    -[EKUIResizingDateLabel date](self, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v6;
    -[EKUIResizingDateLabel font](self, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeWithAttributes:", v14);
    v16 = v15;

    if (v16 <= Width)
    {
LABEL_5:
      v5 = v12;
      return v5;
    }
    -[EKUIResizingDateLabel date](self, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKStringForDateWithCommaAndYear();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v6;
    -[EKUIResizingDateLabel font](self, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithAttributes:", v19);
    v21 = v20;

    if (v21 > Width)
    {
      -[EKUIResizingDateLabel date](self, "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKShortStringForDay();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
  return v5;
}

- (double)minDateLabelWidth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[EKUIResizingDateLabel date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKShortStringForDay();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0DC1138];
  -[EKUIResizingDateLabel font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithAttributes:", v6);
  v8 = v7;

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIResizingDateLabel;
  -[EKUIResizingDateLabel layoutSubviews](&v4, sel_layoutSubviews);
  -[EKUIResizingDateLabel stringForDateThatFits](self, "stringForDateThatFits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIResizingDateLabel setText:](self, "setText:", v3);

}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 808, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
