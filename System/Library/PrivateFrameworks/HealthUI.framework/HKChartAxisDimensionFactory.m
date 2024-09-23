@implementation HKChartAxisDimensionFactory

+ (id)dimensionWithPurpose:(int64_t)a3 displayType:(id)a4 unitController:(id)a5
{
  _HKChartAxisDimensionTableForTimeOfDay *v5;
  id v8;
  id v9;
  _HKChartAxisDimensionTableForTimeOfDay *v10;
  void *v11;
  uint64_t v12;

  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 2:
      v10 = [_HKChartAxisDimensionTableForTimeOfDay alloc];
      v11 = &_timeOfDayStepSizeTable;
      v12 = 8;
      goto LABEL_7;
    case 1:
      v10 = [HKChartAxisDimensionUsingTable alloc];
      v11 = &_feetInchesStepSizeTable;
      v12 = 6;
      goto LABEL_7;
    case 0:
      v10 = [HKChartAxisDimensionUsingTable alloc];
      v11 = &_durationStepSizeTable;
      v12 = 10;
LABEL_7:
      v5 = -[_HKChartAxisDimensionTableForTimeOfDay initWithStepSizeTable:stepSizeTableSize:displayType:unitController:](v10, "initWithStepSizeTable:stepSizeTableSize:displayType:unitController:", v11, v12, v8, v9);
      break;
  }

  return v5;
}

@end
