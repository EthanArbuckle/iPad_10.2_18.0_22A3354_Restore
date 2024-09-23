@implementation _CKWeakWrapper

- (_CKWeakWrapper)initWithObject:(id)a3
{
  id v4;
  IMWeakReference *v5;
  IMWeakReference *weakReference;
  objc_class *v7;
  void *targetClass;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D36B18], "weakRefWithObject:", v4);
    v5 = (IMWeakReference *)objc_claimAutoreleasedReturnValue();
    weakReference = self->_weakReference;
    self->_weakReference = v5;

    objc_opt_class();
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    targetClass = self->_targetClass;
    self->_targetClass = v7;
  }
  else
  {
    targetClass = self;
    self = 0;
  }

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v3;
  void *v4;

  -[_CKWeakWrapper weakReference](self, "weakReference", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  void *v4;
  size_t v5;
  size_t v6;
  char *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "methodReturnLength");
  if (v5)
  {
    v6 = v5;
    v7 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v7, v5);
    bzero(v7, v6);
    objc_msgSend(v3, "setReturnValue:", v7);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  void *v4;
  char v5;

  -[_CKWeakWrapper weakReference](self, "weakReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_opt_respondsToSelector();
  else
    v5 = 0;

  return v5 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_CKWeakWrapper weakReference](self, "weakReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "conformsToProtocol:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](-[_CKWeakWrapper targetClass](self, "targetClass"), "instanceMethodSignatureForSelector:", a3);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_CKWeakWrapper weakReference](self, "weakReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_CKWeakWrapper weakReference](self, "weakReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  return v7;
}

- (Class)class
{
  void *v2;
  void *v3;
  void *v4;

  -[_CKWeakWrapper weakReference](self, "weakReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[_CKWeakWrapper weakReference](self, "weakReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  -[_CKWeakWrapper weakReference](self, "weakReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IMWeakReference)weakReference
{
  return self->_weakReference;
}

- (void)setWeakReference:(id)a3
{
  objc_storeStrong((id *)&self->_weakReference, a3);
}

- (Class)targetClass
{
  return self->_targetClass;
}

- (void)setTargetClass:(Class)a3
{
  objc_storeStrong((id *)&self->_targetClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClass, 0);
  objc_storeStrong((id *)&self->_weakReference, 0);
}

@end
