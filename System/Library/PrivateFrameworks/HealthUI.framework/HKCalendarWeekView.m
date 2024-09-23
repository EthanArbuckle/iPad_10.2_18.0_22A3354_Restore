@implementation HKCalendarWeekView

- (HKCalendarWeekView)initWithDateCache:(id)a3
{
  id v5;
  HKCalendarWeekView *v6;
  uint64_t v7;
  NSMutableArray *dayCells;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKCalendarWeekView;
  v6 = -[HKCalendarWeekView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    dayCells = v6->_dayCells;
    v6->_dayCells = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_dateCache, a3);
    if (-[HKCalendarWeekView cellClass](v6, "cellClass"))
    {
      for (i = *MEMORY[0x1E0CB4B98]; i; --i)
      {
        v10 = (void *)objc_msgSend(objc_alloc(-[HKCalendarWeekView cellClass](v6, "cellClass")), "initWithDateCache:", v5);
        -[HKCalendarWeekView layer](v6, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSublayer:", v10);

        -[NSMutableArray addObject:](v6->_dayCells, "addObject:", v10);
      }
    }
    v12 = objc_alloc_init(-[HKCalendarWeekView monthTitleClass](v6, "monthTitleClass"));
    -[HKCalendarWeekView setMonthTitleView:](v6, "setMonthTitleView:", v12);

    -[HKCalendarWeekView monthTitleView](v6, "monthTitleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    -[HKCalendarWeekView monthTitleView](v6, "monthTitleView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarWeekView addSubview:](v6, "addSubview:", v14);

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKCalendarWeekView;
  -[HKCalendarWeekView description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_dayCells, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray lastObject](self->_dayCells, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(v5, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  objc_msgSend(v3, "appendFormat:", CFSTR("; dates: %@ – %@>"), v8, v11);

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[HKCalendarWeekView preferredHeight](self, "preferredHeight", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setMonthWeekStart:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  int IsRightToLeft;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDate *monthWeekStart;
  id v15;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startOfDayForDate:", v5);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

  self->_firstDayOfMonthCellIndex = -1;
  if (-[HKCalendarWeekView supportsRTL](self, "supportsRTL"))
    IsRightToLeft = HKUICalendarLocaleIsRightToLeft();
  else
    IsRightToLeft = 0;
  if (-[NSMutableArray count](self->_dayCells, "count"))
  {
    v8 = 0;
    v9 = -1;
    do
    {
      v10 = v8;
      if (IsRightToLeft)
        v10 = -[NSMutableArray count](self->_dayCells, "count") + v9;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dayCells, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, v8, v6, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "component:fromDate:", 16, v12);
      if (v13 == 1)
      {
        self->_firstDayOfMonthCellIndex = v10;
        -[HKCalendarMonthTitleFormatting setDate:](self->_monthTitleView, "setDate:", v12);
      }
      objc_msgSend(v11, "updateWithDate:dayOfMonth:", v12, v13);

      ++v8;
      --v9;
    }
    while (v8 < -[NSMutableArray count](self->_dayCells, "count"));
  }
  -[HKCalendarMonthTitleFormatting setHidden:](self->_monthTitleView, "setHidden:", -[HKCalendarWeekView containsMonthTitle](self, "containsMonthTitle") ^ 1);
  -[HKCalendarWeekView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  monthWeekStart = self->_monthWeekStart;
  self->_monthWeekStart = v6;

}

- (void)reloadCells
{
  if (self->_monthWeekStart)
    -[HKCalendarWeekView setMonthWeekStart:](self, "setMonthWeekStart:");
}

- (double)preferredHeight
{
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  HKCalendarMonthTitleFormatting *monthTitleView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v3 = 1.0;
  if (-[HKCalendarWeekView containsMonthTitle](self, "containsMonthTitle"))
  {
    if (-[HKCalendarWeekView supportsRTL](self, "supportsRTL") && HKUICalendarLocaleIsRightToLeft())
      v4 = self->_firstDayOfMonthCellIndex < (unint64_t)(*MEMORY[0x1E0CB4B98] - 1);
    else
      v4 = self->_firstDayOfMonthCellIndex > 0;
    if (v4)
      v3 = 2.0;
    else
      v3 = 1.0;
  }
  -[HKCalendarWeekView dateTopMargin](self, "dateTopMargin");
  v6 = v5;
  -[HKCalendarWeekView dateDiameter](self, "dateDiameter");
  v8 = v6 + v7;
  -[HKCalendarWeekView dateBottomMargin](self, "dateBottomMargin");
  v10 = v8 + v9;
  -[HKCalendarWeekView additionalSpacingPerRow](self, "additionalSpacingPerRow");
  v12 = v3 * (v10 + v11);
  if (-[HKCalendarWeekView containsMonthTitle](self, "containsMonthTitle"))
  {
    monthTitleView = self->_monthTitleView;
    -[HKCalendarWeekView bounds](self, "bounds");
    -[HKCalendarMonthTitleFormatting sizeThatFits:](monthTitleView, "sizeThatFits:", v14, v15);
    v17 = v16;
    -[HKCalendarWeekView monthTitleTopMargin](self, "monthTitleTopMargin");
    v19 = v18;
    -[HKCalendarWeekView monthTitleBottomMargin](self, "monthTitleBottomMargin");
    v12 = v12 + v17 + v19 + v20;
    if (!self->_firstDayOfMonthCellIndex)
    {
      -[HKCalendarWeekView dateTopMargin](self, "dateTopMargin");
      return v12 + v21;
    }
  }
  return v12;
}

- (BOOL)containsMonthTitle
{
  return self->_firstDayOfMonthCellIndex != -1;
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v15;
  double v16;

  v4 = a3;
  -[HKCalendarWeekView currentWeekStartDate](self, "currentWeekStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    v16 = 0.0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    -[HKCalendarWeekView currentWeekStartDate](self, "currentWeekStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 4096, &v15, &v16, v8);
    v10 = v15;

    if (v9)
    {
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      v12 = v11;
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v6 = v12 < v13 + v16 && v12 >= v13;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (CGRect)frameForDayCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect result;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HKCalendarWeekView containsDate:](self, "containsDate:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_dayCells;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v12, "date", (_QWORD)v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "components:fromDate:", 30, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v6, "isEqual:", v14) & 1) != 0)
          {
            objc_msgSend(v12, "frame");
            v15 = v19;
            v16 = v20;
            v17 = v21;
            v18 = v22;

            goto LABEL_13;
          }

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_13:

  v23 = v15;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)currentWeekStartDate
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HKCalendarWeekView supportsRTL](self, "supportsRTL") && HKUICalendarLocaleIsRightToLeft())
  {
    -[NSMutableArray lastObject](self->_dayCells, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray firstObject](self->_dayCells, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousWeekStartDate
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarWeekView currentWeekStartDate](self, "currentWeekStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextWeekStartDate
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarWeekView currentWeekStartDate](self, "currentWeekStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  HKCalendarDayCell *v5;
  HKCalendarDayCell *pressedDayCell;
  HKCalendarDayCell *v7;

  -[HKCalendarWeekView _getDayCellWithTouches:](self, "_getDayCellWithTouches:", a3, a4);
  v5 = (HKCalendarDayCell *)objc_claimAutoreleasedReturnValue();
  pressedDayCell = self->_pressedDayCell;
  self->_pressedDayCell = v5;

  v7 = self->_pressedDayCell;
  if (v7)
    -[HKCalendarWeekView pressedOnCalendarDay:cell:down:](self, "pressedOnCalendarDay:cell:down:", self->_pressedDayOfWeek, v7, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  HKCalendarDayCell *pressedDayCell;

  pressedDayCell = self->_pressedDayCell;
  if (pressedDayCell)
    -[HKCalendarWeekView selectedCalendarDay:](self, "selectedCalendarDay:", pressedDayCell, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  HKCalendarDayCell *v5;
  HKCalendarDayCell *pressedDayCell;
  HKCalendarDayCell *v7;

  if (self->_pressedDayCell)
  {
    -[HKCalendarWeekView _getDayCellWithTouches:](self, "_getDayCellWithTouches:", a3, a4);
    v5 = (HKCalendarDayCell *)objc_claimAutoreleasedReturnValue();
    pressedDayCell = self->_pressedDayCell;
    if (pressedDayCell != v5)
    {
      v7 = v5;
      -[HKCalendarWeekView pressedOnCalendarDay:cell:down:](self, "pressedOnCalendarDay:cell:down:", self->_pressedDayOfWeek, pressedDayCell, 0);
      v5 = v7;
    }

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  HKCalendarDayCell *pressedDayCell;

  pressedDayCell = self->_pressedDayCell;
  if (pressedDayCell)
    -[HKCalendarWeekView pressedOnCalendarDay:cell:down:](self, "pressedOnCalendarDay:cell:down:", self->_pressedDayOfWeek, pressedDayCell, 0);
}

- (id)_getDayCellWithTouches:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", self);
  -[HKCalendarWeekView _getDayCellWithTouchLocation:](self, "_getDayCellWithTouchLocation:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getDayCellWithTouchLocation:(CGPoint)a3
{
  CGFloat y;
  double x;
  double v6;
  double v7;
  uint64_t v8;
  int64_t v9;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  -[HKCalendarWeekView frame](self, "frame");
  v7 = floor(v6 / (double)(unint64_t)*MEMORY[0x1E0CB4B98]);
  v8 = vcvtpd_s64_f64(x / v7);
  v9 = v8 - 1;
  if (v8 < 1 || (unint64_t)v9 >= *MEMORY[0x1E0CB4B98])
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_dayCells, "objectAtIndexedSubscript:", v8 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarWeekView dateTopMargin](self, "dateTopMargin");
    v14 = v13;
    objc_msgSend(v12, "frame");
    v16 = v14 + v15;
    -[HKCalendarWeekView dateBottomMargin](self, "dateBottomMargin");
    v18 = v17 + v16;
    -[HKCalendarWeekView additionalSpacingPerRow](self, "additionalSpacingPerRow");
    v20 = v19 + v18;
    objc_msgSend(v12, "frame");
    v22 = v21;
    -[HKCalendarWeekView dateTopMargin](self, "dateTopMargin");
    v27.origin.y = v22 - v23;
    v27.origin.x = v7 * (double)v9;
    v27.size.width = v7;
    v27.size.height = v20;
    v26.x = x;
    v26.y = y;
    if (CGRectContainsPoint(v27, v26))
    {
      self->_pressedDayOfWeek = v9;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dayCells, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)supportsRTL
{
  return 0;
}

- (HKCalendarMonthTitleFormatting)monthTitleView
{
  return self->_monthTitleView;
}

- (void)setMonthTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_monthTitleView, a3);
}

- (double)dateTopMargin
{
  return self->_dateTopMargin;
}

- (void)setDateTopMargin:(double)a3
{
  self->_dateTopMargin = a3;
}

- (double)dateBottomMargin
{
  return self->_dateBottomMargin;
}

- (void)setDateBottomMargin:(double)a3
{
  self->_dateBottomMargin = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)monthTitleTopMargin
{
  return self->_monthTitleTopMargin;
}

- (void)setMonthTitleTopMargin:(double)a3
{
  self->_monthTitleTopMargin = a3;
}

- (double)monthTitleBottomMargin
{
  return self->_monthTitleBottomMargin;
}

- (void)setMonthTitleBottomMargin:(double)a3
{
  self->_monthTitleBottomMargin = a3;
}

- (double)dateDiameter
{
  return self->_dateDiameter;
}

- (void)setDateDiameter:(double)a3
{
  self->_dateDiameter = a3;
}

- (double)additionalSpacingPerRow
{
  return self->_additionalSpacingPerRow;
}

- (void)setAdditionalSpacingPerRow:(double)a3
{
  self->_additionalSpacingPerRow = a3;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (NSDate)monthWeekStart
{
  return self->_monthWeekStart;
}

- (HKCalendarWeekViewDelegate)delegate
{
  return (HKCalendarWeekViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)dayCells
{
  return &self->_dayCells->super;
}

- (int64_t)firstDayOfMonthCellIndex
{
  return self->_firstDayOfMonthCellIndex;
}

- (void)setFirstDayOfMonthCellIndex:(int64_t)a3
{
  self->_firstDayOfMonthCellIndex = a3;
}

- (int64_t)pressedDayOfWeek
{
  return self->_pressedDayOfWeek;
}

- (void)setPressedDayOfWeek:(int64_t)a3
{
  self->_pressedDayOfWeek = a3;
}

- (HKCalendarDayCell)pressedDayCell
{
  return self->_pressedDayCell;
}

- (void)setPressedDayCell:(id)a3
{
  objc_storeStrong((id *)&self->_pressedDayCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedDayCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monthWeekStart, 0);
  objc_storeStrong((id *)&self->_monthTitleView, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_dayCells, 0);
}

- (void)selectedCalendarDay:(id)a3
{
  OUTLINED_FUNCTION_0_9();
  NSRequestConcreteImplementation();
}

- (Class)cellClass
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

- (Class)monthTitleClass
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return 0;
}

@end
