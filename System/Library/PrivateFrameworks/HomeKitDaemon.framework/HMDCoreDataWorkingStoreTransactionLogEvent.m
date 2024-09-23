@implementation HMDCoreDataWorkingStoreTransactionLogEvent

- (HMDCoreDataWorkingStoreTransactionLogEvent)initWithTransactionAuthor:(id)a3
{
  id v5;
  HMDCoreDataWorkingStoreTransactionLogEvent *v6;
  HMDCoreDataWorkingStoreTransactionLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCoreDataWorkingStoreTransactionLogEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transactionAuthor, a3);

  return v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.daemon.workingStoreTransactionsDailyTotal");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("transactionAuthor");
  -[HMDCoreDataWorkingStoreTransactionLogEvent transactionAuthor](self, "transactionAuthor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("transactionCount");
  v6[0] = v2;
  v6[1] = &unk_24E96D1D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
}

@end
