@implementation HDSynchronousTaskGroup

- (HDSynchronousTaskGroup)init
{
  HDSynchronousTaskGroup *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDSynchronousTaskGroup;
  result = -[HDSynchronousTaskGroup init](&v3, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_success = 1;
  }
  return result;
}

- (int)taskCount
{
  return atomic_load((unsigned int *)&self->_taskCount);
}

- (int64_t)beginTask
{
  int *p_taskCount;
  unsigned int v3;
  signed int v4;

  p_taskCount = &self->_taskCount;
  do
  {
    v3 = __ldaxr((unsigned int *)p_taskCount);
    v4 = v3 + 1;
  }
  while (__stlxr(v4, (unsigned int *)p_taskCount));
  return v4;
}

- (void)failTaskWithError:(id)a3
{
  NSMutableArray *errors;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_success = 0;
  if (v7)
  {
    errors = self->_errors;
    if (!errors)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v6 = self->_errors;
      self->_errors = v5;

      errors = self->_errors;
    }
    -[NSMutableArray addObject:](errors, "addObject:", v7);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[HDSynchronousTaskGroup finishTask](self, "finishTask");

}

- (void)finishTask
{
  int *p_taskCount;
  int v5;
  _BOOL8 success;
  NSMutableArray *errors;
  NSMutableArray *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableArray *v11;

  p_taskCount = &self->_taskCount;
  do
    v5 = __ldaxr((unsigned int *)p_taskCount);
  while (__stlxr(v5 - 1, (unsigned int *)p_taskCount));
  if (v5 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray handleFailureInMethod:object:file:lineNumber:description:](v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSynchronousTaskGroup.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultCount >= 0"));
LABEL_10:

    return;
  }
  if (v5 == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    success = self->_success;
    errors = self->_errors;
    if (!errors)
      errors = (NSMutableArray *)MEMORY[0x24BDBD1A8];
    v11 = errors;
    v8 = self->_errors;
    self->_errors = 0;

    self->_success = 1;
    os_unfair_lock_unlock(&self->_lock);
    -[HDSynchronousTaskGroup delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousTaskGroup:didFinishWithSuccess:errors:", self, success, v11);

    -[HDSynchronousTaskGroup didFinish](self, "didFinish");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HDSynchronousTaskGroup setDidFinish:](self, "setDidFinish:", 0);
    if (v10)
      ((void (**)(_QWORD, HDSynchronousTaskGroup *, _BOOL8, NSMutableArray *))v10)[2](v10, self, success, v11);

    goto LABEL_10;
  }
}

- (HDSynchronousTaskGroupDelegate)delegate
{
  return (HDSynchronousTaskGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)didFinish
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidFinish:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinish, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
