@implementation _HKSleepDurationAverageFormatter

- (_HKSleepDurationAverageFormatter)init
{
  _HKSleepDurationAverageFormatter *v2;
  _HKSleepDurationAverageFormatter *v3;
  NSArray *rangeDataForTimeInBedAverage;
  NSArray *v5;
  NSArray *rangeDataForTimeAsleepAverage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKSleepDurationAverageFormatter;
  v2 = -[_HKSleepDurationAverageFormatter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    rangeDataForTimeInBedAverage = v2->_rangeDataForTimeInBedAverage;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_rangeDataForTimeInBedAverage = (NSArray *)MEMORY[0x1E0C9AA60];

    rangeDataForTimeAsleepAverage = v3->_rangeDataForTimeAsleepAverage;
    v3->_rangeDataForTimeAsleepAverage = v5;

  }
  return v3;
}

- (void)setCurrentVisibleAverageNumber:(id)a3 isTimeInBed:(BOOL)a4 isHighlighted:(BOOL)a5 useAverageCopy:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  HKSelectedRangeData *v12;
  HKSelectedRangeData *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v6 = a6;
  v8 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    if (v6)
      v11 = 3;
    else
      v11 = 0;
    v12 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v11);
    v13 = v12;
    if (v8)
      v14 = 9;
    else
      v14 = 10;
    -[HKSelectedRangeData setDataType:](v12, "setDataType:", v14);
    -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKTimePeriodStringWithFonts(v15, v16, v10, 0x1CuLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSelectedRangeData setAttributedString:](v13, "setAttributedString:", v17);
    -[HKSelectedRangeData setValueAsNumber:](v13, "setValueAsNumber:", v10);
    v18 = 0;
    if (!v8)
      v18 = _HKCategoryValueSleepAnalysisDefaultAsleepValue();
    if (a5)
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", v18);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveColorForSleepAnalysis:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setPrefixColor:](v13, "setPrefixColor:", v19);

    v21[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepDurationAverageFormatter _setRangeData:isTimeInBed:](self, "_setRangeData:isTimeInBed:", v20, v8);

  }
  else
  {
    -[_HKSleepDurationAverageFormatter _setRangeData:isTimeInBed:](self, "_setRangeData:isTimeInBed:", MEMORY[0x1E0C9AA60], v8);
  }

}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v5, "annotationOptions") & 2) != 0)
  {
    -[_HKSleepDurationAverageFormatter rangeDataForTimeAsleepAverage](self, "rangeDataForTimeAsleepAverage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_HKSleepDurationAverageFormatter rangeDataForTimeInBedAverage](self, "rangeDataForTimeInBedAverage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)_setRangeData:(id)a3 isTimeInBed:(BOOL)a4
{
  if (a4)
    -[_HKSleepDurationAverageFormatter setRangeDataForTimeInBedAverage:](self, "setRangeDataForTimeInBedAverage:", a3);
  else
    -[_HKSleepDurationAverageFormatter setRangeDataForTimeAsleepAverage:](self, "setRangeDataForTimeAsleepAverage:", a3);
}

- (NSArray)rangeDataForTimeInBedAverage
{
  return self->_rangeDataForTimeInBedAverage;
}

- (void)setRangeDataForTimeInBedAverage:(id)a3
{
  objc_storeStrong((id *)&self->_rangeDataForTimeInBedAverage, a3);
}

- (NSArray)rangeDataForTimeAsleepAverage
{
  return self->_rangeDataForTimeAsleepAverage;
}

- (void)setRangeDataForTimeAsleepAverage:(id)a3
{
  objc_storeStrong((id *)&self->_rangeDataForTimeAsleepAverage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeDataForTimeAsleepAverage, 0);
  objc_storeStrong((id *)&self->_rangeDataForTimeInBedAverage, 0);
}

@end
