@implementation BLSHAggregatedSystemActivityAssertionFactory

- (BLSHAggregatedSystemActivityAssertionFactory)init
{
  BLSHAggregatedSystemActivityAssertionFactory *v2;
  uint64_t v3;
  NSMapTable *lock_aggregateAssertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLSHAggregatedSystemActivityAssertionFactory;
  v2 = -[BLSHAggregatedSystemActivityAssertionFactory init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    lock_aggregateAssertions = v2->_lock_aggregateAssertions;
    v2->_lock_aggregateAssertions = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)createAggregatedSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4
{
  void (**v6)(id, void *);
  os_unfair_lock_s *p_lock;
  id v8;
  void *v9;
  void *v10;
  BLSHAggregateSystemActivityAssertion *v11;
  BLSHIndividualSystemActivityAssertion *v12;

  v6 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_opt_new();
  v6[2](v6, v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "acquireWaitsToAbortSleepRequested"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_lock_aggregateAssertions, "objectForKey:", v10);
  v11 = (BLSHAggregateSystemActivityAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[BLSHAggregateSystemActivityAssertion initWithConfigurator:]([BLSHAggregateSystemActivityAssertion alloc], "initWithConfigurator:", v6);
    -[NSMapTable setObject:forKey:](self->_lock_aggregateAssertions, "setObject:forKey:", v11, v10);
  }
  v12 = -[BLSHIndividualSystemActivityAssertion initWithWithIdentifier:aggregator:]([BLSHIndividualSystemActivityAssertion alloc], "initWithWithIdentifier:aggregator:", v8, v11);

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_aggregateAssertions, 0);
  objc_destroyWeak((id *)&self->_lock_aggregateAssertion);
}

@end
