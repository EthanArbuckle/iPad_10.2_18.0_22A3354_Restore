@implementation HMDUserActivityStateDetector

- (HMDUserActivityStateDetector)initWithDataSource:(id)a3
{
  id v5;
  HMDUserActivityStateDetector *v6;
  HMDUserActivityStateDetector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityStateDetector;
  v6 = -[HMDUserActivityStateDetector init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)notifyDetectorStateChangedWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateDetector stateChangeDelegate](self, "stateChangeDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "handleStateChangeForDetectorOfType:withReason:", objc_msgSend((id)objc_opt_class(), "contributorType"), a3);

}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDUserActivityReport)latestReport
{
  return self->_latestReport;
}

- (void)setLatestReport:(id)a3
{
  objc_storeStrong((id *)&self->_latestReport, a3);
}

- (HMDUserActivityStateDetectorStateChangeDelegate)stateChangeDelegate
{
  return (HMDUserActivityStateDetectorStateChangeDelegate *)objc_loadWeakRetained((id *)&self->_stateChangeDelegate);
}

- (void)setStateChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateChangeDelegate);
  objc_storeStrong((id *)&self->_latestReport, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (unint64_t)contributorType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
