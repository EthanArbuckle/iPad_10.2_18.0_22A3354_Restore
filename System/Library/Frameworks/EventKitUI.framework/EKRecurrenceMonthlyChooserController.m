@implementation EKRecurrenceMonthlyChooserController

- (EKRecurrenceMonthlyChooserController)initWithDate:(id)a3
{
  id v4;
  EKRecurrenceMonthlyChooserController *v5;
  EKRecurrenceMonthDayChooserController *v6;
  EKRecurrenceMonthDayChooserController *monthDayChooser;
  EKRecurrenceOrdinalChooserController *v8;
  EKRecurrenceOrdinalChooserController *ordinalChooser;
  EKUITableViewCell *v10;
  UITableViewCell *onEachCell;
  void *v12;
  void *v13;
  void *v14;
  EKUIFullWidthDividerTableViewCell *v15;
  UITableViewCell *onTheCell;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKRecurrenceMonthlyChooserController;
  v5 = -[EKRecurrenceChooserController initWithDate:](&v21, sel_initWithDate_, v4);
  if (v5)
  {
    v6 = -[EKRecurrenceMonthDayChooserController initWithDate:]([EKRecurrenceMonthDayChooserController alloc], "initWithDate:", v4);
    monthDayChooser = v5->_monthDayChooser;
    v5->_monthDayChooser = v6;

    v8 = -[EKRecurrenceOrdinalChooserController initWithDate:]([EKRecurrenceOrdinalChooserController alloc], "initWithDate:", v4);
    ordinalChooser = v5->_ordinalChooser;
    v5->_ordinalChooser = v8;

    v10 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    onEachCell = v5->_onEachCell;
    v5->_onEachCell = &v10->super;

    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Each"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v5->_onEachCell, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    v15 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUIFullWidthDividerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    onTheCell = v5->_onTheCell;
    v5->_onTheCell = &v15->super.super;

    EventKitUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("On the…"), &stru_1E601DFA8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v5->_onTheCell, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  EKRecurrenceChooserControllerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[EKRecurrenceChooserController setDelegate:](self->_monthDayChooser, "setDelegate:", v5);
  -[EKRecurrenceChooserController setDelegate:](self->_ordinalChooser, "setDelegate:", v5);

}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecurrenceRuleBuilder:", v4);

}

- (void)updateFromRecurrenceRule:(id)a3
{
  EKRecurrenceMonthDayChooserController *monthDayChooser;
  id v5;

  monthDayChooser = self->_monthDayChooser;
  v5 = a3;
  -[EKRecurrenceMonthDayChooserController updateFromRecurrenceRule:](monthDayChooser, "updateFromRecurrenceRule:", v5);
  -[EKRecurrenceOrdinalChooserController updateFromRecurrenceRule:](self->_ordinalChooser, "updateFromRecurrenceRule:", v5);
  LODWORD(monthDayChooser) = +[EKUICustomRecurrenceViewController isRecurrenceRuleOrdinal:](EKUICustomRecurrenceViewController, "isRecurrenceRuleOrdinal:", v5);

  -[EKRecurrenceMonthlyChooserController _selectRow:](self, "_selectRow:", monthDayChooser);
}

- (int64_t)frequency
{
  return 2;
}

- (id)_currentChooser
{
  int *v2;

  if (self->_selectedRow)
    v2 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__ordinalChooser;
  else
    v2 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__monthDayChooser;
  return *(id *)((char *)&self->super.super.isa + *v2);
}

- (int64_t)numberOfRows
{
  return 3;
}

- (id)cellForRow:(int64_t)a3
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a3 == 1)
  {
    v5 = 72;
LABEL_6:
    v4 = *(id *)((char *)&self->super.super.isa + v5);
    return v4;
  }
  if (a3 != 2)
  {
    v5 = 64;
    goto LABEL_6;
  }
  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRow:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if (a3 != 2)
    return *MEMORY[0x1E0DC53D8];
  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightForRow:", 0);
  v5 = v4;

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[EKRecurrenceMonthlyChooserController _selectRow:](self, "_selectRow:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recurrenceChooser:wantsRowReload:", self, 2);

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recurrenceChooserUpdated:", v5);

}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  void *v3;
  char v4;

  if (a3 != 2)
    return 1;
  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "drawBackgroundForRow:", 2);

  return v4;
}

- (void)_selectRow:(int64_t)a3
{
  int *v4;
  int *v5;

  self->_selectedRow = a3;
  if (a3)
  {
    if (a3 != 1)
      return;
    v4 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onEachCell;
    v5 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onTheCell;
  }
  else
  {
    v4 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onTheCell;
    v5 = &OBJC_IVAR___EKRecurrenceMonthlyChooserController__onEachCell;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "setAccessoryType:", 3);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v4), "setAccessoryType:", 0);
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return -[EKRecurrenceMonthDayChooserController prohibitsMultipleDaysInMonthlyRecurrence](self->_monthDayChooser, "prohibitsMultipleDaysInMonthlyRecurrence");
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  -[EKRecurrenceMonthDayChooserController setProhibitsMultipleDaysInMonthlyRecurrence:](self->_monthDayChooser, "setProhibitsMultipleDaysInMonthlyRecurrence:", a3);
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[EKRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  EKRecurrenceMonthDayChooserController *monthDayChooser;
  id v5;

  monthDayChooser = self->_monthDayChooser;
  v5 = a3;
  -[EKRecurrenceChooserController setBackgroundColor:](monthDayChooser, "setBackgroundColor:", v5);
  -[EKRecurrenceChooserController setBackgroundColor:](self->_ordinalChooser, "setBackgroundColor:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onTheCell, 0);
  objc_storeStrong((id *)&self->_onEachCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ordinalChooser, 0);
  objc_storeStrong((id *)&self->_monthDayChooser, 0);
}

@end
