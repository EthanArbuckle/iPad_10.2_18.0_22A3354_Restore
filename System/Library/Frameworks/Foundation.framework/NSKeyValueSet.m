@implementation NSKeyValueSet

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare_2;
  if (!_proxyShare_proxyShare_2)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_2 = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  NSKeyValueSet *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueSet;
  v6 = -[NSKeyValueSet init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)objc_msgSend(a4, "key");
    v6->_methods = (NSKeyValueNonmutatingSetMethodSet *)(id)objc_msgSend(a4, "methods");
  }
  return v6;
}

- ($37969B22FF855670809DBD7BF2B8540E)_proxyLocator
{
  NSString *key;
  NSObject *container;
  $37969B22FF855670809DBD7BF2B8540E result;

  key = self->_key;
  container = self->_container;
  result.var1 = key;
  result.var0 = container;
  return result;
}

- (void)_proxyNonGCFinalize
{

  self->_container = 0;
  self->_key = 0;
  self->_methods = 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueSet;
    -[NSKeyValueSet dealloc](&v3, sel_dealloc);
  }
}

- (unint64_t)count
{
  unint64_t result;

  method_invoke();
  return result;
}

- (id)member:(id)a3
{
  id result;

  method_invoke();
  return result;
}

- (id)objectEnumerator
{
  id result;

  method_invoke();
  return result;
}

@end
