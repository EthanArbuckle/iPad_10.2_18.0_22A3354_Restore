@implementation EKDayViewWithGutters

- (id)_createAllDayView
{
  double v3;
  double v4;
  double v5;
  EKDayAllDayView *v6;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[EKDayViewWithGutters gutterWidth](self, "gutterWidth");
  v6 = -[EKDayAllDayView initWithFrame:sizeClass:]([EKDayAllDayView alloc], "initWithFrame:sizeClass:", self->_targetSizeClass, v3, v4, v5 + v5, self->_allDayHeight);
  -[EKDayAllDayView setShowsLabel:](v6, "setShowsLabel:", 0);
  -[EKDayAllDayView setShowsBorderLines:](v6, "setShowsBorderLines:", 1);
  -[EKDayAllDayView setAutoresizingMask:](v6, "setAutoresizingMask:", 32);
  return v6;
}

- (double)gutterWidth
{
  return self->_gutterWidth;
}

- (void)setAllDayHeight:(double)a3
{
  EKDayAllDayView *v4;
  EKDayAllDayView *leftAllDayView;
  void *v6;
  EKDayAllDayView *v7;
  EKDayAllDayView *rightAllDayView;
  void *v9;
  double gutterWidth;
  double v11;
  double allDayHeight;

  self->_allDayHeight = a3;
  if (!self->_leftAllDayView)
  {
    -[EKDayViewWithGutters _createAllDayView](self, "_createAllDayView");
    v4 = (EKDayAllDayView *)objc_claimAutoreleasedReturnValue();
    leftAllDayView = self->_leftAllDayView;
    self->_leftAllDayView = v4;

    -[EKDayViewWithGutters leftGutter](self, "leftGutter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_leftAllDayView);

  }
  if (!self->_rightAllDayView)
  {
    -[EKDayViewWithGutters _createAllDayView](self, "_createAllDayView");
    v7 = (EKDayAllDayView *)objc_claimAutoreleasedReturnValue();
    rightAllDayView = self->_rightAllDayView;
    self->_rightAllDayView = v7;

    -[EKDayViewWithGutters rightGutter](self, "rightGutter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_rightAllDayView);

  }
  gutterWidth = self->_gutterWidth;
  v11 = gutterWidth + gutterWidth;
  allDayHeight = self->_allDayHeight;
  -[EKDayAllDayView setFrame:](self->_leftAllDayView, "setFrame:", -gutterWidth, 0.0, gutterWidth + gutterWidth, allDayHeight);
  -[EKDayAllDayView setFrame:](self->_rightAllDayView, "setFrame:", 0.0, 0.0, v11, allDayHeight);
}

- (void)setGutterWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;

  self->_gutterWidth = a3;
  -[EKDayViewWithGutters leftGutter](self, "leftGutter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v26 = v6;
  v27 = v7;
  v9 = v8;

  -[EKDayViewWithGutters dayView](self, "dayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  -[EKDayViewWithGutters rightGutter](self, "rightGutter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  -[EKDayViewWithGutters bounds](self, "bounds");
  v21 = v20 + a3 * -2.0;
  -[EKDayViewWithGutters dayView](self, "dayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", a3, v12, v21, v14);

  -[EKDayViewWithGutters leftGutter](self, "leftGutter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v26, v9, a3, v27);

  -[EKDayViewWithGutters rightGutter](self, "rightGutter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v21 + a3, v17, a3, v19);

  -[EKDayViewWithGutters dayView](self, "dayView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNeedsLayout");

  -[EKDayViewWithGutters setAllDayHeight:](self, "setAllDayHeight:", self->_allDayHeight);
}

- (EKDayView)dayView
{
  return self->_dayView;
}

- (UIView)rightGutter
{
  return self->_rightGutter;
}

- (UIView)leftGutter
{
  return self->_leftGutter;
}

- (void)setDayView:(id)a3
{
  id v5;
  NSCalendar *calendar;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_dayView, a3);
  v5 = a3;
  calendar = self->_calendar;
  objc_msgSend(v5, "displayDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKDayViewWithGutters setCurrentDate:](self, "setCurrentDate:", v8);
  -[EKDayViewWithGutters updateDividerLineVisibility](self, "updateDividerLineVisibility");
}

+ (double)defaultTopLabelContainerHeight
{
  return 36.0;
}

+ (id)_weekdayFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", a3, *MEMORY[0x1E0DC1448]);
}

+ (id)_smallWeekdayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 13.0, 18.0);
  return (id)objc_msgSend(a1, "_weekdayFontOfSize:");
}

+ (id)_normalWeekdayFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 15.0, 20.0);
  return (id)objc_msgSend(a1, "_weekdayFontOfSize:");
}

+ (id)_weekdayFont
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showWeekNumbers") & 1) == 0)
  {

    goto LABEL_5;
  }
  CUIKGetOverlayCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_5:
    objc_msgSend(a1, "_normalWeekdayFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  objc_msgSend(a1, "_smallWeekdayFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)_weekNumberFont
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC1350];
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 14.0, 16.0);
  return (id)objc_msgSend(v2, "systemFontOfSize:");
}

- (EKDayViewWithGutters)initWithFrame:(CGRect)a3 dayView:(id)a4 sizeClass:(int64_t)a5 showWeekDayLabel:(BOOL)a6 showWeekNumberLabel:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  id v15;
  EKDayViewWithGutters *v16;
  uint64_t v17;
  NSCalendar *calendar;
  id v19;
  double v20;
  uint64_t v21;
  UIView *topLabelsContainer;
  NSCalendar *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UILabel *weekNumberLabel;
  void *v28;
  void *v29;
  DayTwoPartLabel *v30;
  double v31;
  uint64_t v32;
  DayTwoPartLabel *weekDayLabel;
  void *v34;
  double v35;
  double v36;
  id v37;
  double v38;
  uint64_t v39;
  UIView *dividerLine;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int64_t v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id location;
  objc_super v60;
  CGRect v61;
  CGRect v62;

  v7 = a7;
  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v60.receiver = self;
  v60.super_class = (Class)EKDayViewWithGutters;
  v16 = -[EKDayViewWithGutters initWithFrame:](&v60, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v54 = a5;
    CUIKCalendar();
    v17 = objc_claimAutoreleasedReturnValue();
    calendar = v16->_calendar;
    v16->_calendar = (NSCalendar *)v17;

    v16->_showWeekDayLabel = v8;
    v16->_showWeekNumberLabel = v7;
    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    +[EKDayViewWithGutters defaultTopLabelContainerHeight](EKDayViewWithGutters, "defaultTopLabelContainerHeight");
    v21 = objc_msgSend(v19, "initWithFrame:", 0.0, 0.0, width, v20);
    topLabelsContainer = v16->_topLabelsContainer;
    v16->_topLabelsContainer = (UIView *)v21;

    -[UIView setClipsToBounds:](v16->_topLabelsContainer, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v16->_topLabelsContainer, "setAutoresizingMask:", 2);
    -[UIView setHidden:](v16->_topLabelsContainer, "setHidden:", !v8);
    -[EKDayViewWithGutters addSubview:](v16, "addSubview:", v16->_topLabelsContainer);
    v23 = v16->_calendar;
    objc_msgSend(v15, "displayDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateFromComponents:](v23, "dateFromComponents:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v16->_currentDate, v25);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 16.0, 8.0, 50.0, 20.0);
    weekNumberLabel = v16->_weekNumberLabel;
    v16->_weekNumberLabel = (UILabel *)v26;

    -[UILabel setAutoresizingMask:](v16->_weekNumberLabel, "setAutoresizingMask:", 38);
    objc_msgSend((id)objc_opt_class(), "_weekNumberFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16->_weekNumberLabel, "setFont:", v28);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16->_weekNumberLabel, "setTextColor:", v29);

    -[EKDayViewWithGutters _updateWeekNumberLabel](v16, "_updateWeekNumberLabel");
    -[UILabel setHidden:](v16->_weekNumberLabel, "setHidden:", !v7);
    -[UIView addSubview:](v16->_topLabelsContainer, "addSubview:", v16->_weekNumberLabel);
    v30 = [DayTwoPartLabel alloc];
    +[EKDayViewWithGutters defaultTopLabelContainerHeight](EKDayViewWithGutters, "defaultTopLabelContainerHeight");
    v32 = -[DayTwoPartLabel initWithFrame:useSeparateFormat:](v30, "initWithFrame:useSeparateFormat:", 0, 0.0, 0.0, width, v31);
    weekDayLabel = v16->_weekDayLabel;
    v16->_weekDayLabel = (DayTwoPartLabel *)v32;

    -[DayTwoPartLabel setUseEmDashFormat:](v16->_weekDayLabel, "setUseEmDashFormat:", 1);
    -[UIView center](v16->_topLabelsContainer, "center");
    -[DayTwoPartLabel setCenter:](v16->_weekDayLabel, "setCenter:");
    -[DayTwoPartLabel setDate:](v16->_weekDayLabel, "setDate:", v25);
    -[DayTwoPartLabel sizeToFit](v16->_weekDayLabel, "sizeToFit");
    -[DayTwoPartLabel setAutoresizingMask:](v16->_weekDayLabel, "setAutoresizingMask:", 5);
    objc_msgSend((id)objc_opt_class(), "_weekdayFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DayTwoPartLabel setFont:](v16->_weekDayLabel, "setFont:", v34);

    -[UIView addSubview:](v16->_topLabelsContainer, "addSubview:", v16->_weekDayLabel);
    CalRoundToScreenScale(0.5);
    v36 = v35;
    v37 = objc_alloc(MEMORY[0x1E0DC3F10]);
    +[EKDayViewWithGutters defaultTopLabelContainerHeight](EKDayViewWithGutters, "defaultTopLabelContainerHeight");
    v39 = objc_msgSend(v37, "initWithFrame:", 0.0, v38 - v36, width, v36);
    dividerLine = v16->_dividerLine;
    v16->_dividerLine = (UIView *)v39;

    -[UIView setAutoresizingMask:](v16->_dividerLine, "setAutoresizingMask:", 42);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v16->_dividerLine, "setBackgroundColor:", v41);

    -[UIView setHidden:](v16->_dividerLine, "setHidden:", 1);
    -[UIView addSubview:](v16->_topLabelsContainer, "addSubview:", v16->_dividerLine);
    objc_initWeak(&location, v16);
    v42 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke;
    v57[3] = &unk_1E601C840;
    objc_copyWeak(&v58, &location);
    objc_msgSend(v15, "setDisplayDateDidChangeCallback:", v57);
    v55[0] = v42;
    v55[1] = 3221225472;
    v55[2] = __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke_2;
    v55[3] = &unk_1E6018A48;
    objc_copyWeak(&v56, &location);
    objc_msgSend(v15, "setContentDidChangeCallback:", v55);
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "frame");
    v43 = v61.origin.x;
    v44 = v61.origin.y;
    v45 = v61.size.width;
    v46 = v61.size.height;
    v47 = CGRectGetWidth(v61);
    v62.origin.x = v43;
    v62.origin.y = v44;
    v62.size.width = v45;
    v62.size.height = v46;
    v48 = CGRectGetHeight(v62) - v44;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, v44, v16->_gutterWidth, v48);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setBackgroundColor:", v50);

    objc_msgSend(v49, "setClipsToBounds:", 0);
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v43 + v47, v44, v16->_gutterWidth, v48);
    objc_msgSend(v51, "setAutoresizingMask:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBackgroundColor:", v52);

    objc_msgSend(v51, "setClipsToBounds:", 0);
    -[EKDayViewWithGutters setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    -[EKDayViewWithGutters addSubview:](v16, "addSubview:", v49);
    -[EKDayViewWithGutters addSubview:](v16, "addSubview:", v51);
    -[EKDayViewWithGutters addSubview:](v16, "addSubview:", v15);
    objc_storeStrong((id *)&v16->_leftGutter, v49);
    objc_storeStrong((id *)&v16->_rightGutter, v51);
    v16->_targetSizeClass = v54;
    -[EKDayViewWithGutters setDayView:](v16, "setDayView:", v15);
    -[EKDayViewWithGutters setClipsToBounds:](v16, "setClipsToBounds:", 0);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);

  }
  return v16;
}

void __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained[52], "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setCurrentDate:", v4);
}

void __93__EKDayViewWithGutters_initWithFrame_dayView_sizeClass_showWeekDayLabel_showWeekNumberLabel___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowDividerLine:", a2 == 0);

}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  -[EKDayViewWithGutters updateLabelTexts](self, "updateLabelTexts");
}

- (void)_updateWeekNumberLabel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSCalendar *calendar;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 15.0);
  v5 = v4;

  v6 = 16.0;
  if (v5 > 18.0)
    v6 = 8.0;
  if (v5 <= 21.0)
    v7 = v6;
  else
    v7 = 1.0;
  -[UILabel bounds](self->_weekNumberLabel, "bounds", v6);
  v9 = v8;
  -[UILabel bounds](self->_weekNumberLabel, "bounds");
  -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", v7, 8.0, v9);
  calendar = self->_calendar;
  -[EKDayViewWithGutters currentDate](self, "currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar component:fromDate:](calendar, "component:fromDate:", 0x2000, v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("W%@"), &stru_1E601DFA8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKLocalizedStringForInteger();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_weekNumberLabel, "setText:", v16);

  objc_msgSend((id)objc_opt_class(), "_weekNumberFont");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v17);

}

- (void)updateLabelTexts
{
  void *v3;
  void *v4;
  void *v5;

  -[EKDayViewWithGutters _updateWeekNumberLabel](self, "_updateWeekNumberLabel");
  CUIKGetOverlayCalendar();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DayTwoPartLabel setShowOverlayDate:](self->_weekDayLabel, "setShowOverlayDate:", v3 != 0);

  -[EKDayViewWithGutters currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DayTwoPartLabel setDate:](self->_weekDayLabel, "setDate:", v4);

  objc_msgSend((id)objc_opt_class(), "_weekdayFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DayTwoPartLabel setFont:](self->_weekDayLabel, "setFont:", v5);

  -[DayTwoPartLabel sizeToFit](self->_weekDayLabel, "sizeToFit");
  -[UIView center](self->_topLabelsContainer, "center");
  -[DayTwoPartLabel setCenter:](self->_weekDayLabel, "setCenter:");
  -[EKDayViewWithGutters sizeToFit](self, "sizeToFit");
  -[EKDayViewWithGutters setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowWeekDayLabel:(BOOL)a3
{
  self->_showWeekDayLabel = a3;
  -[DayTwoPartLabel setHidden:](self->_weekDayLabel, "setHidden:", !a3);
}

- (void)setShowWeekNumberLabel:(BOOL)a3
{
  self->_showWeekNumberLabel = a3;
  -[UILabel setHidden:](self->_weekNumberLabel, "setHidden:", !a3);
}

- (void)updateDividerLineVisibility
{
  -[EKDayViewWithGutters setShowDividerLine:](self, "setShowDividerLine:", -[EKDayView hasAllDaySection](self->_dayView, "hasAllDaySection") ^ 1);
}

- (void)setShowDividerLine:(BOOL)a3
{
  self->_showDividerLine = a3;
  -[UIView setHidden:](self->_dividerLine, "setHidden:", !a3);
}

- (BOOL)isPointAllDay:(CGPoint)a3 requireAllDayRegionInsistence:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  EKDayView *dayView;
  char v10;
  CGPoint v11;
  CGRect v12;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_topLabelsContainer, "frame");
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v12, v11))
    return 1;
  v10 = 0;
  dayView = self->_dayView;
  -[EKDayView convertPoint:fromView:](dayView, "convertPoint:fromView:", self, x, y);
  -[EKDayView dateAtPoint:isAllDay:requireAllDayRegionInsistence:](dayView, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", &v10, v4);
  return v10 != 0;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (UIView)topLabelsContainer
{
  return self->_topLabelsContainer;
}

- (void)setTopLabelsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_topLabelsContainer, a3);
}

- (DayTwoPartLabel)weekDayLabel
{
  return self->_weekDayLabel;
}

- (void)setWeekDayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_weekDayLabel, a3);
}

- (UILabel)weekNumberLabel
{
  return self->_weekNumberLabel;
}

- (void)setWeekNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_weekNumberLabel, a3);
}

- (UIView)dividerLine
{
  return self->_dividerLine;
}

- (void)setDividerLine:(id)a3
{
  objc_storeStrong((id *)&self->_dividerLine, a3);
}

- (BOOL)showWeekDayLabel
{
  return self->_showWeekDayLabel;
}

- (BOOL)showWeekNumberLabel
{
  return self->_showWeekNumberLabel;
}

- (BOOL)showDividerLine
{
  return self->_showDividerLine;
}

- (double)allDayHeight
{
  return self->_allDayHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayView, 0);
  objc_storeStrong((id *)&self->_rightGutter, 0);
  objc_storeStrong((id *)&self->_leftGutter, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_weekDayLabel, 0);
  objc_storeStrong((id *)&self->_topLabelsContainer, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_rightAllDayView, 0);
  objc_storeStrong((id *)&self->_leftAllDayView, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
