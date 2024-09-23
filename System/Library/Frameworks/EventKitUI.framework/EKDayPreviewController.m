@implementation EKDayPreviewController

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7 overriddenDayViewHourScale:(double)a8 overriddenDayViewMinHourRange:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  EKDayPreviewController *v21;
  EKDayPreviewController *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v29.receiver = self;
  v29.super_class = (Class)EKDayPreviewController;
  v21 = -[EKDayPreviewController init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    -[EKDayPreviewController _updateIvarsWithDate:event:overriddenEventStartDate:overriddenEventEndDate:](v21, "_updateIvarsWithDate:event:overriddenEventStartDate:overriddenEventEndDate:", v16, v17, v18, v19);
    objc_storeStrong((id *)&v22->_model, a7);
    -[EKDayPreviewController setRespectsSelectedCalendarsFilter:](v22, "setRespectsSelectedCalendarsFilter:", 1);
    -[EKDayPreviewController setStyle:](v22, "setStyle:", 0);
    v22->_overriddenDayViewHourScale = a8;
    v22->_overriddenDayViewMinHourRange = a9;
    objc_initWeak(&location, v22);
    v30[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __156__EKDayPreviewController_initWithDate_event_overriddenEventStartDate_overriddenEventEndDate_model_overriddenDayViewHourScale_overriddenDayViewMinHourRange___block_invoke;
    v26[3] = &unk_1E6018610;
    objc_copyWeak(&v27, &location);
    v24 = (id)-[EKDayPreviewController registerForTraitChanges:withHandler:](v22, "registerForTraitChanges:withHandler:", v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v22;
}

void __156__EKDayPreviewController_initWithDate_event_overriddenEventStartDate_overriddenEventEndDate_model_overriddenDayViewHourScale_overriddenDayViewMinHourRange___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  BOOL v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "style") == 2;
    WeakRetained = v7;
    if (!v2)
    {
      objc_msgSend(v7[123], "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = objc_msgSend(v4, "CGColor");

      objc_msgSend(v3, "setBackgroundColor:", v5);
      if (!objc_msgSend(v7, "style"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v3, "setBorderColor:", objc_msgSend(v6, "CGColor"));

      }
      WeakRetained = v7;
    }
  }

}

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7
{
  return -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:overriddenDayViewHourScale:overriddenDayViewMinHourRange:](self, "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:overriddenDayViewHourScale:overriddenDayViewMinHourRange:", a3, a4, a5, a6, a7, -1, 0.0);
}

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  return -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:](self, "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:", a3, a4, a5, a6, 0);
}

- (void)_updateIvarsWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  EKEvent **p_event;
  NSDate *v16;
  NSDate *originalEventStartDate;
  NSDate *v18;
  NSDate *originalEventEndDate;
  NSDate **p_overriddenEventEndDate;
  int v21;
  id v22;

  v22 = a3;
  v11 = a5;
  v12 = a6;
  objc_storeStrong((id *)&self->_date, a3);
  v13 = a4;
  v14 = (void *)objc_msgSend(v13, "copy");

  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, v14);
  -[EKEvent startDate](self->_event, "startDate");
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  originalEventStartDate = self->_originalEventStartDate;
  self->_originalEventStartDate = v16;

  -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  originalEventEndDate = self->_originalEventEndDate;
  self->_originalEventEndDate = v18;

  objc_storeStrong((id *)&self->_overriddenEventStartDate, a5);
  p_overriddenEventEndDate = &self->_overriddenEventEndDate;
  objc_storeStrong((id *)&self->_overriddenEventEndDate, a6);
  if (self->_overriddenEventStartDate && *p_overriddenEventEndDate)
  {
    v21 = -[NSDate CalIsBeforeOrSameAsDate:](self->_overriddenEventStartDate, "CalIsBeforeOrSameAsDate:");
    self->_hasOverriddenEventDates = v21;
    if (v21)
    {
      -[EKEvent overrideStartDate:](*p_event, "overrideStartDate:", self->_overriddenEventStartDate);
      -[EKEvent overrideEndDate:](*p_event, "overrideEndDate:", *p_overriddenEventEndDate);
    }
  }
  else
  {
    self->_hasOverriddenEventDates = 0;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  EKDayView *v11;
  void *v12;
  EKDayView *v13;
  EKDayView *dayView;
  EKDayView *v15;
  void *v16;
  EKDayView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *roundedView;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)EKDayPreviewController;
  -[EKDayPreviewController loadView](&v30, sel_loadView);
  if (self->_date)
  {
    CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController setTitle:](self, "setTitle:", v3);
  }
  else
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController setTitle:](self, "setTitle:", v4);

  }
  CUIKCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_style == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
      v10 = 2;
    else
      v10 = 1;
  }
  else
  {
    v10 = 1;
  }
  v11 = [EKDayView alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = 1;
  v13 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v11, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v10, 1, v6, v12, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v29, 0);
  dayView = self->_dayView;
  self->_dayView = v13;

  -[EKDayView setTodayScrollSecondBuffer:](self->_dayView, "setTodayScrollSecondBuffer:", 0.0);
  v15 = self->_dayView;
  CUIKCalendar();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayView setCalendar:](v15, "setCalendar:", v16);

  -[EKDayView setAllowsOccurrenceSelection:](self->_dayView, "setAllowsOccurrenceSelection:", 0);
  v17 = self->_dayView;
  v18 = (void *)CalCopyTimeZone();
  -[EKDayView setTimeZone:](v17, "setTimeZone:", v18);

  -[EKDayView setDataSource:](self->_dayView, "setDataSource:", self);
  -[EKDayView setShouldEverShowTimeIndicators:](self->_dayView, "setShouldEverShowTimeIndicators:", 0);
  -[EKDayView setHourScale:](self->_dayView, "setHourScale:", self->_overriddenDayViewHourScale);
  -[EKDayView setAnimatesTimeMarker:](self->_dayView, "setAnimatesTimeMarker:", 0);
  -[EKDayView setTranslatesAutoresizingMaskIntoConstraints:](self->_dayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (-[EKDayPreviewController style](self, "style") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[EKDayView setOpaque:](self->_dayView, "setOpaque:", 1);
    -[EKDayPreviewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", self->_dayView);
  }
  else
  {
    -[EKDayView dayContent](self->_dayView, "dayContent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUsesSmallText:", 1);

    -[EKDayView setUserInteractionEnabled:](self->_dayView, "setUserInteractionEnabled:", 0);
    -[EKDayView setScrollAnimationDurationOverride:](self->_dayView, "setScrollAnimationDurationOverride:", 0.4);
    -[EKDayView dayContent](self->_dayView, "dayContent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOffscreenOccurrencePinningEnabled:", 0);

    -[EKDayView setTopContentInset:](self->_dayView, "setTopContentInset:", 16.0);
    -[EKDayView setBottomContentInset:](self->_dayView, "setBottomContentInset:", 16.0);
    -[EKDayView setAlignsMidnightToTop:](self->_dayView, "setAlignsMidnightToTop:", 1);
    -[EKDayView setAllowsScrolling:](self->_dayView, "setAllowsScrolling:", -[EKDayPreviewController style](self, "style") != 0);
    if (-[EKDayPreviewController style](self, "style") == 1)
      -[EKDayView setEventsFillGrid:](self->_dayView, "setEventsFillGrid:", 1);
    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    roundedView = self->_roundedView;
    self->_roundedView = v24;

    -[UIView layer](self->_roundedView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    objc_msgSend(v21, "setMasksToBounds:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_roundedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (!-[EKDayPreviewController style](self, "style"))
    {
      objc_msgSend(v21, "setCornerRadius:", 5.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setBorderColor:", objc_msgSend(v27, "CGColor"));

      objc_msgSend(v21, "setBorderWidth:", 1.0 / EKUIScaleFactor());
    }
    -[UIView addSubview:](self->_roundedView, "addSubview:", self->_dayView);
    -[EKDayPreviewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_roundedView);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)EKDayPreviewController;
  -[EKDayPreviewController viewDidLoad](&v17, sel_viewDidLoad);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKDayPreviewController navigationController](self, "navigationController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "toolbarItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayPreviewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v12, 0);

  -[EKDayPreviewController _setupAutoLayout](self, "_setupAutoLayout");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKDayPreviewController;
  -[EKDayPreviewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_event)
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "EKDayPreviewController is being shown with a nil event.", v5, 2u);
    }
  }
  -[EKDayPreviewController _setupDayView](self, "_setupDayView");
  if (self->_requireScrollPositionCorrection)
    -[EKDayPreviewController _scrollDayViewToCorrectOffsetAnimated:](self, "_scrollDayViewToCorrectOffsetAnimated:", 0);
}

- (void)viewDidLayoutSubviews
{
  -[EKDayPreviewController _setupDayView](self, "_setupDayView");
  -[EKDayPreviewController _scrollDayViewToCorrectOffsetAnimated:](self, "_scrollDayViewToCorrectOffsetAnimated:", 0);
}

- (void)reloadWithNewDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  -[EKDayPreviewController _updateIvarsWithDate:event:overriddenEventStartDate:overriddenEventEndDate:](self, "_updateIvarsWithDate:event:overriddenEventStartDate:overriddenEventEndDate:", a3, a4, a5, a6);
  -[EKDayPreviewController reload](self, "reload");
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_date)
  {
    CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController setTitle:](self, "setTitle:", v3);
  }
  else
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController setTitle:](self, "setTitle:", v4);

  }
  CUIKCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 30, self->_date);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[EKDayView setDisplayDate:](self->_dayView, "setDisplayDate:", v8);
  -[EKDayView reloadDataSynchronously](self->_dayView, "reloadDataSynchronously");
  if (-[EKDayPreviewController style](self, "style") == 2)
    -[EKDayView bringEventToFront:](self->_dayView, "bringEventToFront:", self->_event);
  -[EKDayView occurrenceViewForEvent:](self->_dayView, "occurrenceViewForEvent:", self->_event);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", 1);
  if (self->_hasOverriddenStatus)
  {
    objc_msgSend(v6, "setTentative:", self->_overriddenParticipantStatus == 4);
    objc_msgSend(v6, "setDeclined:", self->_overriddenParticipantStatus == 3);
    objc_msgSend(v6, "setNeedsReply:", objc_msgSend(MEMORY[0x1E0CAA0E0], "needsResponseForParticipantStatus:", self->_overriddenParticipantStatus));
  }
  -[EKDayPreviewController _setNewVisibleHourLabels](self, "_setNewVisibleHourLabels");
  -[EKDayView window](self->_dayView, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[EKDayPreviewController _scrollDayViewToCorrectOffsetAnimated:](self, "_scrollDayViewToCorrectOffsetAnimated:", 0);
  else
    self->_requireScrollPositionCorrection = 1;
  -[EKDayView setNeedsDisplay](self->_dayView, "setNeedsDisplay");

}

- (void)_setupDayView
{
  if (!self->_firstshow)
  {
    self->_firstshow = 1;
    -[EKDayPreviewController reload](self, "reload");
  }
}

- (void)_setupAutoLayout
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[6];
  _QWORD v66[6];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _QWORD v73[6];

  v73[4] = *MEMORY[0x1E0C80C00];
  if (-[EKDayPreviewController style](self, "style") == 2)
  {
    v58 = (void *)MEMORY[0x1E0CB3718];
    -[EKDayView leadingAnchor](self->_dayView, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "safeAreaLayoutGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v63;
    -[EKDayView trailingAnchor](self->_dayView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController view](self, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "safeAreaLayoutGuide");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v56;
    -[EKDayView topAnchor](self->_dayView, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "safeAreaLayoutGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v6;
    -[EKDayView bottomAnchor](self->_dayView, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayPreviewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v12);

    v13 = v55;
    v14 = v62;

  }
  else
  {
    -[EKDayPreviewController hostingViewController](self, "hostingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    -[EKDayPreviewController hostingViewController](self, "hostingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v16 & 1) != 0)
      v19 = sel_tableView;
    else
      v19 = sel_view;
    objc_msgSend((id)objc_msgSend(v17, "performSelector:", v19), "layoutMargins");
    v21 = v20;
    v23 = v22;

    if (CalInterfaceIsLeftToRight())
      v24 = -4.0;
    else
      v24 = 1.0;
    v25 = -[EKDayPreviewController style](self, "style");
    v26 = 0.0;
    if (v25 == 1)
      v27 = 0.0;
    else
      v27 = v23;
    if (v25 == 1)
      v28 = 0.0;
    else
      v28 = 16.0;
    if (v25 == 1)
    {
      v24 = 0.0;
      v29 = -1.0;
    }
    else
    {
      v29 = 0.0;
    }
    if (v25 == 1)
      v30 = 0.0;
    else
      v30 = v21;
    v31 = -[EKDayPreviewController style](self, "style", 16.0, -1.0);
    if (v31)
      v32 = v27;
    else
      v32 = 0.0;
    if (v31)
      v26 = v30;
    v33 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = v33;
      objc_msgSend(v34, "numberWithDouble:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayPreviewController hostingViewController](self, "hostingViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v68 = v36;
      v69 = 2112;
      v70 = v37;
      v71 = 2112;
      v72 = v38;
      _os_log_impl(&dword_1AF84D000, v35, OS_LOG_TYPE_DEBUG, "left %@ right %@ host %@", buf, 0x20u);

    }
    _NSDictionaryOfVariableBindings(CFSTR("_roundedView"), self->_roundedView, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = CFSTR("leftMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v40;
    v65[1] = CFSTR("rightMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v41;
    v65[2] = CFSTR("topContentInset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v42;
    v65[3] = CFSTR("bottomContentInset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v43;
    v65[4] = CFSTR("leftContentInset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v44;
    v65[5] = CFSTR("rightContentInset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leftMargin)-[_roundedView]-(rightMargin)-|"), 0, v14, v39);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v47);

    v48 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(topContentInset)-[_roundedView]-(bottomContentInset)-|"), 0, v14, v39);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v49);

    _NSDictionaryOfVariableBindings(CFSTR("_dayView"), self->_dayView, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leftContentInset)-[_dayView]-(rightContentInset)-|"), 0, v14, v13);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v51);

    v52 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_dayView]|"), 0, 0, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v3);
  }

}

- (void)setOverriddenParticipantStatus:(int64_t)a3
{
  self->_hasOverriddenStatus = 1;
  self->_overriddenParticipantStatus = a3;
}

- (id)dayView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(a4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKDayPreviewController _eventsForStartDate:endDate:](self, "_eventsForStartDate:endDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_selectedCalendars
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[EKEvent calendar](self->_event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isDelegate") & 1) == 0)
  {

    v4 = 0;
  }
  v5 = objc_alloc(MEMORY[0x1E0CAA018]);
  -[EKEvent eventStore](self->_event, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEventStore:limitedToSource:visibilityChangedCallback:queue:", v6, v4, 0, 0);

  objc_msgSend(v7, "visibleCalendars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_eventsForStartDate:(id)a3 endDate:(id)a4
{
  CUIKCalendarModel *model;
  void *v7;
  EKEvent **p_event;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  EKDayPreviewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  unsigned int v33;
  double v34;
  char v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  NSArray *cachedTimedEvents;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  EKDayPreviewController *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[6];
  uint64_t v52;
  __int128 v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v44 = a4;
  v46 = self;
  if (-[EKDayPreviewController respectsSelectedCalendarsFilter](self, "respectsSelectedCalendarsFilter"))
  {
    -[EKDayPreviewController _selectedCalendars](self, "_selectedCalendars");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  model = self->_model;
  if (model)
  {
    -[CUIKCalendarModel setPreferredReloadStartDate:endDate:](model, "setPreferredReloadStartDate:endDate:", v45, v44);
    -[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self->_model, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", v45, v44, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "occurrences");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_event = &self->_event;
    -[EKEvent eventStore](self->_event, "eventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForEventsWithStartDate:endDate:calendars:", v45, v44, v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEvent eventStore](*p_event, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventsMatchingPredicate:", v7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)objc_msgSend(v43, "mutableCopy");
  v12 = v11;
  v13 = v46;
  if (v46->_hasOverriddenEventDates)
  {
    if (v11)
    {
      v52 = 0;
      *(_QWORD *)&v53 = &v52;
      *((_QWORD *)&v53 + 1) = 0x3032000000;
      v54 = __Block_byref_object_copy__5;
      v55 = __Block_byref_object_dispose__5;
      v56 = 0;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __54__EKDayPreviewController__eventsForStartDate_endDate___block_invoke;
      v51[3] = &unk_1E6019870;
      v51[4] = v46;
      v51[5] = &v52;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v51);
      objc_msgSend(v12, "removeObject:", *(_QWORD *)(v53 + 40));
      _Block_object_dispose(&v52, 8);

      v13 = v46;
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    if (v13->_event)
      objc_msgSend(v12, "addObject:");
  }
  objc_msgSend(v12, "sortUsingSelector:", sel_compareStartDateWithEvent_);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  -[EKEvent eventStore](v46->_event, "eventStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeZone");

  objc_msgSend(v45, "timeIntervalSinceReferenceDate");
  v19 = v18;
  objc_msgSend(v44, "timeIntervalSinceReferenceDate");
  v21 = v20;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = v12;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v26, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        v29 = v28;

        if (v29 >= v19)
        {
          if (v29 >= v21)
            goto LABEL_31;
          v35 = objc_msgSend(v26, "isAllDay");
          objc_msgSend(v14, "addObject:", v26);
          v36 = v16;
          if ((v35 & 1) == 0)
            goto LABEL_28;
        }
        else
        {
          objc_msgSend(v26, "duration");
          v31 = v30;
          v32 = objc_msgSend(v26, "isAllDay");
          v33 = v31;
          if ((v32 & 1) == 0)
          {
            if (v29 + (double)v33 <= v19)
              continue;
            objc_msgSend(v14, "addObject:", v26);
            v36 = v16;
LABEL_28:
            objc_msgSend(v36, "addObject:", v26);
            continue;
          }
          v52 = 0;
          LODWORD(v53) = (v33 + 1) / 0x15180;
          *(_QWORD *)((char *)&v53 + 4) = 0;
          HIDWORD(v53) = 0;
          v54 = (uint64_t (*)(uint64_t, uint64_t))0xBFF0000000000000;
          CalAbsoluteTimeAddGregorianUnits();
          if (v34 <= v19)
            continue;
          objc_msgSend(v14, "addObject:", v26);
        }
        v37 = -[EKDayPreviewController hidesAllDayEvents](v46, "hidesAllDayEvents");
        v36 = v15;
        if (!v37)
          goto LABEL_28;
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v23);
  }
LABEL_31:

  v38 = objc_msgSend(v16, "copy");
  cachedTimedEvents = v46->_cachedTimedEvents;
  v46->_cachedTimedEvents = (NSArray *)v38;

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0CDC0]), "initWithOccurrences:timedOccurrences:allDayOccurrences:", v14, v16, v15);
  return v40;
}

void __54__EKDayPreviewController__eventsForStartDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "calendarItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "calendarItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v13, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008)) & 1) != 0)
    {
      objc_msgSend(v13, "endDateUnadjustedForLegacyClients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));

      if (v12)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }
    else
    {

    }
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsCompactInViewHierarchy;

  -[EKDayPreviewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2);

  if (IsCompactInViewHierarchy)
    return 26;
  else
    return 30;
}

- (id)_anchorEvent
{
  NSArray *cachedTimedEvents;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  EKEvent *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = self->_event;
  if (-[EKDayPreviewController style](self, "style") != 2
    && -[EKDayPreviewController _shouldShowAllVisibleEvents](self, "_shouldShowAllVisibleEvents"))
  {
    cachedTimedEvents = self->_cachedTimedEvents;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__EKDayPreviewController__anchorEvent__block_invoke;
    v6[3] = &unk_1E6019870;
    v6[4] = self;
    v6[5] = &v7;
    -[NSArray enumerateObjectsUsingBlock:](cachedTimedEvents, "enumerateObjectsUsingBlock:", v6);
  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__EKDayPreviewController__anchorEvent__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "startCalendarDateIncludingTravelTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteTime");
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "dayStart");
  v11 = v10;

  if (v9 >= v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_setNewVisibleHourLabels
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (-[EKDayPreviewController style](self, "style"))
  {
    v3 = 0;
    v4 = 0x7FFFFFFFLL;
  }
  else
  {
    v3 = -[EKDayPreviewController _displayedHoursRange](self, "_displayedHoursRange");
    v4 = v5;
  }
  -[EKDayView setHoursToRender:](self->_dayView, "setHoursToRender:", v3, v4);
}

- (void)_scrollDayViewToCorrectOffsetAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  EKDayView *v6;
  NSDate *date;
  void *v8;
  EKDayView *dayView;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  -[EKDayPreviewController _anchorEvent](self, "_anchorEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && -[EKDayPreviewController _eventOccursOnThisDay:](self, "_eventOccursOnThisDay:", v5)
    && (objc_msgSend(v5, "isAllDay") & 1) == 0)
  {
    -[EKDayPreviewController _dateForFirstHourMarker](self, "_dateForFirstHourMarker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dayView = self->_dayView;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke;
    v11[3] = &unk_1E6018688;
    v11[4] = self;
    -[EKDayView scrollToDate:offset:animated:whenFinished:](dayView, "scrollToDate:offset:animated:whenFinished:", v8, v3, v11, -16.0);

  }
  else
  {
    v6 = self->_dayView;
    date = self->_date;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke_2;
    v10[3] = &unk_1E6018688;
    v10[4] = self;
    -[EKDayView scrollToDate:animated:whenFinished:](v6, "scrollToDate:animated:whenFinished:", date, v3, v10);
  }
  self->_requireScrollPositionCorrection = 0;

}

uint64_t __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 970) = 0;
  return result;
}

uint64_t __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 970) = 0;
  return result;
}

- (BOOL)_eventOccursOnThisDay:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL result;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  -[EKDayView dayStart](self->_dayView, "dayStart");
  result = 0;
  if (v10 >= v11)
  {
    -[EKDayView dayEnd](self->_dayView, "dayEnd");
    if (v7 <= v12)
      return 1;
  }
  return result;
}

- (id)_dateForFirstHourMarker
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[EKDayPreviewController style](self, "style") == 1)
    v3 = -[EKDayPreviewController _displayedHoursRange](self, "_displayedHoursRange");
  else
    v3 = -[EKDayView hoursToRender](self->_dayView, "hoursToRender");
  v4 = (void *)MEMORY[0x1E0C99D68];
  -[EKDayView dayStart](self->_dayView, "dayStart");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingHours:inCalendar:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_hourMaskForEvents:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  v5 = 25;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 25);
  v7 = MEMORY[0x1E0C9AAA0];
  do
  {
    objc_msgSend(v6, "addObject:", v7);
    --v5;
  }
  while (v5);
  v8 = (void *)MEMORY[0x1E0C99D68];
  -[EKDayView dayStart](self->_dayView, "dayStart");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingDays:inCalendar:", 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__EKDayPreviewController__hourMaskForEvents___block_invoke;
  v17[3] = &unk_1E6019898;
  v18 = v9;
  v19 = v10;
  v21 = 25;
  v11 = v6;
  v20 = v11;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
  v14 = v20;
  v15 = v11;

  return v15;
}

void __45__EKDayPreviewController__hourMaskForEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "startDateIncludingTravel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingHours:inCalendar:", -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "roundSecondsAndMinutesUpInCalendar:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDateUnadjustedForLegacyClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingHours:inCalendar:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "roundSecondsAndMinutesDownInCalendar:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isBeforeDate:", *(_QWORD *)(a1 + 32)))
  {
    v9 = *(id *)(a1 + 32);

    v5 = v9;
  }
  if (objc_msgSend(v8, "isAfterDate:", *(_QWORD *)(a1 + 40)))
  {
    v10 = *(id *)(a1 + 40);

    v8 = v10;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v11 = 0;
    v12 = MEMORY[0x1E0C9AAB0];
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "dateByAddingHours:inCalendar:", v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "compare:", v13) == -1 || objc_msgSend(v5, "compare:", v13) == 0;
      v15 = objc_msgSend(v8, "compare:", v13) == 1 || objc_msgSend(v8, "compare:", v13) == 0;
      if (v14 && v15)
        objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v12, v11);

      ++v11;
    }
    while (v11 < *(_QWORD *)(a1 + 56));
  }

}

- (_NSRange)_displayedHoursRange
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t overriddenDayViewMinHourRange;
  _BOOL4 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint8_t v33[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint8_t v39[128];
  __int128 buf;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  _NSRange result;

  v43[1] = *MEMORY[0x1E0C80C00];
  if (-[EKDayPreviewController _shouldShowAllVisibleEvents](self, "_shouldShowAllVisibleEvents"))
  {
    v3 = self->_cachedTimedEvents;
LABEL_5:
    v4 = v3;
    goto LABEL_6;
  }
  if (self->_event)
  {
    v43[0] = self->_event;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v4 = (NSArray *)MEMORY[0x1E0C9AA60];
LABEL_6:
  -[EKDayPreviewController _hourMaskForEvents:](self, "_hourMaskForEvents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Hour Mask: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = -1;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __46__EKDayPreviewController__displayedHoursRange__block_invoke;
  v32[3] = &unk_1E60198C0;
  v32[4] = &buf;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);
  v7 = objc_msgSend(v5, "count");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    v11 = -1;
LABEL_10:
    v12 = 0;
    v13 = v7 - 1;
    v7 -= v9;
    while (1)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v8);
      if (v11 != -1)
        break;
      if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "BOOLValue"))
        v11 = v13;
      else
        v11 = -1;
      ++v12;
      --v13;
      if (v9 == v12)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
        if (v9)
          goto LABEL_10;
        break;
      }
    }
  }
  else
  {
    v11 = -1;
  }

  v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  overriddenDayViewMinHourRange = self->_overriddenDayViewMinHourRange;
  v16 = -[EKDayPreviewController _shouldShowAllVisibleEvents](self, "_shouldShowAllVisibleEvents");
  v17 = v11 - v14 + 1;
  if (overriddenDayViewMinHourRange <= v17)
    v18 = v11 - v14 + 1;
  else
    v18 = overriddenDayViewMinHourRange;
  if (v18 <= 1)
    v18 = 1;
  v19 = 4;
  if (v18 < 4)
    v19 = v18;
  if (v16)
    v20 = v18;
  else
    v20 = v19;
  v21 = (id)kEKUILogHandle;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v33 = 138412802;
    v34 = v22;
    v35 = 2112;
    v36 = v23;
    v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "rangeStart %@ length %@ cappedHours %@", v33, 0x20u);

  }
  v25 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);

  v26 = v25;
  v27 = v20;
  result.length = v27;
  result.location = v26;
  return result;
}

uint64_t __46__EKDayPreviewController__displayedHoursRange__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) == -1)
  {
    v5 = result;
    result = objc_msgSend(a2, "BOOLValue");
    if ((_DWORD)result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = a3;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (double)_dayViewHeight
{
  double v3;
  double v4;
  uint64_t v5;

  -[EKDayView scaledHourHeight](self->_dayView, "scaledHourHeight");
  v4 = v3;
  -[EKDayPreviewController _displayedHoursRange](self, "_displayedHoursRange");
  return v4 * (double)(unint64_t)(v5 - 1) + 32.0;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKDayPreviewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  v5 = v4;

  -[EKDayPreviewController _dayViewHeight](self, "_dayViewHeight");
  v7 = v6 + 32.0;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)_shouldShowAllVisibleEvents
{
  return self->_userHasTappedToExpand || -[EKDayPreviewController style](self, "style") == 2;
}

- (void)toggleExpandedState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];
  uint8_t buf[16];

  if (!self->_isAnimating)
  {
    self->_userHasTappedToExpand ^= 1u;
    self->_isAnimating = 1;
    v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "User tapped to expand", buf, 2u);
    }
    -[EKDayPreviewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__EKDayPreviewController_toggleExpandedState__block_invoke;
    block[3] = &unk_1E6018688;
    block[4] = self;
    v6 = MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __45__EKDayPreviewController_toggleExpandedState__block_invoke_2;
    v7[3] = &unk_1E6018688;
    v7[4] = self;
    dispatch_async(v6, v7);

  }
}

uint64_t __45__EKDayPreviewController_toggleExpandedState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setNewVisibleHourLabels");
  return objc_msgSend(*(id *)(a1 + 32), "_scrollDayViewToCorrectOffsetAnimated:", 1);
}

void __45__EKDayPreviewController_toggleExpandedState__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "dayContent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  recursiveAnimationRemove(v1);

}

- (int64_t)overriddenParticipantStatus
{
  return self->_overriddenParticipantStatus;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIViewController)hostingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void)setHostingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewController, a3);
}

- (BOOL)hidesAllDayEvents
{
  return self->_hidesAllDayEvents;
}

- (void)setHidesAllDayEvents:(BOOL)a3
{
  self->_hidesAllDayEvents = a3;
}

- (BOOL)respectsSelectedCalendarsFilter
{
  return self->_respectsSelectedCalendarsFilter;
}

- (void)setRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->_respectsSelectedCalendarsFilter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_overriddenEventEndDate, 0);
  objc_storeStrong((id *)&self->_overriddenEventStartDate, 0);
  objc_storeStrong((id *)&self->_originalEventEndDate, 0);
  objc_storeStrong((id *)&self->_originalEventStartDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dayView, 0);
  objc_storeStrong((id *)&self->_roundedView, 0);
  objc_storeStrong((id *)&self->_cachedTimedEvents, 0);
}

@end
