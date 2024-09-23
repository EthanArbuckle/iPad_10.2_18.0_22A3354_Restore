@implementation HDQuantitySampleOverlapProcessor

- (HDQuantitySampleOverlapProcessor)initWithOverlapFunction:(unint64_t)a3
{
  HDQuantitySampleOverlapProcessor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDQuantitySampleOverlapProcessor;
  result = -[HDQuantitySampleOverlapProcessor init](&v5, sel_init);
  if (result)
  {
    result->_anchorTime = 0.0;
    result->_workingSetCount = 0;
    result->_overlapFunction = a3;
    result->_loggedDuplicatedSample = 0;
  }
  return result;
}

- (HDQuantitySampleOverlapProcessor)initWithState:(id *)a3
{
  HDQuantitySampleOverlapProcessor *result;
  int64_t v5;
  $B543770C418BD20EFA00A34EDBF07349 *workingSet;
  $A3DB90B81A8072650F44011264F9C29D *var4;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDQuantitySampleOverlapProcessor;
  result = -[HDQuantitySampleOverlapProcessor init](&v10, sel_init);
  if (result)
  {
    result->_overlapFunction = a3->var1;
    result->_anchorTime = a3->var0;
    result->_workingSetCount = a3->var2;
    result->_loggedDuplicatedSample = a3->var3;
    if (a3->var2 >= 1)
    {
      v5 = 0;
      workingSet = result->_workingSet;
      var4 = a3->var4;
      do
      {
        v8 = *(_OWORD *)&var4->var0;
        v9 = *(_OWORD *)&var4->var2;
        workingSet->sourceID = var4->var4;
        *(_OWORD *)&workingSet->startTime = v8;
        *(_OWORD *)&workingSet->sampleValue = v9;
        ++v5;
        ++var4;
        ++workingSet;
      }
      while (v5 < a3->var2);
    }
  }
  return result;
}

- ($1EB0DF88EDF1A34CBFAADF2FA3FC3584)exportCurrentState
{
  $1EB0DF88EDF1A34CBFAADF2FA3FC3584 *result;
  uint64_t workingSetCount;

  bzero(&retstr->var3, 0x1408uLL);
  retstr->var0 = self->_anchorTime;
  workingSetCount = self->_workingSetCount;
  retstr->var1 = self->_overlapFunction;
  retstr->var2 = workingSetCount;
  retstr->var3 = self->_loggedDuplicatedSample;
  if (workingSetCount >= 1)
    return ($1EB0DF88EDF1A34CBFAADF2FA3FC3584 *)memcpy(retstr->var4, self->_workingSet, 40 * workingSetCount);
  return result;
}

- (void)resetAnchorTime:(double)a3
{
  self->_anchorTime = a3;
  self->_workingSetCount = 0;
}

- (int64_t)addSample:(id *)a3 outputSamples:(id)a4[8] error:(id *)a5
{
  int64_t workingSetCount;
  double *v10;
  double var0;
  double var1;
  BOOL v14;
  NSError *unitTesting_DuplicateSampleError;
  double endTime;
  id v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  double v24;
  $A3DB90B81A8072650F44011264F9C29D *v25;
  __int128 v26;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v32;
  __int128 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  workingSetCount = self->_workingSetCount;
  if (workingSetCount < 1)
    goto LABEL_24;
  v10 = (double *)((char *)self + 40 * workingSetCount);
  var0 = a3->var0;
  var1 = a3->var1;
  v14 = *v10 == a3->var0 && *((double *)&self->_overlapFunction + 5 * workingSetCount) == var1 && v10[2] == a3->var2;
  if (v14 && *((unsigned __int8 *)v10 + 24) == a3->var3)
  {
    if (self->_loggedDuplicatedSample)
    {
      unitTesting_DuplicateSampleError = self->_unitTesting_DuplicateSampleError;
      self->_unitTesting_DuplicateSampleError = 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 115, CFSTR("Received duplicate quantity sample"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_unitTesting_DuplicateSampleError, v28);
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        LODWORD(v32) = 138543362;
        *(_QWORD *)((char *)&v32 + 4) = v28;
        _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "Failed to process overlapping samples: %{public}@", (uint8_t *)&v32, 0xCu);
      }
      self->_loggedDuplicatedSample = 1;

    }
    return 0;
  }
  if (workingSetCount == 1)
  {
    endTime = self->_workingSet[0].endTime;
    if (endTime > var0)
    {
      if (vabdd_f64(endTime, var0) > 0.000001 || var1 - var0 <= 0.000001)
        goto LABEL_24;
LABEL_23:
      a4->var0 = self->_anchorTime;
      a4->var1 = endTime;
      a4->var2 = self->_workingSet[0].sampleValue;
      a4->var3 = self->_workingSet[0].shouldContributeToCount;
      a4->var4 = self->_workingSet[0].sourceID;
      self->_anchorTime = a3->var0;
      v18 = *(_OWORD *)&a3->var0;
      v19 = *(_OWORD *)&a3->var2;
      self->_workingSet[0].sourceID = a3->var4;
      *(_OWORD *)&self->_workingSet[0].startTime = v18;
      *(_OWORD *)&self->_workingSet[0].sampleValue = v19;
      return 1;
    }
    if (var1 - var0 > 0.000001)
      goto LABEL_23;
  }
  else if ((unint64_t)workingSetCount >= 0x80)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 130, CFSTR("Overlap processing exceeded working set size."));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v30 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v32) = 138543362;
      *(_QWORD *)((char *)&v32 + 4) = v17;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Failed to process overlapping samples: %{public}@", (uint8_t *)&v32, 0xCu);
    }

    return -1;
  }
LABEL_24:
  v21 = (char *)self + 40 * workingSetCount;
  self->_workingSetCount = workingSetCount + 1;
  v22 = *(_OWORD *)&a3->var0;
  v23 = *(_OWORD *)&a3->var2;
  *((_QWORD *)v21 + 9) = a3->var4;
  *(_OWORD *)(v21 + 56) = v23;
  *(_OWORD *)(v21 + 40) = v22;
  v24 = a3->var0;
  if (self->_anchorTime >= a3->var0)
    return 0;
  v20 = 0;
  do
  {
    v34 = 0;
    v32 = 0u;
    v33 = 0u;
    -[HDQuantitySampleOverlapProcessor _overlapSampleToEdge:]((uint64_t)&v32, (uint64_t)self, v24);
    if (*((double *)&v32 + 1) - *(double *)&v32 > 0.000001)
    {
      v25 = &a4[v20++];
      v26 = v33;
      *(_OWORD *)&v25->var0 = v32;
      *(_OWORD *)&v25->var2 = v26;
      v25->var4 = v34;
    }
    v24 = a3->var0;
  }
  while (self->_anchorTime < a3->var0 && v20 < 8);
  return v20;
}

- (double)_overlapSampleToEdge:(double)result
{
  uint64_t v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v12;
  double *v13;
  BOOL v14;
  double v15;
  double v16;
  uint64_t v17;
  BOOL v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 24);
    if (v3 < 1)
      goto LABEL_36;
    v4 = *(double *)(a2 + 16);
    v5 = (double *)(a2 + 48);
    v6 = *(double *)(a2 + 24);
    do
    {
      v7 = *(v5 - 1);
      if (v7 < result && v7 > v4)
        result = *(v5 - 1);
      v9 = *v5;
      v5 += 5;
      v10 = v9;
      if (v9 < result && v10 > v4)
        result = v10;
      --*(_QWORD *)&v6;
    }
    while (v6 != 0.0);
    v12 = 0.0;
    v13 = (double *)(a2 + 72);
    v14 = 1;
    v15 = -1.79769313e308;
    v16 = 1.79769313e308;
    v17 = *(_QWORD *)(a2 + 24);
    v18 = 1;
    do
    {
      if (*(v13 - 4) <= v4 && *(v13 - 3) >= result)
      {
        v19 = *(v13 - 2);
        if (v16 >= v19)
          v16 = *(v13 - 2);
        if (v15 < v19)
          v15 = *(v13 - 2);
        if (v16 == v19)
        {
          v6 = *v13;
          v14 = *((_BYTE *)v13 - 8) != 0;
        }
        if (v15 == v19)
        {
          v12 = *v13;
          v18 = *((_BYTE *)v13 - 8) != 0;
        }
      }
      v13 += 5;
      --v17;
    }
    while (v17);
    if (v16 >= 1.79769313e308)
    {
LABEL_36:
      *(_QWORD *)(a1 + 32) = 0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
    }
    else
    {
      v20 = *(_QWORD *)(a2 + 8);
      if (v20 != 1)
      {
        v15 = 0.0;
        if (v20)
        {
          v12 = 0.0;
        }
        else
        {
          v15 = v16;
          v12 = v6;
        }
        if (v20)
          v18 = 1;
        else
          v18 = v14;
      }
      *(double *)a1 = v4;
      *(double *)(a1 + 8) = result;
      *(double *)(a1 + 16) = v15;
      *(_QWORD *)(a1 + 24) = 0;
      *(double *)(a1 + 32) = v12;
      *(_BYTE *)(a1 + 24) = v18;
    }
    if (v3 >= 1)
    {
      v21 = 0;
      v22 = a2 + 40;
      do
      {
        if (*(double *)(v22 + 40 * v21 + 8) <= result)
        {
          v23 = v22 + 40 * v21;
          v24 = v22 + 40 * v3;
          v25 = *(_OWORD *)(v24 - 40);
          v26 = *(_OWORD *)(v24 - 24);
          *(_QWORD *)(v23 + 32) = *(_QWORD *)(v24 - 8);
          *(_OWORD *)v23 = v25;
          *(_OWORD *)(v23 + 16) = v26;
          v3 = *(_QWORD *)(a2 + 24) - 1;
          *(_QWORD *)(a2 + 24) = v3;
        }
        else
        {
          ++v21;
        }
      }
      while (v21 < v3);
    }
    *(double *)(a2 + 16) = result;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

- (int64_t)finishWithRemainingSamples:(id)a3[8] error:(id *)a4
{
  int64_t v6;
  $A3DB90B81A8072650F44011264F9C29D *v7;
  __int128 v8;
  __int128 v11;
  __int128 v12;
  int64_t v13;

  if (self->_workingSetCount < 1)
    return 0;
  v6 = 0;
  do
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    -[HDQuantitySampleOverlapProcessor _overlapSampleToEdge:]((uint64_t)&v11, (uint64_t)self, 1.79769313e308);
    if (*((double *)&v11 + 1) - *(double *)&v11 > 0.000001)
    {
      v7 = &a3[v6++];
      v8 = v12;
      *(_OWORD *)&v7->var0 = v11;
      *(_OWORD *)&v7->var2 = v8;
      v7->var4 = v13;
    }
  }
  while (self->_workingSetCount >= 1 && v6 < 8);
  return v6;
}

- (BOOL)fetchOverlapProcessSamplesFrom:(id *)a3 setAnchorTime:(BOOL)a4 errorOut:(id *)a5 handler:(id)a6
{
  _BOOL4 v7;
  uint64_t (**v10)(id, int64_t, _BYTE *, id *);
  __int128 v11;
  int64_t v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  BOOL v17;
  id v19;
  _OWORD v20[2];
  int64_t var4;
  id v22;
  _BYTE v23[320];
  uint64_t v24;

  v7 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t (**)(id, int64_t, _BYTE *, id *))a6;
  if (v7)
    -[HDQuantitySampleOverlapProcessor resetAnchorTime:](self, "resetAnchorTime:", a3->var0);
  v22 = 0;
  v11 = *(_OWORD *)&a3->var2;
  v20[0] = *(_OWORD *)&a3->var0;
  v20[1] = v11;
  var4 = a3->var4;
  v12 = -[HDQuantitySampleOverlapProcessor addSample:outputSamples:error:](self, "addSample:outputSamples:error:", v20, v23, &v22);
  v13 = v22;
  v14 = v13;
  if (v12 == -1)
  {
    v16 = v13;
    if (!v16)
    {
LABEL_12:

      v17 = 0;
      goto LABEL_13;
    }
    if (!a5)
    {
LABEL_11:
      _HKLogDroppedError();
      goto LABEL_12;
    }
LABEL_8:
    v16 = objc_retainAutorelease(v16);
    *a5 = v16;
    goto LABEL_12;
  }
  v19 = v13;
  v15 = v10[2](v10, v12, v23, &v19);
  v16 = v19;

  if ((v15 & 1) == 0)
  {
    v16 = v16;
    if (!v16)
      goto LABEL_12;
    if (!a5)
      goto LABEL_11;
    goto LABEL_8;
  }
  v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)fetchFinalOverlapSamplesWithErrorOut:(id *)a3 handler:(id)a4
{
  uint64_t (**v6)(id, int64_t, _BYTE *, id *);
  id v7;
  int64_t v8;
  id v9;
  char v10;
  BOOL v11;
  id v13;
  id v14;
  _BYTE v15[320];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, int64_t, _BYTE *, id *))a4;
  v7 = 0;
  while (1)
  {
    v14 = v7;
    v8 = -[HDQuantitySampleOverlapProcessor finishWithRemainingSamples:error:](self, "finishWithRemainingSamples:error:", v15, &v14);
    v9 = v14;

    if (!v8)
    {
      v11 = 1;
      goto LABEL_13;
    }
    if (v8 == -1)
      break;
    v13 = v9;
    v10 = v6[2](v6, v8, v15, &v13);
    v7 = v13;

    if ((v10 & 1) == 0)
    {
      v9 = v7;
      if (!v9)
        goto LABEL_12;
      if (!a3)
        goto LABEL_7;
      goto LABEL_11;
    }
  }
  v9 = v9;
  if (!v9)
    goto LABEL_12;
  if (!a3)
  {
LABEL_7:
    _HKLogDroppedError();
    goto LABEL_12;
  }
LABEL_11:
  v9 = objc_retainAutorelease(v9);
  *a3 = v9;
LABEL_12:

  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)loggedDuplicatedSample
{
  return self->_loggedDuplicatedSample;
}

- (NSError)unitTesting_DuplicateSampleError
{
  return self->_unitTesting_DuplicateSampleError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_DuplicateSampleError, 0);
}

@end
