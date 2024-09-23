@implementation MCMClientFactory

- (id)clientIdentityWithClientMessageContext:(id)a3 xpcMessage:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  MCMError *v14;
  void *v15;
  MCMError *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  id v23;
  MCMError *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[16];
  __int128 v30;
  _OWORD v31[2];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCMClientFactory clientIdentityCache](self, "clientIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "auditToken");
  else
    memset(v31, 0, sizeof(v31));
  objc_msgSend(v8, "personaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke;
  v26[3] = &unk_1E8CB53F8;
  v26[4] = self;
  v12 = v8;
  v27 = v12;
  *(_OWORD *)buf = 0u;
  v30 = 0u;
  objc_msgSend(v10, "clientIdentityWithAuditToken:proximateAuditToken:personaUniqueString:error:generator:", v31, buf, v11, &v28, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (MCMError *)v28;

  if (v13)
  {
    v25 = v14;
    -[MCMClientFactory _proxiedClientIdentityFromMessage:proximateClient:error:](self, "_proxiedClientIdentityFromMessage:proximateClient:error:", v9, v13, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;

    if (v15 || !v16)
    {
      objc_msgSend(v13, "codeSignInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "entitlements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v13;
      if (!v15 || (v21 = objc_msgSend(v17, "proxyAllowed"), v20 = v15, (v21 & 1) != 0))
      {
        v18 = v20;
        goto LABEL_18;
      }
      v14 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);

      container_log_handle_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Not entitled to proxy", buf, 2u);
      }

      if (!a5)
        goto LABEL_17;
    }
    else
    {
      v15 = 0;
      v17 = 0;
      v14 = v16;
      if (!a5)
        goto LABEL_17;
    }
  }
  else
  {
    v15 = 0;
    v17 = 0;
    if (!a5)
    {
LABEL_17:
      v18 = 0;
      v16 = v14;
      goto LABEL_18;
    }
  }
  v16 = objc_retainAutorelease(v14);
  v18 = 0;
  *a5 = v16;
LABEL_18:
  v23 = v18;

  return v23;
}

- (MCMClientIdentityCache)clientIdentityCache
{
  return self->_clientIdentityCache;
}

uint64_t __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientIdentityWithClientMessageContext:error:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_clientIdentityWithClientMessageContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  MCMError *v15;
  MCMError *v16;
  NSObject *v17;
  id v19;
  const char *__s;
  uint64_t v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v21 = 1;
  v24 = 0u;
  v25 = 0u;
  if (v6)
    objc_msgSend(v6, "auditToken");
  objc_msgSend(v7, "personaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = v24;
  v23 = v25;
  v9 = (const char *)container_audit_token_copy_codesign_identifier();
  __s = v9;
  if (v9)
  {
    v10 = (char *)v9;
    if (!strncmp("com.apple.installd", v9, 0x13uLL))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_debug_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEBUG, "Ignoring client persona because it is identified as installd; persona was = [%@]",
          buf,
          0xCu);
      }

      v8 = 0;
    }
    free(v10);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v12 = objc_retainAutorelease(v8);
  objc_msgSend(v12, "UTF8String");
  *(_OWORD *)buf = v24;
  v23 = v25;
  v13 = container_client_create_from_audit_token();
  if (v13)
  {
    v19 = 0;
    -[MCMClientFactory _clientIdentityWithClient:proximateClient:error:](self, "_clientIdentityWithClient:proximateClient:error:", v13, 0, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MCMError *)v19;
  }
  else
  {
    v16 = [MCMError alloc];
    v15 = -[MCMError initWithErrorType:category:](v16, "initWithErrorType:category:", v21, 2);
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Could not generate client object from xpc connection; error = %@",
        buf,
        0xCu);
    }

    v14 = 0;
  }
  container_free_client();
  if (a4 && !v14)
    *a4 = objc_retainAutorelease(v15);

  return v14;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMClientCodeSignInfoCache)clientCodeSignInfoCache
{
  return self->_clientCodeSignInfoCache;
}

- (MCMClientFactory)initWithUserIdentityCache:(id)a3 clientCodeSignInfoCache:(id)a4 clientIdentityCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  MCMClientFactory *v12;
  MCMClientFactory *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMClientFactory;
  v12 = -[MCMClientFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentityCache, a3);
    objc_storeStrong((id *)&v13->_clientCodeSignInfoCache, a4);
    objc_storeStrong((id *)&v13->_clientIdentityCache, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentityCache, 0);
  objc_storeStrong((id *)&self->_clientCodeSignInfoCache, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

- (id)_proxiedClientIdentityFromMessage:(id)a3 proximateClient:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t persona_unique_string;
  void *v15;
  MCMError *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[2];
  uint8_t buf[16];
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  xpc_dictionary_get_dictionary(a3, "ProxyForClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v30 = 1;
  v10 = container_client_copy_decoded_from_xpc_object();
  if (!v10)
  {
    v16 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", v30, 3);
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
      v21 = 0;
      if (!a5)
        goto LABEL_17;
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = container_get_error_description();
    v18 = "Invalid proxied client, error = %s";
    v19 = v17;
    v20 = 12;
LABEL_28:
    _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_13;
  }
  v11 = v10;
  if (!container_client_is_test_client())
    goto LABEL_6;
  v12 = containermanager_copy_global_configuration();
  if (!objc_msgSend(v12, "isInternalImage"))
  {

    goto LABEL_12;
  }
  v13 = objc_msgSend(v8, "isAllowedToTest");

  if ((v13 & 1) == 0)
  {
LABEL_12:
    v16 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v18 = "Not allowed to proxy a test client";
    v19 = v17;
    v20 = 2;
    goto LABEL_28;
  }
LABEL_6:
  *(_OWORD *)buf = 0u;
  v34 = 0u;
  container_client_get_audit_token();
  persona_unique_string = container_client_get_persona_unique_string();
  if (persona_unique_string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (container_client_is_test_client())
  {
    v29 = 0;
    -[MCMClientFactory _clientIdentityWithClient:proximateClient:error:](self, "_clientIdentityWithClient:proximateClient:error:", v11, v8, &v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (MCMError *)v29;
  }
  else
  {
    -[MCMClientFactory clientIdentityCache](self, "clientIdentityCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "auditToken");
    else
      memset(v32, 0, sizeof(v32));
    v28 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke;
    v25[3] = &unk_1E8CB5420;
    v25[4] = self;
    v27 = v11;
    v26 = v8;
    v31[0] = *(_OWORD *)buf;
    v31[1] = v34;
    objc_msgSend(v24, "clientIdentityWithAuditToken:proximateAuditToken:personaUniqueString:error:generator:", v31, v32, v15, &v28, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (MCMError *)v28;

  }
  container_free_client();

  if (a5)
  {
LABEL_15:
    if (!v21)
      *a5 = objc_retainAutorelease(v16);
  }
LABEL_17:
  v22 = v21;

  return v22;
}

- (id)_clientIdentityWithClient:(container_client *)a3 proximateClient:(id)a4 error:(id *)a5
{
  id v7;
  int is_test_client;
  uint64_t euid;
  unsigned int pid;
  unsigned int platform;
  void *v12;
  uint64_t codesign_identifier;
  uint64_t v14;
  void *v15;
  uint64_t codesign_team_identifier;
  void *v17;
  id v18;
  char v19;
  void *v20;
  MCMError *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  MCMClientIdentity *v29;
  id *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  MCMError *v35;
  uint64_t v36;
  NSObject *v37;
  MCMClientIdentity *v38;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  MCMClientIdentity *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  MCMError *v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  void *v53;
  MCMError *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  container_client *v59;
  id v60;
  id v61;
  void *__s;
  uint64_t v63;
  _BYTE v64[1025];
  _BYTE buf[32];
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v66 = 0u;
  v67 = 0u;
  container_client_get_audit_token();
  is_test_client = container_client_is_test_client();
  euid = container_client_get_euid();
  pid = container_client_get_pid();
  platform = container_client_get_platform();
  v53 = v7;
  if (!container_client_is_signed())
  {
    v21 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3);
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Client pid [%d] is not signed or has died.", buf, 8u);
    }

    goto LABEL_20;
  }
  v63 = 0;
  *(_OWORD *)buf = v66;
  *(_OWORD *)&buf[16] = v67;
  v12 = (void *)container_audit_token_copy_codesign_hash();
  __s = v12;
  if (!v12)
  {
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)&buf[8] = *((_QWORD *)&v66 + 1);
      *(_OWORD *)&buf[16] = v67;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = container_audit_token_get_pid();
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Failed to get codesign hash for pid %d", buf, 8u);
    }

    v21 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 97, 3);
LABEL_20:
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v17 = 0;
    v15 = 0;
    v28 = 0;
    v20 = 0;
    v29 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v63);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  free(__s);
  memset_s(&__s, 8uLL, 0, 8uLL);
  codesign_identifier = container_client_get_codesign_identifier();
  if (!codesign_identifier
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", codesign_identifier),
        (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Could not get client identifier for pid [%d]", buf, 8u);
    }

    v21 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 97, 3);
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v17 = 0;
    v15 = 0;
    goto LABEL_41;
  }
  v15 = (void *)v14;
  v50 = platform;
  codesign_team_identifier = container_client_get_codesign_team_identifier();
  if (codesign_team_identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", codesign_team_identifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (is_test_client)
      goto LABEL_7;
  }
  else
  {
    v17 = 0;
    if (is_test_client)
    {
LABEL_7:
      if (v7)
      {
        v18 = containermanager_copy_global_configuration();
        if (objc_msgSend(v18, "isInternalImage"))
        {
          v19 = objc_msgSend(v7, "isAllowedToTest");

          if ((v19 & 1) != 0)
          {
            v49 = pid;
            v61 = 0;
            -[MCMClientFactory _codeSignInfoWithClient:CDHash:identifier:teamIdentifier:error:](self, "_codeSignInfoWithClient:CDHash:identifier:teamIdentifier:error:", a3, v51, v15, v17, &v61);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (MCMError *)v61;
            goto LABEL_25;
          }
        }
        else
        {

        }
        container_log_handle_for_category();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CF807000, v37, OS_LOG_TYPE_ERROR, "Cannot use a test client.", buf, 2u);
        }

        v35 = [MCMError alloc];
        v36 = 55;
      }
      else
      {
        container_log_handle_for_category();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CF807000, v34, OS_LOG_TYPE_ERROR, "Cannot use a test client without a proximate client.", buf, 2u);
        }

        v35 = [MCMError alloc];
        v36 = 38;
      }
      v21 = -[MCMError initWithErrorType:category:](v35, "initWithErrorType:category:", v36, 3);
LABEL_40:
      v24 = 0;
      v25 = 0;
      v26 = 0;
LABEL_41:
      v20 = 0;
      goto LABEL_42;
    }
  }
  v49 = pid;
  -[MCMClientFactory clientCodeSignInfoCache](self, "clientCodeSignInfoCache");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke;
  v55[3] = &unk_1E8CB5448;
  v55[4] = self;
  v59 = a3;
  v56 = v51;
  v57 = v15;
  v58 = v17;
  objc_msgSend(v31, "codeSignInfoForCDHash:identifier:error:generator:", v56, v57, &v60, v55);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (MCMError *)v60;

LABEL_25:
  if (!v20)
  {
    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, "Could not generate codesign info from xpc connection; error = %@",
        buf,
        0xCu);
    }

    goto LABEL_40;
  }
  HIDWORD(v47) = container_client_is_sandboxed();
  -[MCMClientFactory userIdentityCache](self, "userIdentityCache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v21;
  objc_msgSend(v32, "userIdentityForClient:error:", a3, &v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v54;

  if (!v26)
  {
    container_log_handle_for_category();
    v40 = objc_claimAutoreleasedReturnValue();
    v21 = v48;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v49;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v48;
      _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Could not compute user identity for client %d; error = %@",
        buf,
        0x12u);
    }

    v24 = 0;
    v25 = 0;
    v26 = 0;
LABEL_42:
    v29 = 0;
    v28 = v51;
    v30 = a5;
    if (!a5)
      goto LABEL_45;
    goto LABEL_43;
  }
  bzero(v64, 0x401uLL);
  *(_OWORD *)buf = v66;
  *(_OWORD *)&buf[16] = v67;
  if (sandbox_container_path_for_audit_token())
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v64, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", euid);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 75, 3);

    container_log_handle_for_category();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = euid;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v49;
      _os_log_error_impl(&dword_1CF807000, v44, OS_LOG_TYPE_ERROR, "Could not generate user details for euid %d from pid %d", buf, 0xEu);
    }

    v24 = 0;
    goto LABEL_42;
  }
  v24 = (void *)v41;
  container_log_handle_for_category();
  v42 = objc_claimAutoreleasedReturnValue();
  v28 = v51;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v26, "shortDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v45;
    _os_log_debug_impl(&dword_1CF807000, v42, OS_LOG_TYPE_DEBUG, "Generating new client identity for [%@/%@]", buf, 0x16u);

    v28 = v51;
  }

  v43 = [MCMClientIdentity alloc];
  *(_OWORD *)buf = v66;
  *(_OWORD *)&buf[16] = v67;
  LOWORD(v47) = is_test_client;
  LOBYTE(v46) = BYTE4(v47);
  v29 = -[MCMClientIdentity initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:](v43, "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:", v24, v49, v50, v26, v53, buf, v20, v46, v25, v47);
  v21 = v48;
LABEL_21:
  v30 = a5;
  if (!a5)
    goto LABEL_45;
LABEL_43:
  if (!v29)
    *v30 = objc_retainAutorelease(v21);
LABEL_45:
  v38 = v29;

  return v38;
}

- (id)_codeSignInfoWithClient:(container_client *)a3 CDHash:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t codesign_status;
  int pid;
  MCMError *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MCMEntitlements *v19;
  id v20;
  void *v21;
  MCMEntitlements *v22;
  NSObject *v23;
  NSObject *v24;
  MCMClientCodeSignInfo *v25;
  NSObject *v26;
  MCMClientCodeSignInfo *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v31 = 0u;
  v32 = 0u;
  container_client_get_audit_token();
  v29 = 0u;
  v30 = 0u;
  codesign_status = container_audit_token_get_codesign_status();
  pid = container_client_get_pid();
  if ((codesign_status & 1) == 0)
  {
    v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3, v29, v30);
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Client pid [%d] is not signed or has died.", (uint8_t *)&v29, 8u);
    }

LABEL_17:
    v22 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  v17 = (void *)container_client_copy_entitlement();
  if (!v17 || (v18 = (void *)_CFXPCCreateCFObjectFromXPCObject()) == 0)
  {
    if ((container_client_is_alive() & 1) == 0)
    {
      v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3, v29, v30);
      container_log_handle_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v29) = 67109120;
        DWORD1(v29) = pid;
        _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Client pid [%d] has died, failed to fetch entitlements.", (uint8_t *)&v29, 8u);
      }

      goto LABEL_17;
    }
    v18 = (void *)MEMORY[0x1E0C9AA70];
  }

  v19 = [MCMEntitlements alloc];
  v20 = containermanager_copy_global_configuration();
  objc_msgSend(v20, "classIterator", v29, v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MCMEntitlements initWithEntitlements:clientIdentifier:classIterator:](v19, "initWithEntitlements:clientIdentifier:classIterator:", v18, v11, v21);

  container_log_handle_for_category();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Could not initialize entitlements for pid [%d]", (uint8_t *)&v29, 8u);
    }

    v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 97, 3);
    v22 = 0;
LABEL_18:
    v25 = 0;
    if (!a7)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v29) = 138412290;
    *(_QWORD *)((char *)&v29 + 4) = v11;
    _os_log_debug_impl(&dword_1CF807000, v24, OS_LOG_TYPE_DEBUG, "Generating new codesign info blob for [%@]", (uint8_t *)&v29, 0xCu);
  }

  v25 = -[MCMClientCodeSignInfo initWithCDHash:entitlements:identifier:teamIdentifier:status:]([MCMClientCodeSignInfo alloc], "initWithCDHash:entitlements:identifier:teamIdentifier:status:", v10, v22, v11, v12, codesign_status);
  v15 = 0;
  if (a7)
  {
LABEL_19:
    if (!v25)
      *a7 = objc_retainAutorelease(v15);
  }
LABEL_21:
  v27 = v25;

  return v27;
}

uint64_t __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_codeSignInfoWithClient:CDHash:identifier:teamIdentifier:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

uint64_t __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientIdentityWithClient:proximateClient:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a2);
}

@end
