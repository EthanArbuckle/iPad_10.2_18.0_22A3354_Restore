@implementation _IKDOMBindingControllerUpdateRecord

- (id)preUpdate
{
  return self->_preUpdate;
}

- (void)setPreUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_update, 0);
  objc_storeStrong(&self->_preUpdate, 0);
}

@end
