@implementation HKCalendarScrollViewController

- (HKCalendarScrollViewController)initWithSelectedDate:(id)a3
{
  id v5;
  HKCalendarScrollViewController *v6;
  HKCalendarScrollViewController *v7;
  uint64_t v8;
  NSCalendar *calendar;
  uint64_t v10;
  NSMutableArray *weekViews;
  HKDateCache *v12;
  void *v13;
  uint64_t v14;
  HKDateCache *dateCache;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKCalendarScrollViewController;
  v6 = -[HKCalendarScrollViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_numberOfRows = 32;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = objc_claimAutoreleasedReturnValue();
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7->_numberOfRows);
    weekViews = v7->_weekViews;
    v7->_weekViews = (NSMutableArray *)v10;

    v7->_needsInitialOffset = 1;
    v12 = [HKDateCache alloc];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKDateCache initWithCalendar:](v12, "initWithCalendar:", v13);
    dateCache = v7->_dateCache;
    v7->_dateCache = (HKDateCache *)v14;

    -[HKDateCache registerObserver:](v7->_dateCache, "registerObserver:", v7);
    v7->_topInset = 42.0;
    objc_storeStrong((id *)&v7->_initiallyCenteredDate, a3);
  }

  return v7;
}

- (HKCalendarScrollViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewController;
  return -[HKCalendarScrollViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[HKDateCache unregisterObserver:](self->_dateCache, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HKCalendarScrollViewController;
  -[HKCalendarScrollViewController dealloc](&v3, sel_dealloc);
}

- (UIScrollView)scrollView
{
  void *v4;
  char isKindOfClass;
  void *v7;

  -[HKCalendarScrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCalendarScrollViewController.m"), 59, CFSTR("Our view should be a UIScrollView. It's not and now I'm sad."));

  }
  return (UIScrollView *)-[HKCalendarScrollViewController view](self, "view");
}

- (void)_createWeekViews
{
  unint64_t v3;
  HKMonthWeekView *v4;
  void *v5;

  if (self->_numberOfRows)
  {
    v3 = 0;
    do
    {
      v4 = -[HKMonthWeekView initWithDateCache:displaysMonthTitle:displaysTopBorderLine:]([HKMonthWeekView alloc], "initWithDateCache:displaysMonthTitle:displaysTopBorderLine:", self->_dateCache, 1, 1);
      -[HKCalendarWeekView setDelegate:](v4, "setDelegate:", self);
      -[HKCalendarScrollViewController scrollView](self, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v4);

      -[NSMutableArray addObject:](self->_weekViews, "addObject:", v4);
      ++v3;
    }
    while (v3 < self->_numberOfRows);
  }
}

- (void)_refreshViewsAndUpdateToday
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  NSCalendar *calendar;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HKCalendarScrollViewController _weekViewContainingTitleForThisMonth](self, "_weekViewContainingTitleForThisMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_weekViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "reloadCells", (_QWORD)v14);
        objc_msgSend(v9, "setTitleHighlighted:", v9 == v3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[HKCalendarDayCell date](self->_selectedCell, "date");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        calendar = self->_calendar,
        -[HKCalendarDayCell date](self->_selectedCell, "date"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(calendar) = -[NSCalendar isDateInYesterday:](calendar, "isDateInYesterday:", v13),
        v13,
        v11,
        (calendar & 1) == 0))
  {
    -[HKCalendarScrollViewController setSelectedCell:](self, "setSelectedCell:", self->_selectedCell);
  }
  else
  {
    -[HKCalendarScrollViewController _selectTodayCell](self, "_selectTodayCell", (_QWORD)v14);
  }

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  -[HKCalendarScrollViewController setView:](self, "setView:", v3);

  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollsToTop:", 0);

  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounces:", 0);

  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInset:", v7, v8, v9, v10);

  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsHorizontalScrollIndicator:", 0);

  v14 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentSize:", v14, v15);

  -[HKCalendarScrollViewController _createWeekViews](self, "_createWeekViews");
}

- (void)viewWillLayoutSubviews
{
  NSDate *initiallyCenteredDate;
  NSDate *v4;
  NSDate *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HKCalendarScrollViewController;
  -[HKCalendarScrollViewController viewWillLayoutSubviews](&v18, sel_viewWillLayoutSubviews);
  if (self->_needsInitialOffset)
  {
    initiallyCenteredDate = self->_initiallyCenteredDate;
    if (initiallyCenteredDate)
    {
      v4 = initiallyCenteredDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    -[HKCalendarScrollViewController _setWeekViewsToCenterDate:forceUpdate:](self, "_setWeekViewsToCenterDate:forceUpdate:", v4, 0);
    v7 = v6;
    v9 = v8;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    -[HKCalendarScrollViewController _heightOfAllWeekCells](self, "_heightOfAllWeekCells");
    objc_msgSend(v10, "setContentSize:", v13, v14);

    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentOffset:animated:", 0, v7, v9);

    if (!self->_selectedCell)
      -[HKCalendarScrollViewController _selectCellForDate:](self, "_selectCellForDate:", v5);
    self->_needsInitialOffset = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewController;
  -[HKCalendarScrollViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HKCalendarScrollViewController updateVisibleAccessoryViews](self, "updateVisibleAccessoryViews");
}

- (id)_weekViewForToday
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarScrollViewController _weekForDate:](self, "_weekForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_weekViewContainingTitleForThisMonth
{
  NSCalendar *calendar;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  calendar = self->_calendar;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 14, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDay:", 1);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarScrollViewController _weekForDate:](self, "_weekForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_pulseCircle
{
  void *v3;
  HKUITodayCirclePulseView *v4;
  HKUITodayCirclePulseView *v5;
  void *v6;
  void *v7;
  HKUITodayCirclePulseView *v8;
  _QWORD v9[4];
  HKUITodayCirclePulseView *v10;

  -[HKCalendarScrollViewController _weekViewForToday](self, "_weekViewForToday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [HKUITodayCirclePulseView alloc];
  -[HKMonthDayCell frame](self->_selectedCell, "frame");
  v5 = -[HKUITodayCirclePulseView initWithFrame:](v4, "initWithFrame:");
  -[HKCalendarDayCell dayDiameter](self->_selectedCell, "dayDiameter");
  -[HKUITodayCirclePulseView setCircleDiameter:](v5, "setCircleDiameter:");
  -[HKCalendarDayCell dayLabel](self->_selectedCell, "dayLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUITodayCirclePulseView setDayLabelContent:](v5, "setDayLabelContent:", v7);

  objc_msgSend(v3, "addSubview:", v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HKCalendarScrollViewController__pulseCircle__block_invoke;
  v9[3] = &unk_1E9C3F0D0;
  v10 = v5;
  v8 = v5;
  -[HKUITodayCirclePulseView pulse:](v8, "pulse:", v9);

}

uint64_t __46__HKCalendarScrollViewController__pulseCircle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_selectTodayCell
{
  uint64_t v3;
  void *v4;
  HKDateCache *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  HKDateCache *dateCache;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[HKCalendarDayCell date](self->_selectedCell, "date");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = self->_dateCache,
        -[HKCalendarDayCell date](self->_selectedCell, "date"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = -[HKDateCache isDateInToday:](v5, "isDateInToday:", v6),
        v6,
        v4,
        (_DWORD)v5))
  {
    -[HKCalendarScrollViewController _pulseCircle](self, "_pulseCircle");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_weekViews;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v22)
    {
      v8 = *(_QWORD *)v30;
      v24 = v7;
      v21 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v7);
          v23 = v9;
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v10, "dayCells", v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v26;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_msgSend(v16, "date");
                v17 = objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  v18 = (void *)v17;
                  dateCache = self->_dateCache;
                  objc_msgSend(v16, "date");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(dateCache) = -[HKDateCache isDateInToday:](dateCache, "isDateInToday:", v20);

                  if ((dateCache & 1) != 0)
                  {
                    -[HKCalendarScrollViewController setSelectedCell:](self, "setSelectedCell:", v16);

                    v7 = v24;
                    goto LABEL_22;
                  }
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v13)
                continue;
              break;
            }
          }

          v9 = v23 + 1;
          v7 = v24;
          v8 = v21;
        }
        while (v23 + 1 != v22);
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }
LABEL_22:

  }
}

- (void)_selectCellForDate:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  HKCalendarScrollViewController *v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKCalendarDayCell date](self->_selectedCell, "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0C99000uLL;
  if (!v5)
    goto LABEL_3;
  v7 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarDayCell date](self->_selectedCell, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compareDate:toDate:toUnitGranularity:", v9, v4, 16);

  if (v10)
  {
LABEL_3:
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = self->_weekViews;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v29)
    {
      v12 = *(_QWORD *)v38;
      v27 = *(_QWORD *)v38;
      v28 = self;
      v31 = v11;
      v32 = v4;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v11);
          v30 = v13;
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v14, "dayCells", v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v34;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v34 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v20, "date");
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v22 = (void *)v21;
                  objc_msgSend(*(id *)(v6 + 3400), "currentCalendar");
                  v23 = v6;
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "date");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v24, "compareDate:toDate:toUnitGranularity:", v25, v32, 16);

                  v6 = v23;
                  if (!v26)
                  {
                    -[HKCalendarScrollViewController setSelectedCell:](v28, "setSelectedCell:", v20);

                    v11 = v31;
                    v4 = v32;
                    goto LABEL_21;
                  }
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v17)
                continue;
              break;
            }
          }

          v13 = v30 + 1;
          v11 = v31;
          v4 = v32;
          v12 = v27;
        }
        while (v30 + 1 != v29);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v29);
    }
LABEL_21:

  }
}

- (void)setSelectedCell:(id)a3
{
  HKMonthDayCell *v4;
  HKMonthDayCell *selectedCell;

  v4 = (HKMonthDayCell *)a3;
  -[HKMonthDayCell setSelected:](self->_selectedCell, "setSelected:", 0);
  -[HKMonthDayCell setSelected:](v4, "setSelected:", 1);
  selectedCell = self->_selectedCell;
  self->_selectedCell = v4;

}

- (double)_heightOfAllWeekCells
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
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
  v2 = self->_weekViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "frame", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)_startDateToTileWeekViews:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setWeekOfYear:", -(uint64_t)(double)((self->_numberOfRows >> 1) - 1));
  -[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:](self->_calendar, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", -[NSCalendar firstWeekday](self->_calendar, "firstWeekday"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGPoint)_centerPointToCenterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v4 = a3;
  -[HKCalendarScrollViewController _weekForDate:](self, "_weekForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frameForDayCell:", v4);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "frame");
    v12 = v8 + v11;
    -[HKCalendarScrollViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v14;

    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v15 + round((v17 - v15) * 0.5);

    v19 = v10 * 0.5 + v12 - v18;
    v20 = 0.0;
  }
  else
  {
    v20 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v21 = v20;
  v22 = v19;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)_setWeekViewsToCenterDate:(id)a3 forceUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double MaxY;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;
  CGRect v31;

  v6 = a3;
  -[HKCalendarScrollViewController _currentlyCenteredVisibleWeek](self, "_currentlyCenteredVisibleWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "containsDate:", v6) && !a4)
  {
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentOffset");
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[HKCalendarScrollViewController _startDateToTileWeekViews:](self, "_startDateToTileWeekViews:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarDayCell date](self->_selectedCell, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_numberOfRows)
    {
      v15 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_weekViews, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 0x2000, v15, v9, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMonthWeekStart:", v17);

        if (objc_msgSend(v16, "containsDate:", v14))
        {
          objc_msgSend(v16, "cellMatchingDate:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKCalendarScrollViewController setSelectedCell:](self, "setSelectedCell:", v18);

        }
        if (v15)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_weekViews, "objectAtIndexedSubscript:", v15 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "frame");
          MaxY = CGRectGetMaxY(v31);

        }
        else
        {
          MaxY = 0.0;
        }
        -[HKCalendarScrollViewController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bounds");
        v23 = v22;
        objc_msgSend(v16, "preferredHeight");
        objc_msgSend(v16, "setFrame:", 0.0, MaxY, v23, v24);

        objc_msgSend(v16, "setTitleHighlighted:", 0);
        ++v15;
      }
      while (v15 < self->_numberOfRows);
    }
    -[HKCalendarScrollViewController _weekViewContainingTitleForThisMonth](self, "_weekViewContainingTitleForThisMonth");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitleHighlighted:", 1);

    -[HKCalendarScrollViewController _centerPointToCenterDate:](self, "_centerPointToCenterDate:", v6);
    v11 = v26;
    v13 = v27;

  }
  v28 = v11;
  v29 = v13;
  result.y = v29;
  result.x = v28;
  return result;
}

- (id)_weekForDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_weekViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsDate:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)_visibleContentRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[HKCalendarScrollViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "statusBarManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusBarFrame");
    v8 = v7;

    -[HKCalendarScrollViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v11 = v8 + v10;

    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentOffset");
    v14 = v11 + v13;

    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16 - v11;

    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;

  }
  else
  {
    v20 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v24 = v20;
  v25 = v14;
  v26 = v23;
  v27 = v17;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)_currentlyCenteredVisibleWeek
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = -[HKCalendarScrollViewController _firstVisibleWeekIndex](self, "_firstVisibleWeekIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    v6 = -[NSMutableArray count](self->_weekViews, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v5, v6 - v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableArray objectsAtIndexes:](self->_weekViews, "objectsAtIndexes:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[HKCalendarScrollViewController scrollView](self, "scrollView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "frame");
          v16 = v15;
          v18 = v17;
          -[HKCalendarScrollViewController view](self, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "convertPoint:toView:", v19, v16, v18);
          v21 = v20;

          objc_msgSend(v13, "frame");
          v23 = v21 + v22;
          -[HKCalendarScrollViewController scrollView](self, "scrollView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "frame");
          v26 = floor(v25 * 0.5);

          if (v23 > v26)
          {
            v4 = v13;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v10)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_13:

  }
  objc_msgSend(v4, "currentWeekStartDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = v4;
  else
    v28 = 0;
  v29 = v28;

  return v29;
}

- (unint64_t)_firstVisibleWeekIndex
{
  NSMutableArray *weekViews;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[HKCalendarScrollViewController _visibleContentRect](self, "_visibleContentRect");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  weekViews = self->_weekViews;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HKCalendarScrollViewController__firstVisibleWeekIndex__block_invoke;
  v10[3] = &unk_1E9C41860;
  v10[5] = v4;
  v10[6] = v5;
  v10[7] = v6;
  v10[8] = v7;
  v10[4] = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](weekViews, "enumerateObjectsUsingBlock:", v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __56__HKCalendarScrollViewController__firstVisibleWeekIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGRect v7;

  objc_msgSend(a2, "frame");
  if (CGRectGetMinY(v7) > *(double *)(a1 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)scrollToDate:(id)a3 animateIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTracking"))
  {

  }
  else
  {
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDecelerating");

    if (!v8)
      goto LABEL_5;
  }
  -[HKCalendarScrollViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopScrollingAndZooming");

LABEL_5:
  -[HKCalendarScrollViewController _currentlyCenteredVisibleWeek](self, "_currentlyCenteredVisibleWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsDate:", v15) & 1) == 0)
  {
    objc_msgSend(v10, "currentWeekStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v15);
    v13 = (uint64_t)(v12 / (double)(unint64_t)(*MEMORY[0x1E0CB4B98] * *MEMORY[0x1E0CB4788]));

    if (v13 < 0)
      v13 = -v13;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v13 >= 0x11)
    {
      -[HKCalendarScrollViewController _setWeekViewsToCenterDate:forceUpdate:](self, "_setWeekViewsToCenterDate:forceUpdate:", v15, 0);
      objc_msgSend(v14, "setContentOffset:animated:", 0);

LABEL_11:
      -[HKCalendarScrollViewController updateVisibleAccessoryViews](self, "updateVisibleAccessoryViews");
      goto LABEL_12;
    }
    -[HKCalendarScrollViewController _centerPointToCenterDate:](self, "_centerPointToCenterDate:", v15);
    objc_msgSend(v14, "setContentOffset:animated:", v4);

    if (!v4)
      goto LABEL_11;
  }
LABEL_12:
  -[HKCalendarScrollViewController _selectCellForDate:](self, "_selectCellForDate:", v15);

}

- (void)week:(id)a3 cellSelected:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[HKCalendarScrollViewController setSelectedCell:](self, "setSelectedCell:", v5);
  -[HKCalendarScrollViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "calendarScrollViewController:didSelectDate:", self, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_weekViews, "count"))
  {
    objc_msgSend(v4, "contentOffset");
    if (v5 < 150.0
      || (v6 = v5, objc_msgSend(v4, "contentSize"), v8 = v7, objc_msgSend(v4, "frame"), v6 > v8 - v9 + -150.0))
    {
      -[HKCalendarScrollViewController _currentlyCenteredVisibleWeek](self, "_currentlyCenteredVisibleWeek");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        -[NSMutableArray lastObject](self->_weekViews, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "currentWeekStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "currentWeekStartDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCalendarScrollViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "superview");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        objc_msgSend(v14, "convertPoint:fromView:", v4);

        -[HKCalendarScrollViewController _setWeekViewsToCenterDate:forceUpdate:](self, "_setWeekViewsToCenterDate:forceUpdate:", v12, 1);
        objc_msgSend(v4, "setContentOffset:");
        -[HKCalendarScrollViewController _weekForDate:](self, "_weekForDate:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCalendarScrollViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "superview");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        objc_msgSend(v17, "convertPoint:fromView:", v4);

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = self->_weekViews;
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v23, "center", (_QWORD)v24);
              objc_msgSend(v23, "setCenter:");
            }
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v20);
        }

      }
    }
    -[HKCalendarScrollViewController _findCenteredWeekAndUpdateTitleIfNecessary](self, "_findCenteredWeekAndUpdateTitleIfNecessary", (_QWORD)v24);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[HKCalendarScrollViewController updateVisibleAccessoryViews](self, "updateVisibleAccessoryViews", a3);
}

- (void)updateVisibleAccessoryViews
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableArray *v35;
  HKCalendarScrollViewController *v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48 = *MEMORY[0x1E0C80C00];
  -[HKCalendarScrollViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentOffset");
    v10 = v9;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = self->_weekViews;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      v35 = v17;
      v36 = self;
      v34 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((objc_msgSend(v22, "accessoryContentsFetched") & 1) == 0)
          {
            objc_msgSend(v22, "bounds");
            if (!CGRectIsEmpty(v49))
            {
              objc_msgSend(v22, "frame");
              v51.origin.x = v23;
              v51.origin.y = v24;
              v51.size.width = v25;
              v51.size.height = v26;
              v50.origin.x = v7;
              v50.origin.y = v10;
              v50.size.width = v13;
              v50.size.height = v16;
              if (CGRectIntersectsRect(v50, v51))
              {
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(v22, "accessoryViews");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                if (v28)
                {
                  v29 = v28;
                  v30 = *(_QWORD *)v39;
                  do
                  {
                    for (j = 0; j != v29; ++j)
                    {
                      if (*(_QWORD *)v39 != v30)
                        objc_enumerationMutation(v27);
                      objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "subviews");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "makeObjectsPerformSelector:", sel_removeFromSuperview);

                    }
                    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                  }
                  while (v29);
                }

                objc_msgSend(v22, "setAccessoryContentsFetched:", 1);
                objc_msgSend(v22, "dayCells");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke;
                v37[3] = &unk_1E9C418B0;
                v37[4] = v36;
                v37[5] = v22;
                objc_msgSend(v33, "enumerateObjectsUsingBlock:", v37);

                v20 = v34;
                v17 = v35;
              }
            }
          }
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v19);
    }

  }
}

void __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v5 = a2;
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_2;
    v10[3] = &unk_1E9C41888;
    v10[4] = *(_QWORD *)(a1 + 40);
    v10[5] = a3;
    objc_msgSend(v7, "calendarScrollViewController:accessoryViewForDate:accessoryViewCompletion:", v8, v9, v10);

  }
}

void __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v3);
    objc_msgSend(v3, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    objc_msgSend(v3, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(v3, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v3, "setAlpha:", 0.0);
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_3;
    v19[3] = &unk_1E9C3F0D0;
    v20 = v3;
    objc_msgSend(v18, "animateWithDuration:animations:", v19, 0.25);

  }
}

uint64_t __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_findCenteredWeekAndUpdateTitleIfNecessary
{
  void *v3;
  void *v4;
  double MidY;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37 = *MEMORY[0x1E0C80C00];
  -[HKCalendarScrollViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKCalendarScrollViewController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    MidY = CGRectGetMidY(v38);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = self->_weekViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
          -[HKCalendarScrollViewController scrollView](self, "scrollView", (_QWORD)v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frame");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;
          -[HKCalendarScrollViewController view](self, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;

          v39.origin.x = v23;
          v39.origin.y = v25;
          v39.size.width = v27;
          v39.size.height = v29;
          if (CGRectGetMinY(v39) < MidY)
          {
            v40.origin.x = v23;
            v40.origin.y = v25;
            v40.size.width = v27;
            v40.size.height = v29;
            if (CGRectGetMaxY(v40) > MidY)
            {
              -[HKCalendarScrollViewController delegate](self, "delegate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "currentWeekStartDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "calendarScrollViewController:didUpdateCenteredMonth:", self, v31);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }

  }
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (HKCalendarScrollViewControllerDelegate)delegate
{
  return (HKCalendarScrollViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_storeStrong((id *)&self->_initiallyCenteredDate, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
