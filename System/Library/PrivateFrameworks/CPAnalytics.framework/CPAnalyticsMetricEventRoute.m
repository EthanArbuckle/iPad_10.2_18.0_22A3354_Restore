@implementation CPAnalyticsMetricEventRoute

- (CPAnalyticsMetricEventRoute)initWithConfig:(id)a3
{
  id v4;
  CPAnalyticsMetricEventRoute *v5;
  uint64_t v6;
  NSString *destination;
  void *v8;
  uint64_t v9;
  NSArray *propertiesToInclude;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAnalyticsMetricEventRoute;
  v5 = -[CPAnalyticsMetricEventRoute init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("destination"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (NSString *)v6;

    objc_msgSend(v4, "valueForKey:", CFSTR("destinationEventKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_storeStrong((id *)&v5->_destinationEventKey, v8);
    objc_msgSend(v4, "objectForKey:", CFSTR("includeProperties"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertiesToInclude = v5->_propertiesToInclude;
    v5->_propertiesToInclude = (NSArray *)v9;

    if (!v5->_propertiesToInclude)
      v5->_propertiesToInclude = (NSArray *)MEMORY[0x24BDBD1A8];
    objc_msgSend(v4, "objectForKey:", CFSTR("includeEventProperties"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeEventProperties = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)destinationEventKey
{
  return self->_destinationEventKey;
}

- (NSArray)propertiesToInclude
{
  return self->_propertiesToInclude;
}

- (BOOL)includeEventProperties
{
  return self->_includeEventProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToInclude, 0);
  objc_storeStrong((id *)&self->_destinationEventKey, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
