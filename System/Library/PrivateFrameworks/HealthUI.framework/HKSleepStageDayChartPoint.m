@implementation HKSleepStageDayChartPoint

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (id)allYValues
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKSleepStageDayChartPoint;
  -[HKSleepStageDayChartPoint description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %@->%@ %@ }"), v4, self->_startDate, self->_endDate, self->_yValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  void *v25;
  HKSleepStageDayChartPoint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HKSleepChartPointUserInfo *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v73 = a4;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canonicalSize");
  v8 = v7;

  v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v5;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v88;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v88 != v59)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E0C99D68];
        v12 = objc_msgSend(v10, "morningIndex");
        objc_msgSend(v10, "calendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hk_dateOnDayIndex:atHour:calendar:", v12, 0, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v14, v8);
        objc_msgSend(v10, "hkui_somnogramChartDateInterval");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
        HKCategoryValueSleepAnalysisAsleepValues();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithArray:", v17);

        objc_msgSend(v18, "addObject:", &unk_1E9CEC7E8);
        objc_msgSend(v10, "firstStartDateMatchingSleepValues:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v78 = v10;
        objc_msgSend(v10, "lastEndDateMatchingSleepValues:", v18);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v70 = 0;
        v64 = (void *)v14;
        v65 = v9;
        v63 = v18;
        if (v19 && v20)
        {
          +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v20);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v61 = v21;
        v62 = (void *)v19;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v10, "periods");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v84;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v84 != v67)
                objc_enumerationMutation(v66);
              v69 = v22;
              v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v22);
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              objc_msgSend(v23, "segments");
              v71 = (id)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
              if (v77)
              {
                v76 = *(_QWORD *)v80;
                do
                {
                  for (i = 0; i != v77; ++i)
                  {
                    if (*(_QWORD *)v80 != v76)
                      objc_enumerationMutation(v71);
                    v25 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                    v26 = objc_alloc_init(HKSleepStageDayChartPoint);
                    objc_msgSend(v25, "dateInterval");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "startDate");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "hkui_dateNormalizedFromDateInterval:toDateInterval:", v74, v75);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKSleepStageDayChartPoint setStartDate:](v26, "setStartDate:", v29);

                    objc_msgSend(v25, "dateInterval");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "endDate");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "hkui_dateNormalizedFromDateInterval:toDateInterval:", v74, v75);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKSleepStageDayChartPoint setEndDate:](v26, "setEndDate:", v32);

                    v33 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(v73, "chartType"), v78);
                    -[HKSleepStageDayChartPoint setUserInfo:](v26, "setUserInfo:", v33);

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v25, "category"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = HKSleepChartPointFormatterOptionsForSleepAnalysis(v34);
                    -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setAnnotationOptions:", v35);

                    v37 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v25, "dateInterval");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "duration");
                    objc_msgSend(v37, "numberWithDouble:");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "setAnnotationOverrideDuration:", v39);

                    objc_msgSend(v25, "dateInterval");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "startDate");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "dateInterval");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "endDate");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v42, v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setAnnotationOverrideDateRange:", v45);

                    -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "setAnnotationOptions:", objc_msgSend(v47, "annotationOptions") | 0x40);

                    -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setCurrentValueViewOptions:", objc_msgSend(v48, "currentValueViewOptions") | 0x40);

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HKSleepSomnogramStageForSleepAnalysis(objc_msgSend(v25, "category")));
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HKSleepStageDayChartPoint setYValue:](v26, "setYValue:", v49);

                    v50 = objc_msgSend(v25, "category");
                    if (!v50)
                    {
                      if ((objc_msgSend(v78, "hasSleepStageData") & 1) != 0)
                        goto LABEL_30;
                      v51 = 2;
LABEL_28:
                      -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "setAnnotationOverrideDuration:", 0);

                      -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "setAnnotationOverrideDateRange:", v70);

                      -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setAnnotationOptions:", objc_msgSend(v54, "annotationOptions") | v51);

                      -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v55, "setAnnotationOptions:", objc_msgSend(v55, "annotationOptions") & 0xFFFFFFFFFFFFFFBFLL);

                      -[HKSleepStageDayChartPoint userInfo](v26, "userInfo");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "setCurrentValueViewOptions:", objc_msgSend(v56, "currentValueViewOptions") & 0xFFFFFFFFFFFFFFBFLL);

LABEL_29:
                      objc_msgSend(v72, "addObject:", v26);
                      goto LABEL_30;
                    }
                    if (v50 == 1)
                    {
                      if ((objc_msgSend(v78, "hasSleepStageData") & 1) == 0)
                      {
                        v51 = 1;
                        goto LABEL_28;
                      }
                      goto LABEL_29;
                    }
                    if (v50 != 2 || (objc_msgSend(v78, "hasSleepStageData") & 1) != 0)
                      goto LABEL_29;
LABEL_30:

                  }
                  v77 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
                }
                while (v77);
              }

              v22 = v69 + 1;
            }
            while (v69 + 1 != v68);
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
          }
          while (v68);
        }

        v9 = v65 + 1;
      }
      while (v65 + 1 != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v60);
  }

  return v72;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_storeStrong((id *)&self->_yValue, a3);
}

- (HKSleepChartPointUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
