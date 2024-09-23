@implementation MCMCommandSetDataProtection

- (MCMCommandSetDataProtection)initWithContainerIdentity:(id)a3 thirdParty:(BOOL)a4 dataProtectionClass:(int)a5 retryIfLocked:(BOOL)a6 skipIfUnchanged:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  id v16;
  MCMCommandSetDataProtection *v17;
  MCMCommandSetDataProtection *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMCommandSetDataProtection;
  v17 = -[MCMCommand initWithContext:resultPromise:](&v20, sel_initWithContext_resultPromise_, a8, a9);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerIdentity, a3);
    v18->_thirdParty = a4;
    v18->_dataProtectionClass = a5;
    v18->_retryIfLocked = a6;
    v18->_skipIfUnchanged = a7;
  }

  return v18;
}

- (MCMCommandSetDataProtection)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandSetDataProtection *v10;
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
  v34.super_class = (Class)MCMCommandSetDataProtection;
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
    v10->_thirdParty = objc_msgSend(v8, "isThirdParty");
    v10->_dataProtectionClass = objc_msgSend(v8, "dataProtectionClass");
    v10->_retryIfLocked = objc_msgSend(v8, "retryIfLocked");
    v10->_skipIfUnchanged = 0;

  }
  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAllowedToSetDataProtection");

  if (!v5)
    return 0;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
  {
    -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containerClass");
    if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
    {
      -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isNoSpecificPersona");

      if (v10)
      {
        container_log_handle_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          -[MCMCommand context](self, "context");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "clientIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "codeSignInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containerClass");
          -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543874;
          v22 = v16;
          v23 = 2048;
          v24 = v18;
          v25 = 2114;
          v26 = v20;
          _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v21, 0x20u);

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
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  MCMError *v11;
  MCMResultBase *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  MCMError *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  MCMError *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  MCMError *v31;
  char v32;
  MCMError *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  MCMCommandSetDataProtection *v37;
  id v38;
  MCMError *v39;
  MCMError *v40;
  MCMError *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  MCMError *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  MCMError *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand resultPromise](self, "resultPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __38__MCMCommandSetDataProtection_execute__block_invoke;
  v43[3] = &unk_1E8CB60A0;
  v43[4] = self;
  v7 = v4;
  v44 = v7;
  v8 = v5;
  v45 = v8;
  v34 = (void *)MEMORY[0x1D17D71B4](v43);
  v9 = objc_msgSend(v7, "containerClass");
  if (v9 > 0xB || ((1 << v9) & 0xED4) == 0 || (v10 = objc_msgSend(v7, "containerClass"), v10 == 13) || v10 == 7)
  {
    v11 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 11, 3);
    v12 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v11);
    v13 = 0;
LABEL_6:
    v14 = 0;
    v15 = 0;
    goto LABEL_7;
  }
  -[MCMCommand context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "containerCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v19, "entryForContainerIdentity:error:", v7, &v42);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MCMError *)v42;

  if (!v13)
  {
    v12 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v11);
    goto LABEL_6;
  }
  v41 = v11;
  objc_msgSend(v13, "metadataWithError:", &v41);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v41;

  if (!v15)
  {
    v12 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v20);
    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MCMCommandSetDataProtection dataProtectionClass](self, "dataProtectionClass"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadataBySettingInfoValue:forKey:", v21, CFSTR("com.apple.MobileInstallation.ContentProtectionClass"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (-[MCMCommandSetDataProtection skipIfUnchanged](self, "skipIfUnchanged") && v14 == v15)
  {
    v12 = 0;
    v14 = v15;
LABEL_19:
    v11 = v20;
    goto LABEL_7;
  }
  v40 = v20;
  v32 = objc_msgSend(v14, "writeMetadataToDiskWithError:", &v40);
  v11 = v40;

  if ((v32 & 1) != 0)
  {
    -[MCMCommand context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "containerCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v11;
    objc_msgSend(v22, "addContainerMetadata:error:", v14, &v39);
    v29 = objc_claimAutoreleasedReturnValue();
    v33 = v39;

    if (!v29)
    {
      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "identifier");
        v31 = (MCMError *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v14, "containerClass");
        *(_DWORD *)buf = 138412802;
        v47 = v31;
        v48 = 2048;
        v49 = v28;
        v50 = 2112;
        v51 = v33;
        _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Could not update metadata in cache when asked to change data protection on [%@(%llu)]: %@", buf, 0x20u);

      }
    }
    v24 = MCMDataProtectionQueue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_8;
    block[3] = &unk_1E8CB60C8;
    v14 = v14;
    v36 = v14;
    v37 = self;
    v38 = v34;
    dispatch_async(v24, block);

    v12 = 0;
    v13 = (void *)v29;
    v11 = v33;
  }
  else
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "identifier");
      v26 = (MCMError *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v14, "containerClass");
      *(_DWORD *)buf = 138412802;
      v47 = v26;
      v48 = 2048;
      v49 = v27;
      v50 = 2112;
      v51 = v11;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Could not save metadata when asked to change data protection on [%@(%llu)]: %@", buf, 0x20u);

    }
    v12 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v11);
  }
LABEL_7:
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v11;
    _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Set data protection (start); error = %@", buf, 0xCu);
  }

  if (v12)
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "completeWithResult:", v12);

  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)_updateMetadataForContainerIdentity:(id)a3 dataProtectionClass:(int)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v5 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[MCMCommand context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v9, "entryForContainerIdentity:error:", v7, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v33;
  if (!v10)
  {
    v12 = 0;
    v14 = 0;
    v20 = 0;
    goto LABEL_17;
  }
  v32 = v11;
  objc_msgSend(v10, "metadataWithError:", &v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v32;

  if (!v12)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containerClass");
      *(_DWORD *)buf = 138412802;
      v35 = v23;
      v36 = 2048;
      v37 = v25;
      v38 = 2112;
      v39 = v13;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Could not fetch metadata after data protection change on [%@(%llu)]: %@", buf, 0x20u);

    }
    v12 = 0;
    v14 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v12, "metadataByChangingDataProtectionClass:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  v15 = objc_msgSend(v14, "writeMetadataToDiskWithError:", &v31);
  v16 = v31;

  if ((v15 & 1) == 0)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v12, "containerClass");
      *(_DWORD *)buf = 138412802;
      v35 = v26;
      v36 = 2048;
      v37 = v27;
      v38 = 2112;
      v39 = v16;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Could not save metadata after data protection change on [%@(%llu)]: %@", buf, 0x20u);

    }
    v13 = v16;
    goto LABEL_16;
  }
  -[MCMCommand context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v16;
  objc_msgSend(v18, "addContainerMetadata:error:", v14, &v30);
  v19 = objc_claimAutoreleasedReturnValue();
  v11 = v30;

  if (!v19)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v14, "containerClass");
      *(_DWORD *)buf = 138412802;
      v35 = v28;
      v36 = 2048;
      v37 = v29;
      v38 = 2112;
      v39 = v11;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Could not update metadata in cache after data protection change on [%@(%llu)]: %@", buf, 0x20u);

    }
    v10 = 0;
    v13 = v11;
LABEL_16:

    v20 = 0;
    v11 = v13;
    goto LABEL_17;
  }
  v20 = 1;
  v10 = (void *)v19;
LABEL_17:

  return v20;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (BOOL)skipIfUnchanged
{
  return self->_skipIfUnchanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

void __38__MCMCommandSetDataProtection_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  MCMResultBase *v5;
  MCMResultBase *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  MCMError *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10912;
  v15 = __Block_byref_object_dispose__10913;
  v16 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", a2);
  if (!v12[5])
  {
    v3 = MCMSharedFastWorkloop();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_4;
    v8[3] = &unk_1E8CB6408;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = &v11;
    dispatch_async_and_wait(v3, v8);

  }
  v5 = [MCMResultBase alloc];
  v6 = -[MCMResultBase initWithError:](v5, "initWithError:", v12[5]);
  objc_msgSend(*(id *)(a1 + 48), "completeWithResult:", v6);
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "send");

  _Block_object_dispose(&v11, 8);
}

void __38__MCMCommandSetDataProtection_execute__block_invoke_8(uint64_t a1)
{
  id v2;

  +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDataProtectionOnDataContainerForMetadata:isSecondOrThirdPartyApp:retryIfLocked:deferUntilNextLaunch:withCompletion:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "isThirdParty"), objc_msgSend(*(id *)(a1 + 40), "retryIfLocked"), 0, *(_QWORD *)(a1 + 48));

}

void __38__MCMCommandSetDataProtection_execute__block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = objc_msgSend(v2, "dataProtectionClass");
  v5 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v5 + 40);
  objc_msgSend(v2, "_updateMetadataForContainerIdentity:dataProtectionClass:error:", v3, v4, obj);
  objc_storeStrong((id *)(v5 + 40), obj[0]);
}

+ (unint64_t)command
{
  return 21;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
