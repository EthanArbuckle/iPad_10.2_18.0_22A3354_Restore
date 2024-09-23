@implementation HKMCLoggedDataMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.LoggedData");
}

- (HKMCLoggedDataMetric)initWithMethod:(id)a3
{
  id v5;
  HKMCLoggedDataMetric *v6;
  HKMCLoggedDataMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCLoggedDataMetric;
  v6 = -[HKMCLoggedDataMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_method, a3);

  return v7;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HKMCLoggedDataMetric method](self, "method");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("method"));

  -[HKMCLoggedDataMetric dayIndexLoggingOffset](self, "dayIndexLoggingOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dayIndexLoggingOffset"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HKMCLoggedDataMetric method](self, "method");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCLoggedDataMetric dayIndexLoggingOffset](self, "dayIndexLoggingOffset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p method:%@ dayIndexLoggingOffset:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)method
{
  return self->_method;
}

- (NSNumber)dayIndexLoggingOffset
{
  return self->_dayIndexLoggingOffset;
}

- (void)setDayIndexLoggingOffset:(id)a3
{
  objc_storeStrong((id *)&self->_dayIndexLoggingOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayIndexLoggingOffset, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
