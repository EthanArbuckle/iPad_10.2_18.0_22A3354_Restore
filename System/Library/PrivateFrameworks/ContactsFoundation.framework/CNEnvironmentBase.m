@implementation CNEnvironmentBase

+ (id)currentEnvironmentForKey:(void *)a3
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "effectiveReadingStackForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peek");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(a1, "defaultEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)effectiveReadingStackForKey:(void *)a3
{
  id v5;
  void *v6;
  id v7;

  dispatch_get_specific(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    dispatch_queue_get_specific(MEMORY[0x1E0C80D38], a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (!v7)
    {
      objc_msgSend(a1, "defaultStack");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

+ (id)defaultStack
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (defaultStack_cn_once_token_1 != -1)
    dispatch_once(&defaultStack_cn_once_token_1, &__block_literal_global_78);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (id)defaultStack_cn_once_object_1;
  objc_msgSend(v3, "stringWithUTF8String:", objc_msgSend(a1, "environmentStackKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:onCacheMiss:", v5, &__block_literal_global_4_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)currentEnvironment
{
  return (id)objc_msgSend(a1, "currentEnvironmentForKey:", objc_msgSend(a1, "environmentStackKey"));
}

void __33__CNEnvironmentBase_defaultStack__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CNCache atomicCache](CNCache, "atomicCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultStack_cn_once_object_1;
  defaultStack_cn_once_object_1 = v0;

}

CNStack *__33__CNEnvironmentBase_defaultStack__block_invoke_2()
{
  return objc_alloc_init(CNStack);
}

+ (id)defaultEnvironment
{
  id v2;

  CNAbstractMethodException(a1, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)effectiveWritingStackForKey:(void *)a3
{
  CNStack *v4;
  CNStack *v5;
  NSObject *v6;

  dispatch_get_specific(a3);
  v4 = (CNStack *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v5 = objc_alloc_init(CNStack);
    dispatch_get_current_queue();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_set_specific(v6, a3, v5, 0);
    objc_setAssociatedObject(v6, a3, v5, (void *)0x301);

  }
  return v5;
}

+ (char)environmentStackKey
{
  id v2;

  CNAbstractMethodException(a1, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)becomeCurrent
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  objc_msgSend(v3, "effectiveWritingStackForKey:", objc_msgSend((id)objc_opt_class(), "environmentStackKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "push:", self);

}

- (void)resignCurrent
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  objc_msgSend(v3, "effectiveReadingStackForKey:", objc_msgSend((id)objc_opt_class(), "environmentStackKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
