@implementation AVDispatchOnce

- (AVDispatchOnce)init
{
  AVDispatchOnce *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDispatchOnce;
  result = -[AVDispatchOnce init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)runBlockOnce:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_testFlag)
  {
    self->_testFlag = 1;
    (*((void (**)(id))a3 + 2))(a3);
  }
  os_unfair_lock_unlock(p_lock);
}

@end
