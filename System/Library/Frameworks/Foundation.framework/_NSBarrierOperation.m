@implementation _NSBarrierOperation

- (void)main
{
  os_unfair_lock_s *p_lock;
  void (**block)(void);

  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  block = (void (**)(void))self->_block;
  self->_block = 0;
  os_unfair_lock_unlock(p_lock);
  block[2]();

}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSBarrierOperation;
  -[NSOperation dealloc](&v3, sel_dealloc);
}

- (int64_t)queuePriority
{
  return 12;
}

@end
