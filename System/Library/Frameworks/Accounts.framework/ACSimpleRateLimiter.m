@implementation ACSimpleRateLimiter

- (ACSimpleRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4
{
  ACSimpleRateLimiter *v6;
  ACSimpleRateLimiter *v7;
  NSLock *v8;
  NSLock *instanceLock;
  uint64_t v10;
  NSMutableArray *sortedActionDates;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ACSimpleRateLimiter;
  v6 = -[ACSimpleRateLimiter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maximum = a3;
    v6->_timeInterval = a4;
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    instanceLock = v7->_instanceLock;
    v7->_instanceLock = v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    sortedActionDates = v7->_sortedActionDates;
    v7->_sortedActionDates = (NSMutableArray *)v10;

  }
  return v7;
}

- (BOOL)reservePerformActionNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  -[ACSimpleRateLimiter instanceLock](self, "instanceLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSimpleRateLimiter rateLimitingStartDate](self, "rateLimitingStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSimpleRateLimiter locked_removeDatesBefore:](self, "locked_removeDatesBefore:", v5);

  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[ACSimpleRateLimiter maximum](self, "maximum");

  if (v7 < v8)
    -[ACSimpleRateLimiter locked_addDate:](self, "locked_addDate:", v4);
  -[ACSimpleRateLimiter instanceLock](self, "instanceLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v7 < v8;
}

- (BOOL)isEmptyAfterFlushing
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[ACSimpleRateLimiter instanceLock](self, "instanceLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ACSimpleRateLimiter rateLimitingStartDate](self, "rateLimitingStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSimpleRateLimiter locked_removeDatesBefore:](self, "locked_removeDatesBefore:", v4);

  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  -[ACSimpleRateLimiter instanceLock](self, "instanceLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (NSDate)rateLimitingStartDate
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[ACSimpleRateLimiter timeInterval](self, "timeInterval");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", -v3);
}

- (unint64_t)locked_indexOfFirstAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_9);

  return v7;
}

uint64_t __48__ACSimpleRateLimiter_locked_indexOfFirstAfter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)locked_removeDatesBefore:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[ACSimpleRateLimiter locked_indexOfFirstAfter:](self, "locked_indexOfFirstAfter:", a3);
  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInRange:", 0, v4);

}

- (void)locked_addDate:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[ACSimpleRateLimiter locked_indexOfFirstAfter:](self, "locked_indexOfFirstAfter:", v4);
  -[ACSimpleRateLimiter sortedActionDates](self, "sortedActionDates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", v4, v5);

}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (NSLock)instanceLock
{
  return (NSLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstanceLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)sortedActionDates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSortedActionDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedActionDates, 0);
  objc_storeStrong((id *)&self->_instanceLock, 0);
}

@end
