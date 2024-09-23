@implementation NSKeyValueArray

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

- (unint64_t)count
{
  unint64_t result;

  method_invoke();
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  NSKeyValueArray *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueArray;
  v6 = -[NSKeyValueArray init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)(id)objc_msgSend(a4, "key");
    v6->_methods = (NSKeyValueNonmutatingArrayMethodSet *)(id)objc_msgSend(a4, "methods");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueArray;
    -[NSKeyValueArray dealloc](&v3, sel_dealloc);
  }
}

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare;
  if (!_proxyShare_proxyShare)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare = (uint64_t)result;
  }
  return result;
}

- (void)_proxyNonGCFinalize
{

  self->_container = 0;
  self->_key = 0;
  self->_methods = 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id result;
  NSIndexSet *v4;
  void *v5;
  void *v6;

  if (self->_methods->objectAtIndex)
  {
    method_invoke();
  }
  else
  {
    v4 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
    method_invoke();
    v6 = v5;

    return (id)objc_msgSend(v6, "objectAtIndex:", 0);
  }
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_methods->getObjectsRange)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueArray;
    -[NSKeyValueArray getObjects:range:](&v4, sel_getObjects_range_, a3, a4.location, a4.length);
  }
}

- (id)objectsAtIndexes:(id)a3
{
  id result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_methods->objectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueArray;
    return -[NSKeyValueArray objectsAtIndexes:](&v4, sel_objectsAtIndexes_, a3);
  }
  return result;
}

@end
