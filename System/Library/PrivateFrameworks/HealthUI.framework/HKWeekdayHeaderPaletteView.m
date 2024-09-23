@implementation HKWeekdayHeaderPaletteView

- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3
{
  return -[HKWeekdayHeaderPaletteView initWithFrame:shouldSupportRTL:](self, "initWithFrame:shouldSupportRTL:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HKWeekdayHeaderPaletteView)initWithFrame:(CGRect)a3 shouldSupportRTL:(BOOL)a4
{
  _BOOL4 v4;
  HKWeekdayHeaderPaletteView *v5;
  NSMutableArray *v6;
  NSMutableArray *weekdayLabels;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  id v19;
  void *v20;
  objc_super v21;

  v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKWeekdayHeaderPaletteView;
  v5 = -[HKWeekdayHeaderPaletteView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    weekdayLabels = v5->_weekdayLabels;
    v5->_weekdayLabels = v6;

    -[HKWeekdayHeaderPaletteView setLayoutMargins:](v5, "setLayoutMargins:", 0.0, 5.0, 3.0, 5.0);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v19, "veryShortStandaloneWeekdaySymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "firstWeekday");
    v20 = v8;
    objc_msgSend(v8, "hk_weekendDays");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = -1; i != 6; ++i)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(v9, "objectAtIndexedSubscript:", (v10 + i) % 7);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v14);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (v10 + i) % 7 + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v11, "containsObject:", v15);

      if ((v14 & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextColor:", v16);

      objc_msgSend(v13, "sizeToFit");
      v17 = v5->_weekdayLabels;
      if (v4)
        -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v13, 0);
      else
        -[NSMutableArray addObject:](v17, "addObject:", v13);
      -[HKWeekdayHeaderPaletteView addSubview:](v5, "addSubview:", v13);

    }
    -[HKWeekdayHeaderPaletteView _updateFont](v5, "_updateFont");

  }
  return v5;
}

- (void)_updateFont
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_weekdayLabels;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend((id)objc_opt_class(), "weekdayFont", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFont:", v8);

        objc_msgSend(v7, "sizeToFit");
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)layoutSubviews
{
  uint64_t i;
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
  double v14;
  double v15;

  for (i = 0; i != 7; ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_weekdayLabels, "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    -[HKWeekdayHeaderPaletteView layoutMargins](self, "layoutMargins");
    -[HKWeekdayHeaderPaletteView _xOriginForMonthViewWithIndex:itemWidth:leftMargin:](self, "_xOriginForMonthViewWithIndex:itemWidth:leftMargin:", i, v6);
    v10 = v9;
    -[HKWeekdayHeaderPaletteView layoutMargins](self, "layoutMargins");
    v12 = v11;
    -[HKWeekdayHeaderPaletteView bounds](self, "bounds");
    v14 = v12 + v13 - v8;
    -[HKWeekdayHeaderPaletteView layoutMargins](self, "layoutMargins");
    objc_msgSend(v4, "setFrame:", v10, v14 - v15, v6, v8);

  }
}

- (double)_xOriginForMonthViewWithIndex:(int64_t)a3 itemWidth:(double)a4 leftMargin:(double)a5
{
  double result;

  -[HKWeekdayHeaderPaletteView bounds](self, "bounds");
  UIRoundToViewScale();
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (id)weekdayFont
{
  uint64_t v2;
  _BOOL4 IsLargerThanSizeCategory;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v2 = *MEMORY[0x1E0DC48D0];
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC48D0]);
  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A88];
  if (IsLargerThanSizeCategory)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", 10.0);
    v9 = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scaledValueForValue:", 10.0);
    v9 = v10;
  }

  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v9, *MEMORY[0x1E0DC1448]);
}

+ (double)preferredHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "weekdayFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  UIRoundToScale();
  v5 = v4;

  return fmax(v5, 17.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWeekdayHeaderPaletteView;
  -[HKWeekdayHeaderPaletteView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKWeekdayHeaderPaletteView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[HKWeekdayHeaderPaletteView _updateFont](self, "_updateFont");
      -[HKWeekdayHeaderPaletteView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdayLabels, 0);
}

@end
