@implementation AXTrampoline

+ (id)trampolineWithCaller:(id)a3 targetClass:(Class)a4
{
  id v5;
  AXTrampoline *v6;

  v5 = a3;
  v6 = -[AXTrampoline initWithCaller:targetClass:]([AXTrampoline alloc], "initWithCaller:targetClass:", v5, a4);

  return v6;
}

+ (id)methodNotFoundSentinal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXTrampoline_methodNotFoundSentinal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (methodNotFoundSentinal_onceToken != -1)
    dispatch_once(&methodNotFoundSentinal_onceToken, block);
  return (id)methodNotFoundSentinal__shared;
}

void __38__AXTrampoline_methodNotFoundSentinal__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", sel_methodDoesNotExistSentinal);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)methodNotFoundSentinal__shared;
  methodNotFoundSentinal__shared = v1;

}

- (AXTrampoline)initWithCaller:(id)a3 targetClass:(Class)a4
{
  id v6;
  AXTrampoline *v7;
  AXTrampoline *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXTrampoline;
  v7 = -[AXTrampoline init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_caller, v6);
    objc_storeWeak((id *)&v8->_targetClass, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXTrampoline caller](self, "caller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXTrampoline:<%p>. caller:%@ target:%@"), self, v4, -[AXTrampoline targetClass](self, "targetClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)callerIsClass
{
  id WeakRetained;
  objc_class *Class;
  BOOL isMetaClass;

  WeakRetained = objc_loadWeakRetained(&self->_caller);
  Class = object_getClass(WeakRetained);
  isMetaClass = class_isMetaClass(Class);

  return isMetaClass;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXTrampoline methodNotFoundSentinal](AXTrampoline, "methodNotFoundSentinal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    if (-[AXTrampoline warnAboutUnknownSelectors](self, "warnAboutUnknownSelectors"))
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, CFSTR("No method signature to act on. Ignoring this invocation"));
  }
  else
  {
    v6 = -[AXTrampoline _findIMPForSelector:](self, "_findIMPForSelector:", objc_msgSend(v12, "selector"));
    if (v6)
    {
      v7 = v6;
      -[AXTrampoline caller](self, "caller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTarget:", v8);

      objc_msgSend(v12, "invokeUsingIMP:", v7);
    }
    else if (-[AXTrampoline warnAboutUnknownSelectors](self, "warnAboutUnknownSelectors"))
    {
      NSStringFromSelector((SEL)objc_msgSend(v12, "selector"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(&self->_caller);
      v11 = objc_loadWeakRetained((id *)&self->_targetClass);
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, CFSTR("An IMP could not be found for the invocation with selector:%@. caller:%@ target:%@"));

    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v8;

  -[AXTrampoline caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodSignatureForSelector:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (-[AXTrampoline warnAboutUnknownSelectors](self, "warnAboutUnknownSelectors"))
    {
      NSStringFromSelector(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXLogWithFacility(1, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, CFSTR("A methodSignature could not be found for selector:%@, on caller:%@. You probably should not be trampolining this method"));

    }
    +[AXTrampoline methodNotFoundSentinal](AXTrampoline, "methodNotFoundSentinal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_findIMPForSelector:(SEL)a3
{
  objc_class *v5;
  _BOOL4 v6;
  objc_class *Class;
  Method *v8;
  Method *v9;
  uint64_t v10;
  IMP Implementation;
  unsigned int outCount;

  outCount = 0;
  -[AXTrampoline targetClass](self, "targetClass");
  v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXTrampoline callerIsClass](self, "callerIsClass");
  Class = v5;
  if (v6)
    Class = object_getClass(v5);
  v8 = class_copyMethodList(Class, &outCount);
  if (v8)
  {
    v9 = v8;
    if (outCount)
    {
      v10 = 0;
      while (method_getName(v9[v10]) != a3)
      {
        if (++v10 >= (unint64_t)outCount)
          goto LABEL_8;
      }
      Implementation = method_getImplementation(v9[v10]);
    }
    else
    {
LABEL_8:
      Implementation = 0;
    }
    free(v9);
  }
  else
  {
    Implementation = 0;
  }

  return Implementation;
}

- (id)caller
{
  return objc_loadWeakRetained(&self->_caller);
}

- (void)setCaller:(id)a3
{
  objc_storeWeak(&self->_caller, a3);
}

- (Class)targetClass
{
  return (Class)objc_loadWeakRetained((id *)&self->_targetClass);
}

- (void)setTargetClass:(Class)a3
{
  objc_storeWeak((id *)&self->_targetClass, a3);
}

- (BOOL)warnAboutUnknownSelectors
{
  return self->_warnAboutUnknownSelectors;
}

- (void)setWarnAboutUnknownSelectors:(BOOL)a3
{
  self->_warnAboutUnknownSelectors = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetClass);
  objc_destroyWeak(&self->_caller);
}

@end
