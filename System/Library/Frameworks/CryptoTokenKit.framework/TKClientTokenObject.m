@implementation TKClientTokenObject

- (TKClientTokenSession)session
{
  return self->_session;
}

- (__SecAccessControl)accessControlRef
{
  void *v3;
  void *v4;
  void *v5;
  id accessControlRef;
  NSObject *v7;
  id v9;

  if (!self->_accessControlRef)
  {
    -[TKClientTokenObject accessControl](self, "accessControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v9 = 0;
      -[TKClientTokenObject accessControl](self, "accessControl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)SecAccessControlCreateFromData();
      accessControlRef = self->_accessControlRef;
      self->_accessControlRef = v5;

      if (!self->_accessControlRef)
      {
        TK_LOG_client_0();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[TKClientTokenObject accessControlRef].cold.1((uint64_t *)&v9, self, v7);

      }
    }
  }
  return (__SecAccessControl *)self->_accessControlRef;
}

- (TKClientTokenObject)initWithSession:(id)a3 objectID:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  TKClientTokenObject *v12;
  TKClientTokenObject *v13;
  uint64_t v14;
  NSData *publicKey;
  uint64_t v16;
  NSData *accessControl;
  uint64_t v18;
  NSData *value;
  NSDictionary *v20;
  NSDictionary *keychainAttributes;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TKClientTokenObject;
  v12 = -[TKClientTokenObject init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_objectID, a4);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("pubk"));
    v14 = objc_claimAutoreleasedReturnValue();
    publicKey = v13->_publicKey;
    v13->_publicKey = (NSData *)v14;

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
    v16 = objc_claimAutoreleasedReturnValue();
    accessControl = v13->_accessControl;
    v13->_accessControl = (NSData *)v16;

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v18 = objc_claimAutoreleasedReturnValue();
    value = v13->_value;
    v13->_value = (NSData *)v18;

    v20 = (NSDictionary *)objc_msgSend(v11, "mutableCopy");
    -[NSDictionary removeObjectForKey:](v20, "removeObjectForKey:", CFSTR("pubk"));
    keychainAttributes = v13->_keychainAttributes;
    v13->_keychainAttributes = v20;

  }
  return v13;
}

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, MEMORY[0x1E0C9AA70], a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)operationResult:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;

  v7 = a3;
  if (objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = v8;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (!v10)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKClientToken.m"), 275, CFSTR("Unexpected result: %@"), v7);

      }
    }
    v8 = v7;
    goto LABEL_10;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)sign:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;

  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 2, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decrypt:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;

  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 3, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)exchangeKey:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;

  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 4, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decapsulate:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;

  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 1003, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    v15 = CFSTR("nonce");
    v16[0] = a4;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = a4;
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 1000, v8, MEMORY[0x1E0C9AA60], v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)attestKeyObject:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21 = CFSTR("attesteeSystemSession");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("forceSystemSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v9)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("nonce"));
  objc_msgSend(v8, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 1000, v17, MEMORY[0x1E0C9AA60], v16, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)bumpKeyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 1001, v5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v7 != 0;

  return (char)a3;
}

- (BOOL)commitKeyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operation:data:algorithms:parameters:error:](self, "operation:data:algorithms:parameters:error:", 1002, v5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v7 != 0;

  return (char)a3;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, MEMORY[0x1E0C9AA70]);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSData)objectID
{
  return self->_objectID;
}

- (NSData)accessControl
{
  return self->_accessControl;
}

- (NSData)value
{
  return self->_value;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAttributes, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_accessControlRef, 0);
}

- (void)accessControlRef
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "accessControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "Failed to create AC from data: %{public}@ (AC data: %{public}@)", (uint8_t *)&v6, 0x16u);

}

@end
