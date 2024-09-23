@implementation EKRecurrenceMonthChooserController

- (EKRecurrenceMonthChooserController)initWithDate:(id)a3
{
  EKRecurrenceMonthChooserController *v3;
  uint64_t v4;
  NSMutableSet *monthsOfTheYearSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKRecurrenceMonthChooserController;
  v3 = -[EKRecurrenceChooserController initWithDate:](&v7, sel_initWithDate_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    monthsOfTheYearSet = v3->_monthsOfTheYearSet;
    v3->_monthsOfTheYearSet = (NSMutableSet *)v4;

  }
  return v3;
}

- (NSArray)monthsOfTheYear
{
  void *v2;
  void *v3;

  -[NSMutableSet allObjects](self->_monthsOfTheYearSet, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setMonthsOfTheYear:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *monthsOfTheYearSet;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableSet *)objc_msgSend(v6, "mutableCopy");
  monthsOfTheYearSet = self->_monthsOfTheYearSet;
  self->_monthsOfTheYearSet = v4;

}

- (int64_t)frequency
{
  return 3;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EKRecurrenceMonthChooserController monthsOfTheYear](self, "monthsOfTheYear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v7, "setFrequency:", 3);
    -[EKRecurrenceMonthChooserController monthsOfTheYear](self, "monthsOfTheYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMonthNumbers:", v6);

  }
}

- (void)updateFromRecurrenceRule:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "monthsOfTheYear");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "monthsOfTheYear");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceMonthChooserController setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v5);

    -[EKRecurrenceMonthChooserController refreshCells](self, "refreshCells");
  }

}

- (id)tableViewCell
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKRecurrenceMonthChooserController;
  -[EKRecurrenceGridChooserController tableViewCell](&v4, sel_tableViewCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDrawsTopDivider:", 1);
  return v2;
}

- (id)cellLabels
{
  if (cellLabels_onceToken_0 != -1)
    dispatch_once(&cellLabels_onceToken_0, &__block_literal_global_20);
  return (id)cellLabels___cellLabels_0;
}

void __48__EKRecurrenceMonthChooserController_cellLabels__block_invoke()
{
  void *v0;
  int i;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v0 = (void *)objc_opt_new();
  for (i = 1; i != 13; ++i)
  {
    CUIKStringAbbreviationForMonth();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = (const __CFString *)v2;
    else
      v4 = &stru_1E601DFA8;
    objc_msgSend(v0, "addObject:", v4);

  }
  v5 = (void *)cellLabels___cellLabels_0;
  cellLabels___cellLabels_0 = (uint64_t)v0;

}

- (int64_t)gridViewType
{
  return 0;
}

- (void)prepareForDisplay
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[EKRecurrenceMonthChooserController monthsOfTheYear](self, "monthsOfTheYear");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[EKRecurrenceChooserController startDateComponents:](self, "startDateComponents:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "month"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceMonthChooserController setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v7);

  }
}

- (void)refreshCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSMutableSet *monthsOfTheYearSet;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EKRecurrenceGridChooserController allCells](self, "allCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "indexOfObject:", v8);
        monthsOfTheYearSet = self->_monthsOfTheYearSet;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9 + 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSMutableSet containsObject:](monthsOfTheYearSet, "containsObject:", v11);

        objc_msgSend(v8, "setSelected:", v12);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSMutableSet *monthsOfTheYearSet;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableSet count](self->_monthsOfTheYearSet, "count") != 1 || (objc_msgSend(v6, "selected") & 1) == 0)
  {
    objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "selected") ^ 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "selected")
      && -[EKRecurrenceMonthChooserController prohibitsMultipleMonthsInYearlyRecurrence](self, "prohibitsMultipleMonthsInYearlyRecurrence"))
    {
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKRecurrenceMonthChooserController setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v8);

      -[EKRecurrenceMonthChooserController refreshCells](self, "refreshCells");
    }
    else
    {
      v9 = objc_msgSend(v6, "selected");
      monthsOfTheYearSet = self->_monthsOfTheYearSet;
      if (v9)
        -[NSMutableSet addObject:](monthsOfTheYearSet, "addObject:", v7);
      else
        -[NSMutableSet removeObject:](monthsOfTheYearSet, "removeObject:", v7);
    }
    -[EKRecurrenceChooserController notifyDelegate](self, "notifyDelegate");

  }
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_prohibitsMultipleMonthsInYearlyRecurrence != a3)
  {
    self->_prohibitsMultipleMonthsInYearlyRecurrence = a3;
    if (a3)
    {
      -[EKRecurrenceMonthChooserController monthsOfTheYear](self, "monthsOfTheYear");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        -[EKRecurrenceMonthChooserController monthsOfTheYear](self, "monthsOfTheYear");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecurrenceMonthChooserController setMonthsOfTheYear:](self, "setMonthsOfTheYear:", v8);

        -[EKRecurrenceMonthChooserController refreshCells](self, "refreshCells");
      }
    }
  }
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return self->_prohibitsMultipleMonthsInYearlyRecurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthsOfTheYearSet, 0);
}

@end
