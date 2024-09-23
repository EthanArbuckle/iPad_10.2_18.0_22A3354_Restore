@implementation HKHistogramChartDataSourceBin

- (NSArray)values
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_backingValues, "copy");
}

- (NSArray)sortedValues
{
  return (NSArray *)-[NSMutableArray sortedArrayUsingComparator:](self->_backingValues, "sortedArrayUsingComparator:", &__block_literal_global_467_0);
}

uint64_t __45__HKHistogramChartDataSourceBin_sortedValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_backingValues, "count");
}

- (NSNumber)sumValue
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSMutableArray valueForKeyPath:](self->_backingValues, "valueForKeyPath:", CFSTR("@sum.doubleValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E9CEAC40;
  v4 = v2;

  return v4;
}

- (NSNumber)averageValue
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSMutableArray valueForKeyPath:](self->_backingValues, "valueForKeyPath:", CFSTR("@avg.doubleValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E9CEAC40;
  v4 = v2;

  return v4;
}

- (NSNumber)minimumValue
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSMutableArray valueForKeyPath:](self->_backingValues, "valueForKeyPath:", CFSTR("@min.doubleValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E9CEAC40;
  v4 = v2;

  return v4;
}

- (NSNumber)maximumValue
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSMutableArray valueForKeyPath:](self->_backingValues, "valueForKeyPath:", CFSTR("@max.doubleValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E9CEAC40;
  v4 = v2;

  return v4;
}

- (HKHistogramChartDataSourceBin)init
{
  return -[HKHistogramChartDataSourceBin initWithValues:](self, "initWithValues:", MEMORY[0x1E0C9AA60]);
}

- (HKHistogramChartDataSourceBin)initWithValues:(id)a3
{
  id v4;
  HKHistogramChartDataSourceBin *v5;
  uint64_t v6;
  NSMutableArray *backingValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHistogramChartDataSourceBin;
  v5 = -[HKHistogramChartDataSourceBin init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    backingValues = v5->_backingValues;
    v5->_backingValues = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)addValue:(id)a3
{
  -[NSMutableArray addObject:](self->_backingValues, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingValues, 0);
}

@end
