@implementation EKEventDateEditItem

- (EKEventDateEditItem)init
{
  EKEventDateEditItem *v2;
  EKEventDateEditItem *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventDateEditItem;
  v2 = -[EKEventDateEditItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_selectedSubitem = 5;
    v2->_targetedSubitemForTimezone = 5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKEventDateEditItem;
  -[EKEventDateEditItem dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *modernStartDateCell;
  void *modernEndDateCell;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)EKEventDateEditItem;
  -[EKEventDateEditItem description](&v10, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  modernStartDateCell = self->_modernStartDateCell;
  if (!modernStartDateCell)
    modernStartDateCell = self->_classicStartDateCell;
  modernEndDateCell = self->_modernEndDateCell;
  if (!modernEndDateCell)
    modernEndDateCell = self->_classicEndDateCell;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n startDateCell:%@\n endDateCell:%@"), v4, modernStartDateCell, modernEndDateCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)usesClassicUI
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)refreshFromCalendarItemAndStore
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *pendingProposedTime;
  NSDate *v13;
  NSDate *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)EKEventDateEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v21, sel_refreshFromCalendarItemAndStore);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  objc_msgSend(WeakRetained, "startTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUTC") & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->super.super._store);
    objc_msgSend(v5, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem _setStartTimeZone:](self, "_setStartTimeZone:", v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "startTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem _setStartTimeZone:](self, "_setStartTimeZone:", v5);
  }

  objc_msgSend(WeakRetained, "endTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(WeakRetained, "endTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isUTC"))
    {
      -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", self->_startTimeZone);
    }
    else
    {
      objc_msgSend(WeakRetained, "endTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", v9);

    }
  }
  else
  {
    -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", self->_startTimeZone);
  }

  objc_msgSend(WeakRetained, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "endDateUnadjustedForLegacyClients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pendingProposedTime = self->_pendingProposedTime;
  if (pendingProposedTime)
  {
    v13 = pendingProposedTime;
LABEL_12:
    v14 = v13;

    objc_msgSend(WeakRetained, "duration");
    -[NSDate dateByAddingTimeInterval:](v14, "dateByAddingTimeInterval:");
    v15 = objc_claimAutoreleasedReturnValue();
    v10 = v14;

    v11 = (void *)v15;
    goto LABEL_13;
  }
  if (-[EKEventDateEditItem proposedTime](self, "proposedTime"))
  {
    objc_msgSend(WeakRetained, "proposedStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(WeakRetained, "proposedStartDate");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:
  -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "components:fromDate:", 254, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDateEditItem _setStartDate:](self, "_setStartDate:", v17);

  -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "components:fromDate:", 254, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDateEditItem _setEndDate:](self, "_setEndDate:", v19);

  -[EKEventDateEditItem _setAllDay:](self, "_setAllDay:", objc_msgSend(WeakRetained, "isAllDay"));
  -[EKEventDateEditItem _adjustStartAndEndComponentsForEventIfNeeded:](self, "_adjustStartAndEndComponentsForEventIfNeeded:", WeakRetained);
  -[EKEventDateEditItem _refreshDatePicker](self, "_refreshDatePicker");

}

- (void)updateStartDateToDate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_pendingProposedTime, a3);
  v5 = a3;
  self->_selectedSubitem = 1;
  -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 254, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDateEditItem _setStartDate:](self, "_setStartDate:", v6);
}

- (void)_refreshDatePicker
{
  -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
  -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", 0, 0);
  -[EKEventDateEditItem _updateClassicDateCellTimeWidths](self, "_updateClassicDateCellTimeWidths");
  -[EKEventDateEditItem _updateClassicDateCellTimeWidths](self, "_updateClassicDateCellTimeWidths");
}

- (void)_adjustStartAndEndComponentsForEventIfNeeded:(id)a3
{
  if (objc_msgSend(a3, "isAllDay"))
  {
    -[NSDateComponents setSecond:](self->_startComponents, "setSecond:", 0);
    -[NSDateComponents setMinute:](self->_startComponents, "setMinute:", 0);
    -[NSDateComponents setHour:](self->_startComponents, "setHour:", 0);
    -[NSDateComponents setHour:](self->_endComponents, "setHour:", 23);
    -[NSDateComponents setSecond:](self->_endComponents, "setSecond:", 59);
    -[NSDateComponents setMinute:](self->_endComponents, "setMinute:", 59);
  }
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  return 1;
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  id v4;
  void *v5;
  void *startComponents;
  BOOL v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSDateComponents *v13;

  v4 = a3;
  -[EKEventEditItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "occurrenceDate");
  startComponents = (void *)objc_claimAutoreleasedReturnValue();
  if (startComponents)
    goto LABEL_2;
  objc_msgSend(v4, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "futureStartDateLimitedToOccurrenceCacheBounds");

  if (!v11)
    goto LABEL_4;
  -[NSDateComponents calendar](self->_startComponents, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromComponents:", self->_startComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  if ((CUIKCheckEventStartDateAgainstOccurrenceCacheBounds() & 1) == 0)
  {
    CUIKTodayComponents();
    v13 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    startComponents = self->_startComponents;
    self->_startComponents = v13;
LABEL_2:

  }
LABEL_4:
  v7 = -[EKEventDateEditItem canBeConfiguredForCalendarConstraints:](self, "canBeConfiguredForCalendarConstraints:", v4);

  return v7;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;

  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supportsAvailabilityRequests"))
  {
    -[EKEventEditItem event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasAttendees");

    if (v8)
      v9 = 22;
    else
      v9 = 18;
  }
  else
  {
    v9 = 18;
  }

  return v9;
}

- (BOOL)isInline
{
  return 1;
}

- (int64_t)_rowForSubitem:(int64_t)a3
{
  _BOOL8 showsAllDay;
  int64_t result;
  int64_t selectedSubitem;
  BOOL v7;
  uint64_t v8;

  showsAllDay = self->_showsAllDay;
  result = a3 - !self->_showsAllDay;
  selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem != 5)
  {
    if (a3 == 3)
    {
      v7 = !showsAllDay;
      v8 = 1;
      if (!v7)
        v8 = 2;
      return self->_showingInlineDatePicker + selectedSubitem + v8 - 1;
    }
    else if (a3 == 4)
    {
      return selectedSubitem + showsAllDay;
    }
    else if (selectedSubitem < a3)
    {
      result += self->_showingInlineDatePicker + 1;
    }
  }
  return result;
}

- (int64_t)_subitemForRow:(int64_t)a3
{
  int64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  if (self->_showsAllDay)
    v4 = a3;
  else
    v4 = a3 + 1;
  if (v4 == self->_selectedSubitem + 1)
  {
    if (self->_showingInlineDatePicker || !-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone"))
      return 4;
    return 3;
  }
  if (-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone")
    && v4 == self->_selectedSubitem + 2
    && self->_showingInlineDatePicker)
  {
    return 3;
  }
  if ((unint64_t)v4 > 4)
    return 5;
  if (v4 > self->_selectedSubitem)
  {
    v5 = -[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone");
    v6 = -2;
    if (!v5)
      v6 = -1;
    v4 += v6;
  }
  return v4;
}

- (unint64_t)numberOfSubitems
{
  uint64_t v3;
  uint64_t v4;

  if (self->_showsAllDay)
    v3 = 3;
  else
    v3 = 2;
  v4 = v3 + -[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone");
  if ((unint64_t)(self->_selectedSubitem - 1) <= 1)
    v4 += self->_showingInlineDatePicker;
  return v4 - -[EKEventDateEditItem proposedTime](self, "proposedTime");
}

- (id)_modernStartDateCell
{
  EKDateTimeCell *modernStartDateCell;
  EKDateTimeCell *v4;
  EKDateTimeCell *v5;
  EKDateTimeCell *v6;
  void *v7;
  void *v8;

  modernStartDateCell = self->_modernStartDateCell;
  if (!modernStartDateCell)
  {
    v4 = -[EKDateTimeCell initWithStyle:reuseIdentifier:]([EKDateTimeCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_modernStartDateCell;
    self->_modernStartDateCell = v4;

    -[EKDateTimeCell setDateTimeDelegate:](self->_modernStartDateCell, "setDateTimeDelegate:", self);
    v6 = self->_modernStartDateCell;
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Starts"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDateTimeCell setTitle:](v6, "setTitle:", v8);

    modernStartDateCell = self->_modernStartDateCell;
  }
  return modernStartDateCell;
}

- (id)_modernEndDateCell
{
  EKDateTimeCell *modernEndDateCell;
  EKDateTimeCell *v4;
  EKDateTimeCell *v5;
  EKDateTimeCell *v6;
  void *v7;
  void *v8;

  modernEndDateCell = self->_modernEndDateCell;
  if (!modernEndDateCell)
  {
    v4 = -[EKDateTimeCell initWithStyle:reuseIdentifier:]([EKDateTimeCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_modernEndDateCell;
    self->_modernEndDateCell = v4;

    -[EKDateTimeCell setDateTimeDelegate:](self->_modernEndDateCell, "setDateTimeDelegate:", self);
    v6 = self->_modernEndDateCell;
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Ends"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDateTimeCell setTitle:](v6, "setTitle:", v8);

    modernEndDateCell = self->_modernEndDateCell;
  }
  return modernEndDateCell;
}

- (id)_classicStartDateCell
{
  BOOL v3;
  PreferencesTwoPartValueCell *v4;
  PreferencesTwoPartValueCell *v5;
  PreferencesTwoPartValueCell *classicStartDateCell;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PreferencesTwoPartValueCell *v15;
  PreferencesTwoPartValueCell *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (!self->_classicStartDateCell)
  {
    v3 = EKUIUsesLargeTextLayout(0);
    v4 = [PreferencesTwoPartValueCell alloc];
    if (v3)
    {
      v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 3, 0);
      classicStartDateCell = self->_classicStartDateCell;
      self->_classicStartDateCell = v5;

      EventKitUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Starts"), &stru_1E601DFA8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell textLabel](self->_classicStartDateCell, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      v10 = *MEMORY[0x1E0DC4B10];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell detailTextLabel](self->_classicStartDateCell, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v11);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell largePart2TextLabel](self->_classicStartDateCell, "largePart2TextLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v13);

    }
    else
    {
      v15 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 0, 0);
      v16 = self->_classicStartDateCell;
      self->_classicStartDateCell = v15;

      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Starts"), &stru_1E601DFA8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell textLabel](self->_classicStartDateCell, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      -[PreferencesTwoPartValueCell textLabel](self->_classicStartDateCell, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "font");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell twoPartTextLabel](self->_classicStartDateCell, "twoPartTextLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v21);

      -[PreferencesTwoPartValueCell setShortener:](self->_classicStartDateCell, "setShortener:", self);
    }
  }
  return self->_classicStartDateCell;
}

- (id)_classicEndDateCell
{
  BOOL v3;
  PreferencesTwoPartValueCell *v4;
  PreferencesTwoPartValueCell *v5;
  PreferencesTwoPartValueCell *classicEndDateCell;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PreferencesTwoPartValueCell *v15;
  PreferencesTwoPartValueCell *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (!self->_classicEndDateCell)
  {
    v3 = EKUIUsesLargeTextLayout(0);
    v4 = [PreferencesTwoPartValueCell alloc];
    if (v3)
    {
      v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 3, 0);
      classicEndDateCell = self->_classicEndDateCell;
      self->_classicEndDateCell = v5;

      EventKitUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Ends"), &stru_1E601DFA8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell textLabel](self->_classicEndDateCell, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      v10 = *MEMORY[0x1E0DC4B10];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell detailTextLabel](self->_classicEndDateCell, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v11);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell largePart2TextLabel](self->_classicEndDateCell, "largePart2TextLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v13);

    }
    else
    {
      v15 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 0, 0);
      v16 = self->_classicEndDateCell;
      self->_classicEndDateCell = v15;

      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Ends"), &stru_1E601DFA8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell textLabel](self->_classicEndDateCell, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      -[PreferencesTwoPartValueCell textLabel](self->_classicEndDateCell, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "font");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PreferencesTwoPartValueCell twoPartTextLabel](self->_classicEndDateCell, "twoPartTextLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v21);

      -[PreferencesTwoPartValueCell setShortener:](self->_classicEndDateCell, "setShortener:", self);
    }
  }
  return self->_classicEndDateCell;
}

- (id)_allDayCell
{
  UITableViewCell *allDayCell;
  EKUITableViewCell *v4;
  UITableViewCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  allDayCell = self->_allDayCell;
  if (!allDayCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_allDayCell;
    self->_allDayCell = &v4->super;

    v6 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__allDayChanged_, 4096);
    -[UITableViewCell setAccessoryView:](self->_allDayCell, "setAccessoryView:", v6);
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("All-day"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_allDayCell, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    allDayCell = self->_allDayCell;
  }
  return allDayCell;
}

- (id)_startTimeZoneCell
{
  UITableViewCell *startTimeZoneCell;
  EKUITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;

  startTimeZoneCell = self->_startTimeZoneCell;
  if (!startTimeZoneCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_startTimeZoneCell;
    self->_startTimeZoneCell = &v4->super;

    objc_msgSend((id)objc_opt_class(), "_timeZoneLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_startTimeZoneCell, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[UITableViewCell setAccessoryType:](self->_startTimeZoneCell, "setAccessoryType:", 1);
    startTimeZoneCell = self->_startTimeZoneCell;
  }
  return startTimeZoneCell;
}

- (id)_endTimeZoneCell
{
  UITableViewCell *endTimeZoneCell;
  EKUITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;

  endTimeZoneCell = self->_endTimeZoneCell;
  if (!endTimeZoneCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_endTimeZoneCell;
    self->_endTimeZoneCell = &v4->super;

    objc_msgSend((id)objc_opt_class(), "_timeZoneLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_endTimeZoneCell, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[UITableViewCell setAccessoryType:](self->_endTimeZoneCell, "setAccessoryType:", 1);
    endTimeZoneCell = self->_endTimeZoneCell;
  }
  return endTimeZoneCell;
}

+ (id)_timeZoneLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Time Zone"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_newDatePicker
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
  if (EKUICatalyst())
    v4 = 0;
  else
    v4 = 3;
  objc_msgSend(v3, "setPreferredDatePickerStyle:", v4);
  objc_msgSend(v3, "setMinuteInterval:", 5);
  objc_msgSend(v3, "setRoundsToMinuteInterval:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFirstWeekday:", CUIKOneIndexedWeekStart());
  objc_msgSend(v3, "setCalendar:", v5);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__datePickerChanged_, 4096);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__datePickerEndedEditing_, 0x40000);

  return v3;
}

- (void)adjustDatePickerInterval:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "component:fromDate:", 64, v7);

  if (0xCCCCCCCCCCCCCCCDLL * v5 + 0x1999999999999999 >= 0x3333333333333333)
    v6 = 1;
  else
    v6 = 5;
  objc_msgSend(v3, "setMinuteInterval:", v6);

}

- (id)_startDatePickerCell
{
  UITableViewCell *startDatePickerCell;
  EKUITableViewCell *v4;
  UITableViewCell *v5;
  UIDatePicker *v6;
  UIDatePicker *startDatePicker;
  void *v8;
  uint64_t v9;

  startDatePickerCell = self->_startDatePickerCell;
  if (!startDatePickerCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_startDatePickerCell;
    self->_startDatePickerCell = &v4->super;

    v6 = -[EKEventDateEditItem _newDatePicker](self, "_newDatePicker");
    startDatePicker = self->_startDatePicker;
    self->_startDatePicker = v6;

    -[UITableViewCell contentView](self->_startDatePickerCell, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_startDatePicker);

    if (self->_allDay)
      v9 = 1;
    else
      v9 = 4272;
    -[UIDatePicker setDatePickerMode:](self->_startDatePicker, "setDatePickerMode:", v9);
    -[EKEventDateEditItem setupPickerConstraintsForCell:datePicker:](self, "setupPickerConstraintsForCell:datePicker:", self->_startDatePickerCell, self->_startDatePicker);
    startDatePickerCell = self->_startDatePickerCell;
  }
  return startDatePickerCell;
}

- (id)_endDatePickerCell
{
  UITableViewCell *endDatePickerCell;
  EKUITableViewCell *v4;
  UITableViewCell *v5;
  UIDatePicker *v6;
  UIDatePicker *endDatePicker;
  void *v8;
  uint64_t v9;

  endDatePickerCell = self->_endDatePickerCell;
  if (!endDatePickerCell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_endDatePickerCell;
    self->_endDatePickerCell = &v4->super;

    v6 = -[EKEventDateEditItem _newDatePicker](self, "_newDatePicker");
    endDatePicker = self->_endDatePicker;
    self->_endDatePicker = v6;

    -[UITableViewCell contentView](self->_endDatePickerCell, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_endDatePicker);

    if (self->_allDay)
      v9 = 1;
    else
      v9 = 4272;
    -[UIDatePicker setDatePickerMode:](self->_endDatePicker, "setDatePickerMode:", v9);
    -[EKEventDateEditItem setupPickerConstraintsForCell:datePicker:](self, "setupPickerConstraintsForCell:datePicker:", self->_endDatePickerCell, self->_endDatePicker);
    endDatePickerCell = self->_endDatePickerCell;
  }
  return endDatePickerCell;
}

- (void)setupPickerConstraintsForCell:(id)a3 datePicker:(id)a4
{
  void *v5;
  id v6;
  id v7;
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
  id v19;
  id v20;

  v19 = (id)MEMORY[0x1E0C99DE8];
  v5 = (void *)MEMORY[0x1E0CB3718];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v8, 5, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, v11, 6, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, 0, v14, 4, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, v17, 3, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "arrayWithObjects:", v9, v12, v15, v18, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  int *v13;

  switch(-[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:"))
  {
    case 0:
      -[EKEventDateEditItem _allDayCell](self, "_allDayCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessoryView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOn:", self->_allDay);
      goto LABEL_27;
    case 1:
      if (-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
        -[EKEventDateEditItem _classicStartDateCell](self, "_classicStartDateCell");
      else
        -[EKEventDateEditItem _modernStartDateCell](self, "_modernStartDateCell");
      goto LABEL_5;
    case 2:
      if (-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
        -[EKEventDateEditItem _classicEndDateCell](self, "_classicEndDateCell");
      else
        -[EKEventDateEditItem _modernEndDateCell](self, "_modernEndDateCell");
LABEL_5:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    case 3:
      if (self->_selectedSubitem == 1)
        -[EKEventDateEditItem _startTimeZoneCell](self, "_startTimeZoneCell");
      else
        -[EKEventDateEditItem _endTimeZoneCell](self, "_endTimeZoneCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_selectedSubitem == 1)
        v9 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
      else
        v9 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
      -[EKEventDateEditItem _timeZoneDescription:](self, "_timeZoneDescription:", *(Class *)((char *)&self->super.super.super.isa + *v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);

      return v5;
    case 4:
      if (self->_selectedSubitem == 1)
        -[EKEventDateEditItem _startDatePickerCell](self, "_startDatePickerCell");
      else
        -[EKEventDateEditItem _endDatePickerCell](self, "_endDatePickerCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        if (self->_selectedSubitem == 1)
          v13 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
        else
          v13 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
        v6 = *(id *)((char *)&self->super.super.super.isa + *v13);
        -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", v6, 0);
        -[EKEventDateEditItem adjustDatePickerInterval:](self, "adjustDatePickerInterval:", v6);
LABEL_27:

      }
      return v5;
    case 5:
      NSLog(CFSTR("This should never happen! Got subitem %ld for index %ld"), 5, a3);
      return 0;
    default:
      return 0;
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  int64_t v7;
  UITableViewCell *v8;
  int *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  objc_super v16;

  v7 = -[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:");
  if (v7 == 4)
  {
    -[EKEventDateEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3);
    v8 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    if (v8 == self->_startDatePickerCell)
      v9 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
    else
      v9 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "intrinsicContentSize");
    v11 = v10;

  }
  else
  {
    if ((unint64_t)(v7 - 1) <= 1)
    {
      -[EKEventDateEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v12, "usingMultiLineLayout"))
      {
        objc_msgSend((id)objc_opt_class(), "scaledHeightOfSystemTableViewCell");
        v11 = v14;

        return v11;
      }

    }
    v16.receiver = self;
    v16.super_class = (Class)EKEventDateEditItem;
    -[EKCalendarItemEditItem defaultCellHeightForSubitemAtIndex:forWidth:](&v16, sel_defaultCellHeightForSubitemAtIndex_forWidth_, a3, a4);
    return v13;
  }
  return v11;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  int64_t v5;

  v5 = -[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:", a4);
  if ((unint64_t)(v5 - 1) >= 2)
    return v5 == 3;
  else
    return -[EKEventDateEditItem usesClassicUI](self, "usesClassicUI");
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  int64_t v6;
  EKTimeZoneViewController *v7;
  EKTimeZoneViewController *v8;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EKEventDateEditItem;
  -[EKCalendarItemEditItem editor:didSelectSubitem:](&v13, sel_editor_didSelectSubitem_, a3);
  v6 = -[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:", a4);
  if ((!-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI")
     || !-[EKEventDateEditItem handleClassicSubitemSelection:](self, "handleClassicSubitemSelection:", v6))
    && v6 == 3)
  {
    self->_pushingTZController = 1;
    v7 = -[EKTimeZoneViewController initWithChooserStyle:]([EKTimeZoneViewController alloc], "initWithChooserStyle:", 0);
    v8 = v7;
    if (self->_selectedSubitem == 1)
      v9 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    else
      v9 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    -[EKTimeZoneViewController setTimeZone:](v7, "setTimeZone:", *(Class *)((char *)&self->super.super.super.isa + *v9));
    -[EKTimeZoneViewController setDelegate:](v8, "setDelegate:", self);
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewControllerForEditItem:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v8, 1);

  }
  -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
  -[EKEventDateEditItem _updateClassicDateCellColors](self, "_updateClassicDateCellColors");
}

- (BOOL)handleClassicSubitemSelection:(int64_t)a3
{
  int64_t selectedSubitem;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;

  selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem == a3)
  {
    -[EKEventDateEditItem _hideInlineDateControls](self, "_hideInlineDateControls");
  }
  else if (a3 <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (selectedSubitem <= 2)
    {
      objc_msgSend(v6, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
      if (-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone"))
        objc_msgSend(v6, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
    }
    self->_selectedSubitem = a3;
    self->_showingInlineDatePicker = 1;
    objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem) + 1);
    if (-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone"))
      objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem) + 2);
    if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
    {
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "editItem:wantsRowInsertions:rowDeletions:", self, v7, v6);

      v9 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 1);
      v10 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 2) + 2 * (self->_selectedSubitem == 2);
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", v9);
      objc_msgSend(v11, "addIndex:", v10);
      -[EKCalendarItemEditItem delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "editItem:wantsRowsScrolledToVisible:", self, v11);

    }
  }
  return a3 < 3;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return -[EKEventDateEditItem _subitemForRow:](self, "_subitemForRow:", a3) == 3;
}

- (void)editor:(id)a3 didStartEditingItem:(id)a4
{
  EKEventDateEditItem *v6;
  objc_super v7;

  v6 = (EKEventDateEditItem *)a4;
  v7.receiver = self;
  v7.super_class = (Class)EKEventDateEditItem;
  -[EKCalendarItemEditItem editor:didStartEditingItem:](&v7, sel_editor_didStartEditingItem_, a3, v6);
  if (v6 != self && -[EKEventDateEditItem isInline](v6, "isInline"))
    -[EKEventDateEditItem _hideInlineDateControls](self, "_hideInlineDateControls");

}

- (void)endInlineEditing
{
  if (!self->_pushingTZController)
    -[EKEventDateEditItem _hideInlineDateControls](self, "_hideInlineDateControls");
}

- (id)_calendarForEventComponents:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  int *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditItem event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFloating") & 1) != 0 || self->_allDay)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._store);
    objc_msgSend(WeakRetained, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v8);

  }
  else
  {
    v9 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    if (v3)
      v9 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    objc_msgSend(v5, "setTimeZone:", *(Class *)((char *)&self->super.super.super.isa + *v9));
  }

  return v5;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  void *v3;
  void *v5;
  void *v6;
  int v7;
  int allDay;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;

  -[EKEventEditItem event](self, "event", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_showsAllDay)
  {
    v7 = objc_msgSend(v5, "isAllDay");
    allDay = self->_allDay;
    if (allDay == v7)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "setAllDay:", allDay != 0);
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }
  if (!self->_allDay)
  {
    objc_msgSend(v6, "startTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || self->_startTimeZone)
    {
      objc_msgSend(v6, "startTimeZone");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqual:", self->_startTimeZone) & 1) == 0)
      {

LABEL_18:
        objc_msgSend(v6, "setStartTimeZone:", self->_startTimeZone);
        objc_msgSend(v6, "setEndTimeZone:", self->_endTimeZone);
        v9 = 1;
        goto LABEL_19;
      }
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "endTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || self->_endTimeZone)
    {
      objc_msgSend(v6, "endTimeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", self->_endTimeZone);

      if ((v11 & 1) != 0)
      if ((v14 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      if ((v11 & 1) != 0)

    }
  }
LABEL_19:
  -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateFromComponents:", self->_startComponents);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", self->_endComponents);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToDate:", v17) & 1) != 0)
  {
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToDate:", v18);

    if ((v21 & 1) != 0)
    {
      if (!v9)
        goto LABEL_28;
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "setStartDate:", v17);
  objc_msgSend(v6, "setEndDateUnadjustedForLegacyClients:", v18);
LABEL_25:
  objc_msgSend(v6, "suggestionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(MEMORY[0x1E0D0C428], "trackPseudoEventDateChanged");
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
LABEL_28:

  return 1;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  PreferencesTwoPartValueCell *classicStartDateCell;
  PreferencesTwoPartValueCell *classicEndDateCell;
  UITableViewCell *allDayCell;
  UITableViewCell *startTimeZoneCell;
  UITableViewCell *endTimeZoneCell;

  -[EKDateTimeCell contentSizeCategoryChanged](self->_modernStartDateCell, "contentSizeCategoryChanged", a3);
  -[EKDateTimeCell contentSizeCategoryChanged](self->_modernEndDateCell, "contentSizeCategoryChanged");
  classicStartDateCell = self->_classicStartDateCell;
  self->_classicStartDateCell = 0;

  classicEndDateCell = self->_classicEndDateCell;
  self->_classicEndDateCell = 0;

  allDayCell = self->_allDayCell;
  self->_allDayCell = 0;

  startTimeZoneCell = self->_startTimeZoneCell;
  self->_startTimeZoneCell = 0;

  endTimeZoneCell = self->_endTimeZoneCell;
  self->_endTimeZoneCell = 0;

  -[EKEventDateEditItem _refreshDatePicker](self, "_refreshDatePicker");
}

- (void)_updateClassicDateCellTimeWidths
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  if (-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
  {
    -[EKEventDateEditItem _classicStartDateCell](self, "_classicStartDateCell");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "twoPartTextLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightmostDisplayedPartWidth");
    v5 = v4;

    -[EKEventDateEditItem _classicEndDateCell](self, "_classicEndDateCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "twoPartTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightmostDisplayedPartWidth");
      v10 = v9;

      if (v10 > v5)
        v5 = v10;
    }
    objc_msgSend(v13, "twoPartTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumPart2Width:", v5);

    objc_msgSend(v7, "twoPartTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMinimumPart2Width:", v5);

  }
}

- (void)_updateClassicDateCellColors
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
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
  void *v19;
  id v20;

  if (-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
  {
    -[EKEventDateEditItem _classicStartDateCell](self, "_classicStartDateCell");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem _classicEndDateCell](self, "_classicEndDateCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CalendarAppTintColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = EKUIUsesLargeTextLayout(0);
    if (self->_selectedSubitem == 1)
      v7 = v5;
    else
      v7 = v4;
    if (v6)
    {
      objc_msgSend(v20, "detailTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v7);

      if (self->_selectedSubitem == 1)
        v9 = v5;
      else
        v9 = v4;
      objc_msgSend(v20, "largePart2TextLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v9);

      if (self->_selectedSubitem == 2)
        v11 = v5;
      else
        v11 = v4;
      objc_msgSend(v3, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v11);

      if (self->_selectedSubitem == 2)
        v13 = v5;
      else
        v13 = v4;
      objc_msgSend(v3, "largePart2TextLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v13);

      objc_msgSend(v3, "setStrikeThroughLargeDetailTextLabel:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));
      objc_msgSend(v3, "setStrikeThroughLargePart2TextLabel:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));
    }
    else
    {
      objc_msgSend(v20, "twoPartTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v7);

      if (self->_selectedSubitem == 2)
        v16 = v5;
      else
        v16 = v4;
      objc_msgSend(v3, "twoPartTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTextColor:", v16);

      objc_msgSend(v3, "twoPartTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setStrikethroughPart1:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));

      objc_msgSend(v3, "twoPartTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setStrikethroughPart2:", -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate"));

    }
  }
}

- (void)shortenCell:(id)a3
{
  void *v4;
  PreferencesTwoPartValueCell *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  PreferencesTwoPartValueCell *v14;

  v14 = (PreferencesTwoPartValueCell *)a3;
  if (self->_shorteningStatus != 2)
  {
    _CalendarForFormattingStrings();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (self->_classicStartDateCell == v14
      && (-[PreferencesTwoPartValueCell twoPartTextLabel](v14, "twoPartTextLabel"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "hasTwoParts"),
          v6,
          v5 = v14,
          v7))
    {
      -[PreferencesTwoPartValueCell twoPartTextLabel](v14, "twoPartTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 48;
    }
    else
    {
      if (self->_classicEndDateCell != v5)
        goto LABEL_9;
      -[PreferencesTwoPartValueCell twoPartTextLabel](v14, "twoPartTextLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasTwoParts");

      if (!v11)
        goto LABEL_9;
      -[PreferencesTwoPartValueCell twoPartTextLabel](v14, "twoPartTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 56;
    }
    objc_msgSend(v4, "dateFromComponents:", *(Class *)((char *)&self->super.super.super.isa + v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKShortStringForDateWithMonthAndYear();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextPart1:", v13);

LABEL_9:
  }

}

- (void)timeZoneViewController:(id)a3 didSelectTimeZone:(id)a4
{
  id v5;
  int64_t targetedSubitemForTimezone;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a4;
  self->_pushingTZController = 0;
  targetedSubitemForTimezone = self->_targetedSubitemForTimezone;
  if (targetedSubitemForTimezone == 5)
    targetedSubitemForTimezone = self->_selectedSubitem;
  v12 = v5;
  if (targetedSubitemForTimezone == 1)
  {
    if (-[NSTimeZone isEqualToTimeZone:](self->_startTimeZone, "isEqualToTimeZone:", self->_endTimeZone))
      -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", v12);
    -[EKEventDateEditItem _setStartTimeZone:](self, "_setStartTimeZone:", v12);
  }
  else
  {
    -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", v5);
  }
  -[EKEventDateEditItem saveAndDismissWithForce:](self, "saveAndDismissWithForce:", 1);
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editItem:wantsDoneButtonDisabled:", self, 0);

  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewControllerForEditItem:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

  self->_targetedSubitemForTimezone = 5;
}

- (void)timeZoneViewControllerDidCancel:(id)a3
{
  int *v3;

  self->_pushingTZController = 0;
  self->_targetedSubitemForTimezone = 5;
  if (self->_selectedSubitem == 1)
    v3 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
  else
    v3 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
  objc_msgSend(a3, "setTimeZone:", *(Class *)((char *)&self->super.super.super.isa + *v3));
}

- (void)_setStartDate:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *startComponents;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_startComponents) & 1) == 0)
  {
    v4 = (NSDateComponents *)objc_msgSend(v6, "copy");
    startComponents = self->_startComponents;
    self->_startComponents = v4;

    -[NSDateComponents setTimeZone:](self->_startComponents, "setTimeZone:", 0);
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, self->_endTimeWasMessedUp);
    -[EKEventDateEditItem _updateClassicDateCellColors](self, "_updateClassicDateCellColors");
    -[EKEventDateEditItem _updateClassicDateCellTimeWidths](self, "_updateClassicDateCellTimeWidths");
    if (self->_selectedSubitem == 1 && !self->_changingDate)
      -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", 0, 0);
  }

}

- (void)_setEndDate:(id)a3
{
  char v4;
  void *v5;
  NSDateComponents *v6;
  NSDateComponents *endComponents;
  BOOL v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "isEqual:", self->_endComponents);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = (NSDateComponents *)objc_msgSend(v9, "copy");
    endComponents = self->_endComponents;
    self->_endComponents = v6;

    -[NSDateComponents setTimeZone:](self->_endComponents, "setTimeZone:", 0);
    if (!self->_allDay)
    {
      v8 = !-[NSDateComponents hour](self->_endComponents, "hour")
        && !-[NSDateComponents minute](self->_endComponents, "minute")
        && -[NSDateComponents second](self->_endComponents, "second") == 0;
      self->_timedEventEndedAtMidnight = v8;
    }
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 0, 1);
    if (self->_selectedSubitem == 2 && !self->_changingDate)
      -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", 0, 0);
    -[EKEventDateEditItem _updateClassicDateCellColors](self, "_updateClassicDateCellColors");
    -[EKEventDateEditItem _updateClassicDateCellTimeWidths](self, "_updateClassicDateCellTimeWidths");
    v5 = v9;
  }

}

- (void)_setAllDay:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_allDay != a3)
  {
    self->_allDay = a3;
    if (self->_showsAllDay)
    {
      -[EKEventDateEditItem _allDayCell](self, "_allDayCell");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOn:", self->_allDay);
      if (!self->_allDay)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventDateEditItem _setStartTimeZone:](self, "_setStartTimeZone:", v6);

        objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventDateEditItem _setEndTimeZone:](self, "_setEndTimeZone:", v7);

        if (!-[NSDateComponents hour](self->_startComponents, "hour")
          && !-[NSDateComponents minute](self->_startComponents, "minute")
          && !-[NSDateComponents second](self->_startComponents, "second")
          && -[NSDateComponents hour](self->_endComponents, "hour") == 23
          && -[NSDateComponents minute](self->_endComponents, "minute") == 59
          && -[NSDateComponents second](self->_endComponents, "second") == 59)
        {
          -[EKEventDateEditItem _pickNextReasonableTime](self, "_pickNextReasonableTime");
        }
      }

      *(_DWORD *)&a3 = self->_allDay;
    }
    if (a3 && (unint64_t)(self->_selectedSubitem - 1) <= 1)
      self->_currentPickerMode = 1;
    -[EKEventDateEditItem _adjustEndDateIfNeededAfterTogglingAllDay](self, "_adjustEndDateIfNeededAfterTogglingAllDay");
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
    -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", 0, 1);
    -[EKEventDateEditItem _updateClassicDateCellColors](self, "_updateClassicDateCellColors");
    -[EKEventDateEditItem _updateClassicDateCellTimeWidths](self, "_updateClassicDateCellTimeWidths");
  }
}

- (void)_adjustEndDateIfNeededAfterTogglingAllDay
{
  _BOOL4 allDay;
  NSDateComponents *endComponents;
  uint64_t v4;
  uint64_t v5;

  if (self->_timedEventEndedAtMidnight)
  {
    allDay = self->_allDay;
    endComponents = self->_endComponents;
    v4 = -[NSDateComponents day](endComponents, "day");
    if (allDay)
      v5 = v4 - 1;
    else
      v5 = v4 + 1;
    -[NSDateComponents setDay:](endComponents, "setDay:", v5);
  }
}

- (void)_validateTimezones
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  BOOL v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  v3 = (void *)CalCopyTimeZone();
  if ((-[NSTimeZone isUTC](self->_startTimeZone, "isUTC") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CUIKTimezonesDivergeAtDate();

    if ((v5 & 1) != 0)
      goto LABEL_5;
  }
  if ((-[NSTimeZone isUTC](self->_endTimeZone, "isUTC") & 1) != 0
    || (objc_msgSend(WeakRetained, "endDateUnadjustedForLegacyClients"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = CUIKTimezonesDivergeAtDate(),
        v6,
        (v7 & 1) == 0))
  {
    v8 = 0;
  }
  else
  {
LABEL_5:
    v8 = 1;
  }
  self->_showTimeZones = v8;

}

- (void)_setStartTimeZone:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToTimeZone:", self->_startTimeZone) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_startTimeZone, a3);
    -[EKEventDateEditItem _validateTimezones](self, "_validateTimezones");
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
  }

}

- (void)_setEndTimeZone:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToTimeZone:", self->_endTimeZone) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_endTimeZone, a3);
    -[EKEventDateEditItem _validateTimezones](self, "_validateTimezones");
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
  }

}

- (void)dateTimeCellDateTapped:(id)a3
{
  uint64_t v3;

  if (self->_modernStartDateCell == a3)
    v3 = 1;
  else
    v3 = 2;
  -[EKEventDateEditItem _showInlineControls:forSubitem:includingInlineDatePicker:](self, "_showInlineControls:forSubitem:includingInlineDatePicker:", 1, v3, 1);
}

- (void)dateTimeCellTimeTapped:(id)a3
{
  uint64_t v3;

  if (self->_modernStartDateCell == a3)
    v3 = 1;
  else
    v3 = 2;
  -[EKEventDateEditItem _showInlineControls:forSubitem:includingInlineDatePicker:](self, "_showInlineControls:forSubitem:includingInlineDatePicker:", 0, v3, 1);
}

- (void)dateTimeCell:(id)a3 dateChanged:(id)a4
{
  uint64_t v5;

  if (self->_modernStartDateCell == a3)
    v5 = 1;
  else
    v5 = 2;
  -[EKEventDateEditItem dateChanged:forSubitem:](self, "dateChanged:forSubitem:", a4, v5);
}

- (void)dateTimeCellBeganEditing:(id)a3
{
  uint64_t v3;

  if (self->_modernStartDateCell == a3)
    v3 = 1;
  else
    v3 = 2;
  -[EKEventDateEditItem _showInlineControls:forSubitem:includingInlineDatePicker:](self, "_showInlineControls:forSubitem:includingInlineDatePicker:", 0, v3, 0);
}

- (void)dateTimeCellEndedEditing:(id)a3
{
  int64_t selectedSubitem;

  if (!self->_modifyingVisibleControls)
  {
    selectedSubitem = self->_selectedSubitem;
    -[EKEventDateEditItem _hideInlineDateControls](self, "_hideInlineDateControls", a3);
    if (self->_pushingTZController)
      self->_targetedSubitemForTimezone = selectedSubitem;
  }
}

- (void)_showInlineControls:(int64_t)a3 forSubitem:(int64_t)a4 includingInlineDatePicker:(BOOL)a5
{
  int v5;
  int v9;
  int showingInlineDatePicker;
  int64_t selectedSubitem;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int *v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  void *v29;
  dispatch_time_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD block[5];
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;
  id v41;

  v5 = a5;
  if (*(_OWORD *)&self->_selectedSubitem == __PAIR128__(a3, a4))
  {
    -[EKEventDateEditItem _hideInlineDateControls](self, "_hideInlineDateControls");
    return;
  }
  v9 = -[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone");
  showingInlineDatePicker = self->_showingInlineDatePicker;
  self->_currentPickerMode = a3;
  self->_modifyingVisibleControls = 1;
  selectedSubitem = self->_selectedSubitem;
  if (selectedSubitem == a4)
  {
    self->_showingInlineDatePicker = v5;
    -[EKEventDateEditItem _updateDatePicker:animated:](self, "_updateDatePicker:animated:", 0, 0);
    -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", a4 == 1, a4 == 2);
    v12 = -[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone");
    v13 = 0;
    v14 = 0;
    if (v9 != v12)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v9)
        v13 = v15;
      else
        v13 = 0;
      if (v9)
        v14 = 0;
      else
        v14 = v15;
    }
    if (showingInlineDatePicker != v5)
    {
      v34 = (id)v14;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", a4) + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (showingInlineDatePicker)
      {
        if (v13)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v13);
          objc_msgSend(v18, "addIndexes:", v17);

          v13 = (uint64_t)v18;
        }
        else
        {
          v13 = v16;
        }
      }
      else if (v34)
      {
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v34);
        objc_msgSend(v32, "addIndexes:", v17);

        v34 = v32;
      }
      else
      {
        v34 = v16;
      }

      v14 = (uint64_t)v34;
    }
    v33 = (void *)MEMORY[0x1E0DC3F10];
    v35 = (id)v14;
    if (v14 | v13)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke;
      v39[3] = &unk_1E6018660;
      v39[4] = self;
      v40 = (id)v14;
      v41 = (id)v13;
      objc_msgSend(v33, "performWithoutAnimation:", v39, v35);

    }
    else
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_2;
      v38[3] = &unk_1E6018688;
      v38[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v38, v14);
    }
    self->_modifyingVisibleControls = 0;

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (selectedSubitem <= 2)
  {
    if (showingInlineDatePicker)
      objc_msgSend(v19, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
    if (v9)
      objc_msgSend(v19, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
  }
  if (selectedSubitem == 1)
  {
    v21 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
    goto LABEL_24;
  }
  if (selectedSubitem == 2)
  {
    v21 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
LABEL_24:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v21), "resetDatePickerSelection");
  }
  self->_selectedSubitem = a4;
  self->_showingInlineDatePicker = v5;
  v22 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", self->_selectedSubitem);
  v23 = v22 + 1;
  if (self->_showingInlineDatePicker)
  {
    v24 = v22;
    objc_msgSend(v20, "addIndex:", v23);
    v23 = v24 + 2;
  }
  if (-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone"))
    objc_msgSend(v20, "addIndex:", v23);
  if (objc_msgSend(v19, "count") || objc_msgSend(v20, "count"))
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "editItem:wantsRowInsertions:rowDeletions:", self, v20, v19);

    v26 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 1);
    v27 = -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 2) + 2 * (self->_selectedSubitem == 2);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addIndex:", v26);
    objc_msgSend(v28, "addIndex:", v27);
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_opt_respondsToSelector();

    if ((v27 & 1) != 0 && v5)
    {
      v30 = dispatch_time(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_3;
      block[3] = &unk_1E6018688;
      block[4] = self;
      dispatch_after(v30, MEMORY[0x1E0C80D38], block);
    }
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "editItem:wantsRowsScrolledToVisible:", self, v28);

  }
  self->_modifyingVisibleControls = 0;
  -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);

}

void __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editItem:wantsRowInsertions:rowDeletions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyRequiresHeightChange");
}

void __80__EKEventDateEditItem__showInlineControls_forSubitem_includingInlineDatePicker___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editItemWantsFirstResponderResigned:", *(_QWORD *)(a1 + 32));

}

- (void)_hideInlineDateControls
{
  int64_t selectedSubitem;
  int *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_selectedSubitem == 5)
    return;
  if (!-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
  {
    selectedSubitem = self->_selectedSubitem;
    if (selectedSubitem == 1)
    {
      v4 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
      goto LABEL_7;
    }
    if (selectedSubitem == 2)
    {
      v4 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
LABEL_7:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "resetDatePickerSelection");
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (self->_showingInlineDatePicker)
    objc_msgSend(v5, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 4));
  if (-[EKEventDateEditItem _shouldShowTimeZone](self, "_shouldShowTimeZone"))
    objc_msgSend(v7, "addIndex:", -[EKEventDateEditItem _rowForSubitem:](self, "_rowForSubitem:", 3));
  self->_selectedSubitem = 5;
  self->_showingInlineDatePicker = 0;
  if (objc_msgSend(v7, "count"))
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editItem:wantsRowInsertions:rowDeletions:", self, 0, v7);

  }
  -[EKEventDateEditItem _updateClassicDateCellColors](self, "_updateClassicDateCellColors");
  -[EKEventDateEditItem _resetStartString:endString:](self, "_resetStartString:endString:", 1, 1);
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");

}

- (void)_pickNextReasonableTime
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  CUIKNowComponentsSystemTime();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setHour:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v4, v11, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDateEditItem _dateComponentsInSystemCalendarFromDate:](self, "_dateComponentsInSystemCalendarFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents setHour:](self->_startComponents, "setHour:", objc_msgSend(v7, "hour"));

  -[NSDateComponents setMinute:](self->_startComponents, "setMinute:", 0);
  -[NSDateComponents setSecond:](self->_startComponents, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v4, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDateEditItem _dateComponentsInSystemCalendarFromDate:](self, "_dateComponentsInSystemCalendarFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents setHour:](self->_endComponents, "setHour:", objc_msgSend(v10, "hour"));

  -[NSDateComponents setMinute:](self->_endComponents, "setMinute:", 0);
  -[NSDateComponents setSecond:](self->_endComponents, "setSecond:", 0);

}

- (void)_resetClassicStartString:(BOOL)a3 endString:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSTimeZone *startTimeZone;
  void *v8;
  NSTimeZone *endTimeZone;
  NSTimeZone *v10;
  NSDateComponents *startComponents;
  _BOOL4 allDay;
  char v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSTimeZone *v18;
  NSDateComponents *v19;
  NSDateComponents *endComponents;
  _BOOL4 v21;
  char v22;
  id v23;
  id v24;
  NSDateComponents *v25;
  NSDateComponents *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v4 = a4;
  if (a3 && self->_startComponents)
  {
    -[EKEventDateEditItem _classicStartDateCell](self, "_classicStartDateCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_showTimeZones)
        startTimeZone = self->_startTimeZone;
      else
        startTimeZone = 0;
      v10 = startTimeZone;
      startComponents = self->_startComponents;
      allDay = self->_allDay;
      v13 = self->_shorteningStatus != 0;
      v31 = 0;
      v32 = 0;
      _StringValuePartsForDateComponents(startComponents, 0, v10, allDay, 0, v13, &v32, &v31);
      v14 = v32;
      v15 = v31;
      if (EKUIUsesLargeTextLayout(0))
      {
        objc_msgSend(v6, "detailTextLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v14);

        objc_msgSend(v6, "largePart2TextLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v15);
      }
      else
      {
        objc_msgSend(v6, "twoPartTextLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTextPart1:part2:", v14, v15);
      }

      objc_msgSend(v6, "setNeedsLayout");
      if (!v4)
        goto LABEL_17;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  if (!v4)
  {
LABEL_17:
    v8 = v6;
    goto LABEL_23;
  }
LABEL_8:
  if (!self->_endComponents)
    goto LABEL_17;
  -[EKEventDateEditItem _classicEndDateCell](self, "_classicEndDateCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (self->_showTimeZones)
      endTimeZone = self->_endTimeZone;
    else
      endTimeZone = 0;
    v18 = endTimeZone;
    v19 = (NSDateComponents *)-[NSDateComponents copy](self->_startComponents, "copy");
    endComponents = self->_endComponents;
    v21 = self->_allDay;
    v22 = self->_shorteningStatus != 0;
    v29 = 0;
    v30 = 0;
    _StringValuePartsForDateComponents(endComponents, v19, v18, v21, 0, v22, &v30, &v29);
    v23 = v30;
    v24 = v29;
    v25 = self->_startComponents;
    self->_startComponents = v19;
    v26 = v19;

    if (EKUIUsesLargeTextLayout(0))
    {
      objc_msgSend(v8, "detailTextLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v23);

      objc_msgSend(v8, "largePart2TextLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setText:", v24);
    }
    else
    {
      objc_msgSend(v8, "twoPartTextLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextPart1:part2:", v23, v24);
    }

    objc_msgSend(v8, "setNeedsLayout");
  }
LABEL_23:

}

- (void)_resetStartString:(BOOL)a3 endString:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSTimeZone *startTimeZone;
  void *v10;
  NSDateComponents *v11;
  NSDateComponents *startComponents;
  NSDateComponents *v13;
  _BOOL8 v14;
  NSTimeZone *endTimeZone;
  id v16;

  v4 = a4;
  v5 = a3;
  if (-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI"))
  {
    -[EKEventDateEditItem _resetClassicStartString:endString:](self, "_resetClassicStartString:endString:", v5, v4);
    return;
  }
  if (!v5 || !self->_startComponents)
  {
    v8 = 0;
LABEL_9:
    if (!v4)
      goto LABEL_16;
    goto LABEL_10;
  }
  -[EKEventDateEditItem _modernStartDateCell](self, "_modernStartDateCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  if (self->_showTimeZones)
    startTimeZone = self->_startTimeZone;
  else
    startTimeZone = 0;
  objc_msgSend(v7, "updateWithDate:timeZone:allDay:needsStrikethrough:", self->_startComponents, startTimeZone, self->_allDay, 0);
  objc_msgSend(v8, "setNeedsLayout");
  if (!v4)
    goto LABEL_16;
LABEL_10:
  if (self->_endComponents)
  {
    -[EKEventDateEditItem _modernEndDateCell](self, "_modernEndDateCell");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v16;
    if (v16)
    {
      v11 = (NSDateComponents *)-[NSDateComponents copy](self->_startComponents, "copy");
      startComponents = self->_startComponents;
      self->_startComponents = v11;
      v13 = v11;

      v14 = -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate");
      if (self->_showTimeZones)
        endTimeZone = self->_endTimeZone;
      else
        endTimeZone = 0;
      objc_msgSend(v16, "updateWithDate:timeZone:allDay:needsStrikethrough:", self->_endComponents, endTimeZone, self->_allDay, v14);

      objc_msgSend(v16, "setNeedsLayout");
      v10 = v16;
    }
    goto LABEL_19;
  }
LABEL_16:
  v10 = v8;
LABEL_19:

}

- (BOOL)_endDateIsBeforeStartDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSTimeZone *endTimeZone;

  if (!self->_startComponents || !self->_endComponents)
    return 0;
  if (self->_allDay)
  {
    v3 = (void *)-[NSDateComponents copy](self->_startComponents, "copy");
    objc_msgSend(v3, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v3, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v3, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
    v4 = (void *)-[NSDateComponents copy](self->_endComponents, "copy");
    objc_msgSend(v4, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v4, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v4, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
    -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKEventDateEditItem _dateFromComponents:timeZone:](self, "_dateFromComponents:timeZone:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_showTimeZones)
      endTimeZone = self->_endTimeZone;
    else
      endTimeZone = 0;
    -[EKEventDateEditItem _dateFromComponents:timeZone:](self, "_dateFromComponents:timeZone:", self->_endComponents, endTimeZone);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "compare:", v5) == -1;

  return v7;
}

- (void)_updateDatePicker:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t currentPickerMode;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIDatePicker *endDatePicker;
  int64_t selectedSubitem;
  _BOOL4 v12;
  int *v13;
  id v14;
  void *v15;
  BOOL v16;
  int *v17;
  id v18;
  void *v19;
  int *v20;
  id v21;
  int *v22;
  id v23;
  _BOOL8 v24;
  id v25;
  UIDatePicker *v26;

  v4 = a4;
  v26 = (UIDatePicker *)a3;
  currentPickerMode = self->_currentPickerMode;
  v16 = !-[EKEventDateEditItem usesClassicUI](self, "usesClassicUI");
  v7 = 4272;
  if (v16)
    v7 = currentPickerMode;
  if (v7)
    v8 = 3;
  else
    v8 = 1;
  if (self->_allDay)
    v9 = 1;
  else
    v9 = v7;
  if (v26)
  {
    -[UIDatePicker setPreferredDatePickerStyle:](v26, "setPreferredDatePickerStyle:", v8);
    endDatePicker = v26;
  }
  else
  {
    -[UIDatePicker setPreferredDatePickerStyle:](self->_startDatePicker, "setPreferredDatePickerStyle:", v8);
    -[UIDatePicker setPreferredDatePickerStyle:](self->_endDatePicker, "setPreferredDatePickerStyle:", v8);
    -[UIDatePicker setDatePickerMode:](self->_startDatePicker, "setDatePickerMode:", v9);
    endDatePicker = self->_endDatePicker;
  }
  -[UIDatePicker setDatePickerMode:](endDatePicker, "setDatePickerMode:", v9);
  if (self->_selectedSubitem != 1)
  {
    v12 = (unint64_t)(self->_selectedSubitem - 1) < 2;
    goto LABEL_19;
  }
  if (self->_startComponents && self->_endComponents)
  {
    self->_endTimeWasMessedUp = -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate");
    selectedSubitem = self->_selectedSubitem;
    v12 = (unint64_t)(selectedSubitem - 1) < 2;
    if (selectedSubitem == 1)
      goto LABEL_21;
LABEL_19:
    v13 = &OBJC_IVAR___EKEventDateEditItem__endComponents;
    goto LABEL_22;
  }
  v12 = 1;
LABEL_21:
  v13 = &OBJC_IVAR___EKEventDateEditItem__startComponents;
LABEL_22:
  v14 = *(id *)((char *)&self->super.super.super.isa + *v13);
  v15 = v14;
  v16 = !v12 || v14 == 0;
  if (!v16)
  {
    if (self->_selectedSubitem == 1)
      v17 = &OBJC_IVAR___EKEventDateEditItem__startDatePicker;
    else
      v17 = &OBJC_IVAR___EKEventDateEditItem__endDatePicker;
    v18 = *(id *)((char *)&self->super.super.super.isa + *v17);
    -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDate:animated:", v19, v4);
    if (self->_selectedSubitem == 1)
      v20 = &OBJC_IVAR___EKEventDateEditItem__modernStartDateCell;
    else
      v20 = &OBJC_IVAR___EKEventDateEditItem__modernEndDateCell;
    v21 = *(id *)((char *)&self->super.super.super.isa + *v20);
    if (self->_selectedSubitem == 1)
      v22 = &OBJC_IVAR___EKEventDateEditItem__startTimeZone;
    else
      v22 = &OBJC_IVAR___EKEventDateEditItem__endTimeZone;
    v23 = *(id *)((char *)&self->super.super.super.isa + *v22);
    v24 = self->_selectedSubitem == 2
       && -[EKEventDateEditItem _endDateIsBeforeStartDate](self, "_endDateIsBeforeStartDate");
    if (self->_showTimeZones)
      v25 = v23;
    else
      v25 = 0;
    objc_msgSend(v21, "updateWithDate:timeZone:allDay:needsStrikethrough:", v15, v25, self->_allDay, v24);

  }
}

- (void)_datePickerChanged:(id)a3
{
  UIDatePicker *v4;
  UIDatePicker *startDatePicker;
  uint64_t v6;
  id v7;

  v4 = (UIDatePicker *)a3;
  -[UIDatePicker date](v4, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  startDatePicker = self->_startDatePicker;

  if (startDatePicker == v4)
    v6 = 1;
  else
    v6 = 2;
  -[EKEventDateEditItem dateChanged:forSubitem:](self, "dateChanged:forSubitem:", v7, v6);

}

- (void)dateChanged:(id)a3 forSubitem:(int64_t)a4
{
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
  id v17;

  v17 = a3;
  self->_changingDate = 1;
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editItem:wantsDoneButtonDisabled:", self, 0);

  -[EKEventDateEditItem _dateComponentsInSystemCalendarFromDate:](self, "_dateComponentsInSystemCalendarFromDate:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 2)
  {
    -[EKEventDateEditItem _setEndDate:](self, "_setEndDate:", v7);
  }
  else if (a4 == 1)
  {
    v8 = (void *)-[NSDateComponents copy](self->_startComponents, "copy");
    -[EKEventDateEditItem _setStartDate:](self, "_setStartDate:", v7);
    if (!self->_endTimeWasMessedUp)
    {
      -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", self->_endComponents);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDateEditItem _dateInSystemCalendarFromComponents:](self, "_dateInSystemCalendarFromComponents:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      objc_msgSend(v17, "dateByAddingTimeInterval:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDateEditItem _dateComponentsInSystemCalendarFromDate:](self, "_dateComponentsInSystemCalendarFromDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDateEditItem _setEndDate:](self, "_setEndDate:", v12);

    }
  }
  self->_changingDate = 0;
  -[EKEventDateEditItem eventDateEditItemDelegate](self, "eventDateEditItemDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[EKEventDateEditItem _calendarForEventComponents:](self, "_calendarForEventComponents:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDateEditItem eventDateEditItemDelegate](self, "eventDateEditItemDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", self->_startComponents);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateChangedTo:", v16);

  }
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");

}

- (void)_allDayChanged:(id)a3
{
  self->_changingDate = 1;
  -[EKEventDateEditItem _setAllDay:](self, "_setAllDay:", objc_msgSend(a3, "isOn"));
  self->_changingDate = 0;
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");
}

- (id)_timeZoneDescription:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "cityName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Floating"), &stru_1E601DFA8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_dateInSystemCalendarFromComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dateFromComponents:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (v6)
    objc_msgSend(v8, "setTimeZone:", v6);
  objc_msgSend(v8, "dateFromComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dateComponentsInSystemCalendarFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 254, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldShowTimeZone
{
  return !self->_allDay
      && !self->_proposedTime
      && (unint64_t)(self->_selectedSubitem - 1) <= 1
      && self->_currentPickerMode == 0;
}

- (BOOL)showsAllDay
{
  return self->_showsAllDay;
}

- (void)setShowsAllDay:(BOOL)a3
{
  self->_showsAllDay = a3;
}

- (BOOL)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(BOOL)a3
{
  self->_proposedTime = a3;
}

- (NSDate)pendingProposedTime
{
  return self->_pendingProposedTime;
}

- (void)setPendingProposedTime:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProposedTime, a3);
}

- (EKEventDateEditItemDelegate)eventDateEditItemDelegate
{
  return (EKEventDateEditItemDelegate *)objc_loadWeakRetained((id *)&self->_eventDateEditItemDelegate);
}

- (void)setEventDateEditItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDateEditItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventDateEditItemDelegate);
  objc_storeStrong((id *)&self->_pendingProposedTime, 0);
  objc_storeStrong((id *)&self->_endPickerConstraints, 0);
  objc_storeStrong((id *)&self->_startPickerConstraints, 0);
  objc_storeStrong((id *)&self->_endDatePicker, 0);
  objc_storeStrong((id *)&self->_startDatePicker, 0);
  objc_storeStrong((id *)&self->_endDatePickerCell, 0);
  objc_storeStrong((id *)&self->_startDatePickerCell, 0);
  objc_storeStrong((id *)&self->_endTimeZoneCell, 0);
  objc_storeStrong((id *)&self->_startTimeZoneCell, 0);
  objc_storeStrong((id *)&self->_allDayCell, 0);
  objc_storeStrong((id *)&self->_classicEndDateCell, 0);
  objc_storeStrong((id *)&self->_classicStartDateCell, 0);
  objc_storeStrong((id *)&self->_modernEndDateCell, 0);
  objc_storeStrong((id *)&self->_modernStartDateCell, 0);
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_endComponents, 0);
  objc_storeStrong((id *)&self->_startComponents, 0);
}

@end
