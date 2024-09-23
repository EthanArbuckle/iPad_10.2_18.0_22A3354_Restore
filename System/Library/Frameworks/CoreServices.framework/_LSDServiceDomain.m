@implementation _LSDServiceDomain

+ (id)defaultServiceDomain
{
  objc_opt_self();
  if (+[_LSDServiceDomain defaultServiceDomain]::once != -1)
    dispatch_once(&+[_LSDServiceDomain defaultServiceDomain]::once, &__block_literal_global_35);
  return (id)+[_LSDServiceDomain defaultServiceDomain]::target;
}

- (uint64_t)resolvedDomainUID
{
  uint64_t v1;
  int v2;
  uint64_t foreground_uid;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 12))
    {
      return *(unsigned int *)(result + 8);
    }
    else
    {
      v2 = *(unsigned __int16 *)(result + 16);
      if (*(_WORD *)(result + 16))
      {
        if (v2 == 3)
        {
          return 0;
        }
        else
        {
          if (v2 != 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolvedDomainUID, v1, CFSTR("LSDService.mm"), 157, CFSTR("Resolving effective UID for domain had bogus type %d"), *(unsigned __int16 *)(v1 + 16));

          }
          if (xpc_user_sessions_enabled())
            foreground_uid = xpc_user_sessions_get_foreground_uid();
          else
            foreground_uid = _CFGetEUID();
          result = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "proxyUIDForUID:", foreground_uid);
          *(_DWORD *)(v1 + 8) = result;
          *(_BYTE *)(v1 + 12) = 1;
        }
      }
      else
      {
        return objc_msgSend((id)__LSDefaultsGetSharedInstance(), "proxyUIDForCurrentEffectiveUID");
      }
    }
  }
  return result;
}

- (uint64_t)resolvedSessionKey
{
  if (result)
  {
    if (*(_WORD *)(result + 16) == 3)
      return 0x100000000;
    else
      return -[_LSDServiceDomain resolvedDomainUID](result);
  }
  return result;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 12) = 0;
  return self;
}

- (double)connectionConfigurationStateForServiceClass:(uint64_t)a3@<X8>
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  void (*v11)(NSXPCConnection *);
  double result;
  id v13;

  if (a1)
  {
    v6 = *(unsigned __int16 *)(a1 + 16);
    v7 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "proxyUIDForCurrentEffectiveUID");
    *(_QWORD *)a3 = 0;
    *(_DWORD *)(a3 + 8) = v7;
    *(_QWORD *)(a3 + 16) = configureUIDVanilla;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (v6 << 32) | (objc_msgSend(a2, "connectionType") << 48) | v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a3 + 24) = v13;
    v8 = *(unsigned __int16 *)(a1 + 16);
    if (v8 == 2)
    {
      if (!-[_LSDServiceDomain resolvedDomainUID](a1))
        goto LABEL_7;
      v8 = *(unsigned __int16 *)(a1 + 16);
    }
    if (v8 != 3 && !objc_msgSend(a2, "XPCConnectionIsAlwaysPrivileged"))
    {
LABEL_8:
      v9 = *(unsigned __int16 *)(a1 + 16);
      if (v9 == 1)
      {
        if (xpc_user_sessions_enabled())
        {
          v10 = -[_LSDServiceDomain resolvedDomainUID](a1);
          v11 = configureUIDForUserSession;
LABEL_19:
          *(_DWORD *)(a3 + 8) = v10;
          *(_QWORD *)(a3 + 16) = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (objc_msgSend(a2, "connectionType") << 48) | ((unint64_t)*(unsigned __int16 *)(a1 + 16) << 32) | v10);
          *(_QWORD *)(a3 + 24) = objc_claimAutoreleasedReturnValue();

          return result;
        }
        v9 = *(unsigned __int16 *)(a1 + 16);
      }
      if (v9 == 2)
        goto LABEL_17;
      if (v9 == 3)
      {
        v10 = -[_LSDServiceDomain resolvedDomainUID](a1);
        v11 = (void (*)(NSXPCConnection *))configureUIDNull;
        goto LABEL_19;
      }
      if ((objc_msgSend(a2, "XPCConnectionIsAlwaysPrivileged") & 1) == 0)
LABEL_17:
        v10 = -[_LSDServiceDomain resolvedDomainUID](a1);
      else
        v10 = 0;
      v11 = (void (*)(NSXPCConnection *))configureUIDVanilla;
      goto LABEL_19;
    }
LABEL_7:
    *(_QWORD *)a3 = 4096;
    goto LABEL_8;
  }
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

- (uint64_t)initWithUID:(void *)a1
{
  int v3;
  _DWORD *v4;
  uint64_t v5;
  objc_super v7;

  if (!a1)
    return 0;
  if ((_DWORD)a2)
  {
    v3 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "proxyUIDForUID:", a2);
    v7.receiver = a1;
    v7.super_class = (Class)_LSDServiceDomain;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    v5 = (uint64_t)v4;
    if (v4)
    {
      v4[2] = v3;
      *((_BYTE *)v4 + 12) = 1;
      *((_WORD *)v4 + 8) = 2;
    }
  }
  else
  {
    +[_LSDServiceDomain systemSessionDomain]();
    v5 = objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)systemSessionDomain
{
  objc_opt_self();
  if (+[_LSDServiceDomain systemSessionDomain]::once != -1)
    dispatch_once(&+[_LSDServiceDomain systemSessionDomain]::once, &__block_literal_global_1);
  return (id)+[_LSDServiceDomain systemSessionDomain]::target;
}

+ (_LSDServiceDomain)currentUserSessionDomain
{
  _LSDServiceDomain *v0;
  objc_super v2;

  objc_opt_self();
  v0 = [_LSDServiceDomain alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)_LSDServiceDomain;
    v0 = (_LSDServiceDomain *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_resolvedDomainUID.__engaged_ = 0;
      v0->_resolvedDomainUID.var0.__val_ = 0;
      v0->_specifierType = 1;
    }
  }
  return v0;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type %d resolvedDomainUID %d>"), v4, self, self->_specifierType, -[_LSDServiceDomain resolvedDomainUID]((uint64_t)self));
}

+ (id)defaultServiceDomainIndirect
{
  return +[_LSDServiceDomain defaultServiceDomain]();
}

- (void)resolvedDomainUID
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = "-[_LSDServiceDomain resolvedDomainUID]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 2080;
  *(_QWORD *)(buf + 20) = a1;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%s: xpc_user_sessions_get_foreground_uid() failed with error %d - %s", buf, 0x1Cu);
}

@end
