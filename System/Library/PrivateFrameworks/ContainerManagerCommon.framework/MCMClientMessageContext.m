@implementation MCMClientMessageContext

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)initForCurrentThreadContextWithXPCMessage:(id)a3 userIdentityCache:(id)a4
{
  id v7;
  id v8;
  MCMClientMessageContext *v9;
  MCMClientMessageContext *v10;
  uint64_t v11;
  NSString *personaUniqueString;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCMClientMessageContext;
  v9 = -[MCMClientMessageContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    xpc_dictionary_get_audit_token();
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    objc_msgSend(v8, "personaUniqueStringForCurrentContext");
    v11 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (MCMPOSIXUser)posixUser
{
  +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", container_audit_token_get_euid(), *(_QWORD *)self->_auditToken.val, *(_QWORD *)&self->_auditToken.val[2], *(_QWORD *)&self->_auditToken.val[4], *(_QWORD *)&self->_auditToken.val[6]);
  return (MCMPOSIXUser *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)pid
{
  return container_audit_token_get_pid();
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

@end
