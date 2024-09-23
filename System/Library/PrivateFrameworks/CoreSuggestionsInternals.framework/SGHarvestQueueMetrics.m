@implementation SGHarvestQueueMetrics

- (SGHarvestQueueMetrics)initWithBundleIdentifier:(id)a3 highPriority:(BOOL)a4 harvestedOnBattery:(BOOL)a5 receivedOnBattery:(BOOL)a6 harvestSource:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  SGHarvestQueueMetrics *v13;
  uint64_t v14;
  SGM2HarvestCost *harvestCostMetrics;
  id v16;
  void *v17;
  uint64_t v18;
  _PASLock *guardedData;
  objc_super v21;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGHarvestQueueMetrics;
  v13 = -[SGHarvestQueueMetrics init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_opt_new();
    harvestCostMetrics = v13->_harvestCostMetrics;
    v13->_harvestCostMetrics = (SGM2HarvestCost *)v14;

    -[SGM2HarvestCost setDocumentSource:](v13->_harvestCostMetrics, "setDocumentSource:", -[SGHarvestQueueMetrics _documentSourceForBundleId:](v13, "_documentSourceForBundleId:", v12));
    -[SGM2HarvestCost setHighPriority:](v13->_harvestCostMetrics, "setHighPriority:", v10);
    -[SGM2HarvestCost setHarvestedOnBattery:](v13->_harvestCostMetrics, "setHarvestedOnBattery:", v9);
    -[SGM2HarvestCost setReceivedOnBattery:](v13->_harvestCostMetrics, "setReceivedOnBattery:", v8);
    -[SGM2HarvestCost setHarvestSource:](v13->_harvestCostMetrics, "setHarvestSource:", v7);
    v16 = objc_alloc(MEMORY[0x1E0D815F0]);
    v17 = (void *)objc_opt_new();
    v18 = objc_msgSend(v16, "initWithGuardedData:", v17);
    guardedData = v13->_guardedData;
    v13->_guardedData = (_PASLock *)v18;

  }
  return v13;
}

- (id)initRealtime:(id)a3 wasNoBudgetItem:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  SGHarvestQueueMetrics *v9;

  v4 = a4;
  v6 = a3;
  v7 = HVIsConnectedToPower() ^ 1;
  if (v4)
    v8 = 2;
  else
    v8 = 1;
  v9 = -[SGHarvestQueueMetrics initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:](self, "initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:", v6, 1, v7, v7, v8);

  return v9;
}

- (id)harvestTimes
{
  _PASLock *guardedData;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22329;
  v10 = __Block_byref_object_dispose__22330;
  v11 = 0;
  guardedData = self->_guardedData;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SGHarvestQueueMetrics_harvestTimes__block_invoke;
  v5[3] = &unk_1E7DAFE98;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](guardedData, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)harvestTimerForName:(id)a3
{
  id v4;
  _PASLock *guardedData;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__22329;
  v16 = __Block_byref_object_dispose__22330;
  v17 = 0;
  guardedData = self->_guardedData;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__SGHarvestQueueMetrics_harvestTimerForName___block_invoke;
  v9[3] = &unk_1E7DB1180;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](guardedData, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)startTimer:(id)a3
{
  id v4;
  _PASLock *guardedData;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  guardedData = self->_guardedData;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SGHarvestQueueMetrics_startTimer___block_invoke;
  v7[3] = &unk_1E7DAFEC0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](guardedData, "runWithLockAcquired:", v7);

}

- (void)endTimer:(id)a3 significantWork:(BOOL)a4
{
  id v6;
  void *v7;
  _PASLock *guardedData;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  guardedData = self->_guardedData;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__SGHarvestQueueMetrics_endTimer_significantWork___block_invoke;
  v10[3] = &unk_1E7DAFEE8;
  v9 = v6;
  v11 = v9;
  v12 = a4;
  -[_PASLock runWithLockAcquired:](guardedData, "runWithLockAcquired:", v10);

  objc_autoreleasePoolPop(v7);
}

- (void)startHarvest
{
  -[SGHarvestQueueMetrics startTimer:](self, "startTimer:", kHarvestMetricsHarvestTimer);
}

- (void)endHarvest
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SGM2HarvestCost *harvestCostMetrics;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  id obj;
  SGHarvestQueueMetrics *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self;
  -[SGHarvestQueueMetrics harvestTimes](self, "harvestTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1C3BD4F6C]();
        LOBYTE(v7) = objc_msgSend(v7, "significantWork");
        objc_autoreleasePoolPop(v8);
        if ((v7 & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[SGHarvestQueueMetrics endTimer:significantWork:](v28, "endTimer:significantWork:", kHarvestMetricsHarvestTimer, v4);
  if (petInstanceOverrideForTesting)
  {
    v9 = (id)petInstanceOverrideForTesting;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[SGHarvestQueueMetrics harvestTimerForName:](v28, "harvestTimerForName:", kHarvestMetricsHarvestTimer);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  harvestCostMetrics = v28->_harvestCostMetrics;
  objc_msgSend(v11, "cpu");
  objc_msgSend(v10, "trackDistributionForMessage:value:", harvestCostMetrics);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SGHarvestQueueMetrics harvestTimes](v28, "harvestTimes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    v16 = *MEMORY[0x1E0D19D98];
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        v19 = (void *)MEMORY[0x1C3BD4F6C]();
        v20 = (void *)objc_opt_new();
        objc_msgSend(v20, "setDocumentSource:", -[SGM2HarvestCost documentSource](v28->_harvestCostMetrics, "documentSource"));
        objc_msgSend(v18, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setComponentName:", v21);

        objc_msgSend(v20, "setSignificantWork:", objc_msgSend(v18, "significantWork"));
        objc_msgSend(v18, "cpu");
        objc_msgSend(v10, "trackDistributionForMessage:value:", v20);
        v37 = CFSTR("harvestCPU");
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "cpu");
        objc_msgSend(v22, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v16, CFSTR("SGHarvestQueueMetricsTimer"));
        AnalyticsSendEvent();

        objc_autoreleasePoolPop(v19);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(context);
}

- (int)_documentSourceForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  if (_documentSourceForBundleId___pasOnceToken6 != -1)
    dispatch_once(&_documentSourceForBundleId___pasOnceToken6, &__block_literal_global_84_22308);
  objc_msgSend((id)_documentSourceForBundleId___pasExprOnceResult, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue");
  else
    v6 = objc_msgSend(v3, "containsString:", CFSTR("com.apple")) ^ 1;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestCostMetrics, 0);
  objc_storeStrong((id *)&self->_guardedData, 0);
}

void __52__SGHarvestQueueMetrics__documentSourceForBundleId___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = *MEMORY[0x1E0D19A40];
  v6[0] = *MEMORY[0x1E0D19A28];
  v6[1] = v1;
  v7[0] = &unk_1E7E0C6C8;
  v7[1] = &unk_1E7E0C6E0;
  v2 = *MEMORY[0x1E0D19A60];
  v6[2] = *MEMORY[0x1E0D19A48];
  v6[3] = v2;
  v7[2] = &unk_1E7E0C6F8;
  v7[3] = &unk_1E7E0C710;
  v3 = *MEMORY[0x1E0D19A58];
  v6[4] = *MEMORY[0x1E0D19A38];
  v6[5] = v3;
  v7[4] = &unk_1E7E0C728;
  v7[5] = &unk_1E7E0C740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_documentSourceForBundleId___pasExprOnceResult;
  _documentSourceForBundleId___pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __50__SGHarvestQueueMetrics_endTimer_significantWork___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "done:", *(unsigned __int8 *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", kHarvestMetricsMessageHtmlParser))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", kHarvestMetricsMessageInhumanBody);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyAdjustmentIfSane:", v4);

    objc_msgSend(v3, "objectForKeyedSubscript:", kHarvestMetricsMessageQuotedRegions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyAdjustmentIfSane:", v4);

    objc_msgSend(v3, "objectForKeyedSubscript:", kHarvestMetricsMessageDetectedData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyAdjustmentIfSane:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("message")))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    objc_msgSend(v3, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasSuffix:", CFSTR("Dissector"));

          if (v16)
            objc_msgSend(v13, "applyAdjustmentIfSane:", v4);
          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v3 = v17;
  }

}

void __36__SGHarvestQueueMetrics_startTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SGHarvestQueueMetricsTimer *v4;

  v3 = a2;
  v4 = -[SGHarvestQueueMetricsTimer initWithName:]([SGHarvestQueueMetricsTimer alloc], "initWithName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

}

void __45__SGHarvestQueueMetrics_harvestTimerForName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __37__SGHarvestQueueMetrics_harvestTimes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  sgFilter();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __37__SGHarvestQueueMetrics_harvestTimes__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "cpu");
  return 1;
}

+ (id)overridePET2InstanceForTesting:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (id)petInstanceOverrideForTesting;
  v5 = (void *)petInstanceOverrideForTesting;
  petInstanceOverrideForTesting = (uint64_t)v3;
  v6 = v3;

  return v4;
}

@end
