@implementation MRWeakProxy

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[MRWeakProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", v5);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MRWeakProxy;
      -[MRWeakProxy forwardInvocation:](&v6, sel_forwardInvocation_, v4);
    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_method_description MethodDescription;
  void *v9;
  objc_super v11;

  -[MRWeakProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "methodSignatureForSelector:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v7;
    goto LABEL_7;
  }
  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  if (!MethodDescription.types
    || (objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)MRWeakProxy;
    -[MRWeakProxy methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

+ (id)weakProxyWithObject:(id)a3 protocol:(id)a4
{
  id v5;
  id v6;
  MRWeakProxy *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MRWeakProxy);
  -[MRWeakProxy setObject:](v7, "setObject:", v6);

  -[MRWeakProxy setProtocol:](v7, "setProtocol:", v5);
  return v7;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak(&self->_object);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  objc_super v6;

  -[MRWeakProxy object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "hash");
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MRWeakProxy;
    v4 = -[MRWeakProxy hash](&v6, sel_hash);
  }

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MRWeakProxy object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Protocol)protocol
{
  return self->_protocol;
}

@end
