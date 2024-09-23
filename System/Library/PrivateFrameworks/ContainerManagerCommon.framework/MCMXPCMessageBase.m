@implementation MCMXPCMessageBase

+ (id)xpcMessageFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithXPCObject:context:error:", v9, v8, a5);

  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  container_free_client();
  v3.receiver = self;
  v3.super_class = (Class)MCMXPCMessageBase;
  -[MCMXPCMessageBase dealloc](&v3, sel_dealloc);
}

- (unsigned)disposition
{
  return 1;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_xpcObject, 0);
}

- (MCMXPCMessageBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageBase *v9;
  MCMXPCMessageBase *v10;
  unsigned int uint64;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = -[MCMXPCMessageBase initWithContext:](self, "initWithContext:", a4);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcObject, a3);
    uint64 = xpc_dictionary_get_uint64(v8, "Platform");
    xpc_dictionary_get_dictionary(v8, "ProxyForClient");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v12 = container_client_copy_decoded_from_xpc_object();
    v10->_proxy = (container_client *)v12;
    v10->_platform = uint64;
    v10->_command = xpc_dictionary_get_uint64(v8, "Command");

  }
  return v10;
}

- (MCMXPCMessageBase)initWithContext:(id)a3
{
  id v5;
  MCMXPCMessageBase *v6;
  MCMXPCMessageBase *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMXPCMessageBase;
  v6 = -[MCMXPCMessageBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)nsObjectFromXPCObject:(id)a3 key:(const char *)a4 error:(unint64_t *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  xpc_dictionary_get_value(a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = _CFXPCCreateCFObjectFromXPCObject();
    v8 = (void *)v7;
    if (a5 && !v7)
      *a5 = 38;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)userIdentityFromClientPersonaUniqueString:(id)a3 clientIdentity:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  host_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char v20;
  int v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  uint32_t v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = 0;
  v10 = MEMORY[0x1D17D6F20]();
  if (!host_get_multiuser_config_flags(v10, &v28) && (v28 & 0x80000000) != 0)
  {
    objc_msgSend(v9, "userIdentity");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[MCMXPCMessageBase context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentityCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)objc_opt_class(), "personasAreSupported");

  -[MCMXPCMessageBase context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userIdentityCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    objc_msgSend(v16, "userIdentityForCurrentUserWithPersonaUniqueString:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v9, "userIdentity");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject isNoSpecificPersona](v19, "isNoSpecificPersona");
      v21 = -[NSObject isEqual:](v19, "isEqual:", v18);
      if ((v20 & 1) != 0 || v21)
      {
        v11 = v18;
        v24 = 1;
LABEL_16:

        if (!a5)
          goto LABEL_19;
        goto LABEL_17;
      }
      container_log_handle_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      objc_msgSend(v9, "codeSignInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = v27;
      v30 = 2112;
      v31 = v8;
      v32 = 1024;
      v33 = 0;
      v34 = 1024;
      v35 = 0;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Persona unique string is not valid for this client; client = [%@], personaUniqueString = [%@], nonspecific = %d,"
        " sameAsClient = %d",
        (uint8_t *)&v28,
        0x22u);

    }
    else
    {
      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      objc_msgSend(v9, "codeSignInfo");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v22, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412546;
      v29 = v26;
      v30 = 2112;
      v31 = v8;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Cannot reconstitute a user identity from provided persona unique string; client = [%@], personaUniqueString = [%@]",
        (uint8_t *)&v28,
        0x16u);
    }

LABEL_9:
LABEL_14:
    v11 = 0;
    v24 = 76;
    goto LABEL_16;
  }
  objc_msgSend(v9, "posixUser");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userIdentityForPersonalPersonaWithPOSIXUser:", v23);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  v24 = 1;
  if (!a5)
    goto LABEL_19;
LABEL_17:
  if (!v11)
    *a5 = v24;
LABEL_19:

  return v11;
}

- (MCMCommandContext)context
{
  return self->_context;
}

- (id)identifierFromXPCObject:(id)a3 elseClientIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](self, "nsStringValueFromXPCObject:key:", a3, "Identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = v6;

  return v7;
}

- (id)nsStringValueFromXPCObject:(id)a3 key:(const char *)a4
{
  void *string;

  string = (void *)xpc_dictionary_get_string(a3, a4);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }
  return string;
}

+ (id)userIdentityForContainerIdentifier:(id)a3 clientIdentity:(id)a4 containerClass:(unint64_t)a5 error:(unint64_t *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0;
  v14 = 1;
  if (a5 > 0xE || ((1 << a5) & 0x4ED4) == 0)
  {
LABEL_9:
    if (!a6)
      goto LABEL_35;
    goto LABEL_33;
  }
  if (!objc_msgSend(v11, "isNoSpecificPersona"))
  {
    v13 = 0;
    v14 = 1;
    goto LABEL_9;
  }
  v15 = v9;
  v16 = v15;
  v17 = v15;
  if (a5 - 3 <= 3)
  {
    v17 = v15;
    if ((a5 | 2) == 6)
    {
      objc_msgSend((id)gCodeSigningMapping, "childParentMapCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend((id)gCodeSigningMapping, "childParentMapCache");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "parentIdentifierForChildIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        container_log_handle_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v16;
          _os_log_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEFAULT, "Warning: not remapping plugin identifier '%{public}@ to parent identifier [3]", buf, 0xCu);
        }

        v17 = v16;
      }
    }
  }
  objc_msgSend((id)gContainerCache, "userIdentityCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userIdentitiesForBundleIdentifier:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 != v16)
  {
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v36 = v17;
      v37 = 2112;
      v38 = (unint64_t)v22;
      v39 = 2112;
      v40 = v16;
      v41 = 2048;
      v42 = a5;
      _os_log_debug_impl(&dword_1CF807000, v23, OS_LOG_TYPE_DEBUG, "Chose bundleIdentifier: %@, userIdentities: %@ for identifier: %@, class: %llu", buf, 0x2Au);
    }

  }
  if (objc_msgSend(v22, "count") == 1)
  {
    objc_msgSend(v22, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    v14 = 1;
    goto LABEL_32;
  }
  if ((unint64_t)objc_msgSend(v22, "count") < 2 || (objc_msgSend(v22, "containsObject:", v12) & 1) != 0)
  {
    if (objc_msgSend(v22, "count"))
    {
      v13 = 0;
      goto LABEL_24;
    }
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "codeSignInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v33;
      v37 = 2048;
      v38 = a5;
      v39 = 2112;
      v40 = v16;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Client %{public}@ failed trying to look up persona for %llu:%@", buf, 0x20u);

    }
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v10;
      v37 = 2112;
      v38 = (unint64_t)v22;
      v39 = 2112;
      v40 = v12;
      _os_log_fault_impl(&dword_1CF807000, v25, OS_LOG_TYPE_FAULT, "Ambiguous user identity from [%@]. Expected one of [%@], got %@", buf, 0x20u);
    }

  }
  v13 = 0;
  v14 = 76;
LABEL_32:

  if (!a6)
    goto LABEL_35;
LABEL_33:
  if (!v12)
    *a6 = v14;
LABEL_35:
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (!MCMRequirePersona_result)
  {
    v26 = 1;
    if (!v13)
      goto LABEL_48;
    goto LABEL_43;
  }
  if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
  v26 = MCMRequirePersonaTelemetryOnly_result != 0;
  if (v13)
  {
LABEL_43:
    if ((objc_msgSend(v12, "isStrictlyEqualToUserIdentity:", v13) & 1) == 0)
    {
      container_log_handle_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "codeSignInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = " NOT";
        v37 = 2080;
        v36 = v31;
        if (v26)
          v32 = "";
        v38 = (unint64_t)v32;
        v39 = 2114;
        v40 = v13;
        v41 = 2114;
        v42 = (unint64_t)v12;
        v43 = 2048;
        v44 = a5;
        v45 = 2112;
        v46 = v9;
        _os_log_debug_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEBUG, "For %{public}@ ,%s substituting user identity %{public}@ for client identity %{public}@ for container %llu:%@", buf, 0x3Eu);

      }
    }
    if (v26)
    {
      v28 = v13;

      v12 = v28;
    }
  }
LABEL_48:

  return v12;
}

- (container_client)proxy
{
  return self->_proxy;
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (unint64_t)command
{
  return self->_command;
}

- (id)nsUUIDValueFromXPCObject:(id)a3 key:(const char *)a4
{
  uint8_t *uuid;

  uuid = (uint8_t *)xpc_dictionary_get_uuid(a3, a4);
  if (uuid)
    uuid = (uint8_t *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
  return uuid;
}

@end
