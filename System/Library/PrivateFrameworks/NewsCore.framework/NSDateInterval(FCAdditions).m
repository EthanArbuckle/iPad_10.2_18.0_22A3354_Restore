@implementation NSDateInterval(FCAdditions)

+ (id)fc_safeDateIntervalWithStartDate:()FCAdditions endDate:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_msgSend(v5, "compare:", v6);
    v9 = (objc_class *)MEMORY[0x1E0CB3588];
    if (v8 == 1)
    {
      v10 = v5;
      v11 = v7;
      v12 = (void *)objc_msgSend([v9 alloc], "initWithStartDate:endDate:", v11, v10);

    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v7);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke;
    v14[3] = &unk_1E463D4B8;
    v15 = v5;
    v16 = v7;
    __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke((uint64_t)v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (double)fc_durationOfDateIntervalsIgnoringOverlap:()FCAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D20];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__NSDateInterval_FCAdditions__fc_durationOfDateIntervalsIgnoringOverlap___block_invoke;
  v18[3] = &unk_1E463AA30;
  v5 = v3;
  v19 = v5;
  objc_msgSend(v4, "fc_array:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "duration");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)fc_unionWithDateInterval:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "laterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v10);
  return v11;
}

@end
