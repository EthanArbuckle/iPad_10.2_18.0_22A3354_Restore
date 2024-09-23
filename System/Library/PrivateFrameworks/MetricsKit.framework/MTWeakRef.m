@implementation MTWeakRef

- (id)value
{
  return objc_loadWeakRetained(&self->_value);
}

- (void)setValue:(id)a3
{
  objc_storeWeak(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_value);
}

@end
