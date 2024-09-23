@implementation DAWaiterWrapper

- (DAWaiterWrapper)init
{
  DAWaiterWrapper *result;
  int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAWaiterWrapper;
  result = -[DAWaiterWrapper init](&v4, sel_init);
  if (result)
  {
    v3 = init___curWaiterNum;
    result->_waiterNum = init___curWaiterNum;
    init___curWaiterNum = v3 + 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)DAWaiterWrapper;
  -[DAWaiterWrapper description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: waiter %@ wants dataclasses %lx"), v4, self->_waiter, self->_dataclasses);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DADataclassLockWatcher)waiter
{
  return self->_waiter;
}

- (void)setWaiter:(id)a3
{
  objc_storeStrong((id *)&self->_waiter, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(int64_t)a3
{
  self->_dataclasses = a3;
}

- (int)waiterNum
{
  return self->_waiterNum;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_waiter, 0);
}

@end
