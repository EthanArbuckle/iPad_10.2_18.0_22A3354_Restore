@implementation MRLazyProxy

+ (id)proxyWithProtocol:(id)a3 objectCallback:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = MEMORY[0x194036C44](v7);

  v10 = (void *)v8[1];
  v8[1] = v9;

  v11 = (void *)v8[2];
  v8[2] = v6;

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  void (**v4)(void);
  void *v5;
  id v6;

  v6 = a3;
  -[MRLazyProxy objectCallback](self, "objectCallback");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "invokeWithTarget:", v5);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  char *types;
  Protocol *v7;
  void *v8;

  if (a3 == a2)
    return 0;
  -[MRLazyProxy protocol](self, "protocol");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  types = protocol_getMethodDescription(v5, a3, 0, 1).types;

  if (types
    || (-[MRLazyProxy protocol](self, "protocol"),
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

- (id)objectCallback
{
  return self->_objectCallback;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_objectCallback, 0);
}

@end
