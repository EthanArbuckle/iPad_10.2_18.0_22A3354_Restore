@implementation HKAccessibilitySpan

- (HKAccessibilitySpan)initWithTitle:(id)a3 seriesType:(int64_t)a4 dataComprehensionMinYValue:(id)a5 dataComprehensionMaxYValue:(id)a6 dataComprehensionUnitForChart:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKAccessibilitySpan *v17;
  HKAccessibilitySpan *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKAccessibilitySpan;
  v17 = -[HKAccessibilitySpan init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataSeriesTitle, a3);
    v18->_dataSeriesType = a4;
    objc_storeStrong((id *)&v18->_dataComprehensionMinYValue, a5);
    objc_storeStrong((id *)&v18->_dataComprehensionMaxYValue, a6);
    objc_storeStrong((id *)&v18->_dataComprehensionUnitForChart, a7);
  }

  return v18;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
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
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKAccessibiltySpan %p:"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilitySpan dataSeriesTitle](self, "dataSeriesTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("  dataSeriesTitle: '%@'"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = -[HKAccessibilitySpan dataSeriesType](self, "dataSeriesType");
  if (v8 > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E9C424D0[v8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  dataSeriesType = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilitySpan dataComprehensionMinYValue](self, "dataComprehensionMinYValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("  dataComprehensionMinYValue = %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilitySpan dataComprehensionMaxYValue](self, "dataComprehensionMaxYValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("  dataComprehensionMaxYValue = %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[HKAccessibilitySpan dataComprehensionUnitForChart](self, "dataComprehensionUnitForChart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("  dataComprehensionUnitForChart = %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)dataSeriesTitle
{
  return self->_dataSeriesTitle;
}

- (int64_t)dataSeriesType
{
  return self->_dataSeriesType;
}

- (NSNumber)dataComprehensionMinYValue
{
  return self->_dataComprehensionMinYValue;
}

- (NSNumber)dataComprehensionMaxYValue
{
  return self->_dataComprehensionMaxYValue;
}

- (NSString)dataComprehensionUnitForChart
{
  return self->_dataComprehensionUnitForChart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataComprehensionUnitForChart, 0);
  objc_storeStrong((id *)&self->_dataComprehensionMaxYValue, 0);
  objc_storeStrong((id *)&self->_dataComprehensionMinYValue, 0);
  objc_storeStrong((id *)&self->_dataSeriesTitle, 0);
}

@end
