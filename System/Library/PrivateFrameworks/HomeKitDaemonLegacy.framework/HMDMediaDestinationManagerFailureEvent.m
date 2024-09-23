@implementation HMDMediaDestinationManagerFailureEvent

- (HMDMediaDestinationManagerFailureEvent)initWithFailureCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  HMDMediaDestinationManagerFailureEvent *v8;
  uint64_t v9;
  NSString *errorDomain;
  uint64_t v11;
  NSNumber *errorCode;
  uint64_t v13;
  NSNumber *failureCode;
  HMDMediaDestinationManagerFailureEvent *v16;
  SEL v17;
  objc_super v18;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaDestinationManagerFailureEvent;
    v8 = -[HMMLogEvent init](&v18, sel_init);
    if (v8)
    {
      objc_msgSend(v7, "domain");
      v9 = objc_claimAutoreleasedReturnValue();
      errorDomain = v8->_errorDomain;
      v8->_errorDomain = (NSString *)v9;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
      v11 = objc_claimAutoreleasedReturnValue();
      errorCode = v8->_errorCode;
      v8->_errorCode = (NSNumber *)v11;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v13 = objc_claimAutoreleasedReturnValue();
      failureCode = v8->_failureCode;
      v8->_failureCode = (NSNumber *)v13;

    }
    return v8;
  }
  else
  {
    v16 = (HMDMediaDestinationManagerFailureEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationManagerFailureEvent *)-[HMDMediaDestinationManagerFailureEvent coreAnalyticsEventName](v16, v17);
  }
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDMediaDestinationManagerFailureEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("errorDomain");
  -[HMDMediaDestinationManagerFailureEvent errorDomain](self, "errorDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("errorCode");
  -[HMDMediaDestinationManagerFailureEvent errorCode](self, "errorCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("failureCode");
  -[HMDMediaDestinationManagerFailureEvent failureCode](self, "failureCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMediaDestinationManagerFailureEvent failureCode](self, "failureCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMDMediaDestinationManagerFailureCodeAsString(objc_msgSend(v4, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("failureCode"), v5);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMediaDestinationManagerFailureEvent errorDomain](self, "errorDomain", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("errorDomain"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMediaDestinationManagerFailureEvent errorCode](self, "errorCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("errorCode"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)errorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)failureCode
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureCode, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
