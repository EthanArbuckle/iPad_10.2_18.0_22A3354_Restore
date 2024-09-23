@implementation BSAbstractDefaultDomainClassMetadata

- (_QWORD)initWithClass:(void *)a1
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  objc_super v12;

  if (!a1)
    return 0;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithClass_, a1, CFSTR("_BSAbstractDefaultDomainClassMetadata.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clazz"));

  }
  v12.receiver = a1;
  v12.super_class = (Class)BSAbstractDefaultDomainClassMetadata;
  v4 = objc_msgSendSuper2(&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4[1] = a2;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)v5[3];
    v5[3] = v8;

  }
  return v5;
}

- (BSAbstractDefaultDomainClassMetadata)init
{
  return (BSAbstractDefaultDomainClassMetadata *)-[BSAbstractDefaultDomainClassMetadata initWithClass:](self, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p propertyNameToPropertyMap: %@\nselectorToPropertyMap: %@>"), v5, self, self->_propertyNameToPropertyMap, self->_selectorToPropertyMap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorToPropertyMap, 0);
  objc_storeStrong((id *)&self->_propertyNameToPropertyMap, 0);
}

@end
