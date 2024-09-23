@implementation HKInteractiveChartTrendOverlayFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  void *v5;
  HKSelectedRangeData *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 3);
    v7 = -[HKInteractiveChartTrendOverlayFormatter _displayTypeIsSleep](self, "_displayTypeIsSleep") ^ 1;
    objc_msgSend(v5, "minValue");
    v9 = v8;
    objc_msgSend(v5, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v10, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v6, "setAttributedString:", v11);

    -[HKSelectedRangeData setDataType:](v6, "setDataType:", 0);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "minValue");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setValueAsNumber:](v6, "setValueAsNumber:", v13);

    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (BOOL)_displayTypeIsSleep
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "baseDisplayType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v8, "displayTypeIdentifier");

    }
    else
    {
      v3 = (void *)objc_msgSend(v6, "displayTypeIdentifier");
    }
    LOBYTE(v3) = v3 == (void *)63;

  }
  return (char)v3;
}

@end
