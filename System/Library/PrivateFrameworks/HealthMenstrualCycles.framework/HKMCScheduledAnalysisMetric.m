@implementation HKMCScheduledAnalysisMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.ScheduledAnalysis");
}

- (HKMCScheduledAnalysisMetric)initWithTimeSuccessful:(int64_t)a3
{
  HKMCScheduledAnalysisMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCScheduledAnalysisMetric;
  result = -[HKMCScheduledAnalysisMetric init](&v5, sel_init);
  if (result)
    result->_timeSuccessful = a3;
  return result;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCScheduledAnalysisMetric timeSuccessful](self, "timeSuccessful"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("timeSuccessful"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HKMCScheduledAnalysisMetric timeSuccessful](self, "timeSuccessful"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p timeSuccessful:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)timeSuccessful
{
  return self->_timeSuccessful;
}

- (void)setTimeSuccessful:(int64_t)a3
{
  self->_timeSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
