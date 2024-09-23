@implementation HKSleepStageChartPoint

- (id)yValuesForSleepAnalysis:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  switch(a3)
  {
    case 0:
      -[HKSleepPeriodChartPoint inBedOffsets](self, "inBedOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      -[HKSleepStageChartPoint asleepUnspecifiedOffsets](self, "asleepUnspecifiedOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[HKSleepStageChartPoint awakeOffsets](self, "awakeOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[HKSleepStageChartPoint asleepCoreOffsets](self, "asleepCoreOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[HKSleepStageChartPoint asleepDeepOffsets](self, "asleepDeepOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[HKSleepStageChartPoint asleepRemOffsets](self, "asleepRemOffsets");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v4 = (void *)v3;
      break;
    default:
      v4 = (void *)MEMORY[0x1E0C9AA60];
      break;
  }
  objc_msgSend(v4, "hk_map:", &__block_literal_global_427);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__HKSleepStageChartPoint_yValuesForSleepAnalysis___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (id)allYValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepStageChartPoint asleepUnspecifiedOffsets](self, "asleepUnspecifiedOffsets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[HKSleepStageChartPoint asleepDeepOffsets](self, "asleepDeepOffsets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[HKSleepStageChartPoint asleepCoreOffsets](self, "asleepCoreOffsets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[HKSleepStageChartPoint asleepRemOffsets](self, "asleepRemOffsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[HKSleepStageChartPoint awakeOffsets](self, "awakeOffsets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[HKSleepPeriodChartPoint inBedOffsets](self, "inBedOffsets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("value"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v11);

  objc_msgSend(v3, "hk_map:", &__block_literal_global_428);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __36__HKSleepStageChartPoint_allYValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HKSleepStageChartPoint_chartPointsForSummaries_context___block_invoke;
  v10[3] = &unk_1E9C43200;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "hk_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

HKSleepStageChartPoint *__58__HKSleepStageChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  char v43;
  void *v44;
  unint64_t v45;
  HKSleepStageChartPoint *v46;
  void *v47;
  void *v48;
  void *v49;
  HKSleepChartPointUserInfo *v50;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v64 = v2;
  objc_msgSend(v2, "periods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v66;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v66 != v53)
          objc_enumerationMutation(obj);
        v55 = v3;
        v4 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v3);
        objc_msgSend(v4, "segments");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");

        if (v6)
        {
          v7 = 0;
          do
          {
            v8 = v7;
            objc_msgSend(v4, "segments");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            ++v7;
            objc_msgSend(v4, "segments");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count") <= v7)
            {
              v13 = 0;
            }
            else
            {
              objc_msgSend(v4, "segments");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (v8)
            {
              objc_msgSend(v4, "segments");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", (v8 - 1));
              v15 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v15 = 0;
            }
            objc_msgSend(v10, "dateInterval");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "startDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "dateInterval");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "startDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = (void *)v15;
            if ((objc_msgSend(v17, "hk_isBeforeDate:", v19) & 1) != 0)
              v20 = 1;
            else
              v20 = objc_msgSend(*(id *)(a1 + 40), "_segment:isAdjacentToSegment:", v10, v15);

            objc_msgSend(v10, "dateInterval");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "endDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "dateInterval");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "endDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "hk_isAfterDate:", v24) & 1) != 0)
              v25 = 1;
            else
              v25 = objc_msgSend(*(id *)(a1 + 40), "_segment:isAdjacentToSegment:", v10, v13);

            objc_msgSend(v64, "dateInterval");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dateInterval");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "intersectionWithDateInterval:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "startDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "dateInterval");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "startDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "timeIntervalSinceDate:", v31);
            v33 = v32;

            objc_msgSend(v28, "duration");
            v35 = v33 + v34;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v36, v20);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v69[0] = v37;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:continuation:](HKSleepPeriodChartPointOffset, "chartPointOffsetWithValue:continuation:", v38, v25);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v69[1] = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "category");
            v41 = v61;
            switch((unint64_t)v61)
            {
              case 0uLL:
                v42 = objc_msgSend(v64, "hasSleepStageData");
                v41 = v56;
                if ((v42 & 1) == 0)
                  goto LABEL_28;
                break;
              case 1uLL:
                goto LABEL_28;
              case 2uLL:
                v43 = objc_msgSend(v64, "hasSleepStageData");
                v41 = v60;
                if ((v43 & 1) == 0)
                  break;
                goto LABEL_28;
              case 3uLL:
                v41 = v58;
                goto LABEL_28;
              case 4uLL:
                v41 = v59;
                goto LABEL_28;
              case 5uLL:
                v41 = v57;
LABEL_28:
                objc_msgSend(v41, "addObjectsFromArray:", v40);
                break;
              default:
                break;
            }

            objc_msgSend(v4, "segments");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "count");

          }
          while (v45 > v7);
        }
        v3 = v55 + 1;
      }
      while (v55 + 1 != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v54);
  }

  v46 = objc_alloc_init(HKSleepStageChartPoint);
  -[HKSleepStageChartPoint setAwakeOffsets:](v46, "setAwakeOffsets:", v60);
  -[HKSleepStageChartPoint setAsleepUnspecifiedOffsets:](v46, "setAsleepUnspecifiedOffsets:", v61);
  -[HKSleepStageChartPoint setAsleepDeepOffsets:](v46, "setAsleepDeepOffsets:", v59);
  -[HKSleepStageChartPoint setAsleepCoreOffsets:](v46, "setAsleepCoreOffsets:", v58);
  -[HKSleepStageChartPoint setAsleepRemOffsets:](v46, "setAsleepRemOffsets:", v57);
  -[HKSleepPeriodChartPoint setInBedOffsets:](v46, "setInBedOffsets:", v56);
  +[HKSleepUtilities sleepDaySummaryNoonAlignedXValue:](HKSleepUtilities, "sleepDaySummaryNoonAlignedXValue:", v64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setXValue:](v46, "setXValue:", v47);

  -[HKSleepPeriodChartPoint setHighlighted:](v46, "setHighlighted:", 0);
  objc_msgSend(v64, "hk_bedtimeGoalValue");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setLowerGoal:](v46, "setLowerGoal:", v48);

  objc_msgSend(v64, "hk_wakeTimeGoalValue");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodChartPoint setUpperGoal:](v46, "setUpperGoal:", v49);

  v50 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", objc_msgSend(*(id *)(a1 + 32), "chartType"), v64);
  -[HKSleepPeriodChartPoint setUserInfo:](v46, "setUserInfo:", v50);

  return v46;
}

+ (BOOL)_segment:(id)a3 isAdjacentToSegment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "category") && objc_msgSend(v7, "category"))
    {
      objc_msgSend(v5, "dateInterval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateInterval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToDate:", v12) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(v5, "dateInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dateInterval");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "isEqualToDate:", v15);

      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)awakeOffsets
{
  return self->_awakeOffsets;
}

- (void)setAwakeOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_awakeOffsets, a3);
}

- (NSArray)asleepUnspecifiedOffsets
{
  return self->_asleepUnspecifiedOffsets;
}

- (void)setAsleepUnspecifiedOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_asleepUnspecifiedOffsets, a3);
}

- (NSArray)asleepDeepOffsets
{
  return self->_asleepDeepOffsets;
}

- (void)setAsleepDeepOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_asleepDeepOffsets, a3);
}

- (NSArray)asleepCoreOffsets
{
  return self->_asleepCoreOffsets;
}

- (void)setAsleepCoreOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_asleepCoreOffsets, a3);
}

- (NSArray)asleepRemOffsets
{
  return self->_asleepRemOffsets;
}

- (void)setAsleepRemOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_asleepRemOffsets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asleepRemOffsets, 0);
  objc_storeStrong((id *)&self->_asleepCoreOffsets, 0);
  objc_storeStrong((id *)&self->_asleepDeepOffsets, 0);
  objc_storeStrong((id *)&self->_asleepUnspecifiedOffsets, 0);
  objc_storeStrong((id *)&self->_awakeOffsets, 0);
}

@end
