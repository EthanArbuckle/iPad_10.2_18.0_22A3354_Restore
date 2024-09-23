@implementation SGLongRunningTask

- (SGLongRunningTask)initWithDeadline:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  SGLongRunningTask *v9;
  SGLongRunningTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGLongRunningTask;
  v9 = -[SGLongRunningTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deadline, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
  }

  return v10;
}

- (BOOL)shouldDefer
{
  unsigned __int8 v2;
  NSDate *deadline;
  void *v4;

  v2 = atomic_load((unsigned __int8 *)&self->_deferRequested);
  if ((v2 & 1) != 0)
  {
    LOBYTE(deadline) = 1;
  }
  else
  {
    deadline = self->_deadline;
    if (deadline)
    {
      v4 = (void *)objc_opt_new();
      LOBYTE(deadline) = -[NSDate compare:](deadline, "compare:", v4) == NSOrderedAscending;

    }
  }
  return (char)deadline;
}

- (void)requestDefer
{
  atomic_store(1u, (unsigned __int8 *)&self->_deferRequested);
}

- (void)markFinished
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "unregister:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end
