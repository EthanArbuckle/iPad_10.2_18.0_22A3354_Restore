@implementation IMInvocationCapturingProxy

- (IMInvocationCapturingProxy)initWithProtocol:(id)a3 forwardingHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id forwardingHandler;

  objc_storeStrong((id *)&self->_protocol, a3);
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v8, "copy");

  forwardingHandler = self->_forwardingHandler;
  self->_forwardingHandler = v9;

  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "retainArguments");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19E24AA28;
  aBlock[3] = &unk_1E3FB5050;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  (*((void (**)(id, uint64_t, void *))self->_forwardingHandler + 2))(self->_forwardingHandler, objc_msgSend(v5, "selector"), v6);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  BOOL v4;

  -[IMInvocationCapturingProxy methodSignatureForSelector:](self, "methodSignatureForSelector:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v7;
  BOOL v8;
  void *v9;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (v7 = protocol_getMethodDescription(self->_protocol, a3, 0, 1), types = v7.types, v7.name)
    || (sel_respondsToSelector_ != a3 ? (v8 = sel_conformsToProtocol_ == a3) : (v8 = 1), !v8))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "methodSignatureForSelector:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return protocol_conformsToProtocol(self->_protocol, (Protocol *)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forwardingHandler, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (id)forwardingHandler
{
  return self->_forwardingHandler;
}

@end
