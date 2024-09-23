@implementation _NSItemProviderTypeCoercion

+ (id)typeCoercionForValue:(id)a3 targetClass:(Class)a4
{
  id v7;

  if (!objc_msgSend(a1, "instancesRespondToSelector:", _selectorForCoercion((uint64_t)a3, a4)))
    return 0;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setValue:", a3);
  objc_msgSend(v7, "setTargetClass:", a4);
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSItemProviderTypeCoercion;
  -[_NSItemProviderTypeCoercion dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldCoerceForCoding
{
  uint64_t v3;
  objc_class *v5;

  v3 = objc_opt_class();
  -[_NSItemProviderTypeCoercion value](self, "value");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  if ((-[objc_class isSubclassOfClass:](-[_NSItemProviderTypeCoercion targetClass](self, "targetClass"), "isSubclassOfClass:", v3) & 1) != 0)return 1;
  v5 = -[_NSItemProviderTypeCoercion targetClass](self, "targetClass");
  return -[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", MEMORY[0x1E0C99D50]);
}

- (id)coerceValueError:(id *)a3
{
  SEL v4;
  void *v5;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = a3;
  v8 = -[_NSItemProviderTypeCoercion value](self, "value");
  v4 = _selectorForCoercion((uint64_t)v8, -[_NSItemProviderTypeCoercion targetClass](self, "targetClass"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", -[_NSItemProviderTypeCoercion methodSignatureForSelector:](self, "methodSignatureForSelector:", v4));
  objc_msgSend(v5, "setSelector:", v4);
  objc_msgSend(v5, "setArgument:atIndex:", &v8, 2);
  objc_msgSend(v5, "setArgument:atIndex:", v9, 3);
  objc_msgSend(v5, "invokeWithTarget:", self);
  v7 = 0;
  objc_msgSend(v5, "getReturnValue:", &v7);
  return v7;
}

- (id)_NSItemProviderTypeCoercion_coercedNSDataValueFromNSURLValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a4);
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSURLValue:(id)a3 error:(id *)a4
{
  return -[NSFileWrapper initWithURL:options:error:]([NSFileWrapper alloc], "initWithURL:options:error:", a3, 0, a4);
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSDataValue:(id)a3 error:(id *)a4
{
  return -[NSFileWrapper initRegularFileWithContents:]([NSFileWrapper alloc], "initRegularFileWithContents:", a3);
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (Class)targetClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setTargetClass:(Class)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
