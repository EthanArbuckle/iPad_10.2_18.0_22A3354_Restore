@implementation HKInteractiveChartAnnotationFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HKSelectedRangeData *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
          v13 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
          v14 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v12, "annotation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
          -[HKSelectedRangeData setAttributedString:](v13, "setAttributedString:", v16);

          -[HKSelectedRangeData setValueAsNumber:](v13, "setValueAsNumber:", 0);
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v5 = v18;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

@end
