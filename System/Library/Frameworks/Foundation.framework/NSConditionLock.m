@implementation NSConditionLock

- (NSInteger)condition
{
  return self->v;
}

- (NSConditionLock)initWithCondition:(NSInteger)condition
{
  NSConditionLock *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSConditionLock;
  v4 = -[NSConditionLock init](&v6, sel_init);
  v4->cond = -[NSCondition init](+[NSCondition allocWithZone:](NSCondition, "allocWithZone:", -[NSConditionLock zone](v4, "zone")), "init");
  v4->t = 0;
  v4->v = condition;
  v4->n = 0;
  return v4;
}

- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit
{
  BOOL v7;

  -[NSCondition lock](self->cond, "lock");
  while (!pthread_equal(0, self->t) || self->v != condition)
  {
    if (!-[NSCondition waitUntilDate:](self->cond, "waitUntilDate:", limit))
    {
      v7 = 0;
      goto LABEL_7;
    }
  }
  self->t = pthread_self();
  v7 = 1;
LABEL_7:
  -[NSCondition unlock](self->cond, "unlock");
  return v7;
}

- (void)unlockWithCondition:(NSInteger)condition
{
  -[NSCondition lock](self->cond, "lock");
  self->t = 0;
  self->v = condition;
  -[NSCondition broadcast](self->cond, "broadcast");
  -[NSCondition unlock](self->cond, "unlock");
}

- (void)unlock
{
  -[NSCondition lock](self->cond, "lock");
  self->t = 0;
  -[NSCondition broadcast](self->cond, "broadcast");
  -[NSCondition unlock](self->cond, "unlock");
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  int v5;

  -[NSCondition lock](self->cond, "lock");
  while (1)
  {
    v5 = pthread_equal(0, self->t);
    if (v5)
      break;
    if (!-[NSCondition waitUntilDate:](self->cond, "waitUntilDate:", limit))
      goto LABEL_6;
  }
  self->t = pthread_self();
LABEL_6:
  -[NSCondition unlock](self->cond, "unlock");
  return v5 != 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConditionLock;
  -[NSConditionLock dealloc](&v3, sel_dealloc);
}

- (void)lockWhenCondition:(NSInteger)condition
{
  -[NSConditionLock lockWhenCondition:beforeDate:](self, "lockWhenCondition:beforeDate:", condition, objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"));
}

- (void)lock
{
  -[NSConditionLock lockBeforeDate:](self, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"));
}

- (void)setName:(NSString *)name
{
  NSString *n;

  n = self->n;
  if (n != name)
  {

    self->n = (NSString *)-[NSString copy](name, "copy");
  }
}

- (BOOL)tryLockWhenCondition:(NSInteger)condition
{
  return -[NSConditionLock lockWhenCondition:beforeDate:](self, "lockWhenCondition:beforeDate:", condition, objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
}

- (NSConditionLock)init
{
  return -[NSConditionLock initWithCondition:](self, "initWithCondition:", 0);
}

- (BOOL)tryLock
{
  return -[NSConditionLock lockBeforeDate:](self, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"));
}

- (id)description
{
  id v3;
  const char *v4;
  NSString *n;
  NSString *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSConditionLock;
  v3 = -[NSConditionLock description](&v8, sel_description);
  v4 = "'";
  n = self->n;
  if (!n)
    v4 = "";
  v6 = (NSString *)CFSTR("nil");
  if (n)
    v6 = self->n;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{condition = %ld, name = %s%@%s}"), v3, self->v, v4, v6, v4);
}

- (NSString)name
{
  return self->n;
}

@end
