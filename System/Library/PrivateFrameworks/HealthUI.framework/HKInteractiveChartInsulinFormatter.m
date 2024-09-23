@implementation HKInteractiveChartInsulinFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HKInteractiveChartGenericStatFormatter configuredStatItems](self, "configuredStatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartInsulinFormatter _formattedSelectedRangeLabelDataWithChartData:items:](self, "_formattedSelectedRangeLabelDataWithChartData:items:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  HKSelectedRangeData *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  HKSelectedRangeData *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  HKSelectedRangeData *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  uint64_t v45;
  id obj;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v44 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v54;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v14, "basalValue");
          v12 = v12 + v15;
          objc_msgSend(v14, "bolusValue");
          v11 = v11 + v16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
    }

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v6;
    obj = v6;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v50;
      v45 = *(_QWORD *)v50;
      v47 = v17;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(obj);
          *((_QWORD *)&v23 + 1) = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "integerValue", v43);
          *(_QWORD *)&v23 = *((_QWORD *)&v23 + 1) - 8;
          switch((unint64_t)(v23 >> 3))
          {
            case 0uLL:
              v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 3);
              v25 = (v11 + v12) / (double)(unint64_t)objc_msgSend(v7, "count");
              -[HKSelectedRangeData setDataType:](v24, "setDataType:", 5);
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v24, "setAttributedString:", v26);

              v27 = (void *)MEMORY[0x1E0CB37E8];
              v28 = v25;
              goto LABEL_29;
            case 1uLL:
              v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 5);
              -[HKSelectedRangeData setDataType:](v24, "setDataType:", 5);
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v11 + v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v24, "setAttributedString:", v29);

              v27 = (void *)MEMORY[0x1E0CB37E8];
              v28 = v11 + v12;
              goto LABEL_29;
            case 8uLL:
              if ((unint64_t)objc_msgSend(v7, "count") <= 1)
                v30 = 0;
              else
                v30 = 3;
              v31 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v30);
              -[HKSelectedRangeData setDataType:](v31, "setDataType:", 3);
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v12 / (double)(unint64_t)objc_msgSend(v7, "count"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v31, "setAttributedString:", v32);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 / (double)(unint64_t)objc_msgSend(v7, "count"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setValueAsNumber:](v31, "setValueAsNumber:", v33);

              objc_msgSend(v47, "addObject:", v31);
              v17 = v47;
              v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v30);

              -[HKSelectedRangeData setDataType:](v24, "setDataType:", 4);
              v21 = v45;
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v11 / (double)(unint64_t)objc_msgSend(v7, "count"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v24, "setAttributedString:", v34);

              v35 = (void *)MEMORY[0x1E0CB37E8];
              v28 = v11 / (double)(unint64_t)objc_msgSend(v7, "count");
              v27 = v35;
              goto LABEL_29;
            case 9uLL:
              if ((unint64_t)objc_msgSend(v7, "count") <= 1)
                v36 = 0;
              else
                v36 = 5;
              v37 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v36);
              -[HKSelectedRangeData setDataType:](v37, "setDataType:", 3);
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v12);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v37, "setAttributedString:", v38);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setValueAsNumber:](v37, "setValueAsNumber:", v39);

              objc_msgSend(v47, "addObject:", v37);
              v17 = v47;
              v24 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v36);

              -[HKSelectedRangeData setDataType:](v24, "setDataType:", 4);
              v21 = v45;
              -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v18, 1, v11);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setAttributedString:](v24, "setAttributedString:", v40);

              v27 = (void *)MEMORY[0x1E0CB37E8];
              v28 = v11;
LABEL_29:
              objc_msgSend(v27, "numberWithDouble:", v28);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKSelectedRangeData setValueAsNumber:](v24, "setValueAsNumber:", v41);

              objc_msgSend(v17, "addObject:", v24);
              break;
            default:
              continue;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v20);
    }

    v6 = v43;
    v5 = v44;
  }
  else
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)_formattedStringWithBasalValue:(double)a3 bolusValue:(double)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartInsulinFormatter _formattedStringWithValue:unit:deliveryReason:](self, "_formattedStringWithValue:unit:deliveryReason:", v7, 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHART_COMMA_SEPARATOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:", v11);

  -[HKInteractiveChartInsulinFormatter _formattedStringWithValue:unit:deliveryReason:](self, "_formattedStringWithValue:unit:deliveryReason:", v7, 2, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = v12;
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinAttributedStringsForLocale(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 deliveryReason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[4];
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustedValueForDaemonValue:", v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValue(v35, v12, v13, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedDisplayNameForUnit:value:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = *MEMORY[0x1E0DC1138];
  v17 = v39;
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  v37 = v17;
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithString:attributes:", v34, v22);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v19);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v19);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSULIN_DELIVERY_REASON_%zd"), a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", v26, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithString:attributes:", v29, v19);

  v36[0] = v23;
  v36[1] = v24;
  v36[2] = v25;
  v36[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinAttributedStringsForLocale(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
