@implementation NSKeyValueProxyGetter

- (NSKeyValueProxyGetter)initWithContainerClassID:(id)a3 key:(id)a4 proxyClass:(Class)a5
{
  NSKeyValueProxyGetter *result;
  objc_super v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[1] = 0;
  v8[2] = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueProxyGetter;
  v8[0] = self;
  result = -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v7, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, _NSGetProxyValueWithGetter, 0, v8, 1);
  if (result)
    result->_proxyClass = a5;
  return result;
}

- (Class)proxyClass
{
  return self->_proxyClass;
}

@end
