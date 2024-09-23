@implementation FIQuantityTimeSlice

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  FIQuantityTimeSlice *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FIQuantityTimeSlice initWithQuantityType:startDate:endDate:](self, "initWithQuantityType:startDate:endDate:", v8, v7, v9);

  return v10;
}

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FIQuantityTimeSlice *v16;
  uint64_t v18;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(v11, "canonicalUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = 0;
  v16 = -[FIQuantityTimeSlice initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:](self, "initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:", v11, v10, v9, MEMORY[0x24BDBD1A8], v12, v15, v18);

  return v16;
}

- (FIQuantityTimeSlice)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 uncommitedSamples:(id)a6 lastCommitDate:(id)a7 committedTotal:(id)a8 finalized:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  FIQuantityTimeSlice *v19;
  FIQuantityTimeSlice *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)FIQuantityTimeSlice;
  v19 = -[FIQuantityTimeSlice init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityType, a3);
    objc_storeStrong((id *)&v20->_startDate, a4);
    objc_storeStrong((id *)&v20->_endDate, a5);
    objc_storeStrong((id *)&v20->_uncommittedSamples, a6);
    objc_storeStrong((id *)&v20->_lastCommitDate, a7);
    objc_storeStrong((id *)&v20->_committedTotal, a8);
    v20->_finalized = a9;
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

- (id)addingSamples:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  FIQuantityTimeSlice *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__5;
  v14[4] = __Block_byref_object_dispose__5;
  v15 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__FIQuantityTimeSlice_addingSamples_error___block_invoke;
  v9[3] = &unk_24CC4EDC8;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_uncommittedSamples, "arrayByAddingObjectsFromArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:", v6, self->_committedTotal, self->_lastCommitDate, self->_startDate, self->_endDate);
    v7 = (FIQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = self;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);

  return v7;
}

void __43__FIQuantityTimeSlice_addingSamples_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  id obj;

  v7 = a1[4];
  v8 = *(void **)(v7 + 40);
  v9 = *(void **)(v7 + 48);
  v10 = *(unsigned __int8 *)(v7 + 24);
  v11 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v11 + 40);
  v12 = _ValidateSample_0(a2, v8, v9, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v12;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
}

- (id)addingSample:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  FIQuantityTimeSlice *v8;

  v6 = a3;
  if ((_ValidateSample_0(v6, self->_startDate, self->_endDate, self->_finalized, a4) & 1) != 0)
  {
    -[NSArray arrayByAddingObject:](self->_uncommittedSamples, "arrayByAddingObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:", v7, self->_committedTotal, self->_lastCommitDate, self->_startDate, self->_endDate);
    v8 = (FIQuantityTimeSlice *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (id)committingUntilDate:(id)a3
{
  return -[FIQuantityTimeSlice _commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:](self, "_commitingSamples:toPreviousCommittedTotal:untilDate:startDate:endDate:", self->_uncommittedSamples, self->_committedTotal, a3, self->_startDate, self->_endDate);
}

- (id)settingEndDate:(id)a3
{
  id v4;
  FIQuantityTimeSlice *v5;
  FIQuantityTimeSlice *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  v5 = [FIQuantityTimeSlice alloc];
  LOBYTE(v9) = self->_finalized;
  v6 = -[FIQuantityTimeSlice initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:](v5, "initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:", self->_quantityType, self->_startDate, v4, self->_uncommittedSamples, self->_lastCommitDate, self->_committedTotal, v9);
  -[FIQuantityTimeSlice committingUntilDate:](v6, "committingUntilDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)finalized
{
  return self->_finalized;
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

- (id)_commitingSamples:(id)a3 toPreviousCommittedTotal:(id)a4 untilDate:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  FIQuantityTimeSlice *v24;
  void *v25;
  FIQuantityTimeSlice *v26;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  FIQuantityTimeSlice *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5;
  v45 = __Block_byref_object_dispose__5;
  v17 = v13;
  v46 = v17;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __112__FIQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_untilDate_startDate_endDate___block_invoke;
  v29[3] = &unk_24CC4EDF0;
  v18 = v14;
  v30 = v18;
  v19 = v15;
  v31 = v19;
  v20 = v16;
  v32 = v20;
  v33 = self;
  v34 = &v41;
  v35 = &v47;
  v36 = &v37;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v29);
  v21 = v48[3];
  v22 = objc_msgSend(v12, "count");
  objc_msgSend(v12, "subarrayWithRange:", v21, v22 - v48[3]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [FIQuantityTimeSlice alloc];
  -[FIQuantityTimeSlice quantityType](self, "quantityType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = *((_BYTE *)v38 + 24);
  v26 = -[FIQuantityTimeSlice initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:](v24, "initWithQuantityType:startDate:endDate:uncommitedSamples:lastCommitDate:committedTotal:finalized:", v25, v19, v20, v23, v18, v42[5], v28);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v26;
}

void __112__FIQuantityTimeSlice_SampleProcessing___commitingSamples_toPreviousCommittedTotal_untilDate_startDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  v17 = v6;
  v9 = v7;
  v10 = v8;
  if ((objc_msgSend(v17, "fi_isAfterDate:", v10) & 1) != 0)
  {

LABEL_9:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    goto LABEL_10;
  }
  if ((objc_msgSend(v17, "fi_isAfterDate:", v9) & 1) == 0)
  {
    if ((objc_msgSend(v17, "fi_spansDate:useStrictDateLimits:", v10, 0) & 1) != 0)
    {

      objc_msgSend(*(id *)(a1 + 56), "_totalByCommittingSample:toPreviousTotal:startDate:endDate:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v17, "fi_spansDate:useStrictDateLimits:", v9, 1) & 1) == 0)
    {

      objc_msgSend(*(id *)(a1 + 56), "_totalByCommittingSample:toPreviousTotal:startDate:endDate:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      goto LABEL_9;
    }
  }

  *a4 = 1;
LABEL_10:

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[FIQuantityTimeSlice finalized](self, "finalized"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[FIQuantityTimeSlice quantityType](self, "quantityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIQuantityTimeSlice startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIQuantityTimeSlice endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, finalized:%@, quantityType:%@, startDate:%@,            endDate:%@, numUncommitedSamples:%lu, lastCommitDate:%@, commitedTotal:%@>"), v4, self, v5, v6, v7, v8, -[NSArray count](self->_uncommittedSamples, "count"), self->_lastCommitDate, self->_committedTotal);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
