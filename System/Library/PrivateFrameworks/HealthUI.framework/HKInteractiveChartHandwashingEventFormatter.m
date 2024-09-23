@implementation HKInteractiveChartHandwashingEventFormatter

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HKSelectedRangeData *v24;
  void *v25;
  HKInteractiveChartHandwashingEventFormatter *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v8);
          v11 += objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "recordCount");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("WASHES_NUMBERLESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v16, v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v38 = v7;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v44;
      v21 = 5;
      if (v11 == 1)
        v21 = 0;
      v40 = v21;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v17);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v22), "integerValue");
          if (v23 != 0x40000)
          {
            if (v23 == 0x20000)
            {
              v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v40);
              -[HKSelectedRangeData setDataType:](v24, "setDataType:", 0);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setValueAsNumber:](v24, "setValueAsNumber:", v25);

              v26 = self;
              v27 = (double)v11;
LABEL_25:
              -[HKInteractiveChartDataFormatter formattedStringWithValue:unitString:showUnit:](v26, "formattedStringWithValue:unitString:showUnit:", v41, 1, v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v24, "setAttributedString:", v30);

              objc_msgSend(v14, "addObject:", v24);
              goto LABEL_29;
            }
            v42.receiver = self;
            v42.super_class = (Class)HKInteractiveChartHandwashingEventFormatter;
            -[HKInteractiveChartTimePeriodFormatter formattedSelectedRangeLabelDataWithChartData:items:](&v42, sel_formattedSelectedRangeLabelDataWithChartData_items_, v8, v17);
            v31 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v31);
            goto LABEL_27;
          }
          if (objc_msgSend(v8, "count"))
          {
            v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 8 * (v11 != 1));
            -[HKSelectedRangeData setDataType:](v24, "setDataType:", 0);
            v28 = (double)(v11 / (unint64_t)objc_msgSend(v8, "count"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setValueAsNumber:](v24, "setValueAsNumber:", v29);

            v26 = self;
            v27 = v28;
            goto LABEL_25;
          }
          _HKInitializeLogging();
          v32 = (void *)*MEMORY[0x1E0CB5378];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
          {
            v31 = v32;
            v33 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v52 = v33;
            v53 = 2112;
            v54 = v8;
            v34 = v33;
            _os_log_error_impl(&dword_1D7813000, v31, OS_LOG_TYPE_ERROR, "[%@]: Unable to compute daily average with 0 records: %@", buf, 0x16u);

LABEL_27:
          }
LABEL_29:
          ++v22;
        }
        while (v19 != v22);
        v35 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        v19 = v35;
      }
      while (v35);
    }

    v7 = v38;
    v6 = v39;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

@end
