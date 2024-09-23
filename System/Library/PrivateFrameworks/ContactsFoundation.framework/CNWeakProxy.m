@implementation CNWeakProxy

+ (id)weakProxyWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return v5;
}

- (CNWeakProxy)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  self->_targetClass = (Class)objc_opt_class();
  objc_storeWeak(&self->_weakReference, v4);

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_weakReference);
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  void *v4;
  size_t v5;
  char *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "methodReturnLength");
  if (v5)
  {
    v6 = (char *)v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, v5);
    objc_msgSend(v3, "setReturnValue:", v6);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v6;
  char v7;

  WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  if (WeakRetained)
    v6 = objc_opt_respondsToSelector();
  else
    v6 = -[objc_class instancesRespondToSelector:](self->_targetClass, "instancesRespondToSelector:", a3);
  v7 = v6;

  return v7 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](self->_targetClass, "instanceMethodSignatureForSelector:", a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id *p_weakReference;
  id v5;
  void *WeakRetained;
  void *v7;
  char v8;

  p_weakReference = &self->_weakReference;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_weakReference);
  v7 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self->_targetClass;
  v8 = objc_msgSend(WeakRetained, "conformsToProtocol:", v5);

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  v3 = objc_msgSend(WeakRetained, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id *p_weakReference;
  id v4;
  id WeakRetained;
  char v6;

  p_weakReference = &self->_weakReference;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(p_weakReference);
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  return v6;
}

- (Class)class
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  objc_msgSend(WeakRetained, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakReference);
}

@end
