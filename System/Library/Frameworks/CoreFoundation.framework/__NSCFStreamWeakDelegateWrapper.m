@implementation __NSCFStreamWeakDelegateWrapper

- (__NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  __NSCFStreamWeakDelegateWrapper *v4;
  __NSCFStreamWeakDelegateWrapper *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)__NSCFStreamWeakDelegateWrapper;
  v4 = -[__NSCFStreamWeakDelegateWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    _NSObjectStoreWeak((id *)&v4->_object, a3, &v4->_useFallback);
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _NSObjectStoreWeak((id *)&self->_object, 0, &self->_useFallback);
  v3.receiver = self;
  v3.super_class = (Class)__NSCFStreamWeakDelegateWrapper;
  -[__NSCFStreamWeakDelegateWrapper dealloc](&v3, sel_dealloc);
}

- (id)retainedDelegate
{
  return _NSObjectLoadWeakRetained((id *)&self->_object, &self->_useFallback);
}

@end
