@implementation MCMCommandOpenPrimordialDataContainer

- (MCMCommandOpenPrimordialDataContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandOpenPrimordialDataContainer *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  MCMContainerIdentity *containerIdentity;
  MCMError *v38;
  uint64_t v39;
  MCMError *error;
  MCMError *v41;
  void *v42;
  int v43;
  NSObject *v44;
  int v45;
  MCMError *v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  id v52;
  void *v53;
  MCMError *v54;
  uint64_t v55;
  objc_super v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)MCMCommandOpenPrimordialDataContainer;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v56, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    v11 = v8;
    v12 = objc_msgSend(v11, "useCodeSignDatabase");
    objc_msgSend(v9, "clientIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "codeSignInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 1;
    objc_msgSend(v14, "entitlements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerRequiredIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_3:
      v10->_testMode = objc_msgSend(v13, "isAllowedToTest") & v12;
      v17 = objc_msgSend((id)gCodeSigningMapping, "dataContainerTypeForIdentifier:", v16);
      if (!v17)
      {
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v16;
          _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "Unknown data container type for identifier (%{public}@), assuming app", buf, 0xCu);
        }

        v17 = 2;
      }
      v53 = v14;
      v10->_extension = v17 == 4;
      -[MCMCommand context](v10, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "globalConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "staticConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configForContainerClass:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "userIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (MCMError *)v16;
      if (objc_msgSend(v23, "isNoSpecificPersona"))
      {
        objc_msgSend(v9, "userIdentityCache");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "posixUser");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "userIdentityForPersonalPersonaWithPOSIXUser:", v25);
        v26 = v9;
        v27 = v13;
        v28 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v28;
        v13 = v27;
        v9 = v26;
      }
      if (v23)
      {
        v29 = v9;
        v30 = v13;
        v31 = objc_msgSend(v11, "platform");
        -[MCMCommand context](v10, "context");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "userIdentityCache");
        v52 = v8;
        v33 = v11;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v31;
        v13 = v30;
        v9 = v29;
        +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v23, v54, v22, v35, 0, v34, &v55);
        v36 = objc_claimAutoreleasedReturnValue();
        containerIdentity = v10->_containerIdentity;
        v10->_containerIdentity = (MCMContainerIdentity *)v36;

        v11 = v33;
        v8 = v52;

        if (v55 != 1)
        {
          v38 = [MCMError alloc];
          v39 = -[MCMError initWithErrorType:](v38, "initWithErrorType:", v55);
          error = v10->_error;
          v10->_error = (MCMError *)v39;

        }
      }

      v14 = v53;
      v41 = v54;
      goto LABEL_22;
    }
    objc_msgSend(v14, "entitlements");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "requestsNoContainer");

    if (v43)
    {
      container_log_handle_for_category();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v13, "posixPID");
        *(_DWORD *)buf = 138543618;
        v58 = (uint64_t)v14;
        v59 = 1024;
        v60 = v45;
        _os_log_impl(&dword_1CF807000, v44, OS_LOG_TYPE_DEFAULT, "Client (%{public}@, %d) requests no container with no-container entitlement", buf, 0x12u);
      }

      v46 = [MCMError alloc];
      v47 = 96;
    }
    else
    {
      objc_msgSend(v14, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
        goto LABEL_3;
      container_log_handle_for_category();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_msgSend(v13, "posixPID");
        *(_DWORD *)buf = 67109120;
        LODWORD(v58) = v49;
        _os_log_impl(&dword_1CF807000, v48, OS_LOG_TYPE_DEFAULT, "No container-required or codesign identifier -- no container possible for client %d", buf, 8u);
      }

      v46 = [MCMError alloc];
      v47 = 18;
    }
    v50 = -[MCMError initWithErrorType:](v46, "initWithErrorType:", v47);
    v41 = v10->_error;
    v10->_error = (MCMError *)v50;
LABEL_22:

  }
  return v10;
}

- (BOOL)preflightClientAllowed
{
  return 1;
}

- (void)execute
{
  MCMCommandOpenPrimordialDataContainer *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MCMCommandOpenPrimordialDataContainer *v26;
  void *v27;
  void *v28;
  MCMResultWithURLBase *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  MCMError *v45;
  int v46;
  void *v47;
  id v48;
  unsigned int v49;
  void *context;
  id v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  _BYTE v55[10];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v2 = self;
  v61 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codeSignInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containerClass");
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCMCommandOpenPrimordialDataContainer extension](v2, "extension");
    v13 = "app";
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)v55 = v7;
    *(_WORD *)&v55[8] = 2048;
    if (v12)
      v13 = "extension";
    v56 = v9;
    v57 = 2114;
    v58 = v11;
    v59 = 2082;
    v60 = v13;
    _os_log_impl(&dword_1CF807000, v3, OS_LOG_TYPE_DEFAULT, "Fetching primordial container for '%{public}@' with identifier '%llu:%{public}@' (%{public}s)", buf, 0x2Au);

  }
  -[MCMCommandOpenPrimordialDataContainer error](v2, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MCMCommandOpenPrimordialDataContainer error](v2, "error");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 0;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MCMCommand context](v2, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "containerFactory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v33, "containerForContainerIdentity:createIfNecessary:error:", v34, 1, &v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v51;

    if (!v17)
    {
      v16 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v17, "metadataMinimal");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v35, "existed");
    objc_msgSend(v35, "containerPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "containerDataURL");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MCMCommand context](v2, "context");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "clientIdentity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "proximateClient");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "auditToken");
      }
      else
      {
        v52 = 0u;
        v53 = 0u;
      }
      v18 = objc_retainAutorelease(v18);
      objc_msgSend(v18, "fileSystemRepresentation");
      v43 = sandbox_set_container_path_for_audit_token();

      if (v43)
      {
        if (!-[MCMCommandOpenPrimordialDataContainer testMode](v2, "testMode")
          && ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0 && *__error() != 45))
        {
          container_log_handle_for_category();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            v46 = *__error();
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v55 = v43;
            *(_WORD *)&v55[4] = 1024;
            *(_DWORD *)&v55[6] = v46;
            _os_log_fault_impl(&dword_1CF807000, v44, OS_LOG_TYPE_FAULT, "sandbox_set_container_path_for_audit_token() failed with error %d / %d.", buf, 0xEu);
          }

          v45 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 65);
          v18 = 0;
          v15 = v45;
        }
      }
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v15 = 0;
  }
LABEL_8:
  container_log_handle_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v48 = v18;
    v20 = v15;
    if ((_DWORD)v16)
      v21 = CFSTR("Fetched");
    else
      v21 = CFSTR("Created");
    -[MCMCommand context](v2, "context");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "clientIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "codeSignInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    v49 = v16;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = v2;
    v27 = v17;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)v55 = v21;
    v15 = v20;
    v18 = v48;
    *(_WORD *)&v55[8] = 2114;
    v56 = (uint64_t)v24;
    v57 = 2114;
    v58 = v28;
    v59 = 2112;
    v60 = (const char *)v15;
    _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ primordial container for '%{public}@' with identifier '%{public}@': error = %@", buf, 0x2Au);

    v17 = v27;
    v2 = v26;

    v16 = v49;
  }

  v29 = [MCMResultWithURLBase alloc];
  if (v18)
    v30 = -[MCMResultWithURLBase initWithURL:existed:sandboxToken:](v29, "initWithURL:existed:sandboxToken:", v18, v16, 0);
  else
    v30 = -[MCMResultBase initWithError:](v29, "initWithError:", v15);
  v41 = (void *)v30;
  -[MCMCommand resultPromise](v2, "resultPromise");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "completeWithResult:", v41);

  objc_autoreleasePoolPop(context);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (BOOL)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

+ (unint64_t)command
{
  return 45;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
