@implementation MCMXPCMessageReferencesQuery

- (MCMXPCMessageReferencesQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageReferencesQuery *v10;
  void *v11;
  void *v12;
  void *v13;
  char uint64;
  void *v15;
  void *v16;
  unint64_t explicitFlags;
  void *v18;
  uint64_t v19;
  MCMUserIdentity *userIdentity;
  const char *string;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MCMUserIdentity *v26;
  unint64_t v28;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MCMXPCMessageReferencesQuery;
  v10 = -[MCMXPCMessageWithOwnersAndGroupsBase initWithXPCObject:context:error:](&v29, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    v28 = 1;
    v10->_privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
    v10->_explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
    objc_msgSend(v9, "clientIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "posixUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_uid = objc_msgSend(v13, "UID");

    if ((v10->_explicitFlags & 8) != 0)
      v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v10->_createDuringReconciliation = uint64 & 1;
    v10->_deleteDuringReconciliation = (uint64 & 2) != 0;
    v10->_yesReallyApplyToAll = (uint64 & 4) != 0;
    -[MCMXPCMessageBase context](v10, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userIdentityCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)objc_opt_class(), "personasAreSupported"))
    {

LABEL_14:
      goto LABEL_15;
    }
    explicitFlags = v10->_explicitFlags;

    if ((explicitFlags & 4) != 0)
    {
      objc_msgSend(v9, "clientIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userIdentity");
      v19 = objc_claimAutoreleasedReturnValue();
      userIdentity = v10->_userIdentity;
      v10->_userIdentity = (MCMUserIdentity *)v19;

      if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", -[MCMXPCMessageWithOwnersAndGroupsBase containerClass](v10, "containerClass")))
      {
        string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
        if (string)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            objc_msgSend(v9, "clientIdentity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMXPCMessageBase userIdentityFromClientPersonaUniqueString:clientIdentity:error:](v10, "userIdentityFromClientPersonaUniqueString:clientIdentity:error:", v23, v24, &v28);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v10->_userIdentity;
            v10->_userIdentity = (MCMUserIdentity *)v25;

            if (v28 != 1)
            {
              if (a5)
                *a5 = v28;
              v15 = v10;
              v10 = 0;
              goto LABEL_14;
            }
          }
        }
      }
    }
  }
LABEL_15:

  return v10;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)createDuringReconciliation
{
  return self->_createDuringReconciliation;
}

- (BOOL)deleteDuringReconciliation
{
  return self->_deleteDuringReconciliation;
}

- (BOOL)yesReallyApplyToAll
{
  return self->_yesReallyApplyToAll;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
