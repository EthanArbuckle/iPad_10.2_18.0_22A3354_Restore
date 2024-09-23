@implementation CRXUDispatchSemaphore

- (CRXUDispatchSemaphore)initWithValue:(unint64_t)a3
{
  CRXUDispatchSemaphore *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *sem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRXUDispatchSemaphore;
  v4 = -[CRXUDispatchSemaphore init](&v8, sel_init);
  if (v4)
  {
    v5 = dispatch_semaphore_create(a3);
    sem = v4->_sem;
    v4->_sem = (OS_dispatch_semaphore *)v5;

  }
  return v4;
}

- (CRXUDispatchSemaphore)init
{
  return -[CRXUDispatchSemaphore initWithValue:](self, "initWithValue:", 0);
}

- (void)signal
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)wait
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sem, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)waitFor:(double)a3
{
  NSObject *sem;
  dispatch_time_t v4;

  sem = self->_sem;
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_semaphore_wait(sem, v4) == 0;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
}

@end
