@implementation MCMCommandDeleteWithUIDClassAndIdentifier

- (MCMCommandDeleteWithUIDClassAndIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandDeleteWithUIDClassAndIdentifier *v10;
  uint64_t v11;
  MCMContainerIdentity *containerIdentity;
  void *v13;
  NSObject *p_super;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  MCMCommandOperationDelete *deleteCommand;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  MCMContainerIdentity *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCMCommandDeleteWithUIDClassAndIdentifier;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v39, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v8, "containerIdentity");
    v11 = objc_claimAutoreleasedReturnValue();
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    -[MCMContainerIdentityMinimal userIdentity](v10->_containerIdentity, "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result && objc_msgSend(v13, "isNoSpecificPersona"))
    {
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommand context](v10, "context");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "clientIdentity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "codeSignInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v15;
        v43 = 2048;
        v44 = v16;
        v45 = 2114;
        v46 = v17;
        v47 = 2114;
        v48 = v18;
        _os_log_fault_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

      }
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
      if (!MCMRequirePersonaAndConvertSystemToPersonal_result
        || !objc_msgSend(v13, "isNoSpecificPersona"))
      {
        goto LABEL_16;
      }
      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommand context](v10, "context");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "clientIdentity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "codeSignInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v31;
        v43 = 2048;
        v44 = v32;
        v45 = 2114;
        v46 = v33;
        _os_log_fault_impl(&dword_1CF807000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);

      }
      objc_msgSend(v9, "userIdentityCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posixUser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userIdentityForPersonalPersonaWithPOSIXUser:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      -[MCMContainerIdentity identityByChangingUserIdentity:](v10->_containerIdentity, "identityByChangingUserIdentity:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    v40 = v10->_containerIdentity;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](v10, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand resultPromise](v10, "resultPromise");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v24, 0, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    deleteCommand = v10->_deleteCommand;
    v10->_deleteCommand = (MCMCommandOperationDelete *)v27;

  }
  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[MCMCommandDeleteWithUIDClassAndIdentifier deleteCommand](self, "deleteCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preflightClientAllowed");

  if (!v4)
    return 0;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
  {
    -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containerClass");
    if (v6 <= 0xE && ((1 << v6) & 0x4ED4) != 0)
    {
      -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isNoSpecificPersona");

      if (v9)
      {
        container_log_handle_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[MCMCommand context](self, "context");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "clientIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "codeSignInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containerClass");
          -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543874;
          v21 = v14;
          v22 = 2048;
          v23 = v16;
          v24 = 2114;
          v25 = v18;
          _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v20, 0x20u);

        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
        if (!MCMRequirePersonaTelemetryOnly_result)
          return 0;
      }
    }
    else
    {

    }
  }
  return 1;
}

- (void)execute
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandDeleteWithUIDClassAndIdentifier deleteCommand](self, "deleteCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute");

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Delete with uid_t, container_class_t, and identifier result; error = %@",
      (uint8_t *)&v9,
      0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMCommandOperationDelete)deleteCommand
{
  return self->_deleteCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCommand, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

+ (unint64_t)command
{
  return 10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
