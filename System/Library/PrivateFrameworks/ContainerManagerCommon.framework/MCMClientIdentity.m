@implementation MCMClientIdentity

id __37__MCMClientIdentity_shortDescription__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  int v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __CFString *v51;

  v44 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (uint64_t)v4;
  if (a2)
  {
    objc_msgSend(v4, "redactedDescription");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[6];
  v46 = v8;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "codeSignInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v31);
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v51 = &stru_1E8CB6A50;
  }
  objc_msgSend(v7, "codeSignInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)v10;
  v47 = (void *)v6;
  v43 = v10;
  if (a2)
  {
    objc_msgSend(v10, "redactedDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "shortDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "redactedDescription");
    v50 = objc_claimAutoreleasedReturnValue();
    v40 = v12;
    v42 = (void *)v12;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "shortDescription");
    v40 = v11;
    v50 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v50;
  }
  v48 = v5;
  objc_msgSend(*(id *)(a1 + 32), "posixUser");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v39, "UID");
  v36 = objc_msgSend(*(id *)(a1 + 32), "posixPID");
  v35 = objc_msgSend(*(id *)(a1 + 32), "isSandboxed");
  v34 = objc_msgSend(*(id *)(a1 + 32), "platform");
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v38, "isSigned");
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSignatureValid");
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPlatformBinary");
  objc_msgSend(*(id *)(a1 + 32), "sandboxContainerURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = v18;
  if (a2)
  {
    objc_msgSend(v18, "redactedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cached"))
    v21 = ", cached";
  else
    v21 = "";
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "cached");
  v24 = ", cs cached";
  if (!v23)
    v24 = "";
  objc_msgSend(v44, "stringWithFormat:", CFSTR("<%@%@/%@, u=%@, uid=%u, pid=%u, sandboxed=%d, platform=%d (%d/%d/%d) [%@]%s%s>"), v47, v51, v40, v50, v37, v36, v35, v34, v33, v14, v16, v20, v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v19 = v15;
    v17 = v13;
    v15 = v38;
    v13 = v39;
    v26 = v48;
    v27 = v30;
    v28 = (void *)v50;
  }
  else
  {
    v28 = v38;
    v27 = v39;
    v26 = v48;
  }

  if (v46)
  {

  }
  if (a2)

  return v25;
}

- (MCMClientCodeSignInfo)codeSignInfo
{
  return self->_codeSignInfo;
}

- (unsigned)platform
{
  return self->_platform;
}

- (BOOL)cached
{
  return self->_cached;
}

- (NSURL)sandboxContainerURL
{
  return self->_sandboxContainerURL;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (int)posixPID
{
  return self->_posixPID;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (id)shortDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MCMClientIdentity_shortDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)isAllowedToAccessContainerIdentity:(id)a3 error:(unint64_t *)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (!MCMRequirePersona_result)
  {
LABEL_20:
    v8 = 1;
    goto LABEL_21;
  }
  v7 = objc_msgSend(v6, "containerClass");
  v8 = 1;
  if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
  {
    objc_msgSend(v6, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "personaType");

    if (v10 < 2)
    {
      -[MCMClientIdentity userIdentity](self, "userIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) == 0)
      {
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMClientIdentity userIdentity](self, "userIdentity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "userIdentity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543874;
          v29 = v25;
          v30 = 2114;
          v31 = (uint64_t)v26;
          v32 = 2114;
          v33 = v27;
          _os_log_fault_impl(&dword_1CF807000, v16, OS_LOG_TYPE_FAULT, "Client %{public}@ user identity does not match container user identity (client: %{public}@; container: %{public}@)",
            (uint8_t *)&v28,
            0x20u);

        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
        if (!MCMRequirePersonaTelemetryOnly_result)
        {
          if (a4)
          {
            v12 = 76;
            goto LABEL_24;
          }
LABEL_25:
          v8 = 0;
          goto LABEL_21;
        }
      }
    }
    else
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "containerClass");
        objc_msgSend(v6, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMClientIdentity userIdentity](self, "userIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "userIdentity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544386;
        v29 = v19;
        v30 = 2048;
        v31 = v20;
        v32 = 2114;
        v33 = v21;
        v34 = 2114;
        v35 = v22;
        v36 = 2114;
        v37 = v23;
        _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ with ambiguous user identity (client: %{public}@; container: %{public}@)",
          (uint8_t *)&v28,
          0x34u);

      }
      if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
        dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
      if (!MCMRequirePersonaTelemetryOnly_result)
      {
        if (a4)
        {
          v12 = 115;
LABEL_24:
          v8 = 0;
          *a4 = v12;
          goto LABEL_21;
        }
        goto LABEL_25;
      }
    }
    goto LABEL_20;
  }
LABEL_21:

  return v8;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isAllowedToLookupContainerIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[4];
  MCMClientIdentity *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAllowedToLookupContainerIdentity:", v4);

  if (v7)
  {
    v11 = 1;
    v8 = -[MCMClientIdentity isAllowedToAccessContainerIdentity:error:](self, "isAllowedToAccessContainerIdentity:error:", v4, &v11);
    if (!v8)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v13 = self;
        v14 = 2114;
        v15 = v4;
        v16 = 2048;
        v17 = v11;
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Client %{public}@ is not allowed to access container identity %{public}@: error %llu", buf, 0x20u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)clientIdentityByChangingCached:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[MCMClientIdentity copy](self, "copy");
  v4[27] = a3;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initInternal");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 28) = self->_posixPID;
    objc_storeStrong((id *)(v4 + 40), self->_posixUser);
    *(_BYTE *)(v5 + 25) = self->_sandboxed;
    v6 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)(v5 + 80) = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)(v5 + 96) = v6;
    objc_storeStrong((id *)(v5 + 48), self->_proximateClient);
    objc_storeStrong((id *)(v5 + 56), self->_userIdentity);
    *(_BYTE *)(v5 + 26) = self->_kernel;
    *(_DWORD *)(v5 + 32) = self->_platform;
    objc_storeStrong((id *)(v5 + 64), self->_sandboxContainerURL);
    objc_storeStrong((id *)(v5 + 72), self->_codeSignInfo);
    *(_BYTE *)(v5 + 27) = self->_cached;
    *(_QWORD *)(v5 + 8) = self->_amfiClass;
    objc_storeStrong((id *)(v5 + 16), self->_amfi);
    *(_BYTE *)(v5 + 24) = self->_testClient;
  }
  return (id)v5;
}

- (id)initInternal
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)MCMClientIdentity;
  return -[MCMClientIdentity init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSignInfo, 0);
  objc_storeStrong((id *)&self->_sandboxContainerURL, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_proximateClient, 0);
  objc_storeStrong((id *)&self->_posixUser, 0);
  objc_storeStrong((id *)&self->_amfi, 0);
}

- (BOOL)isAllowedToLookupGroupContainersOfClass:(unint64_t)a3 ownedByIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "isAllowedToLookupGroupContainersOfClass:ownedByIdentifiers:", a3, v6);

  return a3;
}

+ (id)privilegedClientIdentityWithUserIdentity:(id)a3 kernel:(BOOL)a4
{
  id v6;
  MCMEntitlements *v7;
  id v8;
  void *v9;
  MCMEntitlements *v10;
  MCMClientCodeSignInfo *v11;
  void *v12;
  MCMClientCodeSignInfo *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v6 = a3;
  container_codesign_get_self_audit_token();
  v7 = [MCMEntitlements alloc];
  v8 = containermanager_copy_global_configuration();
  objc_msgSend(v8, "classIterator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v7, "initWithEntitlements:clientIdentifier:classIterator:", &unk_1E8CD5470, CFSTR("com.apple.containermanagerd"), v9);

  v11 = [MCMClientCodeSignInfo alloc];
  v12 = (void *)objc_opt_new();
  v13 = -[MCMClientCodeSignInfo initWithCDHash:entitlements:identifier:teamIdentifier:status:](v11, "initWithCDHash:entitlements:identifier:teamIdentifier:status:", v12, v10, CFSTR("com.apple.containermanagerd"), 0, 7);

  v14 = objc_alloc((Class)a1);
  v15 = containermanager_copy_global_configuration();
  objc_msgSend(v15, "currentUser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = getpid();
  *(_OWORD *)buf = 0u;
  v24 = 0u;
  BYTE1(v22) = a4;
  LOBYTE(v22) = 0;
  LOBYTE(v21) = 0;
  v18 = (void *)objc_msgSend(v14, "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:", v16, v17, dyld_get_active_platform(), v6, 0, buf, v13, v21, 0, v22);

  if (!v18)
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CF807000, v19, OS_LOG_TYPE_FAULT, "Could not generate privileged client", buf, 2u);
    }

  }
  return v18;
}

- (BOOL)isAllowedToAccessUserAssets
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToAccessUserAssets");

  return v4;
}

- (MCMClientIdentity)init
{
  NSObject *v3;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1CF807000, v3, OS_LOG_TYPE_FAULT, "You cannot init this class directly.", v5, 2u);
  }

  return 0;
}

- (MCMClientIdentity)initWithPOSIXUser:(id)a3 POSIXPID:(int)a4 platform:(unsigned int)a5 userIdentity:(id)a6 proximateClient:(id)a7 auditToken:(id *)a8 codeSignInfo:(id)a9 sandboxed:(BOOL)a10 sandboxContainerURL:(id)a11 testClient:(BOOL)a12 kernel:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  MCMClientIdentity *v21;
  MCMClientIdentity *v22;
  __int128 v23;
  id v27;
  id v28;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a6;
  v28 = a7;
  v27 = a9;
  v20 = a11;
  v29.receiver = self;
  v29.super_class = (Class)MCMClientIdentity;
  v21 = -[MCMClientIdentity init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_posixUser, a3);
    v22->_posixPID = a4;
    v22->_platform = a5;
    objc_storeStrong((id *)&v22->_userIdentity, a6);
    objc_storeStrong((id *)&v22->_proximateClient, a7);
    v23 = *(_OWORD *)&a8->var0[4];
    *(_OWORD *)v22->_auditToken.val = *(_OWORD *)a8->var0;
    *(_OWORD *)&v22->_auditToken.val[4] = v23;
    objc_storeStrong((id *)&v22->_codeSignInfo, a9);
    v22->_sandboxed = a10;
    objc_storeStrong((id *)&v22->_sandboxContainerURL, a11);
    v22->_testClient = a12;
    v22->_kernel = a13;
    v22->_amfiClass = (Class)objc_opt_class();
  }

  return v22;
}

- (container_client)createLibsystemClient
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  container_client *v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  -[MCMClientIdentity isTestClient](self, "isTestClient");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "teamIdentifier");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  -[MCMClientIdentity platform](self, "platform");
  -[MCMClientIdentity userIdentity](self, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaUniqueString");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  -[MCMClientIdentity posixUser](self, "posixUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UID");
  -[MCMClientIdentity posixUser](self, "posixUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryGID");
  -[MCMClientIdentity auditToken](self, "auditToken");
  -[MCMClientIdentity posixPID](self, "posixPID");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isSigned");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isSignatureValid");
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isPlatformBinary");
  v9 = (container_client *)container_client_initializer();

  return v9;
}

- (MCMAMFI)amfi
{
  MCMClientIdentity *v2;
  MCMAMFI *amfi;
  objc_class *v4;
  uint64_t v5;
  MCMAMFI *v6;
  MCMAMFI *v7;
  char v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  amfi = v2->_amfi;
  if (!amfi)
  {
    v4 = -[objc_class alloc](-[MCMClientIdentity amfiClass](v2, "amfiClass"), "alloc");
    -[MCMClientIdentity auditToken](v2, "auditToken");
    v5 = -[objc_class initWithAuditToken:](v4, "initWithAuditToken:", v9);
    v6 = v2->_amfi;
    v2->_amfi = (MCMAMFI *)v5;

    amfi = v2->_amfi;
  }
  v7 = amfi;
  objc_sync_exit(v2);

  return v7;
}

- (MCMClientIdentity)proximateClient
{
  if (self->_proximateClient)
    self = self->_proximateClient;
  return self;
}

- (BOOL)isAllowedToLookupAllContainersOfClass:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "isAllowedToLookupAllContainersOfClass:", a3);

  return a3;
}

- (BOOL)isAllowedToLookupViaPrivateEntitlementWithClass:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "isAllowedToLookupViaPrivateEntitlementWithClass:identifier:", a3, v6);

  return a3;
}

- (BOOL)isAllowedToWipePlugInDataContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "isAllowedToWipePlugInDataContainerWithIdentifier:", v4);

  return (char)self;
}

- (BOOL)isAllowedToControlCaches
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToControlCaches");

  return v4;
}

- (BOOL)isAllowedToReplaceContainers
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToReplaceContainers");

  return v4;
}

- (BOOL)isAllowedToAccessInfoMetadata
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToAccessInfoMetadata");

  return v4;
}

- (BOOL)isAllowedToRecreateContainerStructure
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToRecreateContainerStructure");

  return v4;
}

- (BOOL)isAllowedToRegenerateDirectoryUUIDs
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToRegenerateDirectoryUUIDs");

  return v4;
}

- (BOOL)isAllowedToDelete
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToDelete");

  return v4;
}

- (BOOL)isAllowedToWipeAnyDataContainer
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToWipeAnyDataContainer");

  return v4;
}

- (BOOL)isAllowedToTest
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToTest");

  return v4;
}

- (BOOL)isAllowedToAccessCodesignMapping
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToAccessCodesignMapping");

  return v4;
}

- (BOOL)isAllowedToSetDataProtection
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToSetDataProtection");

  return v4;
}

- (BOOL)isAllowedToRestoreContainer
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToRestoreContainer");

  return v4;
}

- (BOOL)isAllowedToStartDataMigration
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToStartDataMigration");

  return v4;
}

- (BOOL)isAllowedToStartUserDataMigration
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToStartUserDataMigration");

  return v4;
}

- (BOOL)isAllowedToStageSharedContent
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToStageSharedContent");

  return v4;
}

- (BOOL)isAllowedToReadReferences
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToReadReferences");

  return v4;
}

- (BOOL)isAllowedToChangeReferences
{
  void *v2;
  void *v3;
  char v4;

  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToChangeReferences");

  return v4;
}

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForIdentity:(id)a3 containerPath:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  MCMError *v17;
  BOOL v18;
  BOOL v19;
  NSObject *v20;
  void *v22;
  void *v23;
  int v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  MCMError *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v26 = 0;
  v14 = a3;
  v15 = objc_msgSend(v14, "containerClass");
  objc_msgSend(v14, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[MCMClientIdentity isAllowedToLookupViaPrivateEntitlementWithClass:identifier:](self, "isAllowedToLookupViaPrivateEntitlementWithClass:identifier:", v15, v16))
  {
    if (objc_msgSend(v12, "transient"))
    {
      v17 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 72);
      if (a7)
        goto LABEL_8;
    }
    else
    {
      if (!objc_msgSend(v13, "supportsProtectedContainerWithRestrictedEntitlement"))
      {
        if (!objc_msgSend(v13, "ownerIssuedSandboxExtension")
          || (-[MCMClientIdentity codeSignInfo](self, "codeSignInfo"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v22, "entitlements"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "isOwnerOfContainerWithClass:identifier:", v15, v16),
              v23,
              v22,
              !v24))
        {
          v17 = 0;
          goto LABEL_3;
        }
        goto LABEL_2;
      }
      v25 = 0;
      v19 = -[MCMClientIdentity _checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:identifier:containerConfig:allowed:error:](self, "_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:identifier:containerConfig:allowed:error:", v12, v16, v13, &v26, &v25);
      v17 = (MCMError *)v25;
      if (v19)
        goto LABEL_3;
      container_log_handle_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Failed to check whether to issue sandbox extension for [%@]; error = %@",
          buf,
          0x16u);
      }

      if (a7)
      {
LABEL_8:
        v17 = objc_retainAutorelease(v17);
        v18 = 0;
        *a7 = v17;
        goto LABEL_15;
      }
    }
    v18 = 0;
    goto LABEL_15;
  }
LABEL_2:
  v17 = 0;
  v26 = 1;
LABEL_3:
  if (a6)
    *a6 = v26;
  v18 = 1;
LABEL_15:

  return v18;
}

- (BOOL)_checkIsAllowedToHaveSandboxExtensionForRestrictedContainerPath:(id)a3 identifier:(id)a4 containerConfig:(id)a5 allowed:(BOOL *)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MCMFileHandle *v17;
  void *v18;
  MCMFileHandle *v19;
  __CFString *v20;
  __CFString *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  const __CFString *v26;
  BOOL v27;
  id v28;
  void *v29;
  __CFString *v30;
  MCMError *v31;
  BOOL v32;
  _BOOL4 v33;
  void *v34;
  char v35;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v42;
  __CFString *v43;
  id v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  __CFString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v45 = 0;
  v13 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entitlements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerRootURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [MCMFileHandle alloc];
  objc_msgSend(v16, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = 0;
  v19 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v17, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v18, 0, 10, 2, 0, 0, v38);

  v44 = 0;
  LOBYTE(v17) = -[MCMFileHandle openWithError:](v19, "openWithError:", &v44);
  v20 = (__CFString *)v44;
  v21 = v20;
  if ((v17 & 1) == 0)
  {
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "identifier");
      v42 = v15;
      v28 = v12;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v47 = v29;
      v48 = 2112;
      v49 = v11;
      v50 = 2112;
      v51 = v30;
      v52 = 2112;
      v53 = v21;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: Failed to open [%@] during app group non-TCC policy protection check: %@", buf, 0x2Au);

      v12 = v28;
      v15 = v42;
    }
    goto LABEL_15;
  }
  v40 = v12;
  v43 = v20;
  v22 = -[MCMFileHandle checkAppContainerProtection:error:](v19, "checkAppContainerProtection:error:", &v45, &v43);
  v39 = v43;

  container_log_handle_for_category();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v37;
      v48 = 2112;
      v49 = v11;
      v50 = 2112;
      v21 = (__CFString *)v39;
      v51 = v39;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: Failed to check app group container non-TCC policy protection; error = %@",
        buf,
        0x20u);

    }
    else
    {
      v21 = (__CFString *)v39;
    }
    v12 = v40;
LABEL_15:

    v31 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v21, v16, 144);
    -[MCMFileHandle close](v19, "close");
    if (a7)
    {
      v31 = objc_retainAutorelease(v31);
      v32 = 0;
      *a7 = v31;
    }
    else
    {
      v32 = 0;
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v25;
    if (v45)
      v26 = &stru_1E8CB6A50;
    else
      v26 = CFSTR("not ");
    v48 = 2112;
    v49 = v11;
    v50 = 2112;
    v51 = v26;
    _os_log_impl(&dword_1CF807000, v24, OS_LOG_TYPE_DEFAULT, "[%@] requesting [%@]: App group container is %@protected with a non-TCC policy", buf, 0x20u);

  }
  if ((objc_msgSend(v15, "isOwnerOfProtectedAppGroupContainerWithIdentifier:", v11) & 1) == 0)
  {
    v12 = v40;
    if (v45)
    {
      v33 = 0;
    }
    else
    {
      if (objc_msgSend(v15, "isOwnerOfContainerWithClass:identifier:", objc_msgSend(v40, "containerClass"), v11))
      {
        objc_msgSend(v14, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[MCMClientIdentity _isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:clientIdentifier:containerConfig:](self, "_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:clientIdentifier:containerConfig:", v11, v34, v40);

        v12 = v40;
      }
      else
      {
        v33 = 0;
      }
      if (!v45)
        goto LABEL_25;
    }
    if ((objc_msgSend(v15, "isOwnerOfProtectedAppGroupContainerWithIdentifier:", v11) & 1) == 0)
    {
      v27 = v33;
      goto LABEL_29;
    }
LABEL_25:
    v35 = objc_msgSend(v12, "ownerIssuedSandboxExtension");
    if (v33)
      v27 = 1;
    else
      v27 = v35;
    goto LABEL_29;
  }
  v27 = 1;
  v12 = v40;
LABEL_29:
  -[MCMFileHandle close](v19, "close");
  v31 = 0;
  if (a6)
    *a6 = v27;
  v32 = 1;
  v21 = (__CFString *)v39;
LABEL_32:

  return v32;
}

- (BOOL)_isAllowedAccessToNonRestrictedProtectedContainerWithIdentifier:(id)a3 clientIdentifier:(id)a4 containerConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MCMClientIdentity _isClientAffordedSandboxForContainerIdentifier:containerConfig:](self, "_isClientAffordedSandboxForContainerIdentifier:containerConfig:", v8, v10))
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      v17 = 1;
      goto LABEL_15;
    }
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    v12 = "[%@] requesting [%@]: DEVELOPER ACTION REQUIRED. Requestor's signature is given temporary compatibility afford"
          "ance to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's"
          " team ID on this platform.";
LABEL_4:
    _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x16u);
    goto LABEL_11;
  }
  objc_msgSend(v8, "stringByExtractingTeamIDPrefix");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11 && !objc_msgSend(v10, "alwaysRequireSignatureScrutiny"))
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    v12 = "[%@] requesting [%@]: The container IS NOT PROTECTED since it isn't prefixed by team ID. Group containers iden"
          "tifiers must be prefixed by requestor's team ID on this platform for container security to be enforced.";
    goto LABEL_4;
  }
  -[MCMClientIdentity amfi](self, "amfi");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:teamID:", v10, v11);

  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "[%@] requesting [%@]: APPROVED. Requestor's signature allows it to access a TCC-protected group container", (uint8_t *)&v19, 0x16u);
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "[%@] requesting [%@]: REJECTED. Requestor's signature does not allow it to access a TCC-protected group container. Group containers identifiers should be prefixed by requestor's team ID to allow access on this platform.", (uint8_t *)&v19, 0x16u);
  }

  v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)_isClientAffordedSandboxForContainerIdentifier:(id)a3 containerConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "teamIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "sandboxAffordances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "containerClass");
  LOBYTE(v7) = objc_msgSend(v9, "isOwnerOfContainerWithClass:identifier:", v10, v6);

  if ((v7 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    -[MCMClientIdentity userIdentity](self, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isDataSeparated");

  }
  return v11;
}

- (BOOL)_checkShouldIssueExtensionForIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsPolicyUsesProxiedClient:(BOOL)a6 issueExtension:(BOOL *)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;
  id v23;
  id v25;
  BOOL v26;
  uint64_t v27;

  v10 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v26 = 0;
  v15 = objc_msgSend(v13, "containerClass");
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = containermanager_copy_global_configuration();
  objc_msgSend(v17, "staticConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configForContainerClass:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (v20 = -[MCMClientIdentity _shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:identifier:](self, "_shouldAttemptToIssueSandboxExtensionUsingLegacyPolicyForContainerConfig:identifier:", v19, v16), v26 = v20, !v20))
  {
    v23 = 0;
    v21 = 1;
  }
  else
  {
    v25 = 0;
    v21 = -[MCMClientIdentity _checkIsAllowedToHaveSandboxExtensionForIdentity:containerPath:containerConfig:allowed:error:](self, "_checkIsAllowedToHaveSandboxExtensionForIdentity:containerPath:containerConfig:allowed:error:", v13, v14, v19, &v26, &v25);
    v22 = v25;
    v23 = v22;
    if (a8 && !v21)
    {
      v23 = objc_retainAutorelease(v22);
      LOBYTE(v21) = 0;
      *a8 = v23;
      goto LABEL_10;
    }
  }
  if (a7 && v21)
  {
    *a7 = v26;
    LOBYTE(v21) = 1;
  }
LABEL_10:

  return v21;
}

- (char)issueSandboxExtensionWithIdentity:(id)a3 containerPath:(id)a4 legacyExtensionPolicy:(BOOL)a5 extensionsUseProxiedClient:(BOOL)a6 extensionsPolicyUsesProxiedClient:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  id v15;
  uint64_t v16;
  MCMError *v17;
  uint64_t v18;
  uint64_t v19;
  MCMError *v20;
  char *v21;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int pid;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  char v39;
  _BYTE buf[38];
  __int16 v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v9 = a7;
  v11 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = objc_msgSend(v14, "containerClass");
  v39 = 0;
  v38 = 0;
  LODWORD(v11) = -[MCMClientIdentity _checkShouldIssueExtensionForIdentity:containerPath:legacyExtensionPolicy:extensionsPolicyUsesProxiedClient:issueExtension:error:](self, "_checkShouldIssueExtensionForIdentity:containerPath:legacyExtensionPolicy:extensionsPolicyUsesProxiedClient:issueExtension:error:", v14, v15, v11, v9, &v39, &v38);
  v17 = (MCMError *)v38;
  if (v11 && v39)
  {
    v18 = v16 - 2;
    if ((unint64_t)(v16 - 2) <= 0xB && ((0xD35u >> v18) & 1) != 0)
    {
      v23 = off_1E8CB4A28[v18];
      objc_msgSend(v15, "containerDataURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "path");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "fileSystemRepresentation");

      v43 = 0u;
      v44 = 0u;
      -[MCMClientIdentity auditToken](self, "auditToken");
      if (!a6)
      {
        -[MCMClientIdentity proximateClient](self, "proximateClient");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          objc_msgSend(v27, "auditToken");
        else
          memset(buf, 0, 32);
        v43 = *(_OWORD *)buf;
        v44 = *(_OWORD *)&buf[16];

      }
      container_log_handle_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_OWORD *)buf = v43;
        *(_OWORD *)&buf[16] = v44;
        pid = container_audit_token_get_pid();
        objc_msgSend(v14, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v14, "containerClass");
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = pid;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v31;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v32;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v26;
        v41 = 2080;
        v42 = v23;
        _os_log_impl(&dword_1CF807000, v29, OS_LOG_TYPE_DEFAULT, "Issuing token to pid %d for identifier = [%@](%llu), path = [%s] (extension class: %s)", buf, 0x30u);

      }
      v33 = container_sandbox_issue_custom_extension();
      if (v33)
      {
        v21 = (char *)v33;
        goto LABEL_10;
      }
      container_log_handle_for_category();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        -[MCMClientIdentity codeSignInfo](self, "codeSignInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *__error();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v37;
        _os_log_error_impl(&dword_1CF807000, v34, OS_LOG_TYPE_ERROR, "sandbox_extension_issue_file failed for %@ at path [%s]: %d", buf, 0x1Cu);

      }
      v19 = 90;
    }
    else
    {
      v19 = 72;
    }
    v20 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", v19);

    v17 = v20;
  }
  if (a8)
  {
    v17 = objc_retainAutorelease(v17);
    v21 = 0;
    *a8 = v17;
  }
  else
  {
    v21 = 0;
  }
LABEL_10:

  return v21;
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MCMClientIdentity_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (Class)amfiClass
{
  return self->_amfiClass;
}

- (void)setAMFIClass:(Class)a3
{
  self->_amfiClass = a3;
}

- (BOOL)isTestClient
{
  return self->_testClient;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isKernel
{
  return self->_kernel;
}

id __32__MCMClientIdentity_description__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  void *v24;
  int v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  uint64_t v55;

  v49 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v53 = v5;
  v47 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "codeSignInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("(via [%@]) "), v33);
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E8CB6A50;
  }
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)v8;
  v52 = (__CFString *)v7;
  v50 = v8;
  if (a2)
  {
    objc_msgSend(v8, "redactedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "teamIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "redactedDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "redactedDescription");
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "posixUser");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "redactedDescription");
    v55 = objc_claimAutoreleasedReturnValue();
    v42 = v10;
    v44 = (void *)v11;
    v45 = (void *)v10;
    v41 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "teamIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "posixUser");
    v42 = v9;
    v43 = v13;
    v46 = (void *)v13;
    v48 = (void *)v12;
    v41 = v12;
    v55 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v55;
  }
  v38 = objc_msgSend(*(id *)(a1 + 32), "posixPID");
  v37 = objc_msgSend(*(id *)(a1 + 32), "isSandboxed");
  v36 = objc_msgSend(*(id *)(a1 + 32), "platform");
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "isSigned"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v35 = v14;
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "isSignatureValid"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isPlatformBinary"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(*(id *)(a1 + 32), "sandboxContainerURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = v19;
  v22 = a2;
  if (a2)
  {
    objc_msgSend(v19, "redactedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cached"))
    v23 = ", cached";
  else
    v23 = "";
  objc_msgSend(*(id *)(a1 + 32), "codeSignInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "cached");
  v26 = ", cs cached";
  if (!v25)
    v26 = "";
  v27 = (void *)v43;
  objc_msgSend(v49, "stringWithFormat:", CFSTR("<%@: %p; %@identifier = %@, teamIdentifier = %@, userIdentity = %@, posixUser = %@, posixPID = %u, isSandboxed = %d, platform = %d, isSigned = %@, isSignatureValid = %@, isPlatformBinary = %@, sandboxContainerURL = [%@]%s%s>"),
    v54,
    v47,
    v52,
    v42,
    v41,
    v43,
    v55,
    v38,
    v37,
    v36,
    v35,
    v15,
    v17,
    v21,
    v23,
    v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {

    v20 = v40;
    v16 = v31;
    v29 = v32;
    v18 = (void *)v55;
  }
  else
  {
    v27 = v39;
    v29 = v40;
  }

  if (v53)
  {

  }
  return v28;
}

+ (id)anonymousPrivilegedClientIdentityWithUserIdentity:(id)a3
{
  return (id)objc_msgSend(a1, "privilegedClientIdentityWithUserIdentity:kernel:", a3, 0);
}

@end
