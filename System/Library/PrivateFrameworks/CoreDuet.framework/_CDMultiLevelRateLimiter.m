@implementation _CDMultiLevelRateLimiter

- (_CDMultiLevelRateLimiter)init
{

  return 0;
}

- (_CDMultiLevelRateLimiter)initWithPeriodToCountMap:(id)a3
{
  id v4;
  _CDMultiLevelRateLimiter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSArray *periods;
  uint64_t v27;
  NSArray *maxCounts;
  uint64_t v29;
  NSMutableArray *periodStart;
  uint64_t v31;
  NSMutableArray *balances;
  void *v33;
  int64_t v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *queue;
  _CDMultiLevelRateLimiter *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_CDMultiLevelRateLimiter;
  v5 = -[_CDMultiLevelRateLimiter init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5->_numberOfRateLimitPolicies);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v12);
    }
    v38 = v5;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "count") - 1;
    if (v17 >= 1)
    {
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");

        v20 = v17 + 1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v20 - 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "integerValue");

          if (v22 >= v19)
            objc_msgSend(v16, "addIndex:", v20 - 2);
          --v20;
        }
        while (v20 > 1);
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v9, "removeObjectsAtIndexes:", v16);
          objc_msgSend(v10, "removeObjectsAtIndexes:", v16);
          objc_msgSend(v16, "removeAllIndexes");
        }
        v23 = objc_msgSend(v9, "count");
        if (v23 >= v17)
          v24 = v17;
        else
          v24 = v23;
        v17 = v24 - 1;
      }
      while ((uint64_t)(v24 - 1) > 0);
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
    v25 = objc_claimAutoreleasedReturnValue();
    v5 = v38;
    periods = v38->_periods;
    v38->_periods = (NSArray *)v25;

    v38->_numberOfRateLimitPolicies = -[NSArray count](v38->_periods, "count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
    v27 = objc_claimAutoreleasedReturnValue();
    maxCounts = v38->_maxCounts;
    v38->_maxCounts = (NSArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v38->_numberOfRateLimitPolicies);
    v29 = objc_claimAutoreleasedReturnValue();
    periodStart = v38->_periodStart;
    v38->_periodStart = (NSMutableArray *)v29;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v38->_numberOfRateLimitPolicies);
    v31 = objc_claimAutoreleasedReturnValue();
    balances = v38->_balances;
    v38->_balances = (NSMutableArray *)v31;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v38->_lastRecorded, v33);
    if (v38->_numberOfRateLimitPolicies >= 1)
    {
      v34 = 0;
      do
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v38->_balances, "setObject:atIndexedSubscript:", &unk_1E272AB28, v34);
        -[NSMutableArray setObject:atIndexedSubscript:](v38->_periodStart, "setObject:atIndexedSubscript:", v33, v34++);
      }
      while (v34 < v38->_numberOfRateLimitPolicies);
    }
    v35 = dispatch_queue_create("com.apple.duet.multilevelratelimiter", 0);
    queue = v38->_queue;
    v38->_queue = (OS_dispatch_queue *)v35;

  }
  return v5;
}

- (BOOL)credit
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___CDMultiLevelRateLimiter_credit__block_invoke;
  block[3] = &unk_1E26E2F20;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (BOOL)debited
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35___CDMultiLevelRateLimiter_debited__block_invoke;
  v5[3] = &unk_1E26E4A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)recordTimeAndRefillIfNeededRaw
{
  NSDate *v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSDate *lastRecorded;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_numberOfRateLimitPolicies >= 1)
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_periodStart, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", v5);
      v7 = v6;
      -[NSArray objectAtIndexedSubscript:](self->_periods, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      if (v7 > v10)
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_periodStart, "setObject:atIndexedSubscript:", v3, v4);
        -[NSMutableArray setObject:atIndexedSubscript:](self->_balances, "setObject:atIndexedSubscript:", &unk_1E272AB28, v4);
      }
      ++v4;
    }
    while (self->_numberOfRateLimitPolicies > v4);
  }
  lastRecorded = self->_lastRecorded;
  self->_lastRecorded = v3;

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ per %@"), v5, self->_maxCounts, self->_periods);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDate)lastRecorded
{
  return self->_lastRecorded;
}

- (int64_t)numOfRateLimitPolicies
{
  return self->_numberOfRateLimitPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_maxCounts, 0);
  objc_storeStrong((id *)&self->_periodStart, 0);
  objc_storeStrong((id *)&self->_periods, 0);
  objc_storeStrong((id *)&self->_lastRecorded, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
