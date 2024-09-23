@implementation _DTXProxy

- (_DTXProxy)initWithChannel:(id)a3
{
  id v5;
  _DTXProxy *v6;
  _DTXProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DTXProxy;
  v6 = -[_DTXProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyChannel, a3);

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  MEMORY[0x24BEDD108](self->_proxyChannel, sel__sendInvocationMessage_, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  Protocol *v10;
  objc_method_description MethodDescription;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  Protocol *v18;
  const char *Name;
  const char *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_DTXProxy;
  -[_DTXProxy methodSignatureForSelector:](&v23, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend_remoteInterface(self->_proxyChannel, v6, v7);
    v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    MethodDescription = protocol_getMethodDescription(v10, a3, 1, 1);

    if (!MethodDescription.name)
    {
      v13 = (void *)MEMORY[0x24BDBCE88];
      v14 = *MEMORY[0x24BDBCA98];
      NSStringFromSelector(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remoteInterface(self->_proxyChannel, v16, v17);
      v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
      Name = protocol_getName(v18);
      objc_msgSend_raise_format_(v13, v20, v14, CFSTR("Selector %@ is not part of the remote interface \"%s\"), v15, Name);

    }
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], v12, (uint64_t)MethodDescription.types);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v9;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyChannel, 0);
}

@end
