@implementation HKInteractiveChartGenericStatFormatter

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int64_t v16;
  HKSelectedRangeData *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t i;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  _BOOL4 v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  __int128 v54;
  unint64_t v55;
  uint64_t v56;
  double v57;
  BOOL v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL8 v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _BOOL8 v70;
  HKSelectedRangeData *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  _BOOL8 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL8 v85;
  void *v86;
  void *v87;
  _BOOL8 v88;
  HKSelectedRangeData *v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL8 v93;
  void *v94;
  void *v95;
  _BOOL8 v96;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  __int128 v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v109;
  id obj;
  _QWORD v111[6];
  uint64_t v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 buf;
  uint64_t v121;
  char v122;
  _BYTE v123[128];
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v106 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v109 = v6;
    objc_msgSend(v5, "firstObject");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartGenericStatFormatter overrideStatFormatterItemOptions](self, "overrideStatFormatterItemOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (objc_msgSend(v5, "count") != 1
      || (v9 & 0x100000) != 0
      || objc_msgSend(v107, "representsRange")
      && (objc_msgSend(v107, "maxValue"), v11 = v10, objc_msgSend(v107, "minValue"), v11 - v12 > 2.22044605e-16))
    {
      if (objc_msgSend(v107, "representsRange"))
        objc_msgSend(v107, "minValue");
      else
        objc_msgSend(v107, "value");
      v24 = v13;
      if (objc_msgSend(v107, "representsRange"))
        objc_msgSend(v107, "maxValue");
      else
        objc_msgSend(v107, "value");
      v26 = v25;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      obj = v5;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
      if (v27)
      {
        v28 = 0;
        v29 = 0;
        v30 = *(_QWORD *)v117;
        v31 = (double)(unint64_t)*MEMORY[0x1E0CB4788];
        v32 = 0.0;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v117 != v30)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
            if (objc_msgSend(v34, "representsRange"))
            {
              objc_msgSend(v34, "minValue");
              if (v35 < v24)
                v24 = v35;
              objc_msgSend(v34, "maxValue");
            }
            else
            {
              objc_msgSend(v34, "value");
              if (v37 < v24)
                v24 = v37;
              objc_msgSend(v34, "value");
            }
            if (v36 >= v26)
              v26 = v36;
            objc_msgSend(v34, "value");
            v39 = v38;
            v40 = objc_msgSend(v34, "recordCount");
            v41 = objc_msgSend(v34, "recordCount");
            objc_msgSend(v34, "statisticsInterval");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "hk_approximateDuration");
            v44 = HKUIEqualDoubles(v43, v31);

            if (v44)
              v29 += objc_msgSend(v34, "recordCount");
            else
              v29 = 0;
            v32 = v32 + v39 * (double)v40;
            v28 += v41;
          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
        }
        while (v27);
        v45 = (double)v28;
      }
      else
      {
        v29 = 0;
        v45 = 0.0;
        v32 = 0.0;
      }

      objc_msgSend(obj, "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "value");
      v48 = v47;
      objc_msgSend(obj, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "value");
      v51 = v50;

      if (v29 < 1)
        v52 = 0.0;
      else
        v52 = v32 / (double)v29;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v109, "count"))
      {
        v53 = v109;
      }
      else
      {

        v53 = &unk_1E9CE9C50;
      }
      v109 = v53;
      if (objc_msgSend(v53, "count"))
      {
        v55 = 0;
        v56 = 0;
        v57 = v48 - v51;
        v58 = v48 - v51 < 0.0;
        if (v48 - v51 >= 0.0)
          v59 = 6;
        else
          v59 = 7;
        v105 = 9;
        v60 = v32 / v45;
        if (v58)
          v61 = -v57;
        else
          v61 = v57;
        *(_QWORD *)&v54 = 138412290;
        v104 = v54;
        do
        {
          objc_msgSend(v109, "objectAtIndexedSubscript:", v55, v104);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v109, "count");
          v64 = objc_msgSend(v62, "integerValue");
          v65 = v63 - 1;
          if (v64 > 2047)
          {
            if (v64 >= 0x8000)
            {
              if (v64 >= 0x80000)
              {
                if (v64 == 0x80000)
                {
                  v96 = v55 == v65;
                  if (objc_msgSend(obj, "count") == 1)
                    v97 = 24;
                  else
                    v97 = 3;
                  objc_msgSend(v107, "unit");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v98, v96, v97, v60);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v99);

                  goto LABEL_111;
                }
                if (v64 == 0x100000)
                {
                  *(_QWORD *)&buf = 0;
                  *((_QWORD *)&buf + 1) = &buf;
                  v121 = 0x2020000000;
                  v122 = 0;
                  v112 = 0;
                  v113 = (double *)&v112;
                  v114 = 0x2020000000;
                  v115 = 0;
                  v111[0] = MEMORY[0x1E0C809B0];
                  v111[1] = 3221225472;
                  v111[2] = __94__HKInteractiveChartGenericStatFormatter__formattedSelectedRangeLabelDataWithChartData_items___block_invoke;
                  v111[3] = &unk_1E9C41340;
                  v111[4] = &buf;
                  v111[5] = &v112;
                  objc_msgSend(obj, "enumerateObjectsUsingBlock:", v111);
                  if (objc_msgSend(obj, "count") == 1)
                  {
                    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
                    {
                      objc_msgSend(v107, "unit");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithMin:max:unit:statisticsType:](self, "_makeSelectedRangeDataWithMin:max:unit:statisticsType:", v81, 9, v24, v26);
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v82);
LABEL_110:

                      _Block_object_dispose(&v112, 8);
                      _Block_object_dispose(&buf, 8);
                      goto LABEL_111;
                    }
LABEL_104:
                    if (v113[3] >= v26)
                    {
                      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("BELOW_MAXIMUM_DEPTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Charon"));
                      v81 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
LABEL_105:
                      v81 = 0;
                    }
                    objc_msgSend(v107, "unit");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithMax:unit:prepend:statisticsType:](self, "_makeSelectedRangeDataWithMax:unit:prepend:statisticsType:", v82, v81, 29, v26);
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "addObject:", v102);

                    goto LABEL_110;
                  }
                  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
                    goto LABEL_104;
                  goto LABEL_105;
                }
              }
              else
              {
                if (v64 == 0x8000)
                {
                  v69 = 18;
                  goto LABEL_95;
                }
                if (v64 == 0x10000)
                {
                  v69 = 19;
LABEL_95:
                  v105 = v69;
                }
              }
            }
            else
            {
              if (v64 < 0x2000)
              {
                if (v64 == 2048)
                {
                  v85 = v55 == v65;
                  objc_msgSend(v107, "unit");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v86, v85, 14, v60);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v87);

                  goto LABEL_111;
                }
                if (v64 != 4096)
                  goto LABEL_111;
                goto LABEL_81;
              }
              if (v64 == 0x2000)
                goto LABEL_81;
              if (v64 == 0x4000)
              {
                v69 = 17;
                goto LABEL_95;
              }
            }
          }
          else
          {
            if (v64 > 31)
            {
              if (v64 > 511)
              {
                if (v64 == 512)
                {
                  v93 = v55 == v65;
                  objc_msgSend(v107, "unit");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v94, v93, 13, v60);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v95);

                }
                else if (v64 == 1024)
                {
                  v78 = v55 == v65;
                  objc_msgSend(v107, "unit");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v79, v78, 12, v60);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v80);

                }
              }
              else if (v64 == 32)
              {
                v88 = v55 == v65;
                v89 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v59);
                objc_msgSend(v107, "unit");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v90, v88, v61);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                -[HKSelectedRangeData setAttributedString:](v89, "setAttributedString:", v91);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                -[HKSelectedRangeData setValueAsNumber:](v89, "setValueAsNumber:", v92);

                objc_msgSend(v14, "addObject:", v89);
              }
              else if (v64 == 128)
              {
                if (v29 < 1)
                {
                  _HKInitializeLogging();
                  v100 = *MEMORY[0x1E0CB5378];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = v104;
                    *(_QWORD *)((char *)&buf + 4) = obj;
                    _os_log_error_impl(&dword_1D7813000, v100, OS_LOG_TYPE_ERROR, "Error formatting daily average with incoming chart data: %@", (uint8_t *)&buf, 0xCu);
                  }
                }
                else
                {
                  v66 = v55 == v65;
                  objc_msgSend(v107, "unit");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v67, v66, 8, v52);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v68);

                }
              }
              goto LABEL_111;
            }
            if (v64 > 7)
            {
              if (v64 != 8)
              {
                if (v64 == 16)
                {
                  v70 = v55 == v65;
                  v71 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 5);
                  objc_msgSend(v107, "unit");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v72, v70, v32);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKSelectedRangeData setAttributedString:](v71, "setAttributedString:", v73);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HKSelectedRangeData setValueAsNumber:](v71, "setValueAsNumber:", v74);

                  objc_msgSend(v14, "addObject:", v71);
                }
                goto LABEL_111;
              }
LABEL_81:
              v75 = v55 == v65;
              objc_msgSend(v107, "unit");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:](self, "_makeSelectedRangeDataWithAvg:unit:showUnit:statisticsType:", v76, v75, 3, v60);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v77);

              goto LABEL_111;
            }
            if (v64 == 2)
            {
              if ((v56 | 1) != 3)
              {
                v56 |= 1uLL;
                goto LABEL_111;
              }
LABEL_91:
              objc_msgSend(v107, "unit");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithMin:max:unit:statisticsType:](self, "_makeSelectedRangeDataWithMin:max:unit:statisticsType:", v83, v105, v24, v26);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v84);

              v56 = 0;
              goto LABEL_111;
            }
            if (v64 == 4)
            {
              if ((v56 & 0xFFFFFFFFFFFFFFFDLL) != 1)
              {
                v56 = 2;
                goto LABEL_111;
              }
              goto LABEL_91;
            }
          }
LABEL_111:

          ++v55;
        }
        while (v55 < objc_msgSend(v109, "count"));
      }
    }
    else
    {
      objc_msgSend(v109, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[HKInteractiveChartGenericStatFormatter mapSingleItemToStatisticsType:](HKInteractiveChartGenericStatFormatter, "mapSingleItemToStatisticsType:", v15);

      if (!v16)
      {
        if (objc_msgSend(v107, "recordCount") <= 1)
          v16 = 0;
        else
          v16 = 3;
      }
      v17 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v16);
      objc_msgSend(v107, "minValue");
      v19 = v18;
      objc_msgSend(v107, "unit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v20, 1, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setAttributedString:](v17, "setAttributedString:", v21);

      -[HKSelectedRangeData setDataType:](v17, "setDataType:", 0);
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v107, "minValue");
      objc_msgSend(v22, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setValueAsNumber:](v17, "setValueAsNumber:", v23);

      v124[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v6 = v109;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __94__HKInteractiveChartGenericStatFormatter__formattedSelectedRangeLabelDataWithChartData_items___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0CB55A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "BOOLValue");
      objc_msgSend(v9, "value");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v7 < *(double *)(v8 + 24))
        v7 = *(double *)(v8 + 24);
      *(double *)(v8 + 24) = v7;
    }

    v4 = v9;
  }

}

- (void)configureFormatterForDisplayType:(id)a3 quantityType:(id)a4 chartRangeProvider:(id)a5 timeScope:(int64_t)a6 context:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_storeStrong((id *)&self->_chartRangeProvider, a5);
  objc_msgSend(v12, "chartingRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "chartStyleForTimeScope:", a6) == 3)
  {

LABEL_4:
    v18 = &unk_1E9CE9C68;
LABEL_5:
    -[HKInteractiveChartGenericStatFormatter setConfiguredStatItems:](self, "setConfiguredStatItems:", v18);
    goto LABEL_6;
  }
  objc_msgSend(v12, "chartingRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "chartStyleForTimeScope:", a6);

  if (v17 == 9)
    goto LABEL_4;
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB5D28]);

  if (v20)
  {
    v18 = &unk_1E9CE9C80;
    goto LABEL_5;
  }
  objc_msgSend(v13, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CB5DB8]);

  if (v22)
  {
    v18 = &unk_1E9CE9C98;
    goto LABEL_5;
  }
  if (objc_msgSend(v12, "displayTypeIdentifier") != 125)
  {
    if (objc_msgSend(v13, "aggregationStyle"))
    {
      if (a6 == 2 || a7 == 1)
        v18 = &unk_1E9CE9D10;
      else
        v18 = &unk_1E9CE9D28;
    }
    else
    {
      if ((unint64_t)a6 > 8)
        goto LABEL_6;
      if (((1 << a6) & 0x1C3) != 0)
      {
        v18 = &unk_1E9CE9CF8;
      }
      else if (((1 << a6) & 0xC) != 0)
      {
        v18 = &unk_1E9CE9CE0;
      }
      else if (a7 == 1)
      {
        v18 = &unk_1E9CE9CB0;
      }
      else
      {
        v18 = &unk_1E9CE9CC8;
      }
    }
    goto LABEL_5;
  }
  v23 = (unint64_t)(a7 == 0) << 6;
  v24 = v23 | 8;
  if ((unint64_t)(a6 - 6) < 3)
    v23 |= 0x10uLL;
  if ((unint64_t)a6 >= 6)
    v25 = v23;
  else
    v25 = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartGenericStatFormatter setConfiguredStatItems:](self, "setConfiguredStatItems:", v27);

LABEL_6:
}

- (id)_makeSelectedRangeDataWithAvg:(double)a3 unit:(id)a4 showUnit:(BOOL)a5 statisticsType:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  HKSelectedRangeData *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", a6);
  -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v10, v7, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSelectedRangeData setAttributedString:](v11, "setAttributedString:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v11, "setValueAsNumber:", v13);

  return v11;
}

- (id)_makeSelectedRangeDataWithMin:(double)a3 max:(double)a4 unit:(id)a5 statisticsType:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKInteractiveChartNumberRangeFormatter *v17;
  void *v18;
  void *v19;
  HKSelectedRangeData *v20;
  HKSelectedRangeData *v21;
  void *v22;
  double v23;
  void *v24;
  unsigned __int8 v26;

  v10 = a5;
  -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v10, 1, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v10, 1, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitStringFromUnit:number:](self, "unitStringFromUnit:number:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitStringFromUnit:number:](self, "unitStringFromUnit:number:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v17 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartNumberRangeFormatter attributedStringForMinimumString:maximumString:minimumUnitString:maximumUnitString:valueFont:formatForChart:resultIsASingleValue:](v17, "attributedStringForMinimumString:maximumString:minimumUnitString:maximumUnitString:valueFont:formatForChart:resultIsASingleValue:", v11, v12, v14, v16, v18, 1, &v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v18) = v26;
  v20 = [HKSelectedRangeData alloc];
  if ((_DWORD)v18)
  {
    v21 = -[HKSelectedRangeData initWithStatisticsType:](v20, "initWithStatisticsType:", 0);
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = a3;
  }
  else
  {
    v21 = -[HKSelectedRangeData initWithStatisticsType:](v20, "initWithStatisticsType:", a6);
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = a4;
  }
  objc_msgSend(v22, "numberWithDouble:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v21, "setValueAsNumber:", v24);

  -[HKSelectedRangeData setAttributedString:](v21, "setAttributedString:", v19);
  return v21;
}

- (id)_makeSelectedRangeDataWithMax:(double)a3 unit:(id)a4 prepend:(id)a5 statisticsType:(int64_t)a6
{
  id v10;
  id v11;
  HKSelectedRangeData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", a6);
  -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v11, 1, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v13);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
    objc_msgSend(v14, "insertAttributedString:atIndex:", v15, 0);

    v13 = v14;
  }
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinAttributedStringsForLocale(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v12, "setAttributedString:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v12, "setValueAsNumber:", v18);

  return v12;
}

- (id)selectedRangeSeparatorString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RANGE_SEPARATOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[HKInteractiveChartGenericStatFormatter overrideStatFormatterItemOptions](self, "overrideStatFormatterItemOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HKInteractiveChartGenericStatFormatter overrideStatFormatterItemOptions](self, "overrideStatFormatterItemOptions");
  else
    -[HKInteractiveChartGenericStatFormatter configuredStatItems](self, "configuredStatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartGenericStatFormatter _formattedSelectedRangeLabelDataWithChartData:items:](self, "_formattedSelectedRangeLabelDataWithChartData:items:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)mapSingleItemToStatisticsType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    v6 = 18;
    v7 = 19;
    v8 = 24;
    if (v5 != 0x80000)
      v8 = 0;
    if (v5 != 0x10000)
      v7 = v8;
    if (v5 != 0x8000)
      v6 = v7;
    v9 = 15;
    v10 = 16;
    v11 = 17;
    if (v5 != 0x4000)
      v11 = 0;
    if (v5 != 0x2000)
      v10 = v11;
    if (v5 != 4096)
      v9 = v10;
    if (v5 < 0x8000)
      v6 = v9;
    v12 = 13;
    v13 = 12;
    v14 = 14;
    if (v5 != 2048)
      v14 = 0;
    if (v5 != 1024)
      v13 = v14;
    if (v5 != 512)
      v12 = v13;
    v15 = 5;
    v16 = 8;
    v17 = 11;
    if (v5 != 256)
      v17 = 0;
    if (v5 != 128)
      v16 = v17;
    if (v5 != 16)
      v15 = v16;
    if (v5 <= 511)
      v12 = v15;
    if (v5 <= 4095)
      v18 = v12;
    else
      v18 = v6;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSArray)overrideStatFormatterItemOptions
{
  return self->_overrideStatFormatterItemOptions;
}

- (void)setOverrideStatFormatterItemOptions:(id)a3
{
  objc_storeStrong((id *)&self->_overrideStatFormatterItemOptions, a3);
}

- (HKInteractiveChartRangeProvider)chartRangeProvider
{
  return self->_chartRangeProvider;
}

- (void)setChartRangeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_chartRangeProvider, a3);
}

- (NSArray)configuredStatItems
{
  return self->_configuredStatItems;
}

- (void)setConfiguredStatItems:(id)a3
{
  objc_storeStrong((id *)&self->_configuredStatItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredStatItems, 0);
  objc_storeStrong((id *)&self->_chartRangeProvider, 0);
  objc_storeStrong((id *)&self->_overrideStatFormatterItemOptions, 0);
}

- (id)_formattedAnnotationForDistributionChartData:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumValue");
  v7 = v6;
  objc_msgSend(v5, "maximumValue");
  v9 = v8;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "minimumValue", (_QWORD)v22);
        if (v16 < v7)
          v7 = v16;
        objc_msgSend(v15, "maximumValue");
        if (v17 >= v9)
          v9 = v17;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(v5, "unit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartGenericStatFormatter _formatMin:max:unit:](self, "_formatMin:max:unit:", v18, v7, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_formatMin:(double)a3 max:(double)a4 unit:(id)a5
{
  return -[HKInteractiveChartGenericStatFormatter _makeSelectedRangeDataWithMin:max:unit:statisticsType:](self, "_makeSelectedRangeDataWithMin:max:unit:statisticsType:", a5, 9, a3, a4);
}

@end
