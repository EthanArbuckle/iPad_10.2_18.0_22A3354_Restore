@implementation _LAKeyStoreKey

+ (id)buildWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  uint64_t v22;
  void *v23;
  __SecKey *v24;
  SecKeyRef v25;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = a3;
  v6 = *MEMORY[0x1E0CD6A90];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v5, "objectForKeyedSubscript:", v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v10 = objc_opt_isKindOfClass(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CD6890];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[LASecAccessControl serializeACL:](LASecAccessControl, "serializeACL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *MEMORY[0x1E0CD6900];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6900]);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17
        && (v18 = (void *)v17,
            objc_msgSend(v5, "objectForKeyedSubscript:", v16),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v19,
            v18,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x1E0CD70E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E8]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v22);
          v24 = (__SecKey *)objc_claimAutoreleasedReturnValue();
          v25 = SecKeyCopyPublicKey(v24);
          if (v25)
          {
            v26 = -[_LAKeyStoreKey initWithIdentifier:acl:publicKeyHash:keyRef:pubKeyRef:]((id *)[_LAKeyStoreKey alloc], v11, v15, v21, v24, v25);
          }
          else
          {
            +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing public key"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = 0;
            if (a4 && v31)
            {
              +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing public key"));
              v26 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        else
        {
          +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'kref'"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = 0;
          if (a4 && v30)
          {
            +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'kref'"));
            v26 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      else
      {
        +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'klbl'"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        if (a4 && v28)
        {
          +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'klbl'"));
          v26 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'accc'"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      if (a4 && v29)
      {
        +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'accc'"));
        v26 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'labl'"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    if (a4 && v27)
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build key due to missing 'labl'"));
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v26;
}

- (id)initWithIdentifier:(void *)a3 acl:(void *)a4 publicKeyHash:(void *)a5 keyRef:(void *)a6 pubKeyRef:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id v18;
  objc_super v19;

  v18 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)_LAKeyStoreKey;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)acl
{
  return self->_acl;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)exportBytesWithCompletion:(id)a3
{
  id v4;
  LAContext *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v12 = 0;
  v5 = objc_alloc_init(LAContext);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke;
  v10[3] = &unk_1E7079AB0;
  v10[4] = v11;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E7079AD8;
  v6 = v4;
  v8 = v6;
  v9 = v11;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v5, v10, v7);

  _Block_object_dispose(v11, 8);
}

- (void)_performOperationWithContext:(void *)a3 operation:(void *)a4 completion:
{
  id v7;
  void (**v8)(id, id, id, _QWORD *);
  id v9;
  id v10;
  id v11;
  char v12;
  LAContext *v13;
  void *v14;
  LAContext *v15;
  const __CFString *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v21 = 0;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    if (v7)
    {
      v20 = 0;
      v12 = objc_msgSend(v7, "checkContextValidWithError:", &v20);
      v21 = v20;
      if ((v12 & 1) != 0)
      {
        v13 = [LAContext alloc];
        objc_msgSend(v7, "externalizedContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[LAContext initWithExternalizedContext:](v13, "initWithExternalizedContext:", v14);

        -[LAContext setInteractionNotAllowed:](v15, "setInteractionNotAllowed:", 1);
        if (SecKeySetParameter())
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __68___LAKeyStoreKey__performOperationWithContext_operation_completion___block_invoke;
          v17[3] = &unk_1E7079998;
          v18 = v10;
          v19 = v9;
          v8[2](v8, v18, v11, v17);

        }
        else
        {
          (*((void (**)(id, id))v9 + 2))(v9, v21);
        }
        goto LABEL_9;
      }
      v16 = CFSTR("Cannot perform operation with invalid context");
    }
    else
    {
      v16 = CFSTR("Cannot perform operation with nil context");
    }
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v16);
    v15 = (LAContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, LAContext *))v9 + 2))(v9, v15);
LABEL_9:

  }
}

- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  __CFString *v22;
  _QWORD v23[5];
  id v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1;
  v23[4] = __Block_byref_object_dispose__1;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke;
  v19[3] = &unk_1E7079B00;
  v21 = v23;
  v22 = a4;
  v14 = v10;
  v20 = v14;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke_2;
  v16[3] = &unk_1E7079AD8;
  v15 = v12;
  v17 = v15;
  v18 = v23;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v11, v19, v16);

  _Block_object_dispose(v23, 8);
}

- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeSign, a3) != 0;
}

- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  __CFString *v22;
  _QWORD v23[5];
  id v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1;
  v23[4] = __Block_byref_object_dispose__1;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke;
  v19[3] = &unk_1E7079B00;
  v21 = v23;
  v22 = a4;
  v14 = v10;
  v20 = v14;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke_2;
  v16[3] = &unk_1E7079AD8;
  v15 = v12;
  v17 = v15;
  v18 = v23;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v11, v19, v16);

  _Block_object_dispose(v23, 8);
}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeDecrypt, a3) != 0;
}

- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  __CFString *v27;
  _QWORD v28[5];
  id v29;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__1;
  v28[4] = __Block_byref_object_dispose__1;
  v29 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke;
  v23[3] = &unk_1E7079B28;
  v17 = v12;
  v24 = v17;
  v26 = v28;
  v27 = a4;
  v18 = v13;
  v25 = v18;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke_2;
  v20[3] = &unk_1E7079AD8;
  v19 = v15;
  v21 = v19;
  v22 = v28;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v14, v23, v20);

  _Block_object_dispose(v28, 8);
}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_keyRef, kSecKeyOperationTypeKeyExchange, a3) != 0;
}

- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5
{
  id v8;
  id v9;
  LAContext *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  __CFString *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v22 = 0;
  v10 = objc_alloc_init(LAContext);
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke;
  v17[3] = &unk_1E7079B00;
  v19 = v21;
  v20 = a4;
  v12 = v8;
  v18 = v12;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke_2;
  v14[3] = &unk_1E7079AD8;
  v13 = v9;
  v15 = v13;
  v16 = v21;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v10, v17, v14);

  _Block_object_dispose(v21, 8);
}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_pubKeyRef, kSecKeyOperationTypeEncrypt, a3) != 0;
}

- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  LAContext *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __CFString *v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(LAContext);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66___LAKeyStoreKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke;
  v16[3] = &unk_1E7079B50;
  v18 = v11;
  v19 = a5;
  v17 = v10;
  v14 = v11;
  v15 = v10;
  -[_LAKeyStoreKey _performOperationWithContext:operation:completion:]((uint64_t)self, v13, v16, v12);

}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3
{
  return SecKeyIsAlgorithmSupported((SecKeyRef)self->_pubKeyRef, kSecKeyOperationTypeVerify, a3) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pubKeyRef, 0);
  objc_storeStrong(&self->_keyRef, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
