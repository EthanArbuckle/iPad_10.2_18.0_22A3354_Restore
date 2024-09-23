@implementation TKTokenSession

- (TKTokenSession)initWithToken:(TKToken *)token
{
  TKToken *v5;
  TKTokenSession *v6;
  TKTokenSession *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = token;
  v14.receiver = self;
  v14.super_class = (Class)TKTokenSession;
  v6 = -[TKTokenSession init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, token);
    if (-[TKTokenSession conformsToProtocol:](v7, "conformsToProtocol:", &unk_1EF237D58))
      objc_storeWeak((id *)&v7->_delegate, v7);
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[TKToken tokenID](v5, "tokenID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("session:%@"), v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

+ (id)_localizedString:(id)a3 value:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.CryptoTokenKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setLAContext:(id)a3
{
  objc_storeStrong((id *)&self->_LAContext, a3);
}

- (void)setCaller:(id)a3
{
  objc_storeStrong((id *)&self->_caller, a3);
}

- (void)getAttributesOfObject:(id)a3 isCertificate:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  TKTokenSession *v41;
  void (**v42)(id, void *, id);
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v6 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v12, "tokenSession:attributesOfObject:error:", self, v8, &v51);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v51;
    v15 = (void *)objc_msgSend(v13, "mutableCopy");

    if (v15)
    {
      if (v6)
        +[TKTokenID encodedCertificateID:](TKTokenID, "encodedCertificateID:", v8);
      else
        +[TKTokenID encodedKeyID:](TKTokenID, "encodedKeyID:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CD6BB8]);

      v37 = *MEMORY[0x1E0CD6890];
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = SecAccessControlCopyData();

          objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, v37);
          v38 = (void *)v39;
        }
      }

    }
    v9[2](v9, v15, v14);

  }
  else
  {
    v41 = self;
    v42 = v9;
    v16 = v8;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[TKTokenSession token](self, "token");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keychainItems");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v48 != v21)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v6)
              continue;
          }
          objc_msgSend(v23, "objectID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqual:", v16);

          if (v25)
          {
            objc_msgSend(v23, "keychainAttributes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v42;
            v42[2](v42, v35, 0);

            v8 = v16;
            goto LABEL_36;
          }
        }
        v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v20)
          continue;
        break;
      }
    }

    v8 = v16;
    if (!v6)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[TKTokenSession token](v41, "token");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "keychainItems");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v44;
        while (2)
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v14);
            v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v32, "objectID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqual:", v8);

              if (v34)
              {
                objc_msgSend(v32, "keychainAttributes");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v42;
                v42[2](v42, v40, 0);

                goto LABEL_36;
              }
            }
          }
          v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v29)
            continue;
          break;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -6, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v42;
    v42[2](v42, 0, v14);
  }
LABEL_36:

}

- (void)beginAuthForOperation:(int64_t)a3 constraint:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;

  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  -[TKTokenSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v12, "tokenSession:beginAuthForOperation:constraint:error:", self, a3, v8, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;

    v9[2](v9, v13, v14);
  }
  else
  {
    TK_LOG_token_4();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TKTokenSession beginAuthForOperation:constraint:reply:].cold.1(self, (uint64_t)v8, v15);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
  }

}

- (BOOL)checkOperation:(int64_t)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  BOOL v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "tokenSession:supportsOperation:usingKey:algorithm:parameters:", self, a3, v10, v11, v12);
  }
  else
  {
    -[TKTokenSession delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
    {
      v19 = 0;
      goto LABEL_7;
    }
    -[TKTokenSession delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "tokenSession:supportsOperation:usingKey:algorithm:", self, a3, v10, v11);
  }
  v19 = v16;

LABEL_7:
  return v19;
}

- (void)signData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v16, "tokenSession:signData:usingKey:algorithm:error:", self, v10, v11, v12, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    TK_LOG_token_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tokenID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1B9768000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement sign", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }

}

- (void)decryptData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, id);
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, id))a7;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v19, "tokenSession:decryptData:usingKey:algorithm:parameters:error:", self, v12, v13, v14, v15, &v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;
LABEL_5:
    v24 = v21;

    v16[2](v16, v20, v24);
    goto LABEL_9;
  }
  -[TKTokenSession delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v19, "tokenSession:decryptData:usingKey:algorithm:error:", self, v12, v13, v14, &v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v28;
    goto LABEL_5;
  }
  TK_LOG_token_4();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[TKTokenSession token](self, "token");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tokenID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v27;
    _os_log_impl(&dword_1B9768000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decrypt", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 0, v20);
LABEL_9:

}

- (void)performKeyExchangeWithPublicKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, id);
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, id))a7;
  -[TKTokenSession delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v19, "tokenSession:performKeyExchangeWithPublicKey:usingKey:algorithm:parameters:error:", self, v12, v13, v14, v15, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;

    v16[2](v16, v20, v21);
  }
  else
  {
    TK_LOG_token_4();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tokenID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1B9768000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key exchange", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v20);
  }

}

- (void)decapsulateSharedKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v16, "tokenSession:decapsulateSharedKey:usingKey:algorithm:error:", self, v10, v11, v12, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    TK_LOG_token_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tokenID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1B9768000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decapsulate", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }

}

- (void)attestKey:(id)a3 usingKey:(id)a4 nonce:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v16, "tokenSession:attestKey:usingKey:nonce:error:", self, v10, v11, v12, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    v13[2](v13, v17, v18);
  }
  else
  {
    TK_LOG_token_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tokenID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1B9768000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement attestation", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }

}

- (void)bumpKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t, id);
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v10, "tokenSession:bumpKey:error:", self, v6, &v17);
    v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    TK_LOG_token_4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tokenID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1B9768000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key bumping", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (id)v16);
    v12 = v7;
    v7 = (void (**)(id, uint64_t, id))v16;
  }

}

- (void)commitKey:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t, id);
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v10, "tokenSession:commitKey:error:", self, v6, &v17);
    v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    TK_LOG_token_4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tokenID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1B9768000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key committing", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (id)v16);
    v12 = v7;
    v7 = (void (**)(id, uint64_t, id))v16;
  }

}

- (void)createObjectWithAttributes:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "tokenSession:createObjectWithAttributes:error:", self, v6, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;

    v7[2](v7, v11, v12);
  }
  else
  {
    TK_LOG_token_4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[TKTokenSession token](self, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tokenID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1B9768000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }

}

- (void)deleteObject:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t, id);
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v10, "tokenSession:deleteObject:error:", self, v6, &v17);
    v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }
  else
  {
    TK_LOG_token_4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[TKTokenSession token](self, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tokenID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1B9768000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (id)v16);
    v12 = v7;
    v7 = (void (**)(id, uint64_t, id))v16;
  }

}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init((Class)objc_msgSend(v10, "baseClassForUI"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "importOperation:", v10);

    v23 = &unk_1E7097810;
    v24[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v13, "mutableCopy");

    -[TKTokenSession callerPID](self, "callerPID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[TKTokenSession callerPID](self, "callerPID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, &unk_1E7097828);

    }
    if (a4 == 1)
    {
      v16 = CFSTR("READ_DATA");
      v17 = CFSTR("read data");
    }
    else if (a4 == 2)
    {
      v16 = CFSTR("SIGN_DATA");
      v17 = CFSTR("sign data");
    }
    else
    {
      if ((unint64_t)(a4 - 3) > 1)
      {
LABEL_12:
        -[TKTokenSession LAContext](self, "LAContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke;
        v20[3] = &unk_1E708A4B0;
        v21 = v9;
        v22 = a2;
        v20[4] = self;
        objc_msgSend(v19, "evaluatePolicy:options:reply:", 1009, v10, v20);

        goto LABEL_13;
      }
      v16 = CFSTR("DECRYPT_DATA");
      v17 = CFSTR("decrypt data");
    }
    +[TKTokenSession _localizedString:value:](TKTokenSession, "_localizedString:value:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, &unk_1E7097840);

    goto LABEL_12;
  }
  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v10, 0);
LABEL_13:

}

void __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E7097858);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TKTokenSession.m"), 366, CFSTR("LAPolicyTokenAuthentication did not fill in LAResultTKAuthOperation"));

    }
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)finalizeAuthOperation:(id)a3 evaluatedAuthOperation:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  id v24;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "importOperation:", a4);
  v24 = 0;
  v10 = objc_msgSend(v8, "finishWithError:", &v24);
  v11 = v24;
  -[TKTokenSession caller](self, "caller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "auditToken");
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  -[TKTokenSession auditAuthOperation:auditToken:success:](self, "auditAuthOperation:auditToken:success:", v8, &v22, v10);

  if ((v10 & 1) != 0)
  {
    v9[2](v9, 1, 0);
  }
  else
  {
    if (!v11)
    {
      TK_LOG_token_4();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[TKTokenSession finalizeAuthOperation:evaluatedAuthOperation:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setAuthenticationError:", v11, v22, v23);
    ((void (**)(id, uint64_t, id))v9)[2](v9, 0, v11);
  }

}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 retry:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  BOOL v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke;
  v14[3] = &unk_1E708A500;
  v14[4] = self;
  v15 = v10;
  v18 = a5;
  v16 = v11;
  v17 = a4;
  v12 = v10;
  v13 = v11;
  -[TKTokenSession evaluateAuthOperation:tokenOperation:reply:](self, "evaluateAuthOperation:tokenOperation:reply:", v12, a4, v14);

}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2;
    v12[3] = &unk_1E708A4D8;
    v16 = *(_BYTE *)(a1 + 64);
    v12[4] = v6;
    v8 = v7;
    v10 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v13 = v8;
    v15 = v9;
    v14 = v10;
    objc_msgSend(v6, "finalizeAuthOperation:evaluatedAuthOperation:reply:", v8, a2, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (!*(_BYTE *)(a1 + 64) || (a2 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", CFSTR("CryptoTokenKit")) & 1) != 0)
  {
    v7 = objc_msgSend(v12, "code");

    if (v7 == -5)
    {
      objc_msgSend(v12, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("userSecretTriesLeft"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "integerValue");

        if (v10 < 1)
          goto LABEL_9;
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 32), "evaluateAuthOperation:tokenOperation:retry:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
      goto LABEL_10;
    }
  }
  else
  {

  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:

}

- (void)evaluateAccessControl:(id)a3 forOperation:(id)a4 reply:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  void (**v28)(id, uint64_t, _QWORD);
  uint64_t v29;
  id v30;

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v30 = 0;
  v9 = a4;
  v10 = a3;
  +[TKTokenKeychainItem operationMap](TKTokenKeychainItem, "operationMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  v14 = (void *)SecAccessControlCreateFromData();
  SecAccessControlGetConstraint();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && !objc_msgSend(v15, "isEqual:", MEMORY[0x1E0C9AAA0]))
  {
    if (objc_msgSend(v15, "isEqual:", MEMORY[0x1E0C9AAB0]))
    {
      v8[2](v8, 1, 0);
      goto LABEL_4;
    }
    -[TKTokenSession LAContext](self, "LAContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[TKTokenSession queue](self, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_suspend(v18);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke;
      v27[3] = &unk_1E708A528;
      v27[4] = self;
      v28 = v8;
      v29 = v13;
      -[TKTokenSession beginAuthForOperation:constraint:reply:](self, "beginAuthForOperation:constraint:reply:", v13, v15, v27);

      goto LABEL_4;
    }
    TK_LOG_token_4();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[TKTokenSession evaluateAccessControl:forOperation:reply:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v16);

LABEL_4:
}

void __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "LAContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCredentialSet:", -3) ^ 1;

    objc_msgSend(*(id *)(a1 + 32), "evaluateAuthOperation:tokenOperation:retry:reply:", v9, *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)errorWithResult:(id)a3 operation:(id)a4 forError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!a3)
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("CryptoTokenKit")) || objc_msgSend(v9, "code") != -9)
      goto LABEL_6;
    objc_msgSend(v9, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("operation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v9, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("operation"));
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -9, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
LABEL_6:

    }
  }

  return v9;
}

- (void)objectID:(id)a3 operation:(int64_t)a4 inputData:(id)a5 algorithms:(id)a6 parameters:(id)a7 reply:(id)a8
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD);
  id v19;
  TKTokenKeyAlgorithm *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  TKTokenKeyExchangeParameters *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  _QWORD v33[5];
  void (**v34)(id, void *, _QWORD);
  _QWORD v35[5];
  void (**v36)(id, void *, _QWORD);
  _QWORD v37[5];
  void (**v38)(id, void *, _QWORD);
  id v39;
  _QWORD v40[5];
  void (**v41)(id, void *, _QWORD);
  _QWORD v42[5];
  void (**v43)(id, void *, _QWORD);
  _QWORD v44[5];
  void (**v45)(id, void *, _QWORD);
  _QWORD v46[5];
  void (**v47)(id, void *, _QWORD);

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, void *, _QWORD))a8;
  v19 = a6;
  v20 = -[TKTokenKeyAlgorithm initWithAlgorithmsArray:]([TKTokenKeyAlgorithm alloc], "initWithAlgorithmsArray:", v19);

  if (!-[TKTokenSession checkOperation:usingKey:algorithm:parameters:](self, "checkOperation:usingKey:algorithm:parameters:", a4, v15, v20, v17))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v26, 0);

    goto LABEL_23;
  }
  if (!v16)
  {
    v18[2](v18, (void *)MEMORY[0x1E0C9AAB0], 0);
    goto LABEL_23;
  }
  if (a4 > 999)
  {
    switch(a4)
    {
      case 1000:
        -[TKTokenSession token](self, "token");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "tokenID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v22, "decodedKeyID:error:", v16, &v39);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v39;

        if (v23)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("nonce"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5;
          v37[3] = &unk_1E708A550;
          v37[4] = self;
          v38 = v18;
          -[TKTokenSession attestKey:usingKey:nonce:reply:](self, "attestKey:usingKey:nonce:reply:", v23, v15, v25, v37);

        }
        else
        {
          ((void (**)(id, void *, id))v18)[2](v18, 0, v24);
        }

        goto LABEL_22;
      case 1001:
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6;
        v35[3] = &unk_1E708A578;
        v35[4] = self;
        v36 = v18;
        -[TKTokenSession bumpKey:reply:](self, "bumpKey:reply:", v15, v35);
        v28 = v36;
        goto LABEL_18;
      case 1002:
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7;
        v33[3] = &unk_1E708A578;
        v33[4] = self;
        v34 = v18;
        -[TKTokenSession commitKey:reply:](self, "commitKey:reply:", v15, v33);
        v28 = v34;
        goto LABEL_18;
      case 1003:
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4;
        v40[3] = &unk_1E708A550;
        v40[4] = self;
        v41 = v18;
        -[TKTokenSession decapsulateSharedKey:usingKey:algorithm:reply:](self, "decapsulateSharedKey:usingKey:algorithm:reply:", v16, v15, v20, v40);
        v28 = v41;
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
  switch(a4)
  {
    case 2:
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke;
      v46[3] = &unk_1E708A550;
      v46[4] = self;
      v47 = v18;
      -[TKTokenSession signData:usingKey:algorithm:reply:](self, "signData:usingKey:algorithm:reply:", v16, v15, v20, v46);
      v28 = v47;
LABEL_18:

      break;
    case 3:
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2;
      v44[3] = &unk_1E708A550;
      v44[4] = self;
      v45 = v18;
      -[TKTokenSession decryptData:usingKey:algorithm:parameters:reply:](self, "decryptData:usingKey:algorithm:parameters:reply:", v16, v15, v20, v17, v44);
      v28 = v45;
      goto LABEL_18;
    case 4:
      v27 = -[TKTokenKeyExchangeParameters initWithParameters:]([TKTokenKeyExchangeParameters alloc], "initWithParameters:", v17);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3;
      v42[3] = &unk_1E708A550;
      v42[4] = self;
      v43 = v18;
      -[TKTokenSession performKeyExchangeWithPublicKey:usingKey:algorithm:parameters:reply:](self, "performKeyExchangeWithPublicKey:usingKey:algorithm:parameters:reply:", v16, v15, v20, v27, v42);

      break;
    default:
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTokenSession token](self, "token");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tokenID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = a4;
      v24 = v32;
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenSession.m"), 534, CFSTR("invalid objectOperation %d on token %@"), v31, v30);

LABEL_22:
      break;
  }
LABEL_23:

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorWithResult:operation:forError:", v6, CFSTR("osgn"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorWithResult:operation:forError:", v6, CFSTR("od"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorWithResult:operation:forError:", v6, CFSTR("ock"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorWithResult:operation:forError:", v6, CFSTR("okd"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorWithResult:operation:forError:", v6, CFSTR("oa"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "errorWithResult:operation:forError:", v5, CFSTR("oko"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "errorWithResult:operation:forError:", v5, CFSTR("oko"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

}

- (void)getAdvertisedItemsWithReply:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TKTokenSession token](self, "token", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keychainItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "keychainAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v4[2](v4, v5);
}

- (void)terminate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[TKTokenSession token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TKTokenSession token](self, "token");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenSession token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token:terminateSession:", v7, self);

  }
}

- (NSString)name
{
  return 0;
}

- (TKToken)token
{
  return (TKToken *)objc_getProperty(self, a2, 8, 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
  objc_storeStrong(&self->_keepAlive, a3);
}

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)creatorAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setCreatorAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_creatorAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_creatorAuditToken.val = v3;
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (NSNumber)callerPID
{
  return self->_callerPID;
}

- (void)setCallerPID:(id)a3
{
  objc_storeStrong((id *)&self->_callerPID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerPID, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_token, 0);
}

- (void)beginAuthForOperation:(void *)a1 constraint:(uint64_t)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "%{public}@: does not support auth, failing constraint '%{public}@'", (uint8_t *)&v7, 0x16u);

}

- (void)finalizeAuthOperation:(uint64_t)a3 evaluatedAuthOperation:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B9768000, a1, a3, "finishWithError: failed but did not fill an error", a5, a6, a7, a8, 0);
}

- (void)evaluateAccessControl:(uint64_t)a3 forOperation:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B9768000, a1, a3, "Failing attempt to evaluate ACC without LAContext set", a5, a6, a7, a8, 0);
}

@end
