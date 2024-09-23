@implementation CRProtocolRestrictedInvocationChain

- (CRProtocolRestrictedInvocationChain)init
{
  CRProtocolRestrictedInvocationChain *v2;
  CRProtocolRestrictedInvocationChain *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRProtocolRestrictedInvocationChain;
  v2 = -[CRInvocationChain init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)CRProtocolRestrictedInvocationChain;
    -[CRInvocationChain setDelegate:](&v5, sel_setDelegate_, v2);
  }
  return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  Protocol *v5;
  BOOL v6;
  _QWORD v8[4];
  Protocol *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = (Protocol *)a3;
  v5 = v4;
  if (self->_restrictingProtocol == v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__CRProtocolRestrictedInvocationChain_conformsToProtocol___block_invoke;
    v8[3] = &unk_24DDD9288;
    v9 = v4;
    v10 = &v11;
    -[CRInvocationChain enumerateChainedObjectsUsingBlock:](self, "enumerateChainedObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __58__CRProtocolRestrictedInvocationChain_conformsToProtocol___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)invocationChain:(id)a3 shouldForwardInvocation:(id)a4 toTarget:(id)a5
{
  id v7;

  if (a3 != self)
    return 0;
  v7 = a3;
  LOBYTE(a4) = objc_msgSend(v7, "_selectorIsPartOfRestrictingProtocol:", objc_msgSend(a4, "selector"));

  return (char)a4;
}

- (BOOL)isEligibleForSelector:(SEL)a3
{
  _BOOL4 v5;
  objc_super v7;

  v5 = -[CRProtocolRestrictedInvocationChain _selectorIsPartOfRestrictingProtocol:](self, "_selectorIsPartOfRestrictingProtocol:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRProtocolRestrictedInvocationChain;
    LOBYTE(v5) = -[CRInvocationChain isEligibleForSelector:](&v7, sel_isEligibleForSelector_, a3);
  }
  return v5;
}

- (BOOL)_selectorIsPartOfRestrictingProtocol:(SEL)a3
{
  void *v5;
  char v6;

  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("commandWasPerformed"));

  return (v6 & 1) != 0
      || -[CRProtocolRestrictedInvocationChain _selector:isPartOfProtocol:](self, "_selector:isPartOfProtocol:", a3, self->_restrictingProtocol);
}

- (BOOL)_selector:(SEL)a3 isPartOfProtocol:(id)a4
{
  Protocol *v6;
  Protocol *v7;
  objc_method_description *v8;
  uint64_t v9;
  uint64_t v10;
  Protocol **v11;
  uint64_t v12;
  BOOL v13;
  unsigned int v15;
  unsigned int v16;
  unsigned int outCount;

  v6 = (Protocol *)a4;
  v7 = v6;
  if (v6)
  {
    outCount = 0;
    v8 = protocol_copyMethodDescriptionList(v6, 0, 1, &outCount);
    if (outCount)
    {
      v9 = 0;
      while (v8[v9].name != a3)
      {
        if (outCount == ++v9)
          goto LABEL_6;
      }
      goto LABEL_17;
    }
LABEL_6:
    free(v8);
    v16 = 0;
    v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &v16);
    if (v16)
    {
      v10 = 0;
      while (v8[v10].name != a3)
      {
        if (v16 == ++v10)
          goto LABEL_10;
      }
      goto LABEL_17;
    }
LABEL_10:
    free(v8);
    v15 = 0;
    v11 = protocol_copyProtocolList(v7, &v15);
    if (v15)
    {
      v12 = 0;
      while (!-[CRProtocolRestrictedInvocationChain _selector:isPartOfProtocol:](self, "_selector:isPartOfProtocol:", a3, v11[v12]))
      {
        if (++v12 >= (unint64_t)v15)
          goto LABEL_14;
      }
      v8 = (objc_method_description *)v11;
LABEL_17:
      free(v8);
      v13 = 1;
      goto LABEL_18;
    }
LABEL_14:
    free(v11);
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (Protocol)restrictingProtocol
{
  return self->_restrictingProtocol;
}

- (void)setRestrictingProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_restrictingProtocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictingProtocol, 0);
}

@end
