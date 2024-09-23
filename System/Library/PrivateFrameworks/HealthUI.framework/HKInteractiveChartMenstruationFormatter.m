@implementation HKInteractiveChartMenstruationFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKSelectedRangeData *v9;
  HKSelectedRangeData *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HKSelectedRangeData **v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  char v24;
  HKSelectedRangeData *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  HKSelectedRangeData *v33;
  HKSelectedRangeData *v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_enumeratedValueLabels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v6, "count") == 1)
    {
      v9 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
      objc_msgSend(v6, "firstObject");
      v10 = (HKSelectedRangeData *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartCategoryValueFormatter _formattedStringWithValue:useColorAttributes:](self, "_formattedStringWithValue:useColorAttributes:", -[HKSelectedRangeData value](v10, "value"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setAttributedString:](v9, "setAttributedString:", v11);

      if (-[HKSelectedRangeData startOfCycle](v10, "startOfCycle"))
        v12 = 12;
      else
        v12 = 11;
      -[HKSelectedRangeData setDataType:](v9, "setDataType:", v12);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSelectedRangeData value](v10, "value"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setValueAsNumber:](v9, "setValueAsNumber:", v13);

      v36[0] = v9;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = (HKSelectedRangeData **)v36;
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = 0;
        v22 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v17);
            v24 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "startOfCycle", (_QWORD)v28);
            v20 |= v24;
            v21 |= v24 ^ 1;
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }

      -[HKInteractiveChartCategoryValueFormatter _formattedStringWithCount:](self, "_formattedStringWithCount:", objc_msgSend(v17, "count"));
      v9 = (HKSelectedRangeData *)objc_claimAutoreleasedReturnValue();
      if ((v21 & 1) == 0 || (v20 & 1) != 0)
      {
        v10 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
        -[HKSelectedRangeData setAttributedString:](v10, "setAttributedString:", v9);
        if (v21 & 1 | ((v20 & 1) == 0))
        {
          -[HKSelectedRangeData setDataType:](v10, "setDataType:", 11);
          -[HKSelectedRangeData setValueAsNumber:](v10, "setValueAsNumber:", 0);
          v25 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
          -[HKSelectedRangeData setDataType:](v25, "setDataType:", 12);
          -[HKInteractiveChartCategoryValueFormatter _formattedStringWithText:](self, "_formattedStringWithText:", CFSTR(" "));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSelectedRangeData setAttributedString:](v25, "setAttributedString:", v26);

          -[HKSelectedRangeData setValueAsNumber:](v25, "setValueAsNumber:", 0);
          v32[0] = v10;
          v32[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
          goto LABEL_27;
        }
        -[HKSelectedRangeData setDataType:](v10, "setDataType:", 12);
        -[HKSelectedRangeData setValueAsNumber:](v10, "setValueAsNumber:", 0);
        v33 = v10;
        v14 = (void *)MEMORY[0x1E0C99D20];
        v15 = &v33;
      }
      else
      {
        v10 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
        -[HKSelectedRangeData setAttributedString:](v10, "setAttributedString:", v9);
        -[HKSelectedRangeData setDataType:](v10, "setDataType:", 11);
        -[HKSelectedRangeData setValueAsNumber:](v10, "setValueAsNumber:", 0);
        v34 = v10;
        v14 = (void *)MEMORY[0x1E0C99D20];
        v15 = &v34;
      }
    }
    objc_msgSend(v14, "arrayWithObjects:count:", v15, 1, (_QWORD)v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_27:

  return v16;
}

@end
