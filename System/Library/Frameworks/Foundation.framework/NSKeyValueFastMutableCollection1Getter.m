@implementation NSKeyValueFastMutableCollection1Getter

- (NSKeyValueFastMutableCollection1Getter)initWithContainerClassID:(id)a3 key:(id)a4 nonmutatingMethods:(id)a5 mutatingMethods:(id)a6 proxyClass:(Class)a7
{
  NSKeyValueFastMutableCollection1Getter *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueFastMutableCollection1Getter;
  v9 = -[NSKeyValueProxyGetter initWithContainerClassID:key:proxyClass:](&v11, sel_initWithContainerClassID_key_proxyClass_, a3, a4, a7);
  if (v9)
  {
    v9->_nonmutatingMethods = (NSKeyValueNonmutatingCollectionMethodSet *)a5;
    v9->_mutatingMethods = (NSKeyValueMutatingCollectionMethodSet *)a6;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableCollection1Getter;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)nonmutatingMethods
{
  return self->_nonmutatingMethods;
}

- (id)mutatingMethods
{
  return self->_mutatingMethods;
}

@end
