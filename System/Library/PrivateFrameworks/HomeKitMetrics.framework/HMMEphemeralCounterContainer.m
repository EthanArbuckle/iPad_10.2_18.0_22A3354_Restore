@implementation HMMEphemeralCounterContainer

- (HMMEphemeralCounterContainer)init
{
  HMMEphemeralCounterContainer *v2;
  uint64_t v3;
  NSMutableDictionary *counters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMEphemeralCounterContainer;
  v2 = -[HMMEphemeralCounterContainer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    counters = v2->_counters;
    v2->_counters = (NSMutableDictionary *)v3;

    v2->_active = 1;
  }
  return v2;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->_counters, "count") == 0;
}

- (void)incrementCounter:(id)a3 by:(int64_t)a4
{
  NSMutableDictionary *counters;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_active)
  {
    counters = self->_counters;
    v7 = a3;
    -[NSMutableDictionary objectForKeyedSubscript:](counters, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v8, "longValue") + a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_counters, "setObject:forKeyedSubscript:", v10, v7);

  }
}

- (id)valueForCounter:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_counters, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)counters
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_counters, "copy");
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counters, 0);
}

@end
