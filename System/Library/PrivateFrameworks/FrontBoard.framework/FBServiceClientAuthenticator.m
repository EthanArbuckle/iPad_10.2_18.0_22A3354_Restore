@implementation FBServiceClientAuthenticator

- (BOOL)authenticateClient:(id)a3
{
  return -[FBServiceClientAuthenticator authenticateClient:error:](self, "authenticateClient:error:", a3, 0);
}

+ (BOOL)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  id v11;
  __int128 v12;
  void *v13;
  BOOL v14;
  BOOL result;
  void *v16;
  _OWORD v17[2];

  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0D22F80]);
    v12 = *(_OWORD *)&a3->var0[4];
    v17[0] = *(_OWORD *)a3->var0;
    v17[1] = v12;
    v13 = (void *)objc_msgSend(v11, "initWithAuditToken:", v17);
    v14 = objc_msgSend(a1, "_authenticateAuditToken:entitlement:credentials:error:withResult:", v13, v10, 0, a5, 0) == 0;

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("entitlement"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBServiceClientAuthenticator authenticateAuditToken:forEntitlement:error:].cold.1(a2, (uint64_t)a1, (uint64_t)v16);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)authenticateAuditToken:(id)a3 forEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LODWORD(a5) = objc_msgSend((id)objc_opt_class(), "_authenticateAuditToken:entitlement:credentials:error:withResult:", v9, v8, self->_credentials, a5, 0);

  return (_DWORD)a5 == 0;
}

- (BOOL)authenticateClient:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "_authenticateAuditToken:entitlement:credentials:error:withResult:", v7, self->_entitlement, self->_credentials, a4, 0) == 0;
  return (char)a4;
}

+ (int)_authenticateAuditToken:(id)a3 entitlement:(id)a4 credentials:(unint64_t)a5 error:(id *)a6 withResult:(id)a7
{
  char v9;
  id v11;
  id v12;
  void (**v13)(id, BOOL, void *);
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  int v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;

  v9 = a5;
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, BOOL, void *))a7;
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "realToken");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  objc_msgSend(v14, "registerProcessForAuditToken:", &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "isRunning"))
  {
    v16 = 3;
    if (!a6)
      goto LABEL_34;
    goto LABEL_32;
  }
  if ((v9 & 1) != 0)
  {
    v17 = objc_msgSend(v11, "pid");
    v18 = v17 == getpid();
    v19 = v18;
    if (!v12 || v18)
    {
LABEL_15:
      if ((v9 & 4) == 0 || (v19 & 1) != 0)
      {
LABEL_18:
        if ((v9 & 8) == 0 || (v19 & 1) != 0)
          goto LABEL_23;
        goto LABEL_20;
      }
LABEL_17:
      v19 = objc_msgSend(v15, "isApplicationProcess", v23, v24);
      goto LABEL_18;
    }
LABEL_14:
    v19 = objc_msgSend(v11, "hasEntitlement:", v12, v23, v24);
    goto LABEL_15;
  }
  if (v12)
    goto LABEL_14;
  if ((v9 & 4) != 0)
    goto LABEL_17;
  if ((v9 & 8) == 0)
    goto LABEL_22;
LABEL_20:
  if (!objc_msgSend(v15, "isApplicationProcess", v23, v24))
  {
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v19 = objc_msgSend(v15, "isForeground");
LABEL_23:
  if ((v9 & 2) != 0 && (v19 & 1) == 0)
  {
    if (objc_msgSend(v15, "isApplicationProcess"))
    {
      objc_msgSend(v15, "applicationInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v20, "type") != 2;

    }
    else
    {
      v19 = objc_msgSend(v15, "executableLivesOnSystemPartition");
    }
  }
  if (v19)
    v16 = 0;
  else
    v16 = 13;
  if (a6)
  {
LABEL_32:
    if ((_DWORD)v16)
    {
      +[FBServiceClientAuthenticator _errorForCode:process:failedEntitlement:](FBServiceClientAuthenticator, "_errorForCode:process:failedEntitlement:", v16, v15, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_34:
  if (v13)
    v13[2](v13, (_DWORD)v16 == 0, v15);
  if ((_DWORD)v16)
    v21 = 5;
  else
    v21 = 0;

  return v21;
}

+ (id)_errorForCode:(int)a3 process:(id)a4 failedEntitlement:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3 == 3)
  {
    v10 = CFSTR("No such process.");
  }
  else if (a3 == 13 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entitlement \"%@\" is required to access this resource."), v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("Process lacks credentials to access this resource.");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Authentication failed: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x1E0CB2D68]);
  if (v9)
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("Entitlement"));
  if (v7)
  {
    FBSProcessPrettyDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("FBProcess"));

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBServiceClientAuthenticatorErrorDomain"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)authenticateAuditToken:(id)a3 error:(id *)a4
{
  return -[FBServiceClientAuthenticator authenticateAuditToken:forEntitlement:error:](self, "authenticateAuditToken:forEntitlement:error:", a3, self->_entitlement, a4);
}

- (BOOL)authenticateAuditToken:(id)a3
{
  return -[FBServiceClientAuthenticator authenticateAuditToken:error:](self, "authenticateAuditToken:error:", a3, 0);
}

+ (id)sharedSystemClientAuthenticator
{
  if (sharedSystemClientAuthenticator_onceToken != -1)
    dispatch_once(&sharedSystemClientAuthenticator_onceToken, &__block_literal_global_21);
  return (id)sharedSystemClientAuthenticator___authenticator;
}

void __63__FBServiceClientAuthenticator_sharedSystemClientAuthenticator__block_invoke()
{
  FBServiceClientAuthenticator *v0;
  void *v1;

  v0 = -[FBServiceClientAuthenticator initWithCredentials:]([FBServiceClientAuthenticator alloc], "initWithCredentials:", 3);
  v1 = (void *)sharedSystemClientAuthenticator___authenticator;
  sharedSystemClientAuthenticator___authenticator = (uint64_t)v0;

}

+ (id)sharedUIAppClientAuthenticator
{
  if (sharedUIAppClientAuthenticator_onceToken != -1)
    dispatch_once(&sharedUIAppClientAuthenticator_onceToken, &__block_literal_global_9_0);
  return (id)sharedUIAppClientAuthenticator___authenticator;
}

void __62__FBServiceClientAuthenticator_sharedUIAppClientAuthenticator__block_invoke()
{
  FBServiceClientAuthenticator *v0;
  void *v1;

  v0 = -[FBServiceClientAuthenticator initWithCredentials:]([FBServiceClientAuthenticator alloc], "initWithCredentials:", 5);
  v1 = (void *)sharedUIAppClientAuthenticator___authenticator;
  sharedUIAppClientAuthenticator___authenticator = (uint64_t)v0;

}

+ (id)sharedForegroundUIAppClientAuthenticator
{
  if (sharedForegroundUIAppClientAuthenticator_onceToken != -1)
    dispatch_once(&sharedForegroundUIAppClientAuthenticator_onceToken, &__block_literal_global_10_0);
  return (id)sharedForegroundUIAppClientAuthenticator___authenticator;
}

void __72__FBServiceClientAuthenticator_sharedForegroundUIAppClientAuthenticator__block_invoke()
{
  FBServiceClientAuthenticator *v0;
  void *v1;

  v0 = -[FBServiceClientAuthenticator initWithCredentials:]([FBServiceClientAuthenticator alloc], "initWithCredentials:", 9);
  v1 = (void *)sharedForegroundUIAppClientAuthenticator___authenticator;
  sharedForegroundUIAppClientAuthenticator___authenticator = (uint64_t)v0;

}

- (FBServiceClientAuthenticator)init
{
  FBServiceClientAuthenticator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBServiceClientAuthenticator;
  result = -[FBServiceClientAuthenticator init](&v3, sel_init);
  if (result)
    result->_credentials = 1;
  return result;
}

- (FBServiceClientAuthenticator)initWithCredentials:(unint64_t)a3
{
  FBServiceClientAuthenticator *result;

  result = -[FBServiceClientAuthenticator init](self, "init");
  if (result)
    result->_credentials = a3;
  return result;
}

- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3
{
  return -[FBServiceClientAuthenticator initWithEntitlement:additionalCredentials:](self, "initWithEntitlement:additionalCredentials:", a3, 1);
}

- (FBServiceClientAuthenticator)initWithEntitlement:(id)a3 additionalCredentials:(unint64_t)a4
{
  id v6;
  FBServiceClientAuthenticator *v7;
  uint64_t v8;
  NSString *entitlement;

  v6 = a3;
  v7 = -[FBServiceClientAuthenticator init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    entitlement = v7->_entitlement;
    v7->_entitlement = (NSString *)v8;

    v7->_credentials = a4;
  }

  return v7;
}

- (int)authenticateClient:(id)a3 withResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend((id)objc_opt_class(), "_authenticateAuditToken:entitlement:credentials:error:withResult:", v8, self->_entitlement, self->_credentials, 0, v6);
  return (int)v7;
}

- (int)authenticateAuditToken:(id *)a3 withResult:(id)a4
{
  return -[FBServiceClientAuthenticator authenticateAuditToken:forEntitlement:withResult:](self, "authenticateAuditToken:forEntitlement:withResult:", a3, self->_entitlement, a4);
}

- (int)authenticateAuditToken:(id *)a3 forEntitlement:(id)a4 withResult:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0D22F80];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "tokenFromAuditTokenRef:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend((id)objc_opt_class(), "_authenticateAuditToken:entitlement:credentials:error:withResult:", v11, v10, self->_credentials, 0, v9);

  return (int)self;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBServiceClientAuthenticator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBServiceClientAuthenticator entitlement](self, "entitlement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("entitlement"), 1);

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_credentials, CFSTR("credentials"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBServiceClientAuthenticator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (unint64_t)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
}

+ (void)authenticateAuditToken:(const char *)a1 forEntitlement:(uint64_t)a2 error:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBServiceClientAuthenticator.m");
  v16 = 1024;
  v17 = 103;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
