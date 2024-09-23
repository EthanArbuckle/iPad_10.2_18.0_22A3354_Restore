@implementation SGXpcTransaction

- (SGXpcTransaction)initWithName:(const void *)a3
{
  SGXpcTransaction *v3;
  uint64_t v4;
  OS_os_transaction *transaction;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGXpcTransaction;
  v3 = -[SGXpcTransaction init](&v7, sel_init);
  if (v3)
  {
    v4 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v4;

  }
  return v3;
}

- (void)setTimeout:(double)a3
{
  double v6;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD handler[4];
  id v20;
  id location;

  if (!self->_transaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXpcTransaction.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_transaction != nil"));

  }
  if (self->_timeoutTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGXpcTransaction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_timeoutTimer == nil"));

  }
  v6 = fmax(a3, 0.0);
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  location = 0;
  objc_initWeak(&location, self);
  v10 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__SGXpcTransaction_setTimeout___block_invoke;
  handler[3] = &unk_1E7DB7010;
  objc_copyWeak(&v20, &location);
  dispatch_source_set_event_handler(v10, handler);
  v11 = 0;
  v12 = self->_timeoutTimer;
  if (v6 > 0.0)
  {
    if (v6 <= 9223372040.0)
      v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    else
      v11 = -1;
  }
  v13 = v6 / 10.0;
  if (v6 / 10.0 < 0.001)
    v13 = 0.001;
  v14 = v13 * 1000000000.0;
  v15 = v13 < 60.0;
  v16 = 6.0e10;
  if (v15)
    v16 = v14;
  dispatch_source_set_timer(v12, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v16);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (BOOL)doneReturningWasDone
{
  atomic_flag *p_done;
  unsigned __int8 v4;
  OS_os_transaction *transaction;
  NSObject *timeoutTimer;
  OS_dispatch_source *v7;

  p_done = &self->_done;
  do
    v4 = __ldaxr((unsigned __int8 *)p_done);
  while (__stlxr(1u, (unsigned __int8 *)p_done));
  if ((v4 & 1) == 0)
  {
    transaction = self->_transaction;
    self->_transaction = 0;

    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      v7 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
  }
  return v4 & 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SGXpcTransaction done](self, "done");
  v3.receiver = self;
  v3.super_class = (Class)SGXpcTransaction;
  -[SGXpcTransaction dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __31__SGXpcTransaction_setTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "done");

}

+ (SGXpcTransaction)transactionWithName:(const void *)a3
{
  return -[SGXpcTransaction initWithName:]([SGXpcTransaction alloc], "initWithName:", a3);
}

@end
