@implementation VSSemaphore

- (VSSemaphore)init
{
  VSSemaphore *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *semaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSSemaphore;
  v2 = -[VSSemaphore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (void)signal
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)wait
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
