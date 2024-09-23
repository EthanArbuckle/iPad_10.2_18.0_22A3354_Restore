@implementation NSDateInterval

id __72__NSDateInterval_FCAdditions__fc_safeDateIntervalWithStartDate_endDate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  v3 = v2;
  if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
  {
    v4 = (void *)objc_msgSend(v2, "initWithStartDate:duration:", 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v6, 0.0);

  }
  return v4;
}

void __73__NSDateInterval_FCAdditions__fc_durationOfDateIntervalsIgnoringOverlap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10
          && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "intersectsDateInterval:", v10, (_QWORD)v13))
        {
          objc_msgSend(v11, "fc_unionWithDateInterval:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v3, "addObject:", v11, (_QWORD)v13);
        }
        v7 = v11;

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

@end
