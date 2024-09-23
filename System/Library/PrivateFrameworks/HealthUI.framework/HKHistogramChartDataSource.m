@implementation HKHistogramChartDataSource

- (id)_initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 xAxisRange:(id)a7 yAxisRange:(id)a8 binMode:(unint64_t)a9 binCalculation:(unint64_t)a10 binWidth:(double)a11 numberOfBins:(unint64_t)a12 dateBasedBinModeConfig:(unint64_t)a13
{
  id v21;
  id v22;
  id v23;
  HKHistogramChartDataSource *v24;
  HKHistogramChartDataSource *v25;
  HKGraphSeriesDataBlock *dataBlock;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HKHistogramChartDataSource;
  v24 = -[HKGraphSeriesDataSource init](&v31, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_quantityIdentifier, a3);
    objc_storeStrong((id *)&v25->_healthStore, a4);
    objc_storeStrong((id *)&v25->_unitPreferenceController, a5);
    objc_storeStrong((id *)&v25->_predicate, a6);
    objc_storeStrong((id *)&v25->_xAxisRange, a7);
    objc_storeStrong((id *)&v25->_yAxisRange, a8);
    v25->_binningMode = a9;
    v25->_binCalculation = a10;
    v25->_binWidth = (unint64_t)a11;
    v25->_numberOfBins = a12;
    v25->_dateBasedBinModeConfig = a13;
    v25->_didExecuteQuery = 0;
    dataBlock = v25->_dataBlock;
    v25->_dataBlock = 0;

  }
  return v25;
}

- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binWidth:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HKHistogramChartDataSource *v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEABC8, &unk_1E9CEABE0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKHistogramChartDataSource _initWithQuantityTypeIdentifier:healthStore:unitPreferenceController:predicate:xAxisRange:yAxisRange:binMode:binCalculation:binWidth:numberOfBins:dateBasedBinModeConfig:](self, "_initWithQuantityTypeIdentifier:healthStore:unitPreferenceController:predicate:xAxisRange:yAxisRange:binMode:binCalculation:binWidth:numberOfBins:dateBasedBinModeConfig:", v18, v17, v16, v15, v19, v14, a8, 0, 1, 0, -1);

  return v20;
}

- (HKHistogramChartDataSource)initWithQuantityTypeIdentifier:(id)a3 healthStore:(id)a4 unitPreferenceController:(id)a5 predicate:(id)a6 yAxisRange:(id)a7 binCalculation:(unint64_t)a8 dateBasedBinModeConfig:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  HKHistogramChartDataSource *v22;

  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEABC8, &unk_1E9CEABE0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 24;
  if (!a9)
    v21 = 7;
  v22 = -[HKHistogramChartDataSource _initWithQuantityTypeIdentifier:healthStore:unitPreferenceController:predicate:xAxisRange:yAxisRange:binMode:binCalculation:binWidth:numberOfBins:dateBasedBinModeConfig:](self, "_initWithQuantityTypeIdentifier:healthStore:unitPreferenceController:predicate:xAxisRange:yAxisRange:binMode:binCalculation:binWidth:numberOfBins:dateBasedBinModeConfig:", v19, v18, v17, v16, v20, v15, 1.0, 1, a8, v21, a9);

  return v22;
}

- (HKQuantityType)quantityType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB6978];
  -[HKHistogramChartDataSource quantityIdentifier](self, "quantityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityTypeForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantityType *)v4;
}

- (HKUnit)unit
{
  void *v3;
  void *v4;
  void *v5;

  -[HKHistogramChartDataSource unitPreferenceController](self, "unitPreferenceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource _displayType](self, "_displayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitForDisplayType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v5;
}

- (NSArray)sortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)xAxisStringForLocation:(id)a3
{
  id v4;
  __CFString *v5;
  void (**v6)(_QWORD, _QWORD);
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[HKHistogramChartDataSource xAxisStringForLocation](self, "xAxisStringForLocation");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKHistogramChartDataSource xAxisStringForLocation](self, "xAxisStringForLocation");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[HKHistogramChartDataSource binningMode](self, "binningMode");
    if (v8 == 1)
    {
      v15 = -[HKHistogramChartDataSource dateBasedBinModeConfig](self, "dateBasedBinModeConfig");
      if (v15 == 1)
      {
        -[HKHistogramChartDataSource _hourXAxisStringForLocation:](self, "_hourXAxisStringForLocation:", v4);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v15)
          goto LABEL_3;
        -[HKHistogramChartDataSource _dayXAxisStringForLocation:](self, "_dayXAxisStringForLocation:", v4);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (__CFString *)v16;
      goto LABEL_3;
    }
    if (!v8)
    {
      v9 = objc_msgSend(v4, "integerValue");
      if (v9 < 0
        || (v10 = v9,
            -[HKHistogramChartDataSource quantityValueRanges](self, "quantityValueRanges"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            v10 >= v12))
      {
        v5 = &stru_1E9C4C428;
      }
      else
      {
        -[HKHistogramChartDataSource quantityValueRanges](self, "quantityValueRanges");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), objc_msgSend(v14, "firstIndex"), objc_msgSend(v14, "lastIndex"));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
LABEL_3:

  return v5;
}

- (void)fetchData
{
  void *v3;
  void *v4;

  if (!-[HKHistogramChartDataSource didExecuteQuery](self, "didExecuteQuery"))
  {
    -[HKHistogramChartDataSource healthStore](self, "healthStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartDataSource _query](self, "_query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeQuery:", v4);

    -[HKHistogramChartDataSource setDidExecuteQuery:](self, "setDidExecuteQuery:", 1);
  }
}

- (void)didCompleteFetch
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HKHistogramChartDataSource_didCompleteFetch__block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__HKHistogramChartDataSource_didCompleteFetch__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fetchObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCompleteFetchForDataSource:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceDidUpdateCache:", *(_QWORD *)(a1 + 32));

}

- (id)buildGraphSeriesDataBlockFromSamples:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HKValueRange *v15;
  HKValueRange *v16;
  void *v17;
  HKValueRange *v18;
  HKValueRange *xAxisRange;

  v5 = a3;
  -[HKHistogramChartDataSource dataBlockBuilder](self, "dataBlockBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKHistogramChartDataSource dataBlockBuilder](self, "dataBlockBuilder");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartDataSource unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v7)[2](v7, v5, v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v3 = (void *)v9;
    goto LABEL_4;
  }
  v11 = -[HKHistogramChartDataSource binningMode](self, "binningMode");
  if (v11 == 1)
  {
    -[HKHistogramChartDataSource buildBinsWithSamples:](self, "buildBinsWithSamples:", v5);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartDataSource _dateBasedXValueRangeForConfig:](self, "_dateBasedXValueRangeForConfig:", -[HKHistogramChartDataSource dateBasedBinModeConfig](self, "dateBasedBinModeConfig"));
    v18 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
    xAxisRange = self->_xAxisRange;
    self->_xAxisRange = v18;

    -[HKHistogramChartDataSource calculateBinValueForBins:usingCalculation:](self, "calculateBinValueForBins:usingCalculation:", v7, -[HKHistogramChartDataSource binCalculation](self, "binCalculation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartDataSource buildGraphSeriesDataBlockWithCalculatedBinValues:](self, "buildGraphSeriesDataBlockWithCalculatedBinValues:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (v11)
    goto LABEL_5;
  -[HKHistogramChartDataSource _samplesSortedByQuantity:](self, "_samplesSortedByQuantity:", v5);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource _buildQuantityValueRangesFromSortedSamples:](self, "_buildQuantityValueRangesFromSortedSamples:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource setQuantityValueRanges:](self, "setQuantityValueRanges:", v12);

  -[HKHistogramChartDataSource quantityValueRanges](self, "quantityValueRanges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource setNumberOfBins:](self, "setNumberOfBins:", objc_msgSend(v13, "count"));

  -[HKHistogramChartDataSource buildBinsWithSamples:](self, "buildBinsWithSamples:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEABF8, v14);
  v15 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  v16 = self->_xAxisRange;
  self->_xAxisRange = v15;

  -[HKHistogramChartDataSource calculateBinValueForBins:usingCalculation:](self, "calculateBinValueForBins:usingCalculation:", v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource buildGraphSeriesDataBlockWithCalculatedBinValues:](self, "buildGraphSeriesDataBlockWithCalculatedBinValues:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
LABEL_5:

  return v3;
}

- (id)buildBinsWithSamples:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = -[HKHistogramChartDataSource numberOfBins](self, "numberOfBins");
  __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke(v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke_2;
  v11[3] = &unk_1E9C3F9A0;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

id __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *i;
  HKHistogramChartDataSourceBin *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a2);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v2; --v2)
  {
    v4 = objc_alloc_init(HKHistogramChartDataSourceBin);
    objc_msgSend(i, "addObject:", v4);

  }
  return i;
}

void __51__HKHistogramChartDataSource_buildBinsWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v3, "_binIndexForSample:", v4));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addValue:", v9);

}

- (id)calculateBinValueForBins:(id)a3 usingCalculation:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HKHistogramChartDataSource_calculateBinValueForBins_usingCalculation___block_invoke;
  v12[3] = &unk_1E9C3F9C8;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __72__HKHistogramChartDataSource_calculateBinValueForBins_usingCalculation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  switch(objc_msgSend(*(id *)(a1 + 32), "binCalculation"))
  {
    case 0:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v8, "sumValue");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v8, "averageValue");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v8, "minimumValue");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v8, "maximumValue");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v6, a3);

      break;
    default:
      break;
  }

}

- (id)buildGraphSeriesDataBlockWithCalculatedBinValues:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  HKGraphSeriesDataBlock *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HKHistogramChartDataSource_buildGraphSeriesDataBlockWithCalculatedBinValues___block_invoke;
  v9[3] = &unk_1E9C3F9F0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v7, "setChartPoints:", v6);

  return v7;
}

void __79__HKHistogramChartDataSource_buildGraphSeriesDataBlockWithCalculatedBinValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  HKHistogramChartPoint *v6;
  void *v7;
  HKHistogramChartPoint *v8;

  v5 = a2;
  v6 = [HKHistogramChartPoint alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKHistogramChartPoint initWithXValue:yValue:](v6, "initWithXValue:yValue:", v7, v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

- (id)_buildQuantityValueRangesFromSortedSamples:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource unit](self, "unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  objc_msgSend(v7, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "quantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource unit](self, "unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v14);
  objc_msgSend(v12, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  while (v11 <= v16)
  {
    v18 = -[HKHistogramChartDataSource binWidth](self, "binWidth");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);
    v11 += -[HKHistogramChartDataSource binWidth](self, "binWidth");

  }
  return v17;
}

- (id)_query
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  -[HKHistogramChartDataSource quantityType](self, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__HKHistogramChartDataSource__query__block_invoke;
  v9[3] = &unk_1E9C3FA18;
  v9[4] = self;
  v7 = (void *)objc_msgSend(v3, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v4, v5, 0, v6, v9);

  return v7;
}

uint64_t __36__HKHistogramChartDataSource__query__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSamplesStartDate:", v6);

  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSamplesEndDate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "buildGraphSeriesDataBlockFromSamples:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDataBlock:", v9);
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteFetch");
}

- (id)_samplesSortedByQuantity:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_267);
}

uint64_t __55__HKHistogramChartDataSource__samplesSortedByQuantity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "quantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hk_isLessThanQuantity:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = -1;
  }
  else
  {
    objc_msgSend(v4, "quantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quantity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "hk_isGreaterThanQuantity:", v11);

    v9 = v12;
  }

  return v9;
}

- (id)_displayType
{
  void *v3;
  void *v4;
  void *v5;

  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", self->_healthStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource quantityType](self, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeForObjectType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_binIndexForSample:(id)a3
{
  unint64_t v3;
  id v5;
  unint64_t v6;
  unint64_t v7;

  v5 = a3;
  v6 = -[HKHistogramChartDataSource binningMode](self, "binningMode");
  if (v6 == 1)
  {
    v7 = -[HKHistogramChartDataSource _dateBasedBinIndexForSample:](self, "_dateBasedBinIndexForSample:", v5);
    goto LABEL_5;
  }
  if (!v6)
  {
    v7 = -[HKHistogramChartDataSource _normalBinIndexForSample:](self, "_normalBinIndexForSample:", v5);
LABEL_5:
    v3 = v7;
  }

  return v3;
}

- (unint64_t)_normalBinIndexForSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartDataSource unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[HKHistogramChartDataSource quantityValueRanges](self, "quantityValueRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HKHistogramChartDataSource__normalBinIndexForSample___block_invoke;
  v12[3] = &unk_1E9C3FA80;
  v12[4] = &v13;
  v12[5] = vcvtad_u64_f64(v8);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __55__HKHistogramChartDataSource__normalBinIndexForSample___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsIndex:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  *(_OWORD *)&retstr->index = xmmword_1D7B80E90;
  retstr->resolution = 0;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  id v6;
  HKGraphSeriesDataBlock *v7;
  void *v8;

  v6 = a4;
  if (a3->index
    || (-[HKHistogramChartDataSource dataBlock](self, "dataBlock"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v7 = objc_alloc_init(HKGraphSeriesDataBlock);
    -[HKGraphSeriesDataBlock setChartPoints:](v7, "setChartPoints:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[HKHistogramChartDataSource dataBlock](self, "dataBlock");
    v7 = (HKGraphSeriesDataBlock *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)_dateBasedBinIndexForSample:(id)a3
{
  unint64_t v3;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = -[HKHistogramChartDataSource dateBasedBinModeConfig](self, "dateBasedBinModeConfig");
  if (v6 == 1)
  {
    -[HKHistogramChartDataSource _hourOfTheDayFormatter](self, "_hourOfTheDayFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "integerValue");
    goto LABEL_5;
  }
  if (!v6)
  {
    -[HKHistogramChartDataSource _dayNameFormatter](self, "_dayNameFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[HKHistogramChartDataSource _dayIndexForDayName:](self, "_dayIndexForDayName:", v9);
LABEL_5:
    v3 = v10;

  }
  return v3;
}

- (id)_dateBasedXValueRangeForConfig:(unint64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_hoursInDayXValueRange");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend((id)objc_opt_class(), "_daysInWeekXValueRange");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

+ (id)_hoursInDayXValueRange
{
  return +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEABF8, &unk_1E9CEAC10);
}

+ (id)_daysInWeekXValueRange
{
  return +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEABF8, &unk_1E9CEAC28);
}

- (id)_dayXAxisStringForLocation:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[HKHistogramChartDataSource _dayNameFromDayIndex:](self, "_dayNameFromDayIndex:", objc_msgSend(a3, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", 2);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E9C4C428;
  v6 = v4;

  return v6;
}

- (id)_dayNameFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_dayNameFormatter_formatter;
  if (!_dayNameFormatter_formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_dayNameFormatter_formatter;
    _dayNameFormatter_formatter = (uint64_t)v3;

    objc_msgSend((id)_dayNameFormatter_formatter, "setDateFormat:", CFSTR("EEEE"));
    v2 = (void *)_dayNameFormatter_formatter;
  }
  return v2;
}

- (id)_daysOfTheWeek
{
  void *v2;

  v2 = (void *)_daysOfTheWeek_daysOfTheWeek;
  if (!_daysOfTheWeek_daysOfTheWeek)
  {
    _daysOfTheWeek_daysOfTheWeek = (uint64_t)&unk_1E9CE9BD8;

    v2 = &unk_1E9CE9BD8;
  }
  return v2;
}

- (unint64_t)_dayIndexForDayName:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[HKHistogramChartDataSource _daysOfTheWeek](self, "_daysOfTheWeek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)_dayNameFromDayIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[HKHistogramChartDataSource _daysOfTheWeek](self, "_daysOfTheWeek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[HKHistogramChartDataSource _daysOfTheWeek](self, "_daysOfTheWeek");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_hourXAxisStringForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 < 0)
  {
    v8 = 0;
  }
  else
  {
    v6 = v5;
    v7 = -[HKHistogramChartDataSource numberOfBins](self, "numberOfBins");
    v8 = 0;
    if ((v6 & 3) == 0 && v6 < v7)
    {
      objc_msgSend(v4, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_hourOfTheDayFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_hourOfTheDayFormatter_formatter;
  if (!_hourOfTheDayFormatter_formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_hourOfTheDayFormatter_formatter;
    _hourOfTheDayFormatter_formatter = (uint64_t)v3;

    objc_msgSend((id)_hourOfTheDayFormatter_formatter, "setDateFormat:", CFSTR("HH"));
    v2 = (void *)_hourOfTheDayFormatter_formatter;
  }
  return v2;
}

- (id)_hourNameFromHourIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = 0;
  if (a3 <= 0x17 && (a3 & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (HKHistogramChartDataSourceDataFetchObserver)fetchObserver
{
  return (HKHistogramChartDataSourceDataFetchObserver *)objc_loadWeakRetained((id *)&self->_fetchObserver);
}

- (void)setFetchObserver:(id)a3
{
  objc_storeWeak((id *)&self->_fetchObserver, a3);
}

- (unint64_t)binningMode
{
  return self->_binningMode;
}

- (void)setBinningMode:(unint64_t)a3
{
  self->_binningMode = a3;
}

- (unint64_t)binCalculation
{
  return self->_binCalculation;
}

- (void)setBinCalculation:(unint64_t)a3
{
  self->_binCalculation = a3;
}

- (unint64_t)dateBasedBinModeConfig
{
  return self->_dateBasedBinModeConfig;
}

- (void)setDateBasedBinModeConfig:(unint64_t)a3
{
  self->_dateBasedBinModeConfig = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (NSString)quantityIdentifier
{
  return self->_quantityIdentifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (HKGraphSeriesDataBlock)dataBlock
{
  return self->_dataBlock;
}

- (void)setDataBlock:(id)a3
{
  objc_storeStrong((id *)&self->_dataBlock, a3);
}

- (NSDate)samplesStartDate
{
  return self->_samplesStartDate;
}

- (void)setSamplesStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_samplesStartDate, a3);
}

- (NSDate)samplesEndDate
{
  return self->_samplesEndDate;
}

- (void)setSamplesEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_samplesEndDate, a3);
}

- (HKValueRange)xAxisRange
{
  return self->_xAxisRange;
}

- (HKValueRange)yAxisRange
{
  return self->_yAxisRange;
}

- (unint64_t)numberOfBins
{
  return self->_numberOfBins;
}

- (void)setNumberOfBins:(unint64_t)a3
{
  self->_numberOfBins = a3;
}

- (unint64_t)binWidth
{
  return self->_binWidth;
}

- (void)setBinWidth:(unint64_t)a3
{
  self->_binWidth = a3;
}

- (id)dataBlockBuilder
{
  return self->_dataBlockBuilder;
}

- (void)setDataBlockBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)xAxisStringForLocation
{
  return self->_xAxisStringForLocation;
}

- (void)setXAxisStringForLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unsigned)didExecuteQuery
{
  return self->_didExecuteQuery;
}

- (void)setDidExecuteQuery:(unsigned __int8)a3
{
  self->_didExecuteQuery = a3;
}

- (HKQuantitySample)minimumSample
{
  return self->_minimumSample;
}

- (void)setMinimumSample:(id)a3
{
  objc_storeStrong((id *)&self->_minimumSample, a3);
}

- (HKQuantitySample)maximumSample
{
  return self->_maximumSample;
}

- (void)setMaximumSample:(id)a3
{
  objc_storeStrong((id *)&self->_maximumSample, a3);
}

- (NSArray)quantityValueRanges
{
  return self->_quantityValueRanges;
}

- (void)setQuantityValueRanges:(id)a3
{
  objc_storeStrong((id *)&self->_quantityValueRanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityValueRanges, 0);
  objc_storeStrong((id *)&self->_maximumSample, 0);
  objc_storeStrong((id *)&self->_minimumSample, 0);
  objc_storeStrong(&self->_xAxisStringForLocation, 0);
  objc_storeStrong(&self->_dataBlockBuilder, 0);
  objc_storeStrong((id *)&self->_yAxisRange, 0);
  objc_storeStrong((id *)&self->_xAxisRange, 0);
  objc_storeStrong((id *)&self->_samplesEndDate, 0);
  objc_storeStrong((id *)&self->_samplesStartDate, 0);
  objc_storeStrong((id *)&self->_dataBlock, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_quantityIdentifier, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_fetchObserver);
}

@end
