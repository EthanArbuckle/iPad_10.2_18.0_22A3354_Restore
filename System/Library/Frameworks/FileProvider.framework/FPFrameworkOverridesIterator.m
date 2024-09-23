@implementation FPFrameworkOverridesIterator

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EE5F80A0, a3, 0, 1);
  if (MethodDescription == 0uLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 url:(__CFURL *)a4 noSuitableModuleFoundHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id noSuitableModuleFoundHandler;
  unsigned __int8 v13;

  v9 = a3;
  objc_storeStrong((id *)&self->_overrides, a3);
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1B00850]();

  noSuitableModuleFoundHandler = self->_noSuitableModuleFoundHandler;
  self->_noSuitableModuleFoundHandler = v11;

  if (a4)
  {
    self->_checkURL = 1;
    v13 = FPURLMightBeInFileProvider(a4);
  }
  else
  {
    v13 = 0;
    self->_checkURL = 0;
  }
  self->_mightBeFPURL = v13;

  return self;
}

- (void)forwardInvocation:(id)a3
{
  NSInvocation **p_invocation;
  id v6;

  p_invocation = &self->_invocation;
  objc_storeStrong((id *)&self->_invocation, a3);
  v6 = a3;
  -[NSInvocation retainArguments](*p_invocation, "retainArguments");

  -[FPFrameworkOverridesIterator callNextOverrides](self, "callNextOverrides");
}

- (void)finish
{
  NSInvocation *invocation;

  invocation = self->_invocation;
  self->_invocation = 0;

}

- (void)callNextOverrides
{
  void *v4;
  unint64_t currentIndex;
  unint64_t v6;
  void (**noSuitableModuleFoundHandler)(void);
  id v8;
  void *v9;
  NSInvocation *invocation;
  NSInvocation *v11;

  if (!self->_invocation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFrameworkOverridesIterator.m"), 234, CFSTR("Object misuses: you can only call -callNextOverrides after you have invoked the method once"));

  }
  currentIndex = self->_currentIndex;
  if (currentIndex >= -[NSArray count](self->_overrides, "count"))
  {
LABEL_8:
    noSuitableModuleFoundHandler = (void (**)(void))self->_noSuitableModuleFoundHandler;
    if (noSuitableModuleFoundHandler)
    {
      noSuitableModuleFoundHandler[2]();
      v8 = self->_noSuitableModuleFoundHandler;
    }
    else
    {
      v8 = 0;
    }
    self->_noSuitableModuleFoundHandler = 0;

    invocation = self->_invocation;
    self->_invocation = 0;
  }
  else
  {
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_overrides, "objectAtIndexedSubscript:", self->_currentIndex);
      v11 = (NSInvocation *)objc_claimAutoreleasedReturnValue();
      ++self->_currentIndex;
      -[NSInvocation selector](self->_invocation, "selector");
      if ((objc_opt_respondsToSelector() & 1) != 0 && (!self->_checkURL || self->_mightBeFPURL))
        break;

      v6 = self->_currentIndex;
      if (v6 >= -[NSArray count](self->_overrides, "count"))
        goto LABEL_8;
    }
    -[NSInvocation fp_copy](self->_invocation, "fp_copy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invokeWithTarget:", v11);

    invocation = v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong(&self->_noSuitableModuleFoundHandler, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

+ (id)newIteratorWithNotFoundHandler:(id)a3
{
  return (id)objc_msgSend(a1, "newIteratorForURL:withNotFoundHandler:", 0, a3);
}

+ (id)newIteratorForURL:(__CFURL *)a3 withNotFoundHandler:(id)a4
{
  id v5;
  FPFrameworkOverridesIterator *v6;
  void *v7;
  FPFrameworkOverridesIterator *v8;

  v5 = a4;
  v6 = [FPFrameworkOverridesIterator alloc];
  cachedFrameworkOverridingObjects();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPFrameworkOverridesIterator initWithOverrides:url:noSuitableModuleFoundHandler:](v6, "initWithOverrides:url:noSuitableModuleFoundHandler:", v7, a3, v5);

  return v8;
}

+ (id)allOverrides
{
  void *v2;
  void *v3;

  cachedFrameworkOverridingObjects();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (FPFrameworkOverridesIterator)initWithOverrides:(id)a3 noSuitableModuleFoundHandler:(id)a4
{
  return -[FPFrameworkOverridesIterator initWithOverrides:url:noSuitableModuleFoundHandler:](self, "initWithOverrides:url:noSuitableModuleFoundHandler:", a3, 0, a4);
}

+ (void)addOverride:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = cachedFrameworkOverridingObjects();
    v5 = (void *)objc_msgSend((id)frameworkOverridingObjects, "mutableCopy");
    objc_msgSend(v5, "insertObject:atIndex:", v3, 0);

    v6 = (void *)frameworkOverridingObjects;
    frameworkOverridingObjects = (uint64_t)v5;

  }
}

+ (void)removeOverride:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)frameworkOverridingObjects;
    v4 = a3;
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v4);

    v6 = (void *)frameworkOverridingObjects;
    frameworkOverridingObjects = (uint64_t)v5;

  }
}

@end
