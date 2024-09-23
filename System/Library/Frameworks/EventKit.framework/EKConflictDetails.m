@implementation EKConflictDetails

+ (id)infoWithConflictsInSeries:(int64_t)a3 outOf:(int64_t)a4 withPeriod:(id)a5 conflictingDates:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a6;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setTotalOccurrencesInSeries:", a4);
  objc_msgSend(v11, "setTotalConflictsInSeries:", a3);
  objc_msgSend(v11, "setConflictPeriodForSeries:", v10);

  objc_msgSend(v11, "setConflictingDates:", v9);
  return v11;
}

+ (id)infoWithConflicts:(int64_t)a3 needsAction:(int64_t)a4 event:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)objc_opt_new();
  if (v7)
  {
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConflictingEvents:", v9);

    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsActionEvents:", v10);

    objc_msgSend(v7, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConflictingDates:", v12);

  }
  objc_msgSend(v8, "setTotalConflictingEvents:", a3);
  objc_msgSend(v8, "setTotalNeedsActionEvents:", a4);
  objc_msgSend(v8, "setTotalOccurrencesInSeries:", 1);
  objc_msgSend(v8, "setTotalConflictsInSeries:", 1);

  return v8;
}

- (EKConflictDetails)initWithConflictingDates:(id)a3 conflictingEvents:(id)a4 needsActionEvents:(id)a5 totalOccurrencesInSeries:(unint64_t)a6 conflictPeriodForSeries:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  EKConflictDetails *v17;
  EKConflictDetails *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)EKConflictDetails;
  v17 = -[EKConflictDetails init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_conflictingDates, a3);
    objc_storeStrong((id *)&v18->_conflictingEvents, a4);
    objc_storeStrong((id *)&v18->_needsActionEvents, a5);
    v18->_totalOccurrencesInSeries = a6;
    objc_storeStrong((id *)&v18->_conflictPeriodForSeries, a7);
    v18->_totalConflictsInSeries = objc_msgSend(v13, "count");
    v18->_totalConflictingEvents = objc_msgSend(v14, "count");
    v18->_totalNeedsActionEvents = objc_msgSend(v15, "count");
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; Conflicts: %lu Out of total: %lu>"),
               objc_opt_class(),
               self,
               -[EKConflictDetails totalConflictsInSeries](self, "totalConflictsInSeries"),
               -[EKConflictDetails totalOccurrencesInSeries](self, "totalOccurrencesInSeries"));
}

+ (id)dateRangeToScanForConflictsForEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateRangeToScanForConflictsForEvent:dateForNow:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_dateRangeToScanForConflictsForEvent:(id)a3 dateForNow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recurrenceRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "CalIsBeforeDate:", v10))
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(a1, "_maxRangeLengthForRule:", v9);
  objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:duration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (double)_maxRangeLengthForRule:(id)a3
{
  id v3;
  void *v4;
  double v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  v5 = 31536000.0;
  if (v3)
  {
    v6 = objc_msgSend(v3, "frequency");
    if (v6 <= 2)
      v5 = dbl_1A244A7C0[v6];
  }

  return v5;
}

- (NSArray)conflictingDates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConflictingDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)conflictingEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConflictingEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)needsActionEvents
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNeedsActionEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)totalOccurrencesInSeries
{
  return self->_totalOccurrencesInSeries;
}

- (void)setTotalOccurrencesInSeries:(unint64_t)a3
{
  self->_totalOccurrencesInSeries = a3;
}

- (unint64_t)totalConflictsInSeries
{
  return self->_totalConflictsInSeries;
}

- (void)setTotalConflictsInSeries:(unint64_t)a3
{
  self->_totalConflictsInSeries = a3;
}

- (unint64_t)totalConflictingEvents
{
  return self->_totalConflictingEvents;
}

- (void)setTotalConflictingEvents:(unint64_t)a3
{
  self->_totalConflictingEvents = a3;
}

- (unint64_t)totalNeedsActionEvents
{
  return self->_totalNeedsActionEvents;
}

- (void)setTotalNeedsActionEvents:(unint64_t)a3
{
  self->_totalNeedsActionEvents = a3;
}

- (CalDateRange)conflictPeriodForSeries
{
  return (CalDateRange *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConflictPeriodForSeries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictPeriodForSeries, 0);
  objc_storeStrong((id *)&self->_needsActionEvents, 0);
  objc_storeStrong((id *)&self->_conflictingEvents, 0);
  objc_storeStrong((id *)&self->_conflictingDates, 0);
}

@end
