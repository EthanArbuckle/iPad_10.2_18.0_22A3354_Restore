@implementation FITrailingQuantityTimeSlice

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  FITrailingQuantityTimeSlice *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:endDate:](self, "initWithQuantityType:startDate:endDate:", v8, v7, v9);

  return v10;
}

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  FITrailingQuantityTimeSlice *v14;
  uint64_t v16;

  v8 = (void *)MEMORY[0x24BDD3E50];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  v14 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:](self, "initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:", v11, v10, v9, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v10, v13, v16);

  return v14;
}

- (FITrailingQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 committedSamples:(id)a6 uncommittedSamples:(id)a7 lastCommitDate:(id)a8 committedTotal:(id)a9 finalized:(BOOL)a10
{
  id v17;
  id v18;
  FITrailingQuantityTimeSlice *v19;
  FITrailingQuantityTimeSlice *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)FITrailingQuantityTimeSlice;
  v19 = -[FITrailingQuantityTimeSlice init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityType, a3);
    objc_storeStrong((id *)&v20->_startDate, a4);
    objc_storeStrong((id *)&v20->_endDate, a5);
    objc_storeStrong((id *)&v20->_committedSamples, a6);
    objc_storeStrong((id *)&v20->_uncommittedSamples, a7);
    objc_storeStrong((id *)&v20->_lastCommitDate, a8);
    objc_storeStrong((id *)&v20->_committedTotal, a9);
    v20->_finalized = a10;
  }

  return v20;
}

- (HKQuantity)committedAndAddedTotal
{
  HKQuantity *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HKQuantity *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = self->_committedTotal;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_uncommittedSamples;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v11 = objc_alloc(MEMORY[0x24BDD1508]);
        v12 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", self->_startDate, self->_endDate, (_QWORD)v15);
        FISampleQuantityInsideDateInterval(v10, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[HKQuantity _quantityByAddingQuantity:](v9, "_quantityByAddingQuantity:", v13);
        v3 = (HKQuantity *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (double)committedDuration
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_lastCommitDate, "timeIntervalSinceDate:", self->_startDate);
  return result;
}

- (double)activeDurationUntilDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  v4 = a3;
  -[FITrailingQuantityTimeSlice endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_isAfterDate:", v4);

  if (v6)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_startDate);
    v8 = v7;
  }
  else
  {
    -[FITrailingQuantityTimeSlice endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", self->_startDate);
    v8 = v10;

  }
  return v8;
}

- (id)addingSample:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FITrailingQuantityTimeSlice *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((_ValidateSample(v6, self->_startDate, self->_endDate, a4) & 1) != 0)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FITrailingQuantityTimeSlice autoCommitDateForSamples:](self, "autoCommitDateForSamples:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray arrayByAddingObject:](self->_uncommittedSamples, "arrayByAddingObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FITrailingQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:", v9, self->_committedTotal, self->_committedSamples, v8, self->_startDate, self->_endDate);
    v10 = (FITrailingQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)addingSamples:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  FITrailingQuantityTimeSlice *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__FITrailingQuantityTimeSlice_addingSamples_error___block_invoke;
  v10[3] = &unk_24CC4E4D0;
  v10[4] = self;
  v10[5] = v17;
  v10[6] = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (objc_msgSend((id)v12[5], "count"))
  {
    -[FITrailingQuantityTimeSlice autoCommitDateForSamples:](self, "autoCommitDateForSamples:", v12[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByAddingObjectsFromArray:](self->_uncommittedSamples, "arrayByAddingObjectsFromArray:", v12[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FITrailingQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:", v7, self->_committedTotal, self->_committedSamples, v6, self->_startDate, self->_endDate);
    v8 = (FITrailingQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

void __51__FITrailingQuantityTimeSlice_addingSamples_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id obj;

  v3 = a2;
  v4 = a1[4];
  v5 = *(void **)(v4 + 48);
  v6 = *(void **)(v4 + 56);
  v7 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v7 + 40);
  v8 = _ValidateSample(v3, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v3);

}

- (id)autoCommitDateForSamples:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSDate *v10;

  FISortSamplesByDate(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isAfterDate:", self->_lastCommitDate);

  if (v7)
  {
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "earlierDate:", self->_endDate);
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = self->_lastCommitDate;
  }

  return v10;
}

- (id)committingUntilDate:(id)a3
{
  return -[FITrailingQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:toPreviousCommittedSamples:untilDate:startDate:endDate:", self->_uncommittedSamples, self->_committedTotal, self->_committedSamples, a3, self->_startDate, self->_endDate);
}

- (id)settingEndDate:(id)a3
{
  id v4;
  FITrailingQuantityTimeSlice *v5;
  HKQuantityType *quantityType;
  NSDate *startDate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FITrailingQuantityTimeSlice *v13;
  void *v14;
  uint64_t v16;

  v4 = a3;
  v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  startDate = self->_startDate;
  -[NSArray arrayByAddingObjectsFromArray:](self->_committedSamples, "arrayByAddingObjectsFromArray:", self->_uncommittedSamples);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD3E50];
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = self->_finalized;
  v13 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:](v5, "initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:", quantityType, startDate, v4, MEMORY[0x24BDBD1A8], v8, v9, v12, v16);

  -[FITrailingQuantityTimeSlice committingUntilDate:](v13, "committingUntilDate:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)settingStartDate:(id)a3
{
  id v4;
  FITrailingQuantityTimeSlice *v5;
  HKQuantityType *quantityType;
  NSDate *endDate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FITrailingQuantityTimeSlice *v13;
  void *v14;
  uint64_t v16;

  v4 = a3;
  v5 = [FITrailingQuantityTimeSlice alloc];
  quantityType = self->_quantityType;
  endDate = self->_endDate;
  -[NSArray arrayByAddingObjectsFromArray:](self->_committedSamples, "arrayByAddingObjectsFromArray:", self->_uncommittedSamples);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD3E50];
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = self->_finalized;
  v13 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:](v5, "initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:", quantityType, v4, endDate, MEMORY[0x24BDBD1A8], v8, v9, v12, v16);

  -[FITrailingQuantityTimeSlice committingUntilDate:](v13, "committingUntilDate:", self->_lastCommitDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)settingTotalQuantityLimit:(id)a3
{
  id v4;
  FITrailingQuantityTimeSlice *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *committedSamples;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v14;
  FITrailingQuantityTimeSlice *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  if (objc_msgSend(v4, "hk_isGreaterThanQuantity:", self->_committedTotal))
  {
    v5 = self;
  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy_;
    v25[4] = __Block_byref_object_dispose_;
    v6 = (void *)MEMORY[0x24BDD3E50];
    -[FITrailingQuantityTimeSlice quantityType](self, "quantityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canonicalUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quantityWithUnit:doubleValue:", v8, 0.0);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    committedSamples = self->_committedSamples;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __57__FITrailingQuantityTimeSlice_settingTotalQuantityLimit___block_invoke;
    v14 = &unk_24CC4E4F8;
    v15 = self;
    v17 = v25;
    v16 = v4;
    v18 = &v19;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](committedSamples, "enumerateObjectsWithOptions:usingBlock:", 2, &v11);
    -[FITrailingQuantityTimeSlice settingStartDate:](self, "settingStartDate:", v20[5], v11, v12, v13, v14, v15);
    v5 = (FITrailingQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(v25, 8);

  }
  return v5;
}

void __57__FITrailingQuantityTimeSlice_settingTotalQuantityLimit___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", *(_QWORD *)(a1[4] + 48), *(_QWORD *)(a1[4] + 56));
  FISampleQuantityInsideDateInterval(v17, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_quantityByAddingQuantity:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "hk_isGreaterThanQuantity:", a1[5]);
  v12 = (void *)a1[5];
  v13 = *(_QWORD *)(a1[6] + 8);
  if (v11)
  {
    FIThresholdDateInsideSample(v17, *(void **)(v13 + 40), v12, 1);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = *(_QWORD *)(a1[7] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
    goto LABEL_6;
  }
  if (!objc_msgSend(*(id *)(v13 + 40), "compare:", v12))
  {
    objc_msgSend(v17, "startDate");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)committedSamples
{
  return self->_committedSamples;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (HKQuantity)committedTotal
{
  return self->_committedTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedTotal, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_lastCommitDate, 0);
  objc_storeStrong((id *)&self->_committedSamples, 0);
  objc_storeStrong((id *)&self->_uncommittedSamples, 0);
}

- (id)_totalByCommittingSample:(id)a3 toPreviousTotal:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v9 = (objc_class *)MEMORY[0x24BDD1508];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v9 alloc], "initWithStartDate:endDate:", v11, v10);

  v18 = 0;
  FISampleQuantityInsideDateInterval(v13, v14, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_quantityByAddingQuantity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 toPreviousCommittedSamples:(id)a5 untilDate:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  FITrailingQuantityTimeSlice *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  FITrailingQuantityTimeSlice *v29;
  void *v30;
  FITrailingQuantityTimeSlice *v31;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  FITrailingQuantityTimeSlice *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;

  v35 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  v64 = __Block_byref_object_dispose_;
  v34 = v14;
  v65 = v34;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v19 = self;
  v20 = v15;
  v51 = v20;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __147__FITrailingQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_toPreviousCommittedSamples_untilDate_startDate_endDate___block_invoke;
  v36[3] = &unk_24CC4E520;
  v41 = &v46;
  v42 = &v52;
  v21 = v16;
  v37 = v21;
  v22 = v17;
  v38 = v22;
  v23 = v18;
  v39 = v23;
  v40 = self;
  v43 = &v60;
  v44 = &v66;
  v45 = &v56;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v36);
  v24 = v67[3];
  v25 = objc_msgSend(v35, "count");
  objc_msgSend(v35, "subarrayWithRange:", v24, v25 - v67[3]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v53 + 24))
  {
    FISortSamplesByDate((void *)v47[5]);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v47[5];
    v47[5] = v27;

  }
  v29 = [FITrailingQuantityTimeSlice alloc];
  -[FITrailingQuantityTimeSlice quantityType](v19, "quantityType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = *((_BYTE *)v57 + 24);
  v31 = -[FITrailingQuantityTimeSlice initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:](v29, "initWithQuantityType:startDate:endDate:committedSamples:uncommittedSamples:lastCommitDate:committedTotal:finalized:", v30, v22, v23, v47[5], v26, v21, v61[5], v33);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v31;
}

void __147__FITrailingQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_toPreviousCommittedSamples_untilDate_startDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v6 = a2;
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "hk_isBeforeDate:", v9);

  if (v10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v28 = v6;
  v14 = v11;
  v15 = v13;
  if ((objc_msgSend(v28, "fi_isBeforeDate:", v12) & 1) == 0 && (objc_msgSend(v28, "fi_isAfterDate:", v15) & 1) == 0)
  {
    if ((objc_msgSend(v28, "fi_isAfterDate:", v14) & 1) == 0)
    {
      if ((objc_msgSend(v28, "fi_spansDate:useStrictDateLimits:", v15, 0) & 1) != 0)
      {

        objc_msgSend(*(id *)(a1 + 56), "_totalByCommittingSample:toPreviousTotal:startDate:endDate:", v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "arrayByAddingObject:", v28);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
        goto LABEL_6;
      }
      if ((objc_msgSend(v28, "fi_spansDate:useStrictDateLimits:", v14, 1) & 1) == 0)
      {

        objc_msgSend(*(id *)(a1 + 56), "_totalByCommittingSample:toPreviousTotal:startDate:endDate:", v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "arrayByAddingObject:", v28);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        goto LABEL_6;
      }
    }

    *a4 = 1;
    goto LABEL_7;
  }

LABEL_6:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
LABEL_7:

}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSDate *lastCommitDate;
  HKQuantity *committedTotal;
  double v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  if (-[FITrailingQuantityTimeSlice finalized](self, "finalized"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[FITrailingQuantityTimeSlice quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITrailingQuantityTimeSlice startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FITrailingQuantityTimeSlice endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSArray count](self->_committedSamples, "count");
  v9 = -[NSArray count](self->_uncommittedSamples, "count");
  lastCommitDate = self->_lastCommitDate;
  committedTotal = self->_committedTotal;
  -[FITrailingQuantityTimeSlice committedDuration](self, "committedDuration");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p, finalized:%@, quantityType:%@, startDate:%@,            endDate:%@, numCommittedSamples:%lu, numUncommittedSamples:%lu, lastCommitDate:%@, commitedTotal:%@ committedDuration:%lu>"), v3, self, v4, v5, v6, v7, v8, v9, lastCommitDate, committedTotal, (uint64_t)v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
