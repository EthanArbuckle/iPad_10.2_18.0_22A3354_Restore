@implementation NSKeyValueSlowMutableCollectionGetter

- (NSKeyValueSlowMutableCollectionGetter)initWithContainerClassID:(id)a3 key:(id)a4 baseGetter:(id)a5 baseSetter:(id)a6 containerIsa:(Class)a7 proxyClass:(Class)a8
{
  NSKeyValueSlowMutableCollectionGetter *v13;
  NSKeyValueSlowGetter *v14;
  NSKeyValueSlowSetter *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NSKeyValueSlowMutableCollectionGetter;
  v13 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:](&v17, sel_initWithContainerClassID_key_proxyClass_, a3, a4, a8);
  if (v13)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = -[NSKeyValueSlowGetter initWithContainerClassID:key:containerIsa:]([NSKeyValueSlowGetter alloc], "initWithContainerClassID:key:containerIsa:", a3, a4, a7);
    else
      v14 = (NSKeyValueSlowGetter *)a5;
    v13->_baseGetter = &v14->super;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = -[NSKeyValueSlowSetter initWithContainerClassID:key:containerIsa:]([NSKeyValueSlowSetter alloc], "initWithContainerClassID:key:containerIsa:", a3, a4, a7);
    else
      v15 = (NSKeyValueSlowSetter *)a6;
    v13->_baseSetter = &v15->super;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSlowMutableCollectionGetter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)baseGetter
{
  return self->_baseGetter;
}

- (id)baseSetter
{
  return self->_baseSetter;
}

- (BOOL)treatNilValuesLikeEmptyCollections
{
  char isKindOfClass;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end
