@implementation EKCalendarItemRecurrenceEditItem

- (EKCalendarItemRecurrenceEditItem)init
{
  EKCalendarItemRecurrenceEditItem *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  v2 = -[EKCalendarItemRecurrenceEditItem init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  -[EKCalendarItemRecurrenceEditItem dealloc](&v4, sel_dealloc);
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(a3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maxRecurrencesAllowed");

  if (!v6)
    return 0;
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isOrWasPartOfRecurringSeries") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "allowsRecurrenceModifications");

  }
  return v8;
}

- (void)refreshFromCalendarItemAndStore
{
  id v2;
  NSDate **p_repeatEnd;
  NSDate *repeatEnd;
  NSString *customRepeatDescription;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  id v26;
  void *v27;
  int64_t *p_repeatType;
  void *v29;
  _QWORD block[5];
  id v31;
  uint64_t v32;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)EKCalendarItemRecurrenceEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v33, sel_refreshFromCalendarItemAndStore);
  p_repeatType = &self->_repeatType;
  self->_repeatType = 0;
  p_repeatEnd = &self->_repeatEnd;
  repeatEnd = self->_repeatEnd;
  self->_repeatEnd = 0;

  customRepeatDescription = self->_customRepeatDescription;
  self->_customRepeatDescription = 0;

  -[EKCalendarItemRecurrenceEditItem recurrenceDate](self, "recurrenceDate");
  v7 = objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemRecurrenceEditItem recurrenceTimeZone](self, "recurrenceTimeZone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);
  objc_msgSend(WeakRetained, "singleRecurrenceRule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v26 = objc_loadWeakRetained((id *)&self->super._calendarItem);
    objc_msgSend(v26, "singleRecurrenceRule");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_loadWeakRetained((id *)&self->super._calendarItem);
  v12 = objc_msgSend(v11, "isFloating");
  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v2 = objc_loadWeakRetained((id *)&self->super._store);
    objc_msgSend(v2, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = 0;
  v27 = (void *)v7;
  CUIKGetTypeAndEndDateForRecurrenceRules();
  v14 = 0;
  if ((v12 & 1) == 0)
  {

  }
  if (v9)
  {

  }
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isFloating") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v29;
  }
  v17 = v16;

  v18 = (void *)CalCopySystemTimeZone();
  if ((objc_msgSend(v18, "isEquivalentTo:", v17) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v14, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "calendarDateInTimeZone:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "date");
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v21;
  }
  objc_storeStrong((id *)&self->_repeatEnd, v14);
  -[EKCalendarItemRecurrenceEditItem _updateMinRecurrenceEndDate](self, "_updateMinRecurrenceEndDate");
  if (self->_originalRepeatType != *p_repeatType)
  {
    self->_originalRepeatType = *p_repeatType;
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "editItemWantsFooterTitlesToReload:", self);

  }
  objc_storeStrong((id *)&self->_originalRepeatEnd, *p_repeatEnd);
  -[EKCalendarItemRecurrenceEditItem minRecurrenceEndDate](self, "minRecurrenceEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate compare:](*p_repeatEnd, "compare:", v23) == NSOrderedAscending)
  {
    v24 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__EKCalendarItemRecurrenceEditItem_refreshFromCalendarItemAndStore__block_invoke;
    block[3] = &unk_1E6018EC0;
    block[4] = self;
    v31 = v23;
    dispatch_after(v24, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __67__EKCalendarItemRecurrenceEditItem_refreshFromCalendarItemAndStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveNewRepeatEndDate:", *(_QWORD *)(a1 + 40));
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  NSDate *repeatEnd;
  void *v6;
  void *v7;
  NSDate *v8;
  void *v9;
  NSDate *v10;
  void *v11;

  if (self->_repeatType == self->_originalRepeatType)
  {
    repeatEnd = self->_repeatEnd;
    if (repeatEnd == self->_originalRepeatEnd || -[NSDate isEqualToDate:](repeatEnd, "isEqualToDate:"))
      return 0;
  }
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isOrWasPartOfRecurringSeries"))
  {
    objc_msgSend(v6, "singleRecurrenceRule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = self->_repeatEnd;
  if (v8)
  {
    objc_msgSend(v7, "recurrenceEnd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      objc_msgSend(MEMORY[0x1E0CAA108], "recurrenceEndWithEndDate:", self->_repeatEnd);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRecurrenceEnd:", v11);

    }
  }
  else
  {
    objc_msgSend(v7, "setRecurrenceEnd:", 0);
  }

  return 1;
}

- (unint64_t)subitemAtIndex:(unint64_t)a3
{
  BOOL v3;

  if (a3)
    v3 = self->_repeatType == 6;
  else
    v3 = 1;
  if (v3)
    return a3;
  else
    return a3 + 1;
}

- (unint64_t)indexForSubitem:(unint64_t)a3
{
  BOOL v3;
  uint64_t v4;

  if (a3)
    v3 = self->_repeatType == 6;
  else
    v3 = 1;
  v4 = !v3;
  return a3 - v4;
}

- (unint64_t)numberOfSubitems
{
  int64_t repeatType;
  uint64_t v3;
  uint64_t v4;

  repeatType = self->_repeatType;
  if (repeatType)
  {
    v3 = 2;
    if (self->_repeatEnd)
      v3 = 3;
  }
  else
  {
    v3 = 1;
  }
  if (repeatType == 6)
    v4 = v3 + 1;
  else
    v4 = v3;
  return v4 + self->_showingDatePicker;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUIPopupTableViewCell *v4;
  EKUIPopupTableViewCell *repeatCell;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKUIPopupTableViewCell *v10;
  EKUIPopupTableViewCell *v11;
  UITableViewCell *customCell;
  UITableViewCell *v13;
  UITableViewCell *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  EKDateTimeCell *v29;
  EKDateTimeCell *endDateCell;
  EKDateTimeCell *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  EKUITableViewCell *v48;
  EKUITableViewCell *endDatePickerCell;
  UIDatePicker *v50;
  UIDatePicker *endDatePicker;
  void *v52;
  void *v53;
  UIDatePicker *v54;
  void *v55;
  void *v56;
  UIDatePicker *v57;
  void *v58;
  void *v59;
  UIDatePicker *v60;
  void *v61;
  void *v62;
  void *v63;
  UIDatePicker *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;

  switch(-[EKCalendarItemRecurrenceEditItem subitemAtIndex:](self, "subitemAtIndex:", a3))
  {
    case 0uLL:
      if (!self->_repeatCell)
      {
        v4 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
        repeatCell = self->_repeatCell;
        self->_repeatCell = v4;

        EventKitUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Repeat"), &stru_1E601DFA8, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIPopupTableViewCell textLabel](self->_repeatCell, "textLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v7);

      }
      -[EKCalendarItemRecurrenceEditItem repeatPopupMenu](self, "repeatPopupMenu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell setPopupMenu:](self->_repeatCell, "setPopupMenu:", v9);

      v10 = self->_repeatCell;
      goto LABEL_24;
    case 1uLL:
      customCell = self->_customCell;
      if (!customCell)
      {
        v13 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
        v14 = self->_customCell;
        self->_customCell = v13;

        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell textLabel](self->_customCell, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFont:", v15);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell textLabel](self->_customCell, "textLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTextColor:", v17);

        -[UITableViewCell setAccessoryType:](self->_customCell, "setAccessoryType:", 1);
        -[UITableViewCell textLabel](self->_customCell, "textLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNumberOfLines:", 0);

        customCell = self->_customCell;
      }
      v11 = customCell;
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recurrenceRules");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "singleRecurrenceRule");
        v24 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "startDateForRecurrence");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "eventStore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "timeZone");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKStringForRecurrenceRule();
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Repeats %@"), &stru_1E601DFA8, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        v45 = v41;
      else
        v45 = &stru_1E601DFA8;
      objc_msgSend(v42, "localizedStringWithFormat:", v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell textLabel](v11, "textLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setText:", v46);

      goto LABEL_21;
    case 2uLL:
      v11 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
      EventKitUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("End Repeat"), &stru_1E601DFA8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell textLabel](v11, "textLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v26);

      -[EKCalendarItemRecurrenceEditItem endRepeatPopupMenu](self, "endRepeatPopupMenu");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell setPopupMenu:](v11, "setPopupMenu:", v28);

      return v11;
    case 3uLL:
      if (!self->_endDateCell)
      {
        v29 = -[EKDateTimeCell initWithStyle:reuseIdentifier:]([EKDateTimeCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
        endDateCell = self->_endDateCell;
        self->_endDateCell = v29;

        -[EKDateTimeCell setDateTimeDelegate:](self->_endDateCell, "setDateTimeDelegate:", self);
        v31 = self->_endDateCell;
        EventKitUIBundle();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("End Date"), &stru_1E601DFA8, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKDateTimeCell setTitle:](v31, "setTitle:", v33);

      }
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "components:fromDate:", 254, self->_repeatEnd);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      -[EKDateTimeCell updateWithDate:timeZone:allDay:needsStrikethrough:](self->_endDateCell, "updateWithDate:timeZone:allDay:needsStrikethrough:", v24, 0, 1, 0);
      v11 = self->_endDateCell;
LABEL_21:

      break;
    case 4uLL:
      if (!self->_endDatePickerCell)
      {
        v48 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
        endDatePickerCell = self->_endDatePickerCell;
        self->_endDatePickerCell = v48;

        v50 = -[EKCalendarItemRecurrenceEditItem _newDatePicker](self, "_newDatePicker");
        endDatePicker = self->_endDatePicker;
        self->_endDatePicker = v50;

        -[EKUITableViewCell contentView](self->_endDatePickerCell, "contentView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addSubview:", self->_endDatePicker);

        v70 = (void *)MEMORY[0x1E0C99DE8];
        v53 = (void *)MEMORY[0x1E0CB3718];
        v54 = self->_endDatePicker;
        -[EKUITableViewCell contentView](self->_endDatePickerCell, "contentView");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 5, 0, v71, 5, 1.0, 0.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB3718];
        v57 = self->_endDatePicker;
        -[EKUITableViewCell contentView](self->_endDatePickerCell, "contentView");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 6, 0, v69, 6, 1.0, 0.0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x1E0CB3718];
        v60 = self->_endDatePicker;
        -[EKUITableViewCell contentView](self->_endDatePickerCell, "contentView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v60, 4, 0, v61, 4, 1.0, 0.0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)MEMORY[0x1E0CB3718];
        v64 = self->_endDatePicker;
        -[EKUITableViewCell contentView](self->_endDatePickerCell, "contentView");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v64, 3, 0, v65, 3, 1.0, 0.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "arrayWithObjects:", v55, v58, v62, v66, 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v67);
      }
      -[UIDatePicker setDate:](self->_endDatePicker, "setDate:", self->_repeatEnd);
      -[EKCalendarItemRecurrenceEditItem _updateMinRecurrenceEndDate](self, "_updateMinRecurrenceEndDate");
      v10 = (EKUIPopupTableViewCell *)self->_endDatePickerCell;
LABEL_24:
      v11 = v10;
      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

- (id)repeatPopupMenu
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19[2];
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1E0DC3428];
    CUIKStringForRepeatTypeDetail();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke;
    v18[3] = &unk_1E601C7F0;
    objc_copyWeak(v19, &location);
    v19[1] = v4;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == (char *)self->_repeatType)
      objc_msgSend(v7, "setState:", 1);
    objc_msgSend(v3, "addObject:", v7);

    objc_destroyWeak(v19);
    ++v4;
  }
  while (v4 != (char *)6);
  CalAddInlineMenuItemArrayToArray(v15, (const char *)v3);
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3428];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke_2;
  v16[3] = &unk_1E6019DA8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_repeatType == 6)
    objc_msgSend(v11, "setState:", 1);
  objc_msgSend(v15, "addObject:", v12);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "recurrenceRuleFromRepeatType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "_validateRecurrenceType:", v2))
  {
    WeakRetained[128] = 0;
    objc_msgSend(WeakRetained, "notifySubitemDidSave:", 0);
  }

}

void __51__EKCalendarItemRecurrenceEditItem_repeatPopupMenu__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained[6] != 6)
  {
    WeakRetained[6] = 6;
    objc_msgSend(WeakRetained, "calendarItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CAA120];
    objc_msgSend(v2, "calendarItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "singleRecurrenceRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recurrenceEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recurrenceRuleWithType:interval:end:", 0, 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRecurrenceRules:", v9);

    objc_msgSend(v2, "notifySubitemDidSave:", 0);
  }
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_presentCustomRecurrenceVC, 0, 0.1);

}

- (id)endRepeatPopupMenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend((id)objc_opt_class(), "_neverLocalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke;
  v18[3] = &unk_1E6019DA8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("On Date"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3428];
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke_2;
  v16[3] = &unk_1E60193D0;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!self->_repeatEnd)
    v10 = v6;
  objc_msgSend(v10, "setState:", 1);
  v12 = (void *)MEMORY[0x1E0DC39D0];
  v21[0] = v6;
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v14;
}

void __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[128] = 0;
  objc_msgSend(WeakRetained, "saveNewRepeatEndDate:", 0);

}

void __54__EKCalendarItemRecurrenceEditItem_endRepeatPopupMenu__block_invoke_2(uint64_t a1)
{
  void *v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[128] = 0;
  objc_msgSend(*(id *)(a1 + 32), "bestInitialEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "saveNewRepeatEndDate:", v2);

}

- (id)_newDatePicker
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
  objc_msgSend(v3, "setPreferredDatePickerStyle:", 3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setDatePickerMode:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstWeekday:", CUIKOneIndexedWeekStart());
  objc_msgSend(v3, "setCalendar:", v4);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__datePickerChanged_, 4096);

  return v3;
}

+ (id)_neverLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Never"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recurrenceRuleFromRepeatType:(int64_t)a3
{
  void *v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    if (a3 == 6)
    {
      v3 = 0;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0CAA120]);
      v7 = CUIKRecurrenceFrequencyForRepeatType();
      v3 = (void *)objc_msgSend(v6, "initRecurrenceWithFrequency:interval:end:", v7, CUIKIntervalForRepeatType(), 0);
    }
  }
  else
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isMainOccurrence") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v5, "singleRecurrenceRule");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItemRecurrenceEditItem saveNewRepeatEndDate:](self, "saveNewRepeatEndDate:", v8);

    }
  }
  return v3;
}

- (void)_datePickerChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemRecurrenceEditItem saveNewRepeatEndDate:](self, "saveNewRepeatEndDate:", v4);

}

- (void)saveNewRepeatEndDate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_storeStrong((id *)&self->_repeatEnd, a3);
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isOrWasPartOfRecurringSeries"))
  {
    objc_msgSend(v5, "singleRecurrenceRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (self->_repeatEnd)
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isFloating") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    else
      -[EKCalendarItemRecurrenceEditItem recurrenceTimeZone](self, "recurrenceTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)CalCopySystemTimeZone();
    objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v25, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calendarDateInTimeZone:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "recurrenceEnd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v11, "date");
      v23 = v8;
      v24 = v5;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recurrenceEnd");
      v16 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "isEqualToDate:", v18);

      v9 = v16;
      v8 = v23;
      v5 = v24;

      if ((v19 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    v20 = (void *)MEMORY[0x1E0CAA108];
    objc_msgSend(v11, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recurrenceEndWithEndDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecurrenceEnd:", v22);

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(v6, "setRecurrenceEnd:", 0);
LABEL_15:
  -[EKCalendarItemRecurrenceEditItem _updateMinRecurrenceEndDate](self, "_updateMinRecurrenceEndDate");
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);

}

- (void)_updateMinRecurrenceEndDate
{
  id v3;

  -[EKCalendarItemRecurrenceEditItem minRecurrenceEndDate](self, "minRecurrenceEndDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setMinimumDate:](self->_endDatePicker, "setMinimumDate:", v3);

}

- (BOOL)_validateRecurrenceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int64_t *p_repeatType;
  id v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  int64_t *v32;
  BOOL v33;
  void *v34;
  void *v35;
  int64_t *p_originalRepeatType;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v45[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[EKCalendarItemRecurrenceEditItem recurrenceDate](self, "recurrenceDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemRecurrenceEditItem recurrenceTimeZone](self, "recurrenceTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);
  if (objc_msgSend(WeakRetained, "isFloating"))
  {
    p_repeatType = &self->_repeatType;
    CUIKGetTypeAndEndDateForRecurrenceRules();
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->super._store);
    objc_msgSend(v11, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_repeatType = &self->_repeatType;
    CUIKGetTypeAndEndDateForRecurrenceRules();

  }
  if (v5)

  if (*p_repeatType)
  {
    if (*p_repeatType != 6)
    {
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v15, "source");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraints");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "eventDurationConstrainedToRecurrenceInterval");

        if (v25)
        {
          -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v26 = objc_loadWeakRetained((id *)&self->super._store);
          objc_msgSend(v26, "timeZone");

          objc_msgSend(v17, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSinceReferenceDate");

          objc_msgSend(v17, "endDateUnadjustedForLegacyClients");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timeIntervalSinceReferenceDate");
          v30 = v29;

          v42 = 0u;
          v43 = 0u;
          CUIKRecurrenceFrequencyForRepeatType();
          CUIKIntervalForRepeatType();
          CUIKGregorianUnitsForRecurrenceTypeAndInterval();
          v40 = 0u;
          v41 = 0u;
          CalAbsoluteTimeAddGregorianUnits();
          if (v31 < v30)
          {
            -[EKCalendarItemEditItem delegate](self, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "viewControllerForEditItem:", self);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarItemEditItem delegate](self, "delegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "defaultAlertTitleForEditItem:", self);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            PresentValidationAlertWithDefaultTitle(v19, v20, v38);

            goto LABEL_30;
          }
          goto LABEL_18;
        }
      }
LABEL_19:

      goto LABEL_20;
    }
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v16 = objc_msgSend(v15, "validateRecurrenceRule:error:", v5, &v39);
      v17 = v39;
      if ((v16 & 1) == 0)
      {
        -[EKCalendarItemEditItem delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "viewControllerForEditItem:", self);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemEditItem delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "defaultAlertTitleForEditItem:", self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PresentValidationAlertWithDefaultTitle(v19, v17, v21);
LABEL_30:

        v33 = 0;
        p_originalRepeatType = &self->_originalRepeatType;
LABEL_27:
        *p_repeatType = *p_originalRepeatType;
        goto LABEL_28;
      }
      goto LABEL_18;
    }
  }
LABEL_20:
  v32 = &self->_originalRepeatType;
  if (*p_repeatType == 6 || *p_repeatType != *v32)
  {
    if (v5)
    {
      v44 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRecurrenceRules:", v34);

    }
    else
    {
      -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setRecurrenceRules:", 0);
    }

    v33 = 1;
    p_originalRepeatType = p_repeatType;
    p_repeatType = v32;
    goto LABEL_27;
  }
  v33 = 1;
LABEL_28:

  return v33;
}

- (void)presentCustomRecurrenceVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  EKUICustomRecurrenceViewController *v9;
  void *v10;
  void *v11;
  EKUICustomRecurrenceViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EKUIPopupTableViewCell *customCell;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id location;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isOrWasPartOfRecurringSeries"))
  {
    -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "singleRecurrenceRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v9 = [EKUICustomRecurrenceViewController alloc];
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDateForRecurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKUICustomRecurrenceViewController initWithStartDate:timeZone:clearBackground:](v9, "initWithStartDate:timeZone:clearBackground:", v11, v5, 0);

  -[EKUICustomRecurrenceViewController setRecurrenceRule:](v12, "setRecurrenceRule:", v8);
  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUICustomRecurrenceViewController setProhibitsMultipleDaysInMonthlyRecurrence:](v12, "setProhibitsMultipleDaysInMonthlyRecurrence:", objc_msgSend(v16, "prohibitsMultipleDaysInMonthlyRecurrence"));
  -[EKUICustomRecurrenceViewController setProhibitsMultipleMonthsInYearlyRecurrence:](v12, "setProhibitsMultipleMonthsInYearlyRecurrence:", objc_msgSend(v16, "prohibitsMultipleMonthsInYearlyRecurrence"));
  -[EKUICustomRecurrenceViewController setProhibitsYearlyRecurrenceInterval:](v12, "setProhibitsYearlyRecurrenceInterval:", objc_msgSend(v16, "prohibitsYearlyRecurrenceInterval"));
  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __61__EKCalendarItemRecurrenceEditItem_presentCustomRecurrenceVC__block_invoke;
  v24 = &unk_1E601C818;
  objc_copyWeak(&v25, &location);
  -[EKUICustomRecurrenceViewController setCompletionBlock:](v12, "setCompletionBlock:", &v21);
  -[EKUICustomRecurrenceViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 7, v21, v22, v23, v24);
  -[EKUICustomRecurrenceViewController popoverPresentationController](v12, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  customCell = (EKUIPopupTableViewCell *)self->_customCell;
  if (!customCell)
    customCell = self->_repeatCell;
  objc_msgSend(v17, "setSourceView:", customCell);
  objc_msgSend(v18, "setPermittedArrowDirections:", 12);
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(0) || EKUIUseLargeFormatPhoneUI())
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "editItem:wantsViewControllerPushed:", self, v12);
  }
  else
  {
    -[EKCalendarItemEditItem delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "editItem:wantsViewControllerPresented:", self, v12);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __61__EKCalendarItemRecurrenceEditItem_presentCustomRecurrenceVC__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _BYTE *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(WeakRetained, "_validateRecurrenceType:", v3);

  if ((_DWORD)v2)
  {
    WeakRetained[128] = 0;
    objc_msgSend(WeakRetained, "notifySubitemDidSave:", 0);
  }

}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  if (-[EKCalendarItemRecurrenceEditItem subitemAtIndex:](self, "subitemAtIndex:", a4) == 1)
    -[EKCalendarItemRecurrenceEditItem presentCustomRecurrenceVC](self, "presentCustomRecurrenceVC");
}

- (id)bestInitialEndDate
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[EKCalendarItemRecurrenceEditItem minRecurrenceEndDate](self, "minRecurrenceEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v5 = v4;
  switch(self->_repeatType)
  {
    case 0:
    case 2:
    case 6:
      v6 = 1;
      goto LABEL_8;
    case 1:
      objc_msgSend(v4, "setDay:", 7);
      break;
    case 3:
      v6 = 2;
LABEL_8:
      objc_msgSend(v4, "setMonth:", v6);
      break;
    case 4:
      v7 = 1;
      goto LABEL_6;
    case 5:
      v7 = 5;
LABEL_6:
      objc_msgSend(v4, "setYear:", v7);
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v5, v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 1;
}

- (void)dateTimeCellDateTapped:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  self->_showingDatePicker ^= 1u;
  -[EKCalendarItemRecurrenceEditItem _updateMinRecurrenceEndDate](self, "_updateMinRecurrenceEndDate", a3);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[EKCalendarItemRecurrenceEditItem indexForSubitem:](self, "indexForSubitem:", 4));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditItem delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showingDatePicker)
    v5 = v7;
  else
    v5 = 0;
  if (self->_showingDatePicker)
    v6 = 0;
  else
    v6 = v7;
  objc_msgSend(v4, "editItem:wantsRowInsertions:rowDeletions:", self, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDatePicker, 0);
  objc_storeStrong((id *)&self->_endDatePickerCell, 0);
  objc_storeStrong((id *)&self->_endDateCell, 0);
  objc_storeStrong((id *)&self->_customCell, 0);
  objc_storeStrong((id *)&self->_repeatCell, 0);
  objc_storeStrong((id *)&self->_customRepeatDescription, 0);
  objc_storeStrong((id *)&self->_originalRepeatEnd, 0);
  objc_storeStrong((id *)&self->_repeatEnd, 0);
}

- (id)recurrenceDate
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)recurrenceTimeZone
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)stringForDate:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)minRecurrenceEndDate
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

@end
