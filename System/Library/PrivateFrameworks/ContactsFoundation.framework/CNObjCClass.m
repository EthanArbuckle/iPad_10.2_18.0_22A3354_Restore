@implementation CNObjCClass

+ (id)classWithClass:(Class)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithClass:", a3);
}

- (CNObjCClass)initWithClass:(Class)a3
{
  CNObjCClass *v4;
  CNObjCClass *v5;
  CNObjCClass *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNObjCClass;
  v4 = -[CNObjCClass init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cls = a3;
    v6 = v4;
  }

  return v5;
}

+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CNObjCClass_enumerateMethodsOfClass_withBlock___block_invoke;
  v7[3] = &unk_1E29BC5B8;
  v8 = v5;
  v6 = v5;
  +[CNObjCRuntimeAPI enumerateMethodsOfClass:withBlock:](CNObjCRuntimeAPI, "enumerateMethodsOfClass:withBlock:", a3, v7);

}

void __49__CNObjCClass_enumerateMethodsOfClass_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  CNObjCMethod *v5;

  v4 = (void *)MEMORY[0x194004260]();
  v5 = -[CNObjCMethod initWithMethod:]([CNObjCMethod alloc], "initWithMethod:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_autoreleasePoolPop(v4);
}

- (void)enumerateMethodsWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "enumerateMethodsOfClass:withBlock:", self->_cls, v4);

}

+ (id)instanceMethodOfClass:(Class)a3 forSelector:(SEL)a4
{
  CNObjCMethod *InstanceMethod;

  InstanceMethod = (CNObjCMethod *)class_getInstanceMethod(a3, a4);
  if (InstanceMethod)
    InstanceMethod = -[CNObjCMethod initWithMethod:]([CNObjCMethod alloc], "initWithMethod:", InstanceMethod);
  return InstanceMethod;
}

+ (id)allMethodsOfClass:(Class)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__CNObjCClass_allMethodsOfClass___block_invoke;
  v8[3] = &unk_1E29BC5E0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a1, "enumerateMethodsOfClass:withBlock:", a3, v8);

  return v6;
}

uint64_t __33__CNObjCClass_allMethodsOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)allMethods
{
  return (id)objc_msgSend((id)objc_opt_class(), "allMethodsOfClass:", self->_cls);
}

- (id)instanceMethodForSelector:(SEL)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodOfClass:forSelector:", self->_cls, a3);
}

+ (BOOL)addMethod:(id)a3 toClass:(Class)a4
{
  id v5;
  const char *v6;
  void (*v7)(void);
  void *v8;
  id v9;

  v5 = a3;
  v6 = (const char *)objc_msgSend(v5, "selector");
  v7 = (void (*)(void))objc_msgSend(v5, "implementation");
  objc_msgSend(v5, "typeEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  LOBYTE(a4) = class_addMethod(a4, v6, v7, (const char *)objc_msgSend(v9, "UTF8String"));

  return (char)a4;
}

- (BOOL)addMethod:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "addMethod:toClass:", v4, self->_cls);

  return (char)self;
}

@end
