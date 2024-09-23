@implementation MCMXPCMessageQuery

- (unsigned)disposition
{
  unsigned int v3;
  void *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageQuery;
  v3 = -[MCMXPCMessageWithContainerClassBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    -[MCMXPCMessageWithContainerClassBase containerConfig](self, "containerConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "disposition");

  }
  return v3;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (NSUUID)internalUUID
{
  return self->_internalUUID;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeUnowned
{
  return self->_includeUnowned;
}

- (BOOL)includePathInResult
{
  return self->_includePathInResult;
}

- (BOOL)includeInfoInResult
{
  return self->_includeInfoInResult;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)fuzzyMatchTransient
{
  return self->_fuzzyMatchTransient;
}

- (BOOL)fuzzyMatchInternalUUID
{
  return self->_fuzzyMatchInternalUUID;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (BOOL)expectSingleResult
{
  return self->_expectSingleResult;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (MCMXPCMessageQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageQuery *v10;
  NSSet *identifiers;
  NSSet *groupIdentifiers;
  void *v13;
  void *v14;
  void *v15;
  MCMUserIdentity *userIdentity;
  unint64_t privateFlags;
  unint64_t explicitFlags;
  uint64_t v19;
  unint64_t *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSSet *v34;
  void *v36;
  uint64_t v37;
  MCMUserIdentity *v38;
  const char *string;
  void *v40;
  const uint8_t *uuid;
  uint64_t v42;
  NSUUID *internalUUID;
  void *v44;
  int v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  MCMUserIdentity *v50;
  MCMUserIdentity *v51;
  uint64_t uint64;
  void *v53;
  void *v54;
  int v55;
  id v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  unsigned int expectedPersonaKernelID;
  int v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  objc_super v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  int v88;
  _BYTE v89[128];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v80.receiver = self;
  v80.super_class = (Class)MCMXPCMessageQuery;
  v10 = -[MCMXPCMessageWithContainerClassBase initWithXPCObject:context:error:](&v80, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (!v10)
    goto LABEL_50;
  v75 = a5;
  v79 = 1;
  v10->_privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
  v10->_explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
  identifiers = v10->_identifiers;
  v10->_identifiers = 0;

  groupIdentifiers = v10->_groupIdentifiers;
  v10->_groupIdentifiers = 0;

  v10->_createIfNecessary = 0;
  v10->_includeInfoInResult = 0;
  v10->_includePathInResult = 0;
  v10->_issueSandboxExtensions = 0;
  objc_msgSend(v9, "clientIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "posixUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_uid = objc_msgSend(v15, "UID");

  userIdentity = v10->_userIdentity;
  v10->_userIdentity = 0;

  v10->_transient = 0;
  v10->_includeUnowned = 0;
  v10->_fuzzyMatchTransient = 0;
  v10->_fuzzyMatchInternalUUID = 0;
  v10->_expectSingleResult = 0;
  v10->_legacyPersonaPolicy = 0;
  v10->_legacyExtensionPolicy = 0;
  v10->_extensionsUseProxiedClient = 0;
  v10->_extensionsPolicyUsesProxiedClient = 0;
  privateFlags = v10->_privateFlags;
  if ((privateFlags & 1) != 0)
  {
    v10->_legacyPersonaPolicy = 1;
    privateFlags = v10->_privateFlags;
  }
  if ((privateFlags & 2) != 0)
    v10->_legacyExtensionPolicy = 1;
  explicitFlags = v10->_explicitFlags;
  if ((explicitFlags & 1) == 0)
  {
    if ((explicitFlags & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v10, "nsObjectFromXPCObject:key:error:", v8, "IdentifiersArray", &v79);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v79 != 1)
  {
LABEL_44:
    v20 = a5;
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v79 = 110;
    goto LABEL_44;
  }
  v71 = v9;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v21 = v21;
  v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v96;
LABEL_14:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v96 != v24)
        objc_enumerationMutation(v21);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_43;
      if (v23 == ++v25)
      {
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
        if (v23)
          goto LABEL_14;
        break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v10->_identifiers;
  v10->_identifiers = (NSSet *)v26;

  explicitFlags = v10->_explicitFlags;
  v9 = v71;
  if ((explicitFlags & 2) == 0)
  {
LABEL_8:
    v19 = 72;
    v79 = 72;
    v20 = a5;
    if (!a5)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_21:
  v20 = a5;
  if ((explicitFlags & 4) == 0)
  {
    if ((explicitFlags & 8) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v10, "nsObjectFromXPCObject:key:error:", v8, "GroupIdentifiers", &v79);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v79 != 1)
    goto LABEL_45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v79 = 110;
    goto LABEL_45;
  }
  v71 = v9;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v21 = v21;
  v29 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v91;
LABEL_34:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v91 != v31)
        objc_enumerationMutation(v21);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v30 == ++v32)
      {
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
        if (v30)
          goto LABEL_34;
        goto LABEL_40;
      }
    }
LABEL_43:
    v79 = 110;

    v9 = v71;
    goto LABEL_44;
  }
LABEL_40:

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v10->_groupIdentifiers;
  v10->_groupIdentifiers = (NSSet *)v33;

  v20 = a5;
  explicitFlags = v10->_explicitFlags;
  v9 = v71;
  if ((explicitFlags & 8) != 0)
  {
LABEL_23:
    v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    explicitFlags = v10->_explicitFlags;
  }
LABEL_24:
  if ((explicitFlags & 0x10) == 0)
  {
    v28 = 1;
    if ((explicitFlags & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  objc_msgSend(v9, "clientIdentity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "userIdentity");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v10->_userIdentity;
  v10->_userIdentity = (MCMUserIdentity *)v37;

  string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C803F0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v40, "isEqualToString:", v44);

  v28 = v45;
  if ((v45 & 1) == 0)
  {
    if (v40)
    {
      -[MCMXPCMessageWithContainerClassBase containerConfig](v10, "containerConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", objc_msgSend(v46, "containerClass"));

      if (v47)
      {
        objc_msgSend(v9, "clientIdentity");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMXPCMessageBase userIdentityFromClientPersonaUniqueString:clientIdentity:error:](v10, "userIdentityFromClientPersonaUniqueString:clientIdentity:error:", v40, v48, &v79);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v10->_userIdentity;
        v10->_userIdentity = (MCMUserIdentity *)v49;

      }
    }
  }
  v51 = v10->_userIdentity;

  if (v51)
  {
    explicitFlags = v10->_explicitFlags;
    if ((explicitFlags & 0x20) == 0)
    {
LABEL_27:
      if ((explicitFlags & 0x40) != 0)
      {
        v10->_includeUnowned = xpc_dictionary_get_BOOL(v8, "IncludeUnowned");
        if ((v10->_explicitFlags & 0x80) == 0)
          goto LABEL_66;
      }
      else if ((explicitFlags & 0x80) == 0)
      {
        goto LABEL_66;
      }
      uuid = xpc_dictionary_get_uuid(v8, "UUID");
      if (uuid)
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
        internalUUID = v10->_internalUUID;
        v10->_internalUUID = (NSUUID *)v42;

      }
      if (!v10->_internalUUID)
      {
        container_log_handle_for_category();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CF807000, v61, OS_LOG_TYPE_ERROR, "Invalid UUID parameter", buf, 2u);
        }

        v19 = 38;
        v79 = 38;
        if (!v20)
          goto LABEL_49;
        goto LABEL_48;
      }
LABEL_66:
      uint64 = xpc_dictionary_get_uint64(v8, "Flags");
      if ((uint64 & 1) != 0)
        v10->_createIfNecessary = 1;
      if ((uint64 & 2) != 0)
      {
        v10->_expectSingleResult = 1;
        if ((uint64 & 0x10000) == 0)
        {
LABEL_70:
          if ((uint64 & 0x20000) == 0)
            goto LABEL_71;
          goto LABEL_91;
        }
      }
      else if ((uint64 & 0x10000) == 0)
      {
        goto LABEL_70;
      }
      v10->_fuzzyMatchTransient = 1;
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x20000) == 0)
      {
LABEL_71:
        if ((uint64 & 0x200000000) == 0)
          goto LABEL_72;
        goto LABEL_92;
      }
LABEL_91:
      v10->_fuzzyMatchInternalUUID = 1;
      if ((uint64 & 0x200000000) == 0)
      {
LABEL_72:
        if ((uint64 & 0x100000000) == 0)
          goto LABEL_73;
        goto LABEL_93;
      }
LABEL_92:
      v10->_includeInfoInResult = 1;
      if ((uint64 & 0x100000000) == 0)
      {
LABEL_73:
        if ((uint64 & 0x800000000) == 0)
          goto LABEL_74;
        goto LABEL_94;
      }
LABEL_93:
      v10->_includePathInResult = 1;
      if ((uint64 & 0x800000000) == 0)
      {
LABEL_74:
        if ((uint64 & 0x1000000000) == 0)
          goto LABEL_75;
        goto LABEL_95;
      }
LABEL_94:
      v10->_issueSandboxExtensions = 1;
      if ((uint64 & 0x1000000000) == 0)
      {
LABEL_75:
        if ((uint64 & 0x2000000000) == 0)
          goto LABEL_76;
        goto LABEL_96;
      }
LABEL_95:
      v10->_includeUserManagedAssetsRelPath = 1;
      if ((uint64 & 0x2000000000) == 0)
      {
LABEL_76:
        if ((uint64 & 0x1000000000000) == 0)
        {
LABEL_78:
          if ((uint64 & 0x2000000000000) != 0)
            v10->_extensionsPolicyUsesProxiedClient = 1;
          v10->_expectedPersonaKernelID = -1;
          if (v28)
          {
            -[MCMXPCMessageBase context](v10, "context");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "userIdentityCache");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend((id)objc_opt_class(), "personasAreSupported");

            if (v55)
            {
              v56 = containermanager_copy_global_configuration();
              objc_msgSend(v56, "staticConfig");
              v21 = objc_claimAutoreleasedReturnValue();

              xpc_dictionary_get_value(v8, "PersonaKernelID");
              v57 = objc_claimAutoreleasedReturnValue();
              v58 = (void *)v57;
              if (v57 && MEMORY[0x1D17D7838](v57) == MEMORY[0x1E0C81398])
              {
                v10->_expectedPersonaKernelID = xpc_uint64_get_value(v58);
                if (objc_msgSend(v9, "kernelPersonaID") != v10->_expectedPersonaKernelID)
                {
                  container_log_handle_for_category();
                  v62 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v9, "clientIdentity");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "codeSignInfo");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "identifier");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "clientIdentity");
                    v72 = v9;
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(v67, "posixPID");
                    expectedPersonaKernelID = v10->_expectedPersonaKernelID;
                    v70 = objc_msgSend(v72, "kernelPersonaID");
                    *(_DWORD *)buf = 138413058;
                    v82 = v73;
                    v83 = 1024;
                    v84 = v68;
                    v85 = 1024;
                    v86 = expectedPersonaKernelID;
                    v87 = 1024;
                    v88 = v70;
                    _os_log_error_impl(&dword_1CF807000, v62, OS_LOG_TYPE_ERROR, "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
                      buf,
                      0x1Eu);

                    v9 = v72;
                    v20 = v75;

                  }
                  if ((-[NSObject errorOnPersonaPropagationFailure](v21, "errorOnPersonaPropagationFailure") & 1) != 0)
                  {
                    v60 = 151;
                    goto LABEL_88;
                  }
                }
              }
              else
              {
                container_log_handle_for_category();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v9, "clientIdentity");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "codeSignInfo");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "identifier");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "clientIdentity");
                  v64 = v9;
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = objc_msgSend(v65, "posixPID");
                  *(_DWORD *)buf = 138412546;
                  v82 = v63;
                  v83 = 1024;
                  v84 = v66;
                  _os_log_error_impl(&dword_1CF807000, v59, OS_LOG_TYPE_ERROR, "Kernel persona ID is invalid; client[%@(%d)]",
                    buf,
                    0x12u);

                  v9 = v64;
                }

                if ((-[NSObject errorOnPersonaPropagationFailure](v21, "errorOnPersonaPropagationFailure") & 1) != 0)
                {
                  v60 = 38;
LABEL_88:
                  v79 = v60;
LABEL_110:

                  goto LABEL_45;
                }
              }

            }
          }
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            -[MCMUserIdentity debugDescription](v10->_userIdentity, "debugDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v82 = v58;
            _os_log_debug_impl(&dword_1CF807000, v21, OS_LOG_TYPE_DEBUG, "message userIdentity: %@", buf, 0xCu);
            goto LABEL_110;
          }
LABEL_45:

          goto LABEL_46;
        }
LABEL_77:
        v10->_extensionsUseProxiedClient = 1;
        goto LABEL_78;
      }
LABEL_96:
      v10->_includeCreator = 1;
      if ((uint64 & 0x1000000000000) == 0)
        goto LABEL_78;
      goto LABEL_77;
    }
LABEL_26:
    v10->_transient = xpc_dictionary_get_BOOL(v8, "Transient");
    explicitFlags = v10->_explicitFlags;
    goto LABEL_27;
  }
LABEL_46:
  v19 = v79;
  if (v79 != 1)
  {
    if (!v20)
    {
LABEL_49:

      v10 = 0;
      goto LABEL_50;
    }
LABEL_48:
    *v20 = v19;
    goto LABEL_49;
  }
LABEL_50:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

@end
