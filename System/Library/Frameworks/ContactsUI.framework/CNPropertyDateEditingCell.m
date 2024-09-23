@implementation CNPropertyDateEditingCell

- (CNPropertyDateEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyDateEditingCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNPropertyDateEditingCell;
  v4 = -[CNPropertyEditingCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_localeUpdated_, CFSTR("_UIApplicationLocaleDidChange"), 0);

    if (!v4->_shouldEditDatesTextually)
    {
      -[CNPropertySimpleEditingCell textField](v4, "textField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClearButtonMode:", 0);

      -[CNPropertySimpleEditingCell textField](v4, "textField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTextLoupeVisibility:", 1);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleEditingCell textField](v4, "textField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInsertionPointColor:", v8);

    }
    -[CNPropertySimpleEditingCell textField](v4, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v4);

  }
  return v4;
}

- (void)prepareForReuse
{
  UIDatePicker *datePicker;
  CNDatePickerContainerView *datePickerContainerView;
  UIViewController *contentViewController;
  NSString *currentCalendarIdentifier;
  objc_super v7;

  datePicker = self->_datePicker;
  self->_datePicker = 0;

  datePickerContainerView = self->_datePickerContainerView;
  self->_datePickerContainerView = 0;

  contentViewController = self->_contentViewController;
  self->_contentViewController = 0;

  currentCalendarIdentifier = self->_currentCalendarIdentifier;
  self->_currentCalendarIdentifier = 0;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyDateEditingCell;
  -[CNPropertySimpleEditingCell prepareForReuse](&v7, sel_prepareForReuse);
}

- (void)localeUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNPropertyCell propertyItem](self, "propertyItem", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayStringForValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)labelButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  CNLabelPickerController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96690]);

  if (v7)
  {
    v21.receiver = self;
    v21.super_class = (Class)CNPropertyDateEditingCell;
    -[CNPropertyEditingCell labelButtonClicked:](&v21, sel_labelButtonClicked_, v4);
  }
  else
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendedLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 >= 2)
    {
      v11 = [CNLabelPickerController alloc];
      -[CNPropertyCell propertyItem](self, "propertyItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CNLabelPickerController initForPropertyItem:](v11, "initForPropertyItem:", v12);

      CNContactsUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SELECT_BIRTHDAY_CALENDAR_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v15);

      objc_msgSend(v13, "setItemLocalizationBlock:", &__block_literal_global_28473);
      -[CNPropertyCell propertyItem](self, "propertyItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "labeledValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedItem:", v18);

      objc_msgSend(v13, "setDelegate:", self);
      objc_msgSend(v13, "setAllowsCustomItems:", 0);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
      -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sender:presentViewController:", v4, v19);

    }
  }

}

- (void)dateChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("birthdays"));

  if (!v6)
    goto LABEL_3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_systemCalendar"));

  if (!v10)
  {
    objc_msgSend(v21, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDate componentsFromDate:sourceCalendar:destinationCalendar:](CNUIDate, "componentsFromDate:sourceCalendar:destinationCalendar:", v11, v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    objc_msgSend(v21, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDate GMTComponentsFromDate:sourceCalendar:](CNUIDate, "GMTComponentsFromDate:sourceCalendar:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateLabeledValueWithValue:", v13);

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCell textField](self, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[CNPropertyCell delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "propertyCell:didUpdateItem:withNewValue:", self, v20, v13);

}

- (BOOL)_shouldUseYearlessPickerForDateComponents:(id)a3
{
  return 1;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[CNPropertyDateEditingCell currentCalendarIdentifier](self, "currentCalendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyDateEditingCell setCurrentCalendarIdentifier:](self, "setCurrentCalendarIdentifier:", v8);

  -[CNPropertyEditingCell valueString](self, "valueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCell valueView](self, "valueView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ab_text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    if (!-[CNPropertyDateEditingCell shouldEditDatesTextually](self, "shouldEditDatesTextually"))
      goto LABEL_6;
    -[CNPropertySimpleEditingCell textField](self, "textField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEditing");

    if (!v14
      || v4
      && (-[CNPropertyDateEditingCell currentCalendarIdentifier](self, "currentCalendarIdentifier"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v4, "isEqualToString:", v15),
          v15,
          (v16 & 1) == 0))
    {
LABEL_6:
      -[CNPropertyEditingCell valueString](self, "valueString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleEditingCell valueView](self, "valueView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAb_text:", v17);

    }
    if (-[CNPropertyDateEditingCell shouldEditDatesTextually](self, "shouldEditDatesTextually"))
    {
      objc_msgSend(v21, "placeholderString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleEditingCell textField](self, "textField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPlaceholder:", v19);

    }
  }

}

- (UIDatePicker)datePicker
{
  id v3;
  UIDatePicker *v4;
  UIDatePicker *datePicker;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_datePicker)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC36F0]);
    v4 = (UIDatePicker *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    datePicker = self->_datePicker;
    self->_datePicker = v4;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", v6);

    -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, sel_dateChanged_, 4096);
  }
  -[CNPropertyDateEditingCell applyCalendarAndDate](self, "applyCalendarAndDate");
  -[CNPropertyCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyCell:didUpdateItem:withNewValue:", self, v8, v11);

  return self->_datePicker;
}

- (void)applyCalendarAndDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *currentCalendarIdentifier;
  id v18;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (-[CNPropertyDateEditingCell _shouldUseYearlessPickerForDateComponents:](self, "_shouldUseYearlessPickerForDateComponents:", v18))
  {
    v5 = 4271;
  }
  else
  {
    v5 = 1;
  }
  -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", v5);
  objc_msgSend(v18, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  -[UIDatePicker timeZone](self->_datePicker, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v11);

  v12 = (void *)MEMORY[0x1E0D3EFB0];
  objc_msgSend(v7, "calendarIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeForCalendarID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDatePicker setLocale:](self->_datePicker, "setLocale:", v14);
  +[CNUIDate dateFromComponents:destinationCalendar:](CNUIDate, "dateFromComponents:destinationCalendar:", v18, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", v15);

  -[UIDatePicker setCalendar:](self->_datePicker, "setCalendar:", v7);
  objc_msgSend(v7, "calendarIdentifier");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentCalendarIdentifier = self->_currentCalendarIdentifier;
  self->_currentCalendarIdentifier = v16;

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CNDatePickerContainerView *v14;
  void *v15;
  CNDatePickerContainerView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIViewController *contentViewController;
  UIViewController *v23;
  UIViewController *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;

  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadonly");

  if ((v6 & 1) == 0)
  {
    -[CNPropertySimpleEditingCell textField](self, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cnui_applyContactStyle");

    if (-[CNPropertyDateEditingCell shouldEditDatesTextually](self, "shouldEditDatesTextually"))
    {
      v7 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && (-[CNPropertyDateEditingCell traitCollection](self, "traitCollection"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "horizontalSizeClass"),
          v11,
          v12 != 1))
    {
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_34_28456);
      contentViewController = self->_contentViewController;
      if (!contentViewController)
      {
        v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
        v24 = self->_contentViewController;
        self->_contentViewController = v23;

        -[CNPropertyDateEditingCell datePicker](self, "datePicker");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController setView:](self->_contentViewController, "setView:", v25);

        -[CNPropertyDateEditingCell datePicker](self, "datePicker");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bounds");
        -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", v27, v28);

        contentViewController = self->_contentViewController;
      }
      if (-[UIViewController isBeingPresented](contentViewController, "isBeingPresented"))
        goto LABEL_2;
      if (-[UIViewController isBeingDismissed](self->_contentViewController, "isBeingDismissed"))
        goto LABEL_2;
      -[UIViewController view](self->_contentViewController, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "window");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_2;
      -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sender:presentViewController:", v4, self->_contentViewController);
      v7 = 0;
    }
    else
    {
      -[CNPropertyDateEditingCell datePickerContainerView](self, "datePickerContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = [CNDatePickerContainerView alloc];
        -[CNPropertyDateEditingCell datePicker](self, "datePicker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[CNDatePickerContainerView initWithDatePicker:](v14, "initWithDatePicker:", v15);

        -[CNDatePickerContainerView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[CNPropertyDateEditingCell setDatePickerContainerView:](self, "setDatePickerContainerView:", v16);
        -[CNPropertyDateEditingCell datePickerContainerView](self, "datePickerContainerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPropertySimpleEditingCell textField](self, "textField");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setInputView:", v17);

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertySimpleEditingCell textField](self, "textField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInsertionPointColor:", v19);

      v7 = 1;
    }

    goto LABEL_11;
  }
LABEL_2:
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[CNPropertyDateEditingCell shouldEditDatesTextually](self, "shouldEditDatesTextually"))
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForDisplayString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertyCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyCell:didUpdateItem:withNewValue:", self, v9, v7);

  }
}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CNPropertyDateEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "sender:dismissViewController:completionHandler:", self, v4, v6);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  -[CNPropertyCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyCell:didUpdateItem:withNewLabel:", self, v9, v6);

  -[CNPropertyDateEditingCell applyCalendarAndDate](self, "applyCalendarAndDate");
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CNPropertyDateEditingCell_picker_didPickItem___block_invoke;
  v11[3] = &unk_1E204F648;
  v11[4] = self;
  objc_msgSend(v10, "sender:dismissViewController:completionHandler:", self, v7, v11);

}

- (void)regainFocus
{
  id v2;

  -[CNPropertySimpleEditingCell textField](self, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
}

- (CNDatePickerContainerView)datePickerContainerView
{
  return self->_datePickerContainerView;
}

- (void)setDatePickerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_datePickerContainerView, a3);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (BOOL)shouldEditDatesTextually
{
  return self->_shouldEditDatesTextually;
}

- (NSString)currentCalendarIdentifier
{
  return self->_currentCalendarIdentifier;
}

- (void)setCurrentCalendarIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendarIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_datePickerContainerView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

uint64_t __48__CNPropertyDateEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

uint64_t __45__CNPropertyDateEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

void __57__CNPropertyDateEditingCell_textFieldShouldBeginEditing___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstResponder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resignFirstResponder");

}

id __48__CNPropertyDateEditingCell_labelButtonClicked___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v2 = a2;
  v3 = v2;
  if (!v2)
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("BIRTHDAY_CALENDAR_LABEL_DEFAULT");
LABEL_8:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("_systemCalendar")))
  {
    v4 = (void *)MEMORY[0x1E0D13A00];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isGregorianDerivedCalendarIdentifier:", v6);

    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
      v10 = CFSTR("BIRTHDAY_CALENDAR_LABEL_DEFAULT");
    else
      v10 = CFSTR("BIRTHDAY_CALENDAR_LABEL_GREGORIAN");
    goto LABEL_8;
  }
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BIRTHDAY_CALENDAR_LABEL_FORMAT-%@"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

@end
