@implementation MCMXPCMessageReplace

- (MCMXPCMessageReplace)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageReplace *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  MCMConcreteContainerIdentityForLibsystem *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MCMConcreteContainerIdentity *containerIdentityOld;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  MCMConcreteContainerIdentity *containerIdentityNew;
  NSObject *v29;
  NSObject *v30;
  uint64_t error_description;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  MCMConcreteContainerIdentityForLibsystem *v36;
  unint64_t *v37;
  unint64_t v38;
  objc_super v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCMXPCMessageReplace;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v39, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (!v10)
    goto LABEL_21;
  v38 = 1;
  xpc_dictionary_get_dictionary(v8, "OldContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = container_xpc_decode_container_object();
    if (!v12)
    {
      container_log_handle_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        error_description = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        v41 = v38;
        v42 = 2080;
        v43 = error_description;
        _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Failed to decode old container; error = (%llu) %s",
          buf,
          0x16u);
      }

      v22 = 0;
      v20 = 0;
      v13 = 0;
      goto LABEL_16;
    }
    v13 = v12;
    v14 = [MCMConcreteContainerIdentityForLibsystem alloc];
    objc_msgSend(v9, "clientIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userIdentityCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](v14, "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:", v13, v16, v17, &v38);
    containerIdentityOld = v10->_containerIdentityOld;
    v10->_containerIdentityOld = (MCMConcreteContainerIdentity *)v18;

  }
  else
  {
    v13 = 0;
  }
  xpc_dictionary_get_dictionary(v8, "NewContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = container_xpc_decode_container_object();
    if (v21)
    {
      v22 = v21;
      v36 = [MCMConcreteContainerIdentityForLibsystem alloc];
      objc_msgSend(v9, "clientIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "userIdentity");
      v37 = a5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userIdentityCache");
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](v36, "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:", v22, v24, v26, &v38);
      containerIdentityNew = v10->_containerIdentityNew;
      v10->_containerIdentityNew = (MCMConcreteContainerIdentity *)v27;

      v11 = v25;
      a5 = v37;

    }
    else
    {
      container_log_handle_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = v11;
        v34 = v38;
        v35 = container_get_error_description();
        *(_DWORD *)buf = 134218242;
        v41 = v34;
        v11 = v33;
        v42 = 2080;
        v43 = v35;
        _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to decode new container; error = (%llu) %s",
          buf,
          0x16u);
      }

      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
    v38 = 38;
  }
LABEL_16:
  MEMORY[0x1D17D69E0](v13);
  MEMORY[0x1D17D69E0](v22);
  if (v38 != 1)
  {
    if (a5)
      *a5 = v38;

    v10 = 0;
  }

LABEL_21:
  return v10;
}

- (unsigned)disposition
{
  unsigned int v3;
  void *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageReplace;
  v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    -[MCMXPCMessageReplace containerIdentityNew](self, "containerIdentityNew");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "disposition");

  }
  return v3;
}

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentityNew, 0);
  objc_storeStrong((id *)&self->_containerIdentityOld, 0);
}

@end
