@implementation FITrailingIntervalController

- (FITrailingIntervalController)initWithQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  FITrailingIntervalController *v12;
  FITrailingIntervalController *v13;
  FITrailingQuantityTimeSlice *v14;
  uint64_t v15;
  NSArray *slices;
  NSArray *uncommittedSamples;
  NSArray *v18;
  NSArray *pauseResumeEvents;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FITrailingIntervalController;
  v12 = -[FITrailingIntervalController init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quantityType, a3);
    objc_storeStrong((id *)&v13->_threshold, a4);
    v14 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:]([FITrailingQuantityTimeSlice alloc], "initWithQuantityType:startDate:", v9, v11);
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    slices = v13->_slices;
    v13->_slices = (NSArray *)v15;

    uncommittedSamples = v13->_uncommittedSamples;
    v18 = (NSArray *)MEMORY[0x24BDBD1A8];
    v13->_uncommittedSamples = (NSArray *)MEMORY[0x24BDBD1A8];

    pauseResumeEvents = v13->_pauseResumeEvents;
    v13->_pauseResumeEvents = v18;

  }
  return v13;
}

- (void)addSample:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FITrailingIntervalController addSamples:](self, "addSamples:", v6, v7, v8);
}

- (void)addSamples:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSArray *v15;
  NSArray *uncommittedSamples;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  FIFilterSamplesByType(a3, self->_quantityType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray lastObject](self->_slices, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "hk_isBeforeDate:", v13);

        if (v14)
        {
          objc_msgSend(v17, "addObject:", v10);
        }
        else
        {
          -[NSArray arrayByAddingObject:](self->_uncommittedSamples, "arrayByAddingObject:", v10);
          v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
          uncommittedSamples = self->_uncommittedSamples;
          self->_uncommittedSamples = v15;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v17, "count"))
  {
    -[FITrailingIntervalController _updateSlicesWithSamples:](self, "_updateSlicesWithSamples:", v17);
    -[FITrailingIntervalController _determineAndProcessThresholdReached](self, "_determineAndProcessThresholdReached");
  }

}

- (void)_determineAndProcessThresholdReached
{
  void *v3;
  void *v4;
  NSArray *slices;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  id v22;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v3 = (void *)MEMORY[0x24BDD3E50];
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 0.0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_slices, "count"));
  slices = self->_slices;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__FITrailingIntervalController__determineAndProcessThresholdReached__block_invoke;
  v10[3] = &unk_24CC4E8D0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = v21;
  v10[7] = &v11;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](slices, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  objc_msgSend((id)v12[5], "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSArray *)objc_msgSend(v7, "copy");
  v9 = self->_slices;
  self->_slices = v8;

  self->_thresholdReached = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

}

void __68__FITrailingIntervalController__determineAndProcessThresholdReached__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;

  v6 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v30 = v6;
    objc_msgSend(v6, "committedTotal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_quantityByAddingQuantity:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "compare:", *(_QWORD *)(a1[4] + 40)))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "hk_isGreaterThanQuantity:", *(_QWORD *)(a1[4] + 40)))
      {
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        objc_msgSend(*(id *)(a1[4] + 16), "canonicalUnit");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValueForUnit:", v13);
        v15 = v14;
        v16 = a1[4];
        v17 = *(void **)(v16 + 40);
        objc_msgSend(*(id *)(v16 + 16), "canonicalUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValueForUnit:", v18);
        v20 = v15 - v19;

        objc_msgSend(v30, "committedTotal");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1[4] + 16), "canonicalUnit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValueForUnit:", v22);
        v24 = v23 - v20;

        v25 = (void *)MEMORY[0x24BDD3E50];
        objc_msgSend(*(id *)(a1[4] + 16), "canonicalUnit");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "settingTotalQuantityLimit:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v29 = (id)v28;
LABEL_8:
        v31 = v29;
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v29);
        v6 = v31;
        goto LABEL_9;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
    v29 = v30;
    goto LABEL_8;
  }
  *a4 = 1;
LABEL_9:

}

- (void)_updateSlicesWithSamples:(id)a3
{
  id v4;
  NSArray *slices;
  id v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  slices = self->_slices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__FITrailingIntervalController__updateSlicesWithSamples___block_invoke;
  v9[3] = &unk_24CC4E8F8;
  v10 = v4;
  v6 = v4;
  -[NSArray fi_mapUsingBlock:](slices, "fi_mapUsingBlock:", v9);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_slices;
  self->_slices = v7;

}

id __57__FITrailingIntervalController__updateSlicesWithSamples___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  objc_msgSend(a2, "addingSamples:error:", v2, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_processUncommittedSamples
{
  NSArray *uncommittedSamples;

  if (-[NSArray count](self->_uncommittedSamples, "count"))
  {
    -[FITrailingIntervalController _updateSlicesWithSamples:](self, "_updateSlicesWithSamples:", self->_uncommittedSamples);
    uncommittedSamples = self->_uncommittedSamples;
    self->_uncommittedSamples = (NSArray *)MEMORY[0x24BDBD1A8];

  }
}

- (BOOL)addEvent:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;

  v6 = a3;
  -[NSArray lastObject](self->_pauseResumeEvents, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (objc_msgSend(v8, "type") != 1 && objc_msgSend(v8, "type") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Event must be pause or resume event.  Event type: %ld"), objc_msgSend(v8, "type"), v25);
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend(v8, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "hk_isBeforeDate:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "dateInterval");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateInterval");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("New event date must be after previous date. Previous event date: %@. New event date: %@."), v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      FIIntervalErrorWithDescription(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      FISetOutErrorIfNotNull(a4, v21);

      v22 = 0;
      goto LABEL_20;
    }
    if (objc_msgSend(v9, "type") == 1 && objc_msgSend(v8, "type") != 2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("New event type must be resume. Previous event type: %ld. New event type: %ld."), objc_msgSend(v9, "type"), objc_msgSend(v8, "type"));
    }
    else
    {
      if (objc_msgSend(v9, "type") != 2 || objc_msgSend(v8, "type") == 1)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current event type must be pause. Previous event type: %ld. New event type: %ld."), objc_msgSend(v9, "type"), objc_msgSend(v8, "type"));
    }
LABEL_9:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "type") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("First event must be pause event.  Event type: %ld"), objc_msgSend(v8, "type"), v25);
    goto LABEL_9;
  }
LABEL_15:

  v23 = objc_msgSend(v8, "type");
  if (v23 == 2)
  {
    -[FITrailingIntervalController _addResumeEvent:](self, "_addResumeEvent:", v8);
  }
  else if (v23 == 1)
  {
    -[FITrailingIntervalController _addPauseEvent:](self, "_addPauseEvent:", v8);
  }
  v22 = 1;
LABEL_20:

  return v22;
}

- (void)_addPauseEvent:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *slices;
  NSArray *v11;
  NSArray *v12;
  NSArray *pauseResumeEvents;
  id v14;

  v14 = a3;
  if (-[NSArray count](self->_slices, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_slices);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSArray count](v4, "count") - 1;
    -[NSArray lastObject](v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settingEndDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray replaceObjectAtIndex:withObject:](v4, "replaceObjectAtIndex:withObject:", v5, v9);

    slices = self->_slices;
    self->_slices = v4;
    v11 = v4;

    -[NSArray arrayByAddingObject:](self->_pauseResumeEvents, "arrayByAddingObject:", v14);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    pauseResumeEvents = self->_pauseResumeEvents;
    self->_pauseResumeEvents = v12;

  }
}

- (void)_addResumeEvent:(id)a3
{
  id v4;
  FITrailingQuantityTimeSlice *v5;
  HKQuantityType *quantityType;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *slices;
  NSArray *v11;
  NSArray *pauseResumeEvents;
  FITrailingQuantityTimeSlice *v13;

  v4 = a3;
  v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:](v5, "initWithQuantityType:startDate:", quantityType, v8);

  -[NSArray arrayByAddingObject:](self->_slices, "arrayByAddingObject:", v13);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  slices = self->_slices;
  self->_slices = v9;

  -[FITrailingIntervalController _processUncommittedSamples](self, "_processUncommittedSamples");
  -[NSArray arrayByAddingObject:](self->_pauseResumeEvents, "arrayByAddingObject:", v4);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  pauseResumeEvents = self->_pauseResumeEvents;
  self->_pauseResumeEvents = v11;

}

- (void)setThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_threshold, a3);
  -[FITrailingIntervalController _determineAndProcessThresholdReached](self, "_determineAndProcessThresholdReached");
}

- (double)committedDuration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_slices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "committedDuration", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)activeDurationUntilDate:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_slices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "activeDurationUntilDate:", v4, (_QWORD)v13);
        v9 = v9 + v11;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)idleDurationUntilDate:(id)a3
{
  id v4;
  NSArray *slices;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  slices = self->_slices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__FITrailingIntervalController_idleDurationUntilDate___block_invoke;
  v9[3] = &unk_24CC4E920;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](slices, "enumerateObjectsWithOptions:usingBlock:", 2, v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__FITrailingIntervalController_idleDurationUntilDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "committedTotal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "committedTotal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v8);
  v10 = v9;

  objc_msgSend(v26, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hk_isAfterDate:", *(_QWORD *)(a1 + 32));

  if (v10 <= 2.22044605e-16)
  {
    if (v12)
    {
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v26, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v20
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);

    }
    else
    {
      objc_msgSend(v26, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v25
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);

    }
  }
  else
  {
    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v26, "committedSamples");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v16);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
    }
    else
    {
      objc_msgSend(v26, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "committedSamples");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v21);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v22
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);

    }
    *a4 = 1;
  }

}

- (HKQuantity)quantity
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD3E50];
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_slices;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "committedTotal", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_quantityByAddingQuantity:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (HKQuantity *)v5;
}

- (HKQuantity)threshold
{
  return self->_threshold;
}

- (BOOL)thresholdReached
{
  return self->_thresholdReached;
}

- (NSArray)pauseResumeEvents
{
  return self->_pauseResumeEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeEvents, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_uncommittedSamples, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_slices, 0);
}

@end
