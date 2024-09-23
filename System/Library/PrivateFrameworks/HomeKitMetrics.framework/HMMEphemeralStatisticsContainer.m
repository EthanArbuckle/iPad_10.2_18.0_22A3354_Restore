@implementation HMMEphemeralStatisticsContainer

- (HMMEphemeralStatisticsContainer)init
{
  HMMEphemeralStatisticsContainer *v2;
  uint64_t v3;
  NSMutableDictionary *statistics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMEphemeralStatisticsContainer;
  v2 = -[HMMEphemeralStatisticsContainer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    statistics = v2->_statistics;
    v2->_statistics = (NSMutableDictionary *)v3;

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
  return -[NSMutableDictionary count](self->_statistics, "count") == 0;
}

- (void)addValue:(int64_t)a3 toStatistics:(id)a4
{
  id v6;
  HMMMutableCounterStatistics *v7;
  id v8;

  v6 = a4;
  if (self->_active)
  {
    v8 = v6;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", v6);
    v7 = (HMMMutableCounterStatistics *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(HMMMutableCounterStatistics);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statistics, "setObject:forKeyedSubscript:", v7, v8);
    }
    -[HMMMutableCounterStatistics addValue:](v7, "addValue:", a3);

    v6 = v8;
  }

}

- (id)statistics:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_statistics, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)statistics
{
  void *v3;
  NSMutableDictionary *statistics;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statistics = self->_statistics;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HMMEphemeralStatisticsContainer_statistics__block_invoke;
  v8[3] = &unk_1E898A568;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](statistics, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

void __45__HMMEphemeralStatisticsContainer_statistics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "statistics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

@end
