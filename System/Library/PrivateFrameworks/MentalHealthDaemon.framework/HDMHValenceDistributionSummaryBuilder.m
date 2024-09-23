@implementation HDMHValenceDistributionSummaryBuilder

- (HDMHValenceDistributionSummaryBuilder)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v8;
  HDMHValenceDistributionSummaryBuilder *v9;
  HDMHValenceDistributionSummaryBuilder *v10;
  NSMutableArray *v11;
  NSMutableArray *dailyValenceValues;
  NSMutableArray *v13;
  NSMutableArray *momentaryValenceDistributions;
  double v15;
  objc_super v17;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDMHValenceDistributionSummaryBuilder;
  v9 = -[HDMHValenceDistributionSummaryBuilder init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_dayIndexRange.start = var0;
    v9->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v9->_gregorianCalendar, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dailyValenceValues = v10->_dailyValenceValues;
    v10->_dailyValenceValues = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    momentaryValenceDistributions = v10->_momentaryValenceDistributions;
    v10->_momentaryValenceDistributions = v13;

    -[HDMHValenceDistributionSummaryBuilder _valenceMergeInterval](v10, "_valenceMergeInterval");
    v10->_valenceMergeInterval = v15;
  }

  return v10;
}

- (void)addDaySummary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "momentaryStatesOfMind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHValenceDistributionSummaryBuilder _mergeStatesOfMind:intoValenceDistributions:](self, "_mergeStatesOfMind:intoValenceDistributions:", v4, self->_momentaryValenceDistributions);

  objc_msgSend(v10, "dailyStateOfMind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDMHValenceDistributionSummaryBuilder dailyValenceValues](self, "dailyValenceValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "dailyStateOfMind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valence");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
}

- (id)valenceDistributionSummary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_momentaryValenceDistributions);
  if (-[NSMutableArray count](self->_dailyValenceValues, "count"))
  {
    -[HDMHValenceDistributionSummaryBuilder _calculateAverageDailyValenceDistribution](self, "_calculateAverageDailyValenceDistribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65E00]), "initWithDayIndexRange:valenceDistributions:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v3);

  return v5;
}

- (id)_calculateAverageDailyValenceDistribution
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray valueForKeyPath:](self->_dailyValenceValues, "valueForKeyPath:", CFSTR("@avg.doubleValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE65DF8]), "initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:", -[NSMutableArray count](self->_dailyValenceValues, "count"), 2, v5, v5);
}

- (void)_mergeStatesOfMind:(id)a3 intoValenceDistributions:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  -[HDMHValenceDistributionSummaryBuilder _mergeAdjacentValenceDistributions:](self, "_mergeAdjacentValenceDistributions:", v6);

}

id __85__HDMHValenceDistributionSummaryBuilder__mergeStatesOfMind_intoValenceDistributions___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v2 = (objc_class *)MEMORY[0x24BE65DF8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "valence");
  v6 = v5;
  objc_msgSend(v3, "valence");
  v8 = v7;
  v9 = objc_msgSend(v3, "reflectiveInterval");

  return (id)objc_msgSend(v4, "initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:", 1, v9, v6, v8);
}

- (void)_mergeAdjacentValenceDistributions:(id)a3
{
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_194);
  if ((unint64_t)objc_msgSend(v18, "count") >= 2)
  {
    v4 = 0;
    v5 = 1;
    v6 = 1;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minimumValence");
      v9 = v8;

      objc_msgSend(v18, "objectAtIndexedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minimumValence");
      v12 = v11 - self->_valenceMergeInterval;

      objc_msgSend(v18, "objectAtIndexedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "maximumValence");
      v15 = v14 + self->_valenceMergeInterval;

      if (-[HDMHValenceDistributionSummaryBuilder _value:isBetweenMinValue:maxValue:](self, "_value:isBetweenMinValue:maxValue:", v9, v12, v15))
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addValenceDistribution:", v17);

        objc_msgSend(v18, "removeObjectAtIndex:", v5);
      }
      else
      {
        ++v4;
        ++v6;
      }
      v5 = v6;
    }
    while (objc_msgSend(v18, "count") > (unint64_t)v6);
  }

}

uint64_t __76__HDMHValenceDistributionSummaryBuilder__mergeAdjacentValenceDistributions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "minimumValence");
  objc_msgSend(v4, "minimumValence");

  return HKCompareDoubles();
}

- (double)_valenceMergeInterval
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  int v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HDMHMentalHealthValenceMergeInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.001;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppleInternalInstall");

    if (v6)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v7;
    }
  }

  return v4;
}

- (BOOL)_value:(double)a3 isBetweenMinValue:(double)a4 maxValue:(double)a5
{
  BOOL v5;

  v5 = a3 > a4 && a3 < a5;
  return v5 || vabdd_f64(a3, a4) < 2.22044605e-16 || vabdd_f64(a3, a5) < 2.22044605e-16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_dayIndexRange.duration;
  start = self->_dayIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (NSMutableArray)dailyValenceValues
{
  return self->_dailyValenceValues;
}

- (void)setDailyValenceValues:(id)a3
{
  objc_storeStrong((id *)&self->_dailyValenceValues, a3);
}

- (NSMutableArray)momentaryValenceDistributions
{
  return self->_momentaryValenceDistributions;
}

- (void)setMomentaryValenceDistributions:(id)a3
{
  objc_storeStrong((id *)&self->_momentaryValenceDistributions, a3);
}

- (double)valenceMergeInterval
{
  return self->_valenceMergeInterval;
}

- (void)setValenceMergeInterval:(double)a3
{
  self->_valenceMergeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentaryValenceDistributions, 0);
  objc_storeStrong((id *)&self->_dailyValenceValues, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end
