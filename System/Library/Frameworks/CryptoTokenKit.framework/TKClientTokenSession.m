@implementation TKClientTokenSession

- (BOOL)_testing_ForceAuthenticationNeeded
{
  return self->__testing_ForceAuthenticationNeeded;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (id)_initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  TKClientTokenSession *v14;
  id *p_isa;
  id *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TKClientTokenSession;
  v14 = -[TKClientTokenSession init](&v18, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (v14->_authenticateWhenNeeded = 1,
        objc_storeStrong((id *)&v14->_token, a3),
        objc_storeStrong(p_isa + 2, a4),
        objc_storeStrong(p_isa + 3, a5),
        !objc_msgSend(p_isa, "isValidWithError:", a6)))
  {
    v16 = 0;
  }
  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (TKClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  char isKindOfClass;
  __objc2_class **v14;
  TKClientTokenSession *v15;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = off_1E7088288;
  if ((isKindOfClass & 1) == 0)
    v14 = off_1E7088278;
  v15 = (TKClientTokenSession *)objc_msgSend(objc_alloc(*v14), "initWithToken:LAContext:parameters:error:", v10, v12, v11, a6);

  return v15;
}

- (TKClientTokenSession)initWithTokenID:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TKClientToken *v10;
  TKClientTokenSession *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[TKClientToken initWithTokenID:]([TKClientToken alloc], "initWithTokenID:", v9);

  v11 = -[TKClientTokenSession initWithToken:LAContext:parameters:error:](self, "initWithToken:LAContext:parameters:error:", v10, v8, MEMORY[0x1E0C9AA70], a5);
  return v11;
}

- (BOOL)deleteObject:(id)a3 error:(id *)a4
{
  void *v5;

  -[TKClientTokenSession objectForObjectID:error:](self, "objectForObjectID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "deleteWithError:", a4);

  return (char)a4;
}

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, MEMORY[0x1E0C9AA70]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("override should be called"));
  return 0;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, MEMORY[0x1E0C9AA70]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)processObjectCreationAttributes:(id)a3 authContext:(id *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id *v27;

  v8 = a3;
  v27 = a5;
  v9 = *MEMORY[0x1E0CD6890];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_26:
    v8 = v8;
    v21 = v8;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = SecAccessControlCreateFromData();
    if (!v11)
    {
      TK_LOG_client_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[TKClientTokenSession processObjectCreationAttributes:authContext:error:].cold.1();
      goto LABEL_13;
    }
    v12 = (void *)v11;

    v10 = v12;
  }
  if ((SecAccessControlIsBound() & 1) != 0)
  {
    -[TKClientTokenSession _testing_AuthContextUsed](self, "_testing_AuthContextUsed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_24;
    -[TKClientTokenSession LAContext](self, "LAContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[TKClientTokenSession set_testing_AuthContextUsed:](self, "set_testing_AuthContextUsed:", v14);
    }
    else
    {
      v22 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      -[TKClientTokenSession set_testing_AuthContextUsed:](self, "set_testing_AuthContextUsed:", v22);

    }
LABEL_23:

LABEL_24:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = SecAccessControlCopyData();

      v24 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v9);
      v25 = objc_msgSend(v24, "copy");

      v10 = (void *)v23;
      v8 = (id)v25;
    }
    goto LABEL_26;
  }
  -[TKClientTokenSession LAContext](self, "LAContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    *a4 = objc_retainAutorelease(v15);
  }
  else
  {
    v18 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0CC12A0]));
    *a4 = v18;

  }
  -[TKClientTokenSession _testing_AuthContextUsed](self, "_testing_AuthContextUsed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    -[TKClientTokenSession set_testing_AuthContextUsed:](self, "set_testing_AuthContextUsed:", *a4);
  objc_msgSend(*a4, "evaluateAccessControl:aksOperation:options:error:", v10, &stru_1E708AD68, MEMORY[0x1E0C9AA70], v27);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v14 = (void *)v20;
    SecAccessControlSetBound();
    goto LABEL_23;
  }
  if (v27 && !*v27)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CC1280], -1000, 0);
    *v27 = (id)objc_claimAutoreleasedReturnValue();
    TK_LOG_client_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TKClientTokenSession processObjectCreationAttributes:authContext:error:].cold.2((uint64_t **)&v27, v17);
LABEL_13:

  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (void)setLAContext:(id)a3
{
  objc_storeStrong((id *)&self->_LAContext, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (TKClientToken)token
{
  return self->_token;
}

- (BOOL)authenticateWhenNeeded
{
  return self->_authenticateWhenNeeded;
}

- (void)setAuthenticateWhenNeeded:(BOOL)a3
{
  self->_authenticateWhenNeeded = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSString)slotName
{
  return self->_slotName;
}

- (BOOL)_testing_AuthenticateInternally
{
  return self->__testing_AuthenticateInternally;
}

- (void)set_testing_AuthenticateInternally:(BOOL)a3
{
  self->__testing_AuthenticateInternally = a3;
}

- (void)set_testing_ForceAuthenticationNeeded:(BOOL)a3
{
  self->__testing_ForceAuthenticationNeeded = a3;
}

- (id)_testing_AuthContextUsed
{
  return self->__testing_AuthContextUsed;
}

- (void)set_testing_AuthContextUsed:(id)a3
{
  objc_storeStrong(&self->__testing_AuthContextUsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__testing_AuthContextUsed, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
}

- (void)processObjectCreationAttributes:authContext:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  _os_log_fault_impl(&dword_1B9768000, v0, OS_LOG_TYPE_FAULT, "Unable to deserialize AC %{public}@, error: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)processObjectCreationAttributes:(uint64_t *)a1 authContext:(NSObject *)a2 error:.cold.2(uint64_t **a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = **a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "-[LAContext evaluateAccessControl:] failed but did not provide an error, syntesizing: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
