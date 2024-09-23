@implementation TKKeyPathObservation

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
