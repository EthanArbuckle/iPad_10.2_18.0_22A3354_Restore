@implementation NSKeyValueMutableArray

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare_0;
  if (!_proxyShare_proxyShare_0)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_0 = (uint64_t)result;
  }
  return result;
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

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  NSKeyValueMutableArray *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueMutableArray;
  v6 = -[NSKeyValueMutableArray init](&v8, sel_init);
  if (v6)
  {
    v6->_container = a3;
    v6->_key = (NSString *)objc_msgSend((id)objc_msgSend(a4, "key"), "copy");
  }
  return v6;
}

- (void)_proxyNonGCFinalize
{

  self->_container = 0;
  self->_key = 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (_NSKeyValueProxyDeallocate(self))
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueMutableArray;
    -[NSKeyValueMutableArray dealloc](&v3, sel_dealloc);
  }
}

- (void)setArray:(id)a3
{
  -[NSKeyValueMutableArray removeAllObjects](self, "removeAllObjects");
  -[NSKeyValueMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", a3);
}

@end
