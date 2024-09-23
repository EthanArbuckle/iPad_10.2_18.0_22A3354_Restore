@implementation HKMCHeartRateDailySampleCollection

- (HKMCHeartRateDailySampleCollection)initWithSleepDayMorningIndex:(int64_t)a3 asleepSample:(id)a4 asleepHeartRateSamples:(id)a5 awakeHeartRateSamples:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKMCHeartRateDailySampleCollection *v14;
  HKMCHeartRateDailySampleCollection *v15;
  uint64_t v16;
  NSArray *asleepHeartRateSamples;
  uint64_t v18;
  NSArray *awakeHeartRateSamples;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKMCHeartRateDailySampleCollection;
  v14 = -[HKMCHeartRateDailySampleCollection init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_sleepDayMorningIndex = a3;
    objc_storeStrong((id *)&v14->_asleepSample, a4);
    v16 = objc_msgSend(v12, "copy");
    asleepHeartRateSamples = v15->_asleepHeartRateSamples;
    v15->_asleepHeartRateSamples = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    awakeHeartRateSamples = v15->_awakeHeartRateSamples;
    v15->_awakeHeartRateSamples = (NSArray *)v18;

  }
  return v15;
}

+ (id)heartRateDailySampleCollectionOnSleepDayMorningIndex:(int64_t)a3 gregorianCalendar:(id)a4 sleepStart:(double)a5 sleepDuration:(double)a6 sleepHeartRateSampleCount:(int64_t)a7 sleepHeartRatePercentile:(float)a8 awakeHeartRateSampleCount:(int64_t)a9 awakeHeartRatePercentile:(float)a10
{
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;

  v17 = (objc_class *)MEMORY[0x24BDD1508];
  v18 = a4;
  v19 = [v17 alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_sleepDayStartForMorningIndex:calendar:", a3, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_sleepDayStartForMorningIndex:calendar:", a3 + 1, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v20, v21);
  objc_msgSend(v22, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  if (a7 < 1 || a8 <= 0.0)
  {
    v34 = 0;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v22, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateWithTimeInterval:sinceDate:", v26, a5 * 3600.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = a6 * 3600.0;
    if (a6 <= 0.0)
      v28 = 28800.0;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v29, 300.0);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x24BDD3988];
    objc_msgSend(MEMORY[0x24BDD3990], "_typeWithIdentifier:", *MEMORY[0x24BDD2A28]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "categorySampleWithType:value:startDate:endDate:", v32, 1, v27, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v27, v29);
    HKMCGenerateHeartRateSamplesMatchingTenthPercentile(v33, a7, a8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)v30;
  }
  v35 = 0;
  if (a9 >= 1 && a10 > 0.0)
  {
    v36 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v22, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithStartDate:endDate:", v23, v37);
    HKMCGenerateHeartRateSamplesMatchingTenthPercentile(v38, a9, a10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v39 = objc_alloc((Class)objc_opt_class());
  if (v34)
    v40 = v34;
  else
    v40 = (void *)MEMORY[0x24BDBD1A8];
  if (v35)
    v41 = v35;
  else
    v41 = (void *)MEMORY[0x24BDBD1A8];
  v42 = (void *)objc_msgSend(v39, "initWithSleepDayMorningIndex:asleepSample:asleepHeartRateSamples:awakeHeartRateSamples:", a3, v24, v40, v41);

  return v42;
}

- (int64_t)sleepDayMorningIndex
{
  return self->_sleepDayMorningIndex;
}

- (HKCategorySample)asleepSample
{
  return self->_asleepSample;
}

- (NSArray)asleepHeartRateSamples
{
  return self->_asleepHeartRateSamples;
}

- (NSArray)awakeHeartRateSamples
{
  return self->_awakeHeartRateSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awakeHeartRateSamples, 0);
  objc_storeStrong((id *)&self->_asleepHeartRateSamples, 0);
  objc_storeStrong((id *)&self->_asleepSample, 0);
}

@end
