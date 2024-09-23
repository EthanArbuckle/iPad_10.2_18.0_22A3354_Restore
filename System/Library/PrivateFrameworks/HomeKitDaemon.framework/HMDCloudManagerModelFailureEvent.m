@implementation HMDCloudManagerModelFailureEvent

- (HMDCloudManagerModelFailureEvent)initWithModel:(id)a3 failureCode:(unint64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HMDCloudManagerModelFailureEvent *v12;
  HMDCloudManagerModelFailureEvent *v13;
  uint64_t v14;
  NSNumber *failureCode;
  uint64_t v16;
  NSString *errorDomain;
  uint64_t v18;
  NSNumber *errorCode;
  HMDCloudManagerModelFailureEvent *v21;
  SEL v22;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v21 = (HMDCloudManagerModelFailureEvent *)_HMFPreconditionFailure();
    return (HMDCloudManagerModelFailureEvent *)-[HMDCloudManagerModelFailureEvent coreAnalyticsEventName](v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCloudManagerModelFailureEvent;
  v12 = -[HMMLogEvent init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = objc_claimAutoreleasedReturnValue();
    failureCode = v13->_failureCode;
    v13->_failureCode = (NSNumber *)v14;

    objc_msgSend(v11, "domain");
    v16 = objc_claimAutoreleasedReturnValue();
    errorDomain = v13->_errorDomain;
    v13->_errorDomain = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "code"));
    v18 = objc_claimAutoreleasedReturnValue();
    errorCode = v13->_errorCode;
    v13->_errorCode = (NSNumber *)v18;

  }
  return v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDCloudManagerModelFailureEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("modelClass");
  -[HMDCloudManagerModelFailureEvent model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("failureCode");
  -[HMDCloudManagerModelFailureEvent failureCode](self, "failureCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("errorDomain");
  -[HMDCloudManagerModelFailureEvent errorDomain](self, "errorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("errorCode");
  -[HMDCloudManagerModelFailureEvent errorCode](self, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudManagerModelFailureEvent model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("model"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudManagerModelFailureEvent failureCode](self, "failureCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("failureCode"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudManagerModelFailureEvent errorDomain](self, "errorDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("errorDomain"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudManagerModelFailureEvent errorCode](self, "errorCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("errorCode"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)failureCode
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)errorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_failureCode, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
