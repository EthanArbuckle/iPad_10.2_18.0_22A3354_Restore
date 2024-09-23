@implementation _MPMiddlewareChainBuilderProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3;
  void *v4;

  -[_MPMiddlewareChainBuilderProxy _methodDescriptionFromProtocolHierarchy:selector:]((uint64_t)self, self->_protocol, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SEL)_methodDescriptionFromProtocolHierarchy:(const char *)a3 selector:
{
  id v5;
  void *v6;
  Protocol *v7;
  objc_method_description MethodDescription;
  SEL name;
  objc_method_description v10;
  Protocol **v11;
  unint64_t i;
  uint64_t v13;
  unsigned int outCount;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = (Protocol *)v5;
    MethodDescription = protocol_getMethodDescription(v7, a3, 0, 1);
    if (MethodDescription.types)
    {
      name = MethodDescription.name;

    }
    else
    {
      v10 = protocol_getMethodDescription(v7, a3, 1, 1);
      name = v10.name;

      if (!v10.types)
      {
        outCount = 0;
        v11 = protocol_copyProtocolList(v7, &outCount);
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            name = (SEL)-[_MPMiddlewareChainBuilderProxy _methodDescriptionFromProtocolHierarchy:selector:](a1, v11[i], a3);
            if (v13)
              break;
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    name = 0;
  }

  return name;
}

+ (id)allocWithProtocol:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "methodSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "numberOfArguments") > 1)
  {
    v8 = 0;
    objc_msgSend(v4, "getArgument:atIndex:", &v8, objc_msgSend(v5, "numberOfArguments") - 1);
    v6 = objc_msgSend(v4, "selector");
    objc_msgSend(v8, "setBuilderSelector:", v6);
    objc_msgSend(v8, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MPMiddlewareChainBuilderProxy;
    -[_MPMiddlewareChainBuilderProxy forwardInvocation:](&v9, sel_forwardInvocation_, v4);
  }

}

@end
