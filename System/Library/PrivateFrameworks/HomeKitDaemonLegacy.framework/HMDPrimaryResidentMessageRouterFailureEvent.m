@implementation HMDPrimaryResidentMessageRouterFailureEvent

- (HMDPrimaryResidentMessageRouterFailureEvent)initWithMessageName:(id)a3 failureType:(int64_t)a4
{
  id v7;
  HMDPrimaryResidentMessageRouterFailureEvent *v8;
  HMDPrimaryResidentMessageRouterFailureEvent *v9;
  uint64_t v10;
  NSNumber *failureType;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDPrimaryResidentMessageRouterFailureEvent;
  v8 = -[HMMLogEvent init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageName, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    failureType = v9->_failureType;
    v9->_failureType = (NSNumber *)v10;

  }
  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDPrimaryResidentMessageRouterFailureEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("messageName");
  -[HMDPrimaryResidentMessageRouterFailureEvent messageName](self, "messageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("failureType");
  v8[0] = v3;
  -[HMDPrimaryResidentMessageRouterFailureEvent failureType](self, "failureType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
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
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDPrimaryResidentMessageRouterFailureEvent messageName](self, "messageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("messageName"), v4);
  v14[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDPrimaryResidentMessageRouterFailureEvent failureType](self, "failureType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  if ((unint64_t)(v8 - 1) > 4)
    v9 = CFSTR("UnknownValue");
  else
    v9 = off_1E89A2580[v8 - 1];
  v10 = v9;
  v11 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("failureType"), v10);
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)failureType
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureType, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

@end
