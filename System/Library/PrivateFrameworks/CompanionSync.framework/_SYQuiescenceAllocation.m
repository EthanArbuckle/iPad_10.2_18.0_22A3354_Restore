@implementation _SYQuiescenceAllocation

- (void)returnAddress
{
  return self->_returnAddress;
}

- (void)setReturnAddress:(void *)a3
{
  self->_returnAddress = a3;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
