@implementation HKSleepDaySummary(HealthUI_TestSupport)

- (void)hkui_durationForSleepCategoryValue:()HealthUI_TestSupport
{
  switch(a3)
  {
    case 0:
      a1 = (void *)objc_msgSend(a1, "inBedDuration");
      break;
    case 1:
      a1 = (void *)objc_msgSend(a1, "unspecifiedSleepDuration");
      break;
    case 2:
      a1 = (void *)objc_msgSend(a1, "awakeDuration");
      break;
    case 3:
      a1 = (void *)objc_msgSend(a1, "coreSleepDuration");
      break;
    case 4:
      a1 = (void *)objc_msgSend(a1, "deepSleepDuration");
      break;
    case 5:
      a1 = (void *)objc_msgSend(a1, "remSleepDuration");
      break;
    default:
      return a1;
  }
  return a1;
}

- (id)hkui_somnogramChartDateInterval
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend(a1, "sleepDuration");
  if (v2 == 0.0 && (objc_msgSend(a1, "inBedDuration"), v3 == 0.0))
  {
    objc_msgSend(a1, "dateInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E9CE9FE0);
    if ((objc_msgSend(a1, "hasSleepStageData") & 1) == 0)
      objc_msgSend(v5, "addObject:", &unk_1E9CEC950);
    objc_msgSend(a1, "firstStartDateMatchingSleepValues:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -300.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "lastEndDateMatchingSleepValues:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", 300.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfHourForDate:addingHours:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v9;
    objc_msgSend(a1, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "component:fromDate:", 64, v12);

    v15 = v12;
    if (v14 >= 1)
    {
      objc_msgSend(a1, "calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_startOfHourForDate:addingHours:", v12, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v11 && v15)
    {
      objc_msgSend(v15, "timeIntervalSinceDate:", v11);
      v18 = v17 / 3600.0;
      if ((uint64_t)v18 <= 0)
        v19 = -(-(uint64_t)v18 & 3);
      else
        v19 = (uint64_t)v18 & 3;
      if (v19 >= 1)
      {
        v20 = 4 - v19;
        v21 = (double)(4 - v19) * 0.5;
        v22 = vcvtmd_s64_f64(v21);
        objc_msgSend(v11, "dateByAddingTimeInterval:", (double)(uint64_t)floor(v21) * -3600.0);
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "dateByAddingTimeInterval:", (double)(uint64_t)(v20 - v22) * 3600.0);
        v24 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v23;
        v15 = (void *)v24;
      }
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v15);
    }
    else
    {
      objc_msgSend(a1, "dateInterval");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v25;

  }
  return v4;
}

- (id)firstStartDateMatchingSleepValues:()HealthUI_TestSupport
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "periods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v6 = *(_QWORD *)v28;
    v22 = v5;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "segments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "category"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v4, "containsObject:", v15);

              if ((v16 & 1) != 0)
              {
                objc_msgSend(v14, "dateInterval");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "startDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v5 = v22;
                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v11)
              continue;
            break;
          }
        }

        v5 = v22;
        v6 = v20;
      }
      v17 = 0;
      v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)lastEndDateMatchingSleepValues:()HealthUI_TestSupport
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a1, "periods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  v5 = 0;
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    v6 = 0x1E0CB3000uLL;
    v29 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v8, "segments");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v30);
              v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(*(id *)(v6 + 2024), "numberWithInteger:", objc_msgSend(v13, "category"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v4, "containsObject:", v14))
                goto LABEL_17;
              if (!v5)
              {

LABEL_16:
                v14 = v5;
                v5 = v13;
LABEL_17:

                continue;
              }
              objc_msgSend(v13, "dateInterval");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "endDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "dateInterval");
              v17 = v5;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "endDate");
              v19 = v11;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v16, "hk_isAfterDate:", v20);

              v11 = v19;
              v5 = v17;

              v4 = v29;
              v6 = 0x1E0CB3000;

              if (v31)
                goto LABEL_16;
            }
            v10 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v10);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

  objc_msgSend(v5, "dateInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "endDate");
  v22 = v5;
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
