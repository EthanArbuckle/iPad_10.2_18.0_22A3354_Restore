@implementation MAGraphSpecification

- (MAGraphSpecification)init
{
  MAGraphSpecification *v2;
  uint64_t v3;
  Class defaultNodeClass;
  uint64_t v5;
  Class defaultEdgeClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MAGraphSpecification;
  v2 = -[MAGraphSpecification init](&v8, sel_init);
  if (v2)
  {
    objc_opt_class();
    v3 = objc_claimAutoreleasedReturnValue();
    defaultNodeClass = v2->_defaultNodeClass;
    v2->_defaultNodeClass = (Class)v3;

    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
    defaultEdgeClass = v2->_defaultEdgeClass;
    v2->_defaultEdgeClass = (Class)v5;

  }
  return v2;
}

- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return self->_defaultNodeClass;
}

- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  return self->_defaultEdgeClass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_QWORD *)(v4 + 8) = self->_persistenceOptions;
  objc_storeStrong((id *)(v4 + 16), self->_defaultNodeClass);
  objc_storeStrong((id *)(v4 + 24), self->_defaultEdgeClass);
  objc_storeStrong((id *)(v4 + 32), self->_rootGraphReference);
  return (id)v4;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (void)setPersistenceOptions:(int64_t)a3
{
  self->_persistenceOptions = a3;
}

- (Class)defaultNodeClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultNodeClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (Class)defaultEdgeClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultEdgeClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MAGraphReference)rootGraphReference
{
  return self->_rootGraphReference;
}

- (void)setRootGraphReference:(id)a3
{
  objc_storeStrong((id *)&self->_rootGraphReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootGraphReference, 0);
  objc_storeStrong((id *)&self->_defaultEdgeClass, 0);
  objc_storeStrong((id *)&self->_defaultNodeClass, 0);
}

@end
