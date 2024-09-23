@implementation EKRecurrenceOrdinalPickerViewController

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DC3AE0]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  -[EKRecurrenceOrdinalPickerViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKRecurrenceOrdinalPickerViewController;
  -[EKRecurrenceOrdinalPickerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[EKRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHostsLayoutEngine:", 0);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)dayOfWeekForRow:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = a3;
  if (a3 <= 6)
  {
    v4 = CUIKZeroIndexedWeekStart();
    if (v4 + v3 <= 6)
      v3 += v4;
    else
      return v4 + v3 - 7;
  }
  return v3;
}

- (int64_t)rowForDayOfWeek:(int64_t)a3
{
  uint64_t v4;

  v4 = CUIKZeroIndexedWeekStart();
  if (a3 >= v4)
    return a3 - v4;
  else
    return a3 - v4 + 7;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  if (a4 == 1)
  {
    -[EKRecurrenceOrdinalPickerViewController _rightColumn](self, "_rightColumn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[EKRecurrenceOrdinalPickerViewController _leftColumn](self, "_leftColumn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "count");

LABEL_7:
  return v9;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  if (a5)
  {
    -[EKRecurrenceOrdinalPickerViewController _rightColumn](self, "_rightColumn", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EKRecurrenceOrdinalPickerViewController dayOfWeekForRow:](self, "dayOfWeekForRow:", a4);
    v9 = v7;
  }
  else
  {
    -[EKRecurrenceOrdinalPickerViewController _leftColumn](self, "_leftColumn", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = a4;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;

  -[EKRecurrenceOrdinalPickerViewController delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frequencyPickerUpdated:", self);

}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDays:", -[EKRecurrenceOrdinalPickerViewController dayMask](self, "dayMask"));
  objc_msgSend(v4, "setOrdinalValue:", -[EKRecurrenceOrdinalPickerViewController ordinalValue](self, "ordinalValue"));

}

- (void)updateFromRecurrenceRule:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "setPositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "daysOfTheWeek");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      v8 = objc_msgSend(v7, "dayOfTheWeek") - 1;
    }
    else if ((objc_msgSend(v14, "isWeekendRule") & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v14, "isWeekdayRule") & 1) != 0)
    {
      v8 = 8;
    }
    else if (objc_msgSend(v14, "isAnyDayRule"))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9 = objc_msgSend(v7, "weekNumber");

    if (v5)
      goto LABEL_14;
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5)
LABEL_14:
      v9 = objc_msgSend(v5, "integerValue");
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[EKRecurrenceOrdinalPickerViewController rowForDayOfWeek:](self, "rowForDayOfWeek:", v8);
    -[EKRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectRow:inComponent:animated:", v10, 1, 0);

  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 <= 5)
      v12 = v9 - 1;
    else
      v12 = 5;
    -[EKRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectRow:inComponent:animated:", v12, 0, 0);

  }
}

- (int)dayMask
{
  void *v3;
  uint64_t v4;

  -[EKRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 1);

  if (v4 <= 6)
    return +[EKRecurrenceChooserController dayFromNumber:](EKRecurrenceChooserController, "dayFromNumber:", -[EKRecurrenceOrdinalPickerViewController dayOfWeekForRow:](self, "dayOfWeekForRow:", v4) + 1);
  if ((unint64_t)(v4 - 7) > 2)
    return 0;
  return dword_1AFA13678[v4 - 7];
}

- (int)ordinalValue
{
  void *v2;
  int v3;

  -[EKRecurrenceOrdinalPickerViewController pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRowInComponent:", 0);

  return v3 + 1;
}

- (id)_leftColumn
{
  if (_leftColumn_onceToken != -1)
    dispatch_once(&_leftColumn_onceToken, &__block_literal_global_43);
  return (id)_leftColumn___leftColumn;
}

void __54__EKRecurrenceOrdinalPickerViewController__leftColumn__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  EventKitUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("first"), &stru_1E601DFA8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("second"), &stru_1E601DFA8, 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("third"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("fourth"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("fifth"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v5;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("next to last"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v6;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("last"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_leftColumn___leftColumn;
  _leftColumn___leftColumn = v8;

}

- (id)_rightColumn
{
  if (_rightColumn_onceToken != -1)
    dispatch_once(&_rightColumn_onceToken, &__block_literal_global_24_0);
  return (id)_rightColumn___rightColumn;
}

void __55__EKRecurrenceOrdinalPickerViewController__rightColumn__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  EventKitUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForDayOfWeekNotStandalone();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v12;
  CUIKStringForDayOfWeekNotStandalone();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  CUIKStringForDayOfWeekNotStandalone();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  CUIKStringForDayOfWeekNotStandalone();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v3;
  CUIKStringForDayOfWeekNotStandalone();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  CUIKStringForDayOfWeekNotStandalone();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v5;
  CUIKStringForDayOfWeekNotStandalone();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("day"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v7;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("weekday"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v8;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("weekend day"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_rightColumn___rightColumn;
  _rightColumn___rightColumn = v10;

}

- (EKRecurrenceOrdinalPickerViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EKRecurrenceOrdinalPickerViewControllerDelegate *)a3;
}

@end
