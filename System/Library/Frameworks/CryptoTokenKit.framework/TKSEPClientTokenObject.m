@implementation TKSEPClientTokenObject

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  os_activity_scope_state_s state;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = _os_activity_create(&dword_1B9768000, "SEPClientObject: operation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  TK_LOG_client();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:].cold.2(a3, v17, (uint64_t)v30, v16);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke;
  v24[3] = &unk_1E7089C88;
  v24[4] = self;
  v28 = a3;
  v18 = v13;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v20 = v14;
  v27 = v20;
  -[TKSEPClientTokenObject withError:invoke:](self, "withError:invoke:", a7, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    TK_LOG_client();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:].cold.1(a3, (const __CFString **)a7, v22);

  }
  os_activity_scope_leave(&state);

  return v21;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  void (**v6)(id, id *);
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __SecAccessControl *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  char v32;
  id v33;

  v6 = (void (**)(id, id *))a4;
  v33 = 0;
  v6[2](v6, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  if (v7)
  {
    v9 = 0;
  }
  else
  {
    v32 = 0;
    v9 = 0;
    v10 = 17;
    while (1)
    {
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("CryptoTokenKit"))
        || objc_msgSend(v8, "code") != -9)
      {

LABEL_17:
        if (a3)
        {
          v28 = objc_retainAutorelease(v8);
          *a3 = v28;

          goto LABEL_23;
        }
LABEL_24:
        v7 = 0;
        goto LABEL_34;
      }
      -[TKClientTokenObject session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "authenticateWhenNeeded");

      if ((v13 & 1) == 0)
        goto LABEL_17;
      if (!--v10)
      {
        TK_LOG_client();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[TKSEPClientTokenObject withError:invoke:].cold.1(self, (uint64_t)v9, v29);

        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
          v7 = 0;
LABEL_30:
          if ((v32 & 1) == 0)
            goto LABEL_37;
          goto LABEL_35;
        }
        goto LABEL_24;
      }
      objc_msgSend(v8, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("operation"));
      v15 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      -[TKSEPClientTokenObject key](self, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "authContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
        -[TKSEPClientTokenObject key](self, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAuthContext:", v18);

        v32 = 1;
      }
      -[TKClientTokenObject session](self, "session");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_testing_AuthContextUsed");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[TKSEPClientTokenObject key](self, "key");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "authContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKClientTokenObject session](self, "session");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "set_testing_AuthContextUsed:", v23);

      }
      -[TKSEPClientTokenObject key](self, "key");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "authContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[TKClientTokenObject accessControlRef](self, "accessControlRef");
      objc_msgSend(v26, "evaluateAccessControl:aksOperation:options:error:", v27, v15, MEMORY[0x1E0C9AA70], a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_29;
      v33 = 0;
      v6[2](v6, &v33);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v33;
      v9 = (void *)v15;
      if (v7)
        goto LABEL_33;
    }
    TK_LOG_client();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[TKSEPClientTokenObject withError:invoke:].cold.2((uint64_t)v8, v30);

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v7 = 0;
LABEL_29:
      v9 = (void *)v15;
      goto LABEL_30;
    }
    v7 = 0;
LABEL_33:
    v9 = (void *)v15;
LABEL_34:

    if ((v32 & 1) == 0)
      goto LABEL_37;
LABEL_35:
    -[TKSEPClientTokenObject key](self, "key");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAuthContext:", 0);
  }

LABEL_37:
  return v7;
}

id __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString **v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  TKSEPKey *v16;
  void *v17;
  void *v18;
  void *v19;
  TKSEPKey *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  char v37;
  void *v38;
  char isKindOfClass;
  void *v40;
  int v41;
  void *v42;
  char v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "_testing_ForceAuthenticationNeeded");

  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set_testing_ForceAuthenticationNeeded:", 0);

    if (!a2)
      return 0;
    v7 = 0;
    v8 = *(_QWORD *)(a1 + 64);
    if (v8 <= 3)
    {
      if (v8 == 2)
      {
        v52 = CFSTR("operation");
        v53[0] = CFSTR("osgn");
        v9 = (void *)MEMORY[0x1E0C99D80];
        v10 = (const __CFString **)v53;
        v11 = &v52;
        goto LABEL_49;
      }
      if (v8 == 3)
      {
        v48 = CFSTR("operation");
        v49 = CFSTR("oecd");
        v9 = (void *)MEMORY[0x1E0C99D80];
        v10 = &v49;
        v11 = &v48;
        goto LABEL_49;
      }
    }
    else
    {
      switch(v8)
      {
        case 4:
          v50 = CFSTR("operation");
          v51 = CFSTR("ock");
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v51;
          v11 = &v50;
          goto LABEL_49;
        case 1000:
          v44 = CFSTR("operation");
          v45 = CFSTR("oa");
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v45;
          v11 = &v44;
          goto LABEL_49;
        case 1003:
          v46 = CFSTR("operation");
          v47 = CFSTR("okd");
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v47;
          v11 = &v46;
LABEL_49:
          objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          break;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -9, v7);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12 > 999)
  {
    switch(v12)
    {
      case 1000:
        if (!*(_QWORD *)(a1 + 48))
          return MEMORY[0x1E0C9AAB0];
        objc_msgSend(*(id *)(a1 + 32), "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tokenID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "decodedKeyID:error:", *(_QWORD *)(a1 + 48), a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = [TKSEPKey alloc];
          objc_msgSend(*(id *)(a1 + 32), "session");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "LAContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("attesteeSystemSession"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:](v16, "initWithObjectID:authContext:forceSystemSession:error:", v15, v18, objc_msgSend(v19, "BOOLValue"), a2);

          if (v20)
          {
            objc_msgSend(*(id *)(a1 + 32), "key");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("nonce"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "attestKey:nonce:error:", v20, v22, a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }
        goto LABEL_56;
      case 1001:
        v23 = (void *)MEMORY[0x1E0C9AAB0];
        if (!*(_QWORD *)(a1 + 48))
          return v23;
        objc_msgSend(*(id *)(a1 + 32), "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 0;
        goto LABEL_35;
      case 1002:
        v23 = (void *)MEMORY[0x1E0C9AAB0];
        if (!*(_QWORD *)(a1 + 48))
          return v23;
        objc_msgSend(*(id *)(a1 + 32), "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 1;
LABEL_35:
        if (objc_msgSend(v25, "lifetimeControlWithType:error:", v27, a2))
          v33 = v23;
        else
          v33 = 0;
        v34 = v33;

        return v34;
      case 1003:
        objc_msgSend(*(id *)(a1 + 40), "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CD6E30]);

        if (!v29)
          goto LABEL_61;
        if (!*(_QWORD *)(a1 + 48))
          return MEMORY[0x1E0C9AAB0];
        objc_msgSend(*(id *)(a1 + 32), "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decapsulateKey:error:", *(_QWORD *)(a1 + 48), a2);
        v30 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_61;
    }
    goto LABEL_55;
  }
  switch(v12)
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CD6D98]) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0CD6E20]))
        {
          objc_msgSend(*(id *)(a1 + 40), "lastObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isEqualToString:", *MEMORY[0x1E0CD6E28]);

          if ((v43 & 1) == 0)
            break;
LABEL_31:
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(*(id *)(a1 + 32), "key");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "signDigest:error:", *(_QWORD *)(a1 + 48), a2);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_55;
          }
          return MEMORY[0x1E0C9AAB0];
        }

      }
      goto LABEL_31;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CD6E18]);
      if ((v37 & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "lastObject"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD6E10]) & 1) != 0))
      {
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CD6ED8]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((v37 & 1) == 0)
        if ((isKindOfClass & 1) != 0)
        {
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(*(id *)(a1 + 32), "key");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "recryptData:attributes:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_55;
          }
          return MEMORY[0x1E0C9AAB0];
        }
      }
      else
      {

      }
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CD6D78]))
      {

        goto LABEL_53;
      }
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0CD6D70]);

      if (v41)
      {
LABEL_53:
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "computeSharedSecret:error:", *(_QWORD *)(a1 + 48), a2);
          v30 = objc_claimAutoreleasedReturnValue();
LABEL_55:
          v23 = (void *)v30;
LABEL_56:

          return v23;
        }
        return MEMORY[0x1E0C9AAB0];
      }
      break;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  return v23;
}

- (TKSEPKey)key
{
  return self->_key;
}

- (TKSEPClientTokenObject)initWithSession:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TKSEPClientTokenObject *v16;
  TKSEPClientTokenObject *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "publicKeyWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("pubk"));
    objc_msgSend(v9, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TKTokenID encodedKeyID:](TKTokenID, "encodedKeyID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "copy");
    v19.receiver = self;
    v19.super_class = (Class)TKSEPClientTokenObject;
    v16 = -[TKClientTokenObject initWithSession:objectID:attributes:](&v19, sel_initWithSession_objectID_attributes_, v8, v14, v15);

    if (v16)
      objc_storeStrong((id *)&v16->_key, a4);
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)deleteWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_1B9768000, "SEPClientObject: deleteKey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__TKSEPClientTokenObject_deleteWithError___block_invoke;
  v8[3] = &unk_1E7089C60;
  v8[4] = self;
  -[TKSEPClientTokenObject withError:invoke:](self, "withError:invoke:", a3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "BOOLValue");

  os_activity_scope_leave(&state);
  return (char)a3;
}

id __42__TKSEPClientTokenObject_deleteWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deleteWithError:", a2))
    v4 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)withError:(NSObject *)a3 invoke:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v8;
  v12 = 2114;
  v13 = v9;
  v14 = 2114;
  v15 = a2;
  _os_log_fault_impl(&dword_1B9768000, a3, OS_LOG_TYPE_FAULT, "authentication failed repeatedly: tkid=%{public}@, ac=%{public}@, op=%{public}@", (uint8_t *)&v10, 0x20u);

}

- (void)withError:(uint64_t)a1 invoke:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B9768000, a2, OS_LOG_TYPE_FAULT, "TKErrorCodeAuthenticationNeeded does not have operation set: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)operation:(NSObject *)a3 data:algorithms:parameters:error:.cold.1(int a1, const __CFString **a2, NSObject *a3)
{
  const __CFString *v3;
  _DWORD v4[2];
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = *a2;
  else
    v3 = &stru_1E708AD68;
  v4[0] = 67109378;
  v4[1] = a1;
  v5 = 2114;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1B9768000, a3, (uint64_t)a3, "operation:%d failed, error: %{public}@", (uint8_t *)v4);
}

- (void)operation:(uint64_t)a3 data:(NSObject *)a4 algorithms:parameters:error:.cold.2(int a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 67109378;
  *(_DWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 8) = 2114;
  *(_QWORD *)(a3 + 10) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B9768000, a4, a3, "operation:%d algo:%{public}@", (uint8_t *)a3);

}

@end
