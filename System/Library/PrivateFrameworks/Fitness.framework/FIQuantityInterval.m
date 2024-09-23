@implementation FIQuantityInterval

- (FIQuantityInterval)initWithIntervalDefinition:(id)a3 activityType:(unint64_t)a4 startDate:(id)a5
{
  id v9;
  id v10;
  FIQuantityInterval *v11;
  FIQuantityInterval *v12;
  _QWORD *v13;
  uint64_t v14;
  HKQuantityType *trackedQuantityType;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FIQuantityInterval;
  v11 = -[FIQuantityInterval init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_definition, a3);
    objc_storeStrong((id *)&v12->_startDate, a5);
    if (a4 == 13)
      v13 = (_QWORD *)MEMORY[0x24BDD3530];
    else
      v13 = (_QWORD *)MEMORY[0x24BDD3560];
    if (a4 == 46)
      v13 = (_QWORD *)MEMORY[0x24BDD3558];
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *v13);
    v14 = objc_claimAutoreleasedReturnValue();
    trackedQuantityType = v12->_trackedQuantityType;
    v12->_trackedQuantityType = (HKQuantityType *)v14;

  }
  return v12;
}

- (FIIntervalDefinition)definition
{
  return self->_definition;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKQuantityType)trackedQuantityType
{
  return self->_trackedQuantityType;
}

- (HKQuantity)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_trackedQuantityType, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
