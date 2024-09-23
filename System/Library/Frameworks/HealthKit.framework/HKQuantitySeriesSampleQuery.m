@implementation HKQuantitySeriesSampleQuery

- (HKQuantitySeriesSampleQuery)initWithSample:(HKQuantitySample *)quantitySample quantityHandler:(void *)quantityHandler
{
  HKQuantitySample *v7;
  void *v8;
  void *v9;
  void *v10;
  HKQuantitySeriesSampleQuery *v11;
  double v12;
  uint64_t v13;
  id seriesHandler;
  objc_super v16;

  v7 = quantitySample;
  v8 = quantityHandler;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantitySample");
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantityHandler");
LABEL_3:
  -[HKQuantitySample quantityType](v7, "quantityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HKQuantitySeriesSampleQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, v10, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_sample, quantitySample);
    v11->_anchor = 0;
    -[HKSample _startTimestamp](v11->_sample, "_startTimestamp");
    v11->_startTime = v12;
    v13 = objc_msgSend(v9, "copy");
    seriesHandler = v11->_seriesHandler;
    v11->_seriesHandler = (id)v13;

  }
  return v11;
}

- (HKQuantitySeriesSampleQuery)initWithQuantityType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate quantityHandler:(void *)quantityHandler
{
  HKQuantityType *v8;
  NSPredicate *v9;
  void *v10;
  void *v11;
  id v12;
  HKQuantitySeriesSampleQuery *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v8 = quantityType;
  v9 = predicate;
  v10 = quantityHandler;
  v11 = v10;
  if (v8)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantityType");
    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantityHandler");
LABEL_3:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HKQuantitySeriesSampleQuery_initWithQuantityType_predicate_quantityHandler___block_invoke;
  v17[3] = &unk_1E37EDC78;
  v12 = v11;
  v18 = v12;
  v13 = -[HKQuantitySeriesSampleQuery initWithQuantityType:predicate:quantityBatchHandler:](self, "initWithQuantityType:predicate:quantityBatchHandler:", v8, v9, v17);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    v15 = v13->_quantityHandler;
    v13->_quantityHandler = (id)v14;

  }
  return v13;
}

void __78__HKQuantitySeriesSampleQuery_initWithQuantityType_predicate_quantityHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a9;
  if (v15)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a5);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a6);
    v21 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);

  }
  else
  {
    v21 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKQuantitySeriesSampleQuery)initWithQuantityType:(id)a3 predicate:(id)a4 quantityBatchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HKQuantitySeriesSampleQuery *v12;
  uint64_t v13;
  id quantityBatchHandler;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantityType");
    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "quantityBatchHandler");
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)HKQuantitySeriesSampleQuery;
  v12 = -[HKQuery _initWithObjectType:predicate:](&v16, sel__initWithObjectType_predicate_, v8, v9);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    quantityBatchHandler = v12->_quantityBatchHandler;
    v12->_quantityBatchHandler = (id)v13;

  }
  return v12;
}

- (id)quantityHandlerWithoutSample
{
  return _Block_copy(self->_seriesHandler);
}

- (id)quantityHandlerWithSample
{
  return _Block_copy(self->_quantityHandler);
}

- (void)setIncludeSample:(BOOL)includeSample
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HKQuantitySeriesSampleQuery_setIncludeSample___block_invoke;
  v6[3] = &unk_1E37E8990;
  v6[4] = self;
  v7 = includeSample;
  dispatch_sync(v5, v6);

}

uint64_t __48__HKQuantitySeriesSampleQuery_setIncludeSample___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 240) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setOrderByQuantitySampleStartDate:(BOOL)orderByQuantitySampleStartDate
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HKQuantitySeriesSampleQuery_setOrderByQuantitySampleStartDate___block_invoke;
  v6[3] = &unk_1E37E8990;
  v6[4] = self;
  v7 = orderByQuantitySampleStartDate;
  dispatch_sync(v5, v6);

}

uint64_t __65__HKQuantitySeriesSampleQuery_setOrderByQuantitySampleStartDate___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 241) = *(_BYTE *)(result + 40);
  return result;
}

- (void)client_deliverQuantitySeries:(id)a3 seriesAnchor:(int64_t)a4 isFinal:(BOOL)a5 query:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HKQuery queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke;
  block[3] = &unk_1E37EDCC8;
  block[4] = self;
  v16 = v11;
  v19 = a5;
  v17 = v10;
  v18 = a4;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, block);

}

void __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *(*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 > *(_QWORD *)(v3 + 168))
  {
    *(_QWORD *)(v3 + 168) = v2;
    v3 = *(_QWORD *)(a1 + 32);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = _Block_copy(*(const void **)(v3 + 152));
  if (v15[5])
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 64);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke_13;
    v9[3] = &unk_1E37EDCA0;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v12 = &v14;
    v13 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, v6, v9);

  }
  _Block_object_dispose(&v14, 8);

}

void __87__HKQuantitySeriesSampleQuery_client_deliverQuantitySeries_seriesAnchor_isFinal_query___block_invoke_13(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "deactivateCallCount");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "values");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v25 = 0;
      v7 = *(_QWORD *)v27;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        if (objc_msgSend(*(id *)(a1 + 40), "deactivateCallCount") > v4)
          break;
        v10 = (void *)MEMORY[0x19AEC7968]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "quantity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_unit");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "hasDuration"))
        {
          objc_msgSend(v9, "timeInterval");
          v15 = v14;
        }
        else
        {
          v15 = *(double *)(*(_QWORD *)(a1 + 40) + 176);
        }
        v16 = objc_msgSend(v9, "hasDuration");
        objc_msgSend(v9, "timeInterval");
        v18 = v17;
        if (v16)
        {
          objc_msgSend(v9, "duration");
          v18 = v18 + v19;
        }
        if (HKProgramSDKTokenAtLeast(objc_msgSend(*(id *)(a1 + 40), "applicationSDKVersionToken"), 0x7E30901FFFFFFFFLL))v20 = v15;
        else
          v20 = v18;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)(*(_QWORD *)(a1 + 40) + 176) = v18;
        if (*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(*(id *)(a1 + 32), "values");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "count");

        }
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();

        objc_autoreleasePoolPop(v10);
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v25 += v8;
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v23 + 16))(v23, *(_QWORD *)(a1 + 40), 0, 0, *(unsigned __int8 *)(a1 + 56), 0);
  }
}

- (void)client_deliverEnumerationResults:(id)a3 isFinal:(BOOL)a4 query:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HKQuantitySeriesSampleQuery *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke;
  v13[3] = &unk_1E37E8708;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *(*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTime");
    v7 = v6;

    v8 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v8 + 208) || v7 > *(double *)(v8 + 216))
    {
      *(double *)(v8 + 216) = v7;
      v8 = *(_QWORD *)(a1 + 40);
    }
    *(_BYTE *)(v8 + 208) = 1;
    objc_msgSend(*(id *)(a1 + 32), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 224);
    *(_QWORD *)(v12 + 224) = v11;

    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(a1 + 32), "latestSampleStartTime");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 232);
    *(_QWORD *)(v16 + 232) = v15;

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__19;
  v32 = __Block_byref_object_dispose__19;
  v33 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 192));
  if (v29[5])
  {
    v19 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v20 = *(unsigned __int8 *)(a1 + 56);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke_2;
    v23[3] = &unk_1E37EDCA0;
    v21 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v24 = v21;
    v25 = v22;
    v26 = &v28;
    v27 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v19, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v18, v20, v23);

  }
  _Block_object_dispose(&v28, 8);

}

void __78__HKQuantitySeriesSampleQuery_client_deliverEnumerationResults_isFinal_query___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  unint64_t v18;
  __n128 v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v26 = objc_msgSend(*(id *)(a1 + 40), "deactivateCallCount");
    objc_msgSend(*(id *)(a1 + 40), "objectType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalUnit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v25)
    {
      v24 = *(_QWORD *)v29;
LABEL_4:
      v5 = 0;
      v6 = v3 - 1;
      while (1)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        if (objc_msgSend(*(id *)(a1 + 40), "deactivateCallCount") > v26)
          break;
        v8 = (void *)MEMORY[0x19AEC7968]();
        objc_msgSend(v7, "value");
        +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v27);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3A28];
        objc_msgSend(v7, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hk_UUIDWithData:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_quantitySampleForEnumerationResult:UUID:", v7, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(v7, "startTime");
        v17 = v16;
        objc_msgSend(v7, "endTime");
        v19.n128_u64[0] = v18;
        if (*(_BYTE *)(a1 + 56))
          v20 = v6 == 0;
        else
          v20 = 0;
        v21 = v20;
        (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t, uint64_t, _QWORD, double, __n128))(v15 + 16))(v15, v14, v9, v13, v6, v21, 0, v17, v19);

        objc_autoreleasePoolPop(v8);
        ++v5;
        --v6;
        if (v25 == v5)
        {
          v3 = v6 + 1;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v25)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double))(v22 + 16))(v22, *(_QWORD *)(a1 + 40), 0, 0, 0, *(unsigned __int8 *)(a1 + 56), 0, 0.0, 0.0);
  }
}

- (id)_quantitySampleForEnumerationResult:(id)a3 UUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *receivedSamplesByUUID;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (self->_includeSample)
  {
    if (objc_msgSend(v6, "hasQuantitySample"))
    {
      v8 = (void *)MEMORY[0x1E0CB3710];
      v9 = objc_opt_class();
      objc_msgSend(v6, "quantitySample");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_receivedSamplesByUUID)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        receivedSamplesByUUID = self->_receivedSamplesByUUID;
        self->_receivedSamplesByUUID = v12;

      }
      if (objc_msgSend(v11, "count") >= 2)
      {
        v14 = objc_msgSend(v6, "seriesIndex") + 1;
        if (v14 < objc_msgSend(v6, "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedSamplesByUUID, "setObject:forKeyedSubscript:", v11, v7);
      }
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_receivedSamplesByUUID, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "seriesIndex") + 1;
      if (v15 >= objc_msgSend(v6, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_receivedSamplesByUUID, "removeObjectForKey:", v7);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C25A0;
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  uint64_t includeSample;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKQuantitySeriesSampleQuery;
  -[HKQuery queue_populateConfiguration:](&v8, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setQuantitySample:", self->_sample);
  objc_msgSend(v4, "setSeriesAnchor:", self->_anchor);
  objc_msgSend(v4, "setMode:", self->_seriesHandler == 0);
  if (self->_orderByQuantitySampleStartDate)
    includeSample = self->_includeSample | 2;
  else
    includeSample = self->_includeSample;
  objc_msgSend(v4, "setOptions:", includeSample);
  if (self->_hasMaximumReceivedStartTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_maximumReceivedStartTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaximumStartDate:", v6);

  }
  else
  {
    objc_msgSend(v4, "setMaximumStartDate:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_latestReceivedUUIDData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLatestUUID:", v7);

  objc_msgSend(v4, "setLatestSampleStartDate:", self->_latestSampleStartDate);
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  v5 = _Block_copy(self->_seriesHandler);
  v6 = _Block_copy(self->_quantityBatchHandler);
  v7 = v6;
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke;
    v15[3] = &unk_1E37E6710;
    v9 = &v17;
    v17 = v5;
    v15[4] = self;
    v10 = &v16;
    v16 = v4;
    v11 = v15;
LABEL_5:
    dispatch_async(v8, v11);

    goto LABEL_6;
  }
  if (v6)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke_2;
    v12[3] = &unk_1E37E6710;
    v9 = &v14;
    v14 = v7;
    v12[4] = self;
    v10 = &v13;
    v13 = v4;
    v11 = v12;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, 1, a1[5]);
}

uint64_t __50__HKQuantitySeriesSampleQuery_queue_deliverError___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, double, double))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, 1, a1[5], 0.0, 0.0);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id seriesHandler;
  id quantityBatchHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, a3);
  seriesHandler = self->_seriesHandler;
  self->_seriesHandler = 0;

  quantityBatchHandler = self->_quantityBatchHandler;
  self->_quantityBatchHandler = 0;

}

- (NSDictionary)unitTest_cachedQuantitySamplesByUUID
{
  return (NSDictionary *)self->_receivedSamplesByUUID;
}

- (BOOL)includeSample
{
  return self->_includeSample;
}

- (BOOL)orderByQuantitySampleStartDate
{
  return self->_orderByQuantitySampleStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestReceivedUUIDData, 0);
  objc_storeStrong((id *)&self->_receivedSamplesByUUID, 0);
  objc_storeStrong(&self->_quantityBatchHandler, 0);
  objc_storeStrong(&self->_quantityHandler, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong(&self->_seriesHandler, 0);
}

@end
