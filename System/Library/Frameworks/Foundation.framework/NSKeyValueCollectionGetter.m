@implementation NSKeyValueCollectionGetter

- (NSKeyValueCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 methods:(id)a5 proxyClass:(Class)a6
{
  NSKeyValueCollectionGetter *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSKeyValueCollectionGetter;
  v7 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:](&v9, sel_initWithContainerClassID_key_proxyClass_, a3, a4, a6);
  if (v7)
    v7->_methods = (NSKeyValueNonmutatingCollectionMethodSet *)a5;
  return v7;
}

- (id)methods
{
  return self->_methods;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

@end
