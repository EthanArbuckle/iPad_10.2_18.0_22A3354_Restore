@implementation MCMCommandDeletePluginDataContainerContent

- (MCMCommandDeletePluginDataContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandDeletePluginDataContainerContent *v10;
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
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCMCommandDeletePluginDataContainerContent;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v34, sel_initWithMessage_context_reply_, v8, v9, a5);
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
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "clientIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "codeSignInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v15;
        v37 = 2048;
        v38 = v16;
        v39 = 2114;
        v40 = v17;
        v41 = 2114;
        v42 = v18;
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
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "clientIdentity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "codeSignInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        v37 = 2048;
        v38 = v27;
        v39 = 2114;
        v40 = v28;
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
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isAllowedToWipePlugInDataContainerWithIdentifier:", v6);

  if (!v7)
    return 0;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
  {
    -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containerClass");
    if (v9 <= 0xE && ((1 << v9) & 0x4ED4) != 0)
    {
      -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isNoSpecificPersona");

      if (v12)
      {
        container_log_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          -[MCMCommand context](self, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "clientIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "codeSignInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containerClass");
          -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v18;
          v25 = 2048;
          v26 = v20;
          v27 = 2114;
          v28 = v22;
          _os_log_fault_impl(&dword_1CF807000, v13, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v23, 0x20u);

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
  MCMCommandDeleteContainerContent *v4;
  void *v5;
  void *v6;
  void *v7;
  MCMCommandDeleteContainerContent *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = [MCMCommandDeleteContainerContent alloc];
  -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand resultPromise](self, "resultPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMCommandDeleteContainerContent initWithContainerIdentity:context:resultPromise:](v4, "initWithContainerIdentity:context:resultPromise:", v5, v6, v7);

  -[MCMCommandDeleteContainerContent execute](v8, "execute");
  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Wipe plugin data container; error = %@",
      (uint8_t *)&v13,
      0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

+ (unint64_t)command
{
  return 11;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
