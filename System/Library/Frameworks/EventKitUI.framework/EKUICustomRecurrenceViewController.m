@implementation EKUICustomRecurrenceViewController

- (EKUICustomRecurrenceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  EKUICustomRecurrenceViewController *v4;
  EKUICustomRecurrenceViewController *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSTimeZone *timeZone;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EKUICustomRecurrenceViewController;
  v4 = -[EKUICustomRecurrenceViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_cachedFrequency = 0;
    v4->_cachedInterval = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUICustomRecurrenceViewController setTitle:](v5, "setTitle:", v11);

  }
  return v5;
}

- (EKUICustomRecurrenceViewController)initWithStartDate:(id)a3 timeZone:(id)a4 clearBackground:(BOOL)a5
{
  id v9;
  id v10;
  EKUICustomRecurrenceViewController *v11;
  EKUICustomRecurrenceViewController *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = -[EKUICustomRecurrenceViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_timeZone, a4);
    v12->_useClearBackground = a5;
    -[EKUICustomRecurrenceViewController _createChoosersAndControls](v12, "_createChoosersAndControls");
    objc_initWeak(&location, v12);
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__EKUICustomRecurrenceViewController_initWithStartDate_timeZone_clearBackground___block_invoke;
    v16[3] = &unk_1E6018610;
    objc_copyWeak(&v17, &location);
    v14 = (id)-[EKUICustomRecurrenceViewController registerForTraitChanges:withHandler:](v12, "registerForTraitChanges:withHandler:", v13, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __81__EKUICustomRecurrenceViewController_initWithStartDate_timeZone_clearBackground___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKUICustomRecurrenceViewController setTableView:](self, "setTableView:", v4);

  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;
  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEstimatedRowHeight:", v9);

  -[EKUICustomRecurrenceViewController resetBackgroundColor](self, "resetBackgroundColor");
  if (EKUIUnscaledCatalyst())
  {
    v11 = EKUIUnscaledCatalystTableRowHeightDefault();
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRowHeight:", v11);

    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSeparatorStyle:", 1);

  }
  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUICustomRecurrenceViewController setView:](self, "setView:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUICustomRecurrenceViewController;
  -[EKUICustomRecurrenceViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKUICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)resetBackgroundColor
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_useClearBackground || -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover"))
  {
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  objc_msgSend(v5, "setBackgroundColor:", v3);

}

- (CGSize)calculatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  -[UITableView systemLayoutSizeFittingSize:](self->_tableView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC5000], *(double *)(MEMORY[0x1E0DC5000] + 8));
  v4 = v3;
  v5 = EKUIContainedControllerIdealWidth();
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_createChoosersAndControls
{
  EKRecurrenceWeekdayChooserController *v3;
  EKRecurrenceWeekdayChooserController *weeklyChooser;
  EKRecurrenceMonthlyChooserController *v5;
  EKRecurrenceMonthlyChooserController *monthlyChooser;
  EKRecurrenceMonthChooserController *v7;
  EKRecurrenceMonthChooserController *yearlyChooser;
  EKRecurrenceOrdinalChooserController *v9;
  EKRecurrenceOrdinalChooserController *yearlyOrdinalChooser;
  UISwitch *v11;
  UISwitch *yearOrdinalSwitch;
  EKUIPopupTableViewCell *v13;
  EKUIPopupTableViewCell *frequencySummaryCell;
  void *v15;
  void *v16;
  void *v17;
  EKUITableViewCell *v18;
  UITableViewCell *intervalSummaryCell;
  void *v20;
  void *v21;
  id v22;

  v3 = -[EKRecurrenceWeekdayChooserController initWithDate:]([EKRecurrenceWeekdayChooserController alloc], "initWithDate:", self->_startDate);
  weeklyChooser = self->_weeklyChooser;
  self->_weeklyChooser = v3;

  -[EKRecurrenceChooserController setDelegate:](self->_weeklyChooser, "setDelegate:", self);
  v5 = -[EKRecurrenceMonthlyChooserController initWithDate:]([EKRecurrenceMonthlyChooserController alloc], "initWithDate:", self->_startDate);
  monthlyChooser = self->_monthlyChooser;
  self->_monthlyChooser = v5;

  -[EKRecurrenceMonthlyChooserController setDelegate:](self->_monthlyChooser, "setDelegate:", self);
  v7 = -[EKRecurrenceMonthChooserController initWithDate:]([EKRecurrenceMonthChooserController alloc], "initWithDate:", self->_startDate);
  yearlyChooser = self->_yearlyChooser;
  self->_yearlyChooser = v7;

  -[EKRecurrenceChooserController setDelegate:](self->_yearlyChooser, "setDelegate:", self);
  v9 = -[EKRecurrenceOrdinalChooserController initWithDate:]([EKRecurrenceOrdinalChooserController alloc], "initWithDate:", self->_startDate);
  yearlyOrdinalChooser = self->_yearlyOrdinalChooser;
  self->_yearlyOrdinalChooser = v9;

  -[EKRecurrenceChooserController setDelegate:](self->_yearlyOrdinalChooser, "setDelegate:", self);
  v11 = (UISwitch *)objc_opt_new();
  yearOrdinalSwitch = self->_yearOrdinalSwitch;
  self->_yearOrdinalSwitch = v11;

  -[UISwitch addTarget:action:forControlEvents:](self->_yearOrdinalSwitch, "addTarget:action:forControlEvents:", self, sel__yearOrdinalSwitchChanged_, 4096);
  v13 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  frequencySummaryCell = self->_frequencySummaryCell;
  self->_frequencySummaryCell = v13;

  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Frequency"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](self->_frequencySummaryCell, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  v18 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  intervalSummaryCell = self->_intervalSummaryCell;
  self->_intervalSummaryCell = &v18->super;

  if (self->_useClearBackground)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceMonthlyChooserController setBackgroundColor:](self->_monthlyChooser, "setBackgroundColor:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceChooserController setBackgroundColor:](self->_yearlyChooser, "setBackgroundColor:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceChooserController setBackgroundColor:](self->_yearlyOrdinalChooser, "setBackgroundColor:", v22);

  }
}

- (id)frequencyPopupMenu
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12[2];
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    v6 = (void *)MEMORY[0x1E0DC3428];
    -[EKUICustomRecurrenceViewController _stringForFrequency:](self, "_stringForFrequency:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __56__EKUICustomRecurrenceViewController_frequencyPopupMenu__block_invoke;
    v11[3] = &unk_1E601C7F0;
    objc_copyWeak(v12, &location);
    v12[1] = v4;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == (char *)self->_cachedFrequency)
      objc_msgSend(v8, "setState:", 1);
    objc_msgSend(v3, "addObject:", v8);

    objc_destroyWeak(v12);
    ++v4;
  }
  while (v4 != (char *)4);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);

  return v9;
}

void __56__EKUICustomRecurrenceViewController_frequencyPopupMenu__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (WeakRetained[121] != v3)
  {
    WeakRetained[121] = v3;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_frequencyPickerViewUpdated");
    WeakRetained = v4;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  objc_super v7;

  v3 = a3;
  if ((-[EKUICustomRecurrenceViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[EKUICustomRecurrenceViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[EKUICustomRecurrenceViewController completionBlock](self, "completionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[EKUICustomRecurrenceViewController recurrenceRule](self, "recurrenceRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)EKUICustomRecurrenceViewController;
  -[EKUICustomRecurrenceViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[EKUICustomRecurrenceViewController _numberOfRowsForSection:](self, "_numberOfRowsForSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  EKUITableViewCell *p_super;
  void *v10;
  EKUIPopupTableViewCell *v11;
  UITableViewCell *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIPickerView *v17;
  UIPickerView *intervalPicker;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = -[EKUICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v7);
  p_super = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  -[EKUITableViewCell setSelectionStyle:](p_super, "setSelectionStyle:", 0);
  switch(v8)
  {
    case 1:
      -[EKUICustomRecurrenceViewController frequencyPopupMenu](self, "frequencyPopupMenu");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIPopupTableViewCell setPopupMenu:](self->_frequencySummaryCell, "setPopupMenu:", v10);

      v11 = self->_frequencySummaryCell;
      p_super = &v11->super;
      break;
    case 2:
      v12 = self->_intervalSummaryCell;

      -[EKUICustomRecurrenceViewController _everyStringForFrequency:interval:](self, "_everyStringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell textLabel](v12, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);

      -[EKUICustomRecurrenceViewController _stringForFrequency:interval:](self, "_stringForFrequency:interval:", self->_cachedFrequency, self->_cachedInterval);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell detailTextLabel](v12, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

      goto LABEL_14;
    case 3:
      if (!self->_intervalPicker)
      {
        v17 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
        intervalPicker = self->_intervalPicker;
        self->_intervalPicker = v17;

        -[UIPickerView setDelegate:](self->_intervalPicker, "setDelegate:", self);
        -[UIPickerView setDataSource:](self->_intervalPicker, "setDataSource:", self);
        -[UIPickerView setTranslatesAutoresizingMaskIntoConstraints:](self->_intervalPicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      -[EKUITableViewCell contentView](p_super, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_intervalPicker);

      -[EKUITableViewCell contentView](p_super, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("_intervalPicker"), self->_intervalPicker, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_intervalPicker]|"), 0, 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addConstraints:", v23);

      -[EKUITableViewCell contentView](p_super, "contentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("_intervalPicker"), self->_intervalPicker, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_intervalPicker]|"), 0, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addConstraints:", v27);

      v28 = self->_cachedInterval - 1;
      if (-[EKUICustomRecurrenceViewController _disallowsRecurrenceInterval](self, "_disallowsRecurrenceInterval"))
        v29 = 1;
      else
        v29 = v28;
      -[UIPickerView selectRow:inComponent:animated:](self->_intervalPicker, "selectRow:inComponent:animated:", v29, 0, 0);
      break;
    case 4:
      EventKitUIBundle();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Days of Week"), &stru_1E601DFA8, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUITableViewCell textLabel](p_super, "textLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v31);

      -[EKUITableViewCell setAccessoryView:](p_super, "setAccessoryView:", self->_yearOrdinalSwitch);
      break;
    case 5:
      -[EKUICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6:
      -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v34 = v33;
      objc_msgSend(v33, "cellForRow:", objc_msgSend(v7, "row"));
      v12 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      p_super = (EKUITableViewCell *)v12;
      break;
    default:
      break;
  }
  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell setBackgroundColor:](p_super, "setBackgroundColor:", v35);

  }
  return p_super;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t cachedFrequency;
  int64_t v4;

  cachedFrequency = self->_cachedFrequency;
  v4 = 1;
  if (cachedFrequency)
    v4 = 2;
  if (cachedFrequency == 3)
    return 3;
  else
    return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v11;
  double v12;
  void *v13;
  double v14;

  v6 = a3;
  v7 = a4;
  switch(-[EKUICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v7))
  {
    case 0:
    case 1:
    case 2:
    case 4:
      objc_msgSend(v6, "rowHeight");
      goto LABEL_3;
    case 3:
      v9 = *MEMORY[0x1E0DC53D8];
      break;
    case 5:
      -[EKUICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "heightForRow:", objc_msgSend(v7, "row"));
      v9 = v12;

      break;
    case 6:
      -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "heightForRow:", objc_msgSend(v7, "row"));
      v9 = v14;

      if (EKUIUnscaledCatalyst() && *MEMORY[0x1E0DC53D8] == v9)
      {
        v8 = EKUIUnscaledCatalystTableRowHeightDefault();
LABEL_3:
        v9 = v8;
      }
      break;
    default:
      v9 = 0.0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "selectionStyle"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  v6 = -[EKUICustomRecurrenceViewController _tagForIndexPath:](self, "_tagForIndexPath:", v8);
  if (v6 == 2)
  {
    -[EKUICustomRecurrenceViewController _toggleInlineSpinnerForTag:](self, "_toggleInlineSpinnerForTag:", 2);
  }
  else if (v6 == 6)
  {
    -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rowTapped:", objc_msgSend(v8, "row"));

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    -[EKUICustomRecurrenceViewController recurrenceSummaryString](self, "recurrenceSummaryString", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (EKUICatalyst())
  {
    objc_msgSend(v9, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_useClearBackground
    || objc_msgSend(v9, "section") == 1
    && (-[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "drawBackgroundForRow:", objc_msgSend(v10, "row")),
        v14,
        (v15 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
}

- (void)_toggleInlineSpinnerForTag:(int64_t)a3
{
  void *v5;
  void *v6;

  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  if (a3 == 2)
    -[EKUICustomRecurrenceViewController _setShowingIntervalPicker:](self, "_setShowingIntervalPicker:", !self->_showingIntervalPicker);
  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endUpdates");

  -[EKUICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_setShowingIntervalPicker:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 showingIntervalPicker;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_showingIntervalPicker != a3)
  {
    v3 = a3;
    self->_showingIntervalPicker = a3;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    showingIntervalPicker = self->_showingIntervalPicker;
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (showingIntervalPicker)
    {
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v8, 6);
    }
    else
    {
      v11 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 6);
    }

    if (v3)
    {
      -[EKUICustomRecurrenceViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGrayTextColor");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell detailTextLabel](self->_intervalSummaryCell, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    if (v3)
    {

      v9 = v7;
    }

  }
}

- (void)recurrenceChooserWantsReload:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__EKUICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke;
  v3[3] = &unk_1E6018688;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __67__EKUICustomRecurrenceViewController_recurrenceChooserWantsReload___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 0);

}

- (void)recurrenceChooser:(id)a3 wantsRowReload:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__EKUICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke;
  v4[3] = &unk_1E6018FC8;
  v4[4] = self;
  v4[5] = a4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
}

void __71__EKUICustomRecurrenceViewController_recurrenceChooser_wantsRowReload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 0);

}

- (void)_updateRecurrenceRule
{
  int64_t cachedFrequency;
  int64_t cachedInterval;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  cachedFrequency = self->_cachedFrequency;
  cachedInterval = self->_cachedInterval;
  v12 = (id)objc_opt_new();
  -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    cachedFrequency = objc_msgSend(v5, "frequency");
    objc_msgSend(v6, "updateRecurrenceRuleBuilder:", v12);
  }
  objc_msgSend(v12, "setFrequency:", cachedFrequency);
  objc_msgSend(v12, "setInterval:", cachedInterval);
  -[EKUICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
    goto LABEL_6;
  -[EKUICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOn");

  if (v9)
  {
    -[EKUICustomRecurrenceViewController yearlyOrdinalChooser](self, "yearlyOrdinalChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateRecurrenceRuleBuilder:", v12);
LABEL_6:

  }
  objc_msgSend(v12, "recurrenceRule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFirstDayOfTheWeek:", -[EKRecurrenceRule firstDayOfTheWeek](self->_cachedRecurrenceRule, "firstDayOfTheWeek"));
  -[EKRecurrenceRule recurrenceEnd](self->_cachedRecurrenceRule, "recurrenceEnd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecurrenceEnd:", v11);

  -[EKUICustomRecurrenceViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", v10, 0);
}

- (id)recurrenceRule
{
  EKRecurrenceRule *cachedRecurrenceRule;

  cachedRecurrenceRule = self->_cachedRecurrenceRule;
  if (!cachedRecurrenceRule)
  {
    -[EKUICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
    cachedRecurrenceRule = self->_cachedRecurrenceRule;
  }
  return cachedRecurrenceRule;
}

- (void)setRecurrenceRule:(id)a3
{
  -[EKUICustomRecurrenceViewController setRecurrenceRule:shouldUpdatePickers:](self, "setRecurrenceRule:shouldUpdatePickers:", a3, 1);
}

- (void)setRecurrenceRule:(id)a3 shouldUpdatePickers:(BOOL)a4
{
  _BOOL4 v4;
  EKRecurrenceRule *v7;
  EKRecurrenceRule *v8;

  v4 = a4;
  v7 = (EKRecurrenceRule *)a3;
  if (self->_cachedRecurrenceRule != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_cachedRecurrenceRule, a3);
    v7 = v8;
    if (v8)
    {
      -[EKUICustomRecurrenceViewController _updateSummaryLabel](self, "_updateSummaryLabel");
      v7 = v8;
    }
    if (v4)
    {
      -[EKUICustomRecurrenceViewController _refreshCacheAndPickers](self, "_refreshCacheAndPickers");
      v7 = v8;
    }
  }

}

- (void)_refreshCacheAndPickers
{
  uint64_t v3;
  id v4;

  self->_cachedInterval = -[EKRecurrenceRule interval](self->_cachedRecurrenceRule, "interval");
  self->_cachedFrequency = -[EKRecurrenceRule frequency](self->_cachedRecurrenceRule, "frequency");
  v3 = objc_msgSend((id)objc_opt_class(), "isRecurrenceRuleOrdinal:", self->_cachedRecurrenceRule);
  -[EKUICustomRecurrenceViewController _updateCustomPickerView](self, "_updateCustomPickerView");
  if (-[EKRecurrenceRule frequency](self->_cachedRecurrenceRule, "frequency") == EKRecurrenceFrequencyYearly)
  {
    -[EKUICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOn:", v3);

  }
}

+ (BOOL)isRecurrenceRuleOrdinal:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "setPositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v3, "frequency") == 2 || objc_msgSend(v3, "frequency") == 3)
  {
    objc_msgSend(v3, "daysOfTheWeek");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  void *v2;
  char v3;

  -[EKUICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleDaysInMonthlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKUICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleDaysInMonthlyRecurrence:", v3);

}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  void *v2;
  char v3;

  -[EKUICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prohibitsMultipleMonthsInYearlyRecurrence");

  return v3;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKUICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProhibitsMultipleMonthsInYearlyRecurrence:", v3);

}

- (void)_updateSummaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[EKUICustomRecurrenceViewController recurrenceRule](self, "recurrenceRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICustomRecurrenceViewController startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForRecurrenceRuleAndDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICustomRecurrenceViewController setRecurrenceSummaryString:](self, "setRecurrenceSummaryString:", v5);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EKUICustomRecurrenceViewController__updateSummaryLabel__block_invoke;
  v6[3] = &unk_1E6018688;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
}

void __57__EKUICustomRecurrenceViewController__updateSummaryLabel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reloadSectionHeaderFooters:withRowAnimation:", v3, 0);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:", v4, 0);

}

- (void)_updateCustomPickerView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "frequency");

  -[EKUICustomRecurrenceViewController _chooserForFrequency:](self, "_chooserForFrequency:", self->_cachedFrequency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICustomRecurrenceViewController setCurrentChooser:](self, "setCurrentChooser:", v5);

  -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "frequency");

  -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateFromRecurrenceRule:", self->_cachedRecurrenceRule);

  -[EKUICustomRecurrenceViewController _updateTableSectionsFromFrequency:toFrequency:](self, "_updateTableSectionsFromFrequency:toFrequency:", v4, v7);
}

- (void)_updateTableSectionsFromFrequency:(int64_t)a3 toFrequency:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[5];

  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginUpdates");

  if (a3 == 3 || a4 != 3)
  {
    if (a3 == 3 && a4 != 3)
    {
      -[EKUICustomRecurrenceViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteSections:withRowAnimation:", v14, 6);

      v10 = a4 != 0;
      goto LABEL_10;
    }
  }
  else
  {
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSections:withRowAnimation:", v9, 6);

  }
  v10 = a4 != 0;
  if (!a3 && a4)
  {
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSections:withRowAnimation:", v12, 6);
LABEL_13:

    goto LABEL_14;
  }
LABEL_10:
  if (a3 && !a4)
  {
    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 6);
    goto LABEL_13;
  }
  v16 = !v10;
  if (a3 == a4)
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__EKUICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke;
    v17[3] = &unk_1E6018688;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  }
LABEL_14:
  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endUpdates");

  -[EKUICustomRecurrenceViewController calculatePreferredContentSize](self, "calculatePreferredContentSize");
  -[EKUICustomRecurrenceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

void __84__EKUICustomRecurrenceViewController__updateTableSectionsFromFrequency_toFrequency___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 0);

}

- (void)_updateFrequencyRows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 5);

}

- (void)_frequencyPickerViewUpdated
{
  -[EKUICustomRecurrenceViewController _updateCustomPickerView](self, "_updateCustomPickerView");
  -[EKUICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");
  -[EKUICustomRecurrenceViewController _updateFrequencyRows](self, "_updateFrequencyRows");
  if (self->_showingIntervalPicker)
    -[UIPickerView reloadAllComponents](self->_intervalPicker, "reloadAllComponents");
}

- (id)_chooserForFrequency:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3:
      -[EKUICustomRecurrenceViewController yearlyChooser](self, "yearlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[EKUICustomRecurrenceViewController monthlyChooser](self, "monthlyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[EKUICustomRecurrenceViewController weeklyChooser](self, "weeklyChooser");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)_yearOrdinalSwitchChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB36B0];
  v5 = a3;
  objc_msgSend(v4, "indexPathForRow:inSection:", 1, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isOn");

  -[EKUICustomRecurrenceViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v9, 6);

    -[EKUICustomRecurrenceViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 3, 1);
  }
  else
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 6);

  }
  -[EKUICustomRecurrenceViewController _updateRecurrenceRule](self, "_updateRecurrenceRule");

}

- (id)_stringForFrequency:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    CUIKStringForRepeatType();
    self = (EKUICustomRecurrenceViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_stringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  switch(a3)
  {
    case 0:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency day");
        v8 = CFSTR("Day");
        goto LABEL_11;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      v12 = CFSTR("repeat_interval_days");
      goto LABEL_16;
    case 1:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency week");
        v8 = CFSTR("Week");
        goto LABEL_11;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      v12 = CFSTR("repeat_interval_weeks");
      goto LABEL_16;
    case 2:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency month");
        v8 = CFSTR("Month");
        goto LABEL_11;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      v12 = CFSTR("repeat_interval_months");
      goto LABEL_16;
    case 3:
      if (a4 > 1)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v11;
        v12 = CFSTR("repeat_interval_years");
LABEL_16:
        objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E601DFA8, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v13, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency year");
        v8 = CFSTR("Year");
LABEL_11:
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v9;
    default:
      v9 = 0;
      return v9;
  }
}

- (id)_everyStringForFrequency:(int64_t)a3 interval:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  switch(a3)
  {
    case 0:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency day every string");
        goto LABEL_11;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      v11 = CFSTR("every_interval_days");
      goto LABEL_16;
    case 1:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency week every string");
        goto LABEL_11;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      v11 = CFSTR("every_interval_weeks");
      goto LABEL_16;
    case 2:
      if (a4 <= 1)
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency month every string");
        goto LABEL_11;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      v11 = CFSTR("every_interval_months");
      goto LABEL_16;
    case 3:
      if (a4 > 1)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v10;
        v11 = CFSTR("every_interval_years");
LABEL_16:
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E601DFA8, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v12, a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        EventKitUIBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("Custom recurrence frequency year every string");
LABEL_11:
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("Every"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v8;
    default:
      v8 = 0;
      return v8;
  }
}

- (int64_t)_tagForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      if (v5)
        return 5;
      else
        return 4;
    }
    return 0;
  }
  if (v6 == 1)
    return 6;
  if (v6)
    return 0;
  if (!v5)
    return 1;
  if (v5 != 2)
  {
    if (v5 == 1)
      return 2;
    return 0;
  }
  if (self->_showingIntervalPicker)
    return 3;
  else
    return 0;
}

- (int64_t)_numberOfRowsForSection:(int64_t)a3
{
  int64_t v3;
  void *v4;
  int64_t v5;
  void *v7;

  if (a3 == 2)
  {
    if (self->_cachedFrequency == 3)
    {
      -[EKUICustomRecurrenceViewController yearOrdinalSwitch](self, "yearOrdinalSwitch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isOn"))
        v3 = 2;
      else
        v3 = 1;

      return v3;
    }
    return 0;
  }
  if (a3 == 1)
  {
    -[EKUICustomRecurrenceViewController currentChooser](self, "currentChooser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfRows");

    return v5;
  }
  if (a3)
    return 0;
  return self->_showingIntervalPicker | 2;
}

- (BOOL)_disallowsRecurrenceInterval
{
  _BOOL4 v3;

  v3 = -[EKUICustomRecurrenceViewController prohibitsYearlyRecurrenceInterval](self, "prohibitsYearlyRecurrenceInterval");
  if (v3)
    LOBYTE(v3) = self->_cachedFrequency == 3;
  return v3;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
    return 1;
  if (-[EKUICustomRecurrenceViewController _disallowsRecurrenceInterval](self, "_disallowsRecurrenceInterval", a3, v4, v5))
  {
    return 1;
  }
  return 999;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v7 = a3;
  v8 = v7;
  if (a5 == 1)
  {
    v10 = objc_msgSend(v7, "selectedRowInComponent:", 0) + 1;
    switch(self->_cachedFrequency)
    {
      case 0:
        v11 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("days");
        break;
      case 1:
        v11 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("weeks");
        break;
      case 2:
        v11 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("months");
        break;
      case 3:
        v11 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("years");
        break;
      default:
        goto LABEL_6;
    }
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E601DFA8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v15, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
LABEL_6:
    v9 = 0;
  }
  else
  {
    CUIKLocalizedStringForInteger();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;

  v7 = a3;
  self->_cachedInterval = objc_msgSend(v7, "selectedRowInComponent:", 0) + 1;
  -[EKUICustomRecurrenceViewController _frequencyPickerViewUpdated](self, "_frequencyPickerViewUpdated");
  if (!a5)
    objc_msgSend(v7, "reloadComponent:", 1);

}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)prefersPushForSizeClass:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return EKUIUseLargeFormatPhoneUI();
}

- (BOOL)canRequirePushOrPresentation
{
  return 1;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return self->_prohibitsYearlyRecurrenceInterval;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  self->_prohibitsYearlyRecurrenceInterval = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1032);
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setTableView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (EKRecurrenceChooserController)currentChooser
{
  return (EKRecurrenceChooserController *)objc_loadWeakRetained((id *)&self->_currentChooser);
}

- (void)setCurrentChooser:(id)a3
{
  objc_storeWeak((id *)&self->_currentChooser, a3);
}

- (EKRecurrenceWeekdayChooserController)weeklyChooser
{
  return (EKRecurrenceWeekdayChooserController *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setWeeklyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (EKRecurrenceMonthlyChooserController)monthlyChooser
{
  return (EKRecurrenceMonthlyChooserController *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setMonthlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (EKRecurrenceMonthChooserController)yearlyChooser
{
  return (EKRecurrenceMonthChooserController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setYearlyChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (EKRecurrenceOrdinalChooserController)yearlyOrdinalChooser
{
  return (EKRecurrenceOrdinalChooserController *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setYearlyOrdinalChooser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (UISwitch)yearOrdinalSwitch
{
  return (UISwitch *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setYearOrdinalSwitch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSString)recurrenceSummaryString
{
  return (NSString *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setRecurrenceSummaryString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceSummaryString, 0);
  objc_storeStrong((id *)&self->_yearOrdinalSwitch, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_yearlyOrdinalChooser, 0);
  objc_storeStrong((id *)&self->_yearlyChooser, 0);
  objc_storeStrong((id *)&self->_monthlyChooser, 0);
  objc_storeStrong((id *)&self->_weeklyChooser, 0);
  objc_destroyWeak((id *)&self->_currentChooser);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalPicker, 0);
  objc_storeStrong((id *)&self->_intervalSummaryCell, 0);
  objc_storeStrong((id *)&self->_frequencySummaryCell, 0);
  objc_storeStrong((id *)&self->_cachedRecurrenceRule, 0);
}

@end
