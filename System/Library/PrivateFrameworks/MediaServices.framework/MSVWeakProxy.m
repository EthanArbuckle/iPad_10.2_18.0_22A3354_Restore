@implementation MSVWeakProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  char *types;
  Protocol *v7;
  void *v8;

  if (a3 == a2)
    return 0;
  -[MSVWeakProxy protocol](self, "protocol");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  types = protocol_getMethodDescription(v5, a3, 0, 1).types;

  if (types
    || (-[MSVWeakProxy protocol](self, "protocol"),
        v7 = (Protocol *)objc_claimAutoreleasedReturnValue(),
        types = protocol_getMethodDescription(v7, a3, 1, 1).types,
        v7,
        types))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_object);
  if (WeakRetained)
  {
    objc_msgSend(v5, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "invokeWithTarget:", WeakRetained);
  }

}

+ (id)proxyWithObject:(id)a3 protocol:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (id *)objc_alloc((Class)a1);
  objc_storeWeak(v8 + 1, v7);

  v9 = v8[2];
  v8[2] = v6;

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained;
  id v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  v4 = (id)objc_msgSend(WeakRetained, "hash");
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MSVWeakProxy;
    v4 = -[MSVWeakProxy hash](&v6, sel_hash);
  }

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  BOOL v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 1);
    v6 = objc_loadWeakRetained(&self->_object);
    v7 = WeakRetained == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak(&self->_object);
}

@end
