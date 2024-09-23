@implementation HKMCNotificationInteractedMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.menstrual-cycles.NotificationInteracted");
}

- (HKMCNotificationInteractedMetric)initWithCategory:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  HKMCNotificationInteractedMetric *v9;
  HKMCNotificationInteractedMetric *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCNotificationInteractedMetric;
  v9 = -[HKMCNotificationInteractedMetric init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HKMCNotificationInteractedMetric category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("category"));

  -[HKMCNotificationInteractedMetric action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));

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
  -[HKMCNotificationInteractedMetric category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCNotificationInteractedMetric action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p category:%@ action:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end
