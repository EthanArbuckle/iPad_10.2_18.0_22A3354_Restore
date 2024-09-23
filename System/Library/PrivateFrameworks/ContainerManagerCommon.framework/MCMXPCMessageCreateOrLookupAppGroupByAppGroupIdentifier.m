@implementation MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appGroupIdentifier, 0);
}

- (MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier *v10;
  MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unsigned int expectedPersonaKernelID;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MCMXPCMessageCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v36, sel_initWithXPCObject_context_error_, v8, v9, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_21;
  -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "Identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_storeStrong((id *)&v11->_appGroupIdentifier, v12);
    v11->_expectedPersonaKernelID = -1;
    -[MCMXPCMessageBase context](v11, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userIdentityCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend((id)objc_opt_class(), "personasAreSupported");

    if (v15)
    {
      v16 = containermanager_copy_global_configuration();
      objc_msgSend(v16, "staticConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_get_value(v8, "PersonaKernelID");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18 && MEMORY[0x1D17D7838](v18) == MEMORY[0x1E0C81398])
      {
        v11->_expectedPersonaKernelID = xpc_uint64_get_value(v19);
        if (objc_msgSend(v9, "kernelPersonaID") != v11->_expectedPersonaKernelID)
        {
          container_log_handle_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "clientIdentity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "codeSignInfo");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "clientIdentity");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v31, "posixPID");
            expectedPersonaKernelID = v11->_expectedPersonaKernelID;
            v29 = objc_msgSend(v9, "kernelPersonaID");
            *(_DWORD *)buf = 138413058;
            v38 = v27;
            v39 = 1024;
            v40 = v30;
            v41 = 1024;
            v42 = expectedPersonaKernelID;
            v43 = 1024;
            v44 = v29;
            _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Persona failed to propgate; client[%@(%d)] = %d, server = %d",
              buf,
              0x1Eu);

          }
          if ((objc_msgSend(v17, "errorOnPersonaPropagationFailure") & 1) != 0)
          {
            v21 = 151;
            goto LABEL_10;
          }
        }
      }
      else
      {
        container_log_handle_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "clientIdentity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "codeSignInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "clientIdentity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "posixPID");
          *(_DWORD *)buf = 138412546;
          v38 = v24;
          v39 = 1024;
          v40 = v26;
          _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Kernel persona ID is invalid; client[%@(%d)]",
            buf,
            0x12u);

        }
        if (objc_msgSend(v17, "errorOnPersonaPropagationFailure"))
        {
          v21 = 38;
LABEL_10:

          goto LABEL_12;
        }
      }

    }
    goto LABEL_21;
  }
  v21 = 38;
LABEL_12:

  v11 = 0;
  if (a5)
    *a5 = v21;
LABEL_21:

  return v11;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

@end
