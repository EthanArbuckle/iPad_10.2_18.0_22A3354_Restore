@implementation _HKQueryUtilities

+ (id)coalesceTimePeriods:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v10)
  {
    v13 = 0;
    v12 = 0;
    v26 = v9;
    goto LABEL_24;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if (v12
        && (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "startDate"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "hk_isBeforeDate:", v12),
            v17,
            (v18 & 1) == 0))
      {
        _HKDateIntervalCreate(v13, v12, v30, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "duration");
        if (v22 > 0.0)
          objc_msgSend(v29, "addObject:", v21);

        v12 = 0;
      }
      else if (v13)
      {
        objc_msgSend(v16, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "earlierDate:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v20;
        goto LABEL_14;
      }
      objc_msgSend(v16, "startDate", v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      objc_msgSend(v16, "endDate", v29);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v12)
      {
        objc_msgSend(v12, "laterDate:", v23);
        v25 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v25;
      }
      else
      {
        v12 = (void *)v23;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v11);

  if (v13 && v12)
  {
    _HKDateIntervalCreate(v13, v12, v30, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "duration");
    if (v27 > 0.0)
      objc_msgSend(v29, "addObject:", v26);
LABEL_24:

  }
  return v29;
}

+ (id)coalesceTimePeriodsFromSamples:(id)a3 strictStartDate:(id)a4 strictEndDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
        v21[0] = v14;
        v21[1] = 3221225472;
        v21[2] = __82___HKQueryUtilities_coalesceTimePeriodsFromSamples_strictStartDate_strictEndDate___block_invoke;
        v21[3] = &unk_1E37EFE30;
        v22 = v9;
        objc_msgSend(v16, "_enumerateTimePeriodsWithBlock:", v21);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(a1, "coalesceTimePeriods:strictStartDate:strictEndDate:", v9, v20, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)calculateTotalDurationsWithTimePeriods:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 startOfDayTransform:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void (**v20)(void *, void *);
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  char v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD aBlock[4];
  id v60;
  id v61;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a1, "coalesceTimePeriods:strictStartDate:strictEndDate:", a3, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117___HKQueryUtilities_calculateTotalDurationsWithTimePeriods_startDate_endDate_intervalComponents_startOfDayTransform___block_invoke;
  aBlock[3] = &unk_1E37EFE58;
  v18 = v15;
  v61 = v18;
  v19 = v17;
  v60 = v19;
  v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  v56 = v19;
  v57 = v14;
  objc_msgSend(v19, "dateByAddingComponents:toDate:options:", v14, v12, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:endDate:", v12, v22);

  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v23, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v13;
  LODWORD(v22) = objc_msgSend(v24, "hk_isBeforeDate:", v13);

  v53 = v18;
  v54 = v12;
  if ((_DWORD)v22)
  {
    v25 = 0;
    v26 = 0.0;
    while (1)
    {
      v20[2](v20, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == objc_msgSend(v16, "count", v53, v54))
        break;
      objc_msgSend(v16, "objectAtIndexedSubscript:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "hk_isAfterOrEqualToDate:", v30);

      if (!v31)
        goto LABEL_7;
      objc_msgSend(v28, "startDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "hk_isBeforeOrEqualToDate:", v33);

      if (!v34)
        goto LABEL_7;
      objc_msgSend(v28, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HKDateMax(v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "endDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v39 = objc_claimAutoreleasedReturnValue();
      HKDateMin(v38, (void *)v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "timeIntervalSinceDate:", v37);
      v26 = v26 + v41;
      objc_msgSend(v28, "endDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v39) = objc_msgSend(v42, "isEqualToDate:", v40);

      v25 += v39;
      if ((v39 & 1) == 0)
      {
LABEL_7:
        if (v26 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v43, v23);

          v26 = 0.0;
        }
        v44 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v23, "endDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "endDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dateByAddingComponents:toDate:options:", v57, v46, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v44, "initWithStartDate:endDate:", v45, v47);

        v23 = (void *)v48;
      }

      objc_msgSend(v23, "startDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "hk_isBeforeDate:", v58);

      if ((v50 & 1) == 0)
        goto LABEL_15;
    }
    if (v26 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v51, v23);

    }
  }
LABEL_15:

  return v55;
}

+ (id)calculateIncludedValuesWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_62);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93___HKQueryUtilities_calculateIncludedValuesWithSamples_startDate_endDate_intervalComponents___block_invoke_2;
  v17[3] = &unk_1E37EFEC0;
  v15 = v14;
  v18 = v15;
  objc_msgSend(a1, "_organizeSampleByStartDate:startDate:endDate:intervalComponents:callback:", v13, v12, v11, v10, v17);

  return v15;
}

+ (void)_organizeSampleByStartDate:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 callback:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  id v32;

  v32 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v29 = v15;
  v30 = v13;
  objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v13, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v17);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = v12;
  v31 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  v28 = v16;
  if (objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v12))
  {
    v21 = 0;
    do
    {
      if (v21 >= objc_msgSend(v32, "count"))
        break;
      objc_msgSend(v32, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "hk_isBeforeDate:", v24);

      if (v25)
      {
        objc_msgSend(v19, "addObject:", v22);
        ++v21;
      }
      else
      {
        if (v31 && objc_msgSend(v19, "count"))
          ((void (**)(_QWORD, void *, id))v31)[2](v31, v18, v19);
        objc_msgSend(v19, "removeAllObjects");
        v26 = v17;

        objc_msgSend(v29, "dateByAddingComponents:toDate:options:", v30, v26, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v26, v17);
        v18 = (void *)v27;
        v16 = v26;
      }

    }
    while ((objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v20) & 1) != 0);
  }
  if (v31 && objc_msgSend(v19, "count"))
    ((void (**)(_QWORD, void *, id))v31)[2](v31, v18, v19);

}

+ (id)arrayByCoalescingObjects:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 calendar:(id)a6 combiningBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, id, void *);
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id, id, void *))a7;
  if (v11)
  {
    v29 = v12;
    v16 = v12;
    objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v11;
    v18 = (void *)objc_msgSend(v11, "mutableCopy");
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (objc_msgSend(v18, "count", v29) || objc_msgSend(v19, "count"))
    {
      objc_msgSend(v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20
        && (objc_msgSend(v20, "startDate"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "hk_isBeforeDate:", v17),
            v22,
            v23))
      {
        objc_msgSend(v19, "addObject:", v21);
        objc_msgSend(v18, "removeObjectAtIndex:", 0);
      }
      else
      {
        v15[2](v15, v19, v16, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v31, "addObject:", v24);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __99___HKQueryUtilities_arrayByCoalescingObjects_startDate_intervalComponents_calendar_combiningBlock___block_invoke;
        v32[3] = &unk_1E37EFEE8;
        v25 = v17;
        v33 = v25;
        objc_msgSend(v19, "hk_removeObjectsPassingTest:", v32);
        v26 = v25;

        objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v26, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v26;
      }

    }
    v12 = v29;
    v11 = v30;
    v27 = v31;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (double)totalDurationFromCoalescedDateIntervals:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v7 = v7 + v12;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (id)calculateCountStatisticsWithSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94___HKQueryUtilities_calculateCountStatisticsWithSamples_startDate_endDate_intervalComponents___block_invoke;
  v18[3] = &unk_1E37EFEC0;
  v16 = v15;
  v19 = v16;
  objc_msgSend(a1, "_organizeSampleByStartDate:startDate:endDate:intervalComponents:callback:", v14, v13, v12, v11, v18);

  return v16;
}

+ (id)countStatisticsQueryWithSampleType:(id)a3 startDate:(id)a4 endDate:(id)a5 intervalComponents:(id)a6 predicate:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HKSampleQuery *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HKSampleQuery *v28;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = (void *)MEMORY[0x1E0CB3928];
  v18 = a7;
  v19 = a3;
  objc_msgSend(v17, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v13, v14, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [HKSampleQuery alloc];
  _HKPredicateMatchingPredicates(v21, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __114___HKQueryUtilities_countStatisticsQueryWithSampleType_startDate_endDate_intervalComponents_predicate_completion___block_invoke;
  v32[3] = &unk_1E37EFF10;
  v36 = v16;
  v37 = a1;
  v33 = v13;
  v34 = v14;
  v35 = v15;
  v24 = v15;
  v25 = v14;
  v26 = v13;
  v27 = v16;
  v28 = -[HKSampleQuery initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:](v22, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v19, v23, 0, v30, v32);

  return v28;
}

+ (id)averageSumFromStatistics:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "sumQuantity", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValueForUnit:", v6);
          v11 = v11 + v14;

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v11 / (double)(unint64_t)objc_msgSend(v7, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)averageSumFromQuantities:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "doubleValueForUnit:", v6, (_QWORD)v16);
          v11 = v11 + v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v11 / (double)(unint64_t)objc_msgSend(v7, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)minimumFromQuantities:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v6);
    v9 = v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "doubleValueForUnit:", v6, (_QWORD)v18);
          if (v15 < v9)
            v9 = v15;
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)maximumFromQuantities:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v6);
    v9 = v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "doubleValueForUnit:", v6, (_QWORD)v18);
          if (v15 > v9)
            v9 = v15;
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)shouldUseDailyAverageWithDateComponents:(id)a3 sampleType:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "aggregationStyle") == 0;
  objc_msgSend(v5, "hk_approximateDuration");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_approximateDuration");
  v12 = v11;

  v13 = v9 > v12 && v7;
  return v13;
}

+ (id)coalesceTotalDurations:(id)a3 startDate:(id)a4 intervalComponents:(id)a5 intervalRecordCountsOut:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97___HKQueryUtilities_coalesceTotalDurations_startDate_intervalComponents_intervalRecordCountsOut___block_invoke_2;
  v25[3] = &unk_1E37EFF78;
  v26 = v10;
  v18 = v13;
  v27 = v18;
  v19 = v14;
  v28 = v19;
  v20 = v10;
  v21 = (id)objc_msgSend(a1, "arrayByCoalescingObjects:startDate:intervalComponents:calendar:combiningBlock:", v16, v11, v12, v17, v25);

  if (a6)
    *a6 = objc_retainAutorelease(v19);
  v22 = v28;
  v23 = v18;

  return v23;
}

@end
