@implementation AKFuture

- (AKFuture)init
{
  return -[AKFuture initWithMaxWait:description:](self, "initWithMaxWait:description:", 0, 0.0);
}

- (AKFuture)initWithMaxWait:(double)a3 description:(id)a4
{
  id v6;
  AKFuture *v7;
  NSMutableArray *v8;
  NSMutableArray *internalWrapper;
  uint64_t v10;
  NSCondition *valueCondition;
  uint64_t v12;
  NSDate *beginDate;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AKFuture;
  v7 = -[AKFuture init](&v15, sel_init);
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    internalWrapper = v7->_internalWrapper;
    v7->_internalWrapper = v8;

    v10 = objc_opt_new();
    valueCondition = v7->_valueCondition;
    v7->_valueCondition = (NSCondition *)v10;

    -[NSCondition setName:](v7->_valueCondition, "setName:", v6);
    if (a3 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = objc_claimAutoreleasedReturnValue();
      beginDate = v7->_beginDate;
      v7->_beginDate = (NSDate *)v12;

      v7->_maxWait = a3;
    }
  }

  return v7;
}

- (void)setValue:(id)a3
{
  NSCondition *valueCondition;
  id v5;

  valueCondition = self->_valueCondition;
  v5 = a3;
  -[NSCondition lock](valueCondition, "lock");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_internalWrapper, "setObject:atIndexedSubscript:", v5, 0);

  self->_resolved = 1;
  -[NSCondition signal](self->_valueCondition, "signal");
  -[NSCondition unlock](self->_valueCondition, "unlock");
}

- (id)value
{
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[NSCondition lock](self->_valueCondition, "lock");
  while (!self->_resolved)
  {
    if (self->_maxWait > 0.0 && self->_beginDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", self->_beginDate);
      v5 = v4;

      if (self->_maxWait - v5 <= 0.0)
        break;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCondition waitUntilDate:](self->_valueCondition, "waitUntilDate:", v6);

    }
    else
    {
      -[NSCondition wait](self->_valueCondition, "wait");
    }
  }
  -[NSCondition unlock](self->_valueCondition, "unlock");
  -[NSMutableArray firstObject](self->_internalWrapper, "firstObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)resolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (double)maxWait
{
  return self->_maxWait;
}

- (void)setMaxWait:(double)a3
{
  self->_maxWait = a3;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_beginDate, a3);
}

- (NSCondition)valueCondition
{
  return self->_valueCondition;
}

- (void)setValueCondition:(id)a3
{
  objc_storeStrong((id *)&self->_valueCondition, a3);
}

- (NSMutableArray)internalWrapper
{
  return self->_internalWrapper;
}

- (void)setInternalWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_internalWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWrapper, 0);
  objc_storeStrong((id *)&self->_valueCondition, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end
