@implementation AXMDataSummary

- (AXMDataSummary)initWithSeries:(id)a3 chartDescriptor:(id)a4
{
  id v6;
  id v7;
  AXMDataSummary *v8;
  AXMDataSummary *v9;
  void *v10;
  uint64_t v11;
  NSArray *xValues;
  void *v13;
  uint64_t v14;
  NSArray *yValues;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *axisTitles;
  NSNumberFormatter *v25;
  NSNumberFormatter *numberFormatter;
  void *v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AXMDataSummary;
  v8 = -[AXMDataSummary init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chartDescriptor, v7);
    objc_storeWeak((id *)&v9->_series, v6);
    objc_msgSend(v6, "xValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numericalValuesFromDataPointValues:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    xValues = v9->_xValues;
    v9->_xValues = (NSArray *)v11;

    objc_msgSend(v6, "yValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numericalValuesFromDataPointValues:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    yValues = v9->_yValues;
    v9->_yValues = (NSArray *)v14;

    v9->_numValues = -[NSArray count](v9->_xValues, "count");
    v28 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v7, "xAxis");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "yAxis");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zNumericAxisDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zCategoricalAxisDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "axmArrayByIgnoringNilElementsWithCount:", 4, v16, v18, v20, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    axisTitles = v9->_axisTitles;
    v9->_axisTitles = (NSArray *)v23;

    v25 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v9->_numberFormatter;
    v9->_numberFormatter = v25;

    -[NSNumberFormatter setMaximumSignificantDigits:](v9->_numberFormatter, "setMaximumSignificantDigits:", 4);
    -[AXMDataSummary compute](v9, "compute");
  }

  return v9;
}

- (void)computeRegressionModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AXMDataSummary *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  AXMDataSummary *v16;

  v4 = a3;
  -[AXMDataSummary xValues](self, "xValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[AXMDataSummary yValues](self, "yValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "count"))
  {
    -[AXMDataSummary xValues](self, "xValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__10;
      v15[4] = __Block_byref_object_dispose__10;
      v10 = self;
      v16 = v10;
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__AXMDataSummary_computeRegressionModel___block_invoke;
      block[3] = &unk_1E625E960;
      v14 = v15;
      block[4] = v10;
      v13 = v4;
      dispatch_async(v11, block);

      _Block_object_dispose(v15, 8);
    }
  }
  else
  {

  }
}

void __41__AXMDataSummary_computeRegressionModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "numValues");
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&block[-2] - v2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "numValues");
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&block[-2] - v4;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "xValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValues:fromNSNumberArray:", v3, v7);

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "yValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getValues:fromNSNumberArray:", v5, v9);

  +[AXMDataRegressionModel getModelForX:y:n:](AXMDataRegressionModel, "getModelForX:y:n:", v3, v5, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "numValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AXMDataSummary_computeRegressionModel___block_invoke_2;
  block[3] = &unk_1E625E960;
  v15 = v10;
  v13 = *(_OWORD *)(a1 + 40);
  v11 = (id)v13;
  v16 = v13;
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41__AXMDataSummary_computeRegressionModel___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setRegressionModel:", a1[4]);
  v2 = a1[5];
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "regressionModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)setRegressionModel:(id)a3
{
  objc_storeStrong((id *)&self->_regressionModel, a3);
}

- (NSArray)dataFeatureDescriptions
{
  NSArray *dataFeatureDescriptions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  dataFeatureDescriptions = self->_dataFeatureDescriptions;
  if (!dataFeatureDescriptions)
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    -[AXMDataSummary slopeDescription](self, "slopeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary modelDescription](self, "modelDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary confidenceDescription](self, "confidenceDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary outliersDescription](self, "outliersDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axmArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_dataFeatureDescriptions;
    self->_dataFeatureDescriptions = v9;

    dataFeatureDescriptions = self->_dataFeatureDescriptions;
  }
  return dataFeatureDescriptions;
}

- (NSArray)statsDescriptions
{
  NSArray *statsDescriptions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  statsDescriptions = self->_statsDescriptions;
  if (!statsDescriptions)
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    -[AXMDataSummary minValueDescription](self, "minValueDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary maxValueDescription](self, "maxValueDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary meanValueDescription](self, "meanValueDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSummary medianValueDescription](self, "medianValueDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axmArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_statsDescriptions;
    self->_statsDescriptions = v9;

    statsDescriptions = self->_statsDescriptions;
  }
  return statsDescriptions;
}

- (NSString)modelDescription
{
  void *v2;
  void *v3;

  -[AXMDataSummary regressionModel](self, "regressionModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)slopeDescription
{
  void *v3;
  double v4;
  double v5;
  double slope;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[AXMDataSummary regressionModel](self, "regressionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v5 = v4;

  if (v5 <= 0.2)
  {
    v10 = 0;
  }
  else
  {
    slope = self->_slope;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (slope > 0.0)
      v9 = CFSTR("chart.series.trend.increasing");
    else
      v9 = CFSTR("chart.series.trend.decreasing");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E6260C18, CFSTR("Accessibility"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
}

- (NSString)confidenceDescription
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[AXMDataSummary regressionModel](self, "regressionModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confidence");
  v4 = v3;

  if (v4 <= 0.9)
  {
    if (v4 <= 0.7)
    {
      if (v4 <= 0.4)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v4 <= 0.2)
          v7 = CFSTR("chart.series.trend.none");
        else
          v7 = CFSTR("chart.series.trend.weak");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("chart.series.trend.moderate");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("chart.series.trend.strong");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("chart.series.trend.verystrong");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E6260C18, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)minValueDescription
{
  NSArray *yValues;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  yValues = self->_yValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minY);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](yValues, "indexOfObject:", v4);

  -[AXMDataSummary series](self, "series");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("chart.series.minvalue.format"), &stru_1E6260C18, CFSTR("Accessibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)maxValueDescription
{
  NSArray *yValues;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  yValues = self->_yValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxY);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](yValues, "indexOfObject:", v4);

  -[AXMDataSummary series](self, "series");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("chart.series.maxvalue.format"), &stru_1E6260C18, CFSTR("Accessibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)meanValueDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("chart.series.meanvalue.format"), &stru_1E6260C18, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDataSummary series](self, "series");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meanValueDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    -[AXMDataSummary numberFormatter](self, "numberFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_meanY);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray objectAtIndexedSubscript:](self->_axisTitles, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v4, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)medianValueDescription
{
  return 0;
}

- (NSString)outliersDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *obj;
  AXMDataSummary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = self;
  obj = self->_outliers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        v8 = v3;
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("chart.series.outlier.format"), &stru_1E6260C18, CFSTR("Accessibility"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0CB3940];
        -[AXMDataSummary series](v22, "series");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataPoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringWithFormat:", v11, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v8;
        objc_msgSend(v8, "addObject:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("chart.series.outliers.none"), &stru_1E6260C18, CFSTR("Accessibility"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v18;
}

- (NSString)bestFitCurveEquation
{
  void *v3;
  void *v4;
  void *v5;

  -[AXMDataSummary regressionModel](self, "regressionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSummary regressionModel](self, "regressionModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelFunctionStringForParameters:significantFigures:", objc_msgSend(v4, "bestFitParameters"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)compute
{
  -[AXMDataSummary computeRanges](self, "computeRanges");
  -[AXMDataSummary computeMeans](self, "computeMeans");
  -[AXMDataSummary computeCovariance](self, "computeCovariance");
  -[AXMDataSummary computeVariances](self, "computeVariances");
  -[AXMDataSummary computeR](self, "computeR");
  -[AXMDataSummary computeLinearRegression](self, "computeLinearRegression");
  -[AXMDataSummary computeResiduals](self, "computeResiduals");
  -[AXMDataSummary computeOutliers](self, "computeOutliers");
}

- (void)computeRanges
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  if (self->_numValues)
  {
    v3 = 0;
    v4 = 1.79769313e308;
    v5 = -1.79769313e308;
    v6 = -1.79769313e308;
    v7 = 1.79769313e308;
    do
    {
      -[AXMDataSummary xValues](self, "xValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      -[AXMDataSummary yValues](self, "yValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      if (v11 < v7)
        v7 = v11;
      if (v11 > v6)
        v6 = v11;
      if (v15 < v4)
        v4 = v15;
      if (v15 > v5)
        v5 = v15;
      ++v3;
    }
    while (v3 < self->_numValues);
  }
  else
  {
    v6 = -1.79769313e308;
    v7 = 1.79769313e308;
    v4 = 1.79769313e308;
    v5 = -1.79769313e308;
  }
  self->_minX = v7;
  self->_maxX = v6;
  self->_minY = v4;
  self->_maxY = v5;
}

- (void)computeMeans
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unint64_t numValues;
  double v15;

  if (self->_numValues)
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      -[AXMDataSummary xValues](self, "xValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      -[AXMDataSummary yValues](self, "yValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      v4 = v4 + v9;
      v5 = v5 + v13;
      ++v3;
      numValues = self->_numValues;
    }
    while (v3 < numValues);
    v15 = (double)numValues;
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
    v15 = 0.0;
  }
  self->_meanX = v4 / v15;
  self->_meanY = v5 / v15;
}

- (void)computeCovariance
{
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t numValues;
  double v14;

  if (self->_numValues)
  {
    v3 = 0;
    v4 = 0.0;
    do
    {
      -[AXMDataSummary xValues](self, "xValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

      -[AXMDataSummary yValues](self, "yValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      v4 = v4 + (v8 - self->_meanX) * (v12 - self->_meanY);
      ++v3;
      numValues = self->_numValues;
    }
    while (v3 < numValues);
    v14 = v4 / (double)(numValues - 1);
  }
  else
  {
    v14 = 0.0;
  }
  self->_covariance = v14;
}

- (void)computeVariances
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unint64_t numValues;
  double v15;

  if (self->_numValues)
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      -[AXMDataSummary xValues](self, "xValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      -[AXMDataSummary yValues](self, "yValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      v4 = v4 + (v9 - self->_meanX) * (v9 - self->_meanX);
      v5 = v5 + (v13 - self->_meanY) * (v13 - self->_meanY);
      ++v3;
      numValues = self->_numValues;
    }
    while (v3 < numValues);
    v15 = (double)(numValues - 1);
  }
  else
  {
    v5 = 0.0;
    v15 = 1.84467441e19;
    v4 = 0.0;
  }
  self->_varianceX = v4 / v15;
  self->_varianceY = v5 / v15;
}

- (void)computeR
{
  double v2;

  v2 = self->_covariance / sqrt(self->_varianceX * self->_varianceY);
  self->_r = v2;
  self->_rSquared = v2 * v2;
}

- (void)computeLinearRegression
{
  double v2;
  double v3;

  v2 = self->_r * sqrt(self->_varianceY) / sqrt(self->_varianceX);
  v3 = self->_meanY - v2 * self->_meanX;
  self->_slope = v2;
  self->_intercept = v3;
}

- (void)computeResiduals
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSArray *v13;
  NSArray *residuals;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_xValues, "count"))
  {
    v3 = 0;
    do
    {
      -[AXMDataSummary xValues](self, "xValues");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v7 = v6;

      -[AXMDataSummary yValues](self, "yValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 - (self->_intercept + self->_slope * v7));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v12);

      ++v3;
    }
    while (v3 < -[NSArray count](self->_xValues, "count"));
  }
  v13 = (NSArray *)objc_msgSend(v15, "copy");
  residuals = self->_residuals;
  self->_residuals = v13;

}

- (void)computeOutliers
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSArray *v13;
  NSArray *outliers;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_numValues >= 8)
  {
    -[AXMDataSummary getMean:](self, "getMean:", self->_residuals);
    v4 = v3;
    -[AXMDataSummary getVariance:](self, "getVariance:", self->_residuals);
    v6 = v5;
    if (-[NSArray count](self->_residuals, "count"))
    {
      v7 = 0;
      v8 = sqrt(v6);
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_residuals, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = (v10 - v4) / v8;

        if (fabs(v11) > 3.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v12);

        }
        ++v7;
      }
      while (v7 < -[NSArray count](self->_residuals, "count"));
    }
  }
  v13 = (NSArray *)objc_msgSend(v15, "copy");
  outliers = self->_outliers;
  self->_outliers = v13;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  double minY;
  double maxY;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v11 = *(_OWORD *)&self->_minX;
  minY = self->_minY;
  maxY = self->_maxY;
  -[AXMDataRegressionModel modelFunction](self->_regressionModel, "modelFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1B5E12AE8]();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p x:[%.1f, %.1f] y:[%.1f, %.1f] model=%@ xbar=%.1f ybar=%.1f r=%.4f rSq=%.4f y=%.4fx+%.4f\n\toutliers=%@>"), v4, self, v11, *(_QWORD *)&minY, *(_QWORD *)&maxY, v8, *(_QWORD *)&self->_meanX, *(_QWORD *)&self->_meanY, *(_QWORD *)&self->_r, *(_QWORD *)&self->_rSquared, *(_QWORD *)&self->_slope, *(_QWORD *)&self->_intercept, self->_outliers);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stringForComponents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id *v6;
  id v7;
  id v8;
  id *v10;
  uint64_t v11;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E6260C18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v4, "appendString:", v5);
  v10 = (id *)&v11;
  while (1)
  {
    v6 = v10++;
    v7 = *v6;
    v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
    if (objc_msgSend(v8, "length"))
      break;
LABEL_15:

  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("__AXMDataSummaryStringForVariablesSentinel")) & 1) == 0)
  {
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "appendString:", CFSTR(", "));
    objc_msgSend(v4, "appendString:", v8);
    goto LABEL_15;
  }

  return v4;
}

- (double)getMean:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "doubleValue", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (double)getMedian:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (unint64_t)objc_msgSend(v7, "count") >> 1;
  v9 = objc_msgSend(v7, "count");
  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v12 = (v12 + v14) * 0.5;

  }
  return v12;
}

- (double)getVariance:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXMDataSummary getMean:](self, "getMean:", v4);
  v6 = v5;
  v7 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "doubleValue", (_QWORD)v15);
          v7 = v7 + (v13 - v6) * (v13 - v6);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v7 = v7 / (double)(unint64_t)(objc_msgSend(v8, "count") - 1);
  }

  return v7;
}

- (void)getValues:(double *)a3 fromNSNumberArray:(id)a4
{
  unint64_t v5;
  void *v6;
  double v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      a3[v5] = v7;

      ++v5;
    }
    while (v5 < objc_msgSend(v8, "count"));
  }

}

- (double)positionForXAxisValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AXMDataSummary maxX](self, "maxX");
  v6 = v5;
  -[AXMDataSummary minX](self, "minX");
  v8 = v6 - v7;
  if (v8 <= 0.0)
    return 1.79769313e308;
  -[AXMDataSummary minX](self, "minX");
  return (a3 - v9) / v8;
}

- (double)positionForYAxisValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AXMDataSummary maxY](self, "maxY");
  v6 = v5;
  -[AXMDataSummary minY](self, "minY");
  v8 = v6 - v7;
  if (v8 <= 0.0)
    return 1.79769313e308;
  -[AXMDataSummary minY](self, "minY");
  return (a3 - v9) / v8;
}

- (AXMDataSeriesDescriptor)series
{
  return (AXMDataSeriesDescriptor *)objc_loadWeakRetained((id *)&self->_series);
}

- (void)setSeries:(id)a3
{
  objc_storeWeak((id *)&self->_series, a3);
}

- (AXMChartDescriptor)chartDescriptor
{
  return (AXMChartDescriptor *)objc_loadWeakRetained((id *)&self->_chartDescriptor);
}

- (void)setChartDescriptor:(id)a3
{
  objc_storeWeak((id *)&self->_chartDescriptor, a3);
}

- (void)setDataFeatureDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_dataFeatureDescriptions, a3);
}

- (void)setStatsDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_statsDescriptions, a3);
}

- (AXMDataRegressionModel)regressionModel
{
  return self->_regressionModel;
}

- (unint64_t)numValues
{
  return self->_numValues;
}

- (void)setNumValues:(unint64_t)a3
{
  self->_numValues = a3;
}

- (double)r
{
  return self->_r;
}

- (double)rSquared
{
  return self->_rSquared;
}

- (double)minX
{
  return self->_minX;
}

- (double)maxX
{
  return self->_maxX;
}

- (double)meanX
{
  return self->_meanX;
}

- (double)varianceX
{
  return self->_varianceX;
}

- (double)minY
{
  return self->_minY;
}

- (double)maxY
{
  return self->_maxY;
}

- (double)meanY
{
  return self->_meanY;
}

- (double)varianceY
{
  return self->_varianceY;
}

- (double)covariance
{
  return self->_covariance;
}

- (double)slope
{
  return self->_slope;
}

- (double)intercept
{
  return self->_intercept;
}

- (NSArray)residuals
{
  return self->_residuals;
}

- (NSArray)outliers
{
  return self->_outliers;
}

- (AXMDataSummaryCategoryNameProvider)categoryNameDelegate
{
  return (AXMDataSummaryCategoryNameProvider *)objc_loadWeakRetained((id *)&self->_categoryNameDelegate);
}

- (void)setCategoryNameDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_categoryNameDelegate, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSArray)xValues
{
  return self->_xValues;
}

- (void)setXValues:(id)a3
{
  objc_storeStrong((id *)&self->_xValues, a3);
}

- (NSArray)yValues
{
  return self->_yValues;
}

- (void)setYValues:(id)a3
{
  objc_storeStrong((id *)&self->_yValues, a3);
}

- (NSArray)axisTitles
{
  return self->_axisTitles;
}

- (void)setAxisTitles:(id)a3
{
  objc_storeStrong((id *)&self->_axisTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisTitles, 0);
  objc_storeStrong((id *)&self->_yValues, 0);
  objc_storeStrong((id *)&self->_xValues, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_categoryNameDelegate);
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_residuals, 0);
  objc_storeStrong((id *)&self->_regressionModel, 0);
  objc_storeStrong((id *)&self->_statsDescriptions, 0);
  objc_storeStrong((id *)&self->_dataFeatureDescriptions, 0);
  objc_destroyWeak((id *)&self->_chartDescriptor);
  objc_destroyWeak((id *)&self->_series);
}

@end
