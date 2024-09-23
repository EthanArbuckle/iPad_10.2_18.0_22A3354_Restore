@implementation SUUIWeakReference

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
}

@end
