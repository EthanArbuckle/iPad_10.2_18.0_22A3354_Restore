@implementation _HKChartAxisDimensionTableForTimeOfDay

- (_HKChartAxisDimensionTableForTimeOfDay)initWithStepSizeTable:(HKStepSizeTableEntryDefn *)a3 stepSizeTableSize:(int64_t)a4 displayType:(id)a5 unitController:(id)a6
{
  _HKChartAxisDimensionTableForTimeOfDay *v6;
  HKTimeSinceStartOfDayNumberFormatter *v7;
  HKTimeSinceStartOfDayNumberFormatter *numberFormatter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKChartAxisDimensionTableForTimeOfDay;
  v6 = -[HKChartAxisDimensionUsingTable initWithStepSizeTable:stepSizeTableSize:displayType:unitController:](&v10, sel_initWithStepSizeTable_stepSizeTableSize_displayType_unitController_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_alloc_init(HKTimeSinceStartOfDayNumberFormatter);
    numberFormatter = v6->_numberFormatter;
    v6->_numberFormatter = v7;

  }
  return v6;
}

- (id)endingLabelsFactorOverride
{
  return &unk_1E9CED4D8;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[_HKChartAxisDimensionTableForTimeOfDay numberFormatter](self, "numberFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartAxisDimensionUsingTable displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartAxisDimensionUsingTable unitController](self, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:displayType:unitController:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKTimeSinceStartOfDayNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end
