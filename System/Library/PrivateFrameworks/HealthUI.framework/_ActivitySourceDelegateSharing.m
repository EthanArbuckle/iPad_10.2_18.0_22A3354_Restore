@implementation _ActivitySourceDelegateSharing

- (_ActivitySourceDelegateSharing)initWithTimescopeToSummariesTable:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6 calendar:(id)a7
{
  id v13;
  id v14;
  _ActivitySourceDelegateSharing *v15;
  _ActivitySourceDelegateSharing *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_ActivitySourceDelegateSharing;
  v15 = -[_ActivitySourceDelegate initWithActivityValue:displayTypeController:unitPreferenceController:](&v18, sel_initWithActivityValue_displayTypeController_unitPreferenceController_, a4, a5, a6);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timescopeToSummariesTable, a3);
    objc_storeStrong((id *)&v16->_calendar, a7);
  }

  return v16;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[_ActivitySourceDelegateSharing timescopeToSummariesTable](self, "timescopeToSummariesTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_ActivitySourceDelegateSharing _filterSummaries:dateRange:](self, "_filterSummaries:dateRange:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_filterSummaries:(id)a3 dateRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___ActivitySourceDelegateSharing__filterSummaries_dateRange___block_invoke;
  v10[3] = &unk_1E9C45140;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "hk_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)timescopeToSummariesTable
{
  return self->_timescopeToSummariesTable;
}

- (void)setTimescopeToSummariesTable:(id)a3
{
  objc_storeStrong((id *)&self->_timescopeToSummariesTable, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_timescopeToSummariesTable, 0);
}

@end
