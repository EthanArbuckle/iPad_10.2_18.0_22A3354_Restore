@implementation CNObjCMethod

+ (id)methodWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:implementation:typeEncoding:", v9, a4, v8);

  return v10;
}

- (CNObjCMethod)initWithMethod:(objc_method *)a3
{
  const char *Name;
  void *v6;
  IMP Implementation;
  void *v8;
  CNObjCMethod *v9;

  Name = method_getName(a3);
  NSStringFromSelector(Name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Implementation = method_getImplementation(a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", method_getTypeEncoding(a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNObjCMethod initWithName:implementation:typeEncoding:](self, "initWithName:implementation:typeEncoding:", v6, Implementation, v8);

  return v9;
}

- (CNObjCMethod)initWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5
{
  id v8;
  id v9;
  CNObjCMethod *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *typeEncoding;
  CNObjCMethod *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNObjCMethod;
  v10 = -[CNObjCMethod init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_implementation = a4;
    v13 = objc_msgSend(v9, "copy");
    typeEncoding = v10->_typeEncoding;
    v10->_typeEncoding = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (SEL)selector
{
  return NSSelectorFromString(self->_name);
}

- (id)methodBySettingName:(id)a3
{
  return +[CNObjCMethod methodWithName:implementation:typeEncoding:](CNObjCMethod, "methodWithName:implementation:typeEncoding:", a3, self->_implementation, self->_typeEncoding);
}

- (id)performOnObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, -[CNObjCMethod selector](self, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)implementation
{
  return self->_implementation;
}

- (NSString)typeEncoding
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeEncoding, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
