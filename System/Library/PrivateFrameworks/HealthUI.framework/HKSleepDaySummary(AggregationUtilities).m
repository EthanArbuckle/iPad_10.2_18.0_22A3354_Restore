@implementation HKSleepDaySummary(AggregationUtilities)

- (id)hui_startOfSleep
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "periods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v5, "segments");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if ((unint64_t)(objc_msgSend(v11, "category") - 1) <= 4)
              {
                objc_msgSend(v11, "dateInterval");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "startDate");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                HKDateMin();
                v14 = objc_claimAutoreleasedReturnValue();

                v3 = (void *)v14;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)hui_endOfSleep
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
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
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "periods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reverseObjectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "segments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reverseObjectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if ((unint64_t)(objc_msgSend(v16, "category") - 1) <= 4)
              {
                objc_msgSend(v16, "dateInterval");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "endDate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                HKDateMax();
                v19 = objc_claimAutoreleasedReturnValue();

                v6 = (void *)v19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)hui_durationOfSleep
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "hui_startOfSleep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hui_endOfSleep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v2 && v3)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    v5 = v6;
  }

  return v5;
}

- (double)hui_startOfSleepOffset
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hui_startOfSleep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v6 = v5;

  return v6;
}

@end
