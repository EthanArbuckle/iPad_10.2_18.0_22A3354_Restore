@implementation FITypicalDayActivityModel

- (id)initForDateInterval:(id)a3 delegate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  FISleepDataProvider *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x24BEA9950];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[FISleepDataProvider initWithSleepStore:delegate:]([FISleepDataProvider alloc], "initWithSleepStore:delegate:", v9, self);
  v11 = -[FITypicalDayActivityModel initForDateInterval:delegate:sleepDataProvider:](self, "initForDateInterval:delegate:sleepDataProvider:", v8, v7, v10);

  return v11;
}

- (id)initForDateInterval:(id)a3 delegate:(id)a4 sleepDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  FITypicalDayActivityModel *v12;
  FITypicalDayActivityModel *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  dispatch_group_t *v17;
  dispatch_group_t v18;
  dispatch_group_t v19;
  _QWORD block[4];
  dispatch_group_t *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FITypicalDayActivityModel;
  v12 = -[FITypicalDayActivityModel init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    -[FITypicalDayActivityModel setDelegate:](v12, "setDelegate:", v10);
    objc_storeStrong((id *)&v13->_interval, a3);
    objc_storeStrong((id *)&v13->_sleepDataProvider, a5);
    v13->_sleepUserDayLock._os_unfair_lock_opaque = 0;
    -[FISleepDataProvider activate](v13->_sleepDataProvider, "activate");
    -[FITypicalDayActivityModel _updateSleepUserDay](v13, "_updateSleepUserDay");
    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = v13->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__FITypicalDayActivityModel_initForDateInterval_delegate_sleepDataProvider___block_invoke;
    block[3] = &unk_24CC4E880;
    v17 = v13;
    v22 = v17;
    dispatch_sync(v16, block);
    *((_BYTE *)v17 + 48) = 0;
    v18 = dispatch_group_create();
    v19 = v17[7];
    v17[7] = v18;

    dispatch_group_enter(v17[7]);
  }

  return v13;
}

uint64_t __76__FITypicalDayActivityModel_initForDateInterval_delegate_sleepDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateHistogramsAndOffWristDateForToday");
}

- (void)_updateSleepUserDay
{
  os_unfair_lock_s *p_sleepUserDayLock;
  FISleepUserDay *v4;
  FISleepUserDay *sleepUserDay;

  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  -[FISleepDataProvider sleepUserDay](self->_sleepDataProvider, "sleepUserDay");
  v4 = (FISleepUserDay *)objc_claimAutoreleasedReturnValue();
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;

  os_unfair_lock_unlock(p_sleepUserDayLock);
}

- (id)sleepUserDay
{
  os_unfair_lock_s *p_sleepUserDayLock;
  FISleepUserDay *v4;

  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  v4 = self->_sleepUserDay;
  os_unfair_lock_unlock(p_sleepUserDayLock);
  return v4;
}

- (id)startOfToday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)endOfToday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FITypicalDayActivityModel startOfToday](self, "startOfToday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_queue_currentValueForHistogram:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummary _startDate](self->_queue_currentActivitySummary, "_startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FITypicalDayActivityModel _bucketIndexForDate:startOfDay:bucketDates:](self, "_bucketIndexForDate:startOfDay:bucketDates:", v6, v7, self->_queue_bucketDates);

  v9 = 0.0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v13 = v12;
    -[NSMutableArray objectAtIndex:](self->_queue_bucketDates, "objectAtIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v11 = v13 - v15;

    if (v8 < 0 || objc_msgSend(v4, "bucketCount") < 1)
    {
      v10 = 0.0;
    }
    else
    {
      v16 = 0;
      do
      {
        objc_msgSend(v4, "valueForBucketAtIndex:", v16);
        v10 = v17;
        v9 = v9 + v17;
        if (v8 == v16)
          break;
        ++v16;
      }
      while (v16 < objc_msgSend(v4, "bucketCount"));
    }
  }
  v18 = v9 - v10 * (1.0 - v11 / (double)(60 * (0x5A0uLL / -[NSMutableArray count](self->_queue_bucketDates, "count"))));

  return v18;
}

- (double)_percentageOfTypicalDayComparedToNowForGoal:(int64_t)a3
{
  NSObject *queue;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__FITypicalDayActivityModel__percentageOfTypicalDayComparedToNowForGoal___block_invoke;
  block[3] = &unk_24CC4F178;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __73__FITypicalDayActivityModel__percentageOfTypicalDayComparedToNowForGoal___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
      case 3:
      case 4:
        return;
      case 1:
        v4 = MoveValueForActivitySummary(v2);
        v5 = 24;
        goto LABEL_7;
      case 2:
        objc_msgSend(v2, "appleExerciseTime");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "doubleValueForUnit:", v7);
        v4 = v8;

        v5 = 32;
LABEL_7:
        v3 = *(id *)(*(_QWORD *)(a1 + 32) + v5);
        goto LABEL_8;
      default:
        v3 = 0;
        v4 = 0.0;
LABEL_8:
        v10 = v3;
        objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", v3);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 / v9;

        break;
    }
  }
}

- (double)percentageOfTypicalDayMoveComparedToNow
{
  double result;

  -[FITypicalDayActivityModel _percentageOfTypicalDayComparedToNowForGoal:](self, "_percentageOfTypicalDayComparedToNowForGoal:", 1);
  return result;
}

- (double)percentageOfTypicalDayBriskMinutesEarnedComparedToNow
{
  double result;

  -[FITypicalDayActivityModel _percentageOfTypicalDayComparedToNowForGoal:](self, "_percentageOfTypicalDayComparedToNowForGoal:", 2);
  return result;
}

- (double)valueOfTypicalDayBriskMinutesEarnedByNow
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__FITypicalDayActivityModel_valueOfTypicalDayBriskMinutesEarnedByNow__block_invoke;
  v5[3] = &unk_24CC4F1A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__FITypicalDayActivityModel_valueOfTypicalDayBriskMinutesEarnedByNow__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)valueOfTypicalDayMoveEarnedByNow
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__FITypicalDayActivityModel_valueOfTypicalDayMoveEarnedByNow__block_invoke;
  v5[3] = &unk_24CC4F1A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__FITypicalDayActivityModel_valueOfTypicalDayMoveEarnedByNow__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)_willCompleteGoalWithType:(int64_t)a3 bufferPercentage:(double)a4
{
  NSObject *queue;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__FITypicalDayActivityModel__willCompleteGoalWithType_bufferPercentage___block_invoke;
  v9[3] = &unk_24CC4F1C8;
  v9[5] = &v10;
  v9[6] = a3;
  *(double *)&v9[7] = a4;
  v9[4] = self;
  dispatch_sync(queue, v9);
  LOBYTE(a3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a3;
}

void __72__FITypicalDayActivityModel__willCompleteGoalWithType_bufferPercentage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
      case 3:
      case 4:
        return;
      case 1:
        v6 = MoveValueForActivitySummary(v2);
        v10 = MoveGoalValueForActivitySummary(*(void **)(*(_QWORD *)(a1 + 32) + 16));
        v11 = 24;
        goto LABEL_7;
      case 2:
        objc_msgSend(v2, "appleExerciseTime");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "doubleValueForUnit:", v4);
        v6 = v5;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appleExerciseTimeGoal");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValueForUnit:", v8);
        v10 = v9;

        v11 = 32;
LABEL_7:
        v12 = *(id *)(*(_QWORD *)(a1 + 32) + v11);
        if (v6 >= v10)
          goto LABEL_12;
        v29 = v12;
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = *(id **)(a1 + 32);
        objc_msgSend(v15[2], "_startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "_bucketIndexForDate:startOfDay:bucketDates:", v14, v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v17 + 1;
          v19 = objc_msgSend(v29, "bucketCount");
          v20 = 0.0;
          while (v18 < v19)
          {
            objc_msgSend(v29, "valueForBucketAtIndex:", v18);
            v20 = v20 + v21;
            ++v18;
            v19 = objc_msgSend(v29, "bucketCount");
          }
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v23 = v22;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndex:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceReferenceDate");
          v26 = v23 - v25;

          v27 = (double)(60 * (0x5A0uLL / objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")));
          objc_msgSend(v29, "valueForBucketAtIndex:", v17);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6 + v20 + v28 * (1.0 - v26 / v27) >= v10 * (*(double *)(a1 + 56) + 1.0);
        }

        v12 = v29;
        break;
      default:
        v12 = 0;
LABEL_12:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        break;
    }

  }
}

- (BOOL)willCompleteMoveGoalWithBufferPercentage:(double)a3
{
  return -[FITypicalDayActivityModel _willCompleteGoalWithType:bufferPercentage:](self, "_willCompleteGoalWithType:bufferPercentage:", 1, a3);
}

- (BOOL)willCompleteExerciseGoalWithBufferPercentage:(double)a3
{
  return -[FITypicalDayActivityModel _willCompleteGoalWithType:bufferPercentage:](self, "_willCompleteGoalWithType:bufferPercentage:", 2, a3);
}

- (BOOL)willCompleteStandGoalOrItIsTooLateWithBufferPercentage:(double)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  double v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[FITypicalDayActivityModel userEndOfDay](self, "userEndOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__FITypicalDayActivityModel_willCompleteStandGoalOrItIsTooLateWithBufferPercentage___block_invoke;
  v9[3] = &unk_24CC4F1F0;
  v9[4] = self;
  v10 = v5;
  v12 = a3;
  v11 = &v13;
  v7 = v5;
  dispatch_sync(queue, v9);
  LOBYTE(queue) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __84__FITypicalDayActivityModel_willCompleteStandGoalOrItIsTooLateWithBufferPercentage___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  id v30;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentDate");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_standHoursCompletionPercentage");
    if (v4 < 1.0)
    {
      objc_msgSend(v30, "timeIntervalSinceReferenceDate");
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "component:fromDate:", 32, v30);

      if (v6 >= v8)
      {
        if (v11)
          v18 = 24 - v11;
        else
          v18 = 0;
      }
      else
      {
        if (v11)
          v12 = v11;
        else
          v12 = 24;
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currentCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "component:fromDate:", 32, v13);
        if (v16)
          v17 = v16;
        else
          v17 = 24;

        v18 = v17 - v12;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appleStandHoursGoal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValueForUnit:", v20);
      v22 = v21;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appleStandHours");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValueForUnit:", v24);
      v26 = v25;

      v27 = (uint64_t)(v22 - v26);
      v28 = __OFSUB__(v18, v27);
      v29 = v18 - v27;
      if (v29 < 0 == v28 && v22 * *(double *)(a1 + 56) >= (double)v29)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }

  }
}

- (double)currentMoveGoalPercentage
{
  NSObject *queue;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__FITypicalDayActivityModel_currentMoveGoalPercentage__block_invoke;
  v6[3] = &unk_24CC4F1A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__FITypicalDayActivityModel_currentMoveGoalPercentage__block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MovePercentageForActivitySummary(*(void **)(*(_QWORD *)(a1 + 32) + 16));
}

- (double)currentExerciseGoalPercentage
{
  NSObject *queue;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__FITypicalDayActivityModel_currentExerciseGoalPercentage__block_invoke;
  v6[3] = &unk_24CC4F1A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__FITypicalDayActivityModel_currentExerciseGoalPercentage__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_exerciseTimeCompletionPercentage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)currentStandGoalPercentage
{
  NSObject *queue;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__FITypicalDayActivityModel_currentStandGoalPercentage__block_invoke;
  v6[3] = &unk_24CC4F1A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__FITypicalDayActivityModel_currentStandGoalPercentage__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_standHoursCompletionPercentage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)willCompletingMoveRingEarnStreakAchievement
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[FITypicalDayActivityModel delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "bestMoveStreak"))
      {
        -[FITypicalDayActivityModel delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "bestMoveStreak") - 1;

      }
      else
      {
        v8 = 0;
      }

      -[FITypicalDayActivityModel delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "currentMoveStreak") >= v8;

      return v9;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
    -[FITypicalDayActivityModel willCompletingMoveRingEarnStreakAchievement].cold.1();
  return 0;
}

- (BOOL)projectedToBeatMoveRecordByEndOfDay
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  BOOL v9;
  void *v11;
  double v12;
  double v13;
  NSObject *queue;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  _QWORD v20[8];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t v33[4];
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_7:
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
      -[FITypicalDayActivityModel projectedToBeatMoveRecordByEndOfDay].cold.1();
    return 0;
  }
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    goto LABEL_7;
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "totalMoveGoalsAttempted");

  if (v7 >= 8)
  {
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestMoveValue");
    v13 = v12;

    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 0;
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x2020000000;
    v24 = 0;
    queue = self->_queue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __64__FITypicalDayActivityModel_projectedToBeatMoveRecordByEndOfDay__block_invoke;
    v20[3] = &unk_24CC4F218;
    v20[4] = self;
    v20[5] = buf;
    v20[6] = &v25;
    v20[7] = &v21;
    dispatch_sync(queue, v20);
    v15 = v26[3];
    v16 = v22[3];
    v17 = *((double *)v30 + 3);
    _HKInitializeLogging();
    v18 = v15 - v16 + v17;
    v19 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218240;
      v34 = v18;
      v35 = 2048;
      v36 = v13;
      _os_log_impl(&dword_21168F000, v19, OS_LOG_TYPE_DEFAULT, "Projected to earn %f move credit by EOD; current record is %f",
        v33,
        0x16u);
    }
    v9 = v18 > v13;
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FC8];
    v9 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21168F000, v8, OS_LOG_TYPE_DEFAULT, "Not projected to beat move record by EOD because too few days of Activity history to earn achievement", buf, 2u);
      return 0;
    }
  }
  return v9;
}

void __64__FITypicalDayActivityModel_projectedToBeatMoveRecordByEndOfDay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "valueForBucketAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "bucketCount") - 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  objc_msgSend(*(id *)(a1 + 32), "_queue_currentValueForHistogram:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = MoveGoalValueForActivitySummary(*(void **)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)rebuildWithInterval:(id)a3
{
  NSObject *queue;
  id v6;
  _QWORD block[5];

  objc_storeStrong((id *)&self->_interval, a3);
  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__FITypicalDayActivityModel_rebuildWithInterval___block_invoke;
  block[3] = &unk_24CC4E880;
  block[4] = self;
  dispatch_sync(queue, block);

}

uint64_t __49__FITypicalDayActivityModel_rebuildWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateHistogramsAndOffWristDateForToday");
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[9];
  _QWORD v32[11];

  v32[9] = *MEMORY[0x24BDAC8D0];
  v31[0] = CFSTR("startOfToday");
  -[FITypicalDayActivityModel startOfToday](self, "startOfToday");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  v31[1] = CFSTR("endOfToday");
  -[FITypicalDayActivityModel endOfToday](self, "endOfToday");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "description");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v27;
  v31[2] = CFSTR("percentageOfTypicalDayMoveComparedToNow");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[FITypicalDayActivityModel percentageOfTypicalDayMoveComparedToNow](self, "percentageOfTypicalDayMoveComparedToNow");
  objc_msgSend(v3, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v25;
  v31[3] = CFSTR("percentageOfTypicalDayBriskMinutesEarnedComparedToNow");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[FITypicalDayActivityModel percentageOfTypicalDayBriskMinutesEarnedComparedToNow](self, "percentageOfTypicalDayBriskMinutesEarnedComparedToNow");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v6;
  v31[4] = CFSTR("userEndOfDay");
  -[FITypicalDayActivityModel userEndOfDay](self, "userEndOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24CC50B10;
  v32[4] = v10;
  v31[5] = CFSTR("userStartOfDay");
  -[FITypicalDayActivityModel userStartOfDay](self, "userStartOfDay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24CC50B10;
  v32[5] = v14;
  v31[6] = CFSTR("moveHistogram");
  -[FISimpleHistogram descriptionArray](self->_queue_moveHistogram, "descriptionArray");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_24CC50B10;
  v32[6] = v17;
  v31[7] = CFSTR("exerciseHistogram");
  -[FISimpleHistogram descriptionArray](self->_queue_exerciseHistogram, "descriptionArray");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_24CC50B10;
  v32[7] = v20;
  v31[8] = CFSTR("totalActiveDays");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FITypicalDayActivityModel totalActiveDays](self, "totalActiveDays"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (BOOL)shouldSuggestWalkWithActivitySettingsController:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  BOOL v7;
  const char *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t v23[16];
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__FITypicalDayActivityModel_shouldSuggestWalkWithActivitySettingsController___block_invoke;
  block[3] = &unk_24CC4F1A0;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(queue, block);
  if (v26[3] == 2)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FC8];
    v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v8 = "User is in move minutes mode, not suggesting walk";
LABEL_10:
      _os_log_impl(&dword_21168F000, v6, OS_LOG_TYPE_DEFAULT, v8, v23, 2u);
      v7 = 0;
    }
  }
  else if (objc_msgSend(v4, "experienceType") == 1)
  {
    -[FITypicalDayActivityModel briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:](self, "briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:", v4);
    v10 = v9;
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v17);
    v19 = v18;
    v20 = vcvtpd_u64_f64(v10 / 60.0);

    v21 = vcvtmd_u64_f64(v19 / 60.0);
    if (v21 >= 0x1E)
      v21 = 30;
    v7 = v20 - 1 < v21;
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FC8];
    v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      v8 = "User is in the fitness jr. experience, not suggesting walk";
      goto LABEL_10;
    }
  }
  _Block_object_dispose(&v25, 8);

  return v7;
}

uint64_t __77__FITypicalDayActivityModel_shouldSuggestWalkWithActivitySettingsController___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activityMoveMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[FITypicalDayActivityModel _waitUntilActivitySummaryLoaded](self, "_waitUntilActivitySummaryLoaded");
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__FITypicalDayActivityModel_briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController___block_invoke;
  block[3] = &unk_24CC4F240;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __92__FITypicalDayActivityModel_briskWalkTimeToCompleteMoveGoalWithAcitivitySettingsController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dateOfBirth");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "biologicalSex");
  objc_msgSend(*(id *)(a1 + 40), "height");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "weight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:biologicalSex:height:weight:wheelchairUse:experienceType:", v7, v3, v4, v5, objc_msgSend(*(id *)(a1 + 40), "wheelchairUse"), objc_msgSend(*(id *)(a1 + 40), "experienceType"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

- (double)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 height:(id)a5 weight:(id)a6 wheelchairUse:(int64_t)a7 experienceType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  double v18;
  const char *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _BOOL8 v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  os_log_t *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  if (-[HKActivitySummary activityMoveMode](self->_queue_currentActivitySummary, "activityMoveMode") == HKActivityMoveModeAppleMoveTime)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x24BDD2FC8];
    v18 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v69) = 0;
      v19 = "Not computing brisk walk time for user in move minutes mode.";
LABEL_22:
      _os_log_impl(&dword_21168F000, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v69, 2u);
    }
  }
  else if (a8 == 1)
  {
    if (-[HKActivitySummary _hasEnergyBurnedGoal](self->_queue_currentActivitySummary, "_hasEnergyBurnedGoal"))
    {
      -[HKActivitySummary activeEnergyBurnedGoal](self->_queue_currentActivitySummary, "activeEnergyBurnedGoal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "smallCalorieUnit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValueForUnit:", v21);
      v23 = v22;

      -[HKActivitySummary activeEnergyBurned](self->_queue_currentActivitySummary, "activeEnergyBurned");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "smallCalorieUnit");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValueForUnit:", v25);
      v27 = v26;

      if (v23 - v27 >= 0.0)
        v28 = v23 - v27;
      else
        v28 = 0.0;
      -[FITypicalDayActivityModel delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[FITypicalDayActivityModel delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currentCalendar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar((uint64_t)v14, (uint64_t)v30, v32);

      v34 = a4 != 2;
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValueForUnit:", v35);
      v37 = v36;

      objc_msgSend(MEMORY[0x24BDD4048], "gramUnitWithMetricPrefix:", 9);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValueForUnit:", v38);
      v40 = v39;

      v41 = FICMotionConditionForWheelchairUse(a7);
      v74 = 0;
      v75 = &v74;
      v76 = 0x2050000000;
      v42 = (void *)getCMCalorieUserInfoClass_softClass;
      v77 = getCMCalorieUserInfoClass_softClass;
      if (!getCMCalorieUserInfoClass_softClass)
      {
        v69 = MEMORY[0x24BDAC760];
        v70 = 3221225472;
        v71 = __getCMCalorieUserInfoClass_block_invoke;
        v72 = &unk_24CC4F2B8;
        v73 = &v74;
        __getCMCalorieUserInfoClass_block_invoke((uint64_t)&v69);
        v42 = (void *)v75[3];
      }
      v43 = objc_retainAutorelease(v42);
      _Block_object_dispose(&v74, 8);
      v44 = (void *)objc_msgSend([v43 alloc], "initWithAge:gender:height:weight:condition:", v34, v41, (double)v33, v37, v40);
      v74 = 0;
      v75 = &v74;
      v76 = 0x2050000000;
      v45 = (void *)getCMNatalimeterClass_softClass;
      v77 = getCMNatalimeterClass_softClass;
      if (!getCMNatalimeterClass_softClass)
      {
        v69 = MEMORY[0x24BDAC760];
        v70 = 3221225472;
        v71 = __getCMNatalimeterClass_block_invoke;
        v72 = &unk_24CC4F2B8;
        v73 = &v74;
        __getCMNatalimeterClass_block_invoke((uint64_t)&v69);
        v45 = (void *)v75[3];
      }
      v46 = objc_retainAutorelease(v45);
      _Block_object_dispose(&v74, 8);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "computeTimeToActiveCalories:user:workoutType:", v47, v44, 1);
      v49 = v48;

      _HKInitializeLogging();
      v50 = (os_log_t *)MEMORY[0x24BDD2FC8];
      v51 = *MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEBUG))
        -[FITypicalDayActivityModel _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:biologicalSex:height:weight:wheelchairUse:experienceType:].cold.3(v51, v52, v53, v54, v55, v56, v57, v58);
      _HKInitializeLogging();
      v59 = *v50;
      v60 = os_log_type_enabled(*v50, OS_LOG_TYPE_DEBUG);
      if (v49 >= 1200.0)
      {
        v18 = ceil(v49 / 300.0) * 300.0;
        if (v60)
          -[FITypicalDayActivityModel _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:biologicalSex:height:weight:wheelchairUse:experienceType:].cold.2(v59, v61, v62, v63, v64, v65, v66, v67);
      }
      else
      {
        v18 = ceil(v49 / 60.0) * 60.0;
        if (v60)
          -[FITypicalDayActivityModel _queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:biologicalSex:height:weight:wheelchairUse:experienceType:].cold.1(v59, v61, v62, v63, v64, v65, v66, v67);
      }

    }
    else
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x24BDD2FC8];
      v18 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v69) = 0;
        v19 = "Not computing brisk walk time because activity summary has no energy burned goal set.";
        goto LABEL_22;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x24BDD2FC8];
    v18 = 0.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v69) = 0;
      v19 = "Not computing brisk walk time for user in the fitness jr. experience.";
      goto LABEL_22;
    }
  }

  return v18;
}

- (id)userStartOfDay
{
  FITypicalDayActivityModelDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (v6 = objc_loadWeakRetained((id *)p_delegate),
        objc_msgSend(v6, "clientProvidedUserStartOfDay"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    os_unfair_lock_lock(&self->_sleepUserDayLock);
    -[FISleepUserDay startOfDay](self->_sleepUserDay, "startOfDay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_sleepUserDayLock);
    if (!v7)
    {
      -[FITypicalDayActivityModel delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstOnWristDateToday");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

- (id)userEndOfDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FITypicalDayActivityModelDelegate **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITypicalDayActivityModel userStartOfDay](self, "userStartOfDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || (v12 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v12, "clientProvidedUserEndOfDay"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    os_unfair_lock_lock(&self->_sleepUserDayLock);
    -[FISleepUserDay endOfDay](self->_sleepUserDay, "endOfDay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_sleepUserDayLock);
  }
  if (objc_msgSend(v13, "hk_isAfterDate:", v7))
  {
    v14 = v7;

    v13 = v14;
  }
  if (!v13)
  {
    -[FITypicalDayActivityModel projectedOffWrist](self, "projectedOffWrist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v17, "clientProvidedDefaultEndOfDay");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v8, "dateByAddingTimeInterval:", 43200.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "earlierDate:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        v19 = *MEMORY[0x24BDD2FC8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v13;
          _os_log_impl(&dword_21168F000, v19, OS_LOG_TYPE_DEFAULT, "Projected off wrist date is nil, using earliest of default day length or midnight: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }

  return v13;
}

- (id)projectedOffWrist
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__FITypicalDayActivityModel_projectedOffWrist__block_invoke;
  v5[3] = &unk_24CC4F1A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__FITypicalDayActivityModel_projectedOffWrist__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (double)projectedDayDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[FITypicalDayActivityModel userStartOfDay](self, "userStartOfDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITypicalDayActivityModel userEndOfDay](self, "userEndOfDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 43200.0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v7;
  }

  return v6;
}

- (BOOL)isSleepAlarmEnabledForToday
{
  void *v2;
  BOOL v3;

  -[FISleepDataProvider sleepUserDay](self->_sleepDataProvider, "sleepUserDay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_goodMorningAlertDismissedDateForToday
{
  void *v3;
  os_unfair_lock_s *p_sleepUserDayLock;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[FISleepDataProvider lastGoodMorningDismissedDate](self->_sleepDataProvider, "lastGoodMorningDismissedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  -[FISleepUserDay startOfDay](self->_sleepUserDay, "startOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hk_isAfterOrEqualToDate:", v5);

  os_unfair_lock_unlock(p_sleepUserDayLock);
  if (v6)
    v7 = v3;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)userWakeUpDateForToday
{
  os_unfair_lock_s *p_sleepUserDayLock;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  p_sleepUserDayLock = &self->_sleepUserDayLock;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  -[FISleepUserDay startOfDay](self->_sleepUserDay, "startOfDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_sleepUserDayLock);
  if (!-[FISleepDataProvider isGoodMorningAlertNotificationEnabled](self->_sleepDataProvider, "isGoodMorningAlertNotificationEnabled")|| (-[FITypicalDayActivityModel _goodMorningAlertDismissedDateForToday](self, "_goodMorningAlertDismissedDateForToday"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[FISleepDataProvider lastAlarmWakeUpDate](self->_sleepDataProvider, "lastAlarmWakeUpDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", v4);
  v7 = v5;
  if ((v6 & 1) == 0)
  {
    if (-[FISleepDataProvider isUserAwake](self->_sleepDataProvider, "isUserAwake"))
      v7 = v4;
    else
      v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)handleUpdatedCurrentActivitySummary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  FITypicalDayActivityModel *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke;
  v7[3] = &unk_24CC4EC28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && (objc_msgSend(v2, "_isDataLoading") & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v5 + 16))
    {
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 56));
      v5 = *(_QWORD *)(a1 + 40);
    }
    objc_storeStrong((id *)(v5 + 16), *(id *)(a1 + 32));
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke_2;
    block[3] = &unk_24CC4E880;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v6, block);

  }
  else
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_21168F000, v3, OS_LOG_TYPE_DEFAULT, "Activity Summary (%@) is still loading.", buf, 0xCu);
    }
  }
}

void __65__FITypicalDayActivityModel_handleUpdatedCurrentActivitySummary___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("FITypicalDayActivityModelTodayActivityDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)sleepDataProviderUserDayDidUpdate
{
  void *v3;
  char v4;
  id v5;

  -[FITypicalDayActivityModel _updateSleepUserDay](self, "_updateSleepUserDay");
  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typicalDayActivityModelDidUpdate");

  }
}

- (void)sleepDataProviderLastGoodMorningDismissedDateDidChange
{
  void *v3;
  char v4;
  id v5;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typicalDayActivityModelDidUpdate");

  }
}

- (void)sleepDataProviderLastAlarmWakeUpDateDidChange
{
  void *v3;
  char v4;
  id v5;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[FITypicalDayActivityModel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typicalDayActivityModelDidUpdate");

  }
}

- (id)currentDate
{
  void *v2;
  void *v3;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentCalendar
{
  void *v2;
  void *v3;

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_waitUntilActivitySummaryLoaded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21168F000, v0, v1, "Waiting for initial activity summary to load", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (id)_emptySimpleHistogram
{
  FISimpleHistogram *v2;

  v2 = [FISimpleHistogram alloc];
  return -[FISimpleHistogram initWithNumberOfBuckets:](v2, "initWithNumberOfBuckets:", 0x5A0uLL / *MEMORY[0x24BDD4598]);
}

- (void)_queue_updateHistogram:(id)a3 goalType:(int64_t)a4 activitySummary:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  id v26;
  FITypicalDayActivityModel *v27;
  int64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int64_t v42;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  int64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((unint64_t)a4 <= 4 && ((1 << a4) & 0x19) != 0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v55 = a4;
      _os_log_impl(&dword_21168F000, v10, OS_LOG_TYPE_DEFAULT, "Cannot build histogram for goal type %lu", buf, 0xCu);
    }
    goto LABEL_36;
  }
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD2FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEBUG))
    -[FITypicalDayActivityModel _queue_updateHistogram:goalType:activitySummary:].cold.2(v11, v9, a4);
  if (a4 == 2)
  {
    objc_msgSend(v9, "_dailyBriskMinutesStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    MoveStatisticsForActivitySummary(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UnitForMoveGoal((void *)objc_msgSend(v9, "activityMoveMode"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v47 = (void *)v13;
    goto LABEL_13;
  }
  v47 = 0;
  v12 = 0;
LABEL_13:
  if (objc_msgSend(v12, "count") && v47)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v9, "_startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "bucketCount") >= 1)
    {
      v16 = 0;
      do
      {
        -[FITypicalDayActivityModel _bucketDateForIndex:startOfDay:](self, "_bucketDateForIndex:startOfDay:", v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v17);

        ++v16;
      }
      while (v16 < objc_msgSend(v8, "bucketCount"));
    }
    v42 = a4;
    v44 = v8;
    v48 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v12;
    obj = v12;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v18)
    {
      v19 = v18;
      v46 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v46)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x212BDF9C8]();
          objc_msgSend(v21, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[FITypicalDayActivityModel _bucketIndexForDate:startOfDay:bucketDates:](self, "_bucketIndexForDate:startOfDay:bucketDates:", v23, v15, v14);
          v25 = v15;
          v26 = v14;
          v27 = self;
          v28 = v24;

          objc_msgSend(v21, "quantityValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValueForUnit:", v47);
          v31 = v30;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v28;
          self = v27;
          v14 = v26;
          v15 = v25;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKey:", v32, v34);

          objc_autoreleasePoolPop(v22);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v19);
    }

    v35 = v48;
    objc_msgSend(v48, "objectForKeyedSubscript:", &unk_24CC59398);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      _HKInitializeLogging();
      v37 = (void *)*MEMORY[0x24BDD2FC8];
      v8 = v44;
      v12 = v43;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
        -[FITypicalDayActivityModel _queue_updateHistogram:goalType:activitySummary:].cold.1(v37, v9);
    }
    else
    {
      v8 = v44;
      v12 = v43;
      if (objc_msgSend(v44, "bucketCount") >= 1)
      {
        v38 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v38, v42);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKey:", v39);
          v40 = objc_claimAutoreleasedReturnValue();

          if (v40)
            v41 = (void *)v40;
          else
            v41 = &unk_24CC594A8;
          v35 = v48;
          objc_msgSend(v41, "doubleValue");
          objc_msgSend(v44, "addValue:toBucketAtIndex:", v38);

          ++v38;
        }
        while (v38 < objc_msgSend(v44, "bucketCount"));
      }
    }

  }
LABEL_36:

}

- (void)_queue_updateProjectedOffWristDateHistogram:(id)a3 activitySummary:(id)a4 activeDays:(int64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  void *v27;
  NSObject *log;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  int64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  MoveStatisticsForActivitySummary(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1758];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __100__FITypicalDayActivityModel__queue_updateProjectedOffWristDateHistogram_activitySummary_activeDays___block_invoke;
  v29[3] = &unk_24CC4F268;
  v12 = v9;
  v30 = v12;
  objc_msgSend(v11, "predicateWithBlock:", v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v12, "_startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "bucketCount") >= 1)
    {
      v17 = 0;
      do
      {
        -[FITypicalDayActivityModel _bucketDateForIndex:startOfDay:](self, "_bucketDateForIndex:startOfDay:", v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v18);

        ++v17;
      }
      while (v17 < objc_msgSend(v8, "bucketCount"));
    }
    objc_msgSend(v14, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[FITypicalDayActivityModel _bucketIndexForDate:startOfDay:bucketDates:](self, "_bucketIndexForDate:startOfDay:bucketDates:", v20, v16, v15);

    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
        -[FITypicalDayActivityModel _queue_updateProjectedOffWristDateHistogram:activitySummary:activeDays:].cold.1(v22, v12, v19);
    }
    else
    {
      ++*a5;
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        log = v23;
        objc_msgSend(v12, "_startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v32 = v21;
        v33 = 2114;
        v34 = v27;
        v35 = 2114;
        v36 = v24;
        _os_log_impl(&dword_21168F000, log, OS_LOG_TYPE_DEFAULT, "Last active index: %ld, for start date: %{public}@, object date: %{public}@", buf, 0x20u);

      }
      if ((v21 & 0x8000000000000000) == 0)
      {
        v25 = 0;
        v26 = v21 + 1;
        do
          objc_msgSend(v8, "addValue:toBucketAtIndex:", v25++, 1.0);
        while (v26 != v25);
      }
    }

  }
}

BOOL __100__FITypicalDayActivityModel__queue_updateProjectedOffWristDateHistogram_activitySummary_activeDays___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a2, "quantityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UnitForMoveGoal((void *)objc_msgSend(*(id *)(a1 + 32), "activityMoveMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  return v6 >= 1.0;
}

- (id)_queue_calculateProjectedOffWristDateFromHistogram:(id)a3 activeDays:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[6];
  uint8_t buf[16];

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((unint64_t)a4 < 7)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD2FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21168F000, v11, OS_LOG_TYPE_DEFAULT, "Not enough activity data to predict off wrist time", buf, 2u);
    }
  }
  else
  {
    v7 = objc_msgSend(v6, "bucketCount");
    while (v7-- >= 1)
    {
      if ((double)a4 * 0.5 <= (double)objc_msgSend(v6, "numberOfValuesInBucketAtIndex:", v7))
      {
        -[FITypicalDayActivityModel startOfToday](self, "startOfToday");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[FITypicalDayActivityModel _bucketDateForIndex:startOfDay:](self, "_bucketDateForIndex:startOfDay:", v7 + 1, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
  }
  v10 = 0;
LABEL_9:
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __91__FITypicalDayActivityModel__queue_calculateProjectedOffWristDateFromHistogram_activeDays___block_invoke;
  v13[3] = &unk_24CC4E858;
  v13[4] = self;
  v13[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  return v10;
}

uint64_t __91__FITypicalDayActivityModel__queue_calculateProjectedOffWristDateFromHistogram_activeDays___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 80) = *(_QWORD *)(result + 40);
  return result;
}

- (int64_t)totalActiveDays
{
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    return self->_totalActiveDays;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__FITypicalDayActivityModel_totalActiveDays__block_invoke;
  v5[3] = &unk_24CC4F1A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(MEMORY[0x24BDAC9B8], v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__FITypicalDayActivityModel_totalActiveDays__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)_queue_populateHistogramsAndOffWristDateForToday
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21168F000, a2, OS_LOG_TYPE_ERROR, "Error enumerating activity summaries %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __77__FITypicalDayActivityModel__queue_populateHistogramsAndOffWristDateForToday__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "activityMoveMode") == *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistogram:goalType:activitySummary:", *(_QWORD *)(a1 + 40), 1, v3);
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistogram:goalType:activitySummary:", *(_QWORD *)(a1 + 48), 2, v3);
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateProjectedOffWristDateHistogram:activitySummary:activeDays:", *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }

}

- (BOOL)_queue_enumerateActivitySummariesOrderedByCacheIndexWithCalendar:(id)a3 error:(id *)a4 handler:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  queue = self->_queue;
  v9 = a5;
  v10 = a3;
  dispatch_assert_queue_V2(queue);
  v11 = *MEMORY[0x24BDD44A8];
  -[NSDateInterval startDate](self->_interval, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateInterval endDate](self->_interval, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[FITypicalDayActivityModel delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v16, "enumerateActivitySummariesFromDateComponents:toDateComponents:error:handler:", v13, v15, a4, v9);

  return (char)a4;
}

- (id)_bucketDateForIndex:(unint64_t)a3 startOfDay:(id)a4
{
  return (id)objc_msgSend(a4, "dateByAddingTimeInterval:", (double)(60 * a3 * *MEMORY[0x24BDD4598]));
}

- (int64_t)_bucketIndexForDate:(id)a3 startOfDay:(id)a4 bucketDates:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    *(_QWORD *)&v11 = 138544130;
    v21 = v11;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 + 1;
      if (v12 >= objc_msgSend(v10, "count") - 1)
        -[FITypicalDayActivityModel _bucketDateForIndex:startOfDay:](self, "_bucketDateForIndex:startOfDay:", v12 + 1, v9);
      else
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12 + 1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v13 && v15)
      {
        if (objc_msgSend(v13, "compare:", v15) == 1)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x24BDD2FC8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v23 = v13;
            v24 = 2114;
            v25 = v16;
            v26 = 2114;
            v27 = v10;
            v28 = 2048;
            v29 = v12;
            _os_log_impl(&dword_21168F000, v17, OS_LOG_TYPE_DEFAULT, "TypicalDayModel: binDate later than nextDate! %{public}@, %{public}@, %{public}@, %ld", buf, 0x2Au);
          }
        }
        else
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, v16);
          v19 = objc_msgSend(v18, "containsDate:", v8);

          if ((v19 & 1) != 0)
          {

            goto LABEL_14;
          }
        }
      }

      ++v12;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v12;
}

- (void)_setSleepUserDay:(id)a3
{
  FISleepUserDay *v4;
  FISleepUserDay *sleepUserDay;

  v4 = (FISleepUserDay *)a3;
  os_unfair_lock_lock(&self->_sleepUserDayLock);
  sleepUserDay = self->_sleepUserDay;
  self->_sleepUserDay = v4;

  os_unfair_lock_unlock(&self->_sleepUserDayLock);
}

- (void)_setProjectedOffWristDateToday:(id)a3
{
  objc_storeStrong((id *)&self->_projectedOffWristDateToday, a3);
}

- (id)_sleepDataProvider
{
  return self->_sleepDataProvider;
}

- (FITypicalDayActivityModelDelegate)delegate
{
  return (FITypicalDayActivityModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sleepUserDay, 0);
  objc_storeStrong((id *)&self->_sleepDataProvider, 0);
  objc_storeStrong((id *)&self->_projectedOffWristDateToday, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activitySummaryBarrierGroup, 0);
  objc_storeStrong((id *)&self->_queue_bucketDates, 0);
  objc_storeStrong((id *)&self->_queue_exerciseHistogram, 0);
  objc_storeStrong((id *)&self->_queue_moveHistogram, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

- (void)willCompletingMoveRingEarnStreakAchievement
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21168F000, v0, v1, "TypicalDayActivityModel cannot answer achievements question because delegate does not implement necessary achievements methods: 'bestMoveStreak' & 'currentMoveStreak'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)projectedToBeatMoveRecordByEndOfDay
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21168F000, v0, v1, "TypicalDayActivityModel cannot answer achievements question because delegate does not implement necessary achievements methods: 'totalMoveGoalsAttempted' & 'bestMoveValue'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21168F000, a1, a3, "Walk is under 20 minutes, returning rounded to nearest 1 minute: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21168F000, a1, a3, "Walk is over 20 minutes, returning rounded to nearest 5 minutes: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_briskWalkTimeToCompleteMoveGoalWithDateOfBirth:(uint64_t)a3 biologicalSex:(uint64_t)a4 height:(uint64_t)a5 weight:(uint64_t)a6 wheelchairUse:(uint64_t)a7 experienceType:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21168F000, a1, a3, "Computed time to walk: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_queue_updateHistogram:(void *)a1 goalType:(void *)a2 activitySummary:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "_startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_21168F000, v5, v6, "Skipping summary with start date %{public}@ for ring type %lu because it has more data then we have buckets (over 24 hour day)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_3();
}

- (void)_queue_updateHistogram:(void *)a1 goalType:(void *)a2 activitySummary:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v5 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "_startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a3;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEBUG, "Building typical-day histogram (goaltype=%lu) with activity summary for date: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_0_3();
}

- (void)_queue_updateProjectedOffWristDateHistogram:(void *)a1 activitySummary:(void *)a2 activeDays:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "_startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_21168F000, v7, v8, "Last active index is NOT FOUND, for start date: %{public}@, object date: %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0_3();
}

@end
