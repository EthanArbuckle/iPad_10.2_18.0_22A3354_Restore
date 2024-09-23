@implementation NSKeyValueNotifyingMutableCollectionGetter

- (NSKeyValueNotifyingMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 mutableCollectionGetter:(id)a5 proxyClass:(Class)a6
{
  NSKeyValueNotifyingMutableCollectionGetter *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSKeyValueNotifyingMutableCollectionGetter;
  v7 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:](&v9, sel_initWithContainerClassID_key_proxyClass_, a3, a4, a6);
  if (v7)
    v7->_mutableCollectionGetter = (NSKeyValueProxyGetter *)a5;
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNotifyingMutableCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)mutableCollectionGetter
{
  return self->_mutableCollectionGetter;
}

@end
