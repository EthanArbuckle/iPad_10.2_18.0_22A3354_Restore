@implementation AAFFuture

- (AAFFuture)init
{
  return -[AAFFuture initWithMaxWait:description:](self, "initWithMaxWait:description:", 0, 0.0);
}

- (AAFFuture)initWithMaxWait:(double)a3 description:(id)a4
{
  id v6;
  AAFFuture *v7;
  uint64_t v8;
  NSCondition *valueCondition;
  uint64_t v10;
  NSDate *beginDate;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAFFuture;
  v7 = -[AAFFuture init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    valueCondition = v7->_valueCondition;
    v7->_valueCondition = (NSCondition *)v8;

    -[NSCondition setName:](v7->_valueCondition, "setName:", v6);
    if (a3 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = objc_claimAutoreleasedReturnValue();
      beginDate = v7->_beginDate;
      v7->_beginDate = (NSDate *)v10;

      v7->_maxWait = a3;
    }
  }

  return v7;
}

- (void)setValue:(id)a3
{
  id v4;
  id valueObj;
  id v6;

  v4 = a3;
  -[NSCondition lock](self->_valueCondition, "lock");
  valueObj = self->_valueObj;
  self->_valueObj = v4;
  v6 = v4;

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
  return self->_valueObj;
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

- (id)valueObj
{
  return self->_valueObj;
}

- (void)setValueObj:(id)a3
{
  objc_storeStrong(&self->_valueObj, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueObj, 0);
  objc_storeStrong((id *)&self->_valueCondition, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end
