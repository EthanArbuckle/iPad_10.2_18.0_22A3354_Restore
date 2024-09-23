@implementation HMMDailyPartitionProvider

- (HMMDailyPartitionProvider)initWithDateProvider:(id)a3
{
  id v5;
  HMMDailyPartitionProvider *v6;
  HMMDailyPartitionProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMDailyPartitionProvider;
  v6 = -[HMMDailyPartitionProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dateProvider, a3);

  return v7;
}

- (NSDate)currentDatePartition
{
  void *v2;
  void *v3;

  -[HMMDailyPartitionProvider dateProvider](self, "dateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfCurrentDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)datePartitionWithOffsetFromNow:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HMMDailyPartitionProvider dateProvider](self, "dateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayByAddingDayCount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)datePartitionContainingDate:(id)a3
{
  return +[HMMDateProvider startOfDayForDate:](HMMDateProvider, "startOfDayForDate:", a3);
}

- (id)datePartitionWithOffset:(int64_t)a3 fromDatePartition:(id)a4
{
  return +[HMMDateProvider startOfDateByAddingDayCount:toDate:](HMMDateProvider, "startOfDateByAddingDayCount:toDate:", a3, a4);
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMMDailyPartitionProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__hmf_once_t0_350 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0_350, block);
  return (id)sharedInstance__hmf_once_v1_351;
}

void __43__HMMDailyPartitionProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[HMMDateProvider sharedInstance](HMMDateProvider, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithDateProvider:", v4);
  v3 = (void *)sharedInstance__hmf_once_v1_351;
  sharedInstance__hmf_once_v1_351 = v2;

}

@end
