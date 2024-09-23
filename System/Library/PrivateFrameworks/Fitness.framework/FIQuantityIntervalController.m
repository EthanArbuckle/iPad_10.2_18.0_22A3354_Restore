@implementation FIQuantityIntervalController

- (FIQuantityIntervalController)initWithIntervalQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5 trackedQuantityTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FIQuantityIntervalController *v14;
  FIIntervalQuantityTrigger *v15;
  FIIntervalQuantityTrigger *quantityTrigger;
  uint64_t v17;
  FIMutableTimeSliceGroup *sliceGroup;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FIQuantityIntervalController;
  v14 = -[FIQuantityIntervalController init](&v20, sel_init);
  if (v14)
  {
    v15 = -[FIIntervalQuantityTrigger initWithQuantityType:startDate:threshold:]([FIIntervalQuantityTrigger alloc], "initWithQuantityType:startDate:threshold:", v10, v12, v11);
    quantityTrigger = v14->_quantityTrigger;
    v14->_quantityTrigger = v15;

    +[FIMutableTimeSliceGroup timeSliceGroupForQuantityTypes:startDate:](FIMutableTimeSliceGroup, "timeSliceGroupForQuantityTypes:startDate:", v13, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    sliceGroup = v14->_sliceGroup;
    v14->_sliceGroup = (FIMutableTimeSliceGroup *)v17;

  }
  return 0;
}

- (void)addSample:(id)a3
{
  _BOOL4 v4;
  FIMutableTimeSliceGroup *sliceGroup;
  void *v6;
  id v7;

  v7 = a3;
  -[FIMutableTimeSliceGroup updateSlicesWithSample:](self->_sliceGroup, "updateSlicesWithSample:", v7);
  if (-[FIQuantityIntervalController _updateTriggerWithSample:](self, "_updateTriggerWithSample:", v7))
  {
    v4 = -[FIIntervalQuantityTrigger triggered](self->_quantityTrigger, "triggered");
    sliceGroup = self->_sliceGroup;
    if (v4)
    {
      -[FIIntervalQuantityTrigger triggeredDate](self->_quantityTrigger, "triggeredDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIMutableTimeSliceGroup updateSlicesWithEndDate:](sliceGroup, "updateSlicesWithEndDate:", v6);
    }
    else
    {
      objc_msgSend(v7, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIMutableTimeSliceGroup commitAllSlicesToDate:](sliceGroup, "commitAllSlicesToDate:", v6);
    }

  }
}

- (BOOL)_updateTriggerWithSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  FIIntervalQuantityTrigger *quantityTrigger;
  FIIntervalQuantityTrigger *v9;
  id v10;
  FIIntervalQuantityTrigger *v11;
  NSObject *v12;
  BOOL v13;
  FIIntervalQuantityTrigger *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  FIIntervalQuantityTrigger *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIIntervalQuantityTrigger quantityType](self->_quantityTrigger, "quantityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    quantityTrigger = self->_quantityTrigger;
    v16 = 0;
    -[FIIntervalQuantityTrigger addingSample:error:](quantityTrigger, "addingSample:error:", v4, &v16);
    v9 = (FIIntervalQuantityTrigger *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v11 = self->_quantityTrigger;
    self->_quantityTrigger = v9;

    if (!v10)
    {
      v13 = 1;
      goto LABEL_7;
    }
    _HKInitializeLogging();
    v12 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
    {
      v15 = self->_quantityTrigger;
      *(_DWORD *)buf = 138412802;
      v18 = v4;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v10;
      _os_log_error_impl(&dword_21168F000, v12, OS_LOG_TYPE_ERROR, "Adding sample %@ to quantity trigger %@ caused error: %@", buf, 0x20u);
    }

  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (BOOL)intervalComplete
{
  return -[FIIntervalQuantityTrigger triggered](self->_quantityTrigger, "triggered");
}

- (BOOL)isIntervalEndDate
{
  void *v2;
  BOOL v3;

  -[FIIntervalQuantityTrigger triggeredDate](self->_quantityTrigger, "triggeredDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allSlicesFinalized
{
  return -[FIMutableTimeSliceGroup allSlicesFinalized](self->_sliceGroup, "allSlicesFinalized");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceGroup, 0);
  objc_storeStrong((id *)&self->_quantityTrigger, 0);
}

@end
