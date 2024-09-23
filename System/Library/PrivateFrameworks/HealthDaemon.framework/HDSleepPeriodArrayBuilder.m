@implementation HDSleepPeriodArrayBuilder

- (HDSleepPeriodArrayBuilder)initWithInfo:(id)a3 options:(unint64_t)a4
{
  id v7;
  HDSleepPeriodArrayBuilder *v8;
  HDSleepPeriodArrayBuilder *v9;
  NSMutableArray *v10;
  NSMutableArray *periods;
  NSMutableArray *v12;
  NSMutableArray *currentPeriodSegments;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSleepPeriodArrayBuilder;
  v8 = -[HDSleepPeriodArrayBuilder init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_info, a3);
    v9->_options = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    periods = v9->_periods;
    v9->_periods = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentPeriodSegments = v9->_currentPeriodSegments;
    v9->_currentPeriodSegments = v12;

    v9->_currentUserSetScheduleIndex = 0;
  }

  return v9;
}

- (void)addOrderedSegment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t currentUserSetScheduleIndex;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  NSMutableArray *periods;
  void *v20;
  void *v21;
  NSDate *v22;
  NSDate *currentPeriodEndDate;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *currentPeriodStartDate;
  id v28;

  v4 = a3;
  v5 = v4;
  v28 = v4;
  if (self)
  {
    v5 = v4;
    if (self->_currentPeriodEndDate)
    {
      objc_msgSend(v4, "dateInterval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_currentPeriodEndDate);
      v9 = v8;

      v5 = v28;
      if (v9 >= 3600.0)
      {
        currentUserSetScheduleIndex = self->_currentUserSetScheduleIndex;
        v5 = v28;
        while (1)
        {
          v11 = self->_currentUserSetScheduleIndex;
          -[HDSleepPeriodInfo userSetSchedules](self->_info, "userSetSchedules");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v11 >= v13)
          {
            v18 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_10;
          }
          -[HDSleepPeriodInfo userSetSchedules](self->_info, "userSetSchedules");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", self->_currentUserSetScheduleIndex);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "dateInterval");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "intersectsDateInterval:", v16);

          v18 = self->_currentUserSetScheduleIndex;
          if (v17)
            break;
          self->_currentUserSetScheduleIndex = v18 + 1;

        }
LABEL_10:

        if (v18 != currentUserSetScheduleIndex)
        {

          periods = self->_periods;
          -[HDSleepPeriodArrayBuilder _createPeriodAndReset]((uint64_t)self);
          v5 = (id)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray hk_addNonNilObject:](periods, "hk_addNonNilObject:", v5);
        }
      }
    }
  }

  objc_msgSend(v28, "dateInterval");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMax();
  v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentPeriodEndDate = self->_currentPeriodEndDate;
  self->_currentPeriodEndDate = v22;

  objc_msgSend(v28, "dateInterval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMin();
  v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentPeriodStartDate = self->_currentPeriodStartDate;
  self->_currentPeriodStartDate = v26;

  if (objc_msgSend(v28, "category") != 2 || (self->_options & 1) != 0)
    -[NSMutableArray addObject:](self->_currentPeriodSegments, "addObject:", v28);

}

- (id)_createPeriodAndReset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a1 && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB6BF8], "sleepPeriodWithDateInterval:segments:", v2, *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v6;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)finish
{
  NSMutableArray *periods;
  void *v4;

  periods = self->_periods;
  -[HDSleepPeriodArrayBuilder _createPeriodAndReset]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray hk_addNonNilObject:](periods, "hk_addNonNilObject:", v4);

  return (id)-[NSMutableArray copy](self->_periods, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPeriodEndDate, 0);
  objc_storeStrong((id *)&self->_currentPeriodStartDate, 0);
  objc_storeStrong((id *)&self->_currentPeriodSegments, 0);
  objc_storeStrong((id *)&self->_periods, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
