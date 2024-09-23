@implementation HDSleepIntervalSummaryBuilder

- (id)sleepAnalysisSamples
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id obj;
  id obja;
  objc_super v72;
  __int128 v73;
  id v74;
  __int128 v75;
  id v76;
  __int128 v77;
  _OWORD v78[2];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v72.receiver = self;
  v72.super_class = (Class)HDSleepIntervalSummaryBuilder;
  -[HDSleepDaySummaryBuilder sleepAnalysisSamples](&v72, sel_sleepAnalysisSamples);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[HDSleepDaySummaryBuilder options](self, "options") & 1) != 0)
  {
    v61 = v62;
    if (self)
    {
      -[HDSleepDaySummaryBuilder calendar](self, "calendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v78, 0, sizeof(v78));
      v77 = 0u;
      -[HDSleepIntervalSummaryBuilder _computeSleepIntervalAveragesFromSamples:](&v77, self, v61);
      obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v61, "count"));
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v64 = v61;
      v30 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v30)
      {
        v31 = *((double *)v78 + 1);
        v66 = (void *)*((_QWORD *)&v78[1] + 1);
        v68 = *(_QWORD *)v80;
        v32 = *(double *)&v77;
        v33 = *(void **)&v78[0];
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v80 != v68)
              objc_enumerationMutation(v64);
            v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            v36 = objc_msgSend(v35, "value");
            v37 = v66;
            if (v36)
            {
              v38 = v31;
            }
            else
            {
              v37 = v33;
              v38 = v32;
            }
            v39 = v37;
            objc_msgSend(v35, "startDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "hk_morningIndexWithCalendar:", v29);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "doubleValue");
            v45 = v44;

            objc_msgSend(v35, "endDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "startDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "timeIntervalSinceDate:", v47);
            v49 = v48;

            objc_msgSend(v35, "startDate");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "dateByAddingTimeInterval:", v38 - v45);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "dateByAddingTimeInterval:", v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v51, v52);
            objc_msgSend(v53, "hk_dateIntervalByMappingToSleepDayWithMorningIndex:calendar:", -[HDSleepDaySummaryBuilder morningIndex](self, "morningIndex"), v29);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v54, "startDate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_setStartDate:", v55);

            objc_msgSend(v54, "endDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_setEndDate:", v56);

            objc_msgSend(obja, "addObject:", v35);
          }
          v30 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        }
        while (v30);
      }

      objc_msgSend(obja, "sortUsingComparator:", &__block_literal_global_191);
    }
    else
    {
      obja = 0;
    }

  }
  else
  {
    v59 = v62;
    if (self)
    {
      -[HDSleepDaySummaryBuilder calendar](self, "calendar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
      objc_msgSend(MEMORY[0x1E0CB3588], "hk_sleepDayIntervalForMorningIndex:calendar:", -[HDSleepDaySummaryBuilder morningIndex](self, "morningIndex"), v60);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[HDSleepDaySummaryBuilder numberOfDays](self, "numberOfDays"));
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[HDSleepDaySummaryBuilder numberOfDays](self, "numberOfDays"));
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      obj = v59;
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (!v2)
        goto LABEL_24;
      v3 = *(_QWORD *)v80;
      while (1)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v80 != v3)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v4);
          v6 = objc_msgSend(v5, "value");
          v7 = v6;
          if ((unint64_t)(v6 - 3) < 3 || v6 == 1)
          {
            v7 = 1;
          }
          else if (v6 == 2)
          {
            goto LABEL_19;
          }
          -[HDSleepDaySummaryBuilder calendar](self, "calendar");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hk_morningIndexWithCalendar:", v9);

          v12 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v5, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);

          v16 = v67;
          if (v7)
            v16 = v65;
          v17 = v16;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (!v19)
            v19 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
          objc_msgSend(v19, "insertInterval:", v15);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v20);

LABEL_19:
          ++v4;
        }
        while (v2 != v4);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        v2 = v21;
        if (!v21)
        {
LABEL_24:

          v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[HDSleepIntervalSummaryBuilder _samplesForSleepAnalysisValue:dateIntervalTreesByMorningIndex:sleepDayInterval:](0, v67);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v23);

          -[HDSleepIntervalSummaryBuilder _samplesForSleepAnalysisValue:dateIntervalTreesByMorningIndex:sleepDayInterval:](v58, v65);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v24);

          objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_30);
          memset(v78, 0, sizeof(v78));
          v77 = 0u;
          -[HDSleepIntervalSummaryBuilder _computeSleepIntervalAveragesFromSamples:](&v77, self, v22);
          obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
          v75 = v77;
          v25 = *(id *)&v78[0];
          v76 = v25;
          -[HDSleepIntervalSummaryBuilder _sampleForSleepAnalysisValue:averageInfo:sleepDayInterval:](0, (uint64_t)&v75, v63);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "hk_addNonNilObject:", v26);

          v73 = *(_OWORD *)((char *)v78 + 8);
          v27 = *((id *)&v78[1] + 1);
          v74 = v27;
          -[HDSleepIntervalSummaryBuilder _sampleForSleepAnalysisValue:averageInfo:sleepDayInterval:](v58, (uint64_t)&v73, v63);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "hk_addNonNilObject:", v28);

          goto LABEL_25;
        }
      }
    }
    obja = 0;
LABEL_25:

  }
  return obja;
}

- (BOOL)scheduleAppliesToWeekday:(id)a3
{
  return 1;
}

- (void)_computeSleepIntervalAveragesFromSamples:(void *)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id obj;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _OWORD v52[2];
  id v53;
  _OWORD v54[2];
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a2, "morningIndex");
  objc_msgSend(a2, "calendar");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (unint64_t)(v5 - 1);
  v50 = 0uLL;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = v6;
  v46 = v49;
  v47 = 0uLL;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = v7;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v8)
  {
    v40 = *(_QWORD *)v43;
    while (1)
    {
      v41 = v8;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        if ((_HKCategoryValueSleepAnalysisIsAsleep() & 1) != 0)
        {
          v11 = &v46;
        }
        else
        {
          if (objc_msgSend(v10, "value"))
            continue;
          v11 = &v49;
        }
        v12 = v10;
        v13 = v39;
        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "hk_morningIndexWithCalendar:", v13);

        objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", v15, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)v11;
        v17 = *((_QWORD *)v11 + 1);
        v19 = *((double *)v11 + 2);
        v20 = *((double *)v11 + 3);
        v21 = *((id *)v11 + 4);
        v22 = (void *)objc_msgSend(v21, "mutableCopy");

        if (v18 != v15)
        {
          objc_msgSend(v12, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceDate:", v16);
          v25 = v24;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, v27);

          v19 = v19 + v25;
          ++v17;
        }
        objc_msgSend(v12, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", v29);
        v31 = v30;

        *(_QWORD *)v11 = v15;
        *((_QWORD *)v11 + 1) = v17;
        *((double *)v11 + 2) = v19;
        *((double *)v11 + 3) = v20 + v31;
        v32 = (void *)*((_QWORD *)v11 + 4);
        *((_QWORD *)v11 + 4) = v22;

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      if (!v8)
      {
        v6 = v51;
        v7 = v48;
        break;
      }
    }
  }

  v54[0] = v49;
  v54[1] = v50;
  v33 = v6;
  v34 = v7;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  v35 = v33;
  v55 = v35;
  _HDMakeSleepIntervalAverageInfo((uint64_t)a1, (uint64_t)v54);
  v52[0] = v46;
  v52[1] = v47;
  v36 = v34;
  v53 = v36;
  _HDMakeSleepIntervalAverageInfo((uint64_t)a1 + 24, (uint64_t)v52);

}

- (id)_samplesForSleepAnalysisValue:(uint64_t)a1 dateIntervalTreesByMorningIndex:(void *)a2 sleepDayInterval:
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6), v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v18 = v7;
        objc_msgSend(v7, "mergedIntervals");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:clampedInterval:", v4, a1, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

  return v5;
}

uint64_t __91__HDSleepIntervalSummaryBuilder__sleepConsistencySamplesAdjustedForAggregationFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_sampleForSleepAnalysisValue:(uint64_t)a1 averageInfo:(uint64_t)a2 sleepDayInterval:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (*(double *)(a2 + 8) <= 2.22507386e-308)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", *(double *)a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v8, *(double *)(a2 + 8));
    objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:clampedInterval:", v6, a1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

uint64_t __85__HDSleepIntervalSummaryBuilder__sleepStageSamplesAdjustedForAggregationFromSamples___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
