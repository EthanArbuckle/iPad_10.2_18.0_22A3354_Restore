@implementation _HKObservationBlock

- (id)newValueHandler
{
  return self->_newValueHandler;
}

- (void)setNewValueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_newValueHandler, 0);
}

@end
