@implementation FIIntervalQuantityTrigger

- (FIIntervalQuantityTrigger)initWithQuantityType:(id)a3 startDate:(id)a4 threshold:(id)a5
{
  id v8;
  id v9;
  id v10;
  FIQuantityTimeSlice *v11;
  FIIntervalQuantityTrigger *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FIQuantityTimeSlice initWithQuantityType:startDate:]([FIQuantityTimeSlice alloc], "initWithQuantityType:startDate:", v10, v9);

  v12 = -[FIIntervalQuantityTrigger initWithQuantityTimeslice:threshold:triggeredDate:](self, "initWithQuantityTimeslice:threshold:triggeredDate:", v11, v8, 0);
  return v12;
}

- (FIIntervalQuantityTrigger)initWithQuantityTimeslice:(id)a3 threshold:(id)a4 triggeredDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  FIIntervalQuantityTrigger *v12;
  FIIntervalQuantityTrigger *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FIIntervalQuantityTrigger;
  v12 = -[FIIntervalQuantityTrigger init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_threshold, a4);
    objc_storeStrong((id *)&v13->_slice, a3);
    objc_storeStrong((id *)&v13->_triggeredDate, a5);
  }

  return v13;
}

- (id)addingSample:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[FIQuantityTimeSlice addingSample:error:](self->_slice, "addingSample:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "committingUntilDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "committedTotal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "hk_isLessThanQuantity:", self->_threshold);

  if ((_DWORD)v8)
  {
    -[FIIntervalQuantityTrigger settingTimeSlice:](self, "settingTimeSlice:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FIQuantityTimeSlice committedTotal](self->_slice, "committedTotal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIIntervalQuantityTrigger _finalizedTriggerByAddingSample:toSlice:withPreviousTotal:threshold:](self, "_finalizedTriggerByAddingSample:toSlice:withPreviousTotal:threshold:", v6, v9, v12, self->_threshold);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_finalizedTriggerByAddingSample:(id)a3 toSlice:(id)a4 withPreviousTotal:(id)a5 threshold:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  FIIntervalQuantityTrigger *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "quantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_quantityByAddingQuantity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  FIThresholdDateInsideSample(v12, v14, v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[FIIntervalQuantityTrigger initWithQuantityTimeslice:threshold:triggeredDate:]([FIIntervalQuantityTrigger alloc], "initWithQuantityTimeslice:threshold:triggeredDate:", v11, v9, v15);
  return v16;
}

- (id)settingTimeSlice:(id)a3
{
  id v4;
  FIIntervalQuantityTrigger *v5;

  v4 = a3;
  v5 = -[FIIntervalQuantityTrigger initWithQuantityTimeslice:threshold:triggeredDate:]([FIIntervalQuantityTrigger alloc], "initWithQuantityTimeslice:threshold:triggeredDate:", v4, self->_threshold, self->_triggeredDate);

  return v5;
}

- (BOOL)triggered
{
  void *v2;
  BOOL v3;

  -[FIIntervalQuantityTrigger triggeredDate](self, "triggeredDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HKQuantityType)quantityType
{
  return -[FIQuantityTimeSlice quantityType](self->_slice, "quantityType");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[FIIntervalQuantityTrigger triggered](self, "triggered"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[FIIntervalQuantityTrigger triggeredDate](self, "triggeredDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, triggered:%@, triggeredDate:%@, _threshold:%@, _slice:%@"), v4, self, v5, v6, self->_threshold, self->_slice);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)triggeredDate
{
  return self->_triggeredDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeredDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_slice, 0);
}

@end
