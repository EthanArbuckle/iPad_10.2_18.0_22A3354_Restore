@implementation NWGenericNetworkAgent

- (NWGenericNetworkAgent)initWithKernelAgent:(const netagent *)a3
{
  NWGenericNetworkAgent *v4;
  NWGenericNetworkAgent *v5;
  size_t v6;
  netagent *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NWGenericNetworkAgent;
  v4 = -[NWGenericNetworkAgent init](&v9, sel_init);
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      v6 = a3->var5 + 216;
      v7 = (netagent *)malloc_type_malloc(v6, 0x35CA1148uLL);
      v5->_internalNetagent = v7;
      if (v7)
        memcpy(v7, a3, v6);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"))
  {
    free(-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"));
    -[NWGenericNetworkAgent setInternalNetagent:](self, "setInternalNetagent:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)NWGenericNetworkAgent;
  -[NWGenericNetworkAgent dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  const __CFString *v13;
  void *v14;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWGenericNetworkAgent agentDomain](self, "agentDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("domain"), v5, 1);

  -[NWGenericNetworkAgent agentType](self, "agentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("type"), v5, 1);

  if (!v4)
  {
    -[NWGenericNetworkAgent agentDescription](self, "agentDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v14, CFSTR("description"), v5, 1);

    v12 = -[NWGenericNetworkAgent isActive](self, "isActive");
    v13 = CFSTR("isActive");
    goto LABEL_19;
  }
  -[NWGenericNetworkAgent agentUUID](self, "agentUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("UUID"), v5, 1);

  -[NWGenericNetworkAgent agentDescription](self, "agentDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("description"), v5, 1);

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isActive](self, "isActive"), CFSTR("isActive"), v5);
  if (-[NWGenericNetworkAgent isKernelActivated](self, "isKernelActivated"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isKernelActivated](self, "isKernelActivated"), CFSTR("isKernelActivated"), v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isUserActivated](self, "isUserActivated"), CFSTR("isUserActivated"), v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isVoluntary](self, "isVoluntary"), CFSTR("isVoluntary"), v5);
  if (-[NWGenericNetworkAgent isSpecificUseOnly](self, "isSpecificUseOnly"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isSpecificUseOnly](self, "isSpecificUseOnly"), CFSTR("isSpecificUseOnly"), v5);
  if (-[NWGenericNetworkAgent isNetworkProvider](self, "isNetworkProvider"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isNetworkProvider](self, "isNetworkProvider"), CFSTR("isNetworkProvider"), v5);
  if (-[NWGenericNetworkAgent isNexusProvider](self, "isNexusProvider"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent isNexusProvider](self, "isNexusProvider"), CFSTR("isNexusProvider"), v5);
  if (-[NWGenericNetworkAgent supportsBrowse](self, "supportsBrowse"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsBrowse](self, "supportsBrowse"), CFSTR("supportsBrowse"), v5);
  if (-[NWGenericNetworkAgent supportsResolve](self, "supportsResolve"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsResolve](self, "supportsResolve"), CFSTR("supportsResolve"), v5);
  if (-[NWGenericNetworkAgent supportsGroups](self, "supportsGroups"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWGenericNetworkAgent supportsGroups](self, "supportsGroups"), CFSTR("supportsGroups"), v5);
  if (-[NWGenericNetworkAgent requiresAssert](self, "requiresAssert"))
  {
    v12 = -[NWGenericNetworkAgent requiresAssert](self, "requiresAssert");
    v13 = CFSTR("requiresAssert");
LABEL_19:
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", v12, v13, v5);
  }
  return v7;
}

- (id)description
{
  return -[NWGenericNetworkAgent descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWGenericNetworkAgent descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (NSString)agentDomain
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 16);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)agentType
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 48);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)agentDescription
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 80);
    v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSUUID)agentUUID
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    v3 = (netagent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"));
  return (NSUUID *)v3;
}

- (BOOL)isActive
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 1) & 1;
  return (char)v3;
}

- (BOOL)isKernelActivated
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 2) & 1;
  return (char)v3;
}

- (BOOL)isUserActivated
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 3) & 1;
  return (char)v3;
}

- (BOOL)isVoluntary
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 4) & 1;
  return (char)v3;
}

- (BOOL)isSpecificUseOnly
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 5) & 1;
  return (char)v3;
}

- (BOOL)isNetworkProvider
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 6) & 1;
  return (char)v3;
}

- (BOOL)isNexusProvider
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 7;
  return (char)v3;
}

- (BOOL)supportsBrowse
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LOBYTE(v3) = (_BYTE)-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[209] & 1;
  return (char)v3;
}

- (BOOL)requiresAssert
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[209] >> 1) & 1;
  return (char)v3;
}

- (BOOL)supportsResolve
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LOBYTE(v3) = (_BYTE)-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[210] & 1;
  return (char)v3;
}

- (BOOL)supportsGroups
{
  netagent *v3;

  v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[210] >> 1) & 1;
  return (char)v3;
}

- (netagent)internalNetagent
{
  return self->_internalNetagent;
}

- (void)setInternalNetagent:(netagent *)a3
{
  self->_internalNetagent = a3;
}

@end
